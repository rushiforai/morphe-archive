#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
runtime_dir="${REDDIT_ANDROID_RUNTIME:-$(dirname "$repo_dir")/.android-testing}"
export ANDROID_HOME="$runtime_dir/sdk"
export ANDROID_AVD_HOME="$runtime_dir/avd"
export ANDROID_USER_HOME="$runtime_dir/user"
mkdir -p "$ANDROID_AVD_HOME" "$ANDROID_USER_HOME" "$runtime_dir/logs"
emulator="$ANDROID_HOME/emulator/emulator"
avdmanager="$ANDROID_HOME/cmdline-tools/latest/bin/avdmanager"
if [[ ! -x "$emulator" || ! -x "$avdmanager" ]]; then
    echo "Android tools missing. See testing/android/README.md." >&2
    exit 1
fi
acceleration=on
memory=2048
cores=2
if [[ "${1:-}" == --software ]]; then
    acceleration=off
    memory=1024
    cores=1
elif [[ $# -gt 0 ]]; then
    echo "Usage: $0 [--software]" >&2
    exit 1
fi
if [[ "$acceleration" == on ]] && ! "$emulator" -accel-check; then
    echo "Pass /dev/kvm into this container. --software is available for a slow boot experiment." >&2
    exit 1
fi
if [[ ! -f "$ANDROID_AVD_HOME/reddit_api30.ini" ]]; then
    printf 'no\n' | "$avdmanager" create avd --name reddit_api30 \
        --package 'system-images;android-30;google_apis;x86_64' \
        --device pixel_2 --path "$ANDROID_AVD_HOME/reddit_api30.avd"
    cat >> "$ANDROID_AVD_HOME/reddit_api30.avd/config.ini" <<'EOF'
hw.lcd.width=720
hw.lcd.height=1280
hw.lcd.density=320
disk.dataPartition.size=4G
EOF
fi
exec nice -n 10 "$emulator" -avd reddit_api30 -port 5554 \
    -no-window -no-audio -no-boot-anim -no-snapshot \
    -gpu "${REDDIT_ANDROID_GPU:-swangle}" -feature -Vulkan -accel "$acceleration" \
    -memory "$memory" -cores "$cores" -camera-back none -camera-front none
