#!/data/data/com.termux/files/usr/bin/bash
# Degisiklikleri commit eder ve push lar.
# Kullanim:  bash commit.sh
# Mesaj asagida MSG satirinda tutulur; her duzeltmede guncellenir.
set -e

DIR="${DIR:-/tmp/morphe-patches}"
MSG="fix(extremecardriving): embed .so as base64 in smali, no rawResourcePatch"

cd "$DIR"

command -v git >/dev/null || { echo "git yok: pkg install git -y"; exit 1; }

# Analiz/kirma scriptleri repoya girmez -> arsive tasinir
mkdir -p "$HOME/analiz-arsiv"
mv -f "$DIR"/analyze*.sh "$HOME/analiz-arsiv/" 2>/dev/null || true
mv -f "$DIR"/crack_bb*.sh "$HOME/analiz-arsiv/" 2>/dev/null || true

# Commit kimligi yoksa ayarla
git config user.name  >/dev/null 2>&1 || git config user.name  "legendsciber"
git config user.email >/dev/null 2>&1 || git config user.email "legendsciber@users.noreply.github.com"

git add -A

if git diff --cached --quiet; then
    echo "Commitlenecek degisiklik yok."
else
    git commit -m "$MSG"
fi

# Release bot'u uzaktan commit atmissa once onu al, sonra push et
git pull --rebase

git push
echo ""
echo "Push tamamlandi. Workflow durumu:"
echo "https://github.com/legendsciber/morphe-patches/actions"

