# Finamp #1689 / #1790 verification

Completed local-candidate acceptance on Android 15/API 35 ARM64, Manager
2.2.0/Patcher 2.0.1. These captures precede publication; released-source
verification is [recorded separately](../2026-10-28-released-1.2.0/README.md) after the normal release workflow.

## Artifacts and source

- Official original Finamp 1.0.1 universal SHA-256:
  `0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581`.
- Complete candidate MPP SHA-256:
  `79ceddd2405bee3464acbde4fa9a9407f413136ec42392b90955c5d64998b5f0`
  (88,209,085 bytes).
- All 31 native outputs replay and apply through actual Morphe Desktop
  1.19.1/Patcher 2.0.1. Every retained entry except ARM64 libapp.so is unchanged;
  other native architectures are removed. All 32 complete public source
  branches/trees, including mask zero, match the pinned matrix.
- Four unsupported inputs fail with selected-patch attribution, nonzero status
  and no output APK: app library, engine, missing ARM64 and forced version.

## Actual Manager and installed-app checks

All five rows default off. Six fresh UI selection/apply/export runs passed:
JVM masks **8,16,24,31,7**, ART mask **31**. Each saved APK has the expected
native hash, retained entries, disposable signer, uncompressed native libraries
and 16-KiB alignment (`manager-output-verification.json`).

A controlled engine fault with only bit16 selected fails visibly on **Fix track
alphabet navigation**, offers no Install/Save, and restores the original cache
bytes/owner/mode. A fresh ART31 recovery succeeds. Its signed export was
installed through Manager → Install → Android UPDATE; the installer returned
directly to Manager. The installed hash equals that export (`manager-gui-install.json`).

| Check | Before | Actual Manager output |
| --- | --- | --- |
| #1689, downloaded B Guest performing-artist list, Name sort, no favorites | 8 tracks, including two unrelated entries | Bit8: 6 tracks, unrelated entries excluded |
| #1790, same Tracks list and M tap `(1045,1045)` | Numeric rows remain first | Bit16: Midnight 01 is first |
| Both fixes with the original three | — | Recovery bit31: both results hold |

The baseline contains original official native code re-signed with the same
disposable test key, enabling updates without clearing data. After the update
chain, login, all eight downloaded album tracks, Dark appearance and the chosen
Metadata order mode remain intact (`manager-persistence.json`).

Raw, unedited PNGs have matching XML/sidecar hashes where supplied; every PNG
hash and dimension is in `captures.json`. Only synthetic fixtures are shown.
The screenshots use the same portrait 1080×1920/density320/Dark/English/demo-clock
profile and matched filter/sort state. The #1790 APK comparison is online;
offline/mixed-case behavior is covered by widget tests.

## Source checks and limits

Source tests pass: 29 for PR1834 (four new), 31 for PR1835 (six new), 66 in the
combined five-fix native tree. Targeted analysis is clean. 13 codec/output/matrix/
Manager-parser tests, 13 fixture/source-decoder tests and six README/gallery
renderer tests pass. The two prior source regressions fail on original code.
See [acceptance instructions](../../README-next-fixes.md) for supplemental PR1786
merge-test limitations and reproduction commands.

The 31-case matrix is Desktop coverage; six cases are actual Android Manager
coverage. Results cover this disposable ARM64 emulator and pinned Finamp 1.0.1,
not physical/OEM devices or live Jellyfin servers. Snapshot size stays
22,283,144 bytes; RAM is not benchmarked. APKs, signing keys, account credentials
and private fixture control tokens are excluded.
