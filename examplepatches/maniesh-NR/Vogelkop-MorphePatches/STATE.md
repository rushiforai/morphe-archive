# STATE — Morphe × Opera Beta v1.3.1 (reconstructed 2026-11-11)

Prior repo history was lost in a sandbox recycle; this file records the ladder
state from rung E onward. Byte-level facts below were re-verified on-host this
session from the shipped artifacts.

A SECOND sandbox recycle happened before the W-rung; all artifacts (keystore,
C1 substrate, B0b, sums) were re-downloaded from the `sandbox-storage` GitHub
release and hash-verified. The toolchain (build-tools r34, jadx 1.5.6,
apktool 3.0.3, androguard 4.1.4) was re-provisioned from scratch.

## Device verdicts

| Build | Content | Device result |
|---|---|---|
| B0b | APKEditor merge of base+splits (v123) | boots |
| C1 | B0b + v1.3.0 Morphe patches (minus spoof) + startup diagnostics | boots |
| E1 | B0b + six v1.3.1 patches (legacy 02b) | installs, black screen → instant crash |
| E2 | C1 + six v1.3.1 patches (legacy 02b) | installs, black screen → instant crash |
| F1 | labeled "stock + fixed v1.3.1" — **actually shipped legacy 02b** (proved: F1 vs G2 = 3-byte r65.l head delta) | crash |
| F2 | labeled "FULL fixed" — **actually shipped legacy 02b** (F2 vs G1 = same 3-byte delta) | crash |
| K1 | B0b bytes + new-key re-sign, ZERO entry changes (pure re-sign; never touched the patcher rewrite) | boots |
| G0 | C1 + ONLY legacy-broken 02b (deliberate forensic) | not reported |
| G1 | C1 + six v1.3.1 patches, FIXED 02b (vs E2: exactly 2 bytes in r65.l) | **crash** |
| G2 | B0b + six v1.3.1 patches, FIXED 02b | **crash** |
| N0 | C1, patcher zip-rewrite only (null-patch control) | not flashed (moot) |
| S1 | C1 + 02a only (eula read-bypass, 4 sites) | **no T&C dialog, but HANGS at "Almost there!", black screen on reopen → 02a convicted (semantic)** |
| S2 | C1 + 03a only (manifest: 3 VpnPro components cut) | **instant crash → 03a convicted** |
| S3 | C1 + 03c only (5 vpn_pro strings blanked) | boots; part of a VPN Pro notice blanked → innocent + only patch with visible effect |
| S4 | C1 + 02b only (fixed 1-byte form) | boots → innocent (CMP onboarding dialog still shows → inert for that goal) |
| S5 | C1 + 02c only (mm6.e → false) | boots → innocent (default-browser onboarding dialog still shows → inert) |
| S6 | C1 + 03b only (wdn.a → false) | boots → innocent (user-visible VPN Pro button NOT wdn.a-gated) |

## Convictions (post-S-rung, complete and consistent)

1. Legacy 02b (`const/4 v0,0; return v0` over the r65.l head) split the
   following 2-unit `if-nez`; orphaned bytes decode as a phantom sparse-switch
   → ART verifier rejection → E/F crashes. Fixed = 1-byte operand flip.
2. **02a (read-bypass) is a semantic killer**: forcing the four
   `SettingsManager.i("eula_accepted.gdpr")` reads true skips the T&C leaf but
   never WRITES the pref and never runs the real accept path
   (`WelcomeActivity.X()`); the onboarding state machine deadlocks at the
   "Almost there!" finalization and relaunch renders black.
3. **03a (manifest component cut) is a killer**: removing the three VpnPro
   component declarations breaks a startup resolution (crash before first
   frame). Manifest surgery is retired; VPN Pro removal is code/resource-level.
4. 02b/02c/03b are innocent but INERT for the onboarding dialogs: the dialogs
   the user wants gone are steps of the `q0o.g()` onboarding machine
   (m0o: FEATURES_ONBOARDING[DEFAULT_BROWSER, NOTIFICATIONS, CMP_INTRO],
   CONSENT, PERSONALIZATION), gated by `cfn` lambda cases — not by the
   standalone r65/mm6 re-prompt gates.
5. Rewrite path exonerated de facto (S3–S6 all pass through it and boot).
6. The user-visible "VPN Pro button + dialog" is the omnibox feature-suggestion
   chip (`nt8` enum: ESIM + VPN_PRO, `ofa://ui/upgrade?source=feature_suggestion`)
   — not wdn.a-gated, hence visible in S6.

## W-rung (2026-11-11, awaiting device results)

- `W1-rung-universal_signed.apk` — C1 + {02b, 02c, 03b, 03c-extended}
  (binary patcher only). Combination check of the four innocent patches.
- `W2-rung-universal_signed.apk` — W1 content + **smali-rebuilt classes3.dex**
  (hybrid pipeline, see docs/v1.3.1-R2/):
  - 02a' auto-accept: WelcomeActivity site#1 forced true (skip EULA leaf);
    site#2 `:cond_9` else-branch redirected to `X()` — the real T&C accept
    handler (writes eula, `m9k.S()`, `W()` → flow). Identical app state to a
    real button press; no more read/write divergence.
  - 02d: cfn case 0x8 `canOfferDefaultBrowser` → false (DEFAULT_BROWSER step dead).
  - 02e: cfn case 0xc `isCmpIntroductionDue` → false, case 0xd `e0o.shouldShow`
    → false (CMP_INTRO + CONSENT steps dead; unasked consent = all denied).
  - 03d: `nt8` values emptied (omnibox VPN Pro + eSIM suggestion chips gone;
    verified: zero `nt8.valueOf/values()` callers in any dex).
  - PERSONALIZATION (wallpaper/interests) step intentionally kept.
- Host verification: patcher anchors held on the rebuilt dex (02b/02c/03b
  applied cleanly), structural gate 0 failures on all 10 dexes, dexdump OK,
  androguard parse OK (11,928 classes), entry-diff vs C1 = exactly
  `classes3.dex` + `resources.arsc` + signatures. Full smali-tree audit:
  only the 3 intended files changed (+4 files with benign static-default-value
  encoding drops; class count identical).

| W1 | C1 + {02b, 02c, 03b, 03c-extended} (binary only) | **boots** — same as S3; four-innocent combo cleared |
| W2 | W1 content + smali-rebuilt classes3.dex (02a', 02d, 02e, 03d) | installs, splash → PERSONALIZATION (T&C/features/consent gone — patches visibly work) → **"Start browsing" FREEZES; relaunch = black screen** |

## W2 post-mortem (2026-11-12, root cause FOUND)

W2 got through the entire redesigned onboarding and froze at the LAST gate.
Full mechanism (verified in smali; classes/labels from recon dumps):

1. After the last due step, the flow driver (`q0o.f()` → `cek` case 10,
   classes.dex) checks `q0o.d.invoke()` = `tzn` case 2 =
   `((m9k) activity.p.get()).e.g()`. FALSE → it posts `q0n(16)` = `g49`
   (the "Almost there!" dependencies-loading screen) instead of `k0o.d`
   (END → `L()` → `J()` → `g9k.J()` → browser).
2. `m9k` = fresh-install startup-dependency waiter. `m9k.e` initializes to
   `has_waited_for_startup_dependencies || !SettingsManager.J()`; `J()` is
   `version_code == 0` = FRESH INSTALL, so on first run the waiter is ARMED.
3. Two `k9k` deps must complete before `e` flips true:
   - `j9k`: waits for the remote-config bundle (`jk5.a()` reads the
     `config_bundle.active` pref); retries via `avj.g(2, mni-23)` — a queue
     gated on startup-state bit 2 — then parks an `i9k` observer.
   - `bac`: waits for the Leanplum/Braze start response (`m9c.a()`, the
     "appboy-manager" Lazy + `Leanplum.addStartResponseHandler`).
4. `g49.onCreate` arms a give-up timeout (`mni` case 24 → `m9k.R(true)`)
   through `umi.tcl.d(...)` + `coh.k(~15s)` — the umi startup-flow delayed
   executor. In S1 AND W2 neither the deps nor this timeout ever fire →
   permanent "Almost there!"/black screen. (S1 and W2 share the same
   divergence from stock: flow started during onCreate via `q0o.f()` with
   the EULA-path timing skipped — exact stalled link not isolated, and with
   the fix below it no longer matters.)
5. Corroboration: W2 relaunch shows black (queue empty on rebuild because
   PERSONALIZATION wrote its done-pref, so `cek` goes straight to the
   `tzn`-2 check → still false → `g49` with no splash). S1 hung identically
   at "Almost there!". Stock/C1/S3-S6 boot because the waiter resolves.

### Fix (X-rung, v1.3.1-R3)

- **02f — waiter bypass**: `m9k.<init>` forces the initial `jze` value to
  TRUE (dead-code `const/4 p5, 0x1` insert before `Boolean.valueOf`). The
  waiter never arms: `tzn`-2 returns true → `k0o.d` END → browser. Every
  steady-state launch already skips the waiter (`version_code != 0`), so
  forcing first-run parity with subsequent runs is low-risk. `t77` case 11
  also writes `has_waited_for_startup_dependencies` when `e` fires true.
- **02h — splash skip**: `q0o.f()`'s `pushed.sequence != 2` posting of
  `q0n(15)` (hch = `delayed_launch_fragment`, the "Opera logo + loading
  bar" screen) is bypassed (`if-eq v0,v1,:cond_2e` → `goto/16`). Only
  readers of `pushed.sequence` are this site (dead) and cfn case 0xd
  (forced false by 02e). hch's 10s force-launch timeout is thereby retired.
- X1 = W2 + 02f (differential). X2 = W2 + 02f + 02h (feature candidate,
  flash first).

## X-rung build (2026-11-12, awaiting device results)

- Base: `W-rung-rebuilt-classes3.dex` re-downloaded from the storage
  release; W2 content provenance verified in the decoded tree (02a' sites
  1/2, three cfn forced-false sites, nt8 empty array) before editing.
- Toolchain re-provisioned for recycle #3: smali 3.0.10 (library jar from
  Google Maven + baksmali fat jar classpath + antlr-runtime 3.5.3),
  build-tools r34 under `work/tools/android-14/`. No apktool needed — raw
  baksmali/smali on the dex directly.
- `scripts/apply_x_rung_patches.py` (whitespace-flexible anchored edits,
  hard assertions) + `scripts/build_x_rung.sh` (splice → binary-patch
  02b/02c/03b/03c → zipalign → apksigner v1+v2+v3).
- Host verification, both builds: structural gate 0 failures across all
  dexes; 02b/02c/03b anchors held on the rebuilt dex; full smali-tree diff
  vs the W2 tree = exactly 1 file (X1: m9k) / 2 files (X2: m9k, q0o);
  entry-diff vs C1 = exactly {classes3.dex, resources.arsc, 3 signature
  files}; all 9 patch markers re-verified inside the SIGNED APKs
  (02a'×2, 02d/02e×3, 03d, 02f, [02h], 02b, 02c, 03b).
- Uploaded to the storage release: X1/X2 APKs + X-rung dexes +
  `X-RUNG-SHA256SUMS.txt`.

```
9e75640a5307979c2152c606bede55550e93e64052d6a01c01abc108ae48b66f  X1-rung-universal_signed.apk
45d60f9a4674f21366e1e0d039fe9a3abbbf6b764cfaf7765bb0e00d10bdc410  X2-rung-universal_signed.apk
```

## v1.3.2 recon (2026-11-12)

- **#8 adblock defaults + Secure DNS: recon COMPLETE** — full findings in
  `evidence/adblock-defaults-recon.md`; tested manifest rewriter at
  `scripts/abp_manifest_patch.py` (byte-exact round-trip on stock; promotes
  39 lists to default-on, removes `opera_fixes`; stable 103 + beta 104
  manifests byte-identical). Patch = A(manifest)+B(empty opera_fixes
  assets)+C(SettingsManager defaults: ad_blocking/dns_over_https_enabled/
  dns_over_https_mode → 1)+D(pin zi3.k/q → h(), classes.dex). Custom-list
  UI already ships in 103/104. Implementation awaits the W2 device verdict
  (target substrate).
- Sandbox toolchain re-provisioned from scratch again (recycle #3):
  jadx 1.5.2 + baksmali 3.0.10 under `/home/z/my-project/.tools/`
  (excluded from the backup mirror); recon dumps under `.tools/recon/`.

## Tooling (reconstructed this session)

- `scripts/v131_binary_patch.py` — fixed-02b patcher, `--only`, `--no-patches`,
  structural gate, **extended 03c blank list (12 names)**.
- `scripts/splice_entry.py` — byte-preserving single-entry zip splice
  (the hybrid pipeline's dex injector).
- `scripts/build_w_rung.sh` — W1/W2 build+sign pipeline.
- Hybrid smali pipeline (decode → edit → rebuild → splice → binary-patch →
  sign): procedure in `docs/v1.3.1-R2/README.md`; patches as
  `docs/v1.3.1-R2/patches/*.smali.patch`.
- Calibration: gate on C1 = 0, on E2 = 1 (r65.l phantom switch).
