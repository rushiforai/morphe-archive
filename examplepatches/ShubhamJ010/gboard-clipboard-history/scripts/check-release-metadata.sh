#!/usr/bin/env bash
# ==============================================================================
# Check that every release metadata file carries the same version.
#
# The version lives in gradle.properties. patches-list.json, patches-bundle.json
# and the patch constants have to agree with it, and the copies that the
# Gradle build packages have to be identical to the copies in the repository
# root. A mismatch means a user installs a bundle that was never reviewed.
#
#   ./scripts/check-release-metadata.sh
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

fail() {
    printf 'ERR: %s\n' "$1" >&2
    exit 1
}

VERSION="$(grep -E '^version\s*=' "$PROJECT_ROOT/gradle.properties" | cut -d'=' -f2 | tr -d ' ')"
[[ -n "$VERSION" ]] || fail "cannot read version from gradle.properties"

json_version() {
    grep -m1 -E '"version"[[:space:]]*:' "$1" | sed -E 's/.*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/'
}

check_json_version() {
    local file="$1" found
    found="$(json_version "$file")"
    [[ "$found" == "$VERSION" ]] \
        || fail "$file reports version '$found', gradle.properties says '$VERSION'"
}

check_json_version "$PROJECT_ROOT/patches-list.json"
check_json_version "$PROJECT_ROOT/patches-bundle.json"
check_json_version "$PROJECT_ROOT/patches/src/main/resources/patches-list.json"
check_json_version "$PROJECT_ROOT/patches/src/main/resources/patches-bundle.json"

diff -q "$PROJECT_ROOT/patches-list.json" \
    "$PROJECT_ROOT/patches/src/main/resources/patches-list.json" >/dev/null \
    || fail "patches-list.json differs between the repository root and patches/src/main/resources"
diff -q "$PROJECT_ROOT/patches-bundle.json" \
    "$PROJECT_ROOT/patches/src/main/resources/patches-bundle.json" >/dev/null \
    || fail "patches-bundle.json differs between the repository root and patches/src/main/resources"

grep -q "/$VERSION/" "$PROJECT_ROOT/patches-bundle.json" \
    || fail "patches-bundle.json download_url does not point at a $VERSION release"

KOTLIN_VERSION="$(grep -m1 'PATCH_VERSION' "$PROJECT_ROOT/patches/src/main/kotlin/com/sj010/gboardclipboard/patches/Constants.kt" \
    | sed -E 's/.*"([^"]+)".*/\1/')"
[[ "$KOTLIN_VERSION" == "$VERSION" ]] \
    || fail "Constants.kt PATCH_VERSION is '$KOTLIN_VERSION', gradle.properties says '$VERSION'"

# The bundle metadata has to carry every key, because the Gradle build and the
# shell build both read it and neither one may invent a value of its own.
ABOUT_FILE="$PROJECT_ROOT/patches/about.properties"
[[ -f "$ABOUT_FILE" ]] || fail "missing $ABOUT_FILE"
for key in name description source author contact website license; do
    value="$(sed -n "s/^$key=//p" "$ABOUT_FILE" | head -1)"
    [[ -n "$value" ]] || fail "$ABOUT_FILE is missing the '$key' key"
done
grep -q "about.properties" "$PROJECT_ROOT/patches/build.gradle.kts" \
    || fail "patches/build.gradle.kts does not read patches/about.properties"

# Every patch that the bundle ships has to be listed in the manifest, because
# the build scripts select patches by name.
while IFS= read -r patch_name; do
    grep -qF "\"name\": \"$patch_name\"" "$PROJECT_ROOT/patches-list.json" \
        || fail "patches-list.json does not list the '$patch_name' patch"
done < <(grep -rhoE '^    name = "[^"]+"' "$PROJECT_ROOT/patches/src/main/kotlin" \
    | sed 's/^    name = "//; s/"$//')

# The runtime extension and the patches derive the provider authority and the
# signature permission from the host package. They live in two languages and
# two build systems, so the constants have to be compared here. A mismatch would
# leave the manifest and the runtime pointing at two different providers.
JAVA_SETTINGS="$PROJECT_ROOT/extensions/extension/src/main/java/com/sj010/gboardclipboard/extension/GboardClipboardHistorySettings.java"
KOTLIN_CONSTANTS="$PROJECT_ROOT/patches/src/main/kotlin/com/sj010/gboardclipboard/patches/Constants.kt"

java_constant() {
    sed -n "/public static final String $1 =/,/;/p" "$JAVA_SETTINGS" \
        | sed -n 's/.*"\([^"]*\)".*/\1/p' | head -1
}

kotlin_constant() {
    tr '\n' ' ' < "$KOTLIN_CONSTANTS" \
        | grep -o "const val $1 = *\"[^\"]*\"" | head -1 | sed 's/.*"\(.*\)"/\1/'
}

java_suffixes() {
    sed -n 's/.*packageName + "\([^"]*\)".*/\1/p' "$JAVA_SETTINGS"
}

kotlin_authority_suffix() {
    tr '\n' ' ' < "$KOTLIN_CONSTANTS" \
        | grep -o '"\$packageName\.[a-z][a-z._]*"' | head -1 | sed 's/.*\$packageName\(.*\)"/\1/'
}

compare_identity() {
    local java_value="$1" kotlin_value="$2" label="$3"
    [[ -n "$java_value" && -n "$kotlin_value" ]] \
        || fail "cannot read the $label from both the runtime extension and the patches"
    [[ "$java_value" == "$kotlin_value" ]] \
        || fail "the $label differs: the runtime extension says '$java_value', the patches say '$kotlin_value'"
}

compare_identity "$(java_constant PRIMARY_PACKAGE_NAME)" \
    "$(kotlin_constant RENAMED_PACKAGE_NAME)" "reference package name"
compare_identity "$(java_constant PROVIDER_AUTHORITY)" \
    "$(kotlin_constant CLIPBOARD_PROVIDER_AUTHORITY)" "provider authority"
compare_identity "$(java_constant PERMISSION_READ_CLIPBOARD_HISTORY)" \
    "$(kotlin_constant CLIPBOARD_PERMISSION_NAME)" "signature permission"

JAVA_PERMISSION_SUFFIX="$(java_suffixes | head -1)"
JAVA_AUTHORITY_SUFFIX="$(java_suffixes | sed -n 2p)"
compare_identity "$JAVA_PERMISSION_SUFFIX" \
    "$(kotlin_constant CLIPBOARD_PERMISSION_NAME_SUFFIX)" "permission name suffix"
compare_identity "$JAVA_AUTHORITY_SUFFIX" \
    "$(kotlin_authority_suffix)" "authority suffix"

printf 'release metadata OK (version %s)\n' "$VERSION"
