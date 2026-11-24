#!/usr/bin/env bash
# Builds the extension's page patch classes against android.jar with a few test stand-ins,
# writes every script they inject, and checks them with Node.
# Usage: .github/page-scripts/run.sh   (needs JDK 17+, Node and ANDROID_HOME)
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
root="$(cd "$here/../.." && pwd)"
sdk="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
if [ -z "$sdk" ]; then echo "Set ANDROID_HOME" >&2; exit 1; fi
android_jar="$(ls -d "$sdk"/platforms/android-*/android.jar | sort -V | tail -1)"

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
ext="$root/extensions/quora/src/main/java/app/jofslash/extension/quora"
sep=":"; case "$(uname -s)" in MINGW*|MSYS*|CYGWIN*) sep=";";; esac

# The stand-ins come first on the class path, so they replace the android.jar classes of the same name.
javac -nowarn -d "$work/classes" -cp "$android_jar" \
  $(find "$here/stubs" -name '*.java') \
  "$ext/HideContentPatch.java" "$ext/ReadingPatch.java" "$ext/RemoveAdsPatch.java" "$ext/PatchSettings.java" "$ext/PageCheck.java" "$ext/SettingsCatalog.java" "$ext/ReadingHistory.java" "$ext/OfflineCopies.java" "$ext/ReadAloud.java" "$ext"/Texts*.java "$ext/TextParts.java" "$ext/Presets.java" "$ext/FilterUpdates.java" "$ext/UpdateCheck.java" "$ext/HiddenStats.java" "$ext/Picker.java" "$ext/AuthorLists.java" "$ext/ReaderImages.java" \
  "$here/GenerateScripts.java" "$here/TextPartsTest.java" "$here/PresetsTest.java" "$here/FilterUpdatesTest.java" "$here/UpdateCheckTest.java" "$here/OfflineImagesTest.java" "$here/FeedToolsTest.java"
# On Windows (Git Bash) java needs Windows paths.
native() { if command -v cygpath >/dev/null 2>&1; then cygpath -w "$1"; else echo "$1"; fi; }
java -cp "$(native "$work/classes")${sep}$(native "$android_jar")" GenerateScripts "$(native "$work/scripts")"
java -cp "$(native "$work/classes")" app.jofslash.extension.quora.TextPartsTest
java -cp "$(native "$work/classes")${sep}$(native "$android_jar")" app.jofslash.extension.quora.PresetsTest
java -cp "$(native "$work/classes")${sep}$(native "$android_jar")" app.jofslash.extension.quora.FilterUpdatesTest
java -cp "$(native "$work/classes")${sep}$(native "$android_jar")" app.jofslash.extension.quora.UpdateCheckTest
java -cp "$(native "$work/classes")${sep}$(native "$android_jar")" app.jofslash.extension.quora.OfflineImagesTest
java -cp "$(native "$work/classes")${sep}$(native "$android_jar")" app.jofslash.extension.quora.FeedToolsTest
node "$here/test.js" "$work/scripts"
# The DOM checks need jsdom, kept in this folder's own package.
[ -d "$here/node_modules/jsdom" ] || (cd "$here" && npm ci --silent --no-audit --no-fund)
node "$here/dom-test.js" "$(native "$work/scripts")"
node "$here/check-selectors.js" "$(native "$root/filters/selectors.json")"
