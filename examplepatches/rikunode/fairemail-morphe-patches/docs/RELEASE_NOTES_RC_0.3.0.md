# FairEmail Morphe v0.3.0-rc.1 — public release candidate

This is an **unofficial, independent** GPL-3.0 Morphe patch bundle for the original FairEmail GitHub APKs. It is **not** a FairEmail/FairCode or Morphe official upstream release. This release candidate is for installation and compatibility testing; the existing stable v0.2.0 remains available and unchanged.

## What's new versus v0.2.0

Six patches total, with their defaults:

- **Clone FairEmail alongside official app — ON** (FairEmail 1.2338 only). Uses the same `eu.faircode.email.morphe` package name and provider authority mapping as Morphe's standalone Clone app. **Uncheck the external Morphe Patches → Clone app; do not use both.**
- **Suppress automatic changelog popup — ON** (1.2338 only). Keeps manual changelog available.
- **Permanently hide donation banner — ON** (1.2337/1.2338).
- **Enable OAuth setup in re-signed FairEmail — OFF (experimental)** (1.2338 only). Enables local OAuth setup entry, does not spoof Android signing or change Google OAuth servers.
- **Enable local Pro features — OFF (experimental)** (1.2337/1.2338). App-local checks only, no Play purchases modified.
- **Enable local settings export — OFF (experimental)** (1.2337/1.2338). Makes existing backup-export interface available.

## Verified evidence

- GitHub Actions Java 21/Kotlin build, Android `.mpp` DEX, and six-patch metadata validated.
- All six patches applied to the SHA-256 pinned upstream FairEmail 1.2338a APK; rebuilt APK verified to have the cloned package name.
- Exact provider authority, permission and Android deep-link configuration parity with pinned Morphe universal Clone app.
- In an earlier development build, user screenshots showed Google consent, account addition and receiving newly sent Gmail mail; an encrypted account/settings backup was created and import onto another device was user-reported successful.

## Known limitations — important

- **NOT YET VERIFIED:** Gmail SMTP sending *from* the patched app, refresh after OAuth token expiry, new mail synchronization after restoring on the destination phone, and updating an existing signed clone in place while retaining private data.
- Auto-changelog suppression in a full device lifecycle is not independently confirmed.
- The included clone is tested in APK CI, but **not yet a proven safe upgrade** of an existing clone. Android requires the **same APK package AND same signing key** for a non-destructive update.
- Google OAuth behavior depends on the provider and account configuration; success on one phone is not a general compatibility guarantee. The experimental OAuth patch is OFF by default.
- Do not publish the backup, OAuth credentials, signing key or personal logs in issues.
- FairEmail backup export with an **empty password is unencrypted JSON**; choose a strong nonempty password.

## Installation and safety

1. Obtain the [original FairEmail 1.2338a GitHub APK](https://github.com/M66B/FairEmail/releases/download/1.2338/FairEmail-v1.2338a-github-release.apk); expected SHA-256 `666b9f4ada53f69199355f1ccc2bed73e01fa23786fc0189cf81cc51932dc5a9`.
2. Add the repository as a Morphe patch source, select the release candidate bundle (or download the attached `.mpp`), choose optional features, **disable the separate universal Clone app**.
3. Generate a clone; do not uninstall or clear data of the official FairEmail app or your existing clone.
4. If upgrading an existing clone, first preserve a password-protected backup; use the same package and signing key. See `docs/UPGRADE_AND_RESTORE.md` and `scripts/check_clone_upgrade.py` (read-only compatibility check).

**Distribution:** the downloadable artifact is a **patch bundle**, *not* a signed or modified FairEmail APK. Private keys and account backups are never included.

**Source/licensing:** GPL-3.0; integrated clone code retains upstream Morphe/ReVanced copyright/attribution notice. See repository `LICENSE` and source files.

**Final stable promotion:** device checks and verified release hash are tracked at [release gate issue #5](https://github.com/rikunode/fairemail-morphe-patches/issues/5).
