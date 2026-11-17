# Episode: v12 VerifyError root-caused from the first real logcat; v14 shipped (2026-11-16)

- The user captured v12's crash stack (the project's first logcat):
  `VerifyError bo3.invoke [0x1D2] register v7: Precise Reference ng but
  expected Integer (classes3.dex)` via jt3/zv3/Lazy.get/BrowserActivity.U0.
- Root cause: v11-era PT.1/PT.3 deleted the chain-head const definitions
  (v5/v6/v7) of bo3.invoke's fall-through row-add chain; v7 kept the
  prologue's Lng; reference into the 0x1D2 range-invoke. v10 never had these
  patches (v10 = P1-P5 only); v11 == v12 == v13 bo3 (hash-proven) → v13 is
  unbootable and superseded.
- Fix (v14): invoke-only deletion — keep all consts as dead stores, remove
  only the `invoke-static/range` row-add line. Type state stock-identical at
  every point; rows still never added.
- New permanent gate: scripts/miniverify.py — Dalvik register-type checker;
  reproduces ART's verdict on the bo3 family (stock/v10 PASS, v12/v13 REJECT
  with the exact ART error, v14 PASS; 293 methods/16 patched classes PASS).
  Hard lessons while building it: receiver-vs-arg off-by-one, range-invoke
  matching, shift-amount int, /2addr dest semantics, wide high halves, merge()
  must return tuples, slot-indexed pN, brace-list commas, interface
  inheritance, framework-class leniency.
- v14 verified on the signed artifact's own bytes (40/40 patches, bo3
  exact-delta, hash-identity of both dexes, stock assets, same cert).
  sha256 0bab9fa5e8925b0634ff4e15a523eb8054f4687e9b54915a049e5fe6199329a1.
