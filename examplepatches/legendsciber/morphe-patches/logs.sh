#!/data/data/com.termux/files/usr/bin/bash
# En SON workflow calistirmasini bulur, durumunu ve basarisiz adimlarin
# logunu gosterir.
# Kullanim:
#   bash logs.sh              -> en son run'in durumu + hata logu
#   bash logs.sh <run-id>     -> belirli bir run'in hata logu
set -e

REPO="legendsciber/morphe-patches"
RUN_ID="${1:-}"

command -v gh >/dev/null || { echo "gh yok: pkg install gh -y"; exit 1; }

if [ -z "$RUN_ID" ]; then
    RUN_ID=$(gh run list --repo "$REPO" --limit 1 --json databaseId --jq '.[0].databaseId')
fi

echo "=== Run $RUN_ID durumu ==="
gh run view "$RUN_ID" --repo "$REPO"

echo ""
echo "=== Basarisiz adimlarin logu ==="
gh run view "$RUN_ID" --repo "$REPO" --log-failed || true
