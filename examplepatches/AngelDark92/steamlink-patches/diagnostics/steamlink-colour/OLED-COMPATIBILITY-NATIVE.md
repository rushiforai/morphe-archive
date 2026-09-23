# OLED comparison: native compatibility evidence

Checked 2026-09-06 against the real decoded `lib/arm64-v8a/libvrlink_scene.so` files, without modifying those inputs. This verifies the patch locations and renderer route for the 2 requested bases. It does not establish headset runtime support for FP16 or physical panel precision.

## Exact inputs

2026-09-11 recheck after the user reported no visible difference: the current production-helper audit again passed 63 variants, 567 transitions and 126 checkbox cases on each exact base below. Report: `build/oled-decoded-audit/e55b0c882efa47098458e92d4fb942e9/result.txt`. RGB10 selected with Low/Standard comparison dithering and `Use 8-bit output when dithering` checked intentionally resolves to sRGB8; unchecked retains RGB10. Off ignores the checkbox. The toggle does not enable dithering or respond to separate external patch selections. This confirms decoded-native adaptation, not the contents of the user's installed APK or a visible headset improvement.

2026-09-09 checkbox follow-up: production helpers passed 63 variants, 567 format/dither transitions, and 126 checkbox cases per base below. `Use 8-bit output when dithering` selects sRGB8 only when checked with Low/Standard; unchecked and Off retain the selected precision. Both shader conversion and format instructions use the resolved precision. Exact diffs, interfaces, NUL boundaries, idempotence, and unchanged source hashes passed. Cached Kotlin/Morphe compilation and all 100 JUnit tests passed; catalogs were regenerated through the production generator with the explicit experimental channel. Gradle remains blocked resolving `app.morphe.patches:1.3.3`. No end-to-end APK patching, installation, decoder/import precision measurement, or headset runtime test was performed.

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

## All-base provenance and stock shader evidence, 2026-09-19

The SDR10 baseline work ([plan](VD-LIKE-SDR10-IMPLEMENTATION-PLAN.md)) extended the audited surface from the two requested bases above to all 7 exact color-supported bases. Sizes, source hashes and format sites come from the production layout table and were re-verified against the decoded inputs by the expanded `OledDecodedCompatibilityAudit` (all 7 bases, BLOCKED rows explicit). Shader and suffix offsets below were re-measured in this session; the suffix offsets for 5002244/5002313/5002318 differ from values in the earlier handoff and these measured values supersede them.

| Base | Size bytes | SHA-256 (`libvrlink_scene.so`) | Shader prefix | Opaque suffix | Mask suffix | Stock format sites | Status |
|---|---:|---|---|---|---|---|---|
| 2.0.20/5001712 | 2,221,072 | `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` | `0x9b4b8` | `0x9d23d` | `0xa6582` | `0x10a9c4`, `0x10aa34` | decoded input present; audit PASS |
| 2.0.20/5001740 | 2,220,528 | `5fbb76c06c9fc0e3e5c5825752aa17e040462c8551b69d3492265f620244f443` | static-analysis only | not measured | not measured | `0x10a854`, `0x10a8c4` | **BLOCKED: decoded input missing** |
| 2.0.22/5002244 | 2,251,920 | `4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12` | `0x957bc` | `0x976e6` | `0xa11d7` | `0x10826c`, `0x1082dc`, `0x10834c` | decoded input present; audit PASS |
| 2.0.22/5002313 | 2,276,872 | `e4d3575a130dc013e4c8fe4fb965217028229f89b13ba821c01b492e457398bb` | `0x96ac0` | `0x98a32` | `0xa28f9` | `0x10b2d4`, `0x10b344`, `0x10b3b4` | decoded input present; audit PASS |
| 2.0.22/5002318 | 2,277,488 | `3c8d1ce13fd61edff5ce65efe6eedcc8565c89b66bab371550986a5c75407e56` | `0x96a26` | `0x98998` | `0xa285f` | `0x10b430`, `0x10b4a0`, `0x10b510` | decoded input present; audit PASS |
| 2.0.22/5002322 | 2,283,400 | `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f` | `0x96ba5` | `0x98b17` | `0xa2b93` | `0x10ba78`, `0x10bae8`, `0x10bb58` | decoded input present; audit PASS |
| 2.0.23/5002363 | 2,292,008 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` | `0x970a1` | `0x99013` | `0xa31bb` | `0x10c840`, `0x10c8b0`, `0x10c920` | decoded input present; audit PASS |

5001740's expected size and hash come from the static analysis in the plan matrix; its suffix offsets, stock-shader bytes and audit results remain BLOCKED until a decoded `lib/arm64-v8a/libvrlink_scene.so` of that exact base exists. No neighbor-derived fixture is used or promised.

### Stock fragment and alpha suffixes

The 1,087-byte common fragment is **byte-identical on all 6 available bases** (SHA-256 `cbf2d90eb70b9769dd64e57da5d76dbc38ab7213dcf7b940c956813a1ddaa99a`; NUL-terminated at offset +1,087). It declares `precision mediump float;`, exposes the 8-declaration interface (external sampler at location 2; `fFadeAmount` 3; `UniReserved1`/`UniReserved2` 4/5; `UniDitherOffsets` 6), and deliberately leaves `main()` open: native code appends exactly one of two C-string suffixes, which supply the closing statement and brace. Adding a closing brace to a replacement prefix would break that contract.

- Opaque suffix, 29 B, byte-identical on all 6 (SHA-256 `93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c`): `\n\t\t\tcolor.a = 1.0;\n        }\n`
- Mask suffix, 296 B, byte-identical on all 6 (SHA-256 `2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623`): computes `color.a` from `uvmask` through a pow edge curve, then closes the same brace.

### Assembled complete shaders, 2026-09-19

`patches/src/main/kotlin/util/Sdr10ShaderAssembleAudit.kt` (runner: `Test-Sdr10ShaderAssemble.ps1`, cached-Kotlin route because normal Gradle is blocked on `app.morphe.patches:1.3.3`) assembles the complete programs — production `paddedVideoShader` prefix at neutral/sRGB8-highp across off/low/standard dithering, plus each base's real native suffixes located by unique content anchors — for every available base: **6 PASS, 1 BLOCKED (5001740, decoded input missing)**. Every assembled file is 1,116 B opaque or 1,383 B masked, identical across all 6 available bases and dither modes: 36 `.glsl` files plus `report.txt` under `build/sdr10-shader-assemble-5337d033135547da8ec01f3ee0d0eac4/`. Dither off→low changes only `DITHER_SCALE` `.00392`→`.00196`, `DITHER_ENABLE` 0→1 and the final statement; off→standard changes only `DITHER_ENABLE` and the final statement — the `paddedVideoShader` design, not an ad-hoc edit.

`glsl_validate.py` in this folder is a fail-closed structural/semantic ESSL 3.00 checker (stdlib-only Python 3; `in` variables read-only; `pow` restricted to legal scalar/vector pairs). It passes **36 of 36** assembled files and fails all 9 negative controls in its scratch suite. This is **not** driver compilation: no glslangValidator/Vulkan SDK exists on this machine, and the checker never executes a shader. GLSL driver compile, runtime format acceptance, and panel output remain unperformed.

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

## Fovea VD-Like toggle adaptation, 2026-09-20

Per the [plan](VD-LIKE-SDR10-IMPLEMENTATION-PLAN.md), the retired 10-bit/FP16 output options and standalone dithering option are replaced by two mutually exclusive fovea toggles (`foveaVdLike10Bit`, `foveaVdLike8Bit`); `resolveFoveaMode` enforces mutual exclusion (both on → `PatchException`). Every mode writes the SRGB8_ALPHA8 swapchain instruction (`69 88 91 52`) at all guarded sites. The fovea gate is a compact uvmask-derived weight (the same 4-section geometry as the masked alpha suffix; 1.0 at a section centre, 0.0 at the edges) that scales the dithered 10→8 noise: INPUT_10BIT enables the STANDARD dither scale with the gate, INPUT_8BIT keeps the gate with dither off, and both off keeps the legacy calibrated path. The fovea path in this implementation keeps the calibrated template (the plan's attached Slice 3); the tracked-plan §3.5 "neutral fovea path" variant is a separate, user-decided option.

Re-runs on this machine (fallback routes; not a Morphe APK build, install, or runtime proof):

- `Test-OledDecodedCompatibility.ps1 -JavaHome F:/Runtimes/Java21`: **3 PASS (5001712, 5002244, 5002363), 4 BLOCKED** (5001740, 5002313, 5002318, 5002322 — no decoded input in this checkout). Each PASS: 63 variants, 567 transitions, 126 checkbox cases, plus 21 fovea toggle cases (off / input-8bit / input-10bit × 7 profile combinations) with gate-presence, dither-enable, exact-diff, idempotence and transition checks, and golden-pinned shader bytes at the default calibration (gamma 1.20, saturation 1.45, 1,087-byte block): off = SHA-256 `a0117d0c0e78b251b979ec4e2094ae03f07eac1386c6971268d8d1543129681b` (byte-identical to the pre-Fovea-VD-Like output), input-8bit = `c18f8cd748f4ab8b9310dbb3e764d63f3ccd7d521971d16767e84980c6fbcbc5`, input-10bit = `f3f350a9f760d9af49c8fe116abf61bb2b60e774f7120b6fe83f28b40e89bce2`.
- `Test-Sdr10ShaderAssemble.ps1` + `glsl_validate.py`: 30 assembled `.glsl` files (3 bases × off/low/standard/fovea-input-8bit/fovea-input-10bit × opaque/masked), **30 PASS, 0 FAIL**; assembled size 1,116 B opaque / 1,383 B masked per base, under `build/sdr10-shader-assemble-5c90eb0212314fd597289f78540f9a2f/`.
- `VideoOutputPrecisionTest` (21 tests, incl. the fovea resolver/gate/byte-budget tests and the golden-byte test) executed standalone through the cached-Kotlin + `kotlin.test` shim route: **21 PASS, 0 FAIL**. The Gradle `:patches:test` route remains blocked on `app.morphe.patches:1.3.3` (GitHub Packages, needs GITHUB_TOKEN; no token in this environment and no cached plugin).
- Emitted shader content sizes at the default calibration: off = 995 B, fovea input-8bit = 1,076 B, fovea input-10bit = 1,080 B (all within the hard 1,087 B block).

Not done (not authorized): GLSL driver compile, runtime negotiation and sampled contents, Morphe APK patching/install, and headset/panel verification. The 4 BLOCKED bases remain pending on pristine decoded inputs; they are never silent PASS rows.
