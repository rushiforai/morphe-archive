#!/usr/bin/env bash
#
# Build the Twitter Bookmarker patch bundle (patches-*.mpp) from the pinned Piko
# checkout. The patch sources live in overlay/ and are copied on top of upstream;
# nothing upstream is forked or edited in place.
#
# Usage:
#   morphe/build.sh                 # fetch the pin, apply the overlay, build
#   morphe/build.sh --refresh       # re-fetch the pin before building
#   GITHUB_TOKEN=ghp_... morphe/build.sh
#
# Requires a GitHub token with the read:packages scope — Morphe publishes its
# patch library to GitHub Packages, and that registry refuses anonymous reads.
# See morphe/README.md for the one-time `gh auth refresh` command.

set -euo pipefail

UPSTREAM_URL="https://github.com/crimera/piko.git"
UPSTREAM_COMMIT="50744aa07bb41c4e1f942a06614ef4e6f2e3610c"
UPSTREAM_LABEL="Piko v3.9.0"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK="$ROOT/.upstream"
OUT="$ROOT/out"

REFRESH=0
for arg in "$@"; do
    case "$arg" in
        --refresh) REFRESH=1 ;;
        -h | --help)
            sed -n '2,15p' "${BASH_SOURCE[0]}"
            exit 0
            ;;
        *)
            echo "error: unknown argument: $arg" >&2
            exit 2
            ;;
    esac
done

die() {
    echo "error: $*" >&2
    exit 1
}

note() {
    echo "==> $*"
}

# --- prerequisites ----------------------------------------------------------

command -v java >/dev/null 2>&1 || die "java not found; install a JDK (upstream CI builds with JDK 17)"
command -v git >/dev/null 2>&1 || die "git not found"

JAVA_MAJOR="$(java -version 2>&1 | head -1 | sed -E 's/.*version "([0-9]+).*/\1/')"
case "$JAVA_MAJOR" in
    '' | *[!0-9]*) note "could not read the java version; continuing anyway" ;;
    17 | 21) note "java $JAVA_MAJOR" ;;
    *) note "warning: java $JAVA_MAJOR; upstream CI uses 17, and newer JDKs may be rejected by the Android plugin" ;;
esac

if [ -z "${ANDROID_HOME:-}" ] && [ -z "${ANDROID_SDK_ROOT:-}" ]; then
    if [ -d "$HOME/Android/Sdk" ]; then
        export ANDROID_HOME="$HOME/Android/Sdk"
        note "ANDROID_HOME unset; using $ANDROID_HOME"
    else
        die "ANDROID_HOME/ANDROID_SDK_ROOT unset and ~/Android/Sdk missing; the extension modules are Android libraries"
    fi
fi

if [ -z "${GITHUB_TOKEN:-}" ] && ! grep -qs '^gpr.key' "$HOME/.gradle/gradle.properties"; then
    die "no GitHub Packages credentials. Morphe publishes its patch library to
       GitHub Packages (maven.pkg.github.com/MorpheApp/registry), which needs a
       token with the read:packages scope. Either:
         gh auth refresh -h github.com -s read:packages
         GITHUB_TOKEN=\$(gh auth token) morphe/build.sh
       or put gpr.user / gpr.key in ~/.gradle/gradle.properties."
fi

if [ -n "${GITHUB_TOKEN:-}" ]; then
    export GITHUB_ACTOR="${GITHUB_ACTOR:-$(gh api user --jq .login 2>/dev/null || echo token)}"
    note "authenticating to GitHub Packages as $GITHUB_ACTOR"
fi

# --- pinned checkout --------------------------------------------------------

if [ ! -d "$WORK/.git" ]; then
    note "cloning $UPSTREAM_URL"
    git clone --quiet "$UPSTREAM_URL" "$WORK"
    REFRESH=0
fi

if [ "$REFRESH" = "1" ]; then
    note "fetching upstream"
    git -C "$WORK" fetch --quiet origin
fi

if ! git -C "$WORK" cat-file -e "$UPSTREAM_COMMIT^{commit}" 2>/dev/null; then
    note "fetching the pinned commit"
    git -C "$WORK" fetch --quiet origin "$UPSTREAM_COMMIT" || git -C "$WORK" fetch --quiet origin
fi

note "checking out $UPSTREAM_LABEL ($UPSTREAM_COMMIT)"
git -C "$WORK" checkout --quiet --force "$UPSTREAM_COMMIT"
# Removes the previous overlay and every build output, so each build starts from
# exactly the pinned tree.
git -C "$WORK" clean --quiet -fdx -e .gradle

# --- overlay ----------------------------------------------------------------

note "applying the Twitter Bookmarker overlay"
cp -R "$ROOT/overlay/." "$WORK/"

# --- build ------------------------------------------------------------------

# Optional. Without it the bundle is named patches-unspecified.mpp, which works
# but says nothing; CI sets it to the release version so the file name matches
# the tag it is published under.
VERSION_ARG=()
if [ -n "${BUNDLE_VERSION:-}" ]; then
    VERSION_ARG=("-Pversion=$BUNDLE_VERSION")
    note "version: $BUNDLE_VERSION"
fi

note "building the patch bundle (this needs network the first time)"
(
    cd "$WORK"
    # The bundle itself is the `jar` output: the Morphe plugin renames the jar to
    # .mpp. `buildAndroid` is what makes it installable on a phone — it D8-compiles
    # the patch classes and merges classes.dex into that same file, which is how
    # Morphe Manager (running on Android) can load the patches at all.
    #
    # Order matters, and it is not the obvious one: `generatePatchesList` writes
    # patches-list.json next to the bundle and does not touch it, but running any
    # later Gradle invocation makes `jar` run again — which rewrites the .mpp from
    # the classes and silently drops the dex. So packaging and checks happen first
    # and `buildAndroid` is last, and then the content check below verifies it.
    ./gradlew --no-daemon --console=plain "${VERSION_ARG[@]+"${VERSION_ARG[@]}"}" \
        clean :patches:checkStringResources :patches:generatePatchesList
    ./gradlew --no-daemon --console=plain "${VERSION_ARG[@]+"${VERSION_ARG[@]}"}" buildAndroid
)

mkdir -p "$OUT"
rm -f "$OUT"/patches-*.mpp
# Gradle also emits -sources and -javadoc variants next to the real bundle. Only
# the plain one is installable, and a release must carry exactly one .mpp: a
# patch manager that finds three assets has three things to pick from.
for artifact in "$WORK"/patches/build/libs/patches-*.mpp; do
    case "$artifact" in
        *-sources.mpp | *-javadoc.mpp) continue ;;
    esac
    cp "$artifact" "$OUT/"
done

note "artifacts in $OUT"
for artifact in "$OUT"/patches-*.mpp; do
    note "  $(basename "$artifact")  $(sha256sum "$artifact" | cut -d' ' -f1)"
done

# A bundle missing any of these still lists its patches and still patches fine
# in a desktop CLI, so nothing else would notice: classes.dex is what lets Morphe
# Manager apply a patch on a phone, twitter.mpe is the extension code the patch
# calls into, and the two drawables are the button's own icons (without them the
# button silently borrows an app icon, which is how it became indistinguishable
# from the native bookmark). A silent miss would only surface after install.
bundle="$(ls -1 "$OUT"/patches-*.mpp | head -1)"
if command -v unzip >/dev/null 2>&1; then
    entries="$(unzip -Z1 "$bundle")"
elif command -v jar >/dev/null 2>&1; then
    entries="$(jar tf "$bundle")"
else
    entries=""
    note "warning: neither unzip nor jar is available; skipping the content check"
fi

if [ -n "$entries" ]; then
    missing=()
    for required in classes.dex extensions/twitter.mpe; do
        grep -qx "$required" <<<"$entries" || missing+=("$required")
    done
    # The icons are matched by name rather than by full path: the container layout
    # inside the bundle is the patch library's business, not ours. Both a root
    # entry and a nested one count.
    for required in ic_twb_bookmark.xml ic_twb_bookmark_saved.xml; do
        grep -qx "$required" <<<"$entries" || grep -q "/$required\$" <<<"$entries" || missing+=("$required")
    done
    if [ "${#missing[@]}" -gt 0 ]; then
        die "$(basename "$bundle") is missing ${missing[*]}; a patch manager cannot load it"
    fi
    note "bundle contains classes.dex, extensions/twitter.mpe and both button icons"
fi
