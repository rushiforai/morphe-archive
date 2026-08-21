#!/usr/bin/env bash
# Idempotent Cloud Agent bootstrap for HH Patches.
#
# Prepares the full patch development + application workflow:
#   * npm release tooling
#   * the Morphe Gradle toolchain, then compiles the patches (.mpp)
#   * the Morphe Desktop CLI (`morphe`) used to apply patches to an APK
#   * adb (optional companion for installing patched APKs)
set -euo pipefail

cd "$(dirname "$0")/.."

# Pinned Morphe Desktop (CLI + GUI) release. Override with MORPHE_DESKTOP_VERSION.
MORPHE_DESKTOP_VERSION="${MORPHE_DESKTOP_VERSION:-1.13.1}"
MORPHE_HOME="/opt/morphe"
MORPHE_JAR="${MORPHE_HOME}/morphe-desktop-${MORPHE_DESKTOP_VERSION}-all.jar"
MORPHE_BIN="/usr/local/bin/morphe"

# Wrap sudo so the script also works where it is unavailable.
if command -v sudo >/dev/null 2>&1 && sudo -n true >/dev/null 2>&1; then
  SUDO="sudo"
else
  SUDO=""
fi

# ---------------------------------------------------------------------------
# GitHub Packages credentials for Gradle.
#
# The Morphe patcher plugin/library live on GitHub Packages
# (maven.pkg.github.com/MorpheApp/registry). Even though those packages are
# public, the Maven endpoint requires a token with the `read:packages` scope,
# so a GitHub PAT must be supplied. settings.gradle.kts reads the `gpr.user` /
# `gpr.key` Gradle properties (falling back to GITHUB_ACTOR / GITHUB_TOKEN),
# so mirror the provided secrets into ~/.gradle/gradle.properties.
# ---------------------------------------------------------------------------
GPR_USER_VALUE="${GPR_USER:-${GITHUB_ACTOR:-}}"
GPR_KEY_VALUE="${GPR_KEY:-${GITHUB_TOKEN:-}}"

mkdir -p "$HOME/.gradle"
GRADLE_PROPS="$HOME/.gradle/gradle.properties"
touch "$GRADLE_PROPS"

if [[ -n "$GPR_KEY_VALUE" ]]; then
  # Rewrite the gpr.* lines idempotently, preserving any other properties.
  grep -v -E '^gpr\.(user|key)=' "$GRADLE_PROPS" > "$GRADLE_PROPS.tmp" 2>/dev/null || true
  mv "$GRADLE_PROPS.tmp" "$GRADLE_PROPS"
  {
    echo "gpr.user=${GPR_USER_VALUE:-cursor}"
    echo "gpr.key=${GPR_KEY_VALUE}"
  } >> "$GRADLE_PROPS"
  HAVE_GPR=1
else
  echo "WARNING: No GPR_KEY (or GITHUB_TOKEN) found in the environment." >&2
  echo "         Gradle cannot resolve the Morphe packages and the build will be skipped." >&2
  echo "         Add a GitHub PAT with the read:packages scope as the GPR_KEY secret." >&2
  HAVE_GPR=0
fi

# ---------------------------------------------------------------------------
# JavaScript release tooling (semantic-release, changelog generator, etc.).
# ---------------------------------------------------------------------------
npm install

# ---------------------------------------------------------------------------
# Compile the patches. This warms the Gradle wrapper + dependency caches and
# validates that the Morphe toolchain resolves correctly.
# ---------------------------------------------------------------------------
if [[ "$HAVE_GPR" == "1" ]]; then
  ./gradlew :patches:buildAndroid --no-daemon
fi

# ---------------------------------------------------------------------------
# Morphe Desktop CLI. This is the tool that applies the built patches to an
# APK: `morphe patch -p patches-*.mpp app.apk`. CLI mode runs headless and
# needs no extra components. Installed as a small `morphe` wrapper on PATH.
# ---------------------------------------------------------------------------
if [[ ! -f "$MORPHE_JAR" ]]; then
  echo "Installing Morphe Desktop CLI v${MORPHE_DESKTOP_VERSION}..."
  TMP_JAR="$(mktemp)"
  curl -fsSL --retry 4 --retry-delay 2 -o "$TMP_JAR" \
    "https://github.com/MorpheApp/morphe-desktop/releases/download/v${MORPHE_DESKTOP_VERSION}/morphe-desktop-${MORPHE_DESKTOP_VERSION}-all.jar"
  $SUDO mkdir -p "$MORPHE_HOME"
  $SUDO cp "$TMP_JAR" "$MORPHE_JAR"
  rm -f "$TMP_JAR"
else
  echo "Morphe Desktop CLI v${MORPHE_DESKTOP_VERSION} already present, skipping download."
fi
# Ensure the jar is world-readable regardless of install path.
$SUDO chmod 644 "$MORPHE_JAR"

# (Re)create the `morphe` launcher so it always points at the pinned jar.
$SUDO tee "$MORPHE_BIN" >/dev/null <<EOF
#!/usr/bin/env bash
exec java -jar "${MORPHE_JAR}" "\$@"
EOF
$SUDO chmod +x "$MORPHE_BIN"

# ---------------------------------------------------------------------------
# adb (Android platform tools) - optional companion for installing patched
# APKs onto a connected device. Best-effort; not fatal if unavailable.
# ---------------------------------------------------------------------------
if ! command -v adb >/dev/null 2>&1; then
  if [[ -n "$SUDO" ]]; then
    $SUDO apt-get update -y >/dev/null 2>&1 \
      && $SUDO DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends adb >/dev/null 2>&1 \
      && echo "Installed adb." \
      || echo "WARNING: could not install adb (non-fatal)." >&2
  fi
fi

echo "Bootstrap complete. Morphe CLI: $(command -v morphe || echo "$MORPHE_BIN")"
