#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
source "$ROOT/scripts/lib/files.sh"
for command in git cmake ninja; do command -v "$command" >/dev/null || fail "Install $command first"; done
commit="c9cd12a14b75409bebd2f73e4dfc5ff575df3eb8" # DexKit 2.3.0
source_dir="$ROOT/tools/dexkit-src"
if [[ ! -d "$source_dir" ]]; then
  git clone --no-checkout https://github.com/LuckyPray/DexKit.git "$source_dir"
  git -C "$source_dir" checkout --detach "$commit"
fi
[[ "$(git -C "$source_dir" rev-parse HEAD)" == "$commit" ]] || fail 'Unexpected DexKit revision; do not mix native/JVM versions.'
[[ -z "$(git -C "$source_dir" status --porcelain --untracked-files=no)" ]] || fail 'DexKit source has local changes.'
if [[ "$(uname -s)" == Darwin ]]; then
  JAVA_HOME="$(/usr/libexec/java_home -v 17)"
  export JAVA_HOME
fi
: "${JAVA_HOME:?Set JAVA_HOME to JDK 17 for DexKit bootstrap}"
(cd "$source_dir" && bash gradlew --configure-on-demand :dexkit:jar --console=plain)
download_verified 'https://repo.maven.apache.org/maven2/com/google/flatbuffers/flatbuffers-java/23.5.26/flatbuffers-java-23.5.26.jar' \
  "$source_dir/dexkit/build/libs/flatbuffers-java-23.5.26.jar" \
  8d10cac2ea9878896077ba437d76fdb1b9a07f55a863c560bb8a024b04103f8b
printf '%s\n' 'DexKit ready (optional host analysis only; not bundled in the Android patches).'
