# Semantic caption quality — 1.3.4

## Evidence and baseline

Starts from public v1.3.3 (`4708c278c7b8c1ca7c37419cb4c3d3d33d0a6f38`), including
scheme B and the network/seek fixes. Files from rolled-back development in other work
folders are not this implementation. This is a semantic quality refinement, not another
native-caption ownership rewrite.

The two user traces describe Qwen3.8-Flash and DeepSeek-Flash, both with 14 HTTP 2xx
responses. Qwen retained a 60-character / 11,786 ms paragraph and a 445 ms dangling
phrase. DeepSeek also retained the 445 ms dangling phrase and a separate 891 ms negation
lead-in. The seven screenshots show both paragraph accumulation and cuts inside unfinished
noun phrases. Both traces report 0 native / 9,719 estimated word anchors. Raw model
responses and the full timed transcript were not available; regression fixtures reconstruct
failure **classes**, not the user's unavailable responses or audio.

Actual production did not call the historical cross-window readability helper. The
48-atom / 12-second transport windows also owned independent translation results, so
reading neighboring context could not remove that forced translation boundary. Presentation
warnings alone did not reject a paragraph, and the renderer fitted overflow below its
preferred minimum font. The former translation-quality check only detected extreme collapse,
not general meaning errors. A 2xx count therefore did not certify accepted, readable captions.

## Semantic ownership, batching and display

`SemanticTaskPlanner` creates immutable source-owned tasks before scheduling. These are
not visual subtitle lines. Complete short sentences stay batched; known sentence ends,
source gaps/speaker marks, and bounded clause evidence replace unconditional 12s/48-atom
cutting. A task can span an old window boundary (up to 24s / 96 atoms). The hard limit is a
resource guard, **not** a claim that every such boundary is grammatical: uncertain continuations
are labelled `bounded_continuation` and low confidence. Clause heuristics are medium confidence.

This is bounded source analysis, not an English parser or added ASR service. Unpunctuated,
very long or ambiguous speech remains a real limitation. The model sees continuation metadata
and bounded neighboring source context and is asked to understand the complete task first,
then return coherent source-aligned events. Complete sentences may occupy several screen events.

The controller schedules the new task IDs directly: no overlapping target ownership, no
second controller or speculative duplicate POST. Current lookahead remains 10s; both current
and background batches are bounded to the existing 30s span, background horizon remains 30s,
and API deadlines remain 10s current / 16s background. Several short sentences can share a task
and batch. Context normally stays within 160 characters per side, with a bounded extension to
320 only to preserve an available sentence boundary. This is not full-transcript context.

## One source-aligned wire protocol

The model is asked for objects:

```json
{"translations":[{"id":"task id","segments":[{"source":"verbatim contiguous source phrase","translation":"coherent translated sense group"}]}]}
```

Numeric end indices remain an internal cache representation, not an accepted online model
protocol. A legacy two-string source/translation pair can be normalized losslessly; guessed
endpoints, incomplete coverage and reordered source cannot. Format recovery no longer offers
an unaligned `text` response that can turn a task into a single paragraph.

Source matching preserves token boundaries, decimal points, numeric signs/ranges/fractions,
and percent symbols. Decorative punctuation/case/spacing and unambiguous thousands separators
remain tolerable. Model-name hyphens are not misclassified as negative numbers, while contractions retain meaningful
apostrophes. The old lexical fingerprint is explicitly isolated for source timing weights and
ASR reference identity: stricter online matching cannot silently change either. A frozen old-formula
regression includes contractions, decimal/range punctuation and model names. Numeric
substitution checking is deliberately narrow: a clear single Arabic-number substitution can
be rejected, but word-form numbers, unit conversions, scope/negation and semantic equivalence
are not certified by a regex. Existing name protection remains.

## Provider adaptation

For recognised Bailian hosts (including workspace-specific addresses) with Qwen3.8-Flash,
the request uses strict JSON Schema with named source/translation fields, disables thinking
as before and explicitly disables the novelty/repetition penalty. Temperature is **not**
guessed or globally lowered. Unknown gateways retain the portable request. Schema rejection
falls back once to ordinary JSON mode; successful negotiation is remembered by endpoint/model/key.
The existing total request deadline and one negotiation allowance are retained. Output cap stays
3,072 tokens; a rejected provider never silently removes it.

Official references checked for this change:
- Bailian structured output: https://help.aliyun.com/en/model-studio/qwen-structured-output
- Bailian parameter reference: https://help.aliyun.com/zh/model-studio/qwen-api-via-openai-chat-completions
- DeepSeek JSON mode: https://api-docs.deepseek.com/zh-cn/guides/json_mode/
- DeepSeek sampling advice: https://api-docs.deepseek.com/quick_start/parameter_settings/

Schema constrains shape, not truth or good segmentation. No live key/model experiment has
established universal provider improvement or the best temperature. The runtime records the
response model and effective optional settings for the next evidence-based comparison.

## Production quality and spending boundary

Fresh results and cache restoration share source alignment and final-plan checks. Safe dependent
fragment joins are actually invoked from the production parser; they use the union of real source
intervals, respect source silence and whole-sentence endings, and remain width/duration bounded.
No translated-character-ratio timestamp allocation or arbitrary post-translation splitter exists.

Soft length preferences stay advisory. Serious multi-clause paragraph overflow and a small set
of clear structural/numeric faults cannot become ordinary READY plans. Repair feedback preserves
the same task and source coverage; it never asks for a flattened paragraph. Quality repair allows
at most **one** automatic retry per task and **four** per playback session, within—not in addition
to—the existing three-failure automatic cap. These are request-count bounds, not a promise of a
particular billed currency amount. Existing request and output caps also bound each attempt.

During quality repair, available original source is explicitly labelled instead of a blank or an
already-rejected translation. If repair fails or the allowance is exhausted, that task uses labelled
original-source fallback; later tasks continue and the whole video is not terminated. Rewind does
not reset the session's quality allowance. Valid READY plans continue to be reused without paying again.

## Two readable lines, not an arbitrarily tiny paragraph

The renderer still measures the actual player bounds/font with Android layout. It no longer fits
an oversized translated event below the defined minimum font. If even two minimum-size lines cannot
fit, the renderer requests the current original-source phrase; if that cannot fit either, it shows a
short localized unavailable status. It does not crop a translated tail, invent time, or buy a
viewport-dependent second pass. An extremely narrow viewport can necessarily show only a status.

This is an honest degradation path, not a claim that every model output is now a good subtitle.
Mostly one line and coherent optional two-line events remain the goal; actual device/model samples
are required to measure their proportion. Estimated ASR timestamps remain estimated.

## Diagnostics and privacy

HTTP success and local unit acceptance/rejection are now separate counters. Severe-quality
rejections and bounded repairs have distinct events. Current display diagnostics use the actual
paired source phrase rather than always the start of the whole task. Debug mode also retains
source payload + model result + effective format/settings/prompt hash and response-model metadata.

This uses the existing **opt-in** display-text debugging switch (default off), local storage only,
at most six records / 36,000 characters, per-field limits, and 24-hour logical expiry. Old records
are removed on the next read/write; no background process runs when the app is closed. Turning off
debugging or clearing diagnostics removes them. Keys (including escaped forms), credential-like
strings and URLs are redacted; HTTP headers, cookies, base URLs and full HTTP envelopes are never
stored. The source/model text is still viewing content: export only when the user chooses to copy
diagnostics. This is not a lossless unlimited recording or remote telemetry service.

## Compatibility and cache

The derived-plan marker changes to `ai-semantic-objects-134`, and diagnostic revision to
`source-phrase-134`. Old plans cannot silently masquerade as new quality results. Raw-source cache,
profiles, encrypted keys, prompt customizations, settings, scheme B and caption-selection memory
are preserved. Original-language mode continues to call zero translation APIs. An upgrade may
require retranslating previously cached AI plans; this one-time cost is explicit.

## Verification and publication

The regression suite covers production parser/controller paths, retry/fallback lifecycle, source
ownership, cache/seek replay, schema negotiation, signed numbers/model names, privacy, viewport
minimum font and existing settings/native controls. A synthetic 100-case boundary corpus exercises
10 high-risk constructions at 10 old-boundary offsets; it is a coverage test, not 100 human-reviewed
real model translations. No disabled failing tests or changed release gates.

A non-publishing branch validation workflow runs the same unit tests, Android build, localization
and release-contract checks before main is touched. This was needed because the current Windows
sandbox's Java real-path permission checks prevented Gradle-generated class access. Local full APK
composition uses the existing unchanged Kotlin harness with the validated CI MPP and local original
YouTube 21.07.247 / official Morphe 1.43.0 bundles; the original APK is not uploaded anywhere.
Final counts/hashes, composition and DEX/settings audits belong in the final evidence report.

No paid provider calls, full original audio comparison, phone playback, or measured latency/token
savings were performed in this environment. Those must not be inferred from passing fixtures.
Publication remains the existing main push → semantic-release → generated tag/manifest/MPP/release
→ dev backmerge → anonymous source verification flow; no hand-made version tags or replaced assets.
