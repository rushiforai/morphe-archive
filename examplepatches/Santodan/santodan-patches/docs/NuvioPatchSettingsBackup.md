# NuvioTV patch settings export and import

Target: original `com.nuvio.tv` **1.1.0-beta.13** (1076), SHA-256
`306eb6dcb904677000df18448d5cd6a8b4bc6d436eff5984e6ad25e82b6aeecb`.

The **NuvioTV - Side-by-side installation** patch defaults to package name
`com.nuviotv.santodan`. The package name remains configurable; choosing the previous
`com.nuvio.santodan` retains that installation identity. The patch installs the
shared Santodan-Patches settings section even when selected alone. Under **Settings →
Layout → Santodan-Patches**, use **Export patch settings** to save a JSON file
with Android's document picker. In another patched installation with this
feature, choose **Import patch settings**, select that file, confirm replacement,
then select **Restart NuvioTV** to apply the imported settings. **Later** keeps
the app running so you can restart manually. No storage permission is needed. Android TV must
have an enabled document picker; an unavailable picker produces an explanation.

Progress, import confirmation, export/import results and error messages use
Nuvio's native themed Compose dialog and action buttons. The system document
picker still handles choosing the JSON file. The private picker activity is
transparent and returns to the existing settings screen while file work runs.
Import offers Restart only after all preference commits succeed; cancellation
and failed saves never trigger a restart.

The backup is independent of the installation package name. It includes every
persisted Santodan runtime setting: merged-progress options and tracking-provider
choices, remaining-episode/airing toggles, library/collection finale and movie-date
options (including only-airing), date-label appearance, all three stream preloads,
current-stream labels, preferred add-on/autoplay, launcher channel selections,
playback-button layout, and IntroDB enablement/API key. Keep the file private if
it contains an API key. Patches with no runtime settings have nothing to export.
Build-time patch options, native Nuvio settings, accounts, authentication, watch
history, cached metadata, playback positions and launcher snapshots are excluded.

Profile-specific choices retain their numeric Nuvio profile IDs. Use matching
profiles and installed add-ons in the destination; this does not create profiles,
install add-ons or transfer provider logins. Settings for a patch not currently
selected can be retained and used if that patch is added later. An existing
installation needs to be rebuilt with this feature to export its settings.

Schema version 1 identifies `santodan-nuviotv-patch-settings`. Explicit preference
group/key/type allowlists keep caches and account data out. String sets and packed
64-bit Compose colors preserve their types. Import reads at most 1 MiB and fully
validates the file before showing confirmation or writing. Unknown formats,
versions, groups, keys, types and tracking-provider identifiers fail closed.
An included group replaces its managed settings (including restoring defaults
when empty); omitted groups and all unmanaged keys remain untouched. Commit
failures trigger rollback of touched settings. File access, preference reads and
commits run on a worker. Restart is required for runtime caches to reload.

Implementation: the side-by-side manifest registers a private
`SettingsTransferActivity`; its presence enables the two native action rows.
`SettingsTransferUi` renders inside the existing Nuvio composition and observes
a native revision state. The patch validates the original dialog, action rows,
Compose state and group contracts; runtime reflection uses the same full
references. The shared
menu alone does not expose transfer actions without that activity registration.

The Restart button starts a private `SettingsRestartActivity` in
`:santodan_restart`. That process terminates the previous app process and opens
the enabled TV launcher (or normal launcher) for the current package. A checked
entry guard in the original `NuvioApplication.onCreate` skips native repositories
and background initialization only in this helper process; normal startup keeps
its original instructions. The helper does not change account or preference data.

Verification commands:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioSettingsBackup :patches:verifyNuvioLatest :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport '-PmorpheDesktopJar=E:/Morphe/morphe-desktop-2.1.1-all.jar' --continue --offline
```

`verifyNuvioSettingsBackup` exercises production serialization/validation and
restore orchestration, including all settings groups, multiple profiles, defaults,
precise colors, malformed files and partial commit rollback.
`verifyNuvioSettingsTransferRuntime` compiles the production activity against
isolated Android fixtures and exercises native row callbacks, profile-file
discovery, document-picker requests, confirmation/cancellation, preserving
unmanaged preference keys, oversized/invalid files, unavailable pickers and screen
recreation. It also exercises native progress/confirmation/results/errors,
Cancel/Later/Restart, duplicate confirmation, failed saves and missing launchers.
`verifyNuvioSettingsRestart` checks the exact original startup method, changed and
duplicate rejection, helper-only early return and DEX write/reload. Remaining device
checks: TV focus/navigation, provider availability in the document picker, picker
cancel/return, transferring a real file between two package names, and restarting
with matching profiles and add-ons. Local checks do not establish device behavior.

## Native dialogs and restart validation (2026-11-08)

The focused Android build, settings codec/runtime, restart guard and centralized
native-contract checks passed. The packaged startup/clone and combined selections,
Android bundle and Desktop 2.1.1 import also passed. Rebuilt standalone side-by-side
and all-sixteen-patch APKs use `com.nuviotv.santodan`; audits check native dialog
references, absence of Android AlertDialog/TextView transfer UI, restart hook,
private helper process, provider authorities and unchanged native libraries.
Both have the same cross-DEX findings as the original APK. The combined rebuild
also passes the IntroDB, playback customization and startup stability audits.

| Current APK under `../Apps/NuvioTV/` | SHA-256 |
| --- | --- |
| `NuvioTV-1.1.0-beta.13-patches-0.16.5-settings-native-ui-v2-clone-unsigned.apk` | `02fb7656efabda7c6d25efafb56168aa639e4d3aaed3d90735a161ca871e6642` |
| `NuvioTV-1.1.0-beta.13-patches-0.16.5-settings-native-ui-v2-all-unsigned.apk` | `9085a338624cae14f0461e39ccd5cb945c8119066087281f44af358994055a85` |

These supersede the earlier settings-backup and IntroDB-focus artifacts below.
The `v2` builds also allow immediate import confirmation before the file-reading
worker has returned, without an older worker clearing the active save's busy flag.
The runtime regression dispatches this immediate confirmation synchronously.
They remain unsigned and were not installed or device-tested. Verify with
`:patches:verifyNuvioSettingsTransferApk -PnuvioSettingsApk=<absolute APK path>`.
The new logs and rebuild commands are retained as `settings-native-ui-*` in
`../Skills/inspection-evidence/.inspect-nuvio-beta13/`.

## Local APK checks (2026-11-08)

The complete command above passed: Android build, metadata generation,
`verifyNuvioLatest` (including both new host checks and packaged/cross-DEX
combinations), Android bundle validation and Desktop import. The first broad run
hit the existing Remaining Episodes asynchronous seed assertion; its focused
rerun and the complete final suite both passed without changing that feature or
its test. The final log is
`../Skills/inspection-evidence/.inspect-nuvio-beta13/build-settings-transfer-final.log`.

Desktop **2.1.1** rebuilt the original APK with `--exclusive --unsigned --validate`,
once with side-by-side alone and once with all sixteen NuvioTV patches. Both
passed. Audits found the private transfer activity, both actions, schema and
reviewed native action-row reference in the delivered APKs. All provider
authorities use the clone package. Final outputs under `../Apps/NuvioTV/`:

| APK | SHA-256 |
| --- | --- |
| `NuvioTV-1.1.0-beta.13-patches-0.16.5-settings-backup-v2-clone-unsigned.apk` | `4cff55e88dd5d1167b1c870e4a1433fb8781a2e1fa35ae3d00ce640bd96bbaac` |
| `NuvioTV-1.1.0-beta.13-patches-0.16.5-settings-backup-v2-all-unsigned.apk` | `0957a5588368b6c5e174484cc24b5c46b465fcf20f16783a070439a18d649fee` |

These replace the earlier outputs without `v2`, which predate the screen
recreation handling. Commands, results, manifest dumps and audits are retained
under `../Skills/inspection-evidence/.inspect-nuvio-beta13/settings-transfer-v2-*`.
The rebuilt APKs were not signed, installed or tested on a device.
