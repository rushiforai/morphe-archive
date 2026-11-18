# FairEmail Patches

Unofficial GPL-3.0-licensed Morphe patch source for the official GitHub FairEmail **1.2337a and 1.2338a** APKs (package `eu.faircode.email`).

**[Add patch source to Morphe Manager](https://morphe.software/add-source?github=rikunode/fairemail-morphe-patches)**

## Included patches

| Patch | Default | What it does |
|---|---|---|
| Permanently hide donation banner | On | Hide the support banner above the mail list |
| Enable local settings export (experimental) | Off | Open FairEmail's existing encrypted account/settings export dialog |
| Enable local Pro features (experimental) | Off | Enable application-local Pro feature checks, without modifying purchase records |
| Enable OAuth setup in re-signed FairEmail (experimental) | Off | Allow OAuth entry from the setup menu in re-signed FairEmail 1.2338; does not impersonate signatures |
| Suppress automatic changelog popup | On | Stop the automatic changelog dialog at startup without removing changelog content or first-run welcome |
| Clone FairEmail alongside official app | **On** | Create a separate `.morphe` installation without selecting Morphe's extra Clone app patch |

The local Pro, encrypted export, and OAuth experiments must be selected manually. The changelog popup suppression and **built-in clone** are ON by default on FairEmail 1.2338. **Deselect the separate universal “Clone app” from Morphe Patches** if using our integrated clone: applying both is untested and may rewrite provider authorities twice.

## Supported original APKs — exact version and SHA-256

| Version | APK (official upstream GitHub release) | SHA-256 |
|---|---|---|
| 1.2337 (v1.2337a) | [FairEmail-v1.2337a-github-release.apk](https://github.com/M66B/FairEmail/releases/download/1.2337/FairEmail-v1.2337a-github-release.apk) | `e8337c82f9829f2c2ad89c04a27af62d74daa3be141558845bd6ee0ddd8c79c8` |
| 1.2338 (v1.2338a) | [FairEmail-v1.2338a-github-release.apk](https://github.com/M66B/FairEmail/releases/download/1.2338/FairEmail-v1.2338a-github-release.apk) | `666b9f4ada53f69199355f1ccc2bed73e01fa23786fc0189cf81cc51932dc5a9` |

The original **GitHub APKs** are pinned by SHA-256. The three initial patches have historical Morphe Desktop application evidence for 1.2337a and 1.2338a; the newer OAuth, changelog and integrated-clone patches target **1.2338 only**. [The 6-patch application regression](https://github.com/rikunode/fairemail-morphe-patches/actions/runs/40826756073) passed against the exact 1.2338a GitHub APK; Android installation and safe in-place updates remain unverified. Other flavors (Google Play, F-Droid, large builds), older and newer versions are **not verified**.

## IMPORTANT — do not delete your existing FairEmail

**Morphe re-signs the APK. A re-signed APK cannot update an official FairCode-signed installation in place and keep app data on an unrooted phone.** Do not use auto-uninstall-on-conflict, clear storage, uninstall official FairEmail, or assume an existing Gmail login will carry over.

In the original FairEmail 1.2338 build, Gmail OAuth setup is gated by FairEmail's local certificate check. The opt-in Morphe OAuth patch changes the local menu gate only. On 2026-10-29, user-supplied Android screenshots verified Google consent, account addition, and reading an incoming Gmail message in a patched environment. SMTP send and delayed token refresh remain **unverified**; the user subsequently confirmed successful account import on a second device, but not new mail sync after import. Never share passwords or backup archives.

**Verification boundary (2026-10-29):** The six-patch code was compiled and applied to the real pinned 1.2338a APK in [GitHub Actions](https://github.com/rikunode/fairemail-morphe-patches/actions/runs/40826756073); clone identity and full Android permission/URI/Provider manifest mapping matched upstream Morphe Clone app in [additional tests](https://github.com/rikunode/fairemail-morphe-patches/actions/runs/40828107268). Android Morphe Manager source loading, Google OAuth consent, account addition and reading a new Gmail message in a modified FairEmail app were shown by user screenshots. An encrypted backup was generated; the user subsequently confirmed successful **account import on another phone**. That report does not yet prove the imported account can receive *new* messages or refresh an expired OAuth token; SMTP send **from the modified app**, in-place clone updates using the same signing key, and on-device changelog suppression also remain unverified. These are release gates rather than reasons to delete working data.

**Historical v0.2.0 evidence (2026-10-28):** [GitHub Actions](https://github.com/rikunode/fairemail-morphe-patches/actions/runs/40550825839) passed; public 43,280-byte MPP checksum `cde8e2184b7c567650c374247b80e20f662d5c9b913c63285e97c4b6053bd225` was verified and the three older patches applied to pinned 1.2337a/1.2338a APKs via Morphe Desktop (unsigned output). Do not mistake this old result for the newer six-patch APK test.

## Use in Morphe Manager

1. Add this repository as a patch source using the link above.
   **For stable v0.3.0, turn OFF Morphe Manager's “Use prerelease patches” setting.** If it remains ON, Morphe may still load the older `dev` channel (`0.2.1-dev.3`) instead of `main` (`0.3.0`). Turning it OFF only changes the patch source channel; it does not update an already installed APK.

2. Provide an unmodified official GitHub FairEmail 1.2337a or 1.2338a APK.
3. Select patches. Export, Pro, and OAuth are disabled by default. Changelog suppression and the new built-in clone are ON by default for FairEmail 1.2338. If you previously used the separate **Morphe Patches → Clone app**, turn that **OFF**; our integrated clone replaces it. Confirm the same package suffix (`.morphe`) and signing key before updating an existing modified clone.
4. For a first installation, prefer a separate test installation. For a previously installed clone, preserve the existing app and signing key, export an encrypted backup, and compare its signer/package with the candidate using the read-only `scripts/check_clone_upgrade.py` before attempting an update. Never uninstall or clear app data simply to overcome an installer mismatch.

This repository ships patch sources and an MPP bundle, **not** a pre-patched FairEmail APK. Preserve the original keystore of any installed Morphe-signed app for later updates.

## Verification and source build

The build uses Java 21 and the Gradle wrapper. CI checks out pinned public Morphe patcher and Gradle plugin commits into the local build-logic directories.

Run `./gradlew :patches:generatePatchesList`, `python scripts/validate_morphe_metadata.py`, `python scripts/validate_morphe_bundle.py`.

**Project stable release: [v0.3.1](https://github.com/rikunode/fairemail-morphe-patches/releases/tag/v0.3.1)** (six patches). The older [v0.2.1-dev.3](https://github.com/rikunode/fairemail-morphe-patches/releases/tag/v0.2.1-dev.3) prerelease is retained for reproducibility. **Stable is the distribution channel, NOT a statement that every opt-in experimental feature is supported on all Android devices.** Gmail OAuth refresh, SMTP sending from the modified app, imported-device new mail sync, changelog suppression on-device and data-preserving clone upgrades remain **unverified**. Read [release notes](docs/RELEASE_NOTES_0.3.0.md), [release readiness audit](docs/RELEASE_READINESS.md) and [safe update/restore instructions](docs/UPGRADE_AND_RESTORE.md).

**Backup privacy:** When the export password is empty, upstream FairEmail 1.2338 writes unencrypted JSON. Always use a nonempty strong password, never post backup files or tokens publicly, and retain the old installed app/data until restoration and token refresh are verified. This independent project is not affiliated with FairEmail, FairCode, or Morphe. Licensed under GPL-3.0. See LICENSE.

## Changelog popup patch scope

FairEmail 1.2338 has a built-in `show_changelog` setting under miscellaneous options. This Morphe patch instead forces that single preference read to `false` only in `ActivityView.checkFirst()`; existing saved settings need not be changed. It does **not** delete `CHANGELOG.md`, hide the first-run welcome dialog, disable a manually opened changelog, or change other preference reads. The 1.2338a GitHub APK DEX was inspected at `ActivityView.checkFirst()V`: the `show_changelog` const-string is immediately followed by `SharedPreferences.getBoolean` and a `move-result`. See the opt-out patch source for strict guards and rationale.

## Clone app: continuity and compatibility

The built-in `Clone FairEmail alongside official app` is adapted from [Morphe's GPLv3 Clone app implementation](https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/clone/CloneAppPatch.kt), preserving its required copyright/license notice and the default `eu.faircode.email.morphe` package ID, plus the option keys `packageName`, `updatePermissions` and `updateProviders`. This means the **intended** identity matches the previously user-tested external Clone app, but an in-place update still depends on an **identical signing key** and needs its own device test.

**Do not enable both clone patches.** Keep the separate Morphe universal Clone app **OFF** when using this bundle's integrated clone. To avoid an incompatible signature/package upgrade, never uninstall or clear the existing clone simply to resolve an installation conflict. Before upgrading an installed signed clone, the read-only `scripts/check_clone_upgrade.py --candidate /path/to/signed-clone.apk` can compare the installed package/version and SHA-256 signing certificate with the candidate without changing any app data. This is an optional safety check, not an automated installation. The integrated clone is limited to the verified original FairEmail 1.2338 for now.

## Patch source name

The Morphe source is named **FairEmail Patches** since v0.3.1, replacing the earlier display name **FairEmail Morphe customizations**. The GitHub repository URL and the six patch names/behaviors remain unchanged. Morphe Manager reads the source name from the MPP manifest after source refresh. If you previously gave this source a custom local display name (via the pencil Rename action), that override takes precedence; rename it locally to **FairEmail Patches** without removing or re-adding the source.

In Morphe Manager, turn **Use prerelease patches OFF** to load the stable `main` release. Updating a patch source name/MPP does **not** update or reinstall an existing FairEmail APK.
