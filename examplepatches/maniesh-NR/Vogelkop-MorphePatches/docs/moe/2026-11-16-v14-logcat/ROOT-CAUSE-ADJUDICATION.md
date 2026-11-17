# MoE Round 2 — Logcat Adjudication (2026-11-16, v14)

Router: chief analyst. Panel: E1' crash-stack forensics, E2' byte-level
differential audit, E3' tooling root-cause (new miniverify), E4' release
engineering. Input that changed everything: **the first real crash stack**,
captured by the user from v12 at 17:35 local:

```
java.lang.VerifyError: Verifier rejected class bo3:
  bo3.invoke(java.lang/Object;): [0x1D2] register v7 has type
  Precise Reference: ng but expected Integer
  (declaration of 'bo3' appears in base.apk!classes3.dex)
  at jt3.<init>(Unknown Source:65)
  at zv3.d(Unknown Source:1344)
  at com.opera.android.Lazy.get(Unknown Source:15)
  at com.opera.android.BrowserActivity.U0(Unknown Source:314)
  ...
```

## Adjudication of the Round-1 (v13) hypothesis set

| Round-1 hypothesis | Round-2 verdict | Decisive evidence |
|---|---|---|
| AB.1–AB.4 content-hash churn kills startup | **REJECTED** | A download-churn loop cannot produce a load-time `VerifyError`; the stack shows deterministic class-load rejection of `bo3`, which the AB set never touches |
| AB.3 OOM escape window kills startup | **REJECTED** | No `OutOfMemoryError` in the stack; the crash reproduces at a fixed ~5 s point on every launch, matching lazy DI class-load, not a fetch storm |
| "The AB set was the only v12 delta on an executed startup path" (E4, round 1) | **REJECTED** | v10→v12 also carried the v11-era PT.1/PT.3 bo3 edits; v10 never contained them (v10 = P1–P5 only, its bo3 is stock — hash-proven) |
| "v11-era patch is fatal" (rated LOW residual in round 1) | **ACCEPTED — the root cause** | PT.3's deletion of the chain-head const definitions (`const/4 v5, 0x0`, `const/4 v6, 0x0`, `const/16 v7, 0x38`) leaves the prologue's `Lng;` reference in v7 at the next case's `invoke-static/range` — exactly [0x1D2], exactly "ng but expected Integer" |

## Root cause (three-way proof: logcat ↔ smali ↔ patch source)

1. **Logcat**: verifier rejects `bo3` at offset 0x1D2, register v7,
   "Precise Reference: ng" vs Integer, inside `bo3.invoke(Ljava/lang/Object;)`.
2. **Smali (v12 classes3, --code-offsets)**: the instruction at 0x1D2 is
   `invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V`
   — the row-add for the "0x2" settings-menu case; the method prologue at
   offset 0xC is `sget-object v7, Lng;->a:Lng;`; the deleted block (stock
   offsets 0x1CC–0x1D9) contained the only int redefinitions of v5/v6/v7 on
   that path.
3. **Patch source**: PT.1's replacement was the empty string (sha256 of "") —
   the only pure-deletion patch in the registry; PT.3's replacement kept only
   `sget-object v2, Lhy3;->a:[Lhy3;`. Both deleted the const assignments that
   the fall-through chain's subsequent range-invokes consume.

Cross-version bo3 hashes: v9 == v10 (stock, working); **v11 == v12 == v13
(broken — v13 is unbootable and must not be installed)**.

## Why every prior gate missed it

- Anchor-match + replacement-present checks verify *text presence*, not
  *verification semantics*.
- Class-set equality protects against lost classes (the v8 failure), not
  corrupted method bodies.
- Structural register audits (round-1 E2) checked allocation widths and branch
  targets but not **type flow across control-flow merges** — precisely what a
  mid-chain deletion breaks.
- No device/emulator in the loop: ART itself was the only verifier available,
  and it only ran on the user's phone.

## The fix (v14)

PT.1/PT.3 rewritten to **invoke-only deletion**: keep every `const` as a dead
store, delete only the `invoke-static/range` row-add line. Register type state
becomes stock-identical at every program point (the deleted invoke has no
move-result and cannot affect types), so the method verifies exactly like
stock while the row is still never added.

## The new gate: `scripts/miniverify.py`

A conservative Dalvik register-type checker: per-method CFG construction
(labels, branches, switch payloads, try/catch leniency), worklist dataflow over
a type lattice (I/F/J/D, int-or-float and long-or-double constants, ZERO/NULL,
REF with static types, UNINIT, UNK, CONF), wide-register pair modeling,
slot-indexed `pN` conversion, brace-aware argument parsing, wide-param
advancement in invoke mapping, and class-hierarchy/interface resolution across
all five dex trees plus a framework-class table.

Validation matrix (the gate must reproduce ART):

| input | ART | miniverify |
|---|---|---|
| stock bo3 | accepts | PASS |
| v10 bo3 | accepts | PASS |
| v12 bo3 | VerifyError 0x1D2 v7 ng/I | REJECT, identical message fields |
| v13 bo3 | untested | REJECT (predicted unbootable) |
| v14 bo3 | expected accept | PASS |
| v14 all 16 patched classes (293 methods) | — | PASS |

Engineering notes from building the checker (each was a real false-positive
source until fixed): receiver-vs-argument off-by-one on instance invokes;
`invoke-static/range` vs `invoke-static` matching; shift ops taking an int
shift amount regardless of the operand category; destination registers being
operands only in `/2addr` forms; wide high halves; bare-string lattice values
leaking from the merge function; slot- vs param-indexed `pN`; commas inside
brace register lists; interface-typed receivers; interface inheritance
(interfaces extending interfaces); framework classes outside the smali trees.

## v14 verification summary (on the signed artifact's own bytes)

- 40/40 patches opcode-verified inside the signed APK.
- miniverify PASS on all 16 patched classes from the signed APK's dexes.
- Signed `classes3.dex` == assembled verified dex (hash); `classes.dex` ==
  v12 bytes (hash); asset layer stock (hash).
- bo3 in the signed APK = stock bo3 minus exactly the two row-add invokes
  (label-normalized diff gate).
- Same certificate as v9–v13 → in-place upgrade.

## Residual risks

1. Runtime (non-verifier) behavior of never-device-tested patches (PV.4 null
   provider, PT.2 hidden rows, PD.10 grayed toggles) — type-safe by
   construction and audited, but only a device run proves behavior.
2. Play Protect heuristics remain server-side and out of our control (E4,
   round 1).
3. The miniverify lattice is deliberately lenient (UNK at handler entries,
   unreachable blocks skipped, unresolved hierarchies skipped) — it catches
   the deletion/clobber/wrong-category class, not every verifier rule.
