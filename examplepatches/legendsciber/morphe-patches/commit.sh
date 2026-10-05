#!/data/data/com.termux/files/usr/bin/bash
# Degisiklikleri commit eder. GitHub'a push ETMEZ.
# Kullanim:  bash commit.sh
# Mesaj asagida MSG satirinda tutulur; her duzeltmede guncellenir.
set -e

DIR="${DIR:-/tmp/morphe-patches}"
MSG="feat(solarsmash): add all packages purchased patch"

cd "$DIR"

command -v git >/dev/null || { echo "git yok: pkg install git -y"; exit 1; }

# Analiz/kirma scriptleri repoya girmez -> arsive tasinir
mkdir -p "$HOME/analiz-arsiv"
mv -f "$DIR"/analyze*.sh "$HOME/analiz-arsiv/" 2>/dev/null || true
mv -f "$DIR"/crack_bb*.sh "$HOME/analiz-arsiv/" 2>/dev/null || true

# Commit kimligi yoksa ayarla
git config --local user.name  "legendsciber"
git config --local user.email "legendsciber@users.noreply.github.com"

git add -A

if git diff --cached --quiet; then
    echo "Commitlenecek degisiklik yok."
else
    git commit -m "$MSG"
fi

echo ""
echo "Commit tamamlandi (push yapilmadi)."

