# OLED comparison: native compatibility evidence

Checked 2026-09-06 against the real decoded `lib/arm64-v8a/libvrlink_scene.so` files, without modifying those inputs. This verifies the patch locations and renderer route for the 2 requested bases. It does not establish headset runtime support for FP16 or physical panel precision.

## Exact inputs

| Evidence | 2.0.20 / 5001712 | 2.0.22 / 5002322 |
|---|---|---|
| Decoded directory | `decoded-apk-android-steamlinkvr-release-base-2.0.20-5001712` | `decoded-apk-android-steamlinkvr-release-base-2.0.22-5002322` |
| Native size | 2,221,072 | 2,283,400 |
| SHA-256 | `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` | `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f` |
| Common video fragment offset | `0x9b4b8` | `0x96ba5` |
| Fragment bytes before NUL | 1087 | 1087 |
| `QSVLRendererXR::SetupSwapchains` | `0x10a904`, 1020 bytes | `0x10b9b8`, 1384 bytes |
| Format instructions | `0x10a9c4`, `0x10aa34` | `0x10ba78`, `0x10bae8`, `0x10bb58` |

The exact version pairs come from each `apktool.yml`. Both manifests load `vrlink_scene` through `android.app.lib_name`. The older reconstruction names `android.app.NativeActivity` directly; the newer manifest names `com.valvesoftware.steamlink.VRLink`, whose decoded smali extends `android.app.NativeActivity`. Thus their entry classes differ, while both load the checked native renderer. The older `apktool.yml` explicitly names `steamlinkvr-analysis.apk`: do not represent this reconstruction as pristine whole-APK evidence. Both contain the 4 config assets under `assets/config`; no colour/dither/HDR/10bit selector was found there, and this patch changes none of them or DEX.

## Actual projection creation

All 5 offsets contain `69 88 91 52` (`mov w9, #0x8c43`, GL_SRGB8_ALPHA8). At each site the next instruction stores `x9` to `[sp,#0x30]`, while `x1` points at `[sp,#0x28]`: this is the format field at offset 8 of `XRQSwapchainInfo`. Calls 16 bytes after each format instruction resolve through ELF PLT relocations to `XRQCreateSwapchain`, immediately followed by `XRQCreateProjectionViewLayer` after success.

The older function contains 2 distinct create sites inside a 2-eye loop (4 projection views). The newer contains 3 sites inside that loop (6 projection views). The patch preserves this difference and changes all sites for the selected base; reusing the older 2-site list on the newer binary would miss the 3rd projection family.

`XRQCreateSwapchain` is at `0x13562c` / `0x13a1c8`. It loads the requested format from input+8, calls `XRQGetSupportedSwapchainFormat` (`0x1352e4` / `0x139e80`), then places the result into `XrSwapchainCreateInfo` before calling `xrCreateSwapchain`. The support helper enumerates runtime formats and looks for exact equality. If absent it returns failure: it does not replace FP16 with an 8-bit format. Consequently FP16 is a valid guarded byte experiment on both binaries, but streaming requires runtime acceptance.

Replacement instructions decode as `mov w9,#0x8059` for RGB10_A2 (`29 0b 90 52`) and `mov w9,#0x881a` for RGBA16F (`49 03 91 52`). Every surrounding create-info instruction remains intact.

## Shader really reaches video rendering

The common fragment has an intentionally open `main()`. Native initialization copies exactly `0x43f` bytes from the offsets above (`memcpy` calls `0xf1fa0` / `0xf121c`), then constructs 2 complete shader strings:

| Composition | 5001712 | 5002322 |
|---|---|---|
| Append opaque alpha suffix | call `0xf1fcc`, suffix `0x9d23d` | call `0xf1248`, suffix `0x98b17` |
| Append edge-mask alpha suffix | call `0xf1ff4`, suffix `0xa6582` | call `0xf1270`, suffix `0xa2b93` |
| String concatenation helper | `0xf12f4` | `0xf0570` |
| `SRGBCorrectionPass` constructor | `0xf13f4` | `0xf0670` |

The opaque suffix is `color.a = 1.0;` followed by the closing brace. The mask suffix computes alpha from `uvmask` and closes the same brace. The constructors pass the completed strings to `Shader` and link both programs. Adding a closing brace to the common OLED replacement would break this contract.

`QSVLRendererXR::FlipFrame` calls `SRGBCorrectionPass::RenderSpecificPrep` at `0x10b560` / `0x10c810`; it then calls `RenderSpecific` for the actual output images. `RenderSpecific` (`0xf1af4` / `0xf0d70`) attaches the passed texture with `glFramebufferTexture2D`, binds the appropriate opaque/masked shader, uploads uniforms, and calls `glDrawArrays`. This is an active video-to-projection render path, not an unused shader string.

The existing interface is preserved: external sampler at location 2, fade at 3, reserved uniforms at 4/5, dither vec4 at 6. `UpdateShaderUniforms` uploads location 6 from object+`0x140` and records `glGetError` success flags; `RenderSpecific` refreshes location 6 when enabled. Prep advances the 4th component at object+`0x14c` by 1 with wrap at 1024 (`0xf1918`-`0xf1938` / `0xf0b94`-`0xf0bb4`). Therefore the new low/standard shader expressions have a native source of changing frame phase on both bases. This is static reachability, not a measured shader execution result.

## Repeatable checks and limits

Native analysis used Python 3.14 with pyelftools 0.33 and Capstone 5.0.9. ELF PT_LOAD mappings, dynamic symbol sizes, and `.rela.plt` symbol resolution were used; shader references were followed from ADRP/address arithmetic through the static string constructors. Scratch scripts and annotated disassembly are under ignored `build/oled-native-audit/` (`resolve_native.py`, `fragment.py`, `suffix.py`). No live-device commands were needed.

The production-helper audit in `patches/src/main/kotlin/util/OledDecodedCompatibilityAudit.kt` separately exercised the real decoded inputs: 63 variants and 567 transitions per base, restricted byte differences, format instructions, padding/NUL, idempotence, and unchanged source hashes. It ran through the isolated Kotlin compiler with a `PatchException` shim because the Gradle Morphe plugin could not resolve. This is real native-input/helper validation, not an actual Morphe APK invocation or install.

The paths support the same sRGB8/RGB10_A2/FP16, neutral/calibrated, and off/low/standard comparison controls in both requested builds. GPU shader compilation, successful runtime FP16 negotiation, visual banding improvement, and compositor/panel depth remain runtime checks. These files alone cannot prove the panels display 10-bit samples.

Run the committed helper audit from the repository root:

```powershell
.\diagnostics\steamlink-colour\Test-OledDecodedCompatibility.ps1 -JavaHome 'F:\Runtimes\Java21'
```

The final audit also compares each generated shader's inputs, outputs, and uniform names/types/locations with its decoded source (allowing the intentional precision qualifier changes). All 63 variants and 567 transitions passed on each base.
