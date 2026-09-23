# Streaming controls: native feasibility audit, 2026-09-18

Status: **implementation blocked at feasibility**, not a released Morphe patch.
No APK, bundle, catalog, host setting or device was changed by this audit.

## Findings

- All available decoded ARM64 scene libraries directly select `video/hevc`
  inside `_ZN12QSVLCodecNDK4InitEv`. Each has 2 literal references: decoder
  creation and the MediaFormat MIME setting. This is native code evidence,
  not an inference from bundled H.264/HEVC libraries.
- A decoder MIME replacement cannot make the host encode H.264 or AV1. No
  host-accepted VR codec-selection request was established. This does not prove
  that such a request is impossible; opaque connection data and indirect
  dispatch remain investigation gaps.
- No 350 Mbps clamp or effective APK-side bitrate override was established.
  Do not add a numeric slider or replace occurrences of 350 without a traced
  consumer and verified units. Prior [host measurements](../steamlink-hitches/REPORT-2026-09-15.md)
  show a 400 Mbps setting but about 325 Mbps adapter-wide traffic, not encoded
  video above 350 Mbps. A saved 350 Mbps setting is not evidence of a hard cap.
- The 5001712 launcher contains general Remote Play codec/bitrate symbols and
  `--bitrate`/`--hardwarebitratelimit` strings. Their applicability to VR has
  not been demonstrated. The inspected VR branch differs from desktop launch.

## Exact native evidence

Inputs: `decoded-apk-android-steamlinkvr-release-base-VERSION-CODE/lib/arm64-v8a/libvrlink_scene.so`.
Version labels were checked against each folder's `apktool.yml`. This audit
does not establish pristine source APK provenance or runtime compatibility.
Every Init function below is 1020 bytes and decoded completely.

| Version / code | File bytes | Init VA | MIME address | MIME-reference instruction VAs |
| --- | ---: | --- | --- | --- |
| 2.0.20 / 5001712 | 2221072 | 0xfd2f8 | 0x97bc9 | 0xfd340, 0xfd364 |
| 2.0.22 / 5002244 | 2251920 | 0xfa49c | 0x91b32 | 0xfa4e4, 0xfa508 |
| 2.0.23 / 5002363 | 2292008 | 0xfd6f0 | 0x9324a | 0xfd738, 0xfd75c |

Full input SHA-256 pins are retained in [Verify-StreamingAudit.ps1](Verify-StreamingAudit.ps1).
The audit JSON also emits function SHA-256, file offsets, instructions and coverage.

## 5001712 control-path trace

Addresses below are virtual addresses in the named library, not transplantable offsets.

| Library | Symbol / address | Observed behavior |
| --- | --- | --- |
| libshell_arm64-v8a.so | CPanelConnect::StartStreaming, 0x1200f98 | VR branch decodes/decrypts a connection blob; desktop branch separately calls CShellApplication::StartStreaming at 0x1201314. |
| libshell_arm64-v8a.so | VR branch, 0x12013c4 / 0x1201498 | Calls SymmetricDecrypt, then forwards the resulting string to StartVRLink, optionally prepending the host address. |
| libshell_arm64-v8a.so | CShellApplication::StartVRLink, 0x1214310 | JNI call to Java startVRLink(String), no codec or bitrate decision in this function. |
| libvrlink_scene.so | XrSceneStream::Focused, 0x117eec | External arguments copied into LaunchOptions before constructing QSVLClientXR at 0x1182b0. |
| libvrlink_scene.so | SVLRoot::GetRequestedConnectionInfo, 0x164e70 | Copies the LaunchOptions +0xd8 byte vector; does not decide codec or bitrate here. |
| libvrlink_scene.so | SVLRoot::CreateConnectionInfo, 0x164ee0 | Returns 0 in this build; not a client-setting builder. |
| libvrlink_scene.so | QSVLCodecNDK::Init, 0xfd2f8 | Literal HEVC at decoder creation and MIME configuration. |
| libvrlink_scene.so | QSVLCodecNDK::SubmitFrameForDecode, 0xfdbd8 | Checks input-buffer capacity and queues compressed data to MediaCodec; capacity is not an encoding-rate cap. |

`SVLRoot::SetValue(string,double)` has 28 detected direct calls. Its callers
include frame timing, audio/transport statistics and FEC handling. The inspected
HandleEvent call at 0xf4da8 constructs a phase-fault diagnostic key, not a
bitrate preference. Generic SetValue/peer transport availability does not prove
the host accepts a proposed setting. No fabricated peer key is used.

The complete linear scan covered `.text` (1146468 bytes, 416 skipped as data or
unrecognized instructions) and `.plt` (27360 bytes, 0 skipped). This is not
complete call-graph or reachability proof: indirect calls are excluded, and
linear disassembly can encounter data. String annotations only resolve adjacent
ADRP/ADD pairs and do not track general register flow.

## Reproduction and checks

Requires Python 3.9+ plus Capstone and pyelftools. By default the tool uses the
existing `build/oled-native-audit/python` dependency directory; override with
`--python-tools` when running the Python audit directly. No network install,
APK extraction, output binary, or device connection is required.

From the repository root:

```powershell
.\diagnostics\steamlink-streaming\Verify-StreamingAudit.ps1
python -B diagnostics/steamlink-streaming/audit_streaming_controls.py decoded-apk-android-steamlinkvr-release-base-2.0.20-5001712/lib/arm64-v8a/libvrlink_scene.so --callers
python -B diagnostics/steamlink-streaming/audit_streaming_controls.py decoded-apk-android-steamlinkvr-release-base-2.0.20-5001712/lib/arm64-v8a/libshell_arm64-v8a.so --function 'CPanelConnect14StartStreaming|CShellApplication11StartVRLink' --strings '^$' --callers
```

Focused checks cover exact input hashes, complete Init disassembly, 2 HEVC
references per base, decoder-creation calls, known direct-call locations, and
anchored symbol filters matching PLT calls. Earlier coverage-report indentation
and accounting failures were repaired and the focused checks rerun. No Gradle,
Morphe APK patching, installation, headset or encoded-throughput test was run:
production implementation has not passed the feasibility gate.

## Remaining implementation gate

Trace a host-accepted VR request end to end before implementing either control.
Decode the opaque connection contract and resolve relevant indirect peer-value
consumers; do not substitute desktop streaming options. The next dependency
needed is evidence of the host-side VR request consumer (protocol documentation
or read-only native analysis), not permission to change host settings. Under the
APK-only scope, a host-only control remains a blocker.

Once supported, retain Auto/stock defaults, strict forced-codec failure, and
validated increase/decrease bounds. Use a standalone `default=false` patch,
excluded from every recommendation dependency closure but independently
selectable alongside compatible bundles/individual patches. Prove atomicity,
idempotence, option transitions and composition on every declared exact base.
Do not publish placeholder controls or widen compatibility to bypass this gate.

## Artifact lifecycle

2026-09-18: read-only audit; existing decoded libraries and dependency tools
retained as required inputs. No task-created APKs, decoded copies, bundles,
compiler output or workspace scratch dumps were produced. Python ran with `-B`.
Removed 0 artifacts, reclaimed 0 bytes. Compact evidence and reproduction code
remain here; editor-managed terminal logs are outside repository cleanup scope.
Unrelated USB-streaming changes remain untouched.