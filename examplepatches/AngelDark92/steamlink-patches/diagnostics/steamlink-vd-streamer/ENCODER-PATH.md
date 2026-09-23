# Installed Virtual Desktop Streamer encoder paths

2026-09-22 — read-only static investigation of Windows Streamer **1.34.22.0**. No installed files, settings, processes, SteamVR state, or devices were changed. These are application requests to encoder APIs, not a capture of an accepted encoder session or its bitstream.

The inspected HEVC 10-bit and AV1 10-bit branches request higher precision **before transmission**. This is separate from dithering a decoded image into an 8-bit client target. In the NVIDIA path, the submitted texture itself is still 8-bit BGRA. The codec configuration requests 10-bit encoding; it does not recover precision already lost in that RGB texture. The AMD path explicitly inserts an AMF converter. Neither inspected encoder setup supplies a noise texture or an explicit dithering/debanding operation.

## Inputs and evidence

| Installed file under `C:/Program Files/Virtual Desktop Streamer/` | Bytes | SHA-256 |
|---|---:|---|
| `VirtualDesktop.Streamer.exe` — file version 1.34.22.0 | 22,600,728 | `6bfec9e4e62509f4fdb0ec21c144b4584f9450701dcf5bd756d6fd2aec7cbb51` |
| `libVirtualDesktopAMF.dll` — file version 1.0.0.0 | 207,384 | `6b9db41dc1d1df78d8dca9e89fa1104fe400a05a2b1885b36fbfae4ae1966396` |

Managed method names are obfuscated, so stable metadata tokens and PE RVAs identify the code. Relevant artifacts are [selected managed IL](managed-selected.il.txt), [NVENC input IL](managed-nvenc-input.il.txt), [NVENC layouts and bitfield setters](nvenc-layout-evidence.txt), [NVENC profile and registration](nvenc-registration-evidence.txt), [AMF native excerpts](amf-encoder-excerpts.asm), and [encoder factory IL](managed-factory.il.txt). The native excerpt records instruction bytes, range hashes, and resolved property strings. Native addresses below are RVAs relative to image base `0x180000000`.

The managed enum distinguishes `HEVC10bit=6` and `AV110bit=11`. The encoder factory selects NVENC for NVIDIA vendor ID `4318`, AMF for AMD IDs `4098/4130`, and a SharpDX Media Foundation implementation as fallback. Bundled FFmpeg DLLs and their generic encoder/filter names are **not evidence** that these live-stream codec branches call FFmpeg or Quick Sync directly. The fallback's specific Intel driver implementation was not established.

## NVIDIA: BGRA8 resources with 10-bit codec configuration

`0x060215f0`, RVA `0x8931d8`, configures the NVENC session. Its codec predicates distinguish HEVC `2/6` and AV1 `10/11`. Capability checks can fall back from requested `11` to `6`, from `6` to `2`, and from `2` to `1`; a selected UI codec alone does not prove what a running session accepted.

| Request | Verified configuration |
|---|---|
| HEVC 10-bit (`6`) | HEVC `pixelBitDepthMinus8=2`; setter `0x06021610`, RVA `0x895694`, writes bits 11–13 of field `0x04014fd7` with mask `0x3800`. The ordinary HEVC branch sets zero. |
| AV1 10-bit (`11`) | AV1 `inputPixelBitDepthMinus8=2` and `pixelBitDepthMinus8=2`; setters `0x0602160d/0e`, RVAs `0x89555c/0x8955c4`, write bits 12–14 and 15–17 of `0x04014fbc`. Ordinary AV1 sets zero. |
| Color description | HEVC VUI `colourPrimaries`, `transferCharacteristics`, and `colourMatrix` are all `1`; AV1's corresponding fields are also `1` (BT.709). Range is supplied by the common range getter `0x06021527`, rather than derived from ten-bit depth. |
| Profile | The common `profileGUID` assignment uses `BFD6F8E7-233C-4341-8B3E-4818523803F4` (`AUTOSELECT`), initialized by `.cctor` `0x060215e4`, RVA `0x89296c`; the application does not write a literal HEVC Main10 GUID at this site. |

These field identities follow the sequential managed structure layouts and exact bitfield masks of the [NVIDIA-authored NVENC 12.0 API header](https://github.com/FFmpeg/nv-codec-headers/blob/n12.0.16.0/include/ffnvcodec/nvEncodeAPI.h), not guesses from obfuscated names. The header is used to interpret this older interface layout; newer SDK structure layouts differ.

After configuring any of these codecs, `0x060215fc`, RVA `0x8943e0`, creates four D3D11 input textures with `DXGI_FORMAT=87` (`B8G8R8A8_UNORM`, IL `003e–0040`), one mip and sample, and width × 4 pitch. It registers each with NVENC buffer format `0x01000000` (`ARGB`, IL `00f1`), not `ARGB10`, `P010`, or a float texture. This input allocation has no codec-depth branch. [NVIDIA's format definitions](https://docs.nvidia.com/video-technologies/pynvvideocodec/pynvc-api-prog-guide/using_pynvvideocodec_apis.html#surface-formats) distinguish ARGB8 from ARGB10.

The registration constructor `0x060216a2` stores that format argument unchanged in field `0x04015137` (IL `0051`); a verified IL-reference scan found one caller, `0x060215fc` at IL `00f7`. No alternate registration was found in this traced path. This is not a process-level interception of all driver calls.

Keep both facts: the AV1 configuration declares ten-bit input/output fields, while its actual registered resource is ARGB8. This does not match the documented meaning of AV1's input-depth field; the same older API also documents ten-bit surfaces for HEVC ten-bit encoding. Do not silently assume the driver accepts, fixes, or converts this combination. Application code alone does not reveal its internal RGB-to-YUV arithmetic or resolution of these declarations. It proves neither successful ten-bit encoding, ten-bit game capture, nor a ten-bit RGB resource. A resulting bitstream's profile, range, and depth require a bitstream/session observation.

This is not a general claim that NVENC cannot encode 8-bit input into 10-bit video.
The current [NVIDIA high-bit-depth guide](https://docs.nvidia.com/video-technologies/video-codec-sdk/13.0/nvenc-video-encoder-api-prog-guide/#high-bit-depth-encoding)
explicitly documents that capability with separate input/output depth fields:
HEVC uses a CUDA conversion on earlier GPUs and hardware conversion on Blackwell;
AV1 uses hardware conversion. That establishes a vendor conversion mechanism,
not the precise driver handling of this executable's older requests. The older
12.0 PDF was visible in search-index excerpts but returned HTTP 404 on direct
fetch; the pinned API header is the reproducible source for the older field mapping.

## AMD: an explicit conversion stage

`AMFApplyCodec` export RVA `0x3e10` jumps to `0x1cb0`. The managed import is `0x0602157b`, called by `0x06021563`, RVA `0x88e48c`. Comparisons at `0x1d8d/0x1d96` set the ten-bit path specifically for codec `6/11`; component creation selects `AMFVideoEncoderHW_HEVC` or `AMFVideoEncoderHW_AV1`.

| Stage/property | 8-bit codec path | Codec `6/11` |
|---|---|---|
| Input allocation | DX11 BGRA8 | DX11 BGRA8 |
| Converter input format | `3` (BGRA8) | `3` (BGRA8) |
| Converter `OutputFormat` | `1` (NV12) | `13` (R10G10B10A2) |
| Converter `InputTransferChar` | `1` (BT.709) | `16` (PQ) |
| Encoder `HevcColorBitDepth` / `Av1ColorBitDepth` | No explicit ten-bit override | `10` |
| Encoder input/output primaries | `1` (BT.709) | `1` (BT.709) |
| Encoder input/output color profile | `1` or `7` (studio/full BT.709), controlled by range argument | Same |
| Encoder output transfer | `1` (BT.709) | `1` (BT.709) |
| Encoder input transfer | `1` | `1`, or `14` for the AMD RX 90-series workaround below |

Input allocation is `AMFCreateInputBuffers` (`0x3e40` → `0x2ad0`), which calls context `AllocSurface(DX11=3, BGRA=3, …)` at `0x2c78`. The common converter tail at `0x2983–0x2a9d` sets memory type, transfer, output format and range, then initializes the converter with BGRA and the encoder with the converter output format. `AMFSubmitInput` (`0x4150` → `0x2d70`) submits the BGRA surface to the converter (`0x30ad`), queries its output (`0x30c6`), and submits that result to the encoder (`0x30db`). This establishes a statically traced data path through the converter rather than merely finding its name in the DLL; execution was not observed.

The constructor boolean stored at encoder `+0x44` changes the ten-bit encoder input transfer to `14`. Its managed source is `0x06021557`, which requires AMD and an adapter description containing `RX 90` case-insensitively; see [managed extra IL](managed-gamma-extra.il.txt). It is an adapter-specific workaround, not an HDR switch. The converter's PQ input property is a separate, verified request. Its precise effect is inside the installed AMF implementation: it must not be copied into a client shader as a proven PQ transform, or described as an HDR output path when the encoder output transfer remains BT.709.

Enum interpretation comes from AMD's [surface definitions](https://github.com/GPUOpen-LibrariesAndSDKs/AMF/blob/master/amf/public/include/core/Surface.h), [color definitions](https://github.com/GPUOpen-LibrariesAndSDKs/AMF/blob/master/amf/public/include/components/ColorSpace.h), and [converter interface](https://github.com/GPUOpen-LibrariesAndSDKs/AMF/blob/master/amf/public/include/components/VideoConverter.h). R10G10B10A2 is the AMF **encoder input** here; this is not evidence that the final encoded stream is RGB or 4:4:4. No explicit HEVC profile property was found in this inspected setup.

## What can transfer to a Steam Link client patch

The old VD-like options execute **after Steam Link has received and decoded the host's compressed frames**. They cannot change the host RGB-to-YUV conversion, pre-encode gamma, NVENC/AMF format/configuration, rate control, or lost quantization information. Adding the inverse of VD's host gamma to Steam Link's decoded output without the matching host transform would alter brightness rather than reproduce the paired VD pipeline. Likewise, a client noise function cannot reproduce a sender's ten-bit encoder settings.

The safe portable portion remains the separately verified client display behavior: retain the Steam Link decoder color correction and use an 8-bit output target for both input depths. Matching VD's whole pipeline would additionally require a separately researched SteamVR host change with matching client compensation. This report does not establish such a host patch or authorize any installed-host mutation.

No explicit dithering or debanding code was identified in these encoder configuration/data-flow excerpts. This bounded negative result does not rule out processing inside a vendor driver, encoder hardware, another untraced branch, or the Android compositor/display. See the adjacent shader investigation for the host effects' actual arithmetic. No visual-equivalence or headset-runtime result is claimed.

## Reproducing the static checks

The local [managed reader](managed-evidence.py) verifies the installed EXE hash before decoding IL; it does not load or execute Streamer code. With the existing scoped `build/vd-audit/tools` dependencies, selected methods can be printed as follows:

```python
import runpy
a = runpy.run_path('diagnostics/steamlink-vd-streamer/managed-evidence.py', run_name='encoder_audit')
for rid in [0x215e4, 0x215f0, 0x215fc, 0x2160d, 0x2160e, 0x21610]:
    print(a['dump'](rid))
```

For the native setup, the cached Android NDK's Windows `llvm-objdump.exe` accepts `--disassemble --start-address=0x180001cb0 --stop-address=0x180002acd` against the installed `libVirtualDesktopAMF.dll`. Compare its hash first. The saved native excerpts identify narrower ranges and their byte hashes; input allocation is `0x180002c50–0x180002c7e` and converter-to-encoder submission is `0x1800030a3–0x1800030e9`. No new dependency installation or large binary copy was required.
