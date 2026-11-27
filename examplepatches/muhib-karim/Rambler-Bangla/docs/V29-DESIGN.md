# V29 Design v2: Foolproof Multilingual Dictation + Bangla Spelling Normalization

Status: v2, incorporates both external design reviews (A: language-design critique, B: engineering critique) as binding inputs. Build approved by the maintainer, 2026-09-23.
Grounding: JVM rig reproducing shipped v28d bytes (sha-verified), prod APK smali trace, the maintainer's verbatim field outputs 2026-09-23.
v1 superseded; changes from v1 are marked [REVIEW] and mapped to the originating critique in section 8.

## 1. Confirmed wrong-lock mechanism (unchanged from v1, rig-proven)

- k3 (English layout) cannot convert: byte-identical passthrough on the maintainer's exact sentence. Hook fires only on k2 + voice flag; layout read live from the system InputMethod subtype per call (no stale-layout path).
- Neither field sentence locks on the rig as a clean full utterance; v28d rules behave as designed on clean ASR text.
- Firing mechanism: accent-garbled ASR emission (hwen, rigarding, profeshional, autputted, ting). Dictionary misses classify as strong Bangla; 3+ strong in a chain fires the v28d weight rule; the locked segment converts every trapped English word (the->থে, whole->ওহলে). Rig reproduction: "rigarding the rambler bangla project is it in the profeshional github repo" -> "ঋগারদিং থে রাম্বলের বাংলা project is it in the প্রফেশিওনাল গিথুব রেপো"; "outputted" -> ঔতপুত্তেদ (the maintainer's exact field spelling); ড়াম্বলের implies a "drambler"-class emission.
- Intermittency = per-utterance ASR garble density. Clean emission: zero strong tokens, stays English.

## 2. Architecture (minimum-safe set from engineering review B, adopted in full)

Single choke point: the host voice-result hook replaces result text via GboardRamblerScriptFix.process(String, Locale). ALL conversion flows through process/processInternal; there is no second converter path. (Shipped-prod call sites: kcm.smali:8802/8806; the vrh.h / processVoice naming dates from the design-phase build - obfuscated class names differ per build.) V29 components, in call order:

1. VoiceSessionContext - holds the session pin (AUTO/BN/EN), session nonce, lifecycle state. Deterministic destruction (section 4).
2. LocaleRouter - reads the pin ONLY. Never infers a route from first token, script, subtype, or lexical score. Weak/missing/conflicting session metadata = AUTO = v28d byte-identical behavior. [REVIEW]
3. ProtectedSpan pass - identifies protected spans on the ORIGINAL text FIRST: names/capitalized tokens, @handles, emails, URLs, hashtags, code/version strings, ALLCAPS, numbers/dates/phones/times, punctuation offsets. Originals are retained and never rewritten.
4. EvidenceNormalizer - builds NON-DESTRUCTIVE normalized evidence (scoring-only) after the ASR result is delivered, before classify/locks. Original text is never mutated for classification. [REVIEW]
5. SegmentLock (v28d, byte-untouched verdict logic) - classifies on original tokens + scoring-only evidence. Dictionary hits NEVER seed a Bangla lock; a Tier-1 mapping is never a strong anchor. [REVIEW]
6. Renderer - conservative; emits canonical spellings only where section 5 permits; otherwise preserves original surface bytes exactly.

## 3. Lane semantics (explicit pin first; AUTO = v28d + A2)

- EN pin: PURE PASSTHROUGH. Returns the original string before any lookup, classification, or conversion - Tier-1 lookup explicitly suppressed. "A pin means do not touch my text." [REVIEW]
- BN pin: k1-style convert-all PLUS the pre-existing guards: URL/email/@handle/code/number/time spans stay exact. [REVIEW]
- AUTO (default, and the fallback for any weak/missing/conflicting metadata): v28d rules + A2 demotion (section 6). Byte-identical to v28d except the named A2 fixtures. [REVIEW]
- Mixed-segment precedence: real Bangla strong tokens outweigh demoted garbles; a demoted token never blocks a lock that real Bangla strong evidence justifies, and never builds one. [REVIEW]

## 4. Pin lifecycle (session-local, no persistence) [REVIEW]

- Scope: one mic session + the active InputConnection.
- Set: explicit user action in the extension settings surface.
- Reset on: mic stop/cancel/error; InputConnection, editor, or package change; subtype/layout change; IME restart; process death; short inactivity timeout. NEVER changes mid-dictation.
- No durable persistence: nothing written to prefs/disk; process death = AUTO.
- Kill gate: if any cross-field or cross-app pin leak is observed in testing, the pin feature is pulled from the build.

## 5. Fix package B: Bangla spelling normalization (headline feature)

- Tier-1a: canonical roman->script lookup (2,265 pairs shipped: 2,247 Avro-derived + 18 maintainer-corpus additions + 19 maintainer-corpus value overrides on conflict, MPL 2.0; composition and total byte-verified against the shipped build 2026-09-23) consulted BEFORE the converter, ONLY in normalization lanes (BN pin or BN-locked AUTO segment), ONLY outside protected spans, ONLY on Latin tokens, NEVER on Bangla script. Measured on the shipped jar: 17.1% -> 82.9% byte-exact on covered alpha keys.
- Tier-1b: cmudict-derived (BSD) English loan spellings for uncovered high-frequency loans (732 uncovered top-1k words identified). Each shipped mapping carries provenance (source + derivation) and a regression fixture. [REVIEW]
- Tier-2: fallback chain seed -> Avro parse -> engine converter + permissive wordlist validation (native roundtrip union 44.9% baseline).
- Corpus: spelling-corpus-v1.tsv (52 entries) grows toward ~500 with government standard-spelling derivations. Every shipped pair byte-checked on the rig. No runtime model judgment.

## 6. Fix package A2: garble demotion (bounded, scoring-only) [REVIEW]

- Rule: an original-text token that misses all dictionaries is tested as an English near-miss: BOUNDED edit-distance-1 against the English set, restricted to ASCII alpha tokens length >= 5, with conservative morphology constraints (same first char, same last char, candidate set bucketed by length +/-1) plus an explicit allowlist seeded from the observed field garbles (hwen, rigarding, profeshional, autputted, ting, drambler-class). Phonetic-index candidate DROPPED per review - edit-distance-1 only. [REVIEW]
- Effect: near-miss tokens are demoted from strong-Bangla to NEUTRAL for SCORING ONLY; the original token text is untouched and emitted as-is unless the segment locks for real Bangla reasons.
- Gates (all falsifiable, measured per corpus, not in aggregate): [REVIEW]
  * ZERO false demotions on EVERY protected corpus individually (Bangla strong-word corpus, 1,500 natives, func-word set).
  * ZERO segment-lock DECISION changes on the v28d regression corpus (19-line field corpus + 14 adversarial + punctuation-less suite) except named fixtures listed in the test file. Decisions measured, not token labels.
  * Per-token collision list published with the build report (every English word whose ED1 neighborhood overlaps a Bangla corpus token).
- Renderer note: demoted tokens keep original surface; canonical emission only per section 2 rule 6.

## 7. Budgets, observability, kill gates (measured, release ceiling) [REVIEW]

- Budgets (measured on the shipped APK, not arbitrary): <= 1 MiB compressed APK delta vs v28d; <= 4 MiB additional RSS; <= 5 ms p95 lookup latency on-device (proxy-measured on rig + CI smoke). If any budget fails, the feature shrinks (Tier-1b defers first, then A2 allowlist-only mode).
- Observability: counters and enums ONLY (lane chosen, demotions count, lookup hits count, pin resets by cause) + session nonce. NEVER raw dictated text, URLs, handles, or audio. [REVIEW]
- Kill gates: no auto-route if locale metadata is unobservable or fallback nondeterministic (AUTO always = v28d); destructive dictionary use dies on any protected-span change or standalone lock seed; session pin dies on any cross-field/app leak; any regression-floor breach rolls the build back to v28d behavior.

## 8. HARD PRE-BUILD QUESTION - ANSWERED

Q: Confirm bypass/convert gates occur BEFORE Tier-1 lookup and every converter path, proven with byte-exact passthrough tests (punctuation, apostrophes, emoji, handles, URLs, mixed scripts, whitespace).

A: YES, by construction and by proof:
1. Single choke point: in the shipped prod dex the host voice handler (kcm.smali:8802/8806) calls GboardRamblerScriptFix.process(String, Locale) @4526 -> processInternal @4574 (gates: voice-k3, closed-typing, has-bengali @4739, dict-fail @4753) -> SegmentLock.process @4801; every voice text path converges there. processVoice @6259 exists as an internal wrapper but has no external callers in the prod dex; the vrh.h / kfo:814 / vxr:736 / vzz:318 names came from the design-phase build and those classes do not exist under those names in shipped prod. There is no alternate converter path to leak past the gate.
2. Gate order inside processInternal (V29.1 canonical; processVoice is an internal wrapper with no external callers in the shipped prod dex): (a) voice-k3: k3 layout returns the original string; (b) field-sensitivity gate (NEW in V29.1): a SENSITIVE or UNKNOWN field classification (password-class inputTypes, null/unreadable EditorInfo, field-key mismatch) returns the original string with a diag counter - fail closed; (c) gateOpen/closed-typing typing-locale gate; (d) pin-aware has-bengali gate @4739 (AUTO/EN pin: whole-string return on Bengali content; BN pin: token-scope degradation); (e) ensureDictionary/dict-fail; (f) SegmentLock.process: the session pin is snapshotted ONCE at processInternal entry and threaded through every later step (no re-read across a long-press toggle); EN pin returns the original string immediately - on EVERY layout, before ProtectedSpan, before Tier-1 lookup, before any conversion (v29 shipped a bug here: EN pin was not honored on layout k1; the rig locks it as bug-enpin-k1-* rows and this global gate fixes it); then ProtectedSpan pass (URLs/emails/handles/times/camelCase/ALLCAPS/digits), segment classify/lock (Tier-1 never seeds), Tier-1 lookup only inside the BN conversion path after the lane decision and after protected spans are cut, render.
3. Proof battery (new rig suite, v29-passthrough): under EN pin, byte-exact passthrough required for: punctuation-heavy text, apostrophes/contractions, emoji and emoji-mixed text, @handles, URLs, mixed Bengali+Latin script, leading/trailing/internal whitespace variants, numbers/dates/times, ALLCAPS, empty and single-char inputs. Same suite run under k3 AUTO. Any byte difference = build fails.
4. Parity proof: AUTO with absent/low/conflicting session metadata runs the full v28d regression corpus and must match v28d output byte-for-byte except the named A2 fixtures.

## 9. Amendment map (for the review record)

Source key: A = external language-design review; B = external engineering review.

| Amendment | Source | Landed in |
|---|---|---|
| Zero false demotions on ALL protected corpora, not aggregates | A | sec 6 gates |
| Zero lock-DECISION changes except named fixtures; decisions not labels | A | sec 6 gates, sec 8.4 |
| Per-token collision list published | A | sec 6 gates |
| A2 = bounded ED1, ASCII alpha, len>=5, morphology+first/last constraints, garble allowlist | A | sec 6 |
| Mixed-segment precedence: real Bangla strong outweighs demoted garbles | A | sec 3 |
| NO acoustic locale routing in V29 (experiment, zero behavior dependency) | A | v1 spike REMOVED; not in build |
| Pin lifecycle: session-local, reset events, never mid-dictation, no persistence | A + B | sec 4 |
| BN pin = k1 convert-all + URL/email/@handle/code/number/time guards | A | sec 3 |
| EN pin = pure passthrough, Tier-1 suppressed | A | sec 3, sec 8 |
| Tier-1 only in normalization lanes; names/handles/acronyms guarded first; provenance+fixture per mapping | A | sec 5 |
| Budgets measured: <=1 MiB delta, <=4 MiB RSS, <=5ms p95 | A | sec 7 |
| Counters/enums only, never raw text | A + B | sec 7 |
| Explicit mic-session routing; non-destructive normalization view; never infer route; weak metadata = v28d byte-identical | B | sec 2-3 |
| Protected spans on ORIGINAL first; normalized evidence scoring-only after ASR; originals retained | B | sec 2 |
| Canonical emission only unambiguous Latin rules, outside protected spans, only BN lane; never Bangla script; dictionary hit never seeds lock | B | sec 2, 5 |
| Component set (VoiceSessionContext/LocaleRouter/ProtectedSpan/EvidenceNormalizer/SegmentLock/Renderer + deterministic destruction) | B | sec 2 |
| Test matrices: Auto/BN/EN x locales x confidence; every lifecycle reset; garbles positive only where intended; mixed switches, one-token islands, two-word names, punctuationless, numbers/dates/times; differential fuzz; dictionary-shaped adversarial inserts; protected bytes/offsets exact | B | sec 8.3-4 + build battery |
| Kill gates (no auto-route if unobservable/nondeterministic; kill destructive dict on protected change/lock seed; kill pin on leak; rollback on floor regression) | B | sec 4, 7 |
| Hard question: gates before Tier-1 + all converter paths, byte-exact passthrough proof | A | sec 8 |

## 10. Build discipline (unchanged)

Smallest patch on the v28d surface; v28d verdict logic byte-untouched; v27.11 baseline preserved. Full battery on the DEX-derived jar, CI smoke on the exact shipped bytes, signed prod+staging pair, SHA-256 + GoFile + provenance amendment. Release and visibility decisions stay with the maintainer after the field test pass.
