# Opera Beta 104.0.5262.91143 — custom v14 (universal)

**v14 = the REAL fix for the v11/v12/v13 startup crash, proven by the first real
crash stack (user logcat, 2026-11-16 17:35). Do not install v13 — it carries the
same defect as v12. Install v14.**

Installs in place over v9/v10/v11/v12/v13 (same signing certificate) — no
uninstall, no data loss.

## The root cause (proven, not hypothesized)

The user captured the crash stack that every previous analysis round lacked:

```
java.lang.VerifyError: Verifier rejected class bo3:
  bo3.invoke(java.lang.Object): [0x1D2] register v7 has type
  Precise Reference: ng but expected Integer
  (declaration of 'bo3' appears in base.apk!classes3.dex)
  at jt3.<init> ... at com.opera.android.Lazy.get
  at com.opera.android.BrowserActivity.U0 ...
```

`bo3.invoke()` is the menu/toolbar row-builder lambda, built as a **fall-through
chain** of `invoke-static/range {v1..v7}` row-add calls. Its prologue loads
`v7 = Lng;->a` (a reference). Each chain head redefines v5/v6/v7 as ints
(`const/4 v5, 0x0`, `const/4 v6, 0x0`, `const/16 v7, 0x38`) before the row-adds.

The v11-era patches **PT.1/PT.3 deleted the whole row-add block — including
those const definitions** to remove the Rewards row (PT.1) and the
"Set Opera as default browser" row (PT.3). After deletion, the path through
PT.3's region reaches the next case's `invoke-static/range` (at patched offset
**0x1D2**) with v7 still holding the prologue's `ng` reference → ART's verifier
rejects the entire class at load time → `Lazy.get` fails → `BrowserActivity`
dies after ~5 s of white screen, every launch.

Why it shipped: PT.1 was the **only pure-deletion patch** in the 44-patch set
(its replacement was the empty string), and the structural audits checked
anchors, register allocation and branch targets — but not register **type
flow** across control-flow merges, which is exactly what a deletion breaks.

## What v14 changes (and only that)

- **PT.1/PT.3 rewritten verifier-safe**: every `const` assignment is KEPT as a
  dead store and ONLY the `invoke-static/range {v1..v7}, Ln6j;->c(...)V` line is
  removed. The register type state at every program point is byte-for-byte
  stock-equivalent, so the method verifies exactly like stock. The rows are
  still never added (the adding call is gone).
- Everything else is v13's tree: the same 40 enabled patches (first-run skip,
  splash, privacy/notification defaults, ad-block + tracker-blocker +
  secure-DNS + cookies on, 39 filter lists, VPN Pro/eSIM/Rewards/promo surfaces
  removed, wallpapers unlocked, empty speed dial), AB.1–AB.4 still disabled,
  stock asset layer.
- `classes.dex` is v12's own file, byte-identical (zero delta).
- Entry-level APK diff vs v12: **exactly `classes3.dex` + signature files.**

## New pipeline gate: miniverify (the tool that would have caught this in v11)

`scripts/miniverify.py` is a conservative Dalvik register-type checker
(CFG + worklist dataflow over a type lattice with wide-pair modeling,
`pN`-slot conversion and class-hierarchy/interface resolution across all five
dex trees). It reproduces ART's verdict on this bug class exactly:

| input | ART (device) | miniverify |
|---|---|---|
| stock bo3 | accepts | PASS |
| v10 bo3 | accepts (device-proven build) | PASS |
| v12 bo3 | VerifyError [0x1D2] v7 ng vs Integer | REJECT — same offset, register, types |
| v13 bo3 | (untested on device) | REJECT — same defect |
| **v14 bo3** | expected accept | **PASS** |
| all 16 patched classes, 293 methods (v14) | — | **PASS** |

The v14 build now refuses to ship unless miniverify passes on every patched
class (`build_v14.sh` step 4b), plus a bo3 exact-delta gate (v14 bo3 must equal
stock bo3 minus exactly the two row-add invokes — verified on the signed APK's
own dexes).

## Verification performed on the exact shipped file

- 40/40 patches verified (opcode level) by re-disassembling the **signed APK's
  own** `classes.dex`/`classes3.dex`.
- miniverify: 293 methods across all 16 patched classes — no register-type
  conflicts (run on the signed APK's own dexes).
- Signed-APK `classes3.dex` is byte-identical to the assembled+verified dex;
  `classes.dex` byte-identical to v12's.
- Signed-APK bo3 = stock bo3 minus exactly the two `invoke-static/range`
  row-add lines (label-normalized diff).
- Class-set equality: 45,244/45,244 (10,069 + 11,936 in the two patched
  dexes); `Lz4;` present; services + kotlin_module preserved; arsc + 10 `.so`
  STORED (structural PASS, zipalign verified).
- `assets/op/abp.manifest` + 12 bundled lists byte-identical to stock v9/v10
  (inherited from the v12 base, re-asserted).
- Signature: same keystore as v9–v13 (cert SHA-256
  `62:C9:FA:6F:DA:E6:82:66:29:93:A5:AB:41:7C:71:17:79:D1:A0:BC:8F:F6:43:E4:4D:E5:20:11:87:A9:6A:DF`)
  → **installs in place over v9/v10/v11/v12/v13**. v3 scheme verified.

## Why v13 would also have crashed (do not use it)

v13 = v12 minus AB.1–AB.4, but PT.1/PT.3 were kept: its `classes3.dex` contains
the same broken bo3 (byte-identical bo3.smali across v11/v12/v13 — verified).
The earlier MoE panel's AB-set theory (download churn + OOM window) was a
reasonable inference without a crash stack, but the stack shows a load-time
verifier rejection instead. v14 supersedes v13 for device testing.

## Install & test

1. Install over your existing build (no uninstall):
   `adb install -r OperaBeta-104.0.5262.91143-custom-v14-universal.apk`
   (or any package installer).
2. First launch: straight to the start page, no onboarding. The app should now
   stay up past 5–10 s (the VerifyError is gone by construction).
3. Check: main menu has no Rewards row; settings menu has no default-browser
   row at the top; notification settings show no promo rows; VPN settings show
   no banners; speed dial starts empty; ad blocking shows the custom lists.
4. If anything still misbehaves, capture
   `adb logcat -c && adb logcat > issue.log` (reproduce, Ctrl-C) — with v14 the
   startup path is verifier-clean, so any remaining issue would be a different,
   equally diagnosable defect.

## Rollback

v10 remains the device-proven floor:
`adb install -r -d <v10.apk>` (sha256
`44a70d1c4f4c0c0bc7399f3e2f1cb6bc1536413e723f8b7377e913c808829ecd`).

## Details

| | |
|---|---|
| File | `OperaBeta-104.0.5262.91143-custom-v14-universal.apk` |
| SHA-256 | `0bab9fa5e8925b0634ff4e15a523eb8054f4687e9b54915a049e5fe6199329a1` |
| Signer cert SHA-256 | `62:C9:FA:6F:DA:E6:82:66:29:93:A5:AB:41:7C:71:17:79:D1:A0:BC:8F:F6:43:E4:4D:E5:20:11:87:A9:6A:DF` |
| Package | `com.opera.browser.beta` (Android 10+) |

## Known open items (unchanged from v12/v13)

1. VPN padlocked rows ("Auto connect", "VPN protocol") — free backend behavior
   needs on-device confirmation.
2. News-section banner ads — not yet patched.
3. Custom blocklist management UI — not yet surfaced.
4. MiniPay full component strip — menu row + provider removed; full strip pending.
5. Optional strips (news / live scores) — flags scaffolded, modules not written.
6. Maintainer-direct blocklist updates — disabled since v13; redesign on the
   v14 roadmap must respect the content-hash invariant (see PATCH-NOTES-v13).
