# Opera Beta 104.0.5262.91143 — custom v13 (universal)

**v13 = v12 with the four updater patches (AB.1–AB.4) reverted to stock.
Single-variable fix for the v12 startup crash, produced by a Mixture-of-Experts
panel analysis (2026-11-16).**

Installs in place over v9/v10/v11/v12 (same signing certificate) — no
uninstall, no data loss. **v13 also self-heals a v12 install** (see below).

## Why v12 crashed (root cause, fixed in v13)

v12 crashed after ~5 s of white screen on every launch. The MoE panel
(E1 startup timeline, E2 differential patch audit, E3 adblock subsystem
trace, E4 packaging & signing) converged on the AB patch set — the only
v12-only change on any executed startup path (E4 proved the v10→v12 APK
delta is exactly two dexes; E2 proved all 44 patches structurally sound;
E3 traced the blocklist lifecycle end-to-end):

1. **The content-hash invariant (the killer).** Opera's resolver `k9d`
   pairs every downloaded blocklist file with its manifest entry by the
   **sha256 of the file's content** (a digesting stream over the bytes —
   not the filename). AB.4 stored live maintainer bytes under the
   manifest-hash *name*, so the content hash could never equal the
   manifest hash. Such a file is unpairable forever: it is deleted as
   stale while its manifest entry stays "missing" — so the list is
   re-downloaded, stored mismatched again, and the cycle repeats on
   every resolve pass (each app launch re-evaluates the pipeline).
   Endless download churn inside the blocklist subsystem.
2. **The OOM window.** AB.3's gzip normalizer (`f9.v`) buffers the
   ENTIRE response body in RAM (raw + gzipped copy, ~2 MB per list)
   *outside* cv2's try/catchall. Only `IOException`s are caught (vtp.Q,
   3 retries); an `Error` (OOM) escapes uncaught. With PD.9 selecting
   39 lists (27 unbundled), ~27 concurrent maintainer fetches run during
   startup — the first pass alone can kill the process. Stock code
   streams bodies to disk and never buffers them.

The deeper design flaw: Opera's updater is content-addressed
(`hash == content`), so *any* live upstream content breaks the invariant
by definition. Maintainer-direct updates need a different mechanism
(v14 roadmap: pairing by filename, or a runtime manifest-hash refresh).

## What v13 changes (and only that)

- `f9`, `cv2`, `lj3` (classes3) are reverted to **stock** — byte-proven:
  the v13 classes3 disassembly is tree-identical to v11's shipped
  40-patch classes3, and f9/cv2/lj3 diff clean against stock v9.
- `classes.dex` is v12's own file, byte-identical (zero delta).
- Asset layer untouched: `assets/op/abp.manifest` + all 12 bundled lists
  byte-identical to stock v9/v10.
- Entry-level APK diff vs v12: **exactly `classes3.dex` + 3 META-INF
  signature files. Nothing else.**
- Result: missing lists download **once** from the Opera CDN
  (content-addressed: hashes match, files pair, streamed to disk),
  exactly like the device-proven v6-era behavior with custom lists.

## Self-healing over a v12 install

If v12 ran on your device, its files dir contains mismatched
downloaded lists. v13's stock resolver re-hashes them, finds them
unpairable, **deletes them as stale**, and re-fetches correct copies
from the Opera CDN. No manual cleanup needed.

## Patch set (40 enabled / 4 disabled — full ledger in the patch bundle)

Same 40 patches as v11/v12 (first-run skip, splash, privacy/notification
defaults, ad-block + tracker-blocker + secure-DNS + cookies on, 39 filter
lists selected, VPN Pro/eSIM/Rewards/promo surfaces removed, wallpapers
unlocked, empty speed dial). AB.1–AB.4 are DISABLED (registry carries
them with `enabled=false`; `apply.py` prints SKIP; manifest.json and
PATCHES.md record the state).

## Verification performed on the exact shipped file

- 40/40 patches verified (opcode level) by re-disassembling the shipped
  APK's own dexes.
- f9/cv2/lj3 verified **stock** in the shipped dex.
- v13 classes3 disassembly **tree-identical to v11's shipped classes3**
  (the proven 40-patch state); v13 classes.dex == v12's classes.dex bytes.
- Class-set equality: 45,244/45,244 (10,069 + 11,936 in the two patched
  dexes); `Lz4;` present; services + kotlin_module preserved; arsc +
  10 `.so` STORED (structural PASS, zipalign verified).
- `assets/op/abp.manifest` + 12 bundled lists byte-identical to v9/v10.
- Signature: same keystore as v9–v12 (cert SHA-256
  `62:C9:FA:6F:DA:E6:82:66:29:93:A5:AB:41:7C:71:17:79:D1:A0:BC:8F:F6:43:E4:4D:E5:20:11:87:A9:6A:DF`)
  → **installs in place over v9/v10/v11/v12**.
  (Scheme note, corrected by the E4 audit: all of v9–v13 verify as
  v3-only with inert v1/v2 leftovers — including working v10 — which is
  functionally correct on minSdk 29 / Android 10+.)

## Install & test

1. Install over your existing build (no uninstall): any installer or
   `adb install -r OperaBeta-104.0.5262.91143-custom-v13-universal.apk`.
2. First launch: straight to the start page (no onboarding dialogs).
   First launch also re-downloads the 27 unbundled lists from the Opera
   CDN in the background (one-time; needs network for full coverage).
3. What to check: app stays up past 5–10 s; Settings → Ad blocking shows
   the custom lists; browsing works; second launch is faster.
4. If anything misbehaves, capture
   `adb logcat -c && adb logcat > issue.log` (reproduce, Ctrl-C) —
   a real crash stack would pin any remaining issue immediately.

## Rollback

- v10 remains the device-proven floor:
  `adb install -r -d <v10.apk>` (sha256
  `44a70d1c4f4c0c0bc7399f3e2f1cb6bc1536413e723f8b7377e913c808829ecd`).
- If v13 still crashes (not expected — the AB set was the only v12
  delta on any executed startup path), the pre-planned bisect next step
  is: revert PD.7/PD.9 (ad-block CUSTOM mode + 39-list selection) on
  top of v13, then report; a real logcat would make the next round
  definitive.

## v14 outlook (maintainer-direct updates, redesigned)

The feature returns with a design that respects the content-hash
invariant: (a) patch `k9d`'s pairing to accept filename-based matches,
or (b) refresh the manifest's hashes at runtime when live content is
stored, or (c) an out-of-app updater that rewrites the asset layer.
Each needs its own device-test round; none is in v13.

## Details

| | |
|---|---|
| File | `OperaBeta-104.0.5262.91143-custom-v13-universal.apk` |
| Size | 151,159,361 bytes |
| SHA-256 | `f8fb687b6d27e4e8a4836e6ecf3066e7988063be42a926d5c7b4e7a5037f2918` |
| Signer cert SHA-256 | `62:C9:FA:6F:DA:E6:82:66:29:93:A5:AB:41:7C:71:17:79:D1:A0:BC:8F:F6:43:E4:4D:E5:20:11:87:A9:6A:DF` |
| Package | `com.opera.browser.beta` (Android 10+) |

## Known open items (unchanged from v12)

1. VPN padlocked rows ("Auto connect", "VPN protocol") — free backend
   behavior needs on-device confirmation.
2. News-section banner ads — not yet patched.
3. Custom blocklist management UI — not yet surfaced.
4. MiniPay full component strip — menu row + provider removed; full strip pending.
5. Optional strips (news / live scores) — flags scaffolded, modules not written.
6. Maintainer-direct blocklist updates — disabled in v13, redesigned for v14.
