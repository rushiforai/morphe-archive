#!/usr/bin/env bash
# Builds BitChord's release APKs from a source checkout, the same way BitChord's
# own release workflow does (assembleProdRelease). Without their keystore and API
# keys the APKs are unsigned and the keys are blank.
#
#   tools/build_bitchord.sh <bitchord-checkout> <output-dir> <name>
#
# Needs JDK 17 and ANDROID_HOME. Writes <output-dir>/BitChord-<name>_<abi>.apk.
set -euo pipefail
source_dir=$1
output_dir=$(mkdir -p "$2" && cd "$2" && pwd)
name=$3

cd "$source_dir"
printf 'sdk.dir=%s\nLASTFM_API_KEY=\nLASTFM_SECRET=\nLISTEN_TOGETHER_SERVER=\n' "$ANDROID_HOME" > local.properties
chmod +x gradlew
./gradlew --no-daemon assembleProdRelease
for abi in arm64-v8a armeabi-v7a x86_64; do
  cp app/build/outputs/apk/prod/release/*"$abi"*.apk "$output_dir/BitChord-${name}_$abi.apk"
done
