# Stremio Morphe multi-account build

This patch keeps multiple complete Stremio accounts in one Android TV installation. It does not alter Stremio Supporter entitlements or Stremio's separate within-account user-profile feature.

## Test target

- AVD: `Television_4K_Morphe_POC`
- Android API: 36
- Resolution: 3840 x 2160
- ABI: x86_64
- Stremio: 1.10.4

## User workflow

Launching Stremio from Android TV Home opens a D-pad-friendly account chooser.

- Select a card and press OK to open that account.
- Select **Add account** to open Stremio's QR login in a provisional isolated slot. The account is committed only after authentication succeeds; Back returns to the chooser and removes every local trace of an incomplete login.
- Hold OK on a round account avatar to open **Rename**, **Change color**, **Add/Remove PIN**, and **Remove Account**.
- Avatar outlines become thick only while focused; active-account status is shown by the **Active** badge rather than a persistent thick outline.
- The chooser and avatar initials use Stremio's bundled Plus Jakarta Sans font family.
- The chooser follows the active account's Stremio interface language. It resolves the locale from that account's isolated profile and includes complete primary-page and account-action copy for all 51 selectable interface locales. General dialog text still reuses Stremio's catalogue; invalid or unavailable locale values fall back to English.
- Account names are limited to 12 characters. Picker labels shrink from 17sp and side-menu labels from 13sp, both to a 10sp minimum; a name that is still wider than its assigned label area is end-ellipsized for display without altering the stored name.
- **Change color** presents colored preview swatches; the avatar outline is derived from a lighter shade of the selected color.
- Access PINs contain exactly four digits and submit automatically as soon as the fourth digit is entered. A protected account requests its PIN before opening; removing its PIN also requires the current PIN.
- Removal confirms that it affects only this installation and does not delete the Stremio account.
- Select **Exit Stremio** to close Stremio and return to Android TV Home.
- Inside Stremio, use the round account avatar above Search in the left navigation rail to return to the chooser. Its label is the active account name and remains visible whenever the native rail is expanded.

The chooser supports up to five local account profiles. A clean installation starts with no profiles and only an **Add account** button. Selecting it opens Stremio's QR login in a provisional storage container; successful authentication promotes it into the account list, while Back, an interrupted login, or reopening the chooser removes it and restores the previous account. Existing `account_a` and `account_b` namespaces are adopted automatically during an in-place update, so updating the APK does not discard authenticated states.

## Storage model

The active ID is stored in `morphe.active_slot`. Each profile uses a dedicated `morphe_core_<profile-id>` core preference file for profile, library, streams, content settings, stream presets, search history, notifications, and related state. This lets Stremio use its original unmodified core-storage access path without allocating and concatenating a namespace prefix for every preference read. Existing `morphe.<profile-id>.<key>` data is copied once into the dedicated file, verified before the migration marker is committed, and retained as a downgrade fallback until that profile is reset or removed. Android/default preferences are stored in a separate `morphe_account_prefs_<profile-id>` file, isolating guest IDs and player/interface preferences. Profile order, display names, avatar colors, and salted PIN hashes live in the shared `morphe_profiles` chooser-control file. PINs are not stored in plaintext.

All remaining Android-side state is retained in a permanent account container under the app-private `morphe_account_storage/<profile-id>` directory. Each container covers `files`, internal and external caches, SQLite databases, no-backup/WorkManager state, SDK/session files, native streaming-server data and every non-control SharedPreferences file. The legacy `core`, dedicated `morphe_core_<profile-id>`, `morphe_profiles`, and already-account-scoped default-preference files remain in the shared control plane.

Switching first stops runtime services and terminates every stale Stremio process. Notifications and scheduled jobs are cancelled and outgoing Android TV rows are removed because those resources are owned by the package rather than an app data directory. The live storage entries are then renamed into the outgoing account container and the destination entries are renamed into place on the same filesystem. This transaction rolls back its moves if any rename fails. Only after it succeeds does the chooser commit the destination ID and launch a fresh `MainActivity`. Selecting the already-active account still reorders the existing activity without restarting its process. The production patch does not record or display switch, boundary, or startup timings.

Removing an inactive account deletes its dedicated core file and legacy core namespace, Android/default preference file, complete internal and external storage containers, chooser metadata, PIN material, and profile-list entry. Removing the active account rotates to a fallback container before deleting the outgoing account and returns to the chooser. A PIN-protected fallback therefore cannot be opened without its PIN. Android backup/restore is disabled so removed local account state cannot be restored by the OS.

## ADB diagnostics

The active slot can still be read with:

```powershell
.\patches\multi-account\tools\get-account-slot.ps1
```

Direct ADB slot mutation is deliberately disabled because it bypasses the process and storage boundary. `switch-account-slot.ps1` now rejects the operation and directs the tester to the on-device Accounts chooser.

## Validated behaviour

- The signed APK installs and runs on the 4K API 36 x86_64 TV emulator.
- The picker-copy table is complete for all 51 selectable Stremio locales. German, French, Indonesian, Japanese, Arabic, Italian, and English were rendered on the TV emulator; switching accounts makes the next chooser opening follow the destination account's language.
- Two authenticated Stremio accounts survive an in-place update.
- Dynamic Add, Rename, avatar color, PIN protection, Remove, five-profile capacity, active marker, and Exit work with TV controls.
- Rename and PIN prompts have no redundant action buttons: Rename submits with Enter/Done, PIN prompts submit on digit four, one Back press dismisses, and the TV keyboard closes in both cases.
- Add account opens an isolated QR login rather than another account's session. The account-list entry remains provisional until Stremio stores an authenticated user; abandoning it removes its core data, Android preferences, storage container, metadata, and active marker before returning to the chooser.
- The smaller left-navigation account avatar is centered on the native icon axis above Search. Its row uses the native menu's 145 x 48dp focus target, 45dp painted selector height, 20dp inset, 10dp corner radius, and 13sp Plus Jakarta Sans label styling; the label remains visible while the rail is open, and the row opens the chooser.
- The interactive sidebar stack from the account row through Settings is vertically centered on the 4K TV display, while the Stremio logo remains fixed above it.
- The account row is focusable only while the native rail owns focus. Right from Accounts returns to the currently open content, Down returns to Search, and content-side Left navigation cannot be diverted into Accounts. Native Stremio behavior is preserved: Right from any highlighted native row returns to the already-open screen without activating that row, and Left restores the same highlighted row.
- Selecting the active account returns to Stremio without restarting its process.
- Removing temporary profiles clears their core namespace and metadata.
- Removing temporary profiles also clears their Android/default preferences and leaves no slot identifier in app-private files.
- Process-safe switching retains cache, no-backup, streaming server, WorkManager and SDK/session data in separate account containers while cancelling package-global jobs, notifications and Android TV provider rows.
- Active-account removal rotates to the fallback container, removes all outgoing profile-local stores, stays in the chooser, and enforces the fallback account PIN.
- Direct broadcast mutation cannot change the active slot.
- Android backup is disabled.
- Repeated Account A/B switches preserve both login profiles and Account A's library bytes.
- No fatal exception occurred during the completed workflow test.

See [TEST_RESULTS.md](./TEST_RESULTS.md) for the emulator results.

## Deliberate limitations

- Maximum of five local profiles.
- Production APKs are non-debuggable and do not log individual core keys.
- Android TV channels/programs, notifications and scheduled OS jobs cannot be mounted from an app-private account container, so outgoing instances are cancelled or removed synchronously at the boundary.
- Every non-active account retains its caches and auxiliary files. This improves switch speed but uses more storage than rebuilding those caches on every switch.
- A real account switch still starts a fresh Stremio runtime.
- Repeated Compose navigation callbacks are coalesced before they cross into the account overlay. Destination, focus, and expanded-state work now runs only when the relevant state changes.
- Stremio cloud data and telemetry already transmitted off-device are outside local profile removal. Removing a local account does not delete the Stremio account or server-side data.
- Flash-storage forensic erasure cannot be guaranteed by Android application APIs; deletion is verified at the filesystem and logical-store level.
- The APK uses the local Android debug certificate. Side-by-side builds use `com.stremio.morphe`, leave official `com.stremio.one` installed, and can update earlier Morphe builds signed with the same certificate.

## Rebuild

The root build orchestrator checksum-validates and decodes a supported official APK, discovers all patch modules, and invokes this module's local apply and augmentation hooks. This module owns its compact diff and all Java sources under `src\com\stremio\morphe`.

For Morphe Manager, `morphe/` owns the exact bytecode fingerprints, resource transforms, and extension hooks. The same original Java runtime source is compiled into `extensions/stremio.mpe`, so the Manager and legacy builds do not maintain separate runtime implementations.

```powershell
.\scripts\build.ps1 -OriginalApk "C:\path\to\the-supported-stremio.apk"
```
