# Artist AsyncValue native backport — candidate verification

The candidate updates the **Load artist pages faster** source to pass the full
Riverpod `AsyncValue` through the artist header. Its input is the pinned official
Finamp 1.0.1 universal APK; output is ARM64 only. The change preserves the
existing loading, error and loaded-count behavior.

The tested candidate is `d42d74abe20a56a0a275151f06b47ed6110b34d59041fdea8c917edbf4291781`.
It was composed from the exact published Penguin v1.6.2 MPP: the 64 affected
native deltas and manifest differ; the other 63 nonempty selections and all
other bundle entries remain byte-identical. [Composition](composition.json).

- All 64 affected source trees ran their complete Flutter tests before native
  compilation: 4,192 overlapping test executions, including 108 in mask 127.
  [Per-mask source/build receipts](source-builds.json).
- The aggregate public source ref and all 128 source trees were verified from a
  fresh clone; all 64 Artist parents match the checked-in review diff exactly.
- [All 127 native delta replays](native-report.json) and [all 127 real Morphe
  Desktop selections](desktop-matrix.json) passed. The
  [four altered-input cases](rejections.json) failed closed as expected.
- The full candidate was exported by actual Android Manager 2.2.0 using JVM
  masks 4, 12, 36, 123 and 127 and ART masks 4 and 127. All seven exported
  APKs passed [independent signature, native-content and 16 KiB alignment
  verification](manager-outputs.json). Their same-key installations retained
  synthetic login, appearance, warning threshold and 22 downloaded media files;
  metadata order was checked where the corresponding patch was selected.
  [Installation and persistence summary](manager-persistence.json).
- The earlier, mask-4-only checkpoint was exported by Android Manager 2.2.0 on
  both JVM and ART and independently checked for signature, native contents
  and 16 KiB alignment. Its same-key installation retained synthetic login,
  appearance, warning threshold and all 22 downloaded media files; installed
  loading/error states were checked. This checkpoint is not the full candidate.

These checks use a disposable Android 15/API 35 ARM64 emulator and synthetic
data; they do not establish physical-device coverage.
