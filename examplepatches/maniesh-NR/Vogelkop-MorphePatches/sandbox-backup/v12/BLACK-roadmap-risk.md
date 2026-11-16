# BLACK TEAM — RISK REGISTER, SHIPPING DECISION, v13+ ROADMAP

**Role:** risk officer & roadmap adversary. Input: RED, BLUE, GRAY reports + `work/DIAGNOSIS-v12.md` + `patches/PATCHES.md`.
**Fresh verification performed this session (not just trusting the other three):**

1. **`patches/apply.py` enable/disable mechanics (read in full, lines 39–80).** In `apply` mode a patch with `enabled=False` is printed as `SKIP` and not applied; in `verify` mode it is skipped identically. **There is NO CLI or env override** — argv is only `mode c1-root c3-root [version]` (apply.py:40–42; no `getenv`/flag parsing anywhere in `patches/`). Crucially, **`manifest.json` is output-only**: `build_registry()` constructs patches in Python and `write_manifest()` *writes* manifest.json at the end of `apply`. Editing the `enabled` flag in an existing manifest.json has **zero effect** on any later build. Bisection therefore requires editing the registry module call sites (`patches/<cat>/<file>.py`, adding `enabled=False` to the specific `Patch(...)`), or first shipping a CLI override (RD.2 below).
2. **Ledger provenance defect (NEW).** `register(reg, ver)` passes the *current build version* into every `Patch`, so all 44 rows in `patches/PATCHES.md` and `manifest.json` read `version_introduced: "v12"` (Counter check: `{'v12': 44}`). The "Since" column is actually "last built for". Historical truth (from BLUE/core_patches.py docstrings): P1/P6/P7 are v5/v6-lineage; the v10 device-proven set is P1, P2.1–P2.9, P3, P4, P5, P5b, P5c (17 patches); PD.9, PV.6, PV.7, PD.6, PD.8, PD.10, PT.3, PN.1 are v11-new and have **never run on a booting device** (v11 crashed). This directly shapes the bisection order.
3. **AB.1's injected `<clinit>` is a v12-only startup-path side effect (NEW).** Shipped `f9.smali` contains exactly one `.method static constructor <clinit>()V` (count verified = 1 in `work/audit/c3/f9.smali`) — the injected map-builder. It executes at f9 class-load, which happens during adblock init at startup. Consequence: disabling AB.2/AB.3/AB.4 alone does **not** neutralize it; only disabling AB.1 removes it. It is the only v12-only code that runs before/around first adblock init → prime residual crash suspect.
4. **PATCH-NOTES-v12.md exists in two identical copies** (`download/` and `work/`; `diff -q` rc=0) — any correction must land in both plus the GitHub release copy, or they drift.
5. **The wrong v9-baseline size claim ("151,011,905 B") exists only inside RED's report** (quoted from the task brief) — no project doc carries it. The fix is to *pin correct baselines* in release notes, not to correct an existing doc.
6. Estonia map entry confirmed as RED/GRAY described: hash `5d0dd56b62d99225a21b56e3e64d0120fb50a782a369ea825c5860c13452ecdf` → `https://adblock.ee/list.php` (`patches/adblock/updater_map.json`).
7. `scripts/` contains `abp_validate.py`, `verify_v9.py`, `probe_blocklist_urls.py` — usable as machine-checkable acceptance tools.

---

## 1. RISK REGISTER

Severity / likelihood / blast radius / mitigation / **blocks-v12-ship-now**.

### 1.1 Carried from RED (R1–R8)

| ID | Risk | Sev | Likelihood | Blast radius | Mitigation | Blocks ship? |
|----|------|-----|-----------|--------------|------------|--------------|
| R1 | PATCH-NOTES-v12.md claims "Signature: v1+v2+v3"; apksigner says v3-only (v1/v2=false). Benign on minSdk 29, doc false; MDM/emulator tooling requiring v1/v2 would reject. | Low (doc) | — | Documentation trust | RD.4 doc corrections, both copies + release | **No** |
| R2 | **AB.4 checksum-gate bypass applies to EVERY `lj3.b` download** — 37 mapped maintainer fetches *and* 9 CDN-fallback lists. Any 2xx body (captive portal, ISP soft-200 HTML, compromised maintainer) is stored and served as a trusted blocklist under a manifest-hash name. Stock code would have rejected it. | **High** | Med (one captive portal / hijacked Wi-Fi TTL cycle suffices) | Filter poisoning (content manipulation, not code exec); silent | RD.3: AB.5 scoped gate (strict for CDN path), AB.6 payload sniff + size cap; residual trust model = TLS + maintainer repo integrity (same as uBO; GRAY confirmed no detached .sig exists to do better) | **No** — first run is assets-only; exposure starts at first TTL refresh |
| R3 | Cross-host redirects trusted (observed `adblock.ee` → `ubo-et.lepik.io`); no TLS pinning (lj3 client has timeouts only; `bz8` is just an error classifier). | Med-High | Low-Med (1/12 today) | Same as R2 via a host the map owner doesn't control | AB.7 Estonia URL swap (GRAY byte-verified identical); AB.8 redirect no-follow for the blocklist client | No |
| R4 | `f9.v` `.catch Throwable` fallback returns **plain bytes** → plain text stored under hash name; gzip-assuming readers (`mgp.d`) fail that list until next good refresh. | Med | Negligible | One list broken, per-list parse failure (not startup) | AB.6: fail-closed — delete temp, return failure | No |
| R5 | Double-gzip if a maintainer serves gzip-of-gzip without Content-Encoding (0/12 observed today) → engine single-unzip yields garbage. | Low | Very low | One list garbage | AB.6 optional: inflate-once recheck | No |
| R6 | `f9.v` buffers whole response in RAM (~2 MB EasyList, doubled peak) per download. | Low | — | Transient memory | AB.6 size cap bounds it | No |
| R7 | `f9.u` case-sensitive `equals`; uppercase manifest hashes would silently disable redirects. **Nuance RED missed:** the failure direction is fail-safe — unmapped hash falls back to the *hash-verified* CDN copy, i.e. pre-v12 behavior, no error but no danger. Downgrade to Low. | Low | Very low (37/37 lowercase verified today; risk only if a future manifest regen changes casing) | Silent loss of updater (not integrity) | AB.5 adds case-insensitive lookup in the same touch | No |
| R8 | Baseline size doc drift (see §0.5). | Low (doc) | — | — | Pin correct baselines in RD.4 | No |

### 1.2 Carried from BLUE / GRAY

| ID | Risk | Sev | Likelihood | Blast radius | Mitigation | Blocks ship? |
|----|------|-----|-----------|--------------|------------|--------------|
| B1 | **v12 not device-tested.** Every v12 pipeline guard is host-side; the only unverified seam is the device (BLUE §7). v12's device-delta vs crashing v11 = fixed assets + AB.1–AB.4. | **High** (epistemic) | — | Ship verdict itself | RD.1 protocol; RD.2 bisection tooling | **YES — this is the go/no-go condition** |
| B2 | Play Protect verdict unverifiable host-side (RED §9; BLUE §8.2). Unchanged cert `62c9fa…` is the strongest proxy. | Med | Low (v9/v10 lineage installed without incident per project history) | App flagged/uninstallable on some devices | Part of RD.1 protocol steps | No |
| B3 | Mutable `master`/`main` branch pins rot → silent 404 → per-list failure, last-good file retained (graceful, RED Q2) but list silently freezes. | Med | Med over months | Stale filters, silent | RD.8 (externalized map + per-list last-success surfacing); map currently only fixable by app rebuild (see N6) | No |
| B4 | `blocklists.operacdn.com` public S3 bucket listing (GRAY §4). Opera's exposure, not v12's; stock behavior unchanged. | Low | — | None added by v12 | Out of scope; note in release docs | No |
| B5 | X1/X2 rung verdicts never recorded (BLUE §8.4). | Low (hygiene) | — | Historical ambiguity only | RD.5 formal retirement | No |
| B6 | Carried feature gaps (BLUE §8.5/8.6): VPN padlocked rows/auto-connect/protocol; news banner ads; custom blocklist UI; MiniPay full strip; optional news/live-scores strips; NTP first-paint freeze; preseeded speed-dial 3rd source; adblock % on device; VPN location-menu latency. | Low–Med | — | UX gaps | RD.9 backlog | No |
| B7 | arm64-only variant never built; 84 MB 32-bit `libopera.so` cold-start cost (BLUE §8.6). | Low–Med | — | Performance/size | RD.7 | No |

### 1.3 NEW risks found by BLACK (not in RED/BLUE/GRAY)

| ID | Risk | Sev | Likelihood | Blast radius | Mitigation | Blocks ship? |
|----|------|-----|-----------|--------------|------------|--------------|
| **N1** | **Bisection tooling gap + ledger provenance defect.** No CLI/enabled override (apply.py argv has none); manifest.json is write-only output so editing it is a no-op; all 44 rows claim `version_introduced: v12`, destroying the v10-proven vs v11-new vs v12-new distinction that a crash bisect needs. | Med (blocks efficient incident response) | — | Slow, error-prone bisection exactly when a device crash occurs | RD.2: `--only`/`--disable` CLI flags + hardcode true introduced versions in registry modules | No |
| **N2** | **Injected `<clinit>` runs at f9 class-load on the startup path.** The AB.1 map (37 hashes + 37 URLs built via const/aput in a generated method) executes during adblock init; any latent register/const defect would be a v12-only startup crash. Disabling AB.2–AB.4 alone does not neutralize it. | Med | Low (RED opcode-reviewed the code; build+verify passed) | Startup crash — the exact failure class v12 is supposed to fix | RD.1 prime bisect suspect; stage order in §3 RD.1 respects this | No |
| **N3** | **In-place upgrade over the *crashing* v11 preserves /data.** Unknown whether v11 wrote partial state (prefs from SettingsManager init, or CDN-downloaded list files) before its ~10 s death; `run-as` inspection impossible (non-debuggable release). v12's PD.9/P2.x defaults only seed when prefs are absent — if v11 half-wrote prefs, v12 inherits them. | Low–Med | Unknown | Odd first-run behavior, hard to attribute | RD.1: test BOTH upgrade-over-v11 (user's device) and a fresh-install profile (emulator); if anomalies, one `adb shell pm clear` resets the experiment | No |
| **N4** | **First-launch offline behavior untested.** Only 12 lists ship bundled; the other 32 need network on first run. Offline first launch must degrade gracefully (stock tolerates CDN unreachability, and the v11 crash was manifest-parse, not network — but the patched path is untested). | Low | — | No filtering until online (expected) or hang (unexpected) | RD.1 offline step (airplane mode launch) | No |
| **N5** | **Cross-version storage growth.** Filenames are frozen manifest hashes; a future build with refreshed bundled lists (new hashes) orphans the old hash-named files in app storage (~44 files × up to ~2 MB per build generation, unbounded across releases). Daily TTL=1 refresh also re-downloads ~8–10 MB/day (37 lists, plain-text wire). `renameTo` on Linux replaces atomically (no per-day accumulation), but mid-download crash can orphan temp files. | Low | — | Tens of MB over months | Document; optional v14 cleanup pass; temp-orphan risk bounded by OS-level dir sweep | No |
| **N6** | **URL rot fixable only by shipping a new APK; UI staleness.** The map is 77 const-strings baked into f9's dex — a maintainer moving hosts/renaming a branch requires a full rebuild, and the settings UI reflects the frozen asset manifest regardless of live list state. | Med (maintainability) | Med over months | Slow incident response | RD.8: externalize map to an added asset (`assets/op/updater_map.json`, addition not rewrite — avoids the v11 seam; extend abp_validate to ignore it) | No |
| **N7** | **Release-doc drift surface.** Two byte-identical PATCH-NOTES copies exist (download/, work/); the release copy is a third. Fixing one invites divergence. | Low | — | Users of one copy get stale/false claims | RD.4: single-source the notes (symlink or build-time copy), fix all three in one commit | No |
| **N8** | **v12 is strictly-less-verified than v10 on integrity:** v10 fetched only hash-verified CDN blobs; v12 trusts-on-fetch for 37 lists. Honest framing for release notes (GRAY: same trust model as uBO, accepted — but say it out loud). | Low (accepted model) | — | Trust posture, not new code-exec | RD.3/RD.4 | No |

---

## 2. SHIPPING DECISION

### Verdict: **GO — install v12 on the user's device NOW, with the conditions below.**

Justification:
1. **The device currently runs a build that crashes every launch.** v10 is the fallback but lacks the crash-irrelevant updater work AND re-shipping v10 restores nothing the user is missing; status quo is "no working browser". Doing nothing is the worst option.
2. **The v11 crash fix is the strongest-evidenced claim in the project:** asset layer byte-identical to v9/v10 (RED step5: 19/19 entries), clean full-consume parse (11,682 B, negative control on v11 reproduces the exact defect), and whole-APK diff = 2 dexes + 3 META-INF files only.
3. **The residual crash surface is small and bounded:** v12 = proven v10 substrate + 40-patch set (never on a booting device — acknowledged) + AB.1–AB.4 (opcode-verified, class-set equal, 45,244/45,244). The bisection plan (RD.1) can attribute any failure in ≤3 rebuilds because the v10-proven 17-patch set is trusted and the v12-only delta is 4 patches in 3 files.
4. **R2/R3 are integrity risks with a defined exposure window** (first TTL refresh onward) and a shipped mitigation path (RD.3). They do not create crash or code-execution risk. First run is assets-only and hash-verified by construction.

### Exact conditions (all are RD.1/RD.4 items):
1. **Run the RD.1 device protocol on the user's device within 24 h of install** and record the verdict in STATE.md + a release comment (crash log or boot confirmation + Play Protect screenshot).
2. **Keep `work/recover/…v10-universal.apk` at hand as the pinned rollback** (`adb install -r -d` — equal/lower versionCode reinstall, same cert); note it in the release notes (RD.4).
3. **If v12 crashes:** execute the bisection ladder in RD.1 immediately (v12-b1 … v12-b6); do not iterate blind rebuilds (the F1/F2 lesson).
4. **Do not wipe `sandbox-storage` until the v12 verdict is recorded** (archive policy precondition, BLUE §8.8).
5. **Publish RD.4 doc corrections with the release** (v3-only signature claim; Play Protect wording softened; correct baselines pinned).
6. **Schedule v13 = RD.2 + RD.3 (updater hardening) as the immediate next build**, so the R2 exposure window is minimized.

---

## 3. PRIORITIZED ROADMAP (v13+)

Effort: S = hours, M = 1–2 build sessions, L = multi-session.

### RD.1 — v12 device test protocol (S) — *do first; gates everything*
**Rationale:** the only unverified seam is the device (BLUE §7); every later decision depends on the verdict.
**Placement:** no APK changes; a protocol doc + recorded verdict (`repo-backup/STATE.md` episode + release comment).
**Exact commands** (device = Android 10+; minSdk 29 per `aapt dump badging sdkVersion 29`; package `com.opera.browser.beta`):
```bash
# 0. Pre-flight
adb devices                                  # authorized device present
adb shell getprop ro.build.version.sdk       # expect >= 29 (v12 minSdk)
adb shell dumpsys package com.opera.browser.beta | grep -E "versionName|lastUpdateTime"
                                             # confirm v11 installed (the crashing build)

# 1. Install (in-place over v11; same cert, equal versionCode lineage → -r)
adb install -r download/OperaBeta-104.0.5262.91143-custom-v12-universal.apk
adb shell dumpsys package com.opera.browser.beta | grep -E "versionName|lastUpdateTime"  # lastUpdateTime = now

# 2. Launch + capture
adb logcat -c
adb shell monkey -p com.opera.browser.beta -c android.intent.category.LAUNCHER 1
sleep 30                                     # v11 died ~10 s; give 30 s
adb logcat -b crash -d  > v12-crash.log      # dedicated crash buffer (API ≥ 24; device is ≥29 — fine)
adb logcat -d | grep -iE "FATAL|AndroidRuntime|adblock|abp|vi3|zi3|z4o" > v12-main.log

# 3. Play Protect (device-side, in Play Store UI): avatar → Play Protect → Scan now
#    Expect "No harmful apps found" for com.opera.browser.beta; re-check after 24–48 h.
# 4. Offline first-launch (N4): Settings may need force-stop first:
adb shell am force-stop com.opera.browser.beta
#    enable airplane mode → relaunch via monkey → expect start page, no crash → disable airplane mode
# 5. Updater soak (R2/R3 observation): leave installed ≥ 48 h (TTL=1 day), re-run step 2 log capture,
#    confirm no FATAL and lists still function; record adblock percentage (closes BLUE §8.6 item 3).
# 6. Rollback if needed:
adb install -r -d work/recover/OperaBeta-104.0.5262.91143-custom-v10-universal.apk
```
**Bisection plan if v12 crashes** (uses registry `enabled` flags; **no CLI override exists — apply.py:40–42 takes only mode/roots/version, and manifest.json is output-only, so each variant is produced by editing the `Patch(...)` call sites in `patches/<module>/*.py` to add `enabled=False`, then re-running `apply.py apply` + `apply.py verify`; the regenerated manifest.json/PATCHES.md honestly record what shipped**):
- **v12-b1:** disable AB.1, AB.2, AB.3, AB.4 → "= v11's 40 patches + fixed assets". Boots ⇒ AB group convicted (expected prime suspect).
- **v12-b2:** (if b1 crashes) the 40-patch set or environment is guilty → next disable the v11-new group that has never booted: PD.6, PD.8, PD.9, PD.10, PV.6, PV.7, PT.3, PN.1 (keep the v10-proven 17 + P6/P7/PD.0–5/PA.1/PV.1–5/PV.2–4/PT.1–2). Boots ⇒ that group convicted; then bisect it 4-at-a-time.
- **v12-b3:** (if b1 boots) enable AB.2+AB.3+AB.4, keep AB.1 disabled → isolates whether the injected `<clinit>` (N2) alone kills startup (AB.2–4 are inert without... careful: AB.3/AB.4 call `Lf9;->u`/nothing — AB.4 is unconditional in lj3.b, AB.3 calls f9.v which exists only via AB.1 ⇒ AB.3/AB.4 without AB.1 would be a broken build; the correct single-variable ladder is:) **b3 = AB.1 only** (map + clinit + helpers, but fetch URL unchanged → CDN + strict gate... note AB.4 must be OFF here or the gate stays off — with AB.1-only the gate bypass const is still absent only if AB.4 disabled; AB.3 would reference a missing method if AB.1 off — so b3 = {AB.1, AB.3, AB.4}, b4 = {AB.1, AB.4}, b5 = {AB.4} — each adds exactly one behavior: b3 isolates `<clinit>`+URL-redirect+normalizer, b4 removes the normalizer, b5 removes the URL redirect leaving only the gate bypass. Boots-through order localizes the culprit to one patch.
- Every variant: `apply.py verify` must pass for the enabled set before signing; keep variant APKs + regenerated ledgers in the episode record.
**Acceptance criteria (machine-checkable):** `v12-crash.log` contains zero `AndroidRuntime: FATAL` lines for `com.opera.browser.beta`; verdict line recorded in STATE.md; Play Protect screenshot archived; `sandbox-storage` wipe decision recorded per policy.

### RD.2 — Bisection tooling + ledger provenance fix (S)
**Rationale:** N1; make the next incident response cheap and auditable.
**Placement:** `patches/apply.py` (CLI), `patches/common.py` (no change), all `patches/*/​*_patches.py` (version literals).
**Content:** add argv flags `--disable AB.4,AB.3` / `--only P1,...` / `--list` that set `p.enabled` post-registry-build (10–20 lines); hardcode true `version_introduced` per patch (P1="v5", P6/P7="v6", P2.x="v10", v11 group="v11", AB.*="v12") instead of accepting the build version; `--disable` state recorded in manifest.json output.
**Acceptance:** `python3 patches/apply.py apply c1 c3 v13 --disable AB.4` prints `SKIP AB.4`; regenerated `manifest.json` shows `"enabled": false` for exactly that patch and correct `version_introduced` for all; `apply.py verify` passes for enabled set.

### RD.3 — Updater hardening pack (v13 core) (M)
**Rationale:** R2/R3/R4/R6/R7 + GRAY structural note; minimize trust-on-fetch window. All dex-side — **no asset changes** (v11 seam avoided).
**Placement:** `patches/adblock/updater_redirect.py` (AB.5–AB.8, continuing the ledger), `patches/adblock/updater_map.json`.
- **AB.5 — scoped checksum gate (mapped-only bypass).** Replace AB.4's unconditional `const/4 v3, 0x1` with a conditional: after `Intrinsics.a(...) / move-result v3`, insert `invoke-static {p1}, Lf9;->w(Ljava/lang/String;)Z / move-result v4 / or-int v3, v3, v4` (bump `.registers` if the free-register audit requires — RED confirmed v3 is scratch only). New `f9.w(hash)Z`: case-insensitive membership test against V (use `equalsIgnoreCase`/`toLowerCase(Locale.ROOT)` — fixes R7 in the same touch); true ⇒ maintainer-mapped (mismatch allowed); false ⇒ CDN path keeps the **strict** SHA-256 equality (stock behavior restored for all 9 fallback lists + 42 ADBLOCK_CSS lists).
- **AB.6 — `f9.v` hardening (fail-closed).** In the rewrap path: (a) reject bodies > 16 MB before gzip (size cap, R6); (b) sniff payload: gzip magic OK; else require first non-whitespace byte ∈ {`[`, `!`, `-`, `|`} or ASCII — reject `<`/HTML soft-200 (treat as failure: throw IOException so cv2 returns `Result.failure` and **lj3.b is never invoked ⇒ no temp file, nothing stored**); (c) delete the `.catch Throwable` fallback that returns plain bytes (R4) — on Throwable rethrow IOException instead; (d) optional: one inflate-recheck to refuse double-gzip (R5).
- **AB.7 — Estonia URL swap.** Edit `updater_map.json`: `regional_estonia` → `https://raw.githubusercontent.com/sander85/uBO-et/master/list.txt` (GRAY: byte-identical sha256, removes cross-host redirect = R3's only live instance). Map is generated into AB.1's `<clinit>` by the module, so this is a JSON edit + rebuild; ledger `replacement_sha` updates automatically.
- **AB.8 — redirect policy.** Build the blocklist OkHttp client (lj3 `<init>`) with `.followRedirects(false)` and `.followSslRedirects(false)`: post-AB.7, 0/12 mapped URLs redirect (GRAY), CDN is direct ⇒ any future redirect becomes a loud per-list failure instead of a silent trust decision. Any maintainer that legitimately starts redirecting resurfaces as a visible 404-class failure, not poisoning.
**Acceptance (machine-checkable):** `apply.py verify` passes 47/47; `rg -c "adblock\.ee" work/v13/build-c3/f9.smali` = 0; `rg -c "const/4 v3, 0x1" work/v13/audit-c3/lj3.smali` after the Intrinsics site = 0 while `rg -c "Lf9;->w"` = 1; `scripts/abp_validate.py` still OK (assets untouched, assert byte-identical v9 assets in build script); device soak 48 h with zero `SHA256 checksum mismatch` on CDN-fallback lists and no FATAL; simulate soft-200 host-side (local HTTP server returning HTML for a mapped hash) ⇒ no new file stored in the lists dir (inspect via device file manager or `adb shell ls` on a debuggable test build).
**Also v13:** refresh `PATCH-NOTES-v13.md` honestly (see RD.4 template).

### RD.4 — Doc corrections + release hygiene (S)
**Rationale:** R1/R8/N7; release auditability.
**Content:**
1. Fix "Signature: v1+v2+v3" → "Signature: v3-only (apksigner: v1=false, v2=false, v3=true; META-INF v1 files present but non-verifying; fine on Android 10+)" — in `download/PATCH-NOTES-v12.md`, `work/PATCH-NOTES-v12.md`, and the GitHub release copy **in one commit** (N7).
2. Soften Play Protect claim → "unverified on device; unchanged v10-lineage certificate" until RD.1 produces evidence.
3. Pin correct baselines in release notes: `v9-unsigned.apk` = 150,461,969 B / sha256 `eedebe11…b5ebd`; signed `recover/…v9-universal.apk` = 151,011,905 B (RED R8 — the wrong figure appears in no project doc; pin the right ones going forward).
4. Release housekeeping: upload the corrected PATCH-NOTES + `work/OperaBeta-104_v12_patch-bundle.zip` (PATCHES.md + manifest.json) to the GitHub release; state the trust model honestly ("mapped lists trust TLS + maintainer repos, like uBlock Origin; CDN fallback stays hash-verified"); **pin v10 as the documented fallback with its sha256 and the `adb install -r -d` rollback command**; hold the `sandbox-storage` wipe until the v12 device verdict is recorded (BLUE §8.8).
**Acceptance:** `rg -n "v1\+v2\+v3" download/ work/` → 0 hits; release assets list contains patch-bundle + notes with matching sha256; both PATCH-NOTES copies byte-identical again (`diff -q` rc=0).

### RD.5 — Close stale open items (S)
**Rationale:** BLUE §8.4–8.6; zero-risk hygiene.
**Content:** (1) Record X1/X2 as **retired-superseded** (era-B P1 achieves the first-run skip differently and is device-proven in v10) — a STATE.md paragraph, no rebuild. (2) Record v12 device verdict (RD.1 output). (3) Triage the carried feature gaps into RD.9 with the v7 feedback items (NTP first-paint freeze; preseeded speed-dial third source; adblock % on device — closed by RD.1 step 5; VPN location-menu latency).
**Acceptance:** STATE.md contains explicit verdict lines for X1, X2, v12; open-items list in next PATCH-NOTES matches RD.9.

### RD.6 — arm64-only variant (M)
**Rationale:** BLUE §8.6 — 84 MB 32-bit `libopera.so` cold-start cost on arm64 devices (the user's likely hardware).
**Placement:** new build script variant (no new patch modules; reuses apply.py as-is).
**Content:** build `…v13-arm64.apk` = base + only `arm64-v8a` split libs (drop armeabi-v7a .so), same 44+ patches, same cert — separate package is NOT needed if using the same applicationId with abi filters... (note: same applicationId cannot coexist with different abi sets as separate installs; it *replaces* — acceptable for a personal build; if coexistence wanted, change applicationId and lose in-place upgrade — recommend replacement).
**Acceptance:** `aapt dump badging` shows `native-code: 'arm64-v8a'` only; class-set equality 45,244/45,244; boots on device; size delta vs 151,163,457 B recorded (~−40–60 MB expected); verify_v9.py PASS adapted.
**Answer to BLUE's question:** yes, worth building — but **after** RD.3, and it must carry the full v13 patch set to avoid a v9-style behavioral fork.

### RD.7 — Externalized updater map + smarter TTL (v14, M)
**Rationale:** N6/B3 — URL rot currently requires a full APK rebuild; TTL=1 fixed at 1 day ignores maintainers' `! Expires:` headers (uAssets: 5 days; quick-fixes: 8 h).
**Placement:** new AB.9 (f9.u: check an optional asset override map `assets/op/updater_map.json` before the baked V/W arrays) + optional AB.10 (parse `! Expires:` from fetched content to throttle re-fetch). **Asset addition, not rewrite** — byte-exact stock assets untouched elsewhere; extend `scripts/abp_validate.py` to whitelist the new file.
**Acceptance:** with the override asset present, mapped fetch hits the override URL (verify via a test host); without it, behavior identical to v13 (regression: unchanged file hashes for all other assets); `apply.py verify` PASS.
**Caveat:** ship only after the v13 soak proves the dex-side map is the actual maintenance bottleneck.

### RD.9 — Feature backlog (L, unscheduled)
From BLUE §8.5/8.6, priority order: custom blocklist management UI (pairs naturally with RD.7 — the engine already accepts custom lists per the v1.3.2 recon) > news-section banner ads > VPN padlocked rows/auto-connect/protocol on-device confirmation > MiniPay full strip > optional news/live-scores strip modules (`patches/optional/` is scaffolded; `strip.strip_patches` hook already stubbed in apply.py:35) > NTP first-paint freeze > preseeded speed-dial third source > VPN location-menu latency.
**Acceptance:** per-item ledger entries with device-verdict recording, same discipline as RD.1.

---

## 4. Evidence appendix (commands run this session)

- `patches/apply.py`, `patches/common.py`, `patches/adblock/updater_redirect.py`, `patches/core/core_patches.py` read in full → enabled-flag semantics (apply.py:48–51 SKIP, verify:62–64 skip; no CLI override, argv only at :40–42; manifest.json written at :55–58, read nowhere).
- `python3` Counter over `patches/manifest.json`: `version_introduced` = `{'v12': 44}`; AB.1–AB.4 all `enabled: true`.
- `diff -q download/PATCH-NOTES-v12.md work/PATCH-NOTES-v12.md` → rc=0 (identical).
- `rg -l "151,011,905"` over download/work/audit-reports/patches → only RED's report.
- `rg -c ".method static constructor <clinit>" work/audit/c3/f9.smali` → 1 (the injected one).
- `sed -n '100,110p' patches/adblock/updater_map.json` → estonia entry confirmed (`5d0dd56b…ecdf` → `adblock.ee/list.php`).
- `ls scripts/` → `abp_validate.py`, `verify_v9.py`, `probe_blocklist_urls.py`, `resolve_remaining_urls.py` (acceptance-tool inventory).
- All RED/BLUE/GRAY findings cross-checked against their reports; nothing in their condensed briefs was found misrepresented (one downgrade: R7 is fail-safe, not fail-silent-dangerous — see §1.1).
- No files outside this report were modified. No tokens touched.
