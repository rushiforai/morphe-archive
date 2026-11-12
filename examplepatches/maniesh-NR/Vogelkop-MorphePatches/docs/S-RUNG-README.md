# S-rung — single-patch bisect + null-patch control (2026-11-11)

## Where we stand after your G results

**G1 and G2 both crashed.** Those two were the first builds with the genuinely
fixed 02b (byte-verified: G1 differs from crashing E2 by exactly 2 bytes in
`r65.l`, and both G builds pass a full structural walk that reproduces the old
defect precisely). K1 boots. Therefore:

> **A second killer exists in the v1.3.1 patch set** — semantic, not structural
> (the gate is clean), and substrate-independent (C1-based G1 and stock-based
> G2 both die). The suspect pool: 02a, 02c, 03a, 03b, 03c, and — formally —
> 02b's forced-false semantics.

**Disclosure — F-rung was mislabeled.** Byte-diffing the shipped F1/F2 against
G1/G2 proved F1/F2 still contained the OLD broken 02b (`const/4 v0,0; return v0`
over the method head): F1 vs G2 differs by exactly the 3 bytes of that head.
So the F rung never tested the fix; its "boots expected" framing was wrong and
its crashes carried no new information. The G rung did, and it says: second
killer.

**Second disclosure — K1 was a pure re-sign.** K1's entries are byte-identical
to B0b (6346/6346) — it never went through the patcher's zip-rewrite step. That
step is therefore also unproven on device, and it touches every E/F/G build.
N0 below closes that gap.

## The builds (all on the C1 substrate — the release substrate, boots on device)

| # | File | Content | If it BOOTS | If it CRASHES |
|---|---|---|---|---|
| 0 | `N0-rung-universal_signed.apk` | **null-patch control**: patcher zip-rewrite + sign only, zero semantic edits | rewrite path exonerated → S results are per-patch truth | the patcher's zip rewrite is the killer → I fix it and rebuild everything (S results void) |
| 1 | `S1-rung-universal_signed.apk` | + **02a only** (WelcomeActivity eula force-accept, 4 sites — launcher path) | 02a innocent | **02a is a killer** |
| 2 | `S2-rung-universal_signed.apk` | + **03a only** (manifest: 3 VPN Pro components cut, −1100 B) | 03a innocent | **03a is a killer** |
| 3 | `S3-rung-universal_signed.apk` | + **03c only** (arsc: 5 vpn_pro strings → `" "`, 102 pool entries) | 03c innocent | **03c is a killer** |
| 4 | `S4-rung-universal_signed.apk` | + **02b only** (r65.l → false, fixed 1-byte form — byte-identical to G1's) | 02b-fix innocent | **02b is a killer** (semantics, not structure) |
| 5 | `S5-rung-universal_signed.apk` | + **02c only** (mm6.e default-browser gate → false) | 02c innocent | **02c is a killer** |
| 6 | `S6-rung-universal_signed.apk` | + **03b only** (wdn.a()Z → false) | 03b innocent | **03b is a killer** |

Every build is host-verified before shipping: zipalign OK, apksigner v1+v2+v3
OK, aapt2 badging parses, structural gate **0 failures**, and a byte-diff
against C1 proves the delta is exactly the intended patch bytes (N0: zero
changed entries; S4's patched `r65.l` is byte-identical to G1's).

## Protocol

Uninstall Opera Beta before each install (same keystore throughout; clean
baseline). Install → open → note result. One line per build is enough.

**Flash in this order** (top suspects first — you can stop as soon as a build
crashes and tell me):

1. **N0** — cheapest decisive control. If it crashes, stop; nothing else matters.
2. **S1** (02a) — prime suspect: it rewrites the launcher activity's
   fresh-install flow (skips T&C/onboarding, proceeds straight to the start
   page via `q0o.f()`).
3. **S2** (03a) — manifest component cuts; runtime-resolution risk.
4. **S3** (03c) — arsc string-pool surgery; global-resource risk.
5. **S4, S5, S6** (02b/02c/03b) — consent/dialog gates; least likely.

Interpretation:
- Any S_k crashes → patch k convicted (solo-sufficient killer). I rebuild the
  release candidate as C1 + all six **minus** the convicted, you flash it with
  the 9-point checklist.
- All of S1–S6 boot + N0 boots → the killer is a **combination**, most plausibly
  02a+02b/02c ("eula accepted" + "consent never asked" state). I'll bisect
  pairs next.
- N0 crashes → rewrite-path bug; I fix the packer (byte-identical rezip) and
  we redo the round.

## Optional evidence (free, non-blocking)

- If you still have G1 installed (or reinstall it): after letting it crash,
  `Internal storage → Android → data → com.opera.browser.beta → files →
  vogelkop-diag.log` — G1 carries the startup diagnostics and its log may name
  the failing stage.
- With a PC: `adb logcat -b crash -d` right after a crash of any S build.

## Hashes

```
3043cd971fbad372bd4e08344a74e1b36f5cdc482c53b5603d80e2256ffd7e7c  N0-rung-universal_signed.apk
011e9272178c98bfc75e49d96efcdf9fcdeb140578bb86f97526b5355021ca7c  S1-rung-universal_signed.apk
633f6de7f11c2fe1c04957434b539c5acae9e866ec1154a0bbfbd2d75180be24  S2-rung-universal_signed.apk
11c30365340dfa38c6f747fa37a8b7902f15c3f01cfc1e6c980154c46b10a0c2  S3-rung-universal_signed.apk
1b23381e20619af9c493525ca5bf29482e24965e5911c85efed19dc82f3640e4  S4-rung-universal_signed.apk
77332a7b2ef802cf64a2f1ef7408e625a73ec39de71a267d65224da76af99a67  S5-rung-universal_signed.apk
958e7a6e06051aa82be6c912047e89d7c41fece7bcae5cfdb1718b225c283f9a  S6-rung-universal_signed.apk
```
