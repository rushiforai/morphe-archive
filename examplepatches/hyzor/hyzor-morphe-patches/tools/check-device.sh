#!/usr/bin/env bash
#
# Check whether a virtual Android device is ready before testing.
#
# Exit codes:
#   0  a virtual device (emulator-*) is attached and in the "device" state
#   1  no device is attached
#   2  only a physical device is attached; ask the user before using it
#   3  adb was not found

set -euo pipefail

usage() {
    cat <<'EOF'
Usage: tools/check-device.sh [--wait <seconds>]

Check that a virtual Android device (emulator-*) is attached and ready.

Options:
  --wait <seconds>  Poll for up to this many seconds for a virtual device.
  -h, --help        Show this help.

The command is read-only: it never starts an emulator. If no virtual device is
attached, start one in Android Studio's Device Manager (or with
`emulator -avd <name>`), then rerun the check.
EOF
}

wait_seconds=0
while [[ $# -gt 0 ]]; do
    case "$1" in
        --wait)
            [[ $# -ge 2 ]] || { usage >&2; exit 2; }
            wait_seconds=$2
            shift 2
            ;;
        -h | --help)
            usage
            exit 0
            ;;
        *)
            echo "error: unknown argument: $1" >&2
            usage >&2
            exit 2
            ;;
    esac
done
case "$wait_seconds" in
    "" | *[!0-9]*)
        echo "error: --wait needs a non-negative number of seconds" >&2
        exit 2
        ;;
esac

ADB=${ADB:-}
if [[ -z "$ADB" ]]; then
    if command -v adb >/dev/null 2>&1; then
        ADB=adb
    elif [[ -n "${ANDROID_HOME:-}" && -x "$ANDROID_HOME/platform-tools/adb" ]]; then
        ADB="$ANDROID_HOME/platform-tools/adb"
    elif [[ -x /opt/android-sdk/platform-tools/adb ]]; then
        ADB=/opt/android-sdk/platform-tools/adb
    else
        echo "error: adb was not found." >&2
        echo "Install Android platform-tools or set ANDROID_HOME." >&2
        exit 3
    fi
fi

EMULATOR=${EMULATOR:-}
if [[ -z "$EMULATOR" ]]; then
    if command -v emulator >/dev/null 2>&1; then
        EMULATOR=emulator
    elif [[ -n "${ANDROID_HOME:-}" && -x "$ANDROID_HOME/emulator/emulator" ]]; then
        EMULATOR="$ANDROID_HOME/emulator/emulator"
    elif [[ -x /opt/android-sdk/emulator/emulator ]]; then
        EMULATOR=/opt/android-sdk/emulator/emulator
    fi
fi

EMU_SERIAL=""

find_emulator() {
    local serial state rest
    EMU_SERIAL=""
    while read -r serial state rest; do
        [[ -z "$serial" || "$serial" == "List" ]] && continue
        if [[ "$serial" == emulator-* && "$state" == "device" ]]; then
            EMU_SERIAL=$serial
            return 0
        fi
    done < <("$ADB" devices -l 2>/dev/null || true)
    return 1
}

if ! find_emulator && (( wait_seconds > 0 )); then
    echo "Waiting up to ${wait_seconds}s for a virtual device..."
    deadline=$((SECONDS + wait_seconds))
    while (( SECONDS < deadline )); do
        sleep 5
        if find_emulator; then
            break
        fi
    done
fi

if find_emulator; then
    model=$("$ADB" -s "$EMU_SERIAL" shell getprop ro.product.model 2>/dev/null | tr -d '\r' || true)
    release=$("$ADB" -s "$EMU_SERIAL" shell getprop ro.build.version.release 2>/dev/null | tr -d '\r' || true)
    sdk=$("$ADB" -s "$EMU_SERIAL" shell getprop ro.build.version.sdk 2>/dev/null | tr -d '\r' || true)
    echo "Virtual device ready: $EMU_SERIAL"
    echo "  model: ${model:-unknown}"
    echo "  Android: ${release:-unknown} (API ${sdk:-unknown})"
    exit 0
fi

physical=()
while read -r serial state rest; do
    [[ -z "$serial" || "$serial" == "List" ]] && continue
    if [[ "$state" == "device" && "$serial" != emulator-* ]]; then
        physical+=("$serial")
    fi
done < <("$ADB" devices -l 2>/dev/null || true)

if [[ ${#physical[@]} -gt 0 ]]; then
    echo "No virtual device attached."
    for serial in "${physical[@]}"; do
        echo "Physical device: $serial"
    done
    echo "Default testing uses a virtual device. Ask the user before switching to a physical phone."
    exit 2
fi

echo "No Android device attached."
if [[ -n "$EMULATOR" ]]; then
    avds=$("$EMULATOR" -list-avds 2>/dev/null || true)
    if [[ -n "$avds" ]]; then
        echo "Available AVDs:"
        printf '%s\n' "$avds" | sed 's/^/  /'
        echo "Start one in Android Studio's Device Manager, or run:"
        echo "  emulator -avd <name>"
    else
        echo "Start a virtual device in Android Studio's Device Manager."
    fi
else
    echo "Start a virtual device in Android Studio's Device Manager."
fi
echo "Then rerun: tools/check-device.sh"
exit 1
