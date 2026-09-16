# Steam Link 2.0.23 / 5002363 native target audit

Checked 2026-09-15 against the supplied decoded APK. This is native byte and
code-path evidence; it does not establish an installable APK, shader acceptance,
headset behavior, SteamVR behavior, or panel precision.

## Exact input and method

- Metadata: `decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363/apktool.yml`
  declares `versionName: 2.0.23` and `versionCode: 5002363`.
- Library: `lib/arm64-v8a/libvrlink_scene.so`, **2,292,008 bytes**.
- SHA-256: `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0`.
- ELF: AArch64. All instruction and shader addresses in the tables below lie in
  the first `PT_LOAD`, whose file offset and virtual address are both 0. Thus
  these particular offsets equal virtual addresses. This equality is not assumed
  for other segments or builds.
- Comparison input: exact 2.0.22/5002322, 2,283,400 bytes, SHA-256
  `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f`.

Targets were derived independently from ELF dynamic symbols, AArch64 disassembly,
ELF load mappings, and PLT relocations resolving branch targets to symbol names.
The 2 binaries have different section positions and are not interchangeable.
The decoded source libraries were read only. Scratch disassembly and scripts are
in ignored `build/audit-5002363/`.

## OLED shader and projection output formats

| Target | 5002322 | 5002363 | Verified 5002363 contract |
|---|---|---|---|
| Common fragment prefix | `0x96ba5` | `0x970a1` | 1087 bytes followed by NUL |
| `SRGBCorrectionPass` constructor | `0xf0670` | `0xf1350` | Builds and links 2 shader programs |
| `QSVLRendererXR::SetupSwapchains` | `0x10b9b8` | `0x10c780` | 1384 bytes, 3 create sites in 2-eye loop |
| 1st format instruction | `0x10ba78` | `0x10c840` | `69 88 91 52`, `mov w9,#0x8c43` |
| 2nd format instruction | `0x10bae8` | `0x10c8b0` | Same stock bytes and field |
| 3rd format instruction | `0x10bb58` | `0x10c920` | Same stock bytes and field |
| `XRQCreateSwapchain` | `0x13a1c8` | `0x13af90` | Consumes `XRQSwapchainInfo.format` at input+8 |
| `XRQGetSupportedSwapchainFormat` | `0x139e80` | `0x13ac48` | Enumerates runtime formats and matches requested value |
| `QSVLRendererXR::FlipFrame(context,...)` | `0x10bf38` | `0x10cd00` | Active decoded-frame render path |
| `SRGBCorrectionPass::RenderSpecific` | `0xf0d70` | `0xf1a50` | Attaches projection texture, binds program and draws |

Each format instruction has the exact production guard context:

```text
before: e1a30091 e00314aa e2031caa e822099b
site:   69889152
after:  e91b00f9 082140b9 e83b00b9
```

`x1` points to `sp+0x28`; the `str x9,[sp,#0x30]` following each format instruction
writes input+8. Calls at `0x10c850`, `0x10c8c0`, and `0x10c930` resolve to
`XRQCreateSwapchain`. Each successful call is followed by construction of its
projection view. Inside `XRQCreateSwapchain`, `0x13afd4` calls the runtime-format
selector and `0x13b020` calls `xrCreateSwapchain`. The selected output format is
therefore an active projection-image format, rather than an unused constant.

The replacement instructions retain the register and instruction size:

| Option | Bytes | Instruction |
|---|---|---|
| 8-bit sRGB | `69 88 91 52` | `mov w9,#0x8c43` (`GL_SRGB8_ALPHA8`) |
| RGB10_A2 | `29 0b 90 52` | `mov w9,#0x8059` (`GL_RGB10_A2`) |
| RGBA16F | `49 03 91 52` | `mov w9,#0x881a` (`GL_RGBA16F`) |

The common fragment and both suffixes are byte-identical to 5002322:

| String | 5002363 offset | Length | SHA-256 |
|---|---|---|---|
| Common prefix | `0x970a1` | 1087 | `cbf2d90eb70b9769dd64e57da5d76dbc38ab7213dcf7b940c956813a1ddaa99a` |
| Opaque alpha suffix | `0x99013` | 29 | `93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c` |
| Mask alpha suffix | `0xa31bb` | 296 | `2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623` |

The static initializer materializes the prefix address at `0xf1ee0`/`0xf1ee4`
and copies exactly `0x43f` bytes through `memcpy` at `0xf1efc`. Calls `0xf1f28`
and `0xf1f50` concatenate the opaque/masked suffixes through helper `0xf1250`.
The prefix intentionally leaves `main()` open; each suffix closes it. The
constructor at `0xf1350` passes the completed strings to `Shader` and links both.

`FlipFrame` calls `SetupSwapchains` at `0x10d208`, preparation at `0x10d5d8`, and
`RenderSpecific` at `0x10d648`, `0x10d6a4`, `0x10d728`, and `0x10d784`.
Preparation advances the phase at object+`0x14c` by 1 and wraps at 1024
(`0xf1874` through `0xf1894`). `RenderSpecific` retains the external sampler,
uniform locations and masked-alpha contract. This supports the existing shader
calibration/precision/dither options at the native-code level. Runtime support
for RGB10_A2 or RGBA16F remains a separate requirement.

## Visual Delay Fix

The exact symbol
`_ZN13QSVLDeviceHmd7GetPoseER10XRQContextR12PackedPose_t` starts at `0x101eb4`
and spans 828 bytes. It calls `XRQGetTimeNow` at `0x101f18`, loads the timestamp
into `x2` at `0x101f1c`, then calls `XRQLocateReferenceSpace` at `0x101f2c`.
The timestamp load is the hook, with original bytes `e2 07 40 f9`.

| Target | 5002322 | 5002363 | Stock bytes | Meaning |
|---|---|---|---|---|
| Timestamp hook | `0x101154` | `0x101f1c` | `e20740f9` | `ldr x2,[sp,#8]` |
| Linear velocity 0 | `0x1013c8` | `0x102190` | `741e00bd` | `str s20,[x19,#28]` |
| Linear velocity 1 | `0x1013cc` | `0x102194` | `732200bd` | `str s19,[x19,#32]` |
| Linear velocity 2 | `0x1013d0` | `0x102198` | `722600bd` | `str s18,[x19,#36]` |
| Angular velocity 0 | `0x1013dc` | `0x1021a4` | `662a00bd` | `str s6,[x19,#40]` |
| Angular velocity 1 | `0x1013e0` | `0x1021a8` | `652e00bd` | `str s5,[x19,#44]` |
| Angular velocity 2 | `0x1013ec` | `0x1021b4` | `643200bd` | `str s4,[x19,#48]` |

`x19` is the incoming `PackedPose_t` pointer, set at `0x101ee4`. The 6 stores
belong to the HMD method. Position/orientation stores and controller methods
remain outside this mutation.

The production helper derives its trampoline from ELF structure. On this stock
binary, `.comment` starts at file `0x22f0f0`, length 178, without `SHF_ALLOC`.
The mapping uses file `0x22c000`, virtual `0xc7c000`, size `0x3104`, and
alignment `0x4000`; the trampoline's virtual address is `0xc7f0f0`. The helper
replaces the unique `PT_NOTE` program header with an RX `PT_LOAD`; it does not
overwrite PLT entries. 20 comment bytes hold the original timestamp load,
MOVZ/MOVK nanosecond offset, ADD to `x2`, and return branch.

The 5002363 helper requires the exact metadata pair. Offset transitions are
accepted only for a mapped canonical trampoline with its exact hook, original
load, MOVZ/MOVK targeting `x16`, ADD targeting `x2`, return branch, and all 6 zero
velocity stores. The previous offset must decode to integral milliseconds in
0..4000. A transition changes only its 12 timestamp-body bytes. Other native
layouts retain their prior behavior.

## Microphone input preset

`_ZN18QSVLClientAudioNdk4InitEbi` starts at `0xf41c0` and spans 1168 bytes.
The input branch contains:

```text
0xf44bc  e00b40f9  ldr x0,[sp,#0x10]
0xf44c0  e1008052  mov w1,#7
0xf44c4            bl AAudioStreamBuilder_setInputPreset
```

The old preset address was `0xf37e0`. The new instruction is the argument to the
resolved AAudio input-preset call; it is not chosen solely by an ambiguous byte
search. The supported values are 7 (Voice Communication), 6 (Voice Recognition),
9 (Unprocessed), and 10 (Voice Performance). Only the 4-byte `mov w1` instruction
changes, preserving the builder, input path and following call.

## Native face mapping and tongue transport

`_Z18XRQGetFaceTrackingR10XRQContextR26XrFaceExpressionWeights2FB` starts at
`0x14151c`, length 3312. `QSVLDeviceHmd::HandleEyeInput` calls this function at
`0x10177c`. The Android branch starts at `0x1419c0`; it calls the face-state
function pointer at `0x141a68`, then maps the returned Android expression array.

The array is at `sp+0x40`, also held in `x21` (established at `0x1415c4` on the
path to this branch). The face-state output structure receives that same array
pointer at `0x141a38`. After successful collection, `0x141a74` loads `x8` from
the caller's FB2 weight-array pointer at `x19+0x18`. `x8` remains this output
array through the scalar expression mapping.

The final tongue block moves from `0x140ea4` to **`0x141c6c`**. Its 24 stock
bytes are identical on both bases:

```text
e03f41bd 1fcd0ff8 1f1900b9 1f0500f9 001500bd 1f1100b9
```

It loads Android TongueOut from `sp+0x13c` (array index 63), preserves standard
FB2 TongueOut at slot 68, and zeros slots 63..67 and 69. The replacement is:

```text
a142c03d a0fe40bd 00fd00bd 0141803d 001101bd 1f1501b9
```

It loads Android 63..67 from `x21+0xfc`/`x21+0x100`, writes transport slots
63..67, retains standard TongueOut at slot 68, and zeros slot 69. The code
before and after the 24-byte block remains unchanged. The patch keeps an exact
layout entry per metadata pair with separate size, address, hash and byte
preconditions; reapplication recognizes only the exact replacement.

## Native architecture boundaries

- `QSVLRendererXR::GetProjectionLayers` at `0x10c1c4` appends 3 projection
  structures at object offsets `0x17e8`, `0x1b90`, and `0x1bc0`. Together with
  the 3 swapchain creation sites in the 2-eye loop, this matches the existing
  3-projection/6-view Android-surface trigger helper's API contract. That helper
  is an OpenXR API layer and contains no hard-coded Valve instruction offsets.
- `QSVLCodecNDK::Init` at `0xfd6f0`, `MediaThread` at `0xfdaf0`, and
  `HandleOnImageAvailable` at `0xfe36c` retain the AImageReader/MediaCodec route.
  `AMediaCodec_configure` is called at `0xfd958`; the active OLED path still
  renders decoded images through OpenGL into the projection swapchains.
- Native `RequestAndroidPermissions` is at `0x149874`, length 564, with stock
  prologue `ff8301d1 fd7b01a9`. It must remain intact for the native-XR build;
  the legacy permission suppression patch is intentionally excluded.
- Legacy XR foundation, full face bridge, controller velocity/cadence hooks,
  forced HMD/lobby/stream gates and old native permission-name rewrites remain
  excluded from 5002363. Their older addresses are not transplanted into the
  native Android-XR implementation. The full face bridge would compete with
  Valve's already present native mapping; the modern tongue patch changes only
  the verified final transport block.
- Retired projection/decoder Surface experiments remain retired. No retired
  native hook is re-enabled by this adaptation.

## Validation boundary

This report records independently identified native targets and contracts.
Production-helper execution, all option combinations/transitions, malformed
input handling, restricted differences and unchanged-source hashes are recorded
by the adaptation's decoded/native audits and unit tests. Those checks are
separate from installing or running a patched APK. No ADB, device permission,
headset, SteamVR or driver deployment action was part of this audit.
