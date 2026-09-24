# Caption refinements (1.2.1)

## Player menu

The AI row joins the official Morphe group at its existing next-item insertion index, before the shared divider guard and the top-menu signal reset. Incoming branch labels are retained at the addon hook, including paths with no other enabled Morphe rows. The shared divider is therefore also emitted for a recognized Shorts menu containing only the AI row. Bottom-sheet drag-handle clearance remains on the first custom row only; the native list's redundant top padding/margin is removed without changing its child-row padding or bottom inset. Popup and dialog insertion indices continue to come from the official inflater.

A single click now toggles the saved AI setting directly and dismisses the menu on success. The secondary engine dialog is removed. Existing API-key checks, failure rollback, native-track reselection, caption-off behavior and independent caption memory remain unchanged. Unknown menus are not modified.

## Timing references in every language

The English-only gate has been removed from source classification, native ASR lookup, public player-response lookup and fallback candidate construction. Native reference storage is bounded by video and language; the public reference cache is keyed by video plus source language. Discovery prioritizes the source language, then considers other exposed ASR tracks. A candidate must match actual source text before being used. A different-language track is not aligned by position, duration or machine-translated text.

The priority is usable automatic-caption timing (native word/segment timestamps when exposed, otherwise ASR cue boundaries), then the existing source-caption cue clock and conservative within-cue estimates. Missing, denied or text-mismatched ASR falls back rather than fabricating precision. Lookup retains a bounded eight-second budget. This is not a promise that unavailable tracks or cross-language text can always be aligned.

Matching tokenization now handles unspaced Japanese/Chinese and other supported unspaced scripts without changing the translated text, semantic segmentation, prompts or display tokenization. Punctuation-only atoms cannot invalidate an otherwise complete alignment and remain estimated, borrowing only the adjacent same-cue offset.

## Simplified Chinese label

Simplified Chinese UI uses `中文（简体）`; Traditional Chinese UI uses `中文（簡體）`. Other locales continue to use Android-localized language names. Both shared language metadata and concrete native translation entries are corrected, including existing entries rather than only newly inserted ones. Locale-aware ordering and the relative order of other YouTube languages are retained.

## Scope and release

The three optional public patches and their dependencies remain unchanged. Publication uses the existing repository semantic-release workflow from a normal `fix:` commit on main, not a manual tag or release. Automated test fixtures and generated-APK structural validation do not constitute real-device menu or playback acceptance.
