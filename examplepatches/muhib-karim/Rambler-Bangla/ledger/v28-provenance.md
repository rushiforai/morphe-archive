# V28 Provenance Record

Recorded 2026-09-23. V28 ("segment-locked multilingual") is a binary patch set on the
corrected V27.11 baselines, continuing the uncommitted local smali patch line from
ledger/v27-provenance.md. Both builds signed with the rambler-signing-v22 key,
cert SHA-256 5ca0623a1f3beb027d3eb87ad0811e97db0ebb8736bd11af0831ab7d6bafbc31, v2+v3.

## Baselines (hash-verified before patching)
- V27.11 production: SHA-256 0db4d45af832de030ef92fc051103c2d1e13aaefa30fea835e5a2ed4626976d7
- V27.11 staging:    SHA-256 06e414d3271642c51be933c6b90a4c3ba75a6a4fdac95ce62b9859781d0577ed

## Patch (identical semantics in both builds)
- New class `GboardRamblerSegmentLock` (segment-level language lock for the
  multilingual voice path; see docs/V28-SEGMENT-LOCK.md).
- `GboardRamblerScriptFix`: package-visible widening of 9 methods + 3 fields the
  new class reuses (no behavior change to existing call sites).
- One 4-instruction hook in `processInternal` at the k2 (multilingual) voice
  branch: when voice input arrives on the multilingual layout, the joined text is
  processed by SegmentLock and returned; all other layouts and the typing path
  run V27.11 code unchanged.
- Staging received its own patch pass (its classes.dex differs from prod:
  `.staging` package identity, extra GateInfo class); hook inserted at the
  equivalent site (flag register v6 at :goto_b8 vs prod v5 at :goto_3).

## Evidence (pre-repack, ground-truth JVM rig)
The rig assembles the patched smali, converts to a JVM jar, and drives it with the
captured V27.11 diag log lines; unpatched baseline reproduces all 19 lines
byte-for-byte (k1/k2/k3).
- k1 (full Bangla) 4/4 and k3 (en-US) 2/2 byte-identical to V27.11: zero regressions.
- k2 (multilingual): 12/13 lines changed (the fix), 1 already correct. Every
  changed line reviewed against the segment-lock spec.
- Design-brief 9-case acceptance matrix: 9/9 pass.
- Adversarial suite (14 cases: multi-switch, single ambiguous words, Bangla names
  in English, tech terms in Bangla, contractions, punctuation-less ASR output,
  rapid alternating segments): 14/14 pass. One defect found and fixed during this
  pass (boundary-less mixed dictation needed the zone-split rule).

## Artifacts
- V28 production (v28d): SHA-256 5889214e492541fa6024f03e023ae471e55f7d300395d0027235d81a7ef85362
- V28 staging (v28d):    SHA-256 e88511d2f7b7e28dfcbf1d21cb1f37db096cc5bc435d3afe3a1d9cbe735b9631
- Native libraries preserved byte-identical; extractNativeLibs=false alignment
  kept (4096, zipalign -c passes). Final signed APKs contain exactly the patched
  dexes (SHA-verified inside the signed artifacts).

## Gate
- CI smoke (install + launch + IME register/enable on a disposable AVD):
  passed on the exact v28d production bytes, run
  https://github.com/muhib-karim/Rambler-Bangla/actions/runs/35773952365 (3m12s).

## Open items
- Loan renderings inside Bangla segments come from the engine's existing
  converter (same output as the k1 layout for those words); cosmetic quality of
  individual loan spellings is inherited, not introduced, by V28.


## Amendment: V28 final (2026-09-23) - strong-anchor fix

Post-freeze hardening (extended matrix from the deep-research brief) caught a
release-blocking defect in the first V28 candidate: a pure-English sentence
containing two ambiguous function-word collisions ("I want to go to the park."
- "to" twice) locked Bangla and was destroyed, because function words alone
could form a locking chain. Fix (one line): a Bangla lock now requires at
least one engine-strong Bangla word as anchor; function-word-only chains
never lock. Full rig re-run green: 19-line corpus k1/k3 byte-identical,
k2 12 intended diffs + 1 same (identical profile to the first candidate),
matrix 9/9, adversarial 14/14, hardening 15/15 (pure-English preservation
restored). The superseded first candidate (prod sha
f2490090dfa2a490dcacb2bedfaa467650a4187ed95380dc62487363c2b27514, staging sha
a98b2351f24eedc1c92f33a18f198684552bff335a679af1f274a6607a0ba50c) must not be
distributed. Final SHAs above supersede it.


## Amendment 2: V28 stress-battery respin (2026-09-23)

The post-delivery stress battery (85 hand cases + 720 seeded fuzz mixes with
invariant oracles) found two real defects in the anchor-fixed build: @handles
converted everywhere (the documented handle protection did not exist in the
build) and discourse-marker/punctuation boundaries isolated names into
one-word segments that converted (e.g. Rahim in "Rahim and Uddin will
come..."). Fixes, both in GboardRamblerSegmentLock.java: (a) @handle spans
join URLs/emails in the protected-span set; (b) the single-strong-word rule
now requires zero English-set evidence in the whole utterance; (c) am/pm after
a digit is protected (3:30pm kept byte-identical inside locked Bangla zones).
Full re-verification on the rebuilt signed bytes: corpus k1/k3 byte-identical,
k2 12+1 profile unchanged, matrix 9/9, adversarial 14/14, hardening 15/15
byte-identical to the prior green set, hand battery 85/85, fuzz 720/720.
Resigned with the same V22 certificate (installs as an update).
The previous build (prod sha c10c9aa7d23cb784674c9c7f07cb979cf3fe338f0310fc70ce22fe168e72c6a5,
staging sha 8cee92e8ae4ad75d5ed5875565e0920f9b9b76de0018da1e3edacb1621f6e07d)
is superseded and must not be distributed. Final SHAs above supersede it.

## Amendment 3: reverse-leak respin - v28d (2026-09-23)

Field report from the maintainer: on the Amendment-2 build, English dictation
occasionally produced Bengali renderings of English words (reverse-direction
leak). A dedicated reverse battery (39 hand cases built around the symptom
class) confirmed 11 residual failures in three classes:

A. "to the <loan>" chain - "The office is next to the bazar." converted the
   entire sentence (function word "to" + one-word English gap "the" + strong
   loan "bazar" formed a locking chain of 2).
B. Adjacent 2-strong islands - "Rahim Uddin joined the call.", "He is my
   choto bhai.", "biye bari", "morog polao": a chain of exactly 2 strong
   words locked regardless of surrounding English density.
C. Zone-split misfire - "We visited Kali Bari during the festival week.": the
   boundary-less-switch detector cut at any 2-word Bangla run adjacent to a
   4+ word English run, converting sandwiched 2-word islands.

Fixes (both in GboardRamblerSegmentLock.java):

1. A Bangla lock now requires real Bangla weight on top of the strong anchor:
   the locking chain must have 3+ strong Bangla words, OR Bangla evidence at
   least matching English evidence in the segment, OR a Bangla-frame function
   word in the chain (ami/ta/ki/na/se/je; "to" and "er" excluded as common in
   plain English prose). A lone strong word still converts only with zero
   English-set words in the whole utterance. "Se office jabe na." still
   converts; "to the bazar" and "Rahim Uddin joined the call." don't.
2. Zone-split English->Bangla cut threshold raised from 2 to 3 consecutive
   Bangla-run words (the genuine-switch adversarial case has 3; still splits).

Documented trade-off: "Office e giye dekhi server down." (a Bangla verb pair
next to English nouns with no frame word) now stays Latin - the engine cannot
distinguish a verb pair from a name pair at that density, and when in doubt it
preserves. This is the only battery output drift vs the Amendment-2 build and
it is the fail-safe direction for the reported symptom.

Full re-verification on the rebuilt signed bytes (dex2jar ground-truth rig):
reverse battery 39/39; 19-line corpus k1/k3 byte-identical to V27.11, k2 12
intended diffs + 1 same (zero drift vs the Amendment-2 build); design matrix
9/9, adversarial 14/14, hardening 15/15 byte-identical to the prior green
records; hand battery 85/85; seeded fuzz 720/720. Re-signed with the same V22
certificate (installs as an update). CI smoke passed on the exact production
bytes (run 35773952365).

The Amendment-2 build (prod sha
ae0f998935a061028eba01cdfd45af90bd9ca40f66e52c3b2ac0130503392828, staging sha
96335c52bb513e29dcd953acc796be1c411a66684b37f8bc7deaa3526d54ec4e) is
superseded and must not be distributed. Final SHAs above supersede it.
