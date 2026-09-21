#!/bin/bash
# Drives the test phone one step at a time for the device checks in Roadmap_Blocked.md.
#
# Every tap is refused unless TikTok is in the foreground, because a phone in somebody's hand
# takes the foreground between two adb calls and a queued tap then lands in another app. Every
# step can be followed by a screenshot, which is the evidence a device check produces.
#
# Coordinates are given in the space of a screenshot viewed at 933 px wide (what an image
# viewer shows for a 1080 px panel) and scaled here, so numbers read off the picture can be
# used as they are. Set PHONE_SCALE=1 to give panel pixels instead.
#
#   scripts/phone.sh shot 01-feed                 screenshot to $PHONE_SHOTS/01-feed.png
#   scripts/phone.sh tap 464 393                  tap, then wait 2 s
#   scripts/phone.sh swipe 466 1500 466 500       a scroll up
#   scripts/phone.sh key KEYCODE_BACK
#   scripts/phone.sh text hello
#   scripts/phone.sh top                          the foreground activity
#   scripts/phone.sh logcat "morphe|hushfeed"     recent payload lines
#   scripts/phone.sh gfx                          frame stats for the perf device check
#
# PHONE_SERIAL selects the device; it must be the test phone, never the owner's own.
set -eu
S="${PHONE_SERIAL:?set PHONE_SERIAL to the test phone serial}"
if [[ "$S" != "R5CT139QJ5F" ]]; then
    echo "REFUSED: device $S is not the S22 test phone" >&2
    exit 2
fi

normalise_path() {
    local candidate converted
    candidate="$1"
    if [[ "$candidate" =~ ^[[:alpha:]]:[\\/].* ]] && command -v wslpath >/dev/null 2>&1; then
        if converted=$(wslpath -u "$candidate" 2>/dev/null); then
            printf '%s\n' "$converted"
            return
        fi
    fi
    printf '%s\n' "$candidate"
}

find_adb() {
    local app_data candidate
    if command -v adb >/dev/null 2>&1; then
        command -v adb
        return
    fi
    if command -v adb.exe >/dev/null 2>&1; then
        command -v adb.exe
        return
    fi
    app_data=$(normalise_path "${LOCALAPPDATA:-}")
    [[ -n "$app_data" ]] || return 1
    for candidate in \
        "$app_data/Android/Sdk/platform-tools/adb.exe" \
        "$app_data"/Microsoft/WinGet/Packages/Google.PlatformTools*/platform-tools/adb.exe; do
        if [[ -x "$candidate" ]]; then
            printf '%s\n' "$candidate"
            return
        fi
    done
    return 1
}

if [[ -n "${ADB:-}" ]]; then
    ADB=$(normalise_path "$ADB")
elif ! ADB=$(find_adb); then
    echo "REFUSED: adb was not found" >&2
    exit 127
fi
SP=$(normalise_path "${PHONE_SHOTS:-${TEMP:-/tmp}/hushfeed-device/shots}")
PKG=com.zhiliaoapp.musically
SCALE="${PHONE_SCALE:-1.15756}"
mkdir -p "$SP"

parse_top() {
    awk '
        /^[[:space:]]*Display: mDisplayId=/ {
            default_display = ($0 ~ /^[[:space:]]*Display: mDisplayId=0([[:space:]]|$)/)
            next
        }
        default_display && /^[[:space:]]*mCurrentFocus=/ {
            record = $0
            while (record !~ /}/ && record !~ /=null[[:space:]]*$/ && (getline continuation) > 0) {
                record = record " " continuation
            }
            sub(/^.*mCurrentFocus=Window\{[^[:space:]]+[[:space:]]+u[0-9]+[[:space:]]+/, "", record)
            sub(/}.*$/, "", record)
            sub(/^[[:space:]]+/, "", record)
            sub(/[[:space:]]+$/, "", record)
            if (record ~ /^[^[:space:]]+\/[^[:space:]]+$/) {
                print record
                found = 1
            }
            exit
        }
        END { if (!found) exit 1 }
    '
}
top() { local result; result=$(timeout 30 "$ADB" -s "$S" shell dumpsys window displays 2>/dev/null) || return $?; printf '%s\n' "$result" | parse_top; }
# Written to a temporary name and moved into place only after a zero exit: the redirection
# creates the file before adb runs, so a dropped device or a timeout left an empty .png where
# a device check expected evidence.
shot() { local activity tmp; tmp="$SP/$1.png.part"; if ! timeout 60 "$ADB" -s "$S" exec-out screencap -p > "$tmp" 2>/dev/null || [ ! -s "$tmp" ]; then rm -f "$tmp"; echo "screencap failed for $1" >&2; return 1; fi; mv -f "$tmp" "$SP/$1.png"; activity=$(top) || return $?; echo "shot $SP/$1.png top=$activity"; }
guard() { local t; t=$(top); case "$t" in $PKG/*) ;; *) echo "REFUSED: foreground is $t"; exit 2;; esac; }
px() { awk "BEGIN{printf \"%d\", $1*$SCALE}"; }
tap() { guard; timeout 30 "$ADB" -s "$S" shell input -d 0 tap "$(px "$1")" "$(px "$2")"; sleep "${3:-2}"; }
swipe() { guard; timeout 30 "$ADB" -s "$S" shell input -d 0 swipe "$(px "$1")" "$(px "$2")" "$(px "$3")" "$(px "$4")" "${5:-300}"; sleep "${6:-2}"; }
key() { guard; timeout 30 "$ADB" -s "$S" shell input -d 0 keyevent "$1"; sleep "${2:-2}"; }
text() { guard; timeout 30 "$ADB" -s "$S" shell input -d 0 text "$1"; sleep 1; }
logcat() { local result pattern; pattern="${1:?logcat requires a filter}"; result=$(timeout 60 "$ADB" -s "$S" logcat -d 2>/dev/null) || return $?; printf '%s\n' "$result" | grep -iE "$pattern" | tail -"${2:-20}"; }
gfx() { local result; result=$(timeout 60 "$ADB" -s "$S" shell dumpsys gfxinfo $PKG "${1:-}" 2>/dev/null) || return $?; printf '%s\n' "$result" | grep -E "Total frames|Janky|50th|90th|99th|Number Frame|Uptime" | head -12; }
"$@"
