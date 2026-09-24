# 1.1.3 — normal startup, fitted caption background, settings polish and ASR timing tiers

## User-directed scope

Builds on published 1.1.2 without replacing the anchored translation/segmentation architecture. The user preferred translation/segmentation quality over startup latency, reported an overly wide two-line background, requested a larger portrait style preview and native-looking settings, and asked that available English auto-generated captions remain the preferred timing reference even without word offsets.

## Behavior

- Startup uses the same normal realtime batch limit as later work, with the same prompt, context, source coverage and validation. The startup-only single-unit limit is removed; ordinary isolated error retries remain bounded as before. Derived plans use `source-phrase-113` to avoid silently reusing the previous startup/timing plan.
- `CaptionTextBackground` paints one rounded rectangle around the union of the actually laid-out lines plus the original padding. Its elevation outline uses the same bounds. It does not resize the TextView, trigger different line breaks, change font size, move source timestamps or change the player anchor.
- The single orientation preview is larger in portrait. It reserves a moderate stage in landscape and grows by at most 64dp in portrait, reduced on short displays. The video itself retains 16:9 or 9:16 geometry; toggling retains the chosen style. Screen size, font scaling and host theme remain relevant.
- Settings use theme-derived primary/secondary text, consistent spacing, subtle stateful input surfaces, minimum 48dp input/button targets, native sliders/switches and clearer summaries. Native colors are inherited rather than hard-coding a YouTube accent. Diagnostics are collapsed by default, with explicit expand, refresh and copy controls. Existing preference keys, API-key storage, automatic saving and functional actions remain.

## Timing design

1. **Prefer a same-video English ASR address already in the native track list.** The existing structurally bound `nativeTracks`, language, VSS and URL accessors are reused. No new host hook is introduced. At most four validated URLs are retained in process memory; they are not logged or written as cache metadata.
2. **Otherwise inspect same-video public player metadata, then existing compatibility candidates**, under a bounded lookup budget. A valid reference is not rejected merely because it contains one cue or has no native word offsets. HTTP/empty-response/timeout reasons are reported without response bodies.
3. **Prefer exact native word timestamps where available.** Lexical correspondence must be monotonic and within the existing displacement guard. Complete identical tracks also support short utterances; unrelated/ambiguous partial repetitions cannot fabricate alignment.
4. **Use ASR cue timing when native word timing is absent.** Matched words take estimates bounded by the ASR source cues, preserving source text and sentence/cue duration constraints. These are explicitly labeled estimated, never counted as native. A selected English ASR track already supplies the base cue clock; a different equally coarse copy is not automatically substituted for it.
5. **When no trustworthy reference can be acquired/matched**, retain the selected source cue/rolling-update boundaries and silence. Internal estimates use bounded English spelling weights so a long technical name cannot dominate the entire cue duration. Native offsets are unchanged. This is a fallback heuristic, not measured speech or acoustic forced alignment.

`timing_precision` distinguishes native, mixed and cue-estimated timing in the same translation request, warning the model not to infer tiny pauses from estimated word times. No translated-text-length timing or global arbitrary delay is added. Existing robust median calibration remains a fallback when local matching fails and its pre-existing evidence thresholds hold.

Reference cache keys now separate reference fetches and hash the exact reference URL. This prevents a coarse app response from masking a differently signed/client-specific reference. Only hashes/body/content-type are stored; bounded size/age eviction remains. Primary source caching is retained.

### What the report actually showed

The supplied 1.1.2 trace included `native=0;estimated=898`, native reference acquisition failure, and provider-reference cases with `asrNative=0`. It therefore did not demonstrate native word-level calibration. It also contained translation-quality rejections. The original API responses and an audio-aligned recording were not supplied; this revision does not claim to have reconstructed them or established a precise acoustic delay.

## Verification

- 144 JVM/Robolectric/MockWebServer tests, including native Android graphics tests: zero failures, errors or skips in the final local run.
- Production loader exercised with an in-memory Cronet-shaped transport: native signed-track priority, public metadata fallback, single-cue/coarse ASR acceptance, preserved source text and correct native/estimated labels. No external provider call is involved in these tests.
- Bounds tests cover balanced two-line backgrounds, elevation outline, opacity, text/orientation changes and no-layout behavior. Native raster fixtures cover before/after caption backgrounds and light/dark settings in both preview orientations.
- These images are isolated Android view fixtures, not screenshots from the user's YouTube build. They do not prove host font/theme fidelity or real-device playback behavior.
- Android extension and MPP build, release-contract rejection tests and bundle identity/root DEX/extension validation are required before the unchanged Morphe semantic-release workflow publishes.

Network restrictions, expired/signature-gated URLs, missing tracks, insufficient lexical correspondence and inaccurate ASR itself can still prevent exact calibration. “ASR exists” is not a guarantee that the app can retrieve it. Such failures must be visible in diagnostics rather than silently claimed as calibrated. No phone/emulator playback or paid model-quality evaluation was performed.

## Publication contract

Use the existing main push → Morphe semantic-release → automated tag/manifest/MPP/release → dev backmerge → anonymous source verification path. No manual tags, releases, asset replacement, workflow changes or bypassed checks. Final publication evidence is recorded in the task's output report after CI completes.
