# Device report response: dual-mode-r2

## Evidence and priority

The supplied device trace has 42 attempts, zero 2xx, 41 other 4xx, and three failed attempts per displayed window. It proves no translations were produced, not a font/position problem. The trace redacts the provider message, so the exact server-side rejection reason is not proven. Code review found that JSON-object mode was requested without an explicit JSON word in the prompt and model-name-based vendor thinking flags were sent to arbitrary compatible endpoints. Both request compatibility issues are corrected.

## Fixes

1. Explicit JSON prompt, conservative endpoint-scoped optional parameters, one bounded negotiation, then configuration-level rejection circuit. No generic 400 batch-isolation storm. Fatal errors stay visible through display ticks. Test API uses the real production parser/protocol; local MockWebServer tests exercise successful HTTP-to-clock-display and repeated-400 rejection without any real key or paid API calls.
2. Correct branch-label preservation at return/read hooks. Shared translation metadata is cloned in its owner constructor and at field consumers, with exact root/entry schema checks; only a new Simplified language entry is prepended. Traditional and unknown metadata stay intact. Generated helper DEX must be audited after patching, not merely the patch source.
3. No default-language preference. Per-process state remembers enabled, language, source/translated mode, and source ASR preference. The native model-ready branch resolves fresh tracks and chooses the native On/Off event, following the architecture of the user's HansFix subtitle-memory project. No cross-video track objects or signed URLs are stored in memory.
4. Caption-bubble/line icon with an AI sparkle.
5. Isolated password-edit dialog with explicit Paste from clipboard and encrypted Save, no parent preference long-press gesture collision.

## Critical mode boundary

Original/manual/auto-generated source tracks are not translated. They are parsed and displayed verbatim at original cue timestamps, with no calibration probe or translation API request. Only entries selected inside Auto-translate use the model and optional English ASR clock calibration. Source-only and terminal states are blocked at both scheduler and request entry. Stale translated requests cannot revive an explicit Off or source-only selection.

## Review improvements

Rendering no longer decrypts the API key to read font/background style on every frame. Diagnostics identify the current engine and mode instead of labeling it Semantic Ledger. The patch-list generator selects the exact Gradle version file rather than the first old build found on disk. Obsolete default-language settings UI and class are removed, while existing encrypted credentials are retained.

## Honest acceptance scope

Automated HTTP tests use a local mock, not the user's provider or real credentials. Static combined-APK checks prove hooks and branch entries exist; they cannot certify ART behavior, visual clipboard interaction, the two device menu variants, or speech quality. Those require a fresh on-phone check of the released version. No API key is requested or published in the repository.

Final recovery review: a successful Test API restarts an existing stopped session; a new video lacking the remembered source language returns no selected track instead of silently choosing another language. Automatic prefetch is not permission to call the paid API on cold start or after Off.
