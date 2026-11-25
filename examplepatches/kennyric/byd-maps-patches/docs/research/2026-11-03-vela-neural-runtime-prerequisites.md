# Vela native adapter runtime prerequisites

Target: Vela 0.5.2621 / 46210. Source interpretation uses `../Vela` tag `v0.5.2621`, commit `94a83b86de37c9c8cd704167b927888da155b6d9`, together with the original APK bindings. These are preparation records; no device installation or runtime acceptance is asserted here.

## Strict runtime runner

`run_vela_production_probe.py` admits an **already installed** target by exact APK SHA-256, version and application UID. Its default `vela` profile accepts only `emulator-5582`, `ro.kernel.qemu=1`, the exact `native_warnings_vela_api34` AVD and booted Android 34. The separate explicit `shared` profile retains the original exact `emulator-5580` / `native_warnings_api34` admission; serial/name combinations cannot cross profiles. It installs only the hash-bound helper, verifies the installed target/helper bytes before and after instrumentation, and requires the exact requested case set with `probe_status=passed`. Missing neural models remain inconclusive and cannot publish a success report.

The helper must define only the reflection-based `NativeWarningProbe`/`VelaAdapterProbe` families and target `app.vela` in its instrumentation manifest. Target and helper signing certificates must match. Successful reports are archived before a rerun and the new result is published atomically only after verification.

The initial supported adapter candidate was signed with a different certificate from the isolated native-warning test identity. A separate copy was signed with `native-warning-test.p12`; every non-signing ZIP payload was verified unchanged and the original candidate remains intact:

| Item | SHA-256 |
| --- | --- |
| Preserved candidate `.analysis/native-warning-bindings/vela-supported-warnings/vela.apk` | `15669aae34d65964a1c55ce3e3a3ee52bcbaf6548cadaa3200ddcdccde9ae2f0` |
| Its original signing certificate | `b16b4097649da960b9788350f1b7ef394cf23b37795659782a4b29913918f212` |
| Test copy `.analysis/native-warning-bindings/vela-adapter-test-identity/vela.apk` | `d5563068496d3ef26c2a372346fdd8e1bc06ddc7993b644ce3627d0db357e8f7` |
| Reflection-only Vela probe | `8f6c01865ec5ee3ba7d94a87fd130de319995f924422a82f745ab6a81e9d9828` |
| Shared test-copy/probe certificate | `2ce9d34e9493f2bb91c9c7863ba2a4e839f5ef27864e404e8a5624ebc0be0597` |

The signing relationship is retained in `.analysis/native-warning-bindings/vela-adapter-test-identity/provenance.json`. This candidate predates later shared recovery/status edits; its scope is the native adapter.

After the owned AVD is handed over and the exact test copy is installed, run from the worktree with `ANDROID_HOME` pointing to the local SDK:

```bash
python3 scripts/navigation-alerts/run_vela_production_probe.py \
  --adb "$ANDROID_HOME/platform-tools/adb" \
  --profile vela --serial emulator-5582 \
  --target-apk .analysis/native-warning-bindings/vela-adapter-test-identity/vela.apk \
  --target-sha256 d5563068496d3ef26c2a372346fdd8e1bc06ddc7993b644ce3627d0db357e8f7 \
  --pre-signing-candidate .analysis/native-warning-bindings/vela-supported-warnings/vela.apk \
  --pre-signing-sha256 15669aae34d65964a1c55ce3e3a3ee52bcbaf6548cadaa3200ddcdccde9ae2f0 \
  --probe-apk .analysis/native-warning-bindings/vela-production-reflection-probe/probe.apk \
  --probe-sha256 8f6c01865ec5ee3ba7d94a87fd130de319995f924422a82f745ab6a81e9d9828 \
  --scenario adapter_all \
  --output .analysis/native-warning-bindings/vela-adapter-runtime
```

`adapter_system` runs system output/cancellation and current-step/after-passage native regeneration. `adapter_neural` runs selected-model output and cancellation. `adapter_all` requires both. API playback evidence, source transport/recovery, acoustic output and actual phone/car acceptance have separate scopes.

## Real native neural model

Pinned source authorities:

- `core/.../voice/VelaPiper.kt`: `ENGINE_ID="vela.piper"`, filesystem registry, model resolution and `voice_model` preference.
- `core/.../voice/PiperCatalog.kt`: official archive URL construction and catalog IDs.
- `app/.../voice/KokoroInstaller.kt`: archive download/extraction and staging layout.
- `app/.../voice/PiperSynth.kt`: actual model loading and speaker/speed selection.
- `app/.../ui/map/MapViewModel.kt:7880`: `downloadVoice`; first installed model activates through native `selectVoice`.

Original DEX corroborates `os1.B/q/u/x`, `wy4.d`, and `y43.a/b/g/k`: ready filesystem directories are required, `vela.piper` routes to the bundled neural backend, and `y43.d` must contain the actual loaded OfflineTts model before readiness can be advertised.

The required app-private layout is:

```text
files/piper/en_US-hfc_female-medium/
  en_US-hfc_female-medium.onnx
  tokens.txt
  espeak-ng-data/
```

`vela_settings/voice_model` selects an installed ID. With no valid selection, the native resolver chooses the first complete installed directory. Installing only the default English model therefore needs no fabricated model object or forced preference value. An existing valid selection must be inspected and preserved. The probe selects the real `vela.piper` engine on its owned native guide and lets the native resolver load the installed files.

The [official sherpa-onnx tts-models release](https://github.com/k2-fsa/sherpa-onnx/releases/tag/tts-models) currently supplies the pinned-source default archive:

- URL: `https://github.com/k2-fsa/sherpa-onnx/releases/download/tts-models/vits-piper-en_US-hfc_female-medium.tar.bz2`
- GitHub asset ID: `323261478`.
- Size: `67,228,166` bytes.
- Release-API digest and downloaded digest: `3fffdceb0c65bd9415a085d09c3cb88cc82f9d74a6ca453f8ce7fc5eaee81ff8`.

The host archive is `.analysis/native-warning-bindings/vela-models/en_US-hfc_female-medium.tar.bz2`. All 397 archive entries were checked: a single expected root, no absolute/parent paths, links, devices or other nonregular entries. Safe extraction produced 359 files / 81,147,190 bytes at `.analysis/native-warning-bindings/vela-models/extracted/en_US-hfc_female-medium`.

| Native file | SHA-256 |
| --- | --- |
| `en_US-hfc_female-medium.onnx` | `a8a935660c1d719e170312da2833f1e651ee29149b55087f89be7b44c3dfba52` |
| `tokens.txt` | `620e1aecf1a68fea3ba5850d137b0138fa2037c9b372dad13b95a2a215d0849a` |

Archive provenance and every extracted file digest are retained beside the archive. The host staging step inspected no device state. A subsequent authorized fresh Vela-only AVD installation is recorded in `.analysis/native-warning-bindings/vela-fresh-avd/setup.json`: UID 10192, all 359 model file hashes and file owners verified, with no user-data image clone.

## Installation after the AVD handoff

Run device admission first: exact AVD/qemu/Android/boot state, installed test-copy SHA/version and actual `app.vela` UID. Install the signed test copy before placing model files, because reinstalling an app can change its UID/data directory. The target runner performs admission for a run; model setup must apply those same checks before its separate copy operations.

Use the owned emulator's existing root shell only; never apply this procedure to USB/physical targets. Verify that `id -u` is zero, that `/data/user/0/app.vela/files` belongs to the admitted application UID, and that the destination model directory does not already exist. Preserve any existing installation instead of overwriting it.

For an absent destination, execute these commands individually; substitute the previously verified numeric application UID for `APP_UID` in the ownership command:

```bash
adb -s emulator-5582 shell mkdir -p /data/local/tmp/native-warning-vela-model
adb -s emulator-5582 push .analysis/native-warning-bindings/vela-models/extracted/en_US-hfc_female-medium /data/local/tmp/native-warning-vela-model/
adb -s emulator-5582 shell mkdir -p /data/user/0/app.vela/files/piper
adb -s emulator-5582 shell test ! -e /data/user/0/app.vela/files/piper/en_US-hfc_female-medium
adb -s emulator-5582 shell mv /data/local/tmp/native-warning-vela-model/en_US-hfc_female-medium /data/user/0/app.vela/files/piper/en_US-hfc_female-medium
adb -s emulator-5582 shell chown -R APP_UID:APP_UID /data/user/0/app.vela/files/piper/en_US-hfc_female-medium
adb -s emulator-5582 shell restorecon -RF /data/user/0/app.vela/files/piper/en_US-hfc_female-medium
adb -s emulator-5582 shell sha256sum /data/user/0/app.vela/files/piper/en_US-hfc_female-medium/en_US-hfc_female-medium.onnx /data/user/0/app.vela/files/piper/en_US-hfc_female-medium/tokens.txt
```

Verify the two hashes above, application ownership and phonemizer directory, then run the strict adapter suite. The real native load/generation/output result remains the acceptance gate; copied files or an `e=true` dispatch flag alone cannot establish readiness. Staging paths stay within the disposable AVD and host analysis directory.

## Subsequent runtime preparation

An independent `native_warnings_vela_api34` AVD was created from the installed API 34 Google APIs arm64 image, with fresh data under `.analysis/native-warning-bindings/` and its own `vela-avd-index`. Ports 5582/5583 were checked free first. The shared 5580 AVD, 5570 and USB devices were not accessed.

Actual instrumentation exposed two private harness ABI assumptions: `oh0` is a concrete R8 merged class, and mutable flow `o64` uses `j(Object)` as its setter. The probe now leaves the original recorder untouched, updates its owned real native state through that setter, and derives expected current-route speech through the original native generator return events before requiring matching actual TTS start/done IDs.

The neural suite passed with the genuine installed HFC Female model and its selected speaker 0. Its baseline observed playback-head advancement to 93,399 frames and real STARTED/COMPLETED callbacks; pending cancellation had no STARTED; active cancellation observed STARTED and a positive quiescent CANCELLED. Evidence: `.analysis/native-warning-bindings/vela-fresh-adapter-neural/result.json` (probe v2, SHA `dd3ef78eb056f15ece3acb0aac98531164d88db0a4badc7cc48e7f45102ae574`).

Observing the same installed Android TTS listener requires diagnostic hidden-API access in this disposable AVD. The system test wrapper temporarily uses `hidden_api_policy=1`, restarts only `app.vela`, and restores the previous `null` setting in `finally`. This affects the private observer's reflection access; product code is unchanged. Diagnostic restoration is retained in `.analysis/native-warning-bindings/vela-fresh-avd/system-observer-diagnostics.json`. System output/cancellation passed individually before the harness setter correction; the complete regeneration suite must pass its strict runner before being accepted.
