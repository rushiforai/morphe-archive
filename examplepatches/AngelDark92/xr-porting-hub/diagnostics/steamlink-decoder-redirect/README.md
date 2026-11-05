# Decoder-output redirect gate (2026-10-27)

**Status: exact-base audit PASS for 5001712 and 5002395; the native patch is still
gated.** No decoder patch is selectable, and no runtime behavior is claimed.

The plan starts this work only after the Atlas surface / Swapchain enlarge headset
A/B shows that the extent/Surface path is insufficient. A decoder redirect is the
only path that can add real detail rather than present an upscale.

## Exact inputs

| Base | `libvrlink_scene.so` size | SHA-256 |
|---|---:|---|
| 2.0.20/5001712 | 2,221,072 | `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` |
| 2.0.24/5002395 | 2,301,432 | `5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b` |

Do **not** reuse the addresses in `diagnostics/steamlink-direct-surface/README.md`.
That audit pins a different artifact: 2.0.22/5002322, 2,283,400 bytes,
`e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f`.

## 5001712 symbols already located

| Symbol | Address | Size |
|---|---:|---:|
| `QSVLCodecNDK::Init` | `0xfd2f8` | `0x3fc` |
| `QSVLCodecNDK::HandleOnImageAvailable` | `0xfdf74` | `0x278` |
| `QSVLCodecNDK::MediaThread` | `0xfd6f8` | `0x250` |
| `QSVLCodecNDK::SubmitFrameForDecode` | `0xfdbd8` | `0x2a4` |
| `QSVLFrameServer::EnqueueHardwareBuffer` | `0x102114` | `0x25c` |
| `QSVLRendererXR::FlipFrame` | `0x10ad18` | `0xad4` |
| `QSVLRendererXR::SetupSwapchains` | `0x10a904` | `0x3fc` |
| `QSVLRendererXR::GetProjectionLayers` | `0x10a410` | `0x1ec` |

### 5002395 symbols located by the same audit

| Symbol | Address | Size |
|---|---:|---:|
| `QSVLCodecNDK::Init` | `0xfe948` | `0x3fc` |
| `QSVLCodecNDK::HandleOnImageAvailable` | `0xff5c4` | `0x278` |
| `QSVLCodecNDK::MediaThread` | `0xfed48` | `0x250` |
| `QSVLFrameServer::EnqueueHardwareBuffer` | `0x103efc` | `0x25c` |
| `QSVLRendererXR::FlipFrame` | `0x10df58` | `0xbb8` |
| `QSVLRendererXR::SetupSwapchains` | `0x10d9d8` | `0x568` |

Do not borrow 5001712 offsets for 5002395; each base has its own table above.

## Audit result

`python -B diagnostics/steamlink-decoder-redirect/audit_native.py` passes both
pinned bases. It resolves the six symbols by name, disassembles each function,
resolves `bl` calls through `.rela.plt`, and checks:

- `QSVLCodecNDK::Init` calls `AImageReader_newWithUsage`, `AImageReader_getWindow`
  and `AMediaCodec_configure`.
- `HandleOnImageAvailable` calls `AImageReader_acquireLatestImage`,
  `AImage_getTimestamp` and `QSVLFrameServer::EnqueueHardwareBuffer`.
- `MediaThread` calls `AMediaCodec_dequeueOutputBuffer` and
  `AMediaCodec_releaseOutputBuffer`.
- `FlipFrame` calls `AImage_getHardwareBuffer`, `eglCreateImageKHR`,
  `SVLFEC::GetMetadataForFrameId` and
  `SVLDataLink::FrameHasBeenSubmittedForDisplay`.

Evidence is written under
`../builds/steamlink-patches/diagnostics/decoder-redirect/` (`result.json` and
`resolved-disassembly.txt` per base). The audit rejects any other size/SHA-256 and
confirm the input hash did not change. It does not patch or install anything.

## Why no patch yet

- A one-call `AMediaCodec_configure` window substitution removes the AImageReader
  callbacks that drive frame readiness, metadata accounting and decode
  acknowledgement. It is not sufficient.
- The preferred path keeps `QSVLCodecNDK` and the AImageReader, intercepts the
  decoded hardware buffer in `QSVLRendererXR::FlipFrame`, renders it into a runtime
  Surface at the target extent, and preserves pose/FOV/metadata/ack.
- That requires a native code cave or an equivalent guarded hook. The repository
  has no generic code-cave infrastructure, and an unverified hook would be worse
  than the current stock path.
- The target extent is not the detail source. If the host stream is low-resolution,
  no client redirect can add detail; the host profile must be raised first.

## Gate

Do not create a selectable decoder patch until:

1. The exact-base audit passes for both 5001712 and 5002395.
2. A synthetic apply/keep-patched/reject-foreign/wrong-size/wrong-hash test exists.
3. The Atlas surface / Swapchain enlarge headset A/B has been reviewed.
4. A headset run shows the redirect preserves pose/FOV, display acknowledgement,
   stop/start/reconnect and frame timing.

Until then, Alpha-0 plus a correct host resolution profile remains the working
high-resolution path.
