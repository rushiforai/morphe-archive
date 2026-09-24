# Caption takeover, startup and two-line recovery (1.2.4)

## Evidence and scope

Baseline: `b63956a` (1.2.3). The reported Shorts trace contains saved enabled state but no new core/source/translation startup. That trace alone cannot identify its exact missing callback. The reproduced code paths below are concrete contributors, not a claim that every device blank-caption case has been reproduced.

The supplied long-video trace has 9,296 ms from CORE_STARTED to FIRST_AI_READY: approximately 1,317 ms to SOURCE_OK, 4,493 ms of reference acquisition/comparison, 892 ms of remaining preprocessing, and 2,594 ms from the initial translation request through a protocol retry. The reported 823 ms was only the successful final request, not total startup. A recovered event held 97 characters for 11,860 ms.

## Changes

- **Foreground ownership:** a TimedText request for a known different video cannot replace the visible Shorts session. The URL hook leaves the background request native; the core checks ownership under the session-creation lock, including a swipe while activation is waiting for that lock. This is video ownership, not URL-based request deduplication.
- **Immediate engine takeover:** initialize the AI/source overlay from the selected same-video descriptor before attempting native refresh. Store a bounded (six-video), in-memory descriptor while keeping managers/tracks weak. A collected manager/track, missing native origin, or empty model does not require another native fetch to start AI. Prefer the fresh matching track URL over a captured URL whose signature may have rotated. Publish available native ASR references before starting the source worker. A surviving contradictory model, another video, unknown foreground, and explicit CC Off still fail closed. Native refresh remains best-effort; no strong Activity/player references or signed-URL diagnostics are added.
- **Faster reference path:** reuse a matching native ASR cue clock without additionally retrieving the watch page solely to seek word offsets. Optional reference acquisition shares a 2,000 ms budget instead of 8,000 ms; primary source fetch and CPU calibration are separate and are not covered by that bound. Preserve original timing when no reliable reference is available. Reuse immutable source atomization through calibration and startup rather than rebuilding the whole transcript repeatedly. Tradeoff: a slow reference may be missed; source-cue estimates are not native word timestamps.
- **Two-line renderer:** call `setSingleLine(false)` before `setMaxLines(2)`; the opposite order resets Android's line limit. Native-graphics tests verify the limit and full paragraph fit. Exceptional overlong events are fitted below the preferred minimum rather than silently cropping the translation; `OVERLAY_READABILITY_DEGRADED` makes the readability compromise explicit. This is a last resort, NOT successful semantic segmentation.
- **Keep recovery segmented:** an already-budgeted retry for a window longer than 7 seconds no longer requests/accepts the whole-text fallback. It must return the existing source-phrase protocol. Short-window recovery remains. No local translated-character timestamp allocation or second AI segmentation/polishing pass is introduced. Providers can still violate editorial goals in otherwise valid segmented output; those events remain audited and use the explicit renderer fallback.
- **Useful diagnostics:** label the engine `source-phrase-124`; add `startup_total_ms` to first network-ready evidence, retain engine activation/switch events separately from display noise, and report whether a saved engine change has a live session and a known choice. Native refresh and descriptor-only startup have distinct results (`APPLIED` / `AI_STARTED`).

## Cost and quality boundaries

Normal target batch sizes, context bounds, retry caps, cache identity, and the 30-second background horizon are unchanged. No paid model was called during validation. A changed retry protocol can change acceptance/actual usage; equal or lower real-world tokens per minute is NOT established. Existing cached translations are retained, including overlong historical plans; these can still trigger small-font degradation. A longer watch-time sample is needed before comparing per-minute usage; 19 seconds of viewing includes startup/prefetch work.

Enabling the AI engine while an original track is selected continues to show that original track in the custom renderer, with zero translation API calls. Selecting an Auto-translate target is what authorizes translation. Global ON does not silently override explicit CC Off or invent a language choice for a video with no selection.

## Concrete acceptance targets (not claimed measurements)

| Goal | Proposed acceptance test | Current evidence / remaining limit |
| --- | --- | --- |
| Reliable takeover | 20 consecutive Shorts, both toggle directions, late prefetch, collected native references, CC Off, same/different languages; no foreign text or permanent blank ownership | Simulated lifecycle regressions; real-phone swipes still required |
| Fast visible response | Within 250 ms of a valid selection, show an existing caption or preparation state; cached-current caption within 500 ms | Direct startup path implemented; end-to-end device percentiles unmeasured |
| Fast first translation | Record total startup and stages; on a reference connection target cold-start p95 <= 5 s over at least 30 starts | Avoidable reference waits reduced; provider/source latency still external; target not certified |
| Faithful translation | Blindly review at least 200 events across conversational/technical material; no critical negation/name/number reversals, >=95% acceptable meaning | Exact source coverage validated; human semantic quality not measured |
| Good segmentation | Mostly complete sense groups, no orphan modifiers/connectors; >=90% one line in a representative fixed-font viewport sample, <=2 lines always | Two-line bound tested; one-line/editorial success rate not measured; degraded font events count as failures |
| Speech alignment | Use actual word anchors where present; evaluate median absolute offset <=250 ms and p95 <=500 ms only on native-word fixtures | Monotonic source clock validated; estimated cue timing cannot certify these thresholds |
| Low cost | Compare the same videos, model, cache state and >=5 min playback at equal quality; no new AI pass/unbounded retry | Architecture/caps preserved; provider billing and token/min impact unmeasured |

## Validation and release

The final local extension test run passed 195 tests (zero failures/errors/skips), including real source-only sessions with fixture transport, zero paid API calls, an atomic video-switch race, and native-graphics TextView tail retention. The initial foreign-Shorts and line-limit regressions both failed against the original implementation before the fix.

Run the full extension tests, localization and release-contract validators, build the Android MPP, combine with official Morphe default patches on original YouTube 21.07.247, audit generated DEX, and run the generated bridge/menu classes on emulator ART. Record exact outcomes in the delivered verification record; an emulator class probe is not a YouTube UI/playback test.

Publish only by a conventional `fix:` commit on main and the existing semantic-release/Morphe changelog workflow. Do not hand-edit release versions/tags/assets. Check anonymous main/dev manifests, listed patches and referenced public MPP after the workflow, and compare the published extension DEX to the locally tested candidate. The three independently selectable patch roots and existing compatibility constraints are unchanged.
