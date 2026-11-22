#!/usr/bin/env bash
# Downloads the newest Reddit app to work/reddit.xapk (or .apk) and prints its version.
# Writes "version=..." and "file=..." to $GITHUB_OUTPUT when run in GitHub Actions.
set -u
mkdir -p work
cd work
UA="Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Mobile Safari/537.36"
file=""
for kind in XAPK APK; do
  for host in d.apkpure.com d.apkpure.net; do
    url="https://$host/b/$kind/com.reddit.frontpage?version=latest"
    echo "Trying $url"
    if curl -sSL --fail -A "$UA" -o reddit.bin "$url" && [ "$(stat -c %s reddit.bin)" -gt 10000000 ]; then
      file="reddit.$(echo $kind | tr 'A-Z' 'a-z')"
      mv reddit.bin "$file"
      break 2
    fi
  done
done
if [ -z "$file" ]; then echo "Could not download Reddit"; exit 1; fi

# Version from the base APK.
mkdir -p x
if [ "$file" = "reddit.xapk" ]; then
  unzip -o -q "$file" -d x
  base=$(ls x/*.apk | grep -E "com.reddit.frontpage.apk|base.apk" | head -1)
  [ -z "$base" ] && base=$(ls -S x/*.apk | head -1)
else
  base="$file"
fi
AAPT=$(ls "$ANDROID_HOME"/build-tools/*/aapt 2>/dev/null | tail -1)
version=$("$AAPT" dump badging "$base" 2>/dev/null | grep -oE "versionName='[^']+'" | head -1 | cut -d"'" -f2)
cp "$base" base.apk
rm -rf x
echo "Reddit $version ($file)"
if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "version=$version" >> "$GITHUB_OUTPUT"
  echo "file=work/$file" >> "$GITHUB_OUTPUT"
fi
