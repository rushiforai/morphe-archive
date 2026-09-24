# Segmentation and viewport revision r7 — 2026-09-14

## Evidence
Five user screenshots were inspected: a standalone 到底, a short coherent statement, a short cause clause, a stacked question/second-point explanation, and the quoted three-to-four-times claim. Two additional screenshots show the Activity-root caption overlapping comments in portrait and landscape. The supplied r6 diagnostic reports estimated source timing (native=0), so screenshot boundaries cannot establish word-accurate audio alignment. The linked short's public player metadata exposes English ASR; no audio/video speaker or shot annotation was available to this implementation.

## Research and editorial rule
Read the following original published guidelines, not repost summaries:
- BBC Subtitle Guidelines: https://www.bbc.co.uk/accessibility/forproducts/guides/subtitles/
- Netflix General Requirements: https://partnerhelp.netflixstudios.com/hc/en-us/articles/215758617-Timed-Text-Style-Guide-General-Requirements
- Netflix Subtitle Timing Guidelines: https://partnerhelp.netflixstudios.com/hc/en-us/articles/360051554394-Timed-Text-Style-Guide-Subtitle-Timing-Guidelines

BBC prioritizes coherent phrase/clause segmentation over geometry and treats reading time as editorial judgment, not merely word count. Netflix specifies event-duration and line-break guidance and shot/audio synchronization when those boundaries are known. These are reference principles, not a claim this live addon meets professional offline subtitle certification.

The adapted hierarchy applies to every model event: preserve meaningful phrase groups; prefer one coherent clause/short sentence; combine clauses only when length, duration and pause allow it. Long dependent clauses may occupy their own event, rather than forcing an entire complex sentence into one subtitle. Chinese 32 characters / other languages 84 remain advisory event-width targets. Multi-clause overflow beyond 42/100 characters or 7 seconds is diagnosed but never rejected solely for presentation. Tiny dependent phrases such as 到底 are locally joined to following speech only within bounded timing/width and pause conditions. This is a limited multilingual phrase list, not full language understanding. Source timestamps are never divided by translated-text length.

## Cost is a hard requirement
- No additional API pass for segmentation, polishing, diarization or scene analysis.
- No presentation-only retry: a complete translation remains usable and is audited locally.
- Existing structural/translation failure limits are unchanged.
- At most eight sparse pause entries per window, each derived from existing source intervals.
- Context, output cap and transport-window limits unchanged from r6.
- Viewport tracking and local joins cost zero translation tokens.
- The revised prompt adds bounded input text; no paid-provider token/quality benchmark was run, so net savings are not asserted.
- Cache protocol changes once; old plans may need translation again. Existing differently-versioned caches are not silently presented as new plans.

## Viewport
Within named verified player containers, prefer SurfaceView/TextureView visible bounds over a large controls overlay. Re-check on pre-draw (at most every 80ms) as well as existing refresh, because transform animations need not trigger outer layout changes. Do not scan unrelated comment/media previews outside player subtrees. Detach observers with the host, respect transition quarantine and hide stale captions if geometry is unavailable. Unsupported rendering structures retain the previous named-player fallback; device verification is required, including comments open/close for both orientations.

## Speaker / shot limitations
Existing explicit speaker-marker boundaries are retained and local merge will not absorb an explicit next speaker. Do not equate every ASR event or pause with a speaker/shot change. Automatic diarization and scene-cut detection are intentionally not implemented; they need additional evidence and would conflict with the requested cost constraint. No claim of frame-by-frame inspection of the linked short.

## Verification
83 local JVM/Android-framework tests passed, including exact viewport bounds before/after a simulated resize/move, exclusion of unrelated surfaces, phrase joins, silence/speaker guards and no paid-retry rejection for presentation overflow. MPP build passed. These tests are not actual YouTube/OEM phone acceptance. Release uses existing semantic-release and Morphe changelog/build/manifest/attestation flow, with fresh post-publish anonymous verification of main and dev.
