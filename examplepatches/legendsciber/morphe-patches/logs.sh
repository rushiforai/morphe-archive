#!/data/data/com.termux/files/usr/bin/bash
# Workflow durumunu ve basarisiz adim loglarini DOSYAYA kaydeder.
# Kullanim:
#   bash logs.sh              -> en son run'in durumu + hata logu -> ~/log.txt
#   bash logs.sh <run-id>     -> belirli bir run'in hata logu -> ~/log.txt
set -e

REPO="legendsciber/morphe-patches"
OUT="$HOME/log.txt"
RUN_ID="${1:-}"

command -v gh >/dev/null || { echo "gh yok: pkg install gh -y"; exit 1; }

if [ -z "$RUN_ID" ]; then
    RUN_ID=$(gh run list --repo "$REPO" --limit 1 --json databaseId --jq '.[0].databaseId')
fi

{
echo "=== Run $RUN_ID durumu ==="
gh run view "$RUN_ID" --repo "$REPO"

echo ""
echo "=== Basarisiz adimlarin logu ==="
gh run view "$RUN_ID" --repo "$REPO" --log-failed || true

echo ""
echo "== Tum log (son 200 satir) =="
gh run view "$RUN_ID" --repo "$REPO" --log 2>/dev/null | tail -200
} > "$OUT" 2>&1

echo "Log kaydedildi: $OUT ($(wc -l < "$OUT") satir)"
