# Fresh Mihon Manager acceptance — 2026-10-30

A separate, newly created API35 ARM64 AVD (`mihon-isolated`, `emulator-5582`) was
used exclusively for this suite. No shared Finamp device or original working tree
was mutated. All library data and the imported signing key are disposable fixtures.

| Original APK, re-signed with the fixture key | Actual Manager ART export, installed through Manager |
| --- | --- |
| ![Before: protected download lost](before.png) | ![After: protected download retained](after.png) |

These are unedited 1080×1920 installed-APK screenshots. Light theme, font/display
settings, synthetic favorite/read chapter, excluded Default category and Downloaded
only filter match. The status-bar clock advances during the real test. No keyboard
or modal covers either comparison. Empty list means the downloaded copy was lost;
the favorite/chapter database records remain.

## Actual Manager and installer flow

1. Import candidate MPP `711ce38e53274fe0186b19735e813be62262330a1a913a136f1ea47b0046ce20`.
2. Load the exact [official original](manager-input-sha.txt). Confirm
   [default off](default-off.png), then [enable only the Penguin patch](selection.png)
   (unrelated Morphe universal selection remains 0/5).
3. Import the disposable [test signer](signing-key.png); certificate SHA-256
   `5bcbdaac2aebee68090aa00926622ccb5439ad0bec86d3d219ad0b74036d3628`.
4. Select [Android runtime](runtime-setting.png); [actual invocation log](manager-runtime.txt)
   confirms ART, rather than inferring it from a filename.
5. [Apply successfully](application.png), export through Android DocumentsUI, wait
   for a positive stable file size and verify the [APK signature and hash](export.json).
6. Choose Manager Reinstall, accept Android's [UPDATE confirmation](installer-confirmation.png),
   and return to Manager's [System installer state](installed.png). This installer
   returns directly to Manager; no DONE dialog was shown. The [installed APK hash](installed-apk.json)
   matches the actual export exactly.

Every screenshot also has its unmodified same-name XML/JSON. [Provenance](provenance.json)
pins screenshot and candidate-bundle hashes. First-run prompts for storage/APK-source
access, background patching and onboarding were resolved explicitly through observed
UI. They were not counted as patch failures or successful installation evidence.

## Behavioral and data results

- [Original installed APK](baseline.txt): exactly one of six real file cases fails
  (excluded Default/read download is deleted).
- [Actual installed Manager export](manager-native.json), [raw output](manager-native.txt):
  all six pass. Retained file bytes are identical. [UI case](ui-after.json) also
  requires the real cache to report the retained chapter downloaded.
- State under [state/](state) is exactly identical immediately before/after the
  GUI same-key update, removal via same-key original APK, and reapplication via
  the same Manager export. Full manga/chapter rows, preferences and fixture-file
  hashes are compared, including the protected download. No reset/uninstall or
  schema change is used.
- [Reapplied installed APK](reapplied.json), [raw output](reapplied.txt): all six
  file cases pass again. Fixture behavior tests run after the corresponding data
  comparison and intentionally change their own disposable files/preferences.
- [Canonical check](verify-manager.txt) pins both full manager class digests and
  all 19,958 classes, retaining resources/native libraries. [Release gate](release-validation.json)
  applies the MPP with pinned Morphe Desktop and rejects reapplication without export.
- Against the checksum-verified published v1.4.0 MPP, [all seven MPEs](module-verification.txt)
  and [all 132 Finamp resource files](unchanged-finamp.txt) are byte-identical.
- [Official GitHub build](hosted-build.json) succeeds for the reviewed source;
  [candidate and source identities](candidate.json) identify the tested local bundle.

An earlier additional AVD attempt failed during fixture setup while host disk space
was exhausted; it was discarded and never counted as acceptance. The final fixture
seeder stops Mihon before editing synthetic SQLite data, validates integrity and
restores the original Android UID. It does not mix platform SQLite writes with the
app's live bundled SQLite engine. The [2026-10-29 source/native record](../2026-10-29/README.md)
retains the original 37 source tests and transparent recovery of its missing JSON.

This proves the narrow Default-retention boundary with an offline source proxy and
real installed deletion/provider/cache/filesystem code. Custom-category membership
has source-test coverage. Physical devices and remote storage providers were not tested.
