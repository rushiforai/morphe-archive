#!/bin/bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# SessionStart hook for Claude Code cloud sessions on this repo (patcher-specific-build.md, "Cloud sessions"):
#   1. install the tools of the Android loop: socat, ffmpeg, Tailscale, adb, and Appium with its UiAutomator2
#      driver (it runs in the session; tools/e2e/connect.sh starts it);
#   2. install what AGENTS.md needs to build and check the bundle: JDK 21, the Android SDK, apktool, and the
#      credentials of GitHub Packages, where Morphe's Gradle plugin and patcher are. Morphe Desktop, the patcher,
#      comes from tools/morphe-desktop.sh once the repository is attached to the session.
# Idempotent and quiet; does nothing outside cloud sessions. Joining the tailnet, waking the phone and fetching the
# base APK happen only when a session needs them (tools/e2e/connect.sh), so a session that only edits code never wakes
# the phone.
# Environment needs: network access "Full", and the variables TS_AUTHKEY_CLOUD (a reusable, ephemeral Tailscale auth
# key), E2E_DEVICE_HOST (the device host's name on the tailnet), E2E_APK_CHECKSUM (the clean base APK's sha256) and
# MORPHE_GPR_TOKEN (a classic GitHub token with read:packages; MORPHE_GPR_USER, default JoanComasFdz).
set -uo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

sudo=""
if [ "$(id -u)" -ne 0 ]; then
  sudo="sudo"
fi
warn() { echo "session-start: $*" >&2; }

need=()
command -v socat >/dev/null 2>&1 || need+=(socat)       # the ADB forward through `tailscale nc`
command -v ffmpeg >/dev/null 2>&1 || need+=(ffmpeg)     # GIFs, small screenshot frames
command -v unzip >/dev/null 2>&1 || need+=(unzip)
if [ ${#need[@]} -gt 0 ]; then
  $sudo apt-get update -qq >/dev/null 2>&1
  DEBIAN_FRONTEND=noninteractive $sudo apt-get install -y -qq "${need[@]}" >/dev/null 2>&1 ||
    warn "apt install failed: ${need[*]}"
fi

# Tailscale, static tarball (tailscaled runs in userspace mode, started by tools/e2e/connect.sh).
if ! command -v tailscaled >/dev/null 2>&1; then
  ver=$(curl -fsSL 'https://pkgs.tailscale.com/stable/?mode=json' |
        python3 -c 'import json,sys;print(json.load(sys.stdin)["TarballsVersion"])') &&
    curl -fsSL "https://pkgs.tailscale.com/stable/tailscale_${ver}_amd64.tgz" | $sudo tar xz -C /opt &&
    $sudo ln -sf "/opt/tailscale_${ver}_amd64/tailscale" "/opt/tailscale_${ver}_amd64/tailscaled" /usr/local/bin/ ||
    warn "tailscale install failed"
fi

# What the bundle needs to build and pass its checks (AGENTS.md): JDK 21 for Gradle, the Android SDK with ANDROID_HOME
# (the extensions are Android libraries) and apktool.
TOOLS=/opt/patch-tools
JDK21="$TOOLS/jdk21"
$sudo mkdir -p "$TOOLS"
if [ ! -x "$JDK21/bin/java" ]; then
  $sudo mkdir -p "$JDK21" &&
    curl -fsSL https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/jdk/hotspot/normal/eclipse |
    $sudo tar xz -C "$JDK21" --strip-components=1 || warn "JDK 21 install failed"
fi
ANDROID_SDK=/opt/android-sdk
# adb comes with the SDK's platform-tools package, installed by sdkmanager so the SDK knows it has it. A platform-tools
# folder sdkmanager didn't install (no package.xml, such as an adb link from an older version of this hook) makes the
# Android Gradle plugin install its own copy, as platform-tools-2: remove it so sdkmanager installs the real one.
if [ -d "$ANDROID_SDK/platform-tools" ] && [ ! -f "$ANDROID_SDK/platform-tools/package.xml" ]; then
  $sudo rm -rf "$ANDROID_SDK/platform-tools" "$ANDROID_SDK/platform-tools-2"
fi
if [ ! -d "$ANDROID_SDK/build-tools/35.0.0" ] || [ ! -d "$ANDROID_SDK/platforms/android-35" ] ||
  [ ! -f "$ANDROID_SDK/platform-tools/package.xml" ]; then
  if [ ! -x "$ANDROID_SDK/cmdline-tools/latest/bin/sdkmanager" ]; then
    curl -fsSL -o /tmp/cmdline-tools.zip \
      https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip &&
      $sudo mkdir -p "$ANDROID_SDK/cmdline-tools" &&
      $sudo unzip -qo /tmp/cmdline-tools.zip -d /tmp/cmdline-tools &&
      $sudo rm -rf "$ANDROID_SDK/cmdline-tools/latest" &&
      $sudo mv /tmp/cmdline-tools/cmdline-tools "$ANDROID_SDK/cmdline-tools/latest" ||
      warn "Android command-line tools install failed"
  fi
  (yes 2>/dev/null || true) | $sudo env JAVA_HOME="$JDK21" "$ANDROID_SDK/cmdline-tools/latest/bin/sdkmanager" \
    --sdk_root="$ANDROID_SDK" "platform-tools" "platforms;android-35" "build-tools;35.0.0" >/dev/null 2>&1 ||
    warn "Android SDK packages install failed"
fi
if [ ! -f "$TOOLS/apktool.jar" ]; then
  $sudo curl -fsSL -o "$TOOLS/apktool.jar" \
    https://github.com/iBotPeaches/Apktool/releases/download/v2.10.0/apktool_2.10.0.jar ||
    warn "apktool install failed"
fi
for tool in apktool; do
  if [ -f "$TOOLS/$tool.jar" ] && [ ! -x "/usr/local/bin/$tool" ]; then
    printf '#!/bin/sh\nexec "%s/bin/java" -jar "%s/%s.jar" "$@"\n' "$JDK21" "$TOOLS" "$tool" |
      $sudo tee "/usr/local/bin/$tool" >/dev/null && $sudo chmod +x "/usr/local/bin/$tool"
  fi
done

# Appium, run in the session by tools/e2e/connect.sh against the phone over adb (the device host runs none).
# Pinned: the UiAutomator2 driver's helper apps on the device must match it (server 10.6.6, settings 8.0.9).
# Appium finds adb in $ANDROID_HOME/platform-tools.
APPIUM=/opt/appium
if [ ! -x "$APPIUM/node_modules/.bin/appium" ] || [ ! -d "$APPIUM/home/node_modules/appium-uiautomator2-driver" ]; then
  if command -v npm >/dev/null 2>&1; then
    $sudo mkdir -p "$APPIUM" &&
      $sudo npm install --prefix "$APPIUM" --no-audit --no-fund --loglevel=error appium@3.8.0 >/dev/null 2>&1 &&
      $sudo env APPIUM_HOME="$APPIUM/home" "$APPIUM/node_modules/.bin/appium" driver install uiautomator2@8.7.0 >/dev/null 2>&1 ||
      warn "Appium install failed"
  else
    warn "no npm: Appium not installed"
  fi
fi
# One adb for everything: the SDK's, which Appium and the Android Gradle plugin use, also on PATH for connect.sh (two
# adb versions would restart each other's server).
if [ -x "$ANDROID_SDK/platform-tools/adb" ]; then
  $sudo ln -sf "$ANDROID_SDK/platform-tools/adb" /usr/local/bin/adb
else
  warn "no adb: the Android SDK's platform-tools didn't install"
fi

# Maven Central answers 429 to cloud sessions often, and a Gradle build then fails. Every Gradle build uses Google's
# mirror of it instead: Maven Central's URLs are rewritten wherever a build declares them, before settings are read,
# and the mirror goes first for plugins (plugins.gradle.org redirects to Maven Central). Repositories are only
# rewritten, never added, so a build that declares its own (GitHub Packages) keeps them.
mkdir -p "$HOME/.gradle/init.d"
cat > "$HOME/.gradle/init.d/maven-central-mirror.gradle" <<'GRADLE'
def mirror = 'https://maven-central.storage-download.googleapis.com/maven2/'
def rewrite = { RepositoryHandler repos ->
    repos.withType(MavenArtifactRepository).configureEach { r ->
        def u = r.url.toString()
        if (u.contains('repo.maven.apache.org') || u.contains('repo1.maven.org')) r.url = mirror
    }
}
beforeSettings { s ->
    def plugins = s.pluginManagement.repositories
    rewrite(plugins)
    plugins.whenObjectAdded {
        if (plugins.findByName('centralMirror') == null) {
            def m = plugins.maven { name = 'centralMirror'; url = mirror }
            plugins.remove(m); plugins.add(0, m)
        }
    }
    rewrite(s.dependencyResolutionManagement.repositories)
    s.gradle.allprojects { p -> rewrite(p.buildscript.repositories); rewrite(p.repositories) }
}
GRADLE

# The Plugin Portal also redirects lookups it can't answer to Maven Central, not to the mirror, and a 429 there stops
# Gradle before it asks Google's Maven or GitHub Packages, where Morphe's plugin and the Android Gradle plugin are. It
# skips their groups, which it never holds.
cat > "$HOME/.gradle/init.d/skip-plugin-portal.gradle" <<'GRADLE'
beforeSettings { s ->
    s.pluginManagement.repositories.configureEach { r ->
        if (r.name == 'Gradle Central Plugin Repository') {
            r.content { ['app\\.morphe.*', 'com\\.android.*', 'com\\.google.*', 'androidx.*'].each { g -> excludeGroupByRegex g } }
        }
    }
}
GRADLE

# Morphe's Gradle plugin and patcher are on GitHub Packages, which needs a token with read:packages: the environment's
# MORPHE_GPR_TOKEN, written to ~/.gradle/gradle.properties as gpr.user/gpr.key (settings.gradle.kts reads them).
if [ -n "${MORPHE_GPR_TOKEN:-}" ]; then
  mkdir -p "$HOME/.gradle"
  props="$HOME/.gradle/gradle.properties"
  touch "$props" && sed -i '/^gpr\.\(user\|key\)=/d' "$props"
  printf 'gpr.user=%s\ngpr.key=%s\n' "${MORPHE_GPR_USER:-JoanComasFdz}" "$MORPHE_GPR_TOKEN" >> "$props"
  chmod 600 "$props"
else
  warn "MORPHE_GPR_TOKEN is not set: the bundle can't build (GitHub Packages needs a read:packages token)"
fi

if [ -n "${CLAUDE_ENV_FILE:-}" ] && ! grep -qs "$JDK21" "$CLAUDE_ENV_FILE"; then
  {
    echo "export JAVA_HOME=$JDK21"
    echo "export ANDROID_HOME=$ANDROID_SDK"
    echo "export PATH=$JDK21/bin:\$PATH"
  } >> "$CLAUDE_ENV_FILE"
fi

for variable in TS_AUTHKEY_CLOUD E2E_DEVICE_HOST E2E_APK_CHECKSUM E2E_ADB_KEY; do
  [ -n "${!variable:-}" ] || warn "$variable is not set: the phone won't be reachable (tools/e2e/connect.sh)"
done
# Quiet by design: say it ran, so a run with nothing left to install doesn't look like no run.
echo "session-start hook done: tools in /opt/patch-tools, Android SDK in /opt/android-sdk"
exit 0
