#!/usr/bin/env bash
# Puts the Gradle distribution named in gradle-wrapper.properties where the
# wrapper looks for it, so ./gradlew does not download it.
#
# The wrapper downloads from services.gradle.org, which redirects to a GitHub
# release link. Those links returned HTTP 504 for hours on 2026-11-08 while
# GitHub's API kept working, so this fetches the same file with gh, checks it
# against the wrapper's distributionSha256Sum, and unpacks it. It does nothing
# when the distribution is already there, for example from a cache.
set -euo pipefail

props=gradle/wrapper/gradle-wrapper.properties
url=$(sed -n 's/^distributionUrl=//p' "$props" | sed 's/\\:/:/g')
sha=$(sed -n 's/^distributionSha256Sum=//p' "$props")
zip=${url##*/}                                  # gradle-9.8.2-bin.zip
name=${zip%.zip}                                # gradle-9.8.2-bin
version=$(echo "$name" | sed -E 's/^gradle-(.+)-(bin|all)$/\1/')

# The wrapper's folder is the MD5 of the URL in base 36.
hash=$(python3 -c '
import hashlib, sys
n = int(hashlib.md5(sys.argv[1].encode()).hexdigest(), 16)
digits = "0123456789abcdefghijklmnopqrstuvwxyz"
s = ""
while n:
    n, r = divmod(n, 36)
    s = digits[r] + s
print(s)' "$url")
dir="${GRADLE_USER_HOME:-$HOME/.gradle}/wrapper/dists/$name/$hash"

if [ -f "$dir/$zip.ok" ]; then
  echo "Gradle $version is already in place."
  exit 0
fi

mkdir -p "$dir"
gh release download "v$version" -R gradle/gradle-distributions -p "$zip" -D "$dir" --clobber
echo "$sha  $dir/$zip" | sha256sum -c -
unzip -q -o "$dir/$zip" -d "$dir"
touch "$dir/$zip.ok"
echo "Gradle $version fetched with gh into $dir."
