# Komikku installed-APK acceptance — 2026-10-30

The unedited `before.png` and `after.png` are raw Android `screencap` output.
Their matching UIAutomator XML files and SHA-256 values are in `captures.json`.
Synthetic Orion and Meteor are Local Source entries; Lyra is a remote-source
control with ID 42. Its warning badge indicates that no real extension is
installed. Fixture cover art is rendered inside the actual app; these are not
widget renders, composites or edited app screenshots.

Device: isolated disposable `komikku` AVD / `emulator-5584`, AOSP Android 35
ARM64, 1080 × 1920, density 420, light theme, same library and filter/sort.
Wi-Fi is disabled. Both captures show `-meteor` with the keyboard dismissed.
The only visible difference sought is retention of unrelated local Orion.
Matching local Meteor is still excluded.

## Input, selection and installation

- Official GitHub Komikku ARM64 1.14.1, package `app.komikku`, version code 81.
  Original SHA-256 `5dec6178557c89944bf2ef0b5059a5c36a5ab8ebf74dab92fa9281997879d2e2`.
  [Release and signer](../../../../docs/KOMIKKU.md#original-input).
- The before APK has identical executable class digests to that official APK;
  it is signed with the disposable test key so an update can preserve data.
- Morphe Manager **2.2.0**, actual embedded **JVM** patcher (confirmed by logcat).
  The source was imported and updated through the actual Manager file picker.
  `verified-manager-source.*` records `1.5.0-komikku-verified`.
- `manager-patch-disabled.*`, `manager-patch-selected.*` and
  `manager-patch-success.*` record the actual off/on selection and application.
  `manager-case.json` is written only after observing those states and runtime.
- `verified-manager-exported.*` records Save. The export was pulled only after
  four stable positive-size samples; `apksigner verify` passed. Manager's own
  original cache matches the official input hash. Exact candidate/export pins
  are in `manager-export.json` and `manager-signature.txt`.
- `verified-manager-update-confirm.*` records the Android installer opened by
  Manager. After UPDATE, the installed APK hash exactly matches the export:
  `76675e076faa4737d7cad1d7eb653c535e9b29e9f4f7dfe248b6fa4f7bf93265`.

No private key, original APK or patched APK is included in Git.

## Behavioral and data evidence

`native-baseline.json` / `native-patched.json`: the installed app's actual
`filterManga` is invoked on eight cases. Original: two expected regression
failures (`-meteor`, `-0` with a local manga). Manager export: **8/8 pass**.
The harness supplies the real Application context to Injekt and allocates a
ScreenModel without its subscriptions. The production predicate is not copied.
The complete parser and subscriptions are exercised separately through the UI.

`original-ui-search.json` and `patched-ui-search.json` each record **10/10**
actual UI queries/result sets.
The queries cover exclusions by title, genre and remote numeric source ID,
positive searches, `src:local` and an empty search. The harness verifies the
actual field value before asserting results; a reordered ADB text event is
retried rather than accepted as the requested query.

`before-verified-manager.json` and `after-verified-manager.json` are **equal**:
all database tables, all user preferences, both CBZ hashes and the fixture marker
are retained across the actual Manager installation, without uninstall/data
clearing. Three manga and three chapters retain favorite, read, bookmark and
last-page state. The complete raw archives remain in the ignored local test
workspace. `*-generated.json` separately records changing application logs and
computed cover color/ratio caches; these generated values are not represented
as user-data invariants.

`source-release-tests.json`: **77 tests, 9 suites, 0 failures**, plus successful
`spotlessApply`, `spotlessCheck` and `assembleDebug` at source commit
`86c0acaee96b4f76bcdb3965727dcbd2169ee514`.

Same-key removal and reapplication are also verified in `lifecycle.json`: both
updates preserve the complete user-state snapshots. The restored original
reproduces the two failures; the reapplied Manager export passes 8/8 and the
actual `-meteor` UI check again. Neither operation uninstalls or clears data.

## Bytecode and bundle checks

`control-flow.txt` verifies that all 377 predicate instructions remain intact,
all three incoming branches still target the null guard, and only that guard's
null edge changes. The test rejects the earlier insert/delete prototype,
which failed real APK acceptance and is not the accepted output.

Morphe Desktop 1.18.1 and 1.19.1 apply the final patch. Their output and the actual
Manager output have equal executable digests for all 27,909 classes; only
LibraryScreenModel changes relative to the original. The patch rejects its own
output. The app manifest, resources and native libraries are unchanged.

All seven prior MPEs and all 135 Finamp resource entries are byte-identical
to Penguin v1.5.0. The combined release preflight also successfully replays
all 127 shipped native selections and verifies their source pins, output hashes
and snapshot ABI (`combined-release-preflight.json`). See the comparison records and the repeatable commands
in [the test guide](../../README.md).

`upstream-audit.json` records refreshed branches and overlapping open PRs,
including #1128, with the precise behavior-check method. It changes source-name
matching, retains the defective null guard and still fails the two local cases
when its source-name replacements are applied to current master.
