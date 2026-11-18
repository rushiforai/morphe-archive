#!/usr/bin/env bash
set -euo pipefail
if [[ $# -lt 1 || $# -gt 2 ]]; then
  printf 'Usage: %s original.apk-or-apkm [output.apk]\n' "$0" >&2
  exit 2
fi
input_path=$(python3 -c 'import pathlib,sys; print(pathlib.Path(sys.argv[1]).resolve(strict=True))' "$1")
output_path=$(python3 -c 'import pathlib,sys; print(pathlib.Path(sys.argv[1]).resolve())' "${2:-artifacts/swiftkey-clean-9.13.19.3.apk}")
if [[ "$input_path" == "$output_path" ]]; then
  printf 'The output must be different from the original input.\n' >&2
  exit 2
fi
cd "$(dirname "$0")/.."
if [[ -z "${JAVA_HOME:-}" && -d /opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home ]]; then
  export JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home
fi
python3 scripts/bootstrap.py
./gradlew buildAndroid --console=plain
patch_version=$(python3 -c 'import pathlib; print(next(line.split("=", 1)[1].strip() for line in pathlib.Path("gradle.properties").read_text().splitlines() if line.startswith("version=")))')
mkdir -p "$(dirname "$output_path")" artifacts
"${JAVA_HOME:+$JAVA_HOME/bin/}java" -Xmx3g -jar tools/morphe-desktop-2.1.1-all.jar patch \
  --patches "patches/build/libs/swiftkey-clean-patches-$patch_version.mpp" \
  --validate --bytecode-mode FULL --out "$output_path" \
  --result-file artifacts/patch-result.json "$input_path"
"${JAVA_HOME:+$JAVA_HOME/bin/}java" --class-path tools/morphe-desktop-2.1.1-all.jar \
  scripts/VerifyPatchedApk.java "$output_path"
