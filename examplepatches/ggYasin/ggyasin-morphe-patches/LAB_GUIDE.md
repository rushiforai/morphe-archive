# ggyasin-morphe-patches build and import

This repository builds one local Morphe patch bundle containing the ZenSMS
patches documented in the README. Versioned bundles are also published as
GitHub Release assets. The repository does not register a remote patch source
with Morphe.

## Build with GitHub Actions

1. Open the repository on GitHub.
2. Select **Actions**.
3. Select **Build MPP**.
4. Select **Run workflow**.
5. Open the completed workflow run.
6. Download the `ggyasin-morphe-patches` artifact.
7. Extract the downloaded ZIP to obtain the `.mpp` file.

## Import the local bundle into Morphe Manager

1. Copy the `.mpp` file to the Android device.
2. Open Morphe Manager.
3. Open **Patch sources**.
4. Select **Add patch source**.
5. Select **Select patch source file**.
6. Choose the `.mpp` file from device storage.

Alternatively, open the `.mpp` from an Android file manager and select Morphe
Manager as the app to handle it.

## Patch the test XAPK

1. In Morphe Manager, select ZenSMS.
2. Use Expert mode so patch selection is visible.
3. Choose `ZenSMS_1.2.04.xapk` when prompted for the original app bundle.
4. Enable the patches you want to test:
   - **Enable premium state** changes the existing premium-state checks.
   - **Expanded OTP detection** keeps ZenSMS's original handler and adds
     universal and Persian patterns directly to its stock extractor.
   - **RTL SMS lists** adds a conversation-list switch under
     **Settings → Appearance**. It mirrors the rows while keeping contact
     names and phone numbers left to right and right-aligned.
5. Patch and save the output.
6. Install only on an emulator or disposable test device.

OTP rules are embedded in the patch. Changing them requires updating and
rebuilding the patch bundle.

The patched APK set is signed with Morphe's configured key. It cannot update an
official ZenSMS installation signed by the publisher unless that installation
is removed first. Removing an installed app deletes its local application data.

## Patch Offline Games 3.15.3 or 3.14.1

1. Select `Offline Games_3.15.3.apks` (ARM64, version code `3327`). The older
   `offline_games.xapk` / `Offline_Games_3.14.1.apks` (ARMv7, `3204`) remains
   supported. Use the complete bundle, including the native split.
2. In Expert mode, explicitly select the Offline Games patches you want:
   - **In-house ad only** stops the game from requesting rewarded ads, so its
     own cross-promotion is used every time.
   - **Instant in-house ad close** activates the close button when the popup
     opens, hides the countdown wrapper and sets the counter to zero.
   - **In-house ad not clickable** stops a tap on the in-house ad from opening
     the Play Store.
   - **Fast Offline Games startup** stops startup waiting for Firebase/Remote
     Config and country lookup, and initializes ads in the background.
3. Patch and save the output.
4. For root/mount use, replace the existing mount with this newly patched output,
   force-stop the game and start it again. The shared native-loader dependency
   stages verified libraries from the mounted APK, so it no longer uses the
   original extracted native code. Allow about 110 MB (ARM64) or 88 MB (ARMv7) additional private storage
   on first launch. For a standalone install, use a test device/profile; the
   publisher-signed installation cannot be updated with Morphe's signing key.
5. Trigger a rewarded ad, for example **Save me** in the game-over screen or a
   rewarded-video hint, and confirm the in-house popup appears and can be closed
   straight away. With **In-house ad not clickable** enabled, tapping the ad
   itself should do nothing.

All four patches require the verified ARM64 `3.15.3` (`3327`) or ARMv7 `3.14.1`
(`3204`) library. Known earlier edits are accepted and obsolete ones repaired;
unknown changes or unsupported version/architecture combinations are rejected.
A startup toast and `PatchLabOfflineGames` logcat message now verify the actual
mapped library **after** Unity loads. Note whether it says patched code loaded
or native code NOT verified. An absent message is also useful evidence.
If the countdown still runs, capture that log and the process's `libil2cpp.so`
mapping using the commands in [the native-loading guide](docs/offlinegames-native-loading.md).
For startup testing, compare warm launches offline, online, and online with the
app blocked by the firewall, as described in [the startup guide](docs/offlinegames-startup.md).

## Patch 9GAG 8.23.0

1. Select `9GAG_8.23.0.apk` as the original app.
2. In Expert mode, enable the 9GAG patches you want:
   - **Remove 9GAG ads, promoted posts and trackers (8.23.0)** is on by default.
   - **Deactivate Firebase Analytics (9GAG 8.23.0)** is optional and off by
     default.
3. Do not select the Adobo source at the same time. Its own 9GAG patch targets
   8.17.5 and fails on 8.23.0 with a missing `res/layout/view_aatk_native.xml`.
4. Patch and save the output, then install on an emulator or a disposable test
   device.

The patch is pinned to 9GAG `8.23.0` and to the official signing certificate, so
a re-signed app is rejected rather than patched.

These patches were statically verified against a patched APK, not observed
running. A previous build was reported on-device as still showing a promoted
post and a bottom banner, which motivated the banner, promoted-post and layout
changes included here. Treat that as unconfirmed until you have run this build.
Worth checking: Home, Top, Trending and Fresh feeds, scrolling and pagination,
promoted cards after a refresh, the bottom banner on Home and on comment or
swipe screens, opening comments and media, ordinary posting and voting, and
login persistence.

The blocked-host list is finite. It covers the hosts that were observed being
requested for this version, not every tracker the app may use.
