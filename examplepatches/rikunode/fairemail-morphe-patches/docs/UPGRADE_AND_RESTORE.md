# Safe install, upgrade and encrypted restore

This is an **unofficial patch bundle** for upstream FairEmail. All operations on phones should preserve the existing official FairEmail app and user data.

## Fresh installation

1. Obtain the unmodified upstream GitHub FairEmail 1.2338a APK and verify SHA-256 `666b9f4ada53f69199355f1ccc2bed73e01fa23786fc0189cf81cc51932dc5a9`.
2. In Morphe Manager select this project's bundle from the desired stable/dev channel. Opt-in OAuth, Pro and export features explicitly if required.
3. For FairEmail 1.2338, the integrated `Clone FairEmail alongside official app` patch is **ON by default**, using the same package suffix `.morphe` as the Morphe universal Clone app. **Turn off the separate Morphe Patches → Clone app** to prevent double transformation. The original official app remains installed.
4. Build and install. **Do not uninstall or clear storage** of either existing app merely to resolve a signature error.
5. For Gmail, test the OAuth browser flow, inbox sync and SMTP sending from the *modified* application.

## Updating an installed modified clone

- **Backup first.** Export encrypted settings with a nonempty strong password; retain the old working APK and patch source.
- **Keep the same package name and signing certificate.** Android will not accept an app-data-preserving update of an existing package if the signing key has changed. A **read-only preflight** is available before any attempted install: `python scripts/check_clone_upgrade.py --candidate /path/to/signed-clone.apk` (Android SDK `adb`, `aapt`, `apksigner` required; phone must be connected with USB debugging). This inspects the installed app's public base.apk in a temporary directory and compares package identity, versionCode and signing certificate; it does **not** install, delete or change app data. Passing the preflight does not prove OAuth or data persistence.
- **Do not change Clone app package suffix** between updates. If migrating from the universal Morphe Clone app to the integrated clone, turn the **universal patch OFF**, preserve `.morphe`, and verify signing certificate consistency before installing.
- **Never assume the official FairEmail app is replaceable by a differently signed APK.** Using the clone path is safer for parallel installation.
- Install as an update, not by uninstalling the old app. Confirm Gmail inbox, SMTP, token refresh and settings after install. Roll back only through a path compatible with Android's version/signature rules and after securing a tested backup.
- If an installer asks to uninstall the existing app, **cancel** until you understand the signature/package mismatch.

## Encrypted backup and destination import

1. From modified FairEmail go to Settings → Backup → Export settings.
2. Enter the same **nonempty password twice** and save the `.backup` locally. Never share the password or backup in public issue reports.
3. Copy the encrypted file to the destination phone over your preferred private transfer method.
4. Install a compatible independently configured FairEmail/Morphe clone on the destination, keeping its existing account data safe. Import the file from Settings → Backup → Import.
5. Select account/settings categories carefully. Importing may add duplicate accounts or modify existing settings depending on options; preserve a second copy of the old configuration.
6. A successful “account imported” message is **not proof** of usable OAuth after migration. On the destination, verify a **new** received message and an outgoing message, then let the token expire and confirm refresh without another login.

## Troubleshooting without data loss

- If import rejects the password, check file integrity and the original password; **do not** clear app storage.
- If account appears but no new mail arrives, inspect the modified app's account status and OAuth token refresh flow before attempting a new login.
- If two apps compete for OAuth redirect, identify the exact installed package and default deep link/URI handler; do not uninstall the official app.
- If the changelog still appears, confirm the **0.2.1-dev.2 or later** bundle's “Suppress automatic changelog popup” patch was actually applied to FairEmail 1.2338; the source being updated is not proof that the installed APK was rebuilt.
- Never paste OAuth state, backup file contents, passwords or signing keys into a GitHub issue.

## Integrated clone rollout safeguards

- After enabling the dev.3 built-in clone, **deselect** the external universal Clone app in Morphe. Keep only one active.
- Both implementations target `eu.faircode.email.morphe` by default, but compatibility with the original clone is **not proven** until the Manifest and certificate match and an in-place update succeeds.
- If update installation fails, preserve the original clone and its backup. Do not uninstall/clear it to force a replacement.\n