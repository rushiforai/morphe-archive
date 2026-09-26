# Steam Link XR client codec evidence — 2026-09-25

Read-only native inspection. The inspected Android XR decoder **unconditionally selects HEVC**; no H.264/AVC decoder alternative or client codec-selection request was established. This is evidence about the current client path, not proof that coordinated client/host changes are impossible.

## Fresh exact-base scope

Version pairs were checked against each decoded directory's `apktool.yml`, lines 10–11. Inputs are the existing `lib/arm64-v8a/libvrlink_scene.so` files. Decoded-input provenance does not establish a pristine installable APK.

| Exact version / code | Bytes | SHA-256 | Init VA / file offset |
| --- | ---: | --- | --- |
| 2.0.20 / 5001712 | 2221072 | `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` | `0xfd2f8` |
| 2.0.22 / 5002244 | 2251920 | `4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12` | `0xfa49c` |
| 2.0.23 / 5002363 | 2292008 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` | `0xfd6f0` |

All 3 fresh checks passed: exact SHA-256, complete 1020-byte `QSVLCodecNDK::Init` disassembly, 2 literal HEVC references, and only `video/hevc` among the scene library's `video/` MIME strings. The complete 5002363 Init body SHA-256 is `70d1d40c4edcde46f11185103543c06f3d535c661de3558aaa2ad4da98e02d2b`.

The existing full `Verify-StreamingAudit.ps1` was also attempted. It passed 5001712 and 5002244, then failed because the 5002296 scene-library input no longer exists at its configured path. The currently present decoded directories are the 3 listed above. No fresh 7-base validation is claimed; the existing verifier was not changed.

## Active path on 2.0.23 / 5002363

Addresses are native virtual addresses; the cited executable sites also have equal file offsets in this exact ELF. They are not offsets for other builds.

| Site | Evidence |
| --- | --- |
| `0xfa77c` / alternate `0xfa7e8` | `QSVLClientXR::Init` calls `QSVLRendererXR::Init`. |
| `0x10be54` | Renderer Init calls the `QSVLCodecNDK` constructor. |
| `0x10be5c` | Stores that decoder at renderer object +`0x10`. |
| `0x10be74–0x10be80` | Loads that decoder and invokes its virtual Init slot. |
| `0x224a80` | `_ZTV12QSVLCodecNDK`; constructor installs the address point at vtable +`0x10`. |
| `0x224aa0` | Relocation for address-point +`0x10` resolves `_ZN12QSVLCodecNDK4InitEv`. |
| `0xfd738` / `0xfd73c` | Loads literal `video/hevc` at `0x9324a`, then calls `AMediaCodec_createDecoderByType`. |
| `0xfd75c` / `0xfd760` | Loads the same HEVC literal, then calls `AMediaFormat_setString` with `AMEDIAFORMAT_KEY_MIME`. |
| `0xfd958` / `0xfd980` | Configures and starts the resulting decoder. |

The MIME choice is unconditional inside Init. It does not read a selected codec or branch to AVC. This is active-path evidence, stronger than finding an unused HEVC string or a generic decoder library.

## Decoder configuration constraints on 5002363

MediaFormat key identities were resolved through the ELF dynamic relocations, rather than inferred from integer values alone.

| Key | Value | Setter call |
| --- | ---: | --- |
| `AMEDIAFORMAT_KEY_WIDTH` | 896 | `0xfd778` |
| `AMEDIAFORMAT_KEY_HEIGHT` | 3584 | `0xfd790` |
| `AMEDIAFORMAT_KEY_MAX_WIDTH` | 1536 | `0xfd7a8` |
| `AMEDIAFORMAT_KEY_MAX_HEIGHT` | 7680 | `0xfd7c0` |
| `AMEDIAFORMAT_KEY_COLOR_TRANSFER` | 1 | `0xfd7d8` |
| `AMEDIAFORMAT_KEY_COLOR_STANDARD` | 6 | `0xfd7f0` |
| `AMEDIAFORMAT_KEY_COLOR_RANGE` | 1 | `0xfd808` |
| `AMEDIAFORMAT_KEY_COLOR_FORMAT` | 54, Android P010 | `0xfd820` |
| `AMEDIAFORMAT_KEY_PRIORITY` | 0 | `0xfd838` |
| `vendor.qti-ext-dec-low-latency.enable` | 1 | `0xfd84c` |
| `vendor.qti-ext-dec-picture-order.enable` | 1 | `0xfd860` |
| `low-latency` | 1 | `0xfd874` |
| `AMEDIAFORMAT_KEY_OPERATING_RATE` | 32767 | `0xfd88c` |
| `vendor.qti-ext-dec-heif-mode.value` | 1 | `0xfd8a0` |

No explicit MediaFormat codec-profile setter was found in this complete Init function. In particular, 32767 is **operating rate**, not a codec profile. P010 is a requested output storage format; this inspection does not prove the encoded stream profile, meaningful 10-bit samples, or panel precision. Initial/max dimensions are decoder configuration values, not measurements of a current stream.

An AVC adaptation would need to review the output format, color properties, vendor extensions and supported dimensions/profile alongside host encoder changes. Changing the MIME literal alone neither chooses the PC encoder nor proves decoder acceptance.

## Connection-request boundary

On exact 5002363, `SVLRoot::GetRequestedConnectionInfo` at `0x16c8f8` copies the byte vector from `LaunchOptions` +`0xa0`; it does not select a codec at that site. Its complete 112-byte function SHA-256 is `cb2de300fadd399ed68990ccf7933e3fef271b7e6945e18df5de38fc31599d35`. `SVLRoot::CreateConnectionInfo` at `0x16c968` is 8 bytes (`mov w0, wzr; ret`), returning 0.

The earlier [5001712 launcher trace](README.md#5001712-control-path-trace) separates the desktop Remote Play path from the decrypted VR connection blob passed through `StartVRLink`. The older vector offset +`0xd8` belongs to that older build. General desktop codec controls and bundled codec symbols do not establish a VR control. No host-accepted client codec-selection key, negotiated codec enum or AVC fallback was proved by this client investigation; opaque request data and indirect protocol consumers are not fully decoded.

## Reproduction and limits

Run from the repository root with the existing Python, Capstone and pyelftools dependencies; no package download is needed:

```powershell
python -B diagnostics/steamlink-streaming/audit_streaming_controls.py decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363/lib/arm64-v8a/libvrlink_scene.so --function '^_ZN12QSVLCodecNDK4InitEv$' --strings '^video/'
python -B diagnostics/steamlink-streaming/audit_streaming_controls.py decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363/lib/arm64-v8a/libvrlink_scene.so --function 'QSVLRendererXR4Init|QSVLCodecNDKC1|GetRequestedConnectionInfo|CreateConnectionInfo' --strings '^$' --callers
```

Repeat the first command with each exact input directory from the table, then compare the emitted size and SHA-256. The audit resolves adjacent ADRP/ADD string references; its linear caller scan excludes indirect calls. The vtable edge above was separately resolved using `.dynsym` and `.rela.dyn` relocations.

No device capability enumeration, APK patch/build/install, ADB command, SteamVR mutation, encoded-stream capture or on-device validation was performed. Client findings must be combined with host encoder evidence before making a support claim. Existing source, binaries, settings, README and verifier were unchanged.

Artifact lifecycle: this compact report is retained evidence. No disposable APK, decoded copy, bundle, compiler output or scratch dump was created. Python ran with `-B`; removed 0 artifacts, reclaimed 0 bytes. Existing exact decoded inputs and audit dependencies remain required inputs.
