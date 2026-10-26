# Steam Link 2.0.24 / 5002395 native target audit

Checked 2026-10-24 against
`android-steamlinkvr-release-base-2.0.24-5002395/lib/arm64-v8a/libvrlink_scene.so`
(2,301,432 bytes, SHA-256
`5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b`).

Targets were re-derived from `.dynsym`, AArch64 disassembly, `.rela.plt` and the
program headers. For all code/string targets below the first `PT_LOAD` maps file
offset 0 to virtual address 0, so the listed offsets are also virtual addresses.
GOT slots are runtime virtual addresses, not file offsets.

## Scene-wide targets

| Target | Value |
|---|---|
| Video shader prefix | `0x97aae`, 1087 bytes, SHA-256 `cbf2d90eb70b9769dd64e57da5d76dbc38ab7213dcf7b940c956813a1ddaa99a` |
| Opaque alpha suffix | `0x99a51`, 29 bytes, SHA-256 `93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c` |
| Masked alpha suffix | `0xa3ceb`, 296 bytes, SHA-256 `2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623` |
| Swapchain format MOVs | `0x10da98`, `0x10db08`, `0x10db78` (stock `69 88 91 52`) |
| `SRGBCorrectionPass` constructor | `0xf25a0`, 504 bytes, SHA-256 `d5cc0e42e225f17baa7493436f0304542aaf8edee7316bc350b9d8e740b7025a` |
| `SRGBCorrectionPass::UpdateShaderUniforms` | `0xf2af4`, 428 bytes, SHA-256 `60387966cc47190882ff82e3656a37b97a92050be0d14298debe49d9873b68bf` |
| `SRGBCorrectionPass::RenderSpecific` | `0xf2ca0`, 616 bytes, SHA-256 `eff4c2efcb12c806084d3cfaf1ffc0d50837e27c602ae6ed0285641942f94b88` |

The two `glDrawArrays` call return PCs are `0xf2df4` (fovea/masked pass) and
`0xf2ed4` (background pass). Both resolve through PLT stub `0x21b840` to GOT
`0x2313d0` (`glDrawArrays`).

## High-resolution projection topology

`QSVLRendererXR::GetProjectionLayers` is `0x10d41c`/692 bytes and
`QSVLRendererXR::SetupSwapchains` is `0x10d9d8`/1384 bytes with three swapchain
format sites inside the two-eye loop (`0x10da98`, `0x10db08`, `0x10db78`).
`FlipFrame` is `0x10df58`/3000 bytes. This preserves the 3-projection/6-view
contract used by the existing `libgxr_ast.so` helper; no Valve renderer byte or
format is rewritten by the high-resolution patch.

## Visual Delay Fix

`_ZN13QSVLDeviceHmd7GetPoseER10XRQContextR12PackedPose_t` starts at `0x10310c`.
The timestamp load `ldr x2,[sp,#8]` is at `0x103174` after `XRQGetTimeNow`; the six
velocity stores are:

| Site | Stock word | Field |
|---|---|---|
| `0x1033e8` | `bd001e74` | `str s20,[x19,#28]` |
| `0x1033ec` | `bd002273` | `str s19,[x19,#32]` |
| `0x1033f0` | `bd002672` | `str s18,[x19,#36]` |
| `0x1033fc` | `bd002a66` | `str s6,[x19,#40]` |
| `0x103400` | `bd002e65` | `str s5,[x19,#44]` |
| `0x10340c` | `bd003264` | `str s4,[x19,#48]` |

The `.comment` section is at file `0x2315c0`, length `0xb2`, without `SHF_ALLOC`.
The helper replaces the unique `PT_NOTE` header at `0x200` with an RX `PT_LOAD`:
file `0x230000`, virtual `0xc80000`, size `0x15d4`, alignment `0x4000`. The 20-byte
trampoline is at virtual `0xc815c0` (file `0x2315c0`).

## Microphone and tongue

`QSVLClientAudioNdk::Init` starts at `0xf5410`. The AAudio input-preset argument is
`mov w1,#7` at `0xf5710`, preceded by `ldr x0,[sp,#0x10]` and followed by the
`AAudioStreamBuilder_setInputPreset` PLT call.

`XRQGetFaceTracking` starts at `0x142c5c`; the final Android tongue block is
`0x1433ac`..`0x1433c3`, identical 24 stock bytes to 2.0.23. `x21 = sp + 0x40` is
established at `0x142d04`, and `x8` is the FB2 output array at the block.

## Network Optimizations

| Edit | Offset | Stock | Replacement |
|---|---|---|---|
| E1 retransmit-abort fallback | `0x1682a0` | `00faffd0610a40b900dc0a91e1cd0294682261f929008052f4031f2a0941313986000014e9ff9f5234008052` | `00faffd0610a40b900dc0a91e1cd02941f2003d51f2003d51f2003d51f2003d557000014e9ff9f5234008052` |
| E2 backtrack window | `0x169044` | `f8038b1aff0200f91f1b0071562107b9` | `f8038b1aff0200f91f330071562107b9` |
| E3 UDP send buffer | `0x1772cc` | `4800a052809a40b9e80b00b9e3230091` | `0802a052809a40b9e80b00b9e3230091` |
| E4 decoder flush removal (`libmain.so`) | `0x903634` | `003040f99e3c0c942000805297ffff17` | `003040f91f2003d52000805297ffff17` |

Each stock window is unique in its library. Patched SHA-256:
scene `8b71e6a72533935d7a5f4e1649c181fc627d1993809957ed8c1ee4232c3323fc`,
main `69f2c7789735e96322f8402fa44b1b118a0210df6c1477fa23bb6447dcc06075`.

## Codecs Support

`QSVLCodecNDK::Init` starts at `0xfe948`; the 0x80-byte anchor is `0xfe954`
(SHA-256 `ef7f310bbd65499404aa89a18f873c42a87282a16799b84119c75377654003a3`).
`SubmitFrameForDecode` + `0xd0` is `0xff2f8` (SHA-256
`49570c2a54e39d80d2f8bb61c190b9d8b821675a79a4d4c4bf5f94bfb7acde3a`); the first
0x40 bytes of `Init` are `0xfe948` (SHA-256
`51b57ce6a5c20fab3266923460c046f1247823cb95526252c61a92020f052464`).

The 15 `AARCH64_JUMP_SLOT` entries for the libmediandk imports, in the layer's slot
order, are:

```text
0x231b58 0x231b60 0x231b68 0x231b70 0x231b90 0x231b98 0x231ba0
0x231bc8 0x231bd0 0x231be8 0x231bf0 0x231bf8 0x231c48 0x231c58 0x231c60
```

The rebuilt `libgxr_codecs_support.so` adds this profile and is pinned by SHA-256
`4ad5e8b16c7cef480d9cb0ea0905fbbb823d534d986704402bf5bb48977f2e51`.

## Layer-patch scene contracts

| Layer | Regions |
|---|---|
| Foveal canvas (retired 2026-10-24) | `GetProjectionLayers` `0x10d41c`/692 SHA-256 `338fac4375cf3ea36bfaa31a4a9e6e358ff4f4fc88f2953e09c4b72a7bbb477d`; `FlipFrame` `0x10df58`/3000 SHA-256 `d628c41334d5f9dfdc056ee436850824b5b6ac2023f990bc26f77a93f0703699` |
| Controller pose time | `GetControllerState` `0x108f88`/0xa9c SHA-256 `4cda1b9020578b65a04c36e48e1d6240124ce9458007b6a7f09d712509c00a7b`; `SendPoses` `0xf5ff4`/0x550 SHA-256 `4f30c94895e96d10ce06abc3a96f05892871894d8e893dd0eb7d3765a3db0bb4`; clock `0x15e2b8`/0x40 SHA-256 `7279ef642ad5b65f5784bded4d9a42ef1f120796a2f2ac87fbe39f6fc62885d4`; GOT state `0x232038`, submit `0x1629cc`, submit GOT `0x2316b8` |

## Validation boundary

The production helpers were executed against these exact decoded bytes by
`util.SteamLink2395NativeAudit`; the source files were not modified. This does not
establish installability, ART verification, shader acceptance, codec behaviour,
panel precision or any headset/SteamVR result.
