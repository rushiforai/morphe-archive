#!/usr/bin/env bash
# Builds with official Morphe sources, without GitHub Packages credentials.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT="$HERE"
PROJECT="$(realpath "$PROJECT")"
for tool in python3 git java; do
  command -v "$tool" >/dev/null || { echo "Missing prerequisite: $tool" >&2; exit 1; }
done
[[ -f "$PROJECT/gradlew" ]] || { echo "Missing Gradle project: $PROJECT" >&2; exit 1; }
python3 "$HERE/tools/bootstrap.py"
export JAVA_HOME="$HERE/.work/toolchain/jdk-21.0.13+9"
export PATH="$JAVA_HOME/bin:$PATH"
export GRADLE_USER_HOME="$HERE/.work/gradle-home"
export ANDROID_HOME="$HERE/.work/android-sdk"
# This is local machine configuration and is ignored by Git.
printf 'sdk.dir=%s\n' "$ANDROID_HOME" > "$PROJECT/local.properties"
mkdir -p "$HERE/output"
# Reuse an already downloaded copy of the exact wrapper version, otherwise use the wrapper.
GRADLE_COMMAND="${GRADLE_BIN:-}"
if [[ -z "$GRADLE_COMMAND" ]]; then
  GRADLE_COMMAND="$(find "$GRADLE_USER_HOME/wrapper/dists" "$HOME/.gradle/wrapper/dists" \
    -path '*/gradle-9.8.2/bin/gradle' -type f -print -quit 2>/dev/null || true)"
fi
GRADLE_COMMAND="${GRADLE_COMMAND:-$PROJECT/gradlew}"
APK="${BOOST_APK:-$HERE/inputs/boost-for-reddit-1.14.3.apk}"
TASKS=(buildAndroid :patches:generatePatchesList)
if [[ -f "$APK" ]]; then TASKS=(:patches:validateBundle :patches:validateWrapper :patches:validatePostWrapper :patches:generatePatchesList); fi
"$GRADLE_COMMAND" -p "$PROJECT" "${TASKS[@]}" \
  "-PmorphePluginSource=$HERE/.work/upstream/gradle-plugin" \
  "-PmorphePatcherSource=$HERE/.work/upstream/patcher" \
  -Pgpr.user=source-build -Pgpr.key=unused "-PboostApk=$APK" \
  --no-daemon --console=plain 2>&1 | tee "$HERE/output/build.log"
# Fail if a stale or unexpected artifact would be published.
VERSION="$(sed -n 's/^version[[:space:]]*=[[:space:]]*//p' "$PROJECT/gradle.properties")"
[[ "$VERSION" =~ ^[[:alnum:]._-]+$ ]] || { echo "Invalid project version" >&2; exit 1; }
python3 "$HERE/tools/test-thread-boundaries-on-host.py" --project "$PROJECT" | tee "$HERE/output/host-thread-boundaries-$VERSION.log"
BUNDLE="$PROJECT/patches/build/libs/patches-$VERSION.mpp"
[[ -s "$BUNDLE" ]] || { echo "Expected bundle was not built: $BUNDLE" >&2; exit 1; }
cp "$BUNDLE" "$HERE/output/shikify-$VERSION.mpp"
(cd "$HERE/output" && sha256sum shikify-$VERSION.mpp > shikify-$VERSION.mpp.sha256)
printf '\nBundle: %s\n' "$HERE/output/shikify-$VERSION.mpp"
if [[ "${TASKS[0]}" == buildAndroid ]]; then
  printf 'APK application validation skipped: supply BOOST_APK=/path/to/original-1.14.3.apk and rebuild.\n'
fi
