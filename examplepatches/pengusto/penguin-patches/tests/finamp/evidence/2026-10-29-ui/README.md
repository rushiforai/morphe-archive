# Finamp output access and banner contrast — Android acceptance

The two focused source contributions are [PR1836 / #1355](https://github.com/finamp-app/finamp/pull/1836)
and [PR1837 / #1756](https://github.com/finamp-app/finamp/pull/1837), targeting
`redesign` at `b72ba46a45eb45836516f23e3df989c89c693c88`.
The APK backports separately target the official 1.0.1 release. Source regressions
exercise the actual production widgets; these images are installed APK captures.

## Matched player-menu pair

| Before: original native code | After: Manager output patch alone |
| --- | --- |
| ![Before: no Output entry](player-output-before.png) | ![After: Output entry available](player-output-after.png) |

Both use the synthetic Output Controls track paused at 28 seconds, Dark theme,
English, hidden player bottom actions, disabled gestures, 1080×1920/density320
and demo clock09:41. No keyboard or unrelated dialog obstructs either view.
The additional [opened output sheet](player-output-opened.png) verifies that
Output reaches the existing volume/device controls and dismisses back to Player.

The original-code baseline is re-signed with the disposable fixture key to allow
same-key updates. Its native code and engine retain the official release bytes;
it is not a source-rebuilt baseline. The patched image uses the real Manager
export. Original-code removal and same-key reapply were also exercised before
capturing the final matched pair, retaining login, theme and paused queue.

| Identity | SHA-256 / source |
| --- | --- |
| Official input APK | `0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581` |
| Same-key baseline APK | `a43d9464b2bc778b506575ab7a3a84c4368a94f6f51a9dff7902d2b7828a67a8` |
| Baseline native | `83de04b43bfcad7f1ae9aa69b433044f409d89957cccdc9deb6b6b0e85789607` |
| Baseline source | `65c1a78b1d04dd8525825ecdf2cf39c7442b51e9` |
| Manager mask32 APK | `7fe6f940aec684b2d0eddbc6b5fc105a4769c889cdbdd01db28eac782d2a4355` |
| Mask32 native | `3b3971fd02d8825a051189b74b84791841c2cabdc7bcddca0bde5a302396e3ce` |
| Mask32 source | `98f45b17686b1887849482d2fd9d0c20fc2477e3` |
| Engine (unchanged) | `d70bbedc2b157630f90123a32ca894a6fa1816ec10cda9f335bada0692b376ee` |

Raw PNGs, XML and capture JSON are preserved alongside the acceptance receipts.
[checksums.json](checksums.json) hashes the evidence files. No images were edited.
No APK, signing key, fixture credentials or fixture-control token is committed.

## Matched quick-settings banner pair

| Before: original native code | After: Manager banner patch alone |
| --- | --- |
| ![Before: dark text on the blue banner](banner-before.png) | ![After: matching readable foreground](banner-after.png) |

Same Home screen, synthetic data, English, Light theme, accent **#152E85**,
1080×1920/density320 and clock09:41. Both final captures use the same owned
secondary profile without switching users between captures. Raw images were not
edited. Same-key original-code removal and Manager64 reapply retain login and
appearance. The [actual Quick Settings screen](banner-quick-settings.png) opens
from the banner; dismissal persists after an explicit restart of that profile.

Manager mask64 APK SHA-256 is
`3de300e4ef2395e8e87f7b3c0e0c140fb5eebe742aca2e0e1e2401b5b4acd4c8`,
native `f7d19019147e976515a3de0cdc355a0cf6ba129a7e5f3c16218dedc221510199`,
source `e39a3d939f233a1721d6129343847e19afec8c93`. The original-code baseline
and unchanged engine match the identity table above. Manager Install → Android
UPDATE succeeded and the installed APK hash matches its fresh export.

## Six-patch checkpoint for #1355

Official Manager2.2.0 / Patcher2.0.1, Android15/API35 ARM64, disposable
`penguin` / `emulator-5580`. The local six-patch candidate was
187,091,703 bytes, SHA-256
`f98e5b394b6f1d8119d8f49205b65daf8e4ad8f0f55d01543c332869ffedbdbd`.
Its cached bytes and original-APK cache were independently checked through
read-only inspection. The older Penguin remote source was disabled.

- All six rows initially off, unrelated universal patches0/5.
- [Only Output selected](checkpoint-manager-output-selected.png), actual JVM
  [apply success](checkpoint-manager-success.png), UI Save/export.
- The exported APK passes exact native output, every retained entry, ARM64-only,
  fixture signature, uncompressed native entries and16KiB loading alignment.
- Manager Install → Android UPDATE succeeded; the installed APK hash matches
  the export. No data clear or key/database edit was performed.

The first runner pull expected the historical `finamp-manager-test` subfolder,
but Android Save had reset to Downloads after source search. The fresh successful
Manager export was recovered from the observed Downloads path and independently
verified. The receipt records this correction; subsequent runs take an explicit
`--export-directory`. This was a runner path assumption, not a patcher failure.

## Complete seven-patch acceptance

The complete candidate is **374,737,080 bytes**, SHA-256
`d8afd8a1cd55e7f5114e494afa1d099553e34d24c350f0aec2b6208d371c9038`.
The normal file-picker import updates the existing local source identity and
retains its earlier UI alias, “Penguin UI output checkpoint”, enabled state and
saved selection. Its cached bytes were independently verified and it was enabled
explicitly. The old remote source stayed disabled during candidate acceptance.

- All seven generated catalogue defaults are false. Manager's recommended
  selection is **0/7**, with unrelated Morphe patches **0/5**.
- All **127 native payloads** replay to their pinned hashes and all **127 real
  Desktop 1.19.1 / Patcher 2.0.1 selections** pass retained-entry/ARM64 checks.
  Four unsupported-input guards reject their inputs without an output APK.
- Actual Android Manager: JVM **32, 64, 96, 127, 31**, plus ART **127**, each
  with fresh runtime logs, UI apply/save and independently inspected exports.
  All six pass signature, uncompressed-native and **16-KiB alignment** checks.
  This is six Manager cases, separately from the 127 Desktop selections.
- With **only the banner patch selected under ART**, a controlled engine-cache
  fault produces a visible, correctly attributed failure and no success actions.
  Original cache bytes, owner and mode are restored in `finally`. A fresh ART64
  recovery succeeds and its saved APK passes signature/alignment checks too.
- Manager Install → Android UPDATE installs all seven fixes. Its installed hash
  matches the ART export. Normal UI retains login, **8 tracks / 22 complete / 0
  failed**, Dark theme and **Metadata order**, without a data clear.
- The earlier 31 deltas and all six unrelated MPEs are byte-identical to 1.2.0.
  Each native output is **22,283,144 bytes**, unchanged in size. The bundle holds
  every alternative composition; this size observation is not a RAM benchmark.

[Acceptance summary](acceptance-summary.json), [Manager exports](manager-output-verification.json),
[defaults](manager-defaults.json), [fault](manager-fault-art.json),
[recovery](manager-case-64-art-recovery.json), [data retention](all-seven-persistence.json),
[127 Desktop cases](desktop-127.json), [native replay](native-127.json) and
[preserved payloads](preserved-payloads.json) preserve the measured results.
The runtime/payload commit also passes the [GitHub build](https://github.com/pengusto/penguin-patches/actions/runs/40797714877).

Published-artifact identities and the post-release Manager remote-source checks
are recorded with the [1.3.0 release acceptance report](https://github.com/pengusto/penguin-patches/releases/download/v1.3.0/finamp-1.3.0-acceptance.json).
The release workflow regenerates the catalogue and all **20 README preview pairs**
from real release metadata. The two focused upstream PRs are ready for review.


## Reproduction and limits

Follow [README-ui-fixes.md](../../README-ui-fixes.md) with fresh output paths.
The complete seven-fix source passes78 tests; #1355 has four focused tests and
#1756 eight. Source tests and APK/Manager tests establish different boundaries.
Emulator/synthetic-server checks do not establish physical/OEM-device coverage
or live Jellyfin-server behavior. Native file size is not a RAM benchmark.
