#!/usr/bin/env sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BRIDGE="$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/ChromeBridge.java"
FORK="$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/ForkSiteSupport.java"
NATIVE_INSTALL="$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/NativeInstallAction.java"
INSTALL_ACTIVITY="$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/UserscriptInstallActivity.java"
PATCH="$ROOT/patches/src/main/kotlin/dev/alastorkaneki/morphe/patches/chrome/ChromeUserscriptPatch.kt"
UI="$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/MonkeyUi.java"
MANAGER="$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/UserscriptManagerActivity.java"

require() {
  file="$1"
  text="$2"
  grep -Fq "$text" "$file" || {
    echo "Missing required runtime marker '$text' in $file" >&2
    exit 1
  }
}

require "$BRIDGE" 'evaluateJavaScriptForTests'
require "$BRIDGE" 'executeJavaScriptInIsolatedWorld'
require "$BRIDGE" 'getActivityTabProvider'
require "$BRIDGE" 'getCurrentWebContents'

TEST_LINE=$(grep -n 'evaluateJavaScriptForTests' "$BRIDGE" | head -n1 | cut -d: -f1)
ISOLATED_LINE=$(grep -n 'executeJavaScriptInIsolatedWorld' "$BRIDGE" | head -n1 | cut -d: -f1)
LEGACY_LINE=$(grep -n '"evaluateJavaScript", javascript' "$BRIDGE" | head -n1 | cut -d: -f1)
[ "$TEST_LINE" -lt "$LEGACY_LINE" ]
[ "$ISOLATED_LINE" -lt "$LEGACY_LINE" ]

require "$FORK" 'api.greasyfork.org'
require "$FORK" 'code_url'
require "$FORK" 'a.install-link[href]'
require "$FORK" 'data-code-url'
require "$FORK" 'MutationObserver'
require "$FORK" 'intent://install?url='
require "$FORK" 'scheme=monkeyscript-install'
require "$NATIVE_INSTALL" 'Install userscript'
require "$NATIVE_INSTALL" 'ForkSiteSupport.isInstallablePage'
require "$NATIVE_INSTALL" 'ForkSiteSupport.openInstallPreview'
require "$INSTALL_ACTIVITY" 'getQueryParameter("url")'
require "$PATCH" 'android.intent.category.BROWSABLE'
require "$PATCH" 'monkeyscript-install'
require "$PATCH" 'exported = true'

require "$UI" 'contrastRatio'
require "$UI" 'system_accent1_600'
require "$UI" 'Color.alpha'
require "$UI" 'Typeface.create("sans-serif"'
require "$MANAGER" 'addActionRow'
if grep -Fq 'HorizontalScrollView' "$MANAGER"; then
  echo 'Manager must not use the clipped horizontal action strip.' >&2
  exit 1
fi

echo 'Chrome page execution, native Fork installer, and Material You UI guard passed.'
