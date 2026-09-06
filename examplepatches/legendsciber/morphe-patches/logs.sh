#!/data/data/com.termux/files/usr/bin/bash
# GitHub Actions workflow durumunu canli olarak izler ve log kaydeder.
# Kullanim:
#   bash logs.sh              -> en son workflow'u canli izle + ~/log.txt'a kaydet
#   bash logs.sh <run-id>     -> belirli bir run'i izle
#   bash logs.sh --last       -> son run'in loglarini goster (canli izlemeden)
set -e

REPO="legendsciber/morphe-patches"
OUT="$HOME/log.txt"
RUN_ID="${1:-}"
LIVE=true

command -v gh >/dev/null || { echo "gh yok: pkg install gh -y"; exit 1; }

if [ "$RUN_ID" = "--last" ]; then
    RUN_ID=$(gh run list --repo "$REPO" --limit 1 --json databaseId --jq '.[0].databaseId')
    LIVE=false
elif [ -z "$RUN_ID" ]; then
    RUN_ID=$(gh run list --repo "$REPO" --limit 1 --json databaseId --jq '.[0].databaseId')
fi

echo "=== Run ID: $RUN_ID ==="
echo ""

if [ "$LIVE" = true ]; then
    echo "Canli izleniyor... (Ctrl+C ile durdur)"
    echo ""
    # Canli izleme + dosyaya kaydet
    gh run watch "$RUN_ID" --repo "$REPO" --exit-status 2>&1 | tee "$OUT"
else
    # Sadece mevcut logu goster
    gh run view "$RUN_ID" --repo "$REPO" 2>&1 | tee "$OUT"
fi

echo ""
echo "=== Basarisiz adimlar ==="
gh run view "$RUN_ID" --repo "$REPO" --log-failed 2>&1 | tee -a "$OUT" || true

echo ""
echo "=== Tam log (son 300 satir) ==="
gh run view "$RUN_ID" --repo "$REPO" --log 2>/dev/null | tail -300 | tee -a "$OUT"

echo ""
echo "Log kaydedildi: $OUT ($(wc -l < "$OUT") satir)"
