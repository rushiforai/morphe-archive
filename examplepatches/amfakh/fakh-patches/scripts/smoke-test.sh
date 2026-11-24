#!/usr/bin/env bash
# Patches the newest archived APK of every app with every patch the bundle has for it, and fails when one patch
# did not apply. APKs come from ~/.morphe/apks/<app>/. Pass app folder names to test only those.
#
#   ./gradlew :patches:buildAndroid && scripts/smoke-test.sh [app ...]
set -u

root=$(cd "$(dirname "$0")/.." && pwd)
bundle=$(ls -t "$root"/patches/build/libs/*.mpp | head -1)
cli=${MORPHE_CLI:-$HOME/.morphe/morphe-desktop-2.2.0-all.jar}
java=${JAVA:-/opt/homebrew/opt/openjdk@21/bin/java}
work=$(mktemp -d)

# App folder in ~/.morphe/apks and the package its patches are compatible with.
packages=(
  bardi:com.bardi.smart.home
  cnn:com.cnn.indonesia
  confluence:com.atlassian.android.confluence.core
  coverscreen:apps.ijp.coverscreenos
  detik:org.detikcom.rss
  dodo:com.dundunstudio.autoplay
  flipside:com.dinoster.flipside
  fomo:id.anon.android
  github:com.github.android
  idn:com.idntimes.idntimes
  jira:com.atlassian.android.jira.core
  kompas:com.ertanto.kompas.official
  krisbow:com.kawanlama.smartklic
  linkedin:com.linkedin.android
  radio:com.appmind.radios.id
  smartlife:com.tuya.smartlife
  tuya:com.tuya.smart
  warunglife:com.neopawstudio.warunglife
  windy:com.windyty.android
)

failed=0
for entry in "${packages[@]}"; do
  app=${entry%%:*}
  package=${entry#*:}
  if [ $# -gt 0 ] && [[ " $* " != *" $app "* ]]; then continue; fi

  expected=$("$java" -jar "$cli" list-patches --patches="$bundle" -f "$package" 2>/dev/null | sed -n 's/^Name: //p' | sort)
  enable=()
  while IFS= read -r name; do enable+=(-e "$name"); done <<<"$expected"

  # The newest archived version the patches accept; a newer one is skipped as incompatible.
  log="$work/$app.log"
  for apk in $(ls -vr "$HOME/.morphe/apks/$app"/*); do
    "$java" -jar "$cli" patch -p "$bundle" --exclusive "${enable[@]}" --continue-on-error --unsigned \
      -o "$work/$app.apk" "$apk" >"$log" 2>&1
    status=$?
    grep -q '^INFO: Skipping .*incompatible' "$log" || break
  done
  applied=$(sed -n 's/^INFO: Applied: //p' "$log" | sort)
  missing=$(comm -23 <(echo "$expected") <(echo "$applied"))

  if [ $status -eq 0 ] && [ -z "$missing" ]; then
    printf 'ok    %-12s %s patches on %s\n' "$app" "$(echo "$applied" | wc -l | tr -d ' ')" "$(basename "$apk")"
  else
    failed=1
    printf 'FAIL  %-12s %s (exit %s, log %s)\n' "$app" "$(basename "$apk")" "$status" "$log"
    echo "$missing" | sed 's/^/        not applied: /'
    grep '^ERROR' "$log" | head -3 | sed 's/^/        /'
  fi
done
exit $failed
