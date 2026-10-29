# Finamp #1689 / #1790 acceptance

The two optional patches extend the original three Finamp patches. Input stays
**official Finamp 1.0.1 universal**, SHA-256
`0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581`;
output stays **ARM64 only**. No other APK release or architecture is declared.
The exact five-bit source matrix is [native-sources.json](native-sources.json).

| Bit | Manager patch | Source contribution |
| --- | --- | --- |
| 1 | Fix section title validation | PR1830 |
| 2 | Song artist order | PR1831 |
| 4 | Load artist pages faster | PR1832 |
| 8 | Fix offline artist tracks | [PR1834 / #1689](https://github.com/finamp-app/finamp/pull/1834) |
| 16 | Fix track alphabet navigation | [PR1835 / #1790](https://github.com/finamp-app/finamp/pull/1835) |

All five are off by default. Every nonempty subset has a separately compiled,
source-pinned delta against the same original snapshot: **31 combinations**.
The old seven payloads are retained byte for byte. The native snapshot remains
22,283,144 bytes. The larger bundle stores more alternatives; RAM has not been
benchmarked.

## Automated checks

Follow [the native build workflow](README.md) with the expanded source matrix.
The default builder now rebuilds all 31 masks. Partial builds must use private
output; neither a single mask nor the historical seven-mask set can replace the
production resources. Complete source commits, trees and both new source feature
predicates were checked against all 32 public branches, including mask zero.

`validate_bundle.py` replays every delta and verifies source/hash/ABI/header
mapping. `patch_matrix.py` applies all 31 selections through the actual Desktop
patcher and compares every retained APK entry. `reject_inputs.py` rejects wrong
app-library, engine, missing ARM64 and forced wrong-version inputs, with selected
patch attribution and no output APK. The codec/output-policy regressions include
a structural check of every five-bit source combination.

Source regressions invoke production providers and the actual widget callback:
#1689 has four new tests (29 total), #1790 six (31 total); the native five-fix
source tree has 66 tests. Five loaded-list cases also passed with PR1786's shared
callback after a manual adjacent merge, using a locally resolved test harness.
That supplemental run is not a locked-dependency build or a test of its new
unloaded-page resolver; its older lock does not resolve under the installed
Flutter SDKs. #694 performance work is outside these fixes.

## Actual APK comparison

Use only the disposable AVD and guarded controls from [README-fixture.md](README-fixture.md).
The comparison profile is portrait 1080×1920, density 320, Dark theme, English,
SystemUI demo clock 09:41 and hidden notification icons. Captures are unedited
ADB PNGs, paired with XML and hashes. These display settings are restored after
testing. They do not change Finamp data or behavior.

The credit fixture remains eight generated WAVs. B Guest performs on tracks 1–6;
tracks 7–8 belong to other credits. Capture the same performing-artist filter
with Name ordering and no favorite filter:

```sh
python3 -B tests/finamp/next_fixes_acceptance.py --adb "$ADB" \
  --out .scratch/finamp/android/next-fixes/final-pairs --label 1689-before \
  --apk "$SAME_KEY_ORIGINAL" artist --expected-count 8
python3 -B tests/finamp/next_fixes_acceptance.py --adb "$ADB" \
  --out .scratch/finamp/android/next-fixes/final-pairs --label 1689-after \
  --apk "$MANAGER_MASK_8" artist --expected-count 6
```

For alphabet navigation, start the owned fixture with `--profile navigation`.
It adds a second album, **Alphabet Library**, with 105 generated tracks while
preserving the original eight and their downloads. The Tracks list crosses its
100-item page boundary. Observe the sidebar on a fresh capture before choosing
coordinates; on this exact profile the center of M is `(1045,1045)`:

```sh
python3 -B tests/finamp/next_fixes_acceptance.py --adb "$ADB" \
  --out .scratch/finamp/android/next-fixes/final-pairs --label 1790-before-M \
  jump --letter M --point 1045 1045 --expected-first '02 - Credit Order'
python3 -B tests/finamp/next_fixes_acceptance.py --adb "$ADB" \
  --out .scratch/finamp/android/next-fixes/final-pairs --label 1790-after-M \
  --apk "$MANAGER_MASK_16" jump --letter M --point 1045 1045 \
  --expected-first 'Midnight 01'
```

The helper updates with `install -r`, resolves a fresh hierarchy before actions,
anchors the offline switch to its drawer row, and checks the actual visible
track identities. It does not generate comparison images, invoke a patcher,
clear app data or silently reauthenticate.

## Actual Manager selection/apply/export

Use official Manager 2.2.0/Patcher 2.0.1 on the same Android 15/API 35 ARM64 AVD.
Load the complete candidate through Sources → Add → Local for acceptance, verify
its cached bytes, and use the original APK cache/file picker. Disable the older
Penguin source while testing a local copy to avoid duplicate patch versions;
after release, refresh the remote source and disable/remove the local copy. Confirm all five
rows default off and unrelated universal patches remain at 0/5. Keep the
existing disposable signing key; do not commit it.

The expanded suite is JVM masks **8,16,24,31,7** and ART mask **31**. Each run
must have a new actual runtime log and a fresh exported APK. Scripts use a new
scratch root to avoid reusing the historical 1.1.0 outputs:

```sh
python3 -B tests/finamp/manager_case.py --adb "$ADB" \
  --out-root .scratch/finamp/manager-next --remote-prefix next- --mask 8 --runtime jvm \
  --original-apk "$FINAMP_APK" --native-report "$NATIVE_REPORT"
```

Use `--from-result` for subsequent cases; switch the execution backend through
Manager Settings. `verify_manager_outputs.py` defaults to these six cases and
checks native output, retained entries, signature and uncompressed/16-KiB-aligned
native libraries. `manager_fault.py --mask 16` checks failure attribution to the
new selected patch with a controlled cached-input engine fault, restoring only
the cache bytes/owner/mode afterward. Run a fresh successful recovery.

Reviewed screenshots, reports, exact artifact provenance and limits belong in
[evidence/2026-10-28-next](evidence/2026-10-28-next/README.md). Distinguish local
candidate acceptance from [released 1.2.0 remote-source verification](evidence/2026-10-28-released-1.2.0/README.md). Emulator
results do not establish physical/OEM-device or live Jellyfin-server coverage.
