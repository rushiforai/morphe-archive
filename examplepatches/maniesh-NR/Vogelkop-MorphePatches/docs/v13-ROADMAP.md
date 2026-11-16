# v13+ roadmap — post-audit (2026-11-16)

Produced by the BLACK adversarial agent (risk officer) and adopted as the
project roadmap after the 2026-11-16 four-agent audit
([audit synthesis](audit/2026-11-16-adversarial-review/SYNTHESIS.md)).
Effort: S = hours, M = 1–2 build sessions, L = multi-session.

## RD.1 — v12 device test protocol (S) — do first; gates everything

The only unverified seam is the device. Exact commands (device = Android 10+;
minSdk 29; package `com.opera.browser.beta`):

```bash
# 0. Pre-flight
adb devices
adb shell getprop ro.build.version.sdk                    # expect >= 29
adb shell dumpsys package com.opera.browser.beta | grep -E "versionName|lastUpdateTime"

# 1. Install (in-place over v11; same cert → -r)
adb install -r OperaBeta-104.0.5262.91143-custom-v12-universal.apk
adb shell dumpsys package com.opera.browser.beta | grep lastUpdateTime    # = now

# 2. Launch + capture
adb logcat -c
adb shell monkey -p com.opera.browser.beta -c android.intent.category.LAUNCHER 1
sleep 30                                                  # v11 died ~10 s
adb logcat -b crash -d > v12-crash.log
adb logcat -d | grep -iE "FATAL|AndroidRuntime|adblock|abp|vi3|zi3|z4o" > v12-main.log

# 3. Play Protect (Play Store UI): avatar → Play Protect → Scan now
#    Expect "No harmful apps found"; re-check after 24–48 h.

# 4. Offline first-launch: force-stop, enable airplane mode, relaunch,
#    expect start page + no crash, disable airplane mode.

# 5. Updater soak: leave installed >= 48 h (TTL = 1 day), re-run step 2,
#    confirm no FATAL and lists still function; record adblock %.

# 6. Rollback if needed:
adb install -r -d OperaBeta-104.0.5262.91143-custom-v10-universal.apk
```

**Bisection plan if v12 crashes** (no CLI override exists yet — RD.2 adds
`--disable/--only`; today each variant is produced by adding `enabled=False`
to the specific `Patch(...)` call site in `patches/<module>/*.py`, then
`apply.py apply` + `apply.py verify`):

- **v12-b1:** disable AB.1–AB.4 → "v11's 40 patches + fixed assets". Boots ⇒
  AB group convicted (expected prime suspect; N2: AB.1's `<clinit>` is the
  only v12-only startup-path code).
- **v12-b2:** if b1 crashes, disable the v11-new group that has never booted
  (PD.6, PD.8, PD.9, PD.10, PV.6, PV.7, PT.3, PN.1), keeping the v10-proven
  set; then bisect that group 4-at-a-time.
- **v12-b3:** {AB.1, AB.3, AB.4} → isolates `<clinit>` + URL redirect +
  normalizer. **v12-b4:** {AB.1, AB.4} → removes the normalizer.
  **v12-b5:** {AB.4} → leaves only the gate bypass. Boots-through order
  localizes one patch.

**Acceptance:** zero `AndroidRuntime: FATAL` lines for the package; verdict
recorded in STATE.md + release; Play Protect evidence archived.

## RD.2 — Bisection tooling + ledger provenance fix (S)

`patches/apply.py`: add `--disable AB.4,AB.3` / `--only P1,...` / `--list`
(10–20 lines; set `p.enabled` post-registry-build). Registry modules:
hardcode the TRUE `version_introduced` per patch (P1="v5", P6/P7="v6",
P2.1–P2.9/P3/P4/P5*="v10", PD.6/PD.8/PD.9/PD.10/PV.6/PV.7/PT.3/PN.1="v11",
AB.1–AB.4="v12") instead of the build version — today all 44 rows claim v12,
which destroys the proven/never-booted distinction a bisect needs.
**Acceptance:** `--disable AB.4` prints `SKIP AB.4`; regenerated
manifest.json shows `"enabled": false` for exactly that patch; verify passes.

## RD.3 — Updater hardening pack (M) — v13 core

All dex-side; no asset changes (v11 seam avoided).

- **AB.5 — scoped checksum gate.** Replace AB.4's unconditional
  `const/4 v3, 0x1` with: `invoke-static {p1}, Lf9;->w(Ljava/lang/String;)Z`
  → `move-result v4` → `or-int v3, v3, v4`. New `f9.w(hash)Z`: case-insensitive
  membership in the map (fixes R7) — mapped hash ⇒ mismatch allowed; unmapped
  (CDN fallback + all 42 ADBLOCK_CSS) ⇒ strict SHA-256 restored (stock).
- **AB.6 — `f9.v` fail-closed.** (a) reject bodies > 16 MB; (b) sniff payload:
  gzip magic OK, else first non-whitespace byte must be ABP-syntax-ish
  (`[`, `!`, `-`, `|` or ASCII) — reject HTML soft-200 by throwing IOException
  ⇒ cv2 returns failure, nothing stored; (c) delete the `.catch Throwable`
  plain-bytes fallback (rethrow instead); (d) optional inflate-recheck against
  double-gzip.
- **AB.7 — Estonia URL swap.** `updater_map.json`:
  `regional_estonia` → `https://raw.githubusercontent.com/sander85/uBO-et/master/list.txt`
  (GRAY byte-verified identical; removes the only live cross-host redirect).
- **AB.8 — redirect policy.** Build the blocklist OkHttp client with
  `.followRedirects(false)` + `.followSslRedirects(false)`: future redirects
  become loud per-list failures instead of silent trust decisions.

**Acceptance:** `apply.py verify` 47/47; no `adblock.ee` in built f9.smali;
no unconditional `const/4 v3, 0x1` at the lj3 Intrinsics site while
`Lf9;->w` appears once; `abp_validate.py` OK (assets untouched); 48 h soak
with zero `SHA256 checksum mismatch` on CDN-fallback lists; simulated
soft-200 host stores nothing.

## RD.4 — Doc corrections + release hygiene (S)

Done in the 2026-11-16 audit commit: signature scheme corrected (v3-only) in
both PATCH-NOTES copies + release; v10 baseline pinned with full sha256 and
rollback command; audit published. Remaining: keep the two PATCH-NOTES copies
byte-identical going forward (single-source at build time); state the trust
model honestly in every release ("mapped lists trust TLS + maintainer repos,
like uBlock Origin; CDN fallback stays hash-verified").

## RD.5 — Close stale open items (S)

STATE.md verdict lines for X1/X2 (**retired-superseded** — Era-B P1 achieves
the first-run skip differently and is device-proven in v10) and for the v12
device result (RD.1 output); triage carried feature gaps into RD.9.

## RD.6 — arm64-only variant (M)

Drop `armeabi-v7a` libs (84 MB 32-bit `libopera.so` cold-start cost), same
patches, same cert, same applicationId (replaces in place). Only after RD.3;
must carry the full patch set (v9 lesson). **Acceptance:** `aapt dump badging`
shows `native-code: 'arm64-v8a'` only; class-set equality; boots.

## RD.7 — Externalized updater map + smarter TTL (M, v14)

AB.9: optional asset override map (`assets/op/updater_map.json` — addition,
not rewrite) checked by `f9.u` before the baked arrays; AB.10: parse
`! Expires:` headers to throttle re-fetch (uAssets: 5 days; quick-fixes: 8 h).
Ship only if the dex-side map proves to be the maintenance bottleneck.

## RD.9 — Feature backlog (L, unscheduled)

Custom blocklist UI (pairs with RD.7) > news banner ads > VPN padlocked rows
confirmation > MiniPay full strip > optional news/live-scores strips
(`patches/optional/` scaffolded; `strip.strip_patches` hook stubbed) > NTP
first-paint freeze > preseeded speed-dial third source > VPN location-menu
latency.
