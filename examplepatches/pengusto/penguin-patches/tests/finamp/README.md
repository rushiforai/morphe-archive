# Finamp native patch verification

The supported input is the official **Finamp 1.0.1 universal APK**, SHA-256
`0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581`.
Output is ARM64 only. See [the user guide](../../docs/FINAMP_NATIVE.md).

Bits: 1 = title validation, 2 = song artist order, 4 = artist-page loading,
8 = offline performing-artist filtering, 16 = Tracks alphabet navigation,
32 = player output access, 64 = quick-settings banner contrast.
Every nonempty combination has its own delta against the original snapshot.
The [source matrix](native-sources.json) pins complete, public MPL-2.0 source
trees; it is not a set of patches against current Finamp redesign.

The current matrix has 127 nonempty selections. Historical 1.1.0 reports below
cover seven selections; use that tag's scripts to reproduce its exact bundle.
Current UI-fix acceptance is documented in `README-ui-fixes.md`; the earlier
five-patch suite remains in `README-next-fixes.md`.

## Verify a release bundle

Python 3.10+; verification uses only the standard library. From the repository
root, set `FINAMP_APK` to the downloaded original and `MPP` to the bundle:

```sh
python3 -B tests/finamp/validate_bundle.py --bundle "$MPP" \
  --original-apk "$FINAMP_APK" --source-matrix tests/finamp/native-sources.json \
  --report .scratch/finamp/bundle-verification.json
```

This replays all 127 payloads, checks source pins, output sizes/hashes, Dart
snapshot compatibility and compiled feature markers. The manual Release workflow
runs it before publishing a bundle. APKs and signing keys are never committed
or included in the MPP.

## Rebuild native payloads

Use Flutter 3.47.2 framework `d3b14c876900e553bc736ca19295fc09e3853e8e`,
engine `a804b261645ef8c13eb3d5c44a5c2fb0340c5539`, Dart 3.13.2, Android
NDK `llvm-strip`, and a Python environment with `bsdiff4==1.2.6`.
Clone `https://github.com/pengusto/finamp.git` and fetch the 128
`penguin/finamp-native-1.0.1-mask-*` branches. Run:

```sh
python3 -B tests/finamp/build_native_payloads.py \
  --source-repo "$FINAMP_SOURCE" --source-matrix tests/finamp/native-sources.json \
  --flutter "$FLUTTER/bin/flutter" --original-apk "$FINAMP_APK" \
  --strip "$LLVM_STRIP" --work-dir "$PWD/.scratch/finamp/native-build"
```

The builder owns a separate checkout under its work directory, enforces the
committed dependency lock, generates translations, compiles and strips the
snapshot, then verifies a delta replay. It replaces the production manifest only
after all 127 masks complete. `--masks 2` defaults to private partial output;
partial runs cannot write into production resources. Use `--output` for a
separate full exploratory rebuild too.

The published deltas replay byte for byte to their pinned hashes. A fresh source
build in a different directory is **not claimed byte reproducible**: Flutter
embeds an absolute generated plugin-registrant URI, affecting snapshot layout.
The generated report records each rebuilt output. Do not replace one published
payload without updating and verifying its complete manifest.

## Codec and actual patcher checks

Run the codec tests in the producer's Python environment with `bsdiff4==1.2.6`.
The bundle verifier and patcher checks themselves need no Python dependencies.

```sh
python3 -B -m unittest discover -s tests/finamp -p 'test_*.py' -v
python3 -B tests/finamp/patch_matrix.py --java "$JAVA_HOME/bin/java" \
  --desktop "$MORPHE_DESKTOP" --bundle "$MPP" --original-apk "$FINAMP_APK" \
  --native-report .scratch/finamp/bundle-verification.json \
  --output-dir .scratch/finamp/new-matrix
python3 -B tests/finamp/reject_inputs.py --java "$JAVA_HOME/bin/java" \
  --desktop "$MORPHE_DESKTOP" --bundle "$MPP" --original-apk "$FINAMP_APK" \
  --output-dir .scratch/finamp/new-negative
```

Use fresh output directories. Tested with Morphe Desktop 1.18.1 / Patcher 1.15.1 and Desktop 1.19.1 / Patcher 2.0.1.
The matrix verifies selected names and every retained APK entry: only ARM64
`libapp.so` changes; non-ARM64 native entries are removed. The four negative
inputs must produce an error, nonzero status and **no APK**, including a forced
wrong version. Reports must be valid JSON and attribute the failure to at least
one selected patch. A hidden dependency failure alone is insufficient: Manager
2.x filters unselected dependency results before checking their errors. Every
selected feature has a finalizer; the first applies the combined mask once and
later finalizers reuse its success or propagate its cached failure.

`DeltaProbe.kt` exercises the actual Kotlin decoder against independent producer
vectors, including invalid headers, controls, compressed streams and hashes.
The recorded run passed 304 assertions over 71 producer vectors. Python codec
and output-policy regressions are separate from the 224 overlapping Flutter
source-test executions across seven trees (56 in the all-fix tree).

## Android acceptance and screenshots

The [fixture instructions](README-fixture.md) describe the synthetic Jellyfin
server, generated WAV tracks, disposable emulator restrictions and UI acceptance
script. The recorded same-certificate chain is **0 → 7 → 1 → 7 → 0 → 7**:
original code, all fixes, title only, all fixes, original code, all fixes. Only
`adb install -r` occurs within this chain. Login and Dark theme survive every
update; the artist mode survives cold restart, removal and reapplication. The
auxiliary primitive Hive box avoids registering new types in original settings.

Actual APK captures and machine-readable results are in
[evidence/2026-10-28](evidence/2026-10-28). These use disposable synthetic data.
They do not establish physical-device, other-Android-version, live-server timing
or RAM results. The subsequent [actual Android Manager acceptance](evidence/2026-10-28-manager/README.md)
verifies selection/apply/export, both execution backends, one update/start and
state retention on the same API 35 emulator; physical phones remain untested.
[Repeatable Manager workflow](README-manager.md). The source/widget screenshots
in the upstream PRs are separate from these APK captures.
