# Steam Link VR codec ownership and H.264 feasibility

Read-only investigation, **2026-09-25**. This is a static finding for the exact
binaries below, not a new codec patch or a headset streaming test.

## Answer

**The PC SteamVR VRLink driver configures the video encoder. In the inspected
implementation, HEVC is explicitly selected on both PC and headset; there is
no working H.264 selection path established.** The Android client creates an
HEVC decoder directly rather than choosing its decoder from a negotiated
codec field. Changing only a client preference or MIME string cannot change
the PC's encoder.

| Component | Verified behavior | Implication |
|---|---|---|
| SteamVR NVIDIA path | Stores the HEVC codec GUID in the encoder initialization state | PC constructs HEVC encoder configuration |
| SteamVR AMD path | Requests `AMFVideoEncoderHW_HEVC` | AMD path also explicitly selects HEVC |
| Android VR renderer | Constructs `QSVLCodecNDK`, whose Init creates/configures `video/hevc` | Stock client expects HEVC, regardless of a hypothetical H.264 UI choice |
| Generic NVIDIA helper | Contains H.264-related validation branches | Useful implementation material, but not proof of a reachable H.264 VR mode |

Detailed native evidence and reproduction anchors are in
[the host report](HOST-CODEC-2026-09-25.md) and
[the client report](CLIENT-CODEC-2026-09-25.md).

## Scope and identity

- Installed SteamVR **2.17.10**, app build **25330290**. Current app manifest
  reports `BetaKey=public`; an earlier report's beta-channel label is not reused.
- Installed `drivers/vrlink/bin/win64/driver_vrlink.dll`: **13,908,632 bytes**,
  SHA-256 `1e846be041039798580a91452371f6288c614fb4c152126b137e2c693fb77eef`.
- Fresh client checks cover exactly **2.0.20/5001712**, **2.0.22/5002244**, and
  **2.0.23/5002363**, with version pairs checked against their decoded metadata.
- Decoded client inputs establish byte/code-path evidence, not pristine APK
  provenance, an installed-client identity, or live decoder acceptance.

## Existing controls do not provide the missing selector

`10bit`, `supports10bit`, and `force10bit` concern bit depth. The installed
default settings contain `10bit=true`. Native code reads `supports10bit` at
RVA `0x9eced8`, reads `10bit` at `0x9ed4e5`, and stores the result at object
offset `+0x104` at `0x9ed51b`; the explicit `force10bit` override is read at
`0x9ed558`. None of these names means H.264 versus HEVC.

`reqEncMode` is also not a video codec selector. The setting read at
`0x9fedff` is associated with `enableEncryption` and the values `aes`/`mid`
at `0x9fee7f`, `0x9fee97`, and `0x9feea7`. The parser at
`0xa2d2a0–0xa2d68c` recognizes `open`, `mid`, `aes`, and `auto`; its diagnostic
says auto defaults to open mode. Setting this field to `h264` would not select
an AVC encoder.

The historical 5001712 launcher trace separates desktop Remote Play from the
VR `StartVRLink` path. H.264 controls or libraries found in the general Steam
Link launcher are therefore insufficient evidence for VR support. In exact
5002363, `GetRequestedConnectionInfo` copies an existing launch-data vector,
and `CreateConnectionInfo` returns 0. The complete opaque connection contract
and every indirect peer-value consumer were not decoded; the conclusion rests
on the positive, active encoder/decoder initialization evidence.

## Could H.264 be added?

**Plausible in principle, but not demonstrated as a small patch or an existing
hidden setting.** Hardware/API H.264 support is distinct from Steam Link VR
support. NVIDIA exposes H.264 encoding, with capabilities dependent on GPU
generation; for example, its current table lists High10 for Blackwell but not
Ampere/Turing or Ada. See the
[NVIDIA NVENC application note](https://docs.nvidia.com/video-technologies/video-codec-sdk/13.1/nvenc-application-note/index.html).
This investigation did not query the headset's live AVC capabilities.

A selectable implementation would require:

1. A PC H.264 encoder configuration with matching profiles, input format,
   rate control, headers and recovery behavior. Existing HEVC-only assumptions
   need review; replacing a GUID does not prove a working stream.
2. An Android `video/avc` path with suitable MediaFormat settings. The current
   decoder requests P010/color format 54, codec-specific tuning and maximum
   dimensions of 1536 by 7680. AVC support at the actual packed stream size,
   frame rate and bit depth must be checked on both devices.
3. A shared selection contract, or an explicitly matched experimental mode,
   so the host and client always agree. Merely sending an invented peer key
   is not a negotiation implementation.
4. Live proof of the actual encoder, AVC bitstream and decoder, followed by
   rendered frames, reconnect/recovery and latency/quality validation.

The inspected NVIDIA helper also rejects a 10-bit input with H.264; newer
hardware support does not remove that software check. An 8-bit AVC prototype
would reduce the initial capability requirements, but is a proposed starting
point, not a verified working configuration. This study
does not establish that H.264 would improve latency, quality, or hitching.

## Checks and lifecycle

Fresh checks included exact binary hashes, complete client Init disassembly,
active renderer linkage, PC encoder initialization, relevant setting consumers,
and vendor definitions of the codec identifiers. No source binary, APK,
SteamVR setting, process or device was changed. No Gradle/Morphe build,
installation, ADB operation or headset reproduction was performed.

The historical `Verify-StreamingAudit.ps1` still lists retired fixtures and
fails when it reaches absent 5002296. The 3 currently present bases were checked
individually; a fresh 7-base pass is not claimed. That historical script was
left unchanged by this research task.

Only compact investigation documentation is retained. Existing exact decoded
bases and analysis tools remain required inputs. No patch experiment was run
or retired. Task-created scratch, if any, is accounted for in the host report.

Host setting/connection regions independently checked in this report (end
exclusive RVAs, preferred PE image base `0x180000000`):

| Region | SHA-256 |
|---|---|
| `0x9fa240–0x9fa653`, CreateConnectionInfo | `ed39d2f40eabde265f7b78960ff6f919e3399ab10e4952f70f20c2eb2dd1cbb7` |
| `0x9fedf7–0x9ff037`, settings reads | `9de871293ed3fce09d8d7e6394a9c1c6cd87f3a9cdf8c4acf57dac7b7752305c` |
| `0xa2d2a0–0xa2d68c`, EncModeFromString | `23d1963b487239b2a040eb46d1c4fe320437aa38f1cc27edb72f282b94e38b59` |
