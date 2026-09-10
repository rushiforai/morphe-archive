# Direct decoder-to-Android-Surface investigation

Checked 2026-09-08. This is a read-only native feasibility audit for exact Steam Link **2.0.22 / 5002322**, not an implemented patch. No APK was patched or installed, and no device or SteamVR command was run.

## Exact input and repeatable checks

Input: `decoded-apk-android-steamlinkvr-release-base-2.0.22-5002322/lib/arm64-v8a/libvrlink_scene.so`.

- Size: 2,283,400 bytes.
- SHA-256: `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f`.
- Exact version pair independently checked in the decoded directory's `apktool.yml`.
- Decoded evidence does not establish that its originating whole APK was pristine/installable.

Run from the repository root:

```powershell
python diagnostics/steamlink-direct-surface/audit_native.py
```

The script uses pyelftools and Capstone from the existing `build/oled-native-audit/python` directory, or installed Python packages. It rejects any different native hash/size or version pair before writing evidence. It resolves ARM64 calls through ELF PLT relocations, checks 6 exact symbols, 22 calls and 3 shader properties, then confirms the source hash is unchanged. Output stays under `build/`: `result.json`, `resolved-disassembly.txt`, `shaders.json`. Addresses below are ELF virtual addresses; the script converts them through PT_LOAD mappings.

## Actual decoder ownership

The XR renderer uses `QSVLCodecNDK` in `libvrlink_scene.so`. The Java `SteamLink` SurfaceTexture methods are a different path and are not a sufficient hook for this XR decoder.

| Address | Native evidence |
|---|---|
| `0xfc928` | `QSVLCodecNDK::Init` |
| `0xfcaf4` | Creates AImageReader: PRIVATE format 34, GPU-sampled usage `0x100`, maxImages 20; initial dimensions 1×1 |
| `0xfcb2c` | Installs image-available listener |
| `0xfcb58` | `AImageReader_getWindow` writes the window into codec object +`0x38` |
| `0xfcb90` | `AMediaCodec_configure` receives that window |
| `0xfce1c` | MediaThread dequeues codec output; AMediaCodecBufferInfo resides at SP, presentationTimeUs at SP+8 |
| `0xfce34` | Immediately releases the output index with render=true |
| `0xfd624`–`0xfd78c` | Image callback records decoded progress, reads image timestamp and dimensions, trims pending frames, resolves frame metadata, acknowledges decoding and enqueues the image into QSVLFrameServer |

Changing only the configure window would remove the AImageReader callbacks that drive frame readiness and metadata accounting. The existing FrameServer carries real AImage objects, not just timestamps.

## Renderer dependencies

`QSVLRendererXR::FlipFrame` starts at `0x10bf38`. It serves hardware-buffer entries (`0x10c004` / `0x10c034`), can await a decoded-frame promise (`0x10c120`), extracts the AHardwareBuffer (`0x10c1ec`), creates an EGLImage (`0x10c228`), and fetches frame-specific transport metadata (`0x10c244`). Its display acknowledgement is at `0x10c2d0`.

Atlas selection at `0x10c2e8`–`0x10c3f4` uses metadata fields +`0xe6`, +`0xe8`, +`0xea`, +`0xec`. Dimensions or mode changes call `SetupSwapchains` at `0x10c440`. The following code updates per-eye projection/FOV state from metadata. `RenderSpecific` calls at `0x10c880`, `0x10c8dc`, `0x10c960`, `0x10c9bc` split opaque and masked video for both eyes. Thus removing GL rendering must preserve the associated metadata, projection and lifecycle work.

## Packed image and missing alpha

The opaque vertex shader begins at `0x99555`; its group is `2 * eye + 1` (uniform calculation at `0xf0f34`). The masked vertex shader begins at `0xa9245`; its group is `2 * eye` (`0xf0e54`). Both flip vertex Y before drawing. The following rectangles describe source UV allocation before resolving Android/OpenXR surface orientation conventions:

| Atlas mode | Opaque source | Masked source |
|---|---|---|
| 0 | Full width, quarter-height rows 1 and 3 | Full width, quarter-height rows 0 and 2 |
| 1 | Left half, half-height rows 0 and 1 | Right half, half-height rows 0 and 1 |
| 2 | Full width, half-height rows 0 and 1 | Geometry collapsed; no masked draw |

The masked fragment suffix at `0xa2b93` synthesizes curved edge alpha using `pow` and the local UV distance from the section center. This alpha is created during the GL draw; selecting an `imageRect` from the decoded HEVC surface cannot reproduce it. Direct replacement of modes 0/1 would therefore change their feathered boundary unless another masking mechanism or reconstruction is supplied.

Mode 2 is a plausible candidate for a direct stereo surface experiment because the native shader omits the masked family. This does **not** establish a working unfoveated route: no verified client setting, negotiation field or host control that forces mode 2 has been identified. Surface projection support, source orientation, complete field of view, frame/pose synchronization and performance remain untested.

## Required implementation work

1. Create a separate exact-build, default-off patch/helper. Preserve the current high-resolution trigger and recommended sets.
2. Establish XR session and surface ownership before decoder configuration, including dimensions and output-format changes.
3. Intercept decoder output indexes and presentation timestamps; select/release frames with consistent projection metadata. Reimplement the progress, pending-frame and decode-acknowledgement work currently done by AImageReader callbacks.
4. Replace the image-dependent FrameServer/FlipFrame route or implement fully audited guarded native branches. A 1-call window substitution is insufficient.
5. Preserve projection/FOV, pose association, display acknowledgements, flush/stop/reconnect and failure cleanup. Surface buffer availability and latest-image consumption still require runtime verification.
6. Resolve the supported atlas behavior. Modes 0/1 need their synthesized alpha accounted for; mode 2 needs a verified way to request it before it can be promised as an option.
7. Validate actual decoded mutations and packaging separately from headset rendering, color behavior and measured performance.

The earlier [Surface-fovea experiment](../steamlink-surface-fovea/README.md) copied GPU images and was retired after the user reported failure. That result does not prove a direct decoder route fails, and the historical failure mechanism is unknown.

## Validation result

The audit passed against the exact input: 6 symbol checks, 22 resolved-call checks, 3 shader checks; input hash unchanged. This establishes native structure and the implementation dependencies above. No direct-surface patch, decoder redirection, unfoveated request, runtime acceptance or performance improvement is claimed.
