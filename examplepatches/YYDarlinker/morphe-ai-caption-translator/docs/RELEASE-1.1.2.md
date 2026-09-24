# 1.1.2 refinement and verification

## Evidence and limits

The supplied 1.1.1 diagnostics show consecutive units exhausting the existing three-failure budget with `protocol_format`, followed by explicit original-text fallback. They do not contain the original rejected API responses; the precise format defect in that session cannot be reconstructed. HTTP success does not imply a valid translation payload. The second report also includes a presentation-length warning and unnecessary spaces adjacent to Chinese punctuation/closing quotes.

The reports lack startup stage timings and an audio/source-caption recording. Display-selection timestamps alone cannot establish semantic audio synchronization. Short `display_plan_gap` intervals are retained when present in source timing; this revision does not erase silence or globally shift captions.

The local runtime snapshot was compared with GitHub's published 1.1.1 source (`133efcf1a898bd5ef55893df85a4c4cc0096f94d`). Runtime sources matched. An additional local opt-in video-fixture exporter was not part of the published repository and is not required for this change.

## Narrow changes

- **Startup:** first translation targets only the demanded unit. Existing before/after read-only context construction and its bounds remain; normal batching resumes after first-ready. No streaming or second translation/slicing core is introduced. ASR reference acquisition remains ahead of translation: precise timing is not sacrificed for an earlier first frame. Provider latency is not eliminated or measured by local tests.
- **Protocol:** a malformed/unassignable response row no longer discards valid siblings. Missing targets still retry, duplicate IDs still invalidate the affected target, and source coverage/quality/monotonic-time checks remain. Complete JSON code fences accept CRLF and an optional BOM; truncated data and surrounding prose are not salvaged. Distinct safe categories identify JSON/envelope errors. The existing bounded whole-unit recovery is available for format failures without increasing the three-failure cap. Whole-unit recovery uses the source unit interval and can have coarser presentation than a valid phrase plan; persistent failure still visibly falls back rather than inventing a translation.
- **Numeric phrases:** network strings such as `"200"` are verified as source text, not misread as an endpoint index. Legacy numeric cache representation remains supported separately.
- **ASR precision:** existing unique, monotonic four-word anchors can extend by up to three immediately adjacent, identical words on either side. No searching past a mismatch, reusing reference words, or target-language duration allocation. Native precision, displacement, monotonicity and minimum-anchor checks remain. Unmatched text is still explicitly estimated; this is not universal exact alignment or real-device acceptance.
- **Presentation:** remove width-independent forced line breaks. The actual TextView width and configured font determine whether one line fits; necessary multiline text uses balanced wrapping and no hyphenation. The existing two-line font-fit guard remains, with matching measurement break strategy. Remove unnecessary spaces around CJK punctuation/closing quotes. The prompt only adds a soft preference for one line; existing sense-group, timing, meaning, terms, numbers and context constraints remain. No local resegmentation, translation shortening, timestamp shifting, or enlarged retry budget.
- **Style preview:** one live preview, tap or keyboard-activate to switch landscape/portrait. A stable-height stage centers the portrait frame without moving the sliders. Both orientations share the same current font-size/opacity values, and accessibility text updates with orientation.
- **Diagnostics/cache:** a bounded 3,000-character decision history retains clock/protocol evidence separately from noisy display events and is cleared by the existing clear action. No raw API response or key collection is added. Derived translation-plan identity changes to `source-phrase-112`; source-caption caching is preserved.

## Validation

- 126 JVM/Robolectric/MockWebServer tests: zero failures, errors or skips.
- 10 release-contract rejection tests: passed.
- Android extension and `:patches:buildAndroid`: passed.
- Local bundle validation: valid ZIP, root DEX, raw extension DEX/length, repository identity and version checks passed.
- Existing release workflow, `.releaserc`, release scripts, branch policy and asset publication path are unchanged. Version/tag/manifest/release assets are produced only by the existing Morphe semantic-release workflow on push to `main`, including automated `dev` backmerge and anonymous Manager-source verification.

The local build retains the checkout's pre-release version until semantic-release prepares the next version; it is not a separately published asset. No paid translation-provider call, emulator playback, real-phone APK installation, visual screenshot acceptance or audio synchronization acceptance was performed. No device was connected. Framework tests validate preview structure, click state, geometry and style retention, not device typography.

## Focused phone acceptance

After refreshing the existing Morphe repository source and building with the official Captions patch plus this addon:

1. Clear diagnostics, open a fresh video and observe first translated caption readiness.
2. Replay the previously failing interval. If fallback remains, retain the new independent protocol-decision section.
3. Compare with the same video's English auto-generated captions, including seeks and player-orientation changes. Check reported native versus estimated timing coverage.
4. Check ordinary one-line captions, necessary two-line captions, final quotes and long technical names at the user's actual font size.
5. Tap the style-preview frame in both directions and change size/opacity in each state.

A successful automated release certifies the build/source contract, not these phone outcomes.
