#!/usr/bin/env bash
# Source inside a disposable GitLab Docker job using the official Temurin JDK image.
set -euo pipefail
apt-get update -qq
apt-get install -y --no-install-recommends ca-certificates curl git unzip xz-utils clang llvm python3 python3-venv jq
ci_tools="$CI_PROJECT_DIR/.ci-tools"
mkdir -p "$ci_tools"
case "$(uname -m)" in x86_64) node_arch=x64;; aarch64) node_arch=arm64;; *) echo "Unsupported runner architecture" >&2; exit 1;; esac
curl --fail --silent --show-error https://nodejs.org/dist/latest-v24.x/SHASUMS256.txt -o "$ci_tools/node-checksums"
node_archive="$(awk -v arch="$node_arch" '$2 ~ "linux-"arch".tar.xz$" {print $2}' "$ci_tools/node-checksums")"
test -n "$node_archive"
curl --fail --silent --show-error "https://nodejs.org/dist/latest-v24.x/$node_archive" -o "$ci_tools/$node_archive"
(cd "$ci_tools"; grep "  $node_archive$" node-checksums | sha256sum --check -)
tar -xJf "$ci_tools/$node_archive" -C "$ci_tools"
export PATH="$ci_tools/${node_archive%.tar.xz}/bin:$PATH"
export ANDROID_HOME="$ci_tools/android-sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
mkdir -p "$ANDROID_HOME/cmdline-tools"
sdk_zip=commandlinetools-linux-15859902_latest.zip
curl --fail --silent --show-error "https://dl.google.com/android/repository/$sdk_zip" -o "$ci_tools/$sdk_zip"
printf '%s  %s\n' 4e4c464f145a7512b57d088ac6c278c03c9eea610886b35a5e0804e74eedf583 "$ci_tools/$sdk_zip" | sha256sum --check -
unzip -q "$ci_tools/$sdk_zip" -d "$ANDROID_HOME/cmdline-tools"
mv "$ANDROID_HOME/cmdline-tools/cmdline-tools" "$ANDROID_HOME/cmdline-tools/latest"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
# Avoid a pipefail/SIGPIPE false failure after sdkmanager exits successfully.
set +o pipefail
yes | sdkmanager --licenses >/dev/null
license_status=${PIPESTATUS[1]}
set -o pipefail
test "$license_status" = 0
sdkmanager platform-tools
python3 -m venv .venv
python3 -c 'import sys; assert sys.version_info >= (3, 11), "Documentation tools require Python 3.11 or newer"'
.venv/bin/pip install -r docs/site-requirements.txt
npm ci --ignore-scripts
