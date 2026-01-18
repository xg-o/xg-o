name: Update GitHub Stats Cache

on:
  schedule:
    - cron: "0 */6 * * *"  # 每6小时运行一次
  workflow_dispatch:

jobs:
  update-stats:
    runs-on: ubuntu-latest
    steps:
      - name: Update Stats Cache
        run: |
          echo "🔄 更新GitHub统计缓存..."
          
          # 更新各种统计服务的缓存
          curl -s "https://github-readme-stats.vercel.app/api?username=xg-o&cache_seconds=$(date +%s)" > /dev/null
          curl -s "https://github-readme-stats.vercel.app/api/top-langs/?username=xg-o&cache_seconds=$(date +%s)" > /dev/null
          curl -s "https://github-readme-activity-graph.vercel.app/graph?username=xg-o&cache_seconds=$(date +%s)" > /dev/null
          curl -s "https://github-profile-trophy.vercel.app/?username=xg-o&cache_seconds=$(date +%s)" > /dev/null
          curl -s "https://streak-stats.demolab.com/?user=xg-o&cache_seconds=$(date +%s)" > /dev/null
          
          echo "✅ 缓存更新完成！"
