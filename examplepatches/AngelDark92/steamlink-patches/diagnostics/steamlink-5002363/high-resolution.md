# High-resolution API-layer adaptation: 2.0.23 / 5002363

Checked 2026-09-15 against the supplied decoded base. The production
`Galaxy XR high-resolution 3-projection fix` uses the existing 3-projection
`libgxr_ast.so` unchanged. It does not patch an address in `libvrlink_scene.so`.
The new exact-build guard is supported by the native topology and call trace below.

## Exact inputs

| Input | Size | SHA-256 |
|---|---:|---|
| `decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363/lib/arm64-v8a/libvrlink_scene.so` | 2,292,008 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` |
| `decoded-apk-android-steamlinkvr-release-base-2.0.22-5002322/lib/arm64-v8a/libvrlink_scene.so` | 2,283,400 | `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f` |
| Packaged `patches/src/main/resources/steamlink/androidxr/libgxr_ast.so` | Existing payload | `5db15199e6e3bcd5602b4fc04ad4e61a38916a5d1957c3dd25662e4c36c7aebf` |

The audit checks each exact version pair in its `apktool.yml`, pins both scene
hashes/sizes, resolves native functions through `.dynsym` and calls through
`.rela.plt`, and converts virtual addresses through ELF `PT_LOAD` mappings.
All addresses below also equal file offsets in these 2 ELFs. Neither input changed.

## Verified native contract

| Function | 5002322 | 5002363 | Evidence |
|---|---|---|---|
| `QSVLRendererXR::Init(XRQContext const&)` | `0x10af60` | `0x10bd28` | Initializes 3 projection structures at renderer offsets `+0x17e8`, `+0x1b90`, `+0x1bc0`; type 35 is retained, along with the context view count and separate view arrays. |
| `QSVLRendererXR::GetProjectionLayers` | `0x10b3fc` | `0x10c1c4` | Appends those exact 3 structure pointers in that order. |
| `QSVLRendererXR::SetupSwapchains` | `0x10b9b8` | `0x10c780` | Creates 3 projection swapchain families inside the existing 2-eye loop. |
| `QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)` | `0x10bf38` | `0x10cd00` | Calls `SetupSwapchains` at `0x10d208` when the stream dimensions or mode require it. |
| `XRQCreateSwapchain` | `0x13a1c8` | `0x13af90` | Existing OpenXR/OpenGL swapchain creation path retained. |
| `XrSceneStream::Render` | `0x11a940` | `0x11b708` | Copies stored projection pointers into the submitted layer vector and reaches `xrEndFrame` at `0x11b844`. |

On 5002363, `SetupSwapchains` calls `XRQCreateSwapchain` at `0x10c850`,
`0x10c8c0`, and `0x10c930`. The matching `XRQCreateProjectionViewLayer` calls
are `0x10c870`, `0x10c8e0`, and `0x10c950`. The loop starts with eye index 0,
sets eye index 1 at `0x10c958`, and returns through `0x10c95c` for its 2nd pass.
Thus the source contract remains 3 projection layers with 2 views each.

The streamed-scene caller chain is independently present:

1. `XrSceneStream::Focused` (`0x11a52c`) calls
   `QSVLClientXR::GetStreamProjectionLayers` at `0x11ac6c`.
2. `QSVLClientXR::GetStreamProjectionLayers` (`0xfafb8`) tail-calls
   `QSVLRendererXR::GetProjectionLayers` at `0xfafbc`.
3. `XrSceneStream::Render` inserts that stored vector at `0x11b7a0`, derives
   `XrFrameEndInfo.layerCount` from the submitted vector length, and calls
   `xrEndFrame` at `0x11b844`.

The 14 inspected renderer/scene functions have identical sizes, instruction
mnemonic sequences, and resolved-call sequences between 5002322 and 5002363.
These comparisons supplement the explicit structure/loop inspection; they are
not a claim that instruction operands or complete libraries are byte-identical.

## Production helper and guards

`extensions/resolution-trace-layer/CMakeLists.txt` builds the generic helper with
`GXR_AST_SOURCE_PROJECTION_COUNT=3`. The API layer checks the actual submitted
shape, preserves each projection pointer and its order, and appends its static
2x2 Android-surface quad. It preserves Valve's source swapchains and formats.
Frames with other layer counts/types pass through unchanged.

`OptionalXrPatches.kt` selects the generic resource for exact 2.0.23/5002363;
the installer and manifest finalizer independently use the exact-build guard.
The 2-projection resource remains restricted to 2.0.20/5001712. No new Valve
offset or native helper payload is required. The installer still rejects scene
libraries containing retired projection helper references.

`AndroidSurfaceTriggerResourceTest.kt` checks that 2.0.23/5002363 is accepted,
mismatched version/build pairs are excluded, and its selected helper bytes match
the 5002322 helper. The existing helper hash and old resource-selection checks
remain intact.

## Captured evidence and limits

Local evidence is under `build/audit-5002363/`:

- `highres_native_audit.py`: read-only, exact-input-pinned audit script.
- `highres-native-results.json`: hashes, symbols, resolved calls, comparison results.
- `highres-5002363-*.txt` and `highres-5002322-*.txt`: annotated disassembly.
- `highres-native-audit.log`: successful audit output.

Run `python build/audit-5002363/highres_native_audit.py` from the repository root
to repeat the captured native trace with the local pyelftools/Capstone dependencies.

This establishes native/API-layer structural compatibility. Decoded-source
patching, pristine whole-APK provenance/installability, OpenXR runtime acceptance,
and headset resolution quality are separate checks. No APK install, ADB operation,
headset run, or SteamVR mutation was performed for this audit. The earlier
5002322 headset result does not establish a 5002363 runtime result.
