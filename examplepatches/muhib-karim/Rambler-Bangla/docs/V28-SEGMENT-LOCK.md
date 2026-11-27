# V28: segment-locked multilingual voice

## The defect

V27.11's multilingual (k2) voice path made a convert/keep decision **per word**.
Romanized Bangla function words that collide with entries in the English word
set (`ami`, `ta`, `ki`, `e`, `log`, ...) were kept Latin, while English words
missing from that set (`narrations`, `rambler`, `smoother`, `timestamps`) were
converted to Bangla script. Every mixed dictation came out scrambled in both
directions at once (the maintainer's 2026-09-22 diag log, 13 multilingual lines).

## Why segment-level

The design brief (research dated 2026-09-23) is blunt: no shipping keyboard
does per-word automatic language detection for dictation. Google locks per
utterance; Gboard's auto language detection does not support Bengali at all, so
Rambler's text-layer segmentation is the only route. Users switch at clause and
sentence boundaries far more than word by word (55% inter-sentential vs 20%
intra-sentential in the cited code-switching study). Segment-level locking is
both what the research supports and what the maintainer specified.

## Design

`GboardRamblerSegmentLock` replaces per-word decisions on the multilingual
voice path only. The k1 (full Bangla) and k3 (en-US) layouts and the entire
typing path run V27.11 code unchanged.

1. **Tokenize** like the engine, with guards first: URLs/emails (pre-marked
   spans), KEEP_TOKENS place names, and camelCase/ALL-CAPS words are always
   verbatim. Contractions (`it's`, `I'll`) are consumed as single tokens.
2. **Cut segments** at sentence punctuation and at discourse markers
   (`but`, `and`, `so`, `because`, `though`, `however`). Hyphens and
   apostrophes never cut.
3. **Classify each segment once.** Evidence:
   - strong Bangla: word converts via the engine's `convertToken` and is NOT
     in the English set (`ekhono`, `jabo`, `kichukhon`, ...);
   - Bangla function words that sit in the English set (`ami`, `ta`, `ki`,
     `er`, `to`, `na`, `se`, `je`): Bangla evidence, never English evidence;
   - inflected English missing from the base set (`narrated`, `timestamps`,
     `smoother`) is re-stemmed (`-ing/-ed/-es/-s/-ly/-er/-est`) and counts as
     English;
   - `bangla`/`bengali` are neutral (language names used in both languages).
4. **Hysteresis with Bangla weight**: a chain of 2+ strong/function words
   (one-word loan gaps allowed) locks the segment to Bangla only when it
   carries real Bangla weight: 3+ strong Bangla words in the chain, OR Bangla
   evidence at least matching English evidence in the segment, OR a
   Bangla-frame function word in the chain (ami/ta/ki/na/se/je; "to" and "er"
   are excluded because they are common in plain English prose). This kills
   two reverse-leak classes: function-word bridges into a lone loan ("The
   office is next to the bazar.") and adjacent 2-strong name/island pairs
   ("Rahim Uddin joined the call.", "He is my choto bhai."). A single strong
   word only converts when no English-set word appears anywhere in the
   utterance - sentence punctuation and lowercase discourse markers split
   segments, and a name isolated into its own one-word segment ("Rahim and
   Uddin will come to the office tomorrow.") would otherwise convert because
   the tiny segment alone contains no English. This is the brief's "a run of
   2+ words flips; a single weak word does not".
5. **Protected spans**: URLs, emails, @handles, and digit-suffixed am/pm times
   (3:30pm) are marked protected before any language decision: they render
   byte-identical everywhere and are transparent to chain evidence (a handle
   never anchors a Bangla lock).
6. **Zone split for boundary-less dictation**: when ASR delivers one long
   stretch with no punctuation, a real language switch shows up as a long
   English chain. If a segment contains both a >=4-word English chain and a
   >=3-word Bangla chain, it splits into zones at the chain starts and each
   zone is classified on its own. Shorter English chains remain embedded
   loans, and a 2-word Bangla island sandwiched in English ("We visited Kali
   Bari during the festival week.") stays Latin rather than being split out.
7. **Render**: Bangla segments convert every word token through the engine's
   own converters (`convertToken` / `convertTokenLoan`, including English
   loans, exactly as the k1 layout renders them); English segments pass through
   byte-identical. Diag counters and logging match V27.11's conventions.

## Test evidence

All runs on the ground-truth rig (patched smali -> dex -> JVM), which
reproduces V27.11 byte-for-byte on all 19 captured log lines before patching.

| Suite | Result |
|---|---|
| k1 full-Bangla layout, 4 log lines | 4/4 byte-identical to V27.11 |
| k3 en-US layout, 2 log lines | 2/2 byte-identical |
| k2 multilingual, 13 log lines | 12 fixed per spec, 1 already correct |
| Brief 9-case acceptance matrix | 9/9 pass |
| Adversarial suite, 14 cases | 14/14 pass |
| Reverse-leak battery, 39 cases | 39/39 pass |
| Hand stress battery, 85 cases | 85/85 pass |
| Seeded fuzz, 12 seeds x 60 mixes | 720/720 pass |

Adversarial highlights: 5-switch long dictation locks every segment correctly;
single ambiguous words alone (`ki`, `to`, `na`) stay Latin (hysteresis);
Bangla names in English sentences stay Latin; `API` and contractions survive;
punctuation-less "ami kal dhaka jabo then I will stay there for a week tarpor
abar cholbo" renders as Bangla / English / Bangla zones.

## Known limitations (inherited, not introduced)

- Loan spellings inside Bangla segments (`office` -> অফফিকে) come from the
  engine's existing converter, identical to the k1 layout's output for the
  same words.
- A single ambiguous function word alone stays Latin by design.
- Google's auto-detect path cannot be reused for Bengali (unsupported locale
  in Gboard's own implementation); classification here is lexical, not
  acoustic.

## Hysteresis anchor + weight rules (final)

A Bangla lock requires at least one engine-strong Bangla word in the chain.
Ambiguous function words (ami, ta, ki, er, to, na, se, je) extend and support
a chain but can never start a lock on their own: an English sentence that
merely contains "to"/"in"/"on" twice stays Latin. This was hardened after the
extended matrix caught "I want to go to the park." converting on the strength
of two "to" collisions.

On top of the anchor, the locking chain must carry real Bangla weight (rule 4
above). The weight rule was hardened after the reverse battery caught
"to the <loan>" chains and 2-strong name/island pairs converting inside
English sentences. Documented trade-off: "Office e giye dekhi server down."
(a Bangla verb pair next to English nouns with no frame word) now stays Latin
- at that density a verb pair is indistinguishable from a name pair, and when
in doubt the engine preserves.

## Typing path vs voice path (Hinglish parity contract)

Mirroring Gboard's observable Hinglish behavior for Bangla:
- Typing path: untouched Gboard candidate machinery - Latin phonetics yield
  ranked Bangla candidates in the suggestion strip, real English words stay
  Latin, and the user picks; nothing silently converts committed text. This
  matches the candidate-based, reversible contract.
- Voice path: final ASR text arrives with no candidates, so the segment lock
  is the text-layer equivalent of Google's code-mixed ASR handling: classify
  spans, preserve English spans, render Bangla spans, never repaint a whole
  utterance from one token.

## Deep-research cross-check (2026-09-23, post-V28 freeze)

An independent deep-research pass (Google Assistant/Gboard multilingual architecture, Indic LID literature, open-source landscape) was folded in after the V28 rig went green. Verdicts:

- **Keep in V28 (already shipped in the segment lock):** segment-level (not query-level) switching - Google's shipped Assistant uses query-level early-commit, which is the wrong template for intra-sentence Banglish; hysteresis via minimum-chain locking (the Bengali-English LID literature, arXiv 1803.03859, confirms word-level dictionaries fail on homographs like "choke"/"to" and that context windows are required - the 2+ chain rule is the cheap form of this); protected spans (URL/email/handle/code/version) preserved before any language decision; layout as final policy layer (English layout = preserve all, Bangla = render all, multilingual = preserve English spans / render Bangla spans).
- **Deferred to V29:** three-state [BN, EN, AMBIG] with a short rollback window (relabel last 1-3 tokens) replacing the current irreversible lock; mixed-morphology span splitting (meeting-e, office-ta, call-korbo: preserve English stem, render clitic in Bangla) - needs tokenizer surgery, explicitly excluded from V28 to avoid destabilizing a green rig; ranked transliteration candidates benchmarked against IndicXlit (MIT-licensed, borrowable); user correction memory scoped by layout.
- **Deferred to V30:** speech-aware routing from interim ASR hypotheses/timestamps (text-only restoration is the honest V28/V29 claim); compact joint segment model trained on real device dumps; opt-in de-identified corpus with speaker-held-out evaluation.
- **Licensing:** IndicLID + IndicXlit (AI4Bharat) are MIT - borrowable with attribution in V29+. Varnam/libindic/HeliBoard/OpenBoard are AGPL/GPL - architecture reference only, no code copying (see LICENSING-AUDIT.md).
- **Hardening matrix (section 6 of the research brief):** classes already covered by the V28 rig: rapid alternation, single-token islands, entities, homographs, protected spans, punctuation-less ASR, contractions, adversarial English/Bangla. Classes intentionally untested in V28 (need V29 tokenizer/model work): mixed morphology, roman-variation normalization, conjunct ranking, interim churn rollback, acoustic stress, long-session drift.


## Amendment: stress battery round 2 (2026-09-23)

After delivery of the anchor-fixed build, an order-of-magnitude larger battery
ran against the exact signed production bytes (hand cases + seeded fuzz,
invariant-oracle checked). Two real defects surfaced and were fixed:

1. **@handle conversion** - `@ramblerdev` converted to phonetic Bengali in all
   positions (the `@` is a segment boundary, isolating the handle into a
   one-word segment). Handles are now protected spans like URLs/emails.
2. **Isolated-entity conversion** - `Rahim and Uddin will come to the office
   tomorrow.` converted `Rahim` (discourse-marker boundary at `and` isolated
   it; the one-word segment trivially had no English). The single-strong-word
   rule now requires zero English-set evidence in the whole utterance, not just
   the segment: `Jai.` and `Ami jabo. Porbo.` still convert, names inside
   English sentences stay Latin. A follow-up fuzz pass also caught `3:30pm`
   losing its `pm` inside locked Bangla zones (the tokenizer splits the time;
   digits always survive but `pm` is not in the English set) - am/pm after a
   digit is now protected too.

Re-verified on the rebuilt, re-signed production bytes (dex2jar ground-truth
rig): 19-line corpus k1/k3 byte-identical to V27.11, k2 12 intended diffs + 1
same (profile unchanged); design matrix 9/9; adversarial 14/14; hardening
15/15 (outputs byte-identical to the pre-stress green set); hand battery 85/85
across long multi-switch, rapid alternation, function-word chains, H6 boundary
runs, entities, numbers, protected spans, punctuation, homographs, and
pure-English/pure-Bangla floors; seeded fuzz 720/720 (12 seeds x 60 mixes,
invariants: never empty/crash, protected spans + digit runs + version tokens
verbatim, pure-English byte-identical, a run of 3+ bare Bangla words always
renders Bengali, no control characters).

Known inherited behavior (unchanged from V27.11, not a regression): rare
English-set collisions like `ke` (English-set for chain purposes, converts as
a loan কে inside locked Bangla zones) and name/brand chains in otherwise
English text (e.g. `Samsung Google Apple`) lock as Bangla - entity lists are
V29 scope, documented in the loan-spelling caveat.


## Amendment: reverse-leak round (v28d, 2026-09-23)

After a field report of English dictation occasionally rendering as Bengali,
a dedicated 39-case reverse battery found 11 residual failures in three
classes (function-word bridge into a lone loan; adjacent 2-strong name/island
pairs; zone-split misfire on 2-word islands). Fixed by the weight rule (rule
4) and the zone-split threshold (rule 6). Re-verified on the rebuilt signed
bytes: reverse 39/39, corpus zero drift, all prior suites byte-identical to
their green records, hand battery 85/85, fuzz 720/720. Trade-off documented in
the anchor+weight section above. CI smoke passed on the exact production
bytes (run 35773952365).
