# Adversarial audit of the Vogelkop project — 2026-11-16

**Method.** Four agents were assigned adversarial roles and ran independently,
then cross-reviewed each other's output:

| Role | Agent | Mission | Report |
|---|---|---|---|
| RED | Adversarial verifier | Falsify every v12 claim from the shipped bytes | [RED-adversarial-verifier.md](RED-adversarial-verifier.md) |
| BLUE | Forensic historian | Reconstruct the complete build ladder (what was tried, what worked, what failed) | [BLUE-forensic-history.md](BLUE-forensic-history.md) |
| GRAY | Research scout | Blocklist-maintainer research + live URL verification | [GRAY-research-blocklists.md](GRAY-research-blocklists.md) |
| BLACK | Risk officer & roadmap adversary | Attack the roadmap, find what the others missed, go/no-go | [BLACK-roadmap-risk.md](BLACK-roadmap-risk.md) |

Audit target: `OperaBeta-104.0.5262.91143-custom-v12-universal.apk`
(sha256 `299e46406e1f0ea66f8d79c2ee874be2313607c6fda1d4206887390f6e63b8ac`).

---

## 1. Verdict in one paragraph

The v12 build is real and its core engineering claims hold under hostile
re-verification. All 44 patches are provably present in the shipped signed APK;
class sets are identical to stock (45,244/45,244); the whole-APK diff vs stock
is exactly 2 dexes + 3 META-INF files; the v11 crash fix is genuine — the asset
layer is byte-identical to v9/v10 and parses cleanly, with a working negative
control (v11's manifest reproduces the exact documented defect). The shipping
decision is **GO — install v12 on the device now, with conditions** (device
test protocol within 24 h, v10 pinned as rollback, bisection-not-rebuild if it
crashes, v13 = updater hardening immediately after). Two release-doc claims
were false and are now corrected; the most serious engineering risk found is
that the checksum-gate bypass (AB.4) trusts any 2xx body for *every* list
download, which v13 must scope down.

## 2. Scorecard per agent

### RED — falsification of v12 claims
- **13 VERIFIED / 2 FAILED / 6+ NEW RISKS / 1 UNVERIFIABLE.**
- VERIFIED: 44/44 patches (anchor-matched against an independently produced
  stock disassembly, replacements verified in an independently produced
  disassembly of the shipped dexes; 0 differing files in a full-tree diff of
  10,069 + 11,936 smali files); class-set equality 45,244/45,244 (dex-header
  parse + full descriptor sets); signature verifies with cert SHA-256 equal to
  the pin and to v9/v10; asset layer (19 entries) byte-identical to v9/v10 with
  clean full-consume manifest parse (44/1/1/42 + 44 metadata); 8/8 sampled
  maintainer URLs live over TLS.
- FAILED (doc claims): "Signature: v1+v2+v3" — actually **v3-only**
  (functionally fine on minSdk 29; claim corrected in PATCH-NOTES);
  a baseline byte-size figure quoted in the task brief (fixed by pinning
  correct baselines, see RD.4).
- NEW RISKS (details in §4): R2 unscoped checksum-gate bypass, R3 cross-host
  redirect trust, R4 plain-text-under-hash-name fallback, R5 double-gzip,
  R6 RAM buffering, R7 case-sensitive hash lookup.
- UNVERIFIABLE: "installs without Play Protect warning" (device-side; part of
  the RD.1 protocol).

### BLUE — forensic history
- **35 builds reconstructed** across two eras: Era A (Morphe bundles
  v1.0.0–v1.3.0 + host ladder B0→X2) and Era B (self-built universal APKs
  v2→v12). Every row carries a device verdict (or "not recorded") and a source
  cite.
- Three root-caused crashes define the modern era: **v8** (dex re-merge lost
  classes → `ClassNotFoundException: Lz4;`), **v9** (rebuilt structure never
  replayed the patch layer → silent regression), **v11** (asset pipeline
  corrupted `abp.manifest` ADBLOCK_CSS section count → parse exception →
  empty fallback manifest → ~10 s white-screen crash every launch).
- Process lessons that became mechanisms: verify the final signed artifact
  end-to-end; label ≠ content (only byte-diffs exposed the mislabeled F1/F2);
  durable state survives hostile sandboxes (one permanent key at v1.2.6,
  repo-as-state, release-based backups, patches/ persistence at v12).
- Open: v12 not device-tested; X1/X2 verdicts never recorded; carried feature
  gaps (VPN padlocked rows, news ads, arm64-only variant, …).

### GRAY — research
- **12/12 sampled URLs verified live** (HTTP 200, genuine ABP-syntax content,
  1.5–2 MB as expected); 0 failures; 1 cross-host redirect (Estonia:
  `adblock.ee` → `ubo-et.lepik.io`); 0 non-TLS.
- uAssets canonical files confirmed (`filters.txt`, `privacy.txt`,
  `badware.txt`, `quick-fixes.txt`; the map's `filters.txt` entry is correct —
  `full.txt`/`ads.txt` do not exist).
- **0/12 maintainers serve gzip** → the v12 gzip normalizer is mandatory, and
  the design assumption is confirmed by probing the Opera CDN itself
  (content-addressed gzip whose sha256 = the manifest key).
- No public documentation of `blocklists.operacdn.com` exists (its base URL
  exposes a public S3 bucket listing — Opera's exposure, not v12's).
- No detached signatures exist for the lists (e.g. `easylistgermany.sig` →
  404), so "trust TLS + maintainer repo" is the strongest practical model —
  the same one uBlock Origin uses.
- Recommendation: swap the Estonia entry to
  `raw.githubusercontent.com/sander85/uBO-et/master/list.txt` (byte-identical
  content verified; removes the cross-host redirect); beware mutable
  `master`/`main` branch pins (silent-404 risk).

### BLACK — risk & roadmap
- Fresh verification of its own: `apply.py` has **no CLI enable/disable
  override** and `manifest.json` is write-only output (editing it is a no-op)
  → bisection requires editing registry call sites (fixed in RD.2); all 44
  ledger rows claim `version_introduced: v12` (provenance defect, RD.2);
  AB.1's injected `<clinit>` is the only v12-only code on the startup path
  (prime bisect suspect if anything fails).
- Risk register: R1–R8 + carried B1–B7 + new N1–N8, each with severity,
  likelihood, blast radius, mitigation and a "blocks ship?" column.
- **GO with 6 conditions** (§5 below); full prioritized roadmap RD.1–RD.9.

## 3. What has been tried (complete ladder — see BLUE for all 35 rows)

Era A (2026-11-04 → 11-12): Morphe patch bundles v1.0.0–v1.3.0 applied
on-device, with the on-host ladder B0 → B0b → B1/B2/B2b/B3 → C1/C2 → E1/E2 →
F1/F2 → G0/G1/G2 → K1 → N0 → S1–S6 → W1/W2 → X1/X2. This era produced the
convictions that still guide the project: legacy 02b's 2-byte truncation
created a phantom sparse-switch (ART verifier rejection); 02a's read-bypass
deadlocked onboarding semantically (read≠write); manifest component surgery
(03a) kills startup resolution.

Era B (2026-11-13 → now): self-built universal APKs. v2–v6 (working lineage),
v8 (dex re-merge disaster), v9 (patch-loss regression), v10 (**last
device-proven build**, 40 patches), v11 (asset-pipeline crash), v12 (crash fix
+ maintainer-direct blocklist updates — audited here).

## 4. Findings — what worked, what failed, what is still risky

**Worked (and is now mechanized):** anchor-enforced patch application +
post-signing re-verification (`patches/apply.py apply/verify` + PATCHES.md
ledger); class-set equality gate; byte-identical stock assets for the crash
fix; durable signing key; repo-as-state; release-based sandbox backups; the
patch-bundle zip per release.

**Failed (with root causes):** v8 dex re-merge (silent class loss);
v9 structure rebuild without patch replay; v11 single-section manifest parser;
Era-A label errors (F1/F2 shipped legacy patches under fixed labels); lost
diagnostics (Test A empty log); three sandbox recycles losing keys/artifacts
(drove the durable-key + repo-as-state policies).

**Still risky (top items):**
1. **B1 — v12 is not device-tested.** The only unverified seam. (GO
   condition 1.)
2. **R2 — AB.4 disables the SHA-256 gate for every `lj3.b` download**,
   including the 9 CDN-fallback lists: any 2xx body (captive portal,
   soft-200 HTML) is stored and served as a trusted blocklist. Exposure
   starts at the first TTL refresh (first run is assets-only). Fix: AB.5/AB.6
   in v13.
3. **R3 — cross-host redirects trusted** (1 live instance: Estonia; AB.7
   swaps the URL, AB.8 disables redirects).
4. **N2 — AB.1's injected `<clinit>`** (37 hashes/URLs) runs at f9 class-load
   during adblock init: the only v12-only startup-path code. Prime bisect
   suspect; disabling AB.2–4 alone does not neutralize it.
5. **N3 — in-place upgrade over the crashing v11 inherits unknown /data
   state** (v11 may have half-written prefs before dying). Test both upgrade
   and fresh-install profiles; `pm clear` resets the experiment.

## 5. Shipping decision: GO with conditions

1. Run the RD.1 device protocol within 24 h of install; record the verdict in
   STATE.md and the release.
2. Keep v10 (`44a70d1c4f4c0c0bc7399f3e2f1cb6bc1536413e723f8b7377e913c808829ecd`)
   pinned as rollback: `adb install -r -d <v10.apk>`.
3. If v12 crashes: execute the bisection ladder (v12-b1…v12-b5 in RD.1), never
   blind rebuilds (the F1/F2 lesson).
4. Do not wipe `sandbox-storage` until the v12 verdict is recorded.
5. Publish the doc corrections with the release (done this audit: signature
   scheme, v10 baseline pinned, Play Protect wording kept device-verifiable).
6. Schedule v13 = RD.2 + RD.3 (updater hardening) as the immediate next build.

## 6. Roadmap (RD.1–RD.9)

Full detail with acceptance criteria: [../../v13-ROADMAP.md](../../v13-ROADMAP.md).
Order: RD.1 device protocol (S) → RD.2 bisection tooling + provenance fix (S)
→ RD.3 updater hardening AB.5–AB.8 (M, v13 core) → RD.4 doc/release hygiene
(S, partially done) → RD.5 close stale items (S) → RD.6 arm64-only variant (M)
→ RD.7 externalized updater map + Expires-aware TTL (v14, M) → RD.9 feature
backlog (L).

## 7. Where everything is backed up

- **Repo (pushed):** `maniesh-NR/Vogelkop-MorphePatches` — this audit dir,
  `STATE.md` (episode appended), `docs/v13-ROADMAP.md`, corrected
  PATCH-NOTES, full patch ledger.
- **Release `sandbox-storage`:** all historical APKs (B0→v12), patch bundles,
  keystore, SHA256SUMS files, and (new) `audit-2026-11-16-adversarial-review.zip`
  containing the four agent reports + this synthesis.
- **Audit scratch evidence:** `work/audit-reports/scratch-red/` (scripts +
  JSON outputs); audit trees `work/audit/` (baksmali of the shipped dexes,
  byte-proven).
