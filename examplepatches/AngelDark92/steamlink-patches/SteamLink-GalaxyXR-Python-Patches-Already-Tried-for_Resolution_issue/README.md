# Steam Link Galaxy XR resolution experiments already tried

This directory is the historical record for approaches that did not produce permission-free, persistently high resolution. Do not stack these experiments into a new APK.

## 2026-09-11 — Android Surface actual video: tried, low resolution; do not reapply

**Android Surface actual video (experimental)** (`surface_video_v1`, `libgxr_surface_video.so`) did not meet the resolution goal. The user reported low-resolution output and requested that it be recorded here to avoid applying it again. Keep this version out of future APK selections; do not present it as an untried experiment.

The experiment copies all rendered video projections, including foveal alpha, into Android Surface swapchains. It targets exact 2.0.20/5001712 and 2.0.22/5002322, but this report does not establish a separate headset failure on each base. The exact tested APK, Surface precision and runtime activation/fallback state were not verified.

The local bundle and saved reconstructed test APKs passed a fresh payload check. Source inspection found no deliberate downscale, but this mode excludes the established terminal-quad high-resolution trigger and preserves projection-only submission. This is a possible explanation, not a proven runtime cause. Kernel inspection did not establish a Surface-specific resolution gate or justify a kernel change.

See the [low-resolution assessment](../diagnostics/steamlink-surface-video/LOW-RESOLUTION-ASSESSMENT-20260911.md). The active patch, native implementation/build targets, packaged resources and catalog entry were subsequently removed on 2026-09-11. The dedicated local installable bundle was deleted. Historical evidence is retained; old identifiers remain cleanup-only. The working **Galaxy XR high-resolution 3-projection fix** is a separate patch and is not marked failed by this result.

## Captured on build 5002322

| Experiment | Result |
| --- | --- |
| Projection trace control | Low without Android XR UI; high only while UI was visible; returned low afterward. Diagnostic only. |
| Projection quality settings | Same UI-dependent result. The transform remained inactive because `XR_FB_composition_layer_settings` was not enabled. |
| VRLink unmanaged Full Space | Manifest change was proven installed, but the UI-dependent low/high/low behavior remained. Keep unmanaged Full Space only as required Android XR configuration, not as the resolution fix. |
| Projection settings stripped | Attempt invalid: the captures requested stripped mode but loaded `projection_settings_quality`. It was not a valid test and must not be cited as a failure of settings removal. |
| Projection metadata compatibility v2 | Corrected removal was proven active on 75 sampled frames across two intact runs. Resolution remained low without SystemUI, high only while SystemUI was visible, then low again. The hypothesis is conclusively rejected. |

The 2026-08-30 `single_projection_fovea_quads_v1` capture proved 5042 successful transformations but stayed `LOW0 -> LOW -> LOW1`, visibly worse than the original two- and three-projection low path. It also recorded repeated compositor buffer-acquisition and latch failures. The patch is retired and removed from Morphe; do not repeat or tune it.

## Captured single-projection v1 result

The 2026-08-28 captures reached `HIGH0` without overlay permission and `HIGH0 → HIGH → HIGH1` across the Android XR UI observation. This supersedes the earlier UI-dependent result, but v1 still alternated between reconstructed one-projection and original three-projection submission on repeated-image frames: 283 of 7,557 eligible frames in run 1 and 11 of 370 captured eligible frames in run 2. Every reconstructed frame also correlated one-for-one with a leaked `GL_INVALID_ENUM` from an invalid sampler-state query.

The 2026-08-29 v1.2 rerun was stable for 5772 successful transformations and stayed `HIGH0 -> HIGH -> HIGH1`. The earlier 2026-08-30 judgment that it matched the granted appear-on-top control is superseded: the user now reports plainly visible lower resolution at the 3152x3682 reconstruction output. A settings A/B separately proved that removing the `Highest` host profile lowered VRLink's render target from `3552x3840` to `2048x2048` and transport target from fixed `1536` to automatic `1152`; both host and reconstruction limits therefore matter. The 3745x4048 density-preserving request was capped by Android XR at 3152x3682, reducing the mapped foveal inset from 1536x1536 to about 1293x1397. The runtime did not advertise `XR_FB_composition_layer_settings`, so no supported compositor supersampling hint could be attached.

In plain terms, Steam Link normally submits 3 stereo OpenXR projection layers containing the full view and foveal detail. The experimental OpenXR API layer combines those submitted layers into 1 equivalent stereo projection at `xrEndFrame`. This changes the layer topology seen by Galaxy XR, which then selects its high-resolution path without an Android overlay. It does not reconstruct streamed video frames or change Steam Link's decoder. Full quality therefore requires both the single-projection Android path and a high-resolution VRLink host profile.

The corrected `two-projection-drop-base-v1.1-20260829` Repeat 2 capture is valid: 3967 successful 3-to-2 submissions stayed `LOW0 -> HIGH -> LOW1`. It preserved the original underside and alpha-foveal projections without allocation, GL, resampling, disable, or failed `xrEndFrame`. The redundant base and an exact count of three projections are rejected as causes.

The corrected three-projection v1.2 rerun is also valid: 4811 successful unchanged submissions stayed `LOW0 -> HIGH -> LOW1`. New sample-count-1 swapchains did not escape the low path. Together with the two-projection result, this localizes the reversible switch to Galaxy XR compositor policy for multiple projections and/or the alpha-foveated multilayer topology, not original swapchain identity, MSAA, or the redundant base.

DynamicPolicyManager exposed constant supersampling, recommended-resolution, and current-app/SystemUI FRS values across the palm switch. No public Android XR/OpenXR setter for the hidden state was found. Multiple projections were accepted successfully, so the evidence indicates a runtime implementation policy or bug rather than a core OpenXR layer-count limitation.

## Retired permission and window probes

- no-window and denied-permission controls;
- granted permission without a window;
- live type-2038 overlay before VR, removed before VR, and added after VR;
- activity-owned `TYPE_APPLICATION`, decor-view, direct-VR, and VRLink-live windows;
- lifecycle/focus suppression variants;
- baseline overlay-flow and no-overlay/no-permission variants.

Permission-free application windows did not reproduce the Android XR SystemUI effect. A real type-2038 overlay requires special user/platform authorization and is only a control.

## Retired renderer, transport, and compositor probes

- forced recommended swapchain dimensions and projection rectangles;
- pre-handshake and transport-ceiling size changes;
- duplicate/multilayer and purple OpenXR quad probes;
- legacy two-layer renderer topology;
- VRLink activity-layer proxy;
- persistent toast and HWC proxy variants;
- read-only resolution trace variants.
- projection metadata compatibility v2 (`projection_metadata_compat_v2`).

The Python files beside this README preserve those historical builders when present locally. Git history preserves retired Morphe/C++ implementations.

## Rejected without another headset test

- forcing Steam Link's centered fallback gaze valid;
- adding `XR_ANDROID_eye_tracking` as a resolution bridge.

The 2026-08-26/27 captures show the existing `XR_EXT_eye_gaze_interaction` action active, successful gaze-space locations, and valid pose flags throughout low, high, and low-again intervals. These patches no longer test a plausible resolution gate.

## Evidence boundary

The saved captures remain under `C:\Users\Angelo\Documents\GalaxyXR-Diagnostics\SteamLink-Resolution-AB`. Typed marker delays reflect the time needed to lower the palm and answer; they do not show a delayed resolution transition.
