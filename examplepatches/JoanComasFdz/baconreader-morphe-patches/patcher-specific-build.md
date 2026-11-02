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
java -jar morphe-desktop.jar list-patches -o -p -v --patches patches/build/libs/patches-*.mpp
```

`-o`, `-p` and `-v` add each patch's options, packages and versions, which AGENTS.md's "List" check needs. It prints no total: count the patches with `… | grep -c 'Name:'`.

## Patch

```bash
java -jar morphe-desktop.jar patch --patches patches/build/libs/patches-*.mpp --out patched.apk BaconReader.apk
```

- Add `--install` to install on a device connected over ADB.
- The patch's output lists each applied patch; none may fail.

## The e2e bundle

Test-only patches, "E2E fake Reddit" and "E2E inbox envelope label", which the e2e tests use ([tests/BaconReader.E2E/README.md](tests/BaconReader.E2E/README.md)), live in `e2e-patches/`, a Gradle project of its own with its own `.mpp`. `./gradlew buildAndroid` builds it with the main one:

```bash
./gradlew buildAndroid --no-daemon   # also → e2e-patches/build/libs/e2e-patches-<version>.mpp
java -jar morphe-desktop.jar list-patches -o -p -v --patches e2e-patches/build/libs/e2e-patches-*.mpp
java -jar morphe-desktop.jar patch --exclusive --out patched.apk \
  --patches patches/build/libs/patches-*.mpp --enable "Spoof client" \
  --patches e2e-patches/build/libs/e2e-patches-*.mpp --options baseUrl=http://127.0.0.1:5080 --enable "E2E fake Reddit" \
  BaconReader.apk
```

- **Never released.** The release publishes only `patches/build/libs/patches-*.mpp` (`.releaserc`, `patches-bundle.json`). `dev_build.yml` fails when that `.mpp` lists a patch named "E2E …". A test-only patch goes in `e2e-patches/`, and not in the README's or `docs/patches.md`'s tables.
- `--patches` is repeatable, and each `--enable` and `--options` belongs to the `--patches` file before it: a name from the other file is ignored without an error.
- Patches execute in name order, dependencies first, so "E2E fake Reddit" would execute before "Spoof client". It rewrites strings in `finalize` instead, which Morphe runs once every patch, of every file, has executed: after "Spoof client" and after every extension is merged.

## Cloud sessions

In a Claude Code cloud session of the `AndroidDev` environment, `.claude/hooks/session-start.sh` installs what the sections above need: JDK 21, the Android SDK (the extensions are Android libraries), apktool, and the credentials of GitHub Packages, written to `~/.gradle/gradle.properties`. It also installs socat, ffmpeg, Tailscale, adb and Appium 3.8 with the UiAutomator2 driver 8.7 for the phone, and points Gradle at Google's mirror of Maven Central, which often answers 429 to cloud sessions, with the Plugin Portal kept from looking up Morphe's, Android's and Google's plugins (it sends them to Maven Central). It does not touch the phone, and warns (`session-start:`) about anything that failed or any missing variable. A session on this repository runs it on start; no other repository is needed. `JAVA_HOME` is JDK 21 and `ANDROID_HOME` the Android SDK.

The environment needs network access "Full" and these variables, set in the environment's settings and never in the repository:

| Variable | What |
|---|---|
| `TS_AUTHKEY_CLOUD` | A reusable, ephemeral Tailscale auth key, tagged for cloud sessions |
| `E2E_DEVICE_HOST` | The device host's name on the tailnet: the NAS the phone is plugged into |
| `E2E_APK_CHECKSUM` | The sha256 of the clean BaconReader Premium 6.1.4 APK the device host serves |
| `E2E_ADB_KEY` | The one adb private key the phone approved for every cloud session (base64 of an `adbkey` file). `connect.sh` installs it as `~/.android/adbkey`: the phone refuses any other key |
| `MORPHE_GPR_TOKEN` | A classic GitHub token with `read:packages`, for Morphe's Gradle plugin and patcher on GitHub Packages |
| `MORPHE_GPR_USER` | Optional: the token's GitHub user, `JoanComasFdz` by default |

Never print these variables or the environment (`env`, `env | grep E2E_`, `printenv`): a session's transcript keeps what it prints. To check one, use `[ -n "$NAME" ] && echo set || echo "not set"`.

### Morphe Desktop

The session's proxy refuses GitHub release downloads, so the patcher can't come from Morphe Desktop's releases. `tools/morphe-desktop.sh` takes it from the newest unexpired `morphe-desktop` artifact of `dev_build.yml` (which fetches the latest release on every dev build) through GitHub's API, so this repository must be attached to the session first (the add-repo tool). It installs `/opt/patch-tools/morphe-desktop.jar` (~10 s, instant when current) and prints its path. Patch with:

```bash
java -jar /opt/patch-tools/morphe-desktop.jar patch --patches patches/build/libs/patches-*.mpp --out patched.apk <base APK>
```

If every artifact has expired (90 days without a dev build), run `dev_build.yml` once (Actions → Dev build → Run workflow).

### Two-repo sessions

A session created with both BaconReader repos starts in `/home/user`, above the clones, so neither hook runs and no tool is installed. Run each hook by hand once, and then Morphe Desktop's installer, which needs the Morphe repo attached to the session. Each hook ends with "session-start hook done"; any line starting with `session-start:` is a warning.

```bash
cd /home/user
(cd baconreader-reseam-patches && CLAUDE_PROJECT_DIR=$PWD CLAUDE_CODE_REMOTE=true .claude/hooks/session-start.sh)
(cd baconreader-morphe-patches && CLAUDE_PROJECT_DIR=$PWD CLAUDE_CODE_REMOTE=true .claude/hooks/session-start.sh)
baconreader-morphe-patches/tools/morphe-desktop.sh
```

Such a session has no env file for the hooks to write to, and each Bash tool call is a new shell, so nothing exported in one call reaches the next. Set the Android SDK and the JDK in the same call as each command: JDK 17 for Reseam, JDK 21 for Morphe (Morphe Desktop, the Morphe patcher, needs it):

```bash
cd /home/user/baconreader-reseam-patches && ANDROID_HOME=/opt/android-sdk JAVA_HOME=/opt/patch-tools/jdk17 PATH=/opt/patch-tools/jdk17/bin:$PATH ./gradlew bundle --no-daemon
cd /home/user/baconreader-morphe-patches && ANDROID_HOME=/opt/android-sdk JAVA_HOME=/opt/patch-tools/jdk21 PATH=/opt/patch-tools/jdk21/bin:$PATH ./gradlew buildAndroid --no-daemon
cd /home/user/baconreader-reseam-patches && reseam bundle list build/reseam/baconreader-patches.reseam
cd /home/user/baconreader-morphe-patches && /opt/patch-tools/jdk21/bin/java -jar /opt/patch-tools/morphe-desktop.jar list-patches -o -p -v --patches patches/build/libs/patches-*.mpp
```

- Run one Gradle build at a time, with `--no-daemon`. If the first build of the session can't fetch a plugin, from any of its repositories (Maven Central, `git.reseam.app`, GitHub Packages), run it again once.
- Run these calls one after another, not in parallel: parallel Bash calls that `cd` into different repos can run in the wrong folder.
- The Reseam bundle lists one patch more than the Morphe one: "Patches entry in settings", which Morphe has as its internal `settingsPatch`, without a name (the Morphe repo's `docs/patcher-specific-patches.md`, "Settings").
- `tools/compare-patch-lists.sh`, the same file in both repos, lists both built bundles with their JDKs and prints each side's count and the patch names only in one of them, with "Patches entry in settings" as expected. It exits 0 when that is the only difference, 1 when there is another, and 2 when a bundle can't be listed.
- `tools/e2e/connect.sh` is the same file in both repos. Source it from the repo whose tests use it, in the same call as the commands that use the phone: its exports point at that repo's `.e2e/`.

#### E2E tests in a two-repo session

A new scenario goes into both repos, one PR each, and is tested in each repo on its own with that repo's `tools/e2e/record.sh` (AGENTS.md, "End-to-end tests"). It builds the repo's bundle and runs only the scenarios it is given, so each call sets the repo's JDK and sources the repo's `connect.sh`:

```bash
# While working, in each repo (a class takes a minute or two):
cd /home/user/baconreader-reseam-patches && export ANDROID_HOME=/opt/android-sdk JAVA_HOME=/opt/patch-tools/jdk17 PATH=/opt/patch-tools/jdk17/bin:$PATH && source tools/e2e/connect.sh && tools/e2e/record.sh --no-video <TestClass>
cd /home/user/baconreader-morphe-patches && export ANDROID_HOME=/opt/android-sdk JAVA_HOME=/opt/patch-tools/jdk21 PATH=/opt/patch-tools/jdk21/bin:$PATH && source tools/e2e/connect.sh && tools/e2e/record.sh --no-video <TestClass>
```

- Right before each repo's push, the same call with `tools/e2e/record.sh --changed-since origin/main` (Reseam) or `--changed-since origin/dev` (Morphe); right after it, that repo's `tools/e2e/push-gifs.sh`.
- Run the repos one after the other: they share one phone and its lease. Sourcing `connect.sh` again renews the lease; `tools/e2e/connect.sh --down` once, at the end of the session.
- A whole suite is `dotnet test BaconReader.E2E.slnx` in the same call, with the same exports. It runs two projects, the e2e tool's unit tests and the scenarios, and can take longer than a foreground Bash call allows: run it in the background with its output in a file, and follow the file.
- The first `dotnet` run on a new machine prints .NET's welcome text and installs a development certificate, once.
- A session on one repo alone needs none of this: its hook runs on start.

### The phone

```bash
source tools/e2e/connect.sh        # join the tailnet, fetch the base APK, wake Android, forward adb, start Appium, take the lease
tools/e2e/screenshot.sh            # a small JPEG of the screen (.e2e/screen.jpg)
tools/e2e/connect.sh --down        # at the end: release the lease, disconnect, log out
```

`connect.sh` exports `E2E_ADB_SERIAL` (`127.0.0.1:15555`), `E2E_APPIUM_URL` (`http://127.0.0.1:14723`), `E2E_APPIUM_UDID` and `E2E_ARTIFACTS_DIR` (`.e2e/`).

- **One shell per call.** Each Bash tool call is a new shell, so the exports exist only in the call that sourced the script. In later calls use the fixed values (`adb -s 127.0.0.1:15555`, `http://127.0.0.1:14723`) or source it again: that takes ~3 s, keeps the tunnel, the forward and Appium, and renews the lease. Run it with a plain `source`: piped (`… | tee`) or in `$( )` it runs in a subshell and the exports are lost. It warns on stderr when that happens, or when it is run instead of sourced.
- **Base APK.** It is downloaded to `.e2e/com.onelouder.baconreader.premium-6.1.4-clean-base-<first 8 characters of E2E_APK_CHECKSUM>.apk` and refused unless its sha256 is `E2E_APK_CHECKSUM`. `.e2e/` and `*.apk` are ignored by git.
- **The phone.** A Pixel 6 Pro on Android 17, 1080x2340, plugged into the device host (the NAS) by USB and reached over the tailnet: its adbd listens on TCP 5555, and the host keeps it so after a reboot. No root, no `su`. Set up for the tests: no screen lock, no Google account, Stay awake, Do Not Disturb, automatic system updates off, "Verify apps over USB" and Play Protect's scanning off (Play Protect blocks BaconReader as "built for an older version of Android"), animations off (`window_animation_scale`, `transition_animation_scale` and `animator_duration_scale` at 0), brightness 0, charging limited to 80%. `connect.sh` wakes it (the screen on), and the host turns the screen off after 30 minutes with no lease.
- **Heat.** Too warm, Android holds back background jobs: at thermal status 2 (`adb shell dumpsys thermalservice | grep "Thermal Status"`), DownloadManager never saved the image of "Embed comment images"' long press. The phone lies out of its case, on a stand, in the open; check the status before a long run.
- **Lease.** One device is shared: `/data/local/tmp/e2e-lease` holds "<session id> <expiry>" (30 minutes, renewed by sourcing the script again). If `connect.sh` says "device leased by another session", wait; don't break the lease. `--down` removes only this session's lease and says what it did.
- **The link is slow** (~1 to 4 Mbit/s, a new 15 MB APK ~1 minute, ~130 ms per round trip, through a relay; UDP is blocked). Keep transfers small: install only when the APK changed, prefer the UI tree over screenshots, and record screens 576 px wide and at ~1 Mbit/s.
- **Appium's helper apps** stay installed on the device. After the phone is reset, `connect.sh` prints a note and exports `E2E_APPIUM_INSTALL_HELPERS=1`: the first Appium session then runs without the two skip capabilities and with `appium:uiautomator2ServerInstallTimeout` and `appium:adbExecTimeout` well above 20 s.
- **First launch of BaconReader** shows Android's notification permission (on the Pixel 6 Pro, only when BaconReader opens its next screen) and the app's "FINAL RELEASE ANNOUNCEMENT!" dialogs. The e2e tests deny the permission before each scenario, so Android doesn't ask. Install with `adb install -r -g`, or `adb shell pm grant com.onelouder.baconreader.premium android.permission.POST_NOTIFICATIONS`, then tap "GOT IT :(". `pm clear` revokes the permission: grant it again.
- **An error dialog** that stays on the screen: `adb shell am broadcast -a android.intent.action.CLOSE_SYSTEM_DIALOGS`.
- **Appium** isn't on `PATH`: it is `/opt/appium/node_modules/.bin/appium`, with `APPIUM_HOME=/opt/appium/home`. `connect.sh` starts it from there.
- **`--down`** prints one line for each step: what it did with the lease ("lease released", or why not), "logged out of the tailnet", and "disconnected". If something is still running afterwards, the last line says "disconnected, but still running: …".
- **Local ports.** adb on 5555 would show a phantom `emulator-5554`, so the forward uses 15555.
- **Waiting.** Claude's Bash tool blocks a foreground `sleep`: poll for the expected state, or wait in the background.
- **Proxy.** The cloud session's proxy refuses plain HTTPS to github.com (403, release downloads included), while git, GitHub Packages and GitHub's API for attached repositories work.
- **Java's first line.** Every `java` and Gradle run starts with `Picked up JAVA_TOOL_OPTIONS: …`: the cloud session's proxy settings, which the environment sets, not this repo. Drop it before pasting a log into a PR: `… 2>&1 | grep -v '^Picked up JAVA_TOOL_OPTIONS'`.
