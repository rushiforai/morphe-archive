# Task: Phase 2 four-app patch-surface analysis

## Scope
Analyze the four Play Store packages in `new_patches apk/phase2/` sequentially, hardest first:
1. Pluralsight (`2026.11.05`)
2. Skillshare (`5.4.81`)
3. We Love Deals (`1.2.0`)
4. OferHub (`1.0.0`)

For each app, identify: ads, telemetry/tracking, premium/entitlement gates, security/integrity checks,
client-vs-server boundaries, stable hook points, and community precedents. Produce patch-method
recommendations only; do not implement product patches in this pass.

## Steps
- [/] Read `docs/DEVLOG.md`, peer devlogs, app notes, and Morphe reference/community material
- [ ] Extract the four APKS/APKCUBE packages and record package, version, SDK, ABI, signer, manifest, and protection facts
- [ ] Analyze Pluralsight: resources, dex call paths, ads, telemetry, entitlement/security gates, community precedents
- [ ] Analyze Skillshare: resources, dex call paths, ads, telemetry, entitlement/security gates, community precedents
- [ ] Analyze We Love Deals: resources, dex call paths, ads, telemetry, entitlement/security gates, community precedents
- [ ] Analyze OferHub: resources, dex call paths, ads, telemetry, entitlement/security gates, community precedents
- [ ] Write per-app analysis notes with exact evidence and proposed hook points
- [ ] Update `docs/DEVLOG-PHASE2.md` with failures, fixes, and open questions
- [ ] Synthesize a hard-to-easy patch plan that always covers ads + telemetry and labels client-only premium unlocks honestly
- [ ] Verify every documented path/command/evidence and report remaining blockers

## Blocked / Questions
- Premium-unlock priority is pending user confirmation; analysis proceeds without blocking recon.

## Notes
- Investigation order follows the user's explicit hard-to-easy preference; Pluralsight and Skillshare are treated as the likely hardest apps.
- Project rule: every proposed app patch set includes ad removal and telemetry/tracking removal.
- Project rule: never declare a limitation without searching all seven community bundles plus the official bundle and recording the search.
