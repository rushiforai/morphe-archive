# Native image cleanup candidate and installed-patch verification

Checked 2026-09-15. **A conditional cleanup gap exists in the stock renderer error
paths on both 2.0.22/5002322 and 2.0.23/5002363. It has not been established as the
cause of the current hitches.** The initial retained headset log has 0 occurrences
of the errors that enter these paths. Keep this finding separate from live
network, decode, compositor, and memory measurements.

This investigation read local ELF files and the APK already pulled by the live
collector. It made no device calls, installed no changes, and did not modify any
patch implementation or base APK.

## Inputs and verification method

| Input | Bytes | SHA-256 |
|---|---:|---|
| Stock 2.0.22/5002322 `libvrlink_scene.so` | 2,283,400 | `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f` |
| Stock 2.0.23/5002363 `libvrlink_scene.so` | 2,292,008 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` |
| Installed 2.0.23/5002363 `libvrlink_scene.so` | 2,292,008 | `377547082a561b7c1f9eb3cfe9314f94b2e57602f3dea917fa8a27526d626f5b` |
| Installed `libgxr_ast.so` | 956,936 | `5db15199e6e3bcd5602b4fc04ad4e61a38916a5d1957c3dd25662e4c36c7aebf` |

Stock inputs are under the exact-version `decoded-apk-android-steamlinkvr-release-base-*`
directories. Installed inputs and the initial log are under
`build/live-hitch-20260915/run-124246/`.

The native audit uses ELF dynamic symbols, PT_LOAD mappings, and PLT relocations
to resolve AArch64 branch targets, using the existing local pyelftools and Capstone
packages. Addresses below are virtual addresses. All listed renderer instructions
also have equal file offsets in these verified inputs. The Visual Delay trampoline
has a different virtual address and is identified separately below.

The installed `FlipFrame` body at `0x10cd00`, length 3,000 bytes, is byte-for-byte
identical to the stock 5002363 body. The current patches therefore neither create
nor repair the cleanup branches discussed here. Previous adaptation references:
[native target audit](../steamlink-5002363/native-targets.md) and
[decoder ownership audit](../steamlink-direct-surface/README.md).

## Installed patch selections: verified bytes

The installed native libraries, both DEX files, Android manifest, and config
assets match the previously verified production-bundle output at
`build/audit-5002363/archive-patching/recommended-5002363/steamlink-5002363-recommended-unsigned.apk`.
This output was generated using the packaged local `.mpp` and the original APK.

| Patch/option | Installed evidence |
|---|---|
| High-resolution helper | `libgxr_ast.so` exactly matches packaged resource and audited APK; embedded build ID `android-surface-trigger-passthrough-v1.4-20260903` |
| Visual Delay Fix | Hook `0x101f1c` branches to virtual `0xc7f0f0`; trampoline file offset `0x22f0f0` adds `0x3938700` ns = **60 ms**; all 6 HMD velocity stores write zero |
| OLED calibration | Prefix `0x970a1`, 1087 bytes: highp sampler/arithmetic, gamma **1.20**, saturation **1.45** |
| Video dithering | `DITHER_ENABLE=0.`: **Off** |
| Projection format | `mov w9,#0x8c43` at `0x10c840`, `0x10c8b0`, `0x10c920`: **GL_SRGB8_ALPHA8** at all 3 creation sites |
| Microphone | `mov w1,#6` at `0xf44c0`: **Voice Recognition** |
| Tongue mapping | Exact expected 24-byte replacement at `0x141c6c` |
| Battery/startup Java code | Both DEX files and Android manifest exactly match the audited 6-patch default bundle |

The installed scene has 1,086 changed bytes relative to stock, all in the expected
ELF-header/trampoline, OLED prefix, microphone, HMD-pose, and tongue regions. The
projection format instructions remain stock because the selected output is sRGB8.

Only `libgxr_ast.so` is added to the native library inventory. The APK has the
matching implicit OpenXR API-layer manifest. No retired Surface-video, underside,
warmup-omit, or controller-velocity helper is present.

Whole APKs are not claimed identical: 113 ZIP entries match the prior unsigned
audit output; 4 resource XML entries (`res/01.xml`, `res/Yk.xml`, `res/jE.xml`,
`res/oH.xml`) differ, and the installed APK adds 3 MORPHE signing entries. These
resource differences were not interpreted as a native renderer change.

## Conditional renderer cleanup gap

### Missing frame metadata after successful image import

`QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)` obtains an AImage from
the frame server, gets its hardware buffer, acquires an additional hardware-buffer
reference, and creates an EGLImage. It then requests transport metadata for that
frame. The metadata-null branch releases only the additional hardware-buffer
reference and returns. It does not call either image cleanup function.

| Operation | 5002322 | 5002363 / installed |
|---|---|---|
| `FlipFrame` entry | `0x10bf38` | `0x10cd00` |
| `eglCreateImageKHR` | `0x10c228` | `0x10cff0` |
| `GetMetadataForFrameId` | `0x10c244` | `0x10d00c` |
| Branch if metadata is null | `0x10c24c -> 0x10c364` | `0x10d014 -> 0x10d12c` |
| Error log | `0x10c370` | `0x10d138` |
| `AHardwareBuffer_release` | `0x10c378` | `0x10d140` |
| Branch to return path | `0x10c37c -> 0x10ca40` | `0x10d144 -> 0x10d808` |
| Successful-path `eglDestroyImageKHR` | `0x10c9e8` | `0x10d7b0` |
| Successful-path `AHardwareBuffer_release` | `0x10ca2c` | `0x10d7f4` |
| Successful-path `AImage_delete` | `0x10ca34` | `0x10d7fc` |

The distinguishing log is:

```text
[XRRenderer] Failed to get frame metadata for frame
```

The returned metadata pointer is zero, so the branch returns false. The image
objects have no visible cleanup on that return path. This is static evidence of
a conditional resource-retention bug; it is not proof that the branch ran during
the reported hitch.

### Image import failures

On 5002363, error entries `0x10d0e4`, `0x10d0f0`, and `0x10d0fc` converge at
`0x10d104`. They log at `0x10d108`, release the hardware-buffer reference at
`0x10d110`, and return false through `0x10d174`. These branches also skip
`AImage_delete`. The corresponding 5002322 entries are `0x10c31c`, `0x10c328`,
and `0x10c334`, with release at `0x10c348` and return through `0x10c3ac`.

Distinguishing logs, preserving Valve's spelling:

```text
[XRRenderer] No valid hardware buffer recieved from decoder
[XRRenderer] Failed to get client buffer from decoder
[XRRenderer] Failed to create EGLImageKHR from decoded image hardware buffer
```

## Queue limits and normal waiting

- `QSVLCodecNDK::Init` requests `maxImages=20` for AImageReader on 5002363:
  `mov w4,#0x14` at `0xfd8b8`, call at `0xfd8bc`.
- `QSVLFrameServer::EnqueueHardwareBuffer` starts at `0x102ca4`. The count check
  at `0x102d50` and image-delete loop at `0x102d90` trim the queue to **5 images**.
  This queue is not an unbounded per-frame allocation list.
- The empty-queue path in `FlipFrame` creates a 120-byte future state, calls
  `AwaitNewDecodedFrame` at `0x10cee8`, and adds **5 ms** to its wait deadline at
  `0x10cef0`. Normal promise cleanup is present.
- `QSVLCodecNDK::BIsStuck` at `0xfe2e4` checks the oldest pending input against
  **300 ms** (`0x493e0` microseconds) at `0xfe334` onward.
- The MediaThread output-dequeue timeout is **1000 microseconds**, supplied at
  `0xfdbe0` to `AMediaCodec_dequeueOutputBuffer` at `0xfdbe4`.

The image-reader limit means retained images could eventually cause acquisition
failure or decoder starvation without indefinitely increasing process PSS. A
short flat memory trace alone cannot disprove every image-retention failure.

## High-resolution helper boundary

The helper's steady `layerEndFrame` source path uses a fixed stack array, a
generation-checked session cache, atomic reads, and the existing immutable quad.
It logs the first 3 successful submissions and lifecycle/errors, rather than
allocating/logging each successful frame. Native-window lock/post occurs once
after the session becomes visible. Cleanup releases its window, swapchain, and
reference space.

Source anchors:

- `extensions/resolution-trace-layer/src/android_surface_trigger_passthrough_layer.cpp:193` — cleanup.
- Same file `:312` — initial window lock and buffer post.
- Same file `:530` — frame submission; `:575` calls the runtime `endFrame`.
- `extensions/resolution-trace-layer/src/session_registry.h:42` — cached frame lookup.

These source properties do not bound the runtime compositor's CPU/GPU time. A
static appended quad can still select a different compositor path; only live
timing or a controlled comparison can assess that path's cost.

## Live evidence required and current status

`build/live-hitch-20260915/run-124246/logcat-initial.txt` contains **0** instances
of each of the 4 renderer error strings above. It also contains **0** instances
of `[SVLDecoder] Failed to acquire latest image!` and
`[XRRenderer] Panic! No frames served even after waiting!`. This statement covers
the retained initial log only, not the lifetime of the app or later captures.

To attribute a hitch to this conditional bug, collect coincident renderer errors
and image/native/graphics resource retention or subsequent acquisition stalls.
For a broader memory leak claim, compare the same process over a stable workload,
distinguishing warm-up/cache growth, allocator retention, and managed GC from
continuously growing live allocations. Native allocation profiling may not
account for every driver/graphics buffer.

Frame loss, FEC bursts, or late metadata with stable memory can instead indicate
network/input starvation. Healthy input/decode cadence with long runtime/GPU waits
can indicate downstream composition. These are diagnostic alternatives, not
conclusions established by the static branch audit. No cleanup patch was applied.
