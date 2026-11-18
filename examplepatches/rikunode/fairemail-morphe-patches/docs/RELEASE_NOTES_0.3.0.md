# FairEmail Morphe v0.3.0 — independent project's first six-patch stable distribution

**Unofficial patch bundle, not an upstream FairEmail/FairCode/Morphe release.** The downloadable `.mpp` contains six patches for FairEmail's pinned original GitHub APKs. **Stable refers to the release/distribution channel, not a claim that every experimental feature is proven on every device.**

## Included patches

| Feature | Default | Supported upstream FairEmail |
| --- | --- | --- |
| Clone FairEmail alongside official app | **ON** | 1.2338 |
| Suppress automatic changelog popup | **ON** | 1.2338 |
| Permanently hide donation banner | **ON** | 1.2337 / 1.2338 |
| Enable OAuth setup in re-signed FairEmail **(experimental)** | OFF | 1.2338 |
| Enable local Pro features **(experimental)** | OFF | 1.2337 / 1.2338 |
| Enable local settings export **(experimental)** | OFF | 1.2337 / 1.2338 |

## Evidence supporting release

- GitHub Actions with Java 21: six patches compile into a Morphe Android-compatible MPP (including DEX classes) and correct metadata.
- All six patches apply to SHA-256-pinned upstream FairEmail 1.2338a GitHub APK; rebuilt APK has `eu.faircode.email.morphe` package.
- Manifest permission, provider authority, activity affinity and OAuth/deep-link scheme/host configuration match a pinned standalone official Morphe Clone app APK comparison.
- In testing of earlier patched app builds, Google consent, Gmail account addition and receiving a new mail message were shown. Encrypted settings export produced a nonempty file, and the user reported a successful account import onto another device. **These tests are not a general guarantee of long-term OAuth behavior.**

## Known limitations and required precautions

- **NOT YET VERIFIED ON DEVICE:** SMTP send from the modified FairEmail, automatic OAuth refresh on both devices, synchronizing new email after imported-account restore, data-preserving update from an older Morphe clone with the same signing key, and automatic changelog suppression throughout the app lifecycle.
- **Disable the *separate* Morphe universal “Clone app” patch.** This bundle already includes an integrated Clone patch ON by default for FairEmail 1.2338. Do not apply both.
- **Never uninstall, clear storage, or force-replace an existing official FairEmail or clone to resolve signature mismatch.** A non-destructive update requires the **exact same package name and APK signing certificate**. Keep the prior patched APK and encrypted backup until you successfully test the new installation.
- OAuth, local Pro and export are opt-in experimental features. They do **not** modify Android signing certificates, Google OAuth servers or Play Store purchase records. Provider policies can change.
- Exports may contain live OAuth credentials. Use a **strong nonempty password**; an upstream empty-password export is **plaintext JSON**. Never upload private backups, token state, signing keys or personal logs to GitHub.
- This is a patch bundle, **not a pre-modified or pre-signed APK**. The user must choose the trusted original APK and handle signing securely.

## Exact supported original APKs

- [FairEmail v1.2338a GitHub APK](https://github.com/M66B/FairEmail/releases/download/1.2338/FairEmail-v1.2338a-github-release.apk) — SHA-256 `666b9f4ada53f69199355f1ccc2bed73e01fa23786fc0189cf81cc51932dc5a9` (all six patches).
- [FairEmail v1.2337a GitHub APK](https://github.com/M66B/FairEmail/releases/download/1.2337/FairEmail-v1.2337a-github-release.apk) — SHA-256 `e8337c82f9829f2c2ad89c04a27af62d74daa3be141558845bd6ee0ddd8c79c8` (three older-compatible patches only).

## How to install

1. Add `rikunode/fairemail-morphe-patches` as a Morphe patch source; get the original upstream APK and verify the hash.
   In Morphe Manager, **switch OFF “Use prerelease patches”** so it reads stable `main` instead of the older `dev` preview. Refresh the source and confirm **0.3.0 / six patches** before patching. This does not automatically update an installed clone.

2. Confirm the built-in clone patch is ON; turn the external Morphe universal Clone app OFF.
3. Decide whether to enable experimental OAuth, local Pro and export functions.
4. Patch the **original** APK using Morphe Manager. If updating an existing clone, **confirm the package and signing certificate match** before attempting a data-preserving update; `scripts/check_clone_upgrade.py` provides a read-only preflight.
5. After installing, test inbox, outgoing SMTP, token refresh and restored account sync independently. No existing installation must be uninstalled.

## Licensing and project

- Independent project, GPL-3.0. Clone source attribution and required license header retained.
- Existing v0.2.0 release and older prereleases are unchanged; no personal backups, OAuth credentials, APK signing keys or modified pre-signed APKs are distributed.
- [Open release-test checklist](https://github.com/rikunode/fairemail-morphe-patches/issues/5) tracks unverified device scenarios; report only non-sensitive results.
