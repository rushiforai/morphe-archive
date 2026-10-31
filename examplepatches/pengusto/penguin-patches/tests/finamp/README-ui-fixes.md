# Finamp #1355 / #1756 acceptance

Both fixes target the official **Finamp 1.0.1 universal APK**, SHA-256
`0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581`.
Output is **ARM64 only**. The existing five patch bits and payloads are retained.

| Bit | Selectable patch | Source PR |
| --- | --- | --- |
| 32 | Keep player output controls accessible | [#1836 / issue #1355](https://github.com/finamp-app/finamp/pull/1836) |
| 64 | Fix quick settings banner contrast | [#1837 / issue #1756](https://github.com/finamp-app/finamp/pull/1837) |

Both are off by default. The reviewed player patch appends Output, Queue and
Lyrics when bottom actions are hidden, avoids duplicate visible actions and
respects disabled gestures on Player and Lyrics. The banner uses `onPrimaryContainer`, matching its existing icons.
Neither fix introduces a setting, data format, audio-routing change or new asset.

## Source and native composition

The final reviewed player source has 27 focused regressions (previous player
source: five pass, 22 fail). All 64 affected native compositions run their full
suites before AOT: 4,096 overlapping executions, 101 tests in mask127.
The 63 other nonempty native payloads remain byte-identical.

Historical 2026-10-29 counts: the initial output PR had four focused regressions
(29 total); the banner PR has eight
(33 total). The original production widgets fail three and six focused cases,
respectively. The complete seven-fix native source passes **78 tests**. Regenerate
localizations after checking out a source composition:

```sh
flutter pub get --enforce-lockfile
flutter gen-l10n
flutter test --no-pub
```

[native-sources.json](native-sources.json) pins all 128 complete public source
trees, including mask zero. Every nonempty selection has a separately compiled
delta. The historical 31 payloads stay byte-identical; the 96 additions use the
same pinned Flutter 3.47.2 / Dart 3.13.2 toolchain and original engine/snapshot ABI.
Use `validate_bundle.py` for the complete 127-payload replay and `patch_matrix.py`
for all 127 real Desktop patcher selections. Add `--discard-verified-apks` to the
latter to retain durable JSON/hash receipts without retaining every temporary
APK. Failures keep their artifacts. These are Desktop checks, not 127 Manager UI
runs. `reject_inputs.py` checks four invalid-input guards and selected-patch errors;
`--discard-verified-inputs` discards each successful rejection fixture only after
its hash/log/JSON receipt is recorded, retaining failed cases for diagnosis.

The builder supports `--resume --discard-intermediates`. Resume replays and
checks existing payload/source/hash/size receipts before reuse. Each worker uses
a fixed output/cache path, checkpoints atomically and stops before a build if
less than 2 GiB remains. Partial runs cannot write a production manifest.

## Actual Android Morphe Manager

Reuse the owned `penguin` AVD / `emulator-5580`, Android 15 / API35 ARM64, official
Manager 2.2.0 / Patcher 2.0.1 and the existing disposable fixture signer. The
[Manager guide](README-manager.md) documents normal Sources/file-picker setup.
Add a complete local candidate through the UI, disable the older Penguin source
while testing it, and independently verify the cached MPP hash. After release,
refresh and test the public remote source, then remove the local candidate.
All seven catalogue defaults are off; verify the recommended selection is 0/7 and unrelated universal patches stay 0/5. Reimporting a local source updates the existing source identity, retaining its UI alias, enabled state and saved selection; check and enable the updated source explicitly.

The full current suite is JVM masks **32,64,96,127,31**, then ART mask **127**.
It covers each new patch alone, both new patches, all seven and the original five.
Use a fresh output root and shared-storage prefix:

```sh
python3 -B tests/finamp/manager_case.py --adb "$ADB" \
  --out-root .scratch/finamp/manager-ui-final --remote-prefix ui-final- \
  --export-directory /sdcard/Download \
  --mask 32 --runtime jvm --original-apk "$FINAMP_APK" \
  --native-report "$NATIVE_REPORT"
```

Use `--from-result` for subsequent cases and change the backend through Settings.
Each apply must produce a fresh runtime log and exported APK. Set
`--export-directory` to the directory actually selected by Android Save; source
search does not reliably reset a previously used subfolder. Select Downloads
through the picker roots when that is the requested export directory. The helper verifies
the original APK cache hash before starting. `--available-mask 63` explicitly
marks the earlier six-patch candidate, rather than treating it as the final suite.
`verify_manager_outputs.py` checks the full six-case suite, native output and all
retained APK entries, signer, uncompressed native libraries and 16 KiB alignment.
Use Manager's Install and Android's UPDATE for update acceptance; compare the
installed APK hash with the export. Keep login, existing downloads and appearance
and artist-order preferences across same-key updates and patch removal/reapply.

With ART selected, `manager_fault.py --mask 32` checks that a controlled cached
engine fault is attributed to the selected player patch and offers no successful
output. Its `finally` restores only the verified cache bytes/owner/mode. Follow
with a fresh successful recovery. No invalid APK is installed. No database or
signing-key state is manually edited.

DocumentsUI's search field is `AutoCompleteTextView`. Use
`manager_ui.py --package com.android.documentsui type QUERY --class-name android.widget.AutoCompleteTextView`
after opening Search. The helper preserves the active search keyboard while
typing, instead of closing the empty search first.

## Matched, installed-APK screenshots

Use only synthetic data and raw ADB PNGs, with XML/hash/source/APK receipts.
Configure portrait **1080×1920**, density **320**, English and demo clock **09:41**.
Restore display/demo state after acceptance. Never regenerate or edit these images.

For #1355, start the fixture with `start-fixture --profile player`. It keeps the
original eight tracks and adds a generated two-minute **Output Controls** track.
In profile 0, use Dark theme, hide player bottom actions, disable gestures and
pause that track. Open Player through its actual mini-player control. Capture
original native code, then the installed **Manager mask32** export:

```sh
python3 -B tests/finamp/ui_fixes_acceptance.py player --adb "$ADB" \
  --out .scratch/finamp/android/ui-fixes/paired --label 1355-after \
  --user 0 --mask 32 --native-report "$NATIVE_REPORT" --reviewed-player-actions --exercise
```

The helper verifies hidden actions, captures the player and its track menu, then
opens the real Output/Volume sheet and dismisses it back to Player. The comparison
pair uses the menu before/after; the opened output sheet is additional evidence.

For #1756, use a fresh owned secondary Android profile so the banner has not
already been dismissed. Preserve profile 0 and any pre-existing test profiles.
Keep the new profile awake during capture; its default screen timeout can differ
from profile0 even though the emulator itself remains running.
Log into the local synthetic fixture, configure Light theme and accent **#152E85**
through Layout & Theme, then keep the same Home screen for both final captures. Tracks with Name order and no filter can also be used for a matched pair. Open
settings through the drawer, avoiding the banner until both captures are saved.
The accent picker responds to the trailing color control rather than the center
of its merged accessibility row; observe it before tapping. Capture original
native code and the installed **Manager mask64** export with identical settings:

```sh
python3 -B tests/finamp/ui_fixes_acceptance.py banner --adb "$ADB" \
  --out .scratch/finamp/android/ui-fixes/paired --label 1756-after \
  --user "$OWNED_USER" --mask 64 --native-report "$NATIVE_REPORT" --exercise
```

After the comparison, the helper opens Quick Settings and verifies dismissal
persists after restarting Finamp. It checks the active profile and installed
native/engine hashes before either case. Use mask0 for the original baseline.
Remove only the profile created by this run after returning to profile0.

The [README gallery](../../docs/PATCH_EXAMPLES.md) embeds both comparison pairs;
release generation embeds them directly in the root README too. Measured results,
public artifact identities, raw captures and limits belong in the dated evidence
record. Emulator results do not establish physical/OEM-device or live-server
coverage. Native file size and bundle download size are distinct from runtime
RAM usage, which has not been benchmarked.

## Same-size native output tracking

Morphe2.0.1 eager raw decoding compares file metadata when building the output.
All current original/patched libapp.so variants have the same22283144-byte
length. On the API35 fixture, NIO FileTime has second precision even while
java.io.File.lastModified reports different milliseconds. A fast in-place write
can therefore be omitted from a successful ART export. FinampNativeOutput now
sets a distinct NIO FileTime after writing and checks it back; an undetectable
write fails through the selected patch. No sleep or native-byte change is used.

VerifyNativeOutput.java exercises the actual Patcher2.0.1 snapshot/detection
methods with deterministic coarse timestamps. The pre-fix behavior misses the
change; all three fixed cases detect it and retain the exact bytes/length. The
Release workflow runs this regression before semantic release and on feature
compilation runs. Real Manager native hashes remain required.

For very compact menus, the existing pinned track header reduces visible list
space. Locate and open each action separately; they need not all fit at once.
Use short scrolls inside the list below that header when a large swipe skips a
row, and reverse after reaching a later action. Restore display and preferences
before moving on to data-retention acceptance.

The standalone `compact_player_acceptance.py` verifies the installed native source
and synthetic profile, temporarily changes only the owned display size and
hide-bottom preference, opens all three compact-menu routes, and restores the
prior display/preference in `finally`. It uses short, bidirectional scrolls below
the pinned header and avoids controls behind the system navigation bar:

```sh
python3 tests/finamp/compact_player_acceptance.py --adb "$ADB" \
  --native-report "$NATIVE_REPORT" --mask 32 \
  --out-root .scratch/finamp/android \
  --out .scratch/finamp/android/compact-player
```
