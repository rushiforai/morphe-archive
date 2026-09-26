# SteamVR VRLink host codec audit — 2026-09-25

## Scope and exact input

Read-only native inspection of the installed Windows VRLink encoder. No DLL, settings, process, or device changes; no runtime encoding test.

- Input: `C:/Program Files (x86)/Steam/steamapps/common/SteamVR/drivers/vrlink/bin/win64/driver_vrlink.dll`
- File size: **13,908,632 bytes**.
- SHA-256: **1e846be041039798580a91452371f6288c614fb4c152126b137e2c693fb77eef**.
- Installed SteamVR app manifest build ID: **25330290** (app 250820).
- PE image base: `0x180000000`; addresses below are RVAs, not file offsets. Add the image base for disassembler VAs.
- Method: PE exception-directory ranges and x64 disassembly with `pefile`/Capstone; ASCII/UTF-16 constants and RIP-relative references. Exception ranges can split 1 source routine, so they are not independently asserted source-function boundaries.

## Result

The inspected NVENC and AMF host paths explicitly create **HEVC** encoders. The NVIDIA code contains generic H.264 checks, but its reachable initialization assigns the HEVC codec GUID unconditionally before passing the encoder initialization structure to NVENC. This is evidence against an existing H.264 selector in these paths; the presence of H.264 strings/GUIDs alone does not establish H.264 streaming support.

### NVIDIA NVENC

| RVA | Observed operation | Implication |
| --- | --- | --- |
| `0xc3d808` | GUID `6bc82762-4e63-4ca4-aa85-1e50f321f6bf` | NVIDIA H.264 codec GUID exists as a validation constant. |
| `0xc3d818` | GUID `790cdc88-4522-4d7b-9425-bda9975f7603` | NVIDIA HEVC codec GUID. |
| `0xa1e7a6`, `0xa1e7c8` | `movups xmm0,[HEVC_GUID]`; `movups [rsi+0x1b4],xmm0` | Vendor initialization stores HEVC before codec capability queries. |
| `0xa1d924`, `0xa1d960` | Load `[rdi+0x1b4]`, pass GUID into NVENC capability call | Capability checks use the selected HEVC GUID. |
| `0xa210f9` | Calls `0xa1ef20` when encoder initialization flag is clear | Normal encode path reaches the encoder initialization routine. |
| `0xa211a4` | Calls `0xa1ef20` after vendor reinitialization | Reset path uses the same initialization. |
| `0xa1ef8c`, `0xa1ef9f` | Load HEVC GUID and store `[rsi+0x1b4]` unconditionally | Reinitialization also explicitly selects HEVC. |
| `0xa1f0ff`–`0xa1f123` | Pass `[rsi+0x1b4]` to preset configuration call | Preset query follows HEVC selection. |
| `0xa1f29c`–`0xa1f2c6` | Choose profile constant `0xc3d838` or `0xc3d848`; write config profile | Profiles are HEVC Main (`b514c39a-b55b-40fa-878f-f1253b4dfdec`) and HEVC Main10 (`fa4d2b6c-3a5b-411a-8018-0a3f5e3c9be5`), selected by input format. |
| `0xa1f2e6`–`0xa1f325`, `0xa1f45c`–`0xa1f48c` | Compare selected GUID against H.264, including log `10-bit format isn't supported by H264 encoder` | Generic validation remains in the binary; this does not override the earlier HEVC selection. |
| `0xa1f498`, `0xa1f518` | Pass `[rsi+0x1b0]` initialization structure to API function; following error is `nvEncInitializeEncoder failed` | HEVC assignment reaches actual encoder initialization. |

Decisive instruction sequence from the normal initialization path:

```text
a1ef82 mov    dword ptr [rsi + 0x1b0], 0xf105000b
a1ef8c movups xmm0, xmmword ptr [rip + 0x21e885] ; HEVC GUID @ c3d818
a1ef93 mov    dword ptr [rsi + 0x1d8], edx
a1ef99 mov    dword ptr [rsi + 0x1e0], edx
a1ef9f movups xmmword ptr [rsi + 0x1b4], xmm0
...
a1f498 lea    rdx, [rsi + 0x1b0]
...
a1f511 mov    rcx, qword ptr [rsi + 0x1a0]
a1f518 call   qword ptr [rsi + 0x9a58]
```

### AMD AMF

| RVA | Observed operation | Implication |
| --- | --- | --- |
| `0xc3b298` | UTF-16 `AMFVideoEncoderHW_HEVC` | Explicit HEVC component identifier. |
| `0xa169a8`, `0xa169b5` | Pass that identifier to factory component creation during capability initialization | Capability initialization instantiates HEVC. |
| `0xa14d23`, `0xa14d30` | Pass that same identifier to factory component creation in `videoamfenc::CreateEncoder` | Actual encoder creation explicitly requests HEVC. |
| `0xa1770f` | Calls `0xa14c90` (`videoamfenc::CreateEncoder`) | Encode setup reaches the HEVC creator. |
| `0xc3b300` onward | `HevcProfile`, `HevcColorBitDepth`, `HevcUsage`, `HevcSlicesPerFrame`, `HevcInsertHeader`, `HevcForcePictureType`, other HEVC property strings | Initialization and per-frame controls are specialized for AMF HEVC. |

No AMF AVC component identifier was found in the scanned UTF-16 strings. This absence supports the traced HEVC path; it is not alone a proof covering every conceivable dynamically constructed string.

## H.264 feasibility limits

A codec GUID swap alone is insufficient: the current NVENC setup also chooses HEVC profiles and writes HEVC configuration fields; the AMF path uses HEVC component/property names. A real H.264 option requires a deliberate host encoder branch with appropriate H.264 profile/configuration, plus agreement with the client decoder and any HEVC-specific stream/header parsing. The driver contains reusable generic NVENC validation code, but no working H.264 VR stream was demonstrated.

This report establishes the host side only. Client MIME selection and protocol negotiation must be assessed independently. No claim is made that all Steam Link modes, GPU vendors, historical builds, or future SteamVR builds behave identically.

## Primary API references

- NVIDIA header, codec/profile GUIDs and initialization API: https://github.com/NVIDIA/video-sdk-samples/blob/master/Samples/NvCodec/NvEncoder/nvEncodeAPI.h
- AMD HEVC component declaration: https://github.com/GPUOpen-LibrariesAndSDKs/AMF/blob/master/amf/public/include/components/VideoEncoderHEVC.h
- AMD HEVC API: https://github.com/GPUOpen-LibrariesAndSDKs/AMF/blob/master/amf/doc/AMF_Video_Encode_HEVC_API.md

## Reproduction and artifact lifecycle

Verify the exact hash with `Get-FileHash -Algorithm SHA256` on the input path. With this repository's retained Android LLVM tool, disassemble VA range `0x180a1ef20`–`0x180a1f531` for the main NVIDIA proof and `0x180a14c90`–`0x180a14da5` for AMD creation:

```powershell
& '.android-sdk/ndk/27.2.12479018/toolchains/llvm/prebuilt/windows-x86_64/bin/llvm-objdump.exe' -d --start-address=0x180a1ef20 --stop-address=0x180a1f531 'C:/Program Files (x86)/Steam/steamapps/common/SteamVR/drivers/vrlink/bin/win64/driver_vrlink.dll'
```

Temporary scanner scripts and expanded disassemblies were generated only under `build/codec-audit-20260925/host-encoder/`. Their compact findings and regeneration command are retained here; that scratch directory was removed after its resolved path and absence of reparse points were verified (**140,669 bytes reclaimed**). Existing SDKs, Python analysis dependencies, input binaries, and other agents' evidence remain intact.
