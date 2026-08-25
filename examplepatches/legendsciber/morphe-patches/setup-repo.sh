#!/data/data/com.termux/files/usr/bin/bash
# Legendsciber's Patches deposunu olusturur ve push eder (PUBLIC repo).
# Kullanim:  bash ~/hillclimb-patches/setup-repo.sh
set -e

REPO_NAME="morphe-patches"
GH_USER="legendsciber"
DIR="$HOME/hillclimb-patches"

command -v gh >/dev/null || { echo "gh yok: pkg install gh -y"; exit 1; }
command -v git >/dev/null || { echo "git yok: pkg install git -y"; exit 1; }

if ! gh auth status >/dev/null 2>&1; then
    echo "GitHub girisi gerekiyor..."
    gh auth login
fi

cd "$DIR"

# Binary dosya (web aracindan aktarilamadi) - yoksa template'den indir
if [ ! -f gradle/wrapper/gradle-wrapper.jar ]; then
    mkdir -p gradle/wrapper
    curl -fsSL -o gradle/wrapper/gradle-wrapper.jar \
        https://raw.githubusercontent.com/MorpheApp/morphe-patches-template/main/gradle/wrapper/gradle-wrapper.jar
fi

chmod +x gradlew setup-repo.sh 2>/dev/null || true

# Commit kimligi yoksa bu repo icin ayarla
git config user.name  >/dev/null 2>&1 || git config user.name  "legendsciber"
git config user.email >/dev/null 2>&1 || git config user.email "legendsciber@users.noreply.github.com"

git init -b main 2>/dev/null || git init
git add .
git commit -m "feat: Hill Climb Racing patches (initial release)" || true

gh repo create "$GH_USER/$REPO_NAME" \
    --public \
    --description "legendsciber's Patches - Morphe patches" \
    --source . --remote=origin --push

echo "Tamamlandi: https://github.com/$GH_USER/$REPO_NAME (public)"
