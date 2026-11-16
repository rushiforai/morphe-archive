# Opera Beta 104.0.5262.91143 — custom v12 (universal)

**v12 = v11's full patch set with the startup crash fixed, plus blocklist
updates that now come directly from the original maintainers
(uBlock-Origin-style) instead of Opera's CDN.**

Installs in place over v9/v10/v11 (same signing certificate) — no uninstall,
no data loss.

## Why v11 crashed (root cause, fixed in v12)

v11's new adblock-asset pipeline rebuilt `assets/op/abp.manifest` with a
parser that only understood the manifest's *first* section. While removing
the acceptable-ads entries it also deleted an `opera_fixes` entry that lived
in the manifest's **ADBLOCK_CSS section (42 entries)** — without fixing that
section's count. Every launch, Opera's parser hit the misaligned bytes,
threw a parse exception and fell back to an **empty manifest (null download
base)** — the blocklist subsystem failed during engine init: white screen
~10 s, then crash. Confirmed by re-implementing Opera's parser
(`z4o.l0`) byte-for-byte: the v11 manifest fails at `ADBLOCK_CSS[41]`,
the v9/v10 stock manifest parses cleanly.

**Fix:** v12 ships the exact stock v9/v10 asset layer — `abp.manifest` and
all 12 bundled list files are byte-identical to v9/v10 (verified). The
"no acceptable-ads" behavior is preserved where it matters: the acceptable-
ads allowlists and opera_fixes are simply *not selected* (PD.9), exactly as
in the proven v6/v7 lineage.

## New in v12: blocklist updates direct from the maintainers

Opera's updater is content-addressed: the manifest pins each list's SHA-256
and downloads `https://blocklists.operacdn.com/<sha256>`. Because the
manifest ships in assets, lists could never change between app updates.
v12 patches the updater (`f9`, `cv2`, `lj3` in classes3) so that:

1. **URL redirect** — each list's fetch is resolved through a build-time map
   from the manifest hash to the maintainer's live URL (37 lists verified
   live: HTTP 200 + genuine filter content). Unmapped hashes keep the Opera
   CDN URL as a working fallback.
2. **Gzip normalization** — the engine stores/serves gzipped lists;
   maintainer payloads (plain text) are gzipped before storage, already-gzip
   payloads pass through.
3. **Checksum gate** — the strict "downloaded bytes must equal the manifest
   hash" check is disabled (mandatory for live upstream content). The file
   is still stored under the manifest hash, so the engine and the blocklist
   database stay fully consistent, and the TTL scheduler refreshes each list
   from its maintainer automatically.

Mapped lists (update straight from the maintainer):

| List | Maintainer URL |
|---|---|
| EasyList | `easylist.to/easylist/easylist.txt` |
| EasyPrivacy (tracker blocker) | `easylist.to/easylist/easyprivacy.txt` |
| uBlock | uBlockOrigin/uAssets `filters.txt` |
| NoCoin | hoshsadiq/adblock-nocoin-list |
| Fanboy Cookie/Cookie-Monster (CDB) | `secure.fanboy.co.nz/fanboy-cookiemonster.txt` |
| AdGuard Ads | AdGuard Base filter (without EasyList) |
| AdGuard Mobile Ads | AdGuard filter 11 |
| FR / ES+PT / NL / TR / JP / CN regional | AdGuard official filters (14/9/8/13/7/10) |
| Germany / Italy / Russia | EasyList family (easylist-downloads.adblockplus.org) |
| Arabic (Liste AR), Thailand, Slovenia, Albania, Finland, Persia, Romania, Bulgaria, Greek, Serbia/Croatia, Estonia, Indonesia, Lithuania, Czech+Slovak, Norway, Latvia, Hebrew, Poland, Hungary (hufilter), Vietnam (ABPVN), Sweden | each repo's own live file (raw.githubusercontent / official site) |

Not mapped (keep the working Opera CDN copy — no live single-file upstream):
uBlock (minimal), India, Macedonia, Iceland, Korea (List-KR publishes
split files only), plus Opera-internal lists (opera_fixes, tier1/tier2
allow-rules, testcase — none of which are selected anyway).

## Full patch set (44 — all verified inside the shipped signed APK)

Same 40 patches as v11 (first-run skip, splash, privacy/notification
defaults, ad-block + tracker-blocker + secure-DNS + cookies on, 39 filter
lists selected, VPN Pro/eSIM/Rewards/promo surfaces removed, wallpapers
unlocked, empty speed dial) **plus AB.1–AB.4** (maintainer-direct blocklist
updates). The complete machine-readable ledger ships in the patch bundle:
`patches/PATCHES.md` + `patches/manifest.json`.

## Verification performed on the exact shipped file

- `classes.dex` / `classes3.dex` inside the signed APK are **byte-identical**
  to the assembled patched dexes.
- Re-disassembly of the shipped APK's dexes → **all 44 patches verified**
  (opcode level).
- Class-set equality: 45,244/45,244 classes, `Lz4;` present; services +
  kotlin_module preserved; arsc + 10 `.so` STORED (structural PASS).
- `assets/op/abp.manifest` and all 12 bundled lists are **byte-identical to
  the working v9/v10 files**.
- Signature: **v3 scheme only** (apksigner: v1=false, v2=false, v3=true; the
  META-INF v1 files are present but non-verifying) — functionally correct for
  this build's Android 10+ (minSdk 29) target; certificate identical to
  v9/v10/v11 (SHA-256
  `62:C9:FA:6F:DA:E6:82:66:29:93:A5:AB:41:7C:71:17:79:D1:A0:BC:8F:F6:43:E4:4D:E5:20:11:87:A9:6A:DF`)
  → **installs in place over v9/v10/v11**.
- Updater flow simulated end-to-end (fetch from maintainer → gzip → store
  under manifest hash) with live fetches of EasyList, EasyPrivacy, RUAdList.
- **Independent adversarial audit (2026-11-16, 4-agent RED/BLUE/GRAY/BLACK
  panel)**: all 44 patches, the class-set equality and the v11-crash-fix
  asset-layer claims re-verified from the shipped bytes — the fix holds
  (`docs/audit/2026-11-16-adversarial-review/` in the repo). Residual risks
  and the go/no-go conditions (device test protocol, v13 updater hardening)
  are recorded there. Known doc correction in these notes: the signature
  scheme line above (was wrongly listed as v1+v2+v3).

## Install

1. Install the APK over your existing Opera Beta custom build (no uninstall).
2. First launch: straight to the start page (no dialogs). Play Protect may
   scan silently; the signature is unchanged from v10.
3. Blocklists: the selected lists load from the bundled/CDN copies on first
   run and refresh from their maintainers on the usual schedule afterwards.

## Rollback

The last device-proven build remains v10
(`OperaBeta-104.0.5262.91143-custom-v10-universal.apk`, sha256
`44a70d1c4f4c0c0bc7399f3e2f1cb6bc1536413e723f8b7377e913c808829ecd`):
`adb install -r -d <v10.apk>` downgrades in place (same certificate) if v12
misbehaves.

## Details

| | |
|---|---|
| File | `OperaBeta-104.0.5262.91143-custom-v12-universal.apk` |
| SHA-256 | `299e46406e1f0ea66f8d79c2ee874be2313607c6fda1d4206887390f6e63b8ac` |
| Package | `com.opera.browser.beta` (Android 10+) |

## Known open items (unchanged from v11)

1. VPN padlocked rows ("Auto connect", "VPN protocol") — free backend
   behavior needs on-device confirmation.
2. News-section banner ads — not yet patched.
3. Custom blocklist management UI — not yet surfaced.
4. MiniPay full component strip — menu row + provider removed; full strip pending.
5. Optional strips (news / live scores) — flags scaffolded, modules not written.
