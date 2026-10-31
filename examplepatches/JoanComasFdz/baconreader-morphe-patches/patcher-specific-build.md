<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# Patcher-specific: build (Morphe)

How to build, list and patch with Morphe. The steps they serve are in [AGENTS.md](AGENTS.md). Morphe's own docs: [development](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md), [patcher](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md).

## Tools

- JDK 21 or newer.
- A GitHub [personal access token (classic)](https://github.com/settings/tokens/new?scopes=read:packages&description=Morphe) with `read:packages`: Morphe's Gradle plugin and patcher are on GitHub Packages. Put it in `~/.gradle/gradle.properties`, never in the repo:

  ```properties
  gpr.user = <GitHub username>
  gpr.key = <token>
  ```

  Or set `GITHUB_ACTOR` and `GITHUB_TOKEN`.
- [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop), the patcher: `morphe-desktop-*-all.jar` from its releases, or from the `morphe-desktop` artifact `dev_build.yml` uploads. In an AndroidDev cloud session, `tools/morphe-desktop.sh` installs it (see "Cloud sessions").

## Build

```bash
./gradlew buildAndroid --no-daemon
```

Output: `patches/build/libs/patches-<version>.mpp`. Stamp a test build with `-Pversion=<version>-build-<n>`.

Every push to a branch other than `main` runs `dev_build.yml`, which uploads the `.mpp` and the latest Morphe Desktop jar as artifacts. Pushes that only change Markdown, `docs/`, `LICENSE`, `NOTICE` or issue templates skip it.

## List

```bash
java -jar morphe-desktop.jar list-patches --patches patches/build/libs/patches-*.mpp
```

## Patch

```bash
java -jar morphe-desktop.jar patch --patches patches/build/libs/patches-*.mpp --out patched.apk BaconReader.apk
```

- Add `--install` to install on a device connected over ADB.
- The patch's output lists each applied patch; none may fail.

## Cloud sessions

In a Claude Code cloud session of the `AndroidDev` environment, `.claude/hooks/session-start.sh` installs what the sections above need: JDK 21, the Android SDK (the extensions are Android libraries), apktool, and the credentials of GitHub Packages, written to `~/.gradle/gradle.properties`. It also installs socat, ffmpeg, Tailscale, adb and Appium 3.8 with the UiAutomator2 driver 8.7 for the emulator, and points Gradle at Google's mirror of Maven Central, which often answers 429 to cloud sessions. It does not touch the emulator, and warns (`session-start:`) about anything that failed or any missing variable. A session on this repository runs it on start; no other repository is needed. `JAVA_HOME` is JDK 21 and `ANDROID_HOME` the Android SDK.

The environment needs network access "Full" and these variables, set in the environment's settings and never in the repository:

| Variable | What |
|---|---|
| `TS_AUTHKEY_CLOUD` | A reusable, ephemeral Tailscale auth key, tagged for cloud sessions |
| `E2E_EMULATOR_HOST` | The emulator's name on the tailnet |
| `E2E_APK_CHECKSUM` | The sha256 of the clean BaconReader Premium 6.1.4 APK the emulator host serves |
| `MORPHE_GPR_TOKEN` | A classic GitHub token with `read:packages`, for Morphe's Gradle plugin and patcher on GitHub Packages |
| `MORPHE_GPR_USER` | Optional: the token's GitHub user, `JoanComasFdz` by default |

### Morphe Desktop

The session's proxy refuses GitHub release downloads, so the patcher can't come from Morphe Desktop's releases. `tools/morphe-desktop.sh` takes it from the newest unexpired `morphe-desktop` artifact of `dev_build.yml` (which fetches the latest release on every dev build) through GitHub's API, so this repository must be attached to the session first (the add-repo tool). It installs `/opt/patch-tools/morphe-desktop.jar` (~10 s, instant when current) and prints its path. Patch with:

```bash
java -jar /opt/patch-tools/morphe-desktop.jar patch --patches patches/build/libs/patches-*.mpp --out patched.apk <base APK>
```

If every artifact has expired (90 days without a dev build), run `dev_build.yml` once (Actions → Dev build → Run workflow).

### Two-repo sessions

A session created with both BaconReader repos starts in `/home/user`, above the clones, so neither hook runs and no tool is installed. Run each hook by hand, then set the JDK before each build: both builds work on JDK 17, but Morphe Desktop, the Morphe patcher, needs JDK 21.

```bash
cd /home/user
(cd baconreader-reseam-patches && CLAUDE_PROJECT_DIR=$PWD CLAUDE_CODE_REMOTE=true .claude/hooks/session-start.sh)
(cd baconreader-morphe-patches && CLAUDE_PROJECT_DIR=$PWD CLAUDE_CODE_REMOTE=true .claude/hooks/session-start.sh)
export ANDROID_HOME=/opt/android-sdk
# Reseam: JDK 17
export JAVA_HOME=/opt/patch-tools/jdk17 PATH=/opt/patch-tools/jdk17/bin:$PATH
# Morphe, and always for Morphe Desktop: JDK 21
export JAVA_HOME=/opt/patch-tools/jdk21 PATH=/opt/patch-tools/jdk21/bin:$PATH
```

- Run one Gradle build at a time, with `--no-daemon`. If the first build stops on a 429 from Maven Central (through the Gradle Plugin Portal), run it again.
- `tools/e2e/connect.sh` is the same file in both repos: source it from either one.
- A session on one repo alone needs none of this: its hook runs on start.

### The emulator

```bash
source tools/e2e/connect.sh        # join the tailnet, fetch the base APK, wake Android, forward adb, start Appium, take the lease
tools/e2e/screenshot.sh            # a small JPEG of the screen (.e2e/screen.jpg)
tools/e2e/connect.sh --down        # at the end: release the lease, disconnect, log out
```

`connect.sh` exports `E2E_ADB_SERIAL` (`127.0.0.1:15555`), `E2E_APPIUM_URL` (`http://127.0.0.1:14723`), `E2E_APPIUM_UDID` and `E2E_ARTIFACTS_DIR` (`.e2e/`).

- **One shell per call.** Each Bash tool call is a new shell, so the exports exist only in the call that sourced the script. In later calls use the fixed values (`adb -s 127.0.0.1:15555`, `http://127.0.0.1:14723`) or source it again: that takes ~3 s, keeps the tunnel, the forward and Appium, and renews the lease. Run it with a plain `source`: piped (`… | tee`) it runs in a subshell and the exports are lost.
- **Base APK.** It is downloaded to `.e2e/com.onelouder.baconreader.premium-6.1.4-clean-base-<first 8 characters of E2E_APK_CHECKSUM>.apk` and refused unless its sha256 is `E2E_APK_CHECKSUM`. `.e2e/` and `*.apk` are ignored by git.
- **Emulator.** Android 14 (API 34), a Nexus 5 profile at 1080x1920, with `adb root` and `su`. `connect.sh` wakes it (15 to 60 s, ~100 s if it was just recreated), and the emulator host stops it after 3 hours with no connection and no lease. Installed apps and logins survive a stop.
- **Lease.** One device is shared: `/data/local/tmp/e2e-lease` holds "<session id> <expiry>" (30 minutes, renewed by sourcing the script again). If `connect.sh` says "device leased by another session", wait; don't break the lease. `--down` removes only this session's lease and says what it did.
- **The link is slow** (~3 to 4 Mbit/s, ~130 ms per round trip, through a relay; UDP is blocked). Keep transfers small: install only when the APK changed, prefer the UI tree over screenshots, and record screens at 540x960 and ~1 Mbit/s.
- **Appium's helper apps** stay installed on the device. After the emulator is recreated, `connect.sh` prints a note and exports `E2E_APPIUM_INSTALL_HELPERS=1`: the first Appium session then runs without the two skip capabilities and with `appium:uiautomator2ServerInstallTimeout` and `appium:adbExecTimeout` well above 20 s.
- **First launch of BaconReader** shows Android's notification permission and the app's "FINAL RELEASE ANNOUNCEMENT!" dialogs. Install with `adb install -r -g`, or `adb shell pm grant com.onelouder.baconreader.premium android.permission.POST_NOTIFICATIONS`, then tap "GOT IT :(". `pm clear` revokes the permission: grant it again.
- **After a wake** the device clock is set and error dialogs are suppressed; if one still shows, `adb shell am broadcast -a android.intent.action.CLOSE_SYSTEM_DIALOGS`.
- **Local ports.** adb on 5555 would show a phantom `emulator-5554`, so the forward uses 15555.
- **Waiting.** Claude's Bash tool blocks a foreground `sleep`: poll for the expected state, or wait in the background.
- **Proxy.** The cloud session's proxy refuses plain HTTPS to github.com (403, release downloads included), while git, GitHub Packages and GitHub's API for attached repositories work.
