# Surface actual-video low-resolution assessment — 2026-09-11

User observation: Android Surface actual video (experimental) produces low-resolution output. Treat this experiment as failing the user's resolution goal. Exact installed APK/build/precision and runtime trace remain unidentified; no on-device commands were run.

## Application verification

Fresh verification of the local MPP: SHA-256 ef8a556ddb751b486d0cf4501d97ca72a6b4481497e86b3a7211fa20c26fa56e, matching the prior package record. All 4 packaged native variants match current resource bytes. All 8 saved reconstructed fixture output APKs contain the expected base/precision helper and implicit OpenXR layer manifest. Machine-readable evidence: ../../build/surface-video-verification/resolution-recheck-20260911.json. These checks do not verify the user's installed APK or prove layer activation.

## Source findings

- extensions/resolution-trace-layer/src/android_surface_video_layer.cpp:203,212,246 copies source width/height into Surface creation, buffer geometry and viewport. No intentional downscale found. The code checks format/dataspace but does not query actual EGL buffer dimensions after creation.
- extensions/resolution-trace-layer/src/surface_video_frame.h:23,34 preserves original projection layers, crop rectangles, poses, FOV and flags. It replaces swapchain handles/array indices, retaining 2 or 3 projection layers.
- extensions/resolution-trace-layer/src/android_surface_trigger_passthrough_layer.cpp:568-571 instead appends the known terminal quad and increases layer count. Surface-backed projection submission is not the same layer topology as this resolution workaround.
- patches/src/main/kotlin/app/template/patches/steamlink/androidxr/SurfaceVideoPatch.kt:121 rejects combining actual-video with the high-resolution trigger. OptionalXrPatches.kt:219-244 also removes SYSTEM_ALERT_WINDOW in this mode. Thus the experiment does not preserve either established workaround.
- android_surface_video_layer.cpp:370,377 silently passes unsupported/unready frames through. Transfer failure and runtime Surface-frame rejection disable replacement for the session. This can produce original-path output even when the helper is correctly packaged.
- surface_created reports only format; video_buffer_queued and surface_video_frame report the first 3 successes. These establish activity/submission, not actual image resolution. Existing host tests verify structure and ownership, not compositor quality.

Conclusion: correct installation can coexist with the user's low-resolution result. The assumption that actual-video Surfaces would reproduce the terminal quad's compositor effect is unverified and the observed result does not support it. Missing trigger topology is a plausible explanation; fallback, producer sizing and compositor scaling remain alternatives until runtime evidence distinguishes them.

## GXR kernel comparison

Read-only source root: D:/Angelo/Desktop/GXR/kernel-audit.

- vendor/qcom/opensource/display-drivers/msm/sde/sde_plane.c:2550-2589 validates requested scaling and returns EINVAL/E2BIG for unsupported parameters. No silent application-specific resolution fallback identified there.
- msm/samsung/XR2_SONY_ECX344A/XR2_SONY_ECX344A.dtsi:294-298 describes topology and 1776x3840 interface timing. msm/dsi/dsi_display.c:7559-7566 expands timing across sublinks/controllers; 1776 is not an application resolution ceiling.
- msm/samsung/XR2_BOE_VX135KDP/XR2_BOE_VX135KDP.dtsi:252,351,450 contains multiple physical modes. Definitions do not establish the fitted panel or active mode of the user's current session.
- No Steam Link/OpenXR Surface resolution policy found in inspected extracted display code. Proprietary Android XR runtime composition decisions are outside this kernel source.
- Historical diagnostics/steamlink-colour/Panel-Check-20260906/surfaceflinger-local.txt:2101-2104,2115-2118 show a 7104x3840 allocation but source regions spanning 6177x3339, enlarged to physical output. Allocation size alone is not proof of full-resolution rendering. This historical capture is not the user's current failed run.

No kernel modification is justified by these findings. Surface path behaviour must be measured at the app/runtime boundary first.

## Remaining checks and correction direction

Identify the exact tested APK, verify version/build, selected helper hash, implicit-layer manifest, resolution metadata and conflicting helpers. From an authorized running session, inspect GXRSurfaceVideo activation/fallback messages, original and actual EGL/ANativeWindow dimensions, submitted crops, and compositor source/destination rectangles.

A potential future revision could retain actual-video transfer while deliberately preserving the terminal trigger, but merely bypassing the patch conflict is insufficient: the current helper requires an exact projection-only layer count, and layer ordering/ownership must be designed and tested together. This is an application-side experiment, not a demonstrated fix or a kernel requirement. No patch implementation was changed in this audit.
