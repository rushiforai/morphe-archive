# Plan: Fovea VD-Like SDR10 — two-toggle, fovea-only, always 8-bit out

Date: 2026-09-20. Status: planning handoff — rewrite of the 2026-09-19 SDR10 baseline plan. Scope: SteamLink repository only. No implementation, build, APK install, driver deploy, SteamVR restart, or device work is authorized by saving this plan.

## 0. Authorization and scope

This is the real, self-contained planning handoff that a less-capable implementation agent can execute. Keep it self-contained because `build/` outputs are git-ignored and may not accompany a checkout. No product implementation is authorized merely by saving this plan. Do not install an APK/driver, restart SteamVR, change live settings, or run device reproductions without explicit authorization. This task is planning only.

Repository constraint: SteamLink repository only (per user constraint). No work in CustomHeadsetOpenVrGxR. The input bit depth (HEVC Main10 vs Main8) is host-negotiated and out of scope; the client toggles only declare the assumed input depth so the fovea processing matches.

User decisions (explicit, collected):
- Retire the current 10-bit output options and the standalone dithering option.
- Replace them with two mutually-exclusive fovea toggles:
  - "Fovea VD-Like Input 10 bit" — 10-bit input → VD-Like processing → 8-bit output.
  - "Fovea VD-Like Input 8 bit" — 8-bit input → VD-Like processing → 8-bit output.
- Both toggles are fovea-only (lighter on the SoC than VD's full-frame) and always output 8-bit.
- Patch description (exact ask): "a patch trying to emulate what VD does with the 10-bit info but only on the fovea and always outputs 8 bit."
- Plan (not implement) first; write it into the attached plan file.

## 1. Goal, non-goals, and the compliance gap this closes

### Goal
Emulate how VD handles 10-bit input — 10-bit in, 8-bit sRGB out — using a dithered 10→8 quantize at the final boundary (VD's confirmed behavior is 8-bit sRGB-out + BT.2020→709; the dithered quantize is this plan's chosen mechanism), but apply it only on the fovea (the high-acuity region) rather than full-frame, and always output 8-bit. The fovea path is NEUTRAL (no gamma/saturation, like VD's video pass) and the colour profile is a separate full-frame experimental control (Section 3.5). Expose it as two mutually-exclusive opt-in toggles that declare the assumed input depth (10-bit vs 8-bit). This is semantic alignment with VD's behavior, not a copy of its proprietary GLSL and not a promise of identical visual quality.

### Non-goals
- No host-side (CustomHeadsetOpenVrGxR) changes; input bit depth is host-negotiated.
- No HDR/PQ/HLG signaling, tone mapping for ordinary SDR, new encoders, protocol/GXRP changes, or fake P010 declarations.
- No 10-bit/FP16 output formats (always 8-bit out).
- No global default changes; new behavior is explicit opt-in and reversible.
- No resolution/topology refactors, controller/tracking changes, or changes to 2.0.22/5002296 (high-resolution-only).

### The compliance gap (what the prior patch did NOT do, and this plan must close)
The prior OLED patch (2026-09-19 plan, Section 10) was a static full-frame 8-bit sRGB baseline with dither off by default, no input-bit-depth detection, and no fovea gating. Against the "VD-method, fovea-only, 10-bit-gated" requirement it was non-compliant. This plan closes each gap:

| Requirement | Prior patch | This plan |
|---|---|---|
| VD-method (10→8 dithered quantize) | dither off by default; full-frame; standalone option | fovea-gated VD-Like 10→8 dither, active when a toggle is selected |
| Fovea-only | full-frame | gated on the per-pixel foveal indicator (Section 3.2) |
| 10-bit-gated | no input-bit-depth detection | two toggles declare the assumed input depth (10-bit / 8-bit) |
| Always 8-bit out | sRGB8 default, but 10-bit/FP16 output options existed | 10-bit/FP16 output options retired; SRGB8 is the only output |

## 2. Verified facts (carried forward + one correction)

### 2.1 Exact 7-base matrix (unchanged from 2026-09-19)

| Version/build | Size bytes | SHA-256 | Format sites |
|---|---:|---|---|
| 2.0.20/5001712 | 2221072 | `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` | `0x10a9c4`, `0x10aa34` |
| 2.0.20/5001740 | 2220528 | `5fbb76c06c9fc0e3e5c5825752aa17e040462c8551b69d3492265f620244f443` | `0x10a854`, `0x10a8c4` |
| 2.0.22/5002244 | 2251920 | `4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12` | `0x10826c`, `0x1082dc`, `0x10834c` |
| 2.0.22/5002313 | 2276872 | `e4d3575a130dc013e4c8fe4fb965217028229f89b13ba821c01b492e457398bb` | `0x10b2d4`, `0x10b344`, `0x10b3b4` |
| 2.0.22/5002318 | 2277488 | `3c8d1ce13fd61edff5ce65efe6eedcc8565c89b66bab371550986a5c75407e56` | `0x10b430`, `0x10b4a0`, `0x10b510` |
| 2.0.22/5002322 | 2283400 | `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f` | `0x10ba78`, `0x10bae8`, `0x10bb58` |
| 2.0.23/5002363 | 2292008 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` | `0x10c840`, `0x10c8b0`, `0x10c920` |

Stock sRGB instruction: `69 88 91 52`. Retired alternatives (kept only for reversibility): RGB10_A2 `29 0b 90 52`, FP16 `49 03 91 52`. These change projection storage only.

### 2.2 Shader interface and the foveal-alpha mechanism (CORRECTED)
- The patched region is the 1,087-byte common fragment, byte-identical on all 6 available bases (SHA-256 `cbf2d90eb70b9769dd64e57da5d76dbc38ab7213dcf7b940c956813a1ddaa99a`), NUL-terminated at +1,087, and it deliberately leaves main() OPEN so Valve appends a program suffix.
- Interface (8 declarations): `in vec2 uvmask; in vec2 uv; out vec4 color;` plus uniforms at location 2 (`highp samplerExternalOES tex0`), 3 (`float fFadeAmount`), 4 (`vec3 UniReserved1`), 5 (`vec4 UniReserved2`), 6 (`vec4 UniDitherOffsets`).
- CORRECTION to the earlier "alpha-proxy via the texture color.a" assumption: the foveal alpha is NOT the sampled texture's color.a. Valve overwrites color.a in the program suffix:
  - Opaque suffix, 29 B, byte-identical on all 6 (`93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c`): `color.a = 1.0;` — fully opaque, no spatial foveal distinction.
  - Masked suffix, 296 B, byte-identical on all 6 (`2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623`): computes a per-pixel foveal alpha from the uvmask input:
    ```glsl
    vec2 placeInSection = fract(uvmask * vec2( 1.0, 4.0 ));
    vec2 distCenter     = abs( placeInSection - 0.5 );
    float powv = 10.0;
    float edgecurve = 1.5;
    color.a = pow( 1.05 - (pow( distCenter.y*2.0, powv ) + pow( distCenter.x*2.0, powv )) * 1.06, edgecurve );
    ```
  - Therefore the per-pixel foveal indicator available in the patched region is the uvmask-derived mask alpha, recomputed from the uvmask input — NOT texture(tex0,uv).a (which the suffix discards).
- HARD BYTE BUDGET: the common block is fixed at 1,087 B in every decoded libvrlink_scene.so. The current template already occupies 995 B (dither off) to 999 B (dither low/standard), leaving only 88–92 B of room. The full masked-suffix formula above is 135 B and does NOT fit. The foveal gate must therefore be a compact approximation. Measured candidates that fit: linear length 70 B, linear xy 76 B, quadratic dot 78 B (e.g. `vec2 d=abs(fract(uvmask*vec2(1.,4.))-.5);float f=clamp(1.-dot(d,d)*4.,0.,1.);`), compact pow 87 B. Choosing the compact formula is a Slice-3 detail; the 1,087 B total is a hard stop condition.
- The existing dither uses gl_FragCoord for its noise phase, is full-frame, and is guarded near 0/1 by smoothstep. Scales: LOW `.00196`, STANDARD `.00392` (sRGB8 code space). UniDitherOffsets phase wraps at 1024 on traced bases.

### 2.3 Current options (what exists to retire / keep) — OledCalibrationPatch.kt
- Retire: VideoOutputPrecision.RGB10_A2_EXPERIMENTAL and VideoOutputPrecision.RGBA16F_EXPERIMENTAL (10-bit/FP16 output); the dithering stringOption (OFF/LOW/STANDARD); the use8BitOutputWhenDithering booleanOption; the outputPrecision option's 10-bit/FP16 values; resolveVideoOutputPrecision; VideoDitherMode (or reduce to OFF only).
- Keep: profile (initial / final-balanced / neutral / custom), the gamma and saturation sliders, the SRGB8_HIGHP output path, setProjectionSwapchainFormat (now always SRGB8), findVideoShader, and the 7-base layout table.

### 2.4 VD reference (verified facts only)
Verified in this repo (IL / shader-IL / audit evidence):
- VD's traced VR color swapchains use GL_SRGB8_ALPHA8 — 8-bit sRGB output, the same 8-bit-out target this plan uses.
- A BT.2020→BT.709 matrix is present in VD's extracted shader IL; Valve's stock shader likewise retains the `_valve1_d2020d709` matrix (do not silently remove it).
- `ShouldUseGammaBoost` returns false unconditionally (IL: `ldc.i4.0; ret`) — the power-1.5 gamma branch is dormant.
- No explicit `GL_DITHER` is set by VD in the inspected IL; GLES defaults `GL_DITHER` to true, but effective driver/runtime dithering was NOT measured.
NOT verified in this repo — do not state as fact: a `sws_dither`/`swscale` dither mechanism, a specific FFmpeg version, a named "Dither effect", or `R16G16B16A16` as a VD format (the source plan names only `R10G10B10A2`, in the host `MapLayerFormat`, not VD).
Emulate target: take 10-bit input and emit 8-bit sRGB via a dithered 10→8 quantize, fovea-only — a design goal aligned to VD's confirmed 8-bit-out + BT.2020→709 handling, not a proven VD dither pipeline and not a copy of any VD GLSL body.

### 2.5 Build state (unchanged)
- The local Morphe build is blocked on plugin app.morphe.patches:1.3.3 (GitHub Packages; needs GITHUB_TOKEN).
- Fallback routes (NOT a real Morphe build or APK proof): Compile-CachedAudit.ps1, Test-OledDecodedCompatibility.ps1, Test-Sdr10ShaderAssemble.ps1, glsl_validate.py.
- 6 of 7 bases have decoded inputs; 5001740 is BLOCKED (decoded libvrlink_scene.so missing) — an explicit BLOCKED row, never a silent PASS.

### 2.6 Prior implementation work carried forward (2026-09-19, slices A–F)
- VideoOutputPrecisionTest.kt — 7 layouts (5002363 added) + a retired-hook guard test across option combinations.
- OledDecodedCompatibilityAudit.kt — extended to all 7 bases with explicit BLOCKED rows.
- Check-SteamLinkColour.ps1 — goal-specific Sdr10ToSrgb8 derived field plus self-tests.
- Sdr10ShaderAssembleAudit.kt + Test-Sdr10ShaderAssemble.ps1 + glsl_validate.py — assembles the complete opaque/masked programs from the production common prefix plus each base's real native suffixes (6 PASS, 1 BLOCKED; 36 GLSL structural PASS, 0 FAIL).
- These remain valid infrastructure for this plan; the design (options + shader) is what changes.

### 2.7 YUV vs RGB boundary (host vs client) — no driver change needed
- The headset shader samples RGB, not raw YUV: the decoded video texture is a `samplerExternalOES` (GL_OES_EGL_image_external), and the Android GL driver performs the YUV→RGB conversion internally. The shader then applies the `_valve1_d2020d709` BT.2020→sRGB matrix to the already-RGB result. This is already handled on the headset — NO host change is needed to "send YUV instead of RGB."
- The host (CustomHeadsetOpenVrGxR) encodes HEVC (NVENC); the input to the encoder is NV12 or P010 (YUV) — `NvencPostPack.cpp` hard-fails on anything else ("packed texture is not NV12/P010"). The RGB→YUV conversion happens INSIDE vrlink (the SteamLink host library), not in the CustomHeadsetOpenVrGxR driver. The driver's `vrlink_layer_ps.hlsl` operates on RGB (sRGB-typed views) and writes back to the RGB layer. There is NO "send RGB vs YUV" toggle in the host pipeline.
- The "10-bit" at the host is the HEVC Main10 (P010, YUV 10-bit) vs Main8 (NV12, YUV 8-bit) — the INPUT bit depth. It is controlled by the EXISTING host-side setting `supports10bit=true` (GUI toggle `profileSupports10bit` in CustomHeadsetOpenVrGxR, written to `vrlink_<model>.supports10bit` at GalaxyXR.cpp:288), which vrlink honors at connect to switch its encoder to 10-bit HEVC ("Using 10bit mode: 1"). This is a PREREQUISITE for the "10-bit" toggle to work (the host must actually send 10-bit), but it is an EXISTING setting (no new host-side code) and OUT OF SCOPE for this SteamLink-repo-only plan. The "8-bit" toggle needs no `supports10bit` (8-bit is the host default).
- The "10-bit RGB" options (RGB10_A2_EXPERIMENTAL, RGBA16F_EXPERIMENTAL) are the PROJECTION SWAPCHAIN output formats (how the headset submits the final image), NOT "send YUV vs RGB" options. They are already retired in Slice 1 (always 8-bit out).
- VD's shader does YUV→RGB explicitly only because VD uses a REGULAR texture (not `samplerExternalOES`), so its driver doesn't convert. That is a VD-specific detail, not a host requirement.

## 3. Design

### 3.1 The two toggles (mutually exclusive; radio: off / 10-bit / 8-bit)
- Fovea VD-Like Input 10 bit (default off): declare the decoded video texture as 10-bit (host negotiated Main10/P010). Apply fovea-gated VD-Like 10→8 dithered quantization. Output 8-bit sRGB.
- Fovea VD-Like Input 8 bit (default off): declare the decoded video texture as already 8-bit (host sent Main8). Apply the fovea-gated neutral path (no 10→8 dither needed because the input is already 8-bit; the fovea gate still bounds any processing). Output 8-bit sRGB.
- Both go through the same fovea-gated "VD-Like" path; the difference is the assumed input depth, which selects the dither scale (10-bit → full 10→8 dither; 8-bit → neutral/no dither). The exact scales are a Phase-1 numeric tuning item (measured banding), not a settled constant.
- Mutual exclusion: at most one active at a time; selecting one deselects the other (and both deselect "off"). Enforce in the resolver, not just the UI.
- Input depth is host-negotiated (out of scope for this SteamLink-repo-only plan): the toggles DECLARE the assumed input depth so the client's fovea processing matches; they do not force the host stream depth. A mismatch (toggle says 10-bit but the host sent 8-bit, or vice versa) is a measured result, not a forced conversion.
- **Host-side prerequisite (EXISTING, no new code):** the "10-bit" toggle REQUIRES the host to actually send 10-bit. That is the EXISTING setting `supports10bit=true` (GUI `profileSupports10bit` in CustomHeadsetOpenVrGxR → `vrlink_<model>.supports10bit`, GalaxyXR.cpp:288), which vrlink honors at connect to switch its encoder to 10-bit HEVC (Main10/P010, "Using 10bit mode: 1"). Without it, vrlink sends 8-bit (Main8/NV12) and the "10-bit" toggle is a mismatch. The "8-bit" toggle needs no `supports10bit` (8-bit is the host default).
- **REQUESTED vs ACCEPTED:** `supports10bit=true` is only a REQUEST the driver writes; vrlink confirms at connect (the toolkit's NvencTap is passive — it never sets depth). Verify the ACCEPTED depth via `driver_vrlink.txt` ("Using 10bit mode: 1") or the NvencTap log (`outBitDepth=10`, NvencTap.cpp:343) before trusting the "10-bit" path; no captured proof of that exists in the repo.

### 3.2 Fovea gating mechanism (alpha-proxy via uvmask; Phase-1 validated; fallbacks)
- Primary: recompute a compact per-pixel foveal weight in the common fragment from the uvmask input (the same fract(uvmask*vec2(1.,4.)) section geometry as the masked suffix) and scale the dither noise n by that weight. High weight = fovea (apply VD-Like); low weight = periphery (skip/reduce). This saves SoC ALU in the periphery versus VD's full-frame dither.
- Why not the texture color.a: the suffix overwrites color.a (opaque→1.0, masked→uvmask curve), so the sampled texture alpha is not the foveal indicator and may be arbitrary. The uvmask-derived weight is the reliable per-pixel foveal signal in the patched region.
- Why compact rather than the exact formula: the 1,087-byte block leaves only 88–92 B; the exact masked-suffix formula (135 B) does not fit. A compact monotonic falloff (e.g. the 78 B quadratic-dot form) is a faithful-enough foveal gate and fits. The exact curve is a Slice-3 tuning detail.
- Phase-1 validation gate (NOT a settled fact):
  1. Confirm at runtime which program (opaque vs masked) renders video. If only the opaque program is used (alpha≡1.0), there is no spatial foveal distinction and the gate degenerates to full-frame → use fallback (b).
  2. Confirm the masked suffix formula and the uvmask section layout (4 vertical sections) are byte-identical on all 7 bases (6 available; 5001740 BLOCKED) and that the section centers correspond to the intended foveal region. If the 4-section layout does not match the fovea, re-derive the indicator or fall back.
  3. Confirm the foveal weight is well-defined everywhere. The exact masked-suffix pow argument goes negative at section edges (→ NaN); the compact gate uses clamp/max so it is well-defined and in [0,1].
- Fallbacks (if the primary is not validated):
  - (a) foveal-geometry uniform — requires the PC to send foveal data it does not currently send (out of scope; last resort).
  - (b) accept full-frame VD-Like but gate on input bit-depth (apply the dither only when the 10-bit toggle is selected). Loses the SoC savings but remains compliant with "VD-method + 10-bit-gated + 8-bit out".

### 3.3 Retirement scope and reversibility
- Retire RGB10_A2_EXPERIMENTAL and RGBA16F_EXPERIMENTAL (10-bit/FP16 output); the standalone dithering option; use8BitOutputWhenDithering; and the outputPrecision option's 10-bit/FP16 values.
- SRGB8 becomes the only output; the dither is no longer a standalone option — it is fovea-gated and driven by the two toggles.
- Reversibility: keep the retired code paths reachable in a single resolver until the toggles are validated, so the old behavior can be restored if a toggle fails. Do not delete the RGB10_A2_INSTRUCTION / RGBA16F_INSTRUCTION constants until the retirement is proven reversible and the catalog is regenerated.

### 3.4 Always 8-bit out
- setProjectionSwapchainFormat always writes SRGB8_INSTRUCTION (69 88 91 52) at every layout's format sites; the RGB10/FP16 replacement branches are retired.
- The SRGB8_INSTRUCTION sites, per-base offsets, and context preconditions are unchanged; only the selection collapses to SRGB8.

### 3.5 NEUTRAL fovea path + decoupled colour profile (the "same as VD" requirement)
This is the constraint that makes the fovea VD-Like "same as what VD does, but on the fovea layer."
- VD's default video path is NEUTRAL (confirmed from the audit): the SpriteGammaEffect video shader applies only a neutral colorimetric conversion (YUV→RGB / full-limited range), with the gamma-boost branch DORMANT (ShouldUseGammaBoost returns false, gamma=1) and NO saturation. So "same as VD" = a NEUTRAL 10→8 pass, not a gamma/saturation-calibrated one.
- Therefore the fovea VD-Like path is NEUTRAL: it applies the colorimetric conversion (the `_valve1_d2020d709` matrix) + the fovea-only dithered 10→8 quantize, but NO gamma/saturation. The fovea dither operates on the colorimetric value `c`, NOT the calibrated value `q` — this removes the current patch's coupling, where the dither `n` is added to the calibrated `q`.
- The colour profile (gamma/saturation — the `profile` option) is a SEPARATE, independent, full-frame control for experimentation — "on the side." It is NOT part of the fovea VD-Like path. It keeps its existing full-frame behavior (affects the entire image, as it does now).
- The two are MUTUALLY EXCLUSIVE, selected by the fovea VD-Like toggle state:
  - A fovea VD-Like toggle is selected → NEUTRAL path: raw texel → matrix → fovea-only dithered 10→8 → 8-bit out. Colour profile BYPASSED (neutral).
  - No fovea VD-Like toggle → colour profile path: the existing gamma/saturation full-frame calibration (experimental). No fovea dither.
- Byte budget: the neutral fovea path is SHORTER than the current calibrated path (no gamma/saturation), so the fovea gate fits comfortably within the 1,087-byte block (more headroom than the 88–92 B measured for the calibrated template).

## 4. Implementation plan (the important part) — slice-by-slice, narrowest check after each edit

Standing rules (carry forward): one testable slice at a time; the first substantive edit is immediately followed by the narrowest relevant check; no bulk edits before validation; stop on any hash/size/caller mismatch; never move offsets by a neighbor delta; preserve the existing emitted shader bytes when all toggles are off (prove with golden/generated comparisons, not prose); no device work without authorization; mark unavailable rows BLOCKED, never silently omit; no new protocol/encoder/bitrate/force10bit to make a failing test pass.

### Slice 0 — Freeze evidence
1. Record repo HEAD, dirty status, exact file hashes of OledCalibrationPatch.kt, the 7 decoded .so inputs, and the sdr10-shader-assemble-* build dir. Do not reset or commit existing work.
2. Re-verify the 7-base matrix (Section 2.1) and the 6/1 available-BLOCKED split.
3. Record the current template byte sizes (995 / 999 B) and the 88–92 B room (Section 2.2) as the byte-budget baseline.
- Narrowest check: a read-only inventory (no edits).
- Exit: provenance matrix complete with BLOCKED rows labeled; byte-budget baseline recorded.

### Slice 1 — Retire 10-bit output + standalone dither options
File: OledCalibrationPatch.kt.
1. Remove RGB10_A2_EXPERIMENTAL and RGBA16F_EXPERIMENTAL from VideoOutputPrecision (keep SRGB8_HIGHP).
2. Remove the dithering stringOption and the use8BitOutputWhenDithering booleanOption. Remove VideoDitherMode (or reduce to OFF only) and resolveVideoOutputPrecision.
3. setProjectionSwapchainFormat: collapse the selection to always write SRGB8_INSTRUCTION; drop the RGB10/FP16 replacement branches (keep the RGB10_A2_INSTRUCTION / RGBA16F_INSTRUCTION constants temporarily for reversibility — see 3.3).
4. paddedVideoShader: drop the dither / outputPrecision parameters; always emit the SRGB8 path with the fovea gate OFF (placeholder for Slice 3).
- Narrowest check: the module compiles (:patches:compileKotlin, or the cached-compile fallback) and no surviving reference to a retired symbol.
- Stop: if any test or other patch references a retired symbol — fix the reference before proceeding (no dangling symbols).

### Slice 2 — Add the two fovea toggles + mutual exclusion
File: OledCalibrationPatch.kt.
1. Add two booleanOption declarations: foveaVdLike10Bit (title "Fovea VD-Like Input 10 bit", default false) and foveaVdLike8Bit (title "Fovea VD-Like Input 8 bit", default false), each with the Section 3.1 description and the host-negotiation caveat.
2. Add a resolver resolveFoveaMode(a: Boolean, b: Boolean) returning OFF / INPUT_10BIT / INPUT_8BIT; if both are true, throw PatchException (mutual exclusion enforced server-side, not just UI).
3. Wire the resolver into the execute block; select the dither / neutral path per FoveaMode.
- Narrowest check: a new unit test proving (a) both-off → neutral sRGB8, (b) 10-bit → fovea 10→8 dither path, (c) 8-bit → fovea neutral path, (d) both-on → PatchException.
- Stop: if the resolver allows both toggles active.

### Slice 3 — Implement the NEUTRAL fovea-gated VD-Like dither in the shader
File: OledCalibrationPatch.kt (paddedVideoShader / HIGHP_SHADER_TEMPLATE).
1. Build the NEUTRAL fovea path (Section 3.5): raw texel → `_valve1_d2020d709` matrix → fovea-only dithered 10→8 quantize → 8-bit out. NO gamma/saturation. The fovea dither operates on the colorimetric value `c`, NOT the calibrated `q`.
2. Add the compact foveal weight from uvmask (e.g. the 78 B quadratic-dot form `vec2 d=abs(fract(uvmask*vec2(1.,4.))-.5);float f=clamp(1.-dot(d,d)*4.,0.,1.);`) and scale the dither noise n by f and by the input-depth-appropriate scale per FoveaMode.
3. Keep the colour profile path (gamma/saturation full-frame) as the separate experimental path (selected when no fovea VD-Like toggle is active); preserve its existing full-frame behavior.
4. Keep main() OPEN, the 8-declaration interface, locations 2–6, the NUL boundary, and the color.rgb endpoint gate; do not add a closing brace (the suffix closes it).
5. Verify the assembled size stays ≤ 1,087 B for the neutral fovea path AND the colour-profile path; if it exceeds, compact the formula further (do not truncate or relocate).
- Narrowest check: extend Sdr10ShaderAssembleAudit to assemble the new fovea-gated common prefix plus each base's real opaque/masked suffixes for all 7 bases; glsl_validate.py must PASS all assembled files; the byte-size check must hold.
- Stop: if the assembled size exceeds 1,087 B, the interface changes, or the alpha is no longer assigned.

### Slice 4 — Update patch description + catalog sync
1. Set the patch description to the user's exact text: "a patch trying to emulate what VD does with the 10-bit info but only on the fovea and always outputs 8 bit." (plus the 7-build list).
2. Regenerate the catalogs (generatePatchesList for stable and experimental) so the retired options are gone and the two toggles are present; inspect the diff and preserve the other patches' entries.
- Narrowest check: patches-list.json / -experimental.json / -all.json contain the two new toggle keys and no dithering / use8BitOutputWhenDithering / rgb10-a2-experimental / rgba16f-experimental keys; the other patches are unchanged.
- Stop: if the catalog diff touches unrelated patches.

### Slice 5 — Tests
1. VideoOutputPrecisionTest.kt: update to the new option set (drop RGB10/FP16/dither assertions; add fovea-gate + toggle assertions); keep the 7-layout and retired-hook guard tests.
2. PatchCompatibilityMatrixTest.kt: assert the two toggles' mutual exclusion, defaults (both off), and that the patch remains compatible with the 7 exact bases.
3. OledDecodedCompatibilityAudit.kt: extend the option matrix to the new toggles (off / 10-bit / 8-bit) across all 7 bases, preserving the BLOCKED rows.
4. Add a golden-byte test: the all-toggles-off emitted shader must be byte-identical to the pre-change srgb8-highp/off output (proves no regression when off).
- Narrowest check: full :patches:test (or the cached-compile fallback) — all tests pass with no retired-symbol references.
- Stop: on any failure or a golden-byte mismatch.

### Slice 6 — Docs + final gate
1. Update diagnostics/steamlink-colour/README.md and OLED-COMPATIBILITY-NATIVE.md: the two toggles, the fovea-gate mechanism (uvmask-derived, compact, Phase-1 validated), the retirement, and the always-8-bit contract.
2. Record the plan checklist with exact completed files, commands, hashes, and BLOCKED rows in Section 8 of this plan.
3. Update WORKSPACE_CLEANUP.md if new artifacts are produced.
- Narrowest check: Check-SteamLinkColour.ps1 -Mode SelfTest PASS; the docs link to this plan.
- Stop: on self-test failure.

## 5. Risks and unknowns
1. Alpha semantics at runtime (top risk): whether the opaque or the masked program renders video is not statically known. If opaque-only, the fovea gate degenerates to full-frame (fallback b). This is a Phase-1 validation item, not a settled fact.
2. Section layout vs fovea: the masked suffix uses 4 vertical sections (uvmask*vec2(1.,4.)); whether the section centers correspond to the intended foveal region is unverified.
3. Byte budget (hard stop): only 88–92 B of room; the foveal gate must be compact. A formula that would push the total past 1,087 B must be compacted, not truncated.
4. Host-side Main10 negotiation is separate: the toggles declare the assumed input depth; they do not force the host stream depth. A mismatch is a measured result.
5. SoC cost: fovea vs full-frame dither is small ALU (a few ops per pixel); the savings are real but modest. Do not claim a large performance win.
6. Retirement reversibility: removing the 10-bit/FP16 output options and the standalone dither is a user-visible API change; keep it reversible until validated.
7. 5001740 BLOCKED: no decoded input; the fovea gate cannot be validated on that base. Keep it an explicit BLOCKED row.

## 6. Verification commands (implementation phase, not planning)
Run each in the SteamLink repo root; stop on nonzero exit; retain bounded logs. Fallback routes are NOT a real Morphe build or APK proof.
1. `.\gradlew.bat :patches:test --tests app.template.patches.steamlink.binary.VideoOutputPrecisionTest`
2. `.\gradlew.bat :patches:test --tests app.template.patches.steamlink.PatchCompatibilityMatrixTest`
3. `.\gradlew.bat :patches:auditOledDecodedCompatibility`
4. Fallback only if Gradle/plugin resolution blocks: `.\diagnostics\steamlink-colour\Test-OledDecodedCompatibility.ps1 -JavaHome <verified-JDK21-path>` (PatchException shim + extracted production helpers; NOT a real Morphe build or APK proof).
5. `.\diagnostics\steamlink-colour\Test-Sdr10ShaderAssemble.ps1` (cached-Kotlin shader assembly), then `python diagnostics/steamlink-colour/glsl_validate.py <assemble-output-dir>`.
6. `powershell -NoProfile -File .\diagnostics\steamlink-colour\Check-SteamLinkColour.ps1 -Mode SelfTest`.
7. `.\gradlew.bat :patches:generatePatchesList -PreleaseChannel=stable` and `-PreleaseChannel=experimental` (only after options/catalog metadata changed); inspect the catalog diff and preserve tracked catalogs.
8. `.\gradlew.bat build` — required final repository gate; distinguish dependency failure from code failure.
9. Real Morphe packaging/signature validation for each available pristine APK follows existing project tooling, then inspect the actual .so bytes/options. Never bypass missing pristine-APK evidence with reconstruction; do not invent nonexistent audit kinds.

## 7. Handoff rules (carry forward, adjusted)
- Work 1 testable slice at a time; the first substantive edit is immediately followed by the narrowest relevant check.
- Start with Slice 0 (freeze evidence) and Slice 1 (retire options). Do not start by altering binary instructions.
- Preserve all existing emitted shader bytes when all toggles are off; prove with golden/generated comparisons, not prose.
- Stop if any exact native hash/size/caller differs; never move offsets by a constant delta from a neighboring build.
- Stop if the assembled shader exceeds 1,087 B or changes the interface/suffix assumptions; do not truncate or relocate.
- No claim that a toggle forces the host stream depth; input bit depth is host-negotiated.
- No claim that fovea gating is proven until the opaque-vs-masked runtime question is answered (Phase 1).
- No automatic force10bit, HDR flag, bitrate increase, driver API upgrade, or new protocol to make a failing test pass.
- Never conflate static helper PASS, actual Morphe APK PASS, installed artifact verification, runtime acceptance, visual improvement, and physical panel precision.
- If a required fixture/permission/tool is unavailable, mark that row BLOCKED with the exact prerequisite; do not silently omit it or promise completion.

## 8. Current planning outcome and file target
Research complete. The design was corrected (the foveal indicator is the uvmask-derived mask alpha, NOT the texture alpha) and constrained (the 88–92 B byte budget forces a compact foveal gate). No implementation, build, installation, or live test was performed while creating this plan. Seek and obey implementation authorization before modifying OledCalibrationPatch.kt, the tests, or the catalogs.

File target note: this plan was written into the attached working copy. The tracked repo copy at diagnostics/steamlink-colour/VD-LIKE-SDR10-IMPLEMENTATION-PLAN.md still holds the 2026-09-19 baseline plan (Sections 1–10). Confirm whether to sync the repo copy to this rewrite before overwriting it; the two copies were identical before this edit.
