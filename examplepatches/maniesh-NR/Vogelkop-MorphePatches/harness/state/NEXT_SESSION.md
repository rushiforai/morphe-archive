# NEXT_SESSION.md — working memory / handoff

Updated: 2026-11-16 (v14 session: bo3 VerifyError root cause + fix, UTC)

## Current state

- **v14 SHIPPED**: `download/OperaBeta-104.0.5262.91143-custom-v14-universal.apk`
  sha256 `0bab9fa5…329a1`, same cert as v9-v13 (in-place upgrade).
  = v13's tree with PT.1/PT.3 rewritten verifier-safe (invoke-only deletion).
  Awaiting device verdict. **v13 is unbootable (same broken bo3 as v11/v12) —
  never install it; v10 remains the device-proven rollback.**
- v12 root cause (logcat-proven): PT.1/PT.3 pure-deletion killed the const
  definitions for bo3.invoke's fall-through row-add chain → v7 carried the
  prologue's Lng; reference into the 0x1D2 range-invoke → VerifyError at
  class load → Lazy.get crash at ~5 s. Round-1 MoE's AB-set theory was wrong
  (churn/OOM can't produce a load-time verifier rejection).
- **New pipeline gate**: `scripts/miniverify.py` (Dalvik register-type
  checker; validated against ART on the bo3 family) + bo3 exact-delta gate in
  `build_v14.sh` [4b]/[5]. Third structural guardrail after class-set
  equality (v8) and the patch ledger (v9).

## Next session should

1. Collect the v14 device verdict (expect: boots; menu rows absent; if any
   issue → `adb logcat -c && adb logcat > issue.log` — startup is now
   verifier-clean, so a new stack would point at a fresh, diagnosable defect).
2. If v14 boots: resume the v14+ roadmap — maintainer-direct blocklist
   updates redesigned around the content-hash invariant, news-banner ads,
   MiniPay strip, optional strips.
3. Keep miniverify in every future build; extend its framework table when new
   receiver types appear.
