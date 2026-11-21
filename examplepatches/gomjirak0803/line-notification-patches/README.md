# LINE notification patches

**English**: README.md | **한국어**: [README.ko.md](README.ko.md)

* **Morphe remote source**: https://github.com/gomjirak0803/line-notification-patches
* **Latest release**: [v0.1.11-dev](https://github.com/gomjirak0803/line-notification-patches/releases/tag/v0.1.11-dev) · [Publication status](docs/PUBLICATION_STATUS.md) · [Device test matrix](docs/DEVICE_TESTS.md)
* **One-click add**: [Add source to Morphe Manager](https://morphe.software/add-source?github=gomjirak0803/line-notification-patches) *(enable **Pre-release patches** and **Experimental app versions**)*

Independent experimental notification-control patches for **LINE `26.16.0`** (`jp.naver.line.android`, `versionCode 261600106`, `minSdk 30`), built for **Morphe Patcher 2.3.0**. This project is not authored by or affiliated with LINE, LY Corporation, or Morphe.

## Patches

All patches target `jp.naver.line.android` `26.16.0` (`261600106`) APKM. Including a patch in the APK is separate from enabling it: **every feature switch starts disabled inside LINE.** OpenChat, ServiceChat, call, and ongoing/foreground notifications are left untouched.

| Patch | Default | Behavior and scope |
| --- | --- | --- |
| **Notification settings** | `true` | Adds an **알림 패치 설정** (Notification Patch Settings) row below Profile in LINE's main Settings using LINE's own header, typography, and switch drawables. Supports Android 11–16 (`targetSdk 36` edge-to-edge window insets). |
| **Not Too Much Silent** | `false` | Converts LINE's existing **Mute / Unmute** toggle in the chat menu, **chat-list long-press menu**, and notification shade into a local silent mode: server push delivery stays enabled while this device posts on a silent `IMPORTANCE_LOW` channel (`line_notification_patches.silent.v1`). Updates the chat-list muted bell icon and menu label locally without mutating LINE's stored model. Adds **알림 완전히 숨기기** (Hide completely) in the chat menu to invoke LINE's native mute + local suppression. Never bypasses OS-blocked notification channels. |
| **More Chat Info** | `false` | Renders up to 25 recent local unread messages in chronological order using Android's public `Notification.MessagingStyle`, with LINE's native total unread count shown as `Room Name  [N]`. Displays sender profile avatars in expanded notifications by reusing LINE's original notification icon (1:1) and reading LINE's local Glide cache only (`onlyRetrieveFromCache(true)`) for multi-sender group chats. |
| **No reply** | `false` | Disables system-generated contextual actions, generated replies, and smart-reply choices while keeping LINE's manual inline reply button and original `PendingIntent`. |
| **Mark as read** | `false` | Replaces the notification mute button on individual regular-chat notifications with **읽음 (Mark as read)** using LINE's native chat-list read updater (`qg3.e`) and room notification cleanup (`fw3.h`). Marks the entire chat as read, holds the button until local storage catches up, and works independently of `More Chat Info`. Never added to multi-room summary notifications. |
| **Restore push registration** | `false` | **Optional separate patch** for re-signed builds where Firebase Installations (`firebaseinstallations.googleapis.com`) rejects the re-signed certificate (`FisError: BAD CONFIG`). Replaces only the `X-Android-Cert` header value on the FIS request builder with LINE's original lineage-root SHA-1; does not modify Remote Config, LINE auth/messaging protocols, or Play Integrity, and does not require microG. |

> Disabling **Not Too Much Silent** stops applying local quiet state and falls back to LINE's native settings. Rooms explicitly marked **Hide completely** also have LINE's native notifications turned off and remain off until unhidden.

## Recent releases

* **`v0.1.11-dev`**: Shows sender profile avatars inside expanded `More Chat Info` (`MessagingStyle`) notifications using original icons (1:1) and LINE's local Glide cache only (`onlyRetrieveFromCache(true)`) for group chats; moves trailing 400ms refresh to a background worker. Verified on S10e Android 12 + 1,075 static APK contracts (ARM64 & Universal).
* **`v0.1.10-dev`**: Fixes Android 15/16 (`targetSdk=36`) edge-to-edge header overlap on `SettingsPage`, isolates `More Chat Info` DB read exceptions so legitimate notifications are never dropped, removes unused `NotificationBadgeResources.kt`, and adds `extras` null guards. Verified on Android 16 AOSP emulator, Galaxy S22 Ultra (Android 16 / One UI 8.0 diagnostic), and S10e (Android 12 / One UI 4.1).
* **`v0.1.9-dev`**: Extends `Not Too Much Silent` to the chat-list long-press mute/unmute menu and chat-list muted bell icon/label; fixes `patches-bundle.json` `created_at` formatting for Morphe Manager `2.6.0` remote updates; verified offline `Mark as read` + Wi-Fi reconnect on S10e.
* **`v0.1.8-dev` – `v0.1.0`**: Initial notification suite, `MessagingStyle` rewrite, timestamp-ordered SQL selection for batched pushes, trailing save-completion refresh, and native chat-list `Mark as read`. See [Device test matrix](docs/DEVICE_TESTS.md) for per-version verification details.

## Usage in Morphe Manager

1. Use Morphe Manager supporting **Patcher 2.3.0** (verified on Morphe Manager `2.6.0`).
2. Open [Add source to Morphe Manager](https://morphe.software/add-source?github=gomjirak0803/line-notification-patches) or go to **Sources → + → Remote** and enter `https://github.com/gomjirak0803/line-notification-patches`. See [official Morphe patch sources guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md).
3. On the source card, enable **Pre-release patches** and **Experimental app versions**.
4. Enable **Expert mode**, supply your own official **LINE `26.16.0` (`261600106`) full APKM bundle** (do not use a standalone extracted `base.apk`), and select the desired patches. Include **Restore push registration** if background push registration fails on a re-signed install. See [official Expert mode guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md).
5. Install the patched APK. Because the signature differs from official LINE, an in-place overwrite over official LINE will fail. **Back up your chats and verify account recovery methods before uninstalling official LINE.**
6. Open LINE → **Settings → 알림 패치 설정** (below Profile) and enable the switches you want.
   * Rooms already muted natively on an older version or another device are not bulk-migrated. Run **Unmute → Mute** once on that room to move it to local quiet mode.
   * The silent channel is created without sound, vibration, or heads-up; any subsequent user changes in Android notification settings are respected by the OS.

## Building from source (Windows x64)

Releases are produced via GitHub Actions (`Actions → Release → Run workflow` on `main`) using the pinned standalone Python build scripts (the template's npm semantic-release workflow is unused). Requires Python 3.11+:

```powershell
python scripts/bootstrap.py
python scripts/build.py
python scripts/validate.py
```

* `scripts/bootstrap.py`: Downloads pinned JDK 21.0.13+9, Kotlin 2.4.21, Morphe Desktop 2.1.1, and Android SDK tools into `.tools/` with SHA-256 verification and Zip Slip checks. Never downloads or installs LINE.
* `scripts/build.py`: Runs `NotificationPolicy` unit tests (86 assertions), SQLite history regression tests, compiles the Java extension and Kotlin patches, converts to DEX with D8, packages `patches/build/libs/line-notification-patches-<version>.mpp`, and verifies patch loading via Morphe Desktop.
* `scripts/validate.py`: Requires the two pinned original APKM files in `apk/` (not distributed in this repo), applies all patches with `--validate --bytecode-mode FULL`, and executes `ApkContractTest` (1,075 contract assertions each for ARM64 & Universal, plus 1,035 for `Mark as read`-only). Does not sign or install.
* `scripts/sign_test.py`: Optional local helper to sign the validated ARM64 APK using a persistent local key under gitignored `.tools/signing/`.
* Standard Gradle build files (`./gradlew buildAndroid`) are also retained for environments with GitHub Packages credentials.

## Privacy, data handling, and limitations

* **Read-only local inspection**: Reads LINE's local SQLite databases (`naver_line`, `contact`) with `SQLiteDatabase.OPEN_READONLY` and reads sender avatars exclusively from LINE's local Glide cache (`onlyRetrieveFromCache(true)`). No external servers, telemetry, background polling, image downloads, or chat log exports exist in the extension.
* **Native user-initiated server calls**: Toggling room notifications (`ue3.k.p`) or pressing **Mark as read** (`qg3.e.e`) invokes LINE's existing internal handlers on explicit user action, which triggers LINE's normal server sync. Because quiet mode keeps server push subscriptions enabled and silences locally, **other devices (PC, tablet, secondary phone) may still show that chat as notifications enabled.**
* **Privacy & lock screen**: Respects LINE's **Show message preview** setting (no message body lookup when disabled), keeps `VISIBILITY_PRIVATE` and `publicVersion` redaction, and rechecks active account and read boundaries before posting.
* **Debug logging**: `LineNotifyPatch` logs are disabled by default (`Log.isLoggable`) and output only fixed stage names—never account IDs, chat IDs, message text, or exception messages.
* **No ban-safety guarantee**: Minimizing patch scope does not mean LY/LINE's Terms of Service permit modified or re-signed clients. **No guarantee against account restriction or service disruption can be made.** Use at your own risk and maintain backups.
* **No proprietary assets distributed**: Original/patched LINE APKs, APKMs, signing keys, tokens, and private logs are never published in this repository or its releases.

## Documentation

* [Compatibility & DEX implementation notes](docs/COMPATIBILITY.md)
* [Device & cross-environment test matrix](docs/DEVICE_TESTS.md)
* [Publication status & release hashes](docs/PUBLICATION_STATUS.md)
* [Publishing & Morphe import guide](docs/PUBLISHING.md)
* [Pre-publication provenance & compliance audit](docs/PUBLICATION_AUDIT.md)
* [Android MessagingStyle reference notes](docs/KAKAO_NOTIFICATION_REFERENCE.md)
* [Local Official Account test sender tool](docs/TEST_BOT.md) *(developer tool; not bundled in `.mpp`)*

## License & attribution

Licensed under [GPL-3.0](LICENSE) with the additional naming notice retained in [NOTICE](NOTICE). See [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) for full provenance and modification notices. Not affiliated with or endorsed by LINE, LY Corporation, or Morphe.
