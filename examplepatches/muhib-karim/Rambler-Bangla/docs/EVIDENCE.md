# Evidence and status detail

## Evidence basis (static, verified)

From the analysis of the PixelBoard 18.3.1 artifact (APK SHA-256
`e229d982ff65b24d71aeee804dcce6863e902ec409a0379ca3deaef17e30f6bd`):

| Anchor | Where | Fingerprint (SHA-256) |
|---|---|---|
| 289-byte "Hinglish Override" rule, unconditionally injected for any Indian-language+English mix, naming Bengali/Banglish | `classes3.dex`, `Lkfd;->d(Lhrl;Ljava/lang/String;ILqqi;Laebb;Ljava/lang/String;Laugd;Ljava/util/concurrent/atomic/AtomicBoolean;)V` | `a024513458b73f915c78438cea2a9457b9c5aed28da3644030c3dc76cd0ac6e9` |
| 17,802-byte Lite cleanup prompt, "SCRIPT GATE" Branch A mandates Indic->ASCII Romanization on a Latin keyboard | `classes3.dex`, `Lkew;->b(Ljava/lang/Object;)V` | `347a9484392763d5fb16660bc3ca9bbceb1851c96f2024f96c1e9327f504696e` |

The same 289-byte rule exists unchanged in the stock input APK: the behavior
is inherited from Gboard, not introduced by PixelBoard. This evidence covers
the **Lite (local cleanup) path only**; remote Rambler Base/S policy cannot be
established statically (see docs/VALIDATION.md).

## Design

Two runtime hooks in `kfd.d`, driven by the enabled-language data that already
flows through the method (`{ENABLED_LANGUAGES}`, joined from the
enabled-language collection):

1. `selectHinglishOverrideRule(stockRule, enabledLanguages)` replaces the
   `{HINGLISH_OVERRIDE_RULE}` substitution value:
   native Indic tag present -> native-script preservation rule;
   only explicit `-Latn` Indic tags -> stock rule;
   no Indic tags -> rule dropped (it is a no-op anyway);
   unknown/blank -> stock rule (fail-safe).
2. `rewriteCleanupPromptScriptGate(prompt, enabledLanguages)` rewrites only
   the Branch A Romanization bullet of the SCRIPT GATE, only under a native
   Indic policy, and only when the expected stock block is present verbatim;
   everything else in the prompt stays byte-identical.

Fail-closed gates: exact method signatures, both string fingerprints
(whole-APK sweep), resolvable `{ENABLED_LANGUAGES}` replace-site dataflow,
anchor-order check, already-patched check. Any miss aborts with no output.

## Limits

- The one thing static work cannot finish is on-device confirmation for the
  real kfd.d register map and for Base/S. `analyze` resolves the register map
  on the real APK at patch time; the S23 Ultra behavior matrix is in
  docs/VALIDATION.md.
- The zh-TW-analog locale-admission hook (`admitExactBengaliLocales`) is
  hypothesis-stage and OFF by default; Bengali is absent from Google's
  official Rambler tuned-language list, so remote Base/S may Romanize
  regardless of any client patch.

## V28 status (2026-09-23)

The multilingual voice path is segment-locked: each dictated segment is
classified once (Bangla vs English) and rendered entirely in that language,
replacing the per-word convert/keep that scrambled mixed dictation in V27.11.
Design and test evidence: docs/V28-SEGMENT-LOCK.md. Build record:
ledger/v28-provenance.md. The k1 (full Bangla) and k3 (en-US) layouts and the
typing path are unchanged (byte-verified against the V27.11 log corpus). An
extended stress battery (85 hand cases + 720 seeded fuzz mixes against the
exact signed bytes) passed after two more targeted fixes (@handle protection;
names isolated by punctuation boundaries). A reverse-direction leak battery
(39 cases, built from a field report of English dictation rendering as
Bengali) then caught three residual classes and the weight rule + zone-split
threshold fixes closed all 39. v28d remains the last stable baseline
(superseded in field testing by V29): production SHA-256
5889214e492541fa6024f03e023ae471e55f7d300395d0027235d81a7ef85362, staging
SHA-256 e88511d2f7b7e28dfcbf1d21cb1f37db096cc5bc435d3afe3a1d9cbe735b9631,
CI smoke green on the exact bytes - see the ledger.

## V29 status (2026-09-23, in development)

V29 is the current field-iteration build on the fix lane: A2 garble-ASR
demotion plus Tier-1 Bangla spelling normalization on top of the V28 segment
lock. It is NOT a stable release: this cycle's field reports documented open
bugs (residual spelling errors, language-switch edge cases) and iteration is
continuing in the open. Design: docs/V29-DESIGN.md. Acceptance fixtures:
docs/V29-FIXTURES.md. Build record and rig/CI evidence:
ledger/v29-provenance.md. Test APKs are shared privately with the project
owner only; this repository distributes source, not APKs.
