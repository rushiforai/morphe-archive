# Semantic / ASR / pause revision (2026-09-14)

## Evidence and scope

The user supplied presentation-r5 diagnostics showing an incomplete response (last=15, ends=13), exhausted three-failure allowance, short display gaps, and repeated seek cancellation. Those establish one rejected-translation absence; source gaps do not establish missing speech. No paid API calls or phone verification were performed in this revision.

## Implementation

- Same-language, unique four-atom matches use English ASR native offsets directly when at least eight atoms and 70% coverage match. Provider text is retained. Unmatched interior ranges interpolate only between neighboring matched source anchors; all generated intervals are validated. Ambiguous, sparse, estimated-ASR, non-monotonic and unrelated tracks retain the prior robust global calibration/original-timing fallback. Other-language sources are not force-matched to English.
- Display uses confirmed player positions, never wall-clock extrapolation or a positive lead. This prevents local ticks from crossing a subtitle boundary while paused. It deliberately trades sub-callback smoothness for authoritative timing; callback latency and host behavior require phone testing. Rate estimation is still available for scheduling.
- Transport windows are capped at 48 atoms / 12 seconds; individual subtitle readability remains separate. Continuous source text, semantic translation instructions and up to 160 characters of context on either side support translation. Compact timing arrays remove repeated numeric IDs.
- Retry errors identify the uncovered range; coverage validation remains strict. Exhausted units display explicitly labelled original-language cue fragments only during their source intervals. They are not accepted or cached as translations. Silence remains blank; no guessed translated content and no extra retry allowance.
- Cache identity includes the new protocol and actual atom timing, preventing reuse of differently aligned display plans.

## Cost assessment

No second translation, segmentation or polishing pass was added. Three-failure policy, output cap and background scheduler remain. Larger transport windows can amortize repeated prompt/context overhead; compact times reduce payload, while source_text and longer context add input. Net token savings and translation quality have NOT been measured against a paid provider and are not guaranteed. Supplied audit excludes billed-but-unread cancelled requests. The default confirmed-position display change is not a claim that all cancellation causes are fixed.

## Release audit against official Morphe sources

Independently read MorpheApp/morphe-patches-template main .releaserc and release.yml, plus MorpheApp/morphe-manager main RemotePatchBundle.kt, MorpheAsset.kt and docs/patch-sources.md on 2026-09-14.

The existing repository now follows the template's semantic-release -> Morphe changelog -> Gradle version/build -> generated metadata commit/tag -> GitHub MPP -> main-to-dev backmerge structure. The local stale main/dev branches and recovery branches are NOT release inputs; this work starts from fetched origin/main v1.0.6. No force push, manual version bump, tag replacement or release-asset overwrite.

Project-specific gates exceed the base template: metadata rejection tests, timezone-free LocalDateTime normalization, JVM tests before publication, MPP checks, anonymous source-chain verification and provenance attestation. Publishing only main is an intentional stable-only workflow, not evidence of phone acceptance; dev receives the same stable manifest by template backmerge.

Manager requires created_at, download_url, description and version; signature/page URL are optional. A release alone is insufficient: both channel manifests, patch list, changelog, referenced MPP identity and anonymous access must agree. A remote source can update; a local-file import cannot automatically update. Actual phone update reception is not observable here.
