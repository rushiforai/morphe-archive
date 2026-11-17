# E2 — Differential Patch Audit (MoE panel, 2026-11-16)

Agent: general-purpose (glm-5.3). Mandate: full v9-v10-v11-v12 change matrix,
bytecode-level adversarial audit of all 44 patches, falsify "the AB patches
are structurally correct".

## Verdict
Could NOT falsify structural correctness. All 44 patches bytecode-sound;
zero unexplained deltas; v11-vs-v12 classes.dex byte-diff proven semantically
null (type_list/annotation pool placement nondeterminism — 18,739/18,739
protos identical, 10,069/10,069 static-value arrays identical).

## Key findings
- AB.1 <clinit>/u()/v(): register allocation, const widths, array ops, branch
  targets, try ranges all PASS. AB.2 call site type-exact (v9 check-cast
  String before use; insertion outside both try ranges; u() cannot throw).
- cv2 exception topology: stock catchall already rethrows, so AB.3's
  outside-try placement does not create a new propagation point for
  IOExceptions (vtp.Q catches, 3 retries + backoff). BUT non-IOException
  Errors (OOM) escape — full-body double buffering (~2x list size per fetch).
- AB.4: type-flow legal; consequence = file stored under manifest-hash name
  with live-upstream bytes (identity divergence — accepted trade-off at audit
  time, later identified as the root cause by E3+gate).
- PD.0 register math textbook (v10 freed local used only by write-then-read
  pairs). All 15 v11-era classes PASS structural audit.
- PD.9 stock default is NULL — the patch selects the custom-lists code path
  stock never enters at first launch.

## Ranked hypotheses at filing time
1. 55% PD.9/PD.7 first-launch state (39 selected vs 12 bundled)
2. 20% PD.5+PD.6 DoH custom-mode crash
3. 10% f9.v OOM window
4. 10% AB.4 content poisoning (slow)
5. low  unflagged v6-era semantic difference

(Post-panel note: #1 was rejected by E3's trace, #2 rejected by E3's DoH
check; #3+#4 are the two accepted mechanisms of the confirmed root cause.)
