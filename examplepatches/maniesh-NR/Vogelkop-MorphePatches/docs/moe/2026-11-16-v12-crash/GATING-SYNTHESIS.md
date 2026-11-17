# Gating Synthesis — MoE panel verdict (2026-11-16)

Router: chief analyst (this session). Inputs: E2, E3, E4 reports + shared
byte-verified evidence base. E1 (startup timeline) exceeded its first-run
budget; its decisive questions were folded into E3's narrow trace and the
gate's own register-type verification at the AB.2 call site.

## Adjudication
| Hypothesis | Verdict | Decisive evidence |
|---|---|---|
| Packaging/signature (v3-only) | REJECTED | E4: v10 is v3-only too and works; APK delta = 2 dexes |
| PD.9 crashes on stock code | REJECTED | E3: missing-list path defensive end-to-end |
| DoH defaults crash | REJECTED | E3: mode 1 = Cloudflare preset, all ordinals covered |
| v11-era patch is fatal | LOW RESIDUAL | E2: structurally sound, v6-lineage; v11/v12 timing differs |
| AB set crashes (invariant violation) | ACCEPTED | k9d content-hash pairing (gate-verified in smali) + AB.3 OOM window |

## Root cause (two mechanisms, both AB-scoped)
1. Content-hash invariant violation (AB.1+AB.4): k9d pairs files by
   computed content sha256 (k9d.smali:115-261 digesting stream), not by
   filename. AB.4's live-maintainer bytes under the manifest-hash name can
   never pair -> stale-delete + re-download -> endless churn every resolve
   pass (every launch re-evaluates).
2. OOM escape window (AB.3): f9.v buffers the entire response body (raw +
   gzip, ~2x list size) outside cv2's try/catchall; vtp.Q catches only
   IOException; an Error (OOM) escapes uncaught. ~27 concurrent maintainer
   fetches during first launch (PD.9: 39 selected, 12 bundled, 35 mapped
   to maintainers of which 33 missing... 27 missing overall).

## Fix shipped: v13 = v12 minus AB.1-AB.4
Single-variable revert through the registry (enabled=false), full pipeline
replay, three equivalence gates (v13 classes3 tree == v11 shipped tree;
f9/cv2/lj3 == stock v9), APK entry diff vs v12 = classes3.dex + 3 sig
files only. Self-heals a v12 install (stale cleanup + CDN re-fetch).
