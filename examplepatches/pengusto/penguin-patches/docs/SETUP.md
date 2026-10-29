# Patch an app

## Before installing

- **Match the original APK exactly.** Open the app's guide from the [catalogue](../README.md#generated-patch-catalogue) and check its version, release variant and SHA-256. Use the specified official upstream release asset. A source-fork build, an already patched APK or another version is not a substitute. Finamp requires the official **1.0.1 universal APK** and produces **ARM64-only output**.
- **Verify your backups before migration.** Patches retain the official package IDs. A patched APK signed with a different certificate cannot update an official installation in place. Read the app's data and migration limits; do not uninstall an existing app merely to bypass a signature conflict.
- **Back up your Morphe signing key.** Keep the same key for future patched updates. Switching patch sources does not itself require a new key. Settings exports may omit local data and account sessions.

## Add the source and patch

1. [Add Penguin Patches to Morphe](https://morphe.software/add-source?github=pengusto/penguin-patches). If the link does not hand off, use **Sources → Add → Remote** in Morphe Manager with `https://github.com/pengusto/penguin-patches`.
2. Select the matching original APK, choose the patches and configure their options. Finamp's three patches are optional and initially off. Infinity+ requires your own authorized Reddit OAuth client; follow its [setup guide](INFINITY.md).
3. Patch, sign with your backed-up key and install. Check the behavior with disposable data before relying on it. Do not install emulator test APKs.

The source follows stable releases from `main`. Enable pre-releases for this source only if you intend to try upcoming `dev` changes.

<details>
<summary>Add the source from another device</summary>

<a href="https://morphe.software/add-source?github=pengusto/penguin-patches"><img src="assets/add-to-morphe-qr.png" alt="QR code: add Penguin Patches as a Morphe source" width="200" height="200"></a>

This local QR encodes only the linked source URL. It is an installation shortcut, not a test result.

</details>

## Verification and limits

Only the declared original APK versions are supported. Each app guide records APK provenance, checks and open limits, distinguishing patched official APKs from separately tested source-fork implementations. A successful build alone does not establish compatibility. Recorded checks are prior evidence; they do not all run automatically on every commit.

Finamp v1.1.0 passes [actual Android Morphe Manager 2.2.0 acceptance](../tests/finamp/evidence/2026-10-28-manager/README.md) on an Android 15 / API 35 ARM64 emulator, including source download, patching, signing/export, update/start and retained fixture settings. [Original-APK evidence](../tests/finamp/evidence/2026-10-28/README.md) documents its separate native and UI checks.

Physical devices remain unverified. Other apps retain their guide-specific Manager, sync, storage and carrier limitations. Emulator results do not establish phone or real-account acceptance. See the [verification record](VERIFICATION.md) and each app's guide.

## Report a problem

[Open an issue](https://github.com/pengusto/penguin-patches/issues/new/choose) with the original app version, selected patches, Android/Morphe versions and minimal reproduction steps. Remove personal contacts, messages, calendar data, Reddit account names, OAuth codes/tokens and signing material from reports.
