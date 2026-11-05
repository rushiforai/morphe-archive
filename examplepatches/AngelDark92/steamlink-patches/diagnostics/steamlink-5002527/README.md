# Steam Link VR 2.0.24 / 5002527 adaptation

## Input and evidence limits

The retained decoded tree is `android-steamlinkvr-release-base-2.0.24-5002527/`.
Its retained binary manifest identifies `com.valvesoftware.steamlinkvr`, version
`2.0.24`, code `5002527`. The scene library is 2,333,472 bytes, SHA-256
`cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03`.
The binary manifest SHA-256 is
`784c34c2586b8f47d313ca56ecefa6c22d0ba4eb6d0722fcbabbb5ce5f1004c47`.

No pristine APK was located. Decoded-native audits establish mutations on those
retained bytes, not original ZIP provenance or pristine end-to-end compatibility.
The battery/controller production-patcher audit used an APK reconstructed from a
copy of the decoded tree. It is not an installable pristine base or ART validation.
There is no fresh headset, GPU-compiler or runtime proof for this adaptation.

## Independently derived native targets

| Feature | Exact 5002527 target |
|---|---|
| Tongue transport only | `XRQGetFaceTracking` at `0x143888`, 24-byte block at `0x143fdc`; x21 Android expressions, x8 FB2 weights |
| Microphone input | `OpenStreams` at `0xf8d88`, preset MOV at `0xf903c`, input-preset call at `0xf9040` |
| Visual Delay | `GetPose` hook at `0x102b90`, six velocity stores at `0x102e04/08/0c/18/1c/28` |
| Codecs Support | Init at `0xfe220`, anchors `0xfe22c/0x80`, `0xfebd0/0x80`, `0xfe220/0x40`; new runtime GOT profile |
| OLED swapchains | Two format sites at `0x10d630`, `0x10d6a8`; no underside swapchain |
| Video shader | 1206-byte prefix at `0xa3085`, 411-byte masked suffix at `0x9f70a`, 29-byte background suffix at `0x9b2c0` |
| Blue-noise draws | Foveal return `0xf6668`, background return `0xf6748` |
| Controller pose-time | `GetControllerState` at `0x1089fc/0xa9c`, `SendPoses` at `0x180fd0/0x550`, clock at `0x15f564/0x40` |

These addresses were derived from this build's ELF, instructions, callers and
relocations, not copied from 5002395. Source tables retain region hashes and
original/already-patched byte guards. Existing exact-base layouts remain intact.

5002527's stock `vInnerFade` uses uniform location 14. Blue-noise therefore selects
the separately pinned `libgxd-inner-fade.so` resource, installed as `libgxd.so`,
with helper-owned uniform slots 16/17. The stock declaration and native setter
remain unchanged. The standard helper is unchanged for prior bases. Host GL test
doubles do not establish real GPU acceptance of this new interface.

## Recommendation policy

The requested tongue-only bridge, microphone preset, Visual Delay, codecs,
unrestricted battery usage, OLED calibration, controller velocity frame and both
blue-noise layers are default-on for this exact base. Full face-layer installation
is excluded. Controller extrapolation, pose-time, HAL pose and grip/haptics remain
manual/default-off, as clarified by the owner. Pose-time still rejects combination
with HAL pose or extrapolation.

Network Optimizations remains recommended only on exact 2.0.20 bases
5001712/5001812. Later previously verified implementations remain available under
a distinct optional patch; no Network adaptation to 5002527 is claimed.

## Verification records

External derivation scripts, disassembly, native rebuilds and focused test reports
are retained under `../builds/steamlink-patches/build/`:

- `adapt-5002527-render/EVIDENCE.md`: render targets, uniform interface and focused checks.
- `adapt-5002527-codecs/EVIDENCE.md`: tongue register proof, microphone transitions and codecs profile.
- `adapt-5002527-controllers/README.md`: native profiles, action/config comparison and reconstructed DEX audits.

### Final integrated verification (2026-11-03)

- `:patches:test build :patches:buildAndroid :patches:generatePatchesList
  -PreleaseChannel=stable`: passed. JUnit: **240 executed, 16 skipped, 0 failures**
  (256 total). Skips are not compatibility evidence.
- The isolated source-only checkout, without decoded inputs, passed
  `:patches:test :patches:buildAndroid :patches:generatePatchesList
  -PreleaseChannel=stable`: **210 executed, 46 skipped, 0 failures**.
- Both main/test Kotlin compilation and Android packaging passed. All four app
  extension assemblies were included in the isolated build graph.
- Generated stable/all/experimental catalogs and `TECHNICAL_REFERENCE.md` refreshed.
  Direct catalog inspection confirms the requested exact-base defaults and four
  optional controllers. 4XVR catalog entries are unchanged from HEAD.
- `python -B .github/scripts/check_agent_docs.py` and `git diff --check`: passed.
- Independent read-only reviews found no outstanding defects after updating the
  two decoded blue-noise audit runners for layout-specific shader sizes/helpers.

Logs: `../builds/steamlink-patches/build/adapt-5002527-integrated-final.log` and
`adapt-5002527-isolated.log`. No CI, release, device installation or runtime check
was performed. No commit or push was requested or performed.

### Cleanup deferred

The mandatory cleaner preview was attempted after these builds. It refused to run
because other `cargo.exe`/`rustc.exe` builds were active. Its safety interlock was
not bypassed, no cleanup apply was attempted, and there is no successful cleanup
receipt for this task yet. Once those builds finish, run
`tools/Clean-BuildResidue.ps1`, review its protected-input/hash plan, then run it
with `-Apply` and retain the receipt. Generated isolated/native scratch remains
until that step succeeds; protected decoded inputs and source payloads remain.
