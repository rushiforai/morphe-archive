# Readability / source timing / input revision

## Evidence

The user's trace reports native=0 / estimated=2816 for an English ASR source. It also shows a transport window ending with GPT 5 and the next window beginning with 6 Soul. These are evidence of missing word offsets and a damaged version/name boundary, not proof of a universal fixed audio delay.

## Experience changes

Translation mode prefers JSON3 for the same source track. Non-format query bytes and signed format constraints are preserved. There is only one original-format fallback; source-only display is unchanged. A missing first tOffsetMs means native zero only when following explicit offsets exist. Timing remains estimated if the server supplies no offsets; no fixed early/late shift is invented.

Readability is a merge-only plan computed before display. Fragments below 900ms, or short text below 1400ms, can join an adjacent segment. Union duration is capped at 12s, text width at 130 weighted units and gap at 250ms; no merge over silence or missing/non-speech content. Source endpoints are retained, and no translated-text-length time redistribution is used. Neighboring ready windows can merge a brief boundary only when both display plans have not yet rendered; already-shown plans never change. This does not guarantee every isolated flash can safely merge.

Model/version compounds are protected before transport windows are selected. Decimal dots stay inside numeric tokens, and known model names are kept as a single source span. The user-confirmed GPT 5.6 Soul/Sol confusion is corrected only within that exact model identifier, not for ordinary soul. Up to eight distinct protected names per window are supplied to the existing model request; no additional model correction call is introduced. Retry, output-budget and lookahead limits remain.

## UI and privacy

API URL/key/model remain inline. The field long press starts Android's floating ActionMode and delegates Paste to onTextContextMenuItem. Key input has no password variation, avoiding the usual OEM secure-keyboard selection. Key content is visible while editing; saved keys are not loaded back into the editor, and successful edits clear on focus loss. At-rest encryption remains unchanged. NO_PERSONALIZED_LEARNING is a hint to the IME, not an OS-wide guarantee.

Typography and padding are aligned; model controls are compact. The preview now has 20dp side insets, rounded clipping and a short helper label, rather than full-bleed content.

## Verification boundary

Tests include local timing/merge/name/format invariants, HTTP protocol tests, and Android SDK 28 framework simulation of held-touch -> floating Paste -> actual inserted text, plus preview geometry/live updates. No real phone, vendor keyboard, paid model or audio reference was used. Physical speech alignment and final aesthetics require device confirmation. Test frameworks are excluded from the production extension DEX.
