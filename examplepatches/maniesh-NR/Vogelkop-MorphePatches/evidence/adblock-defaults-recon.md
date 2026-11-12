# Adblock defaults + Secure DNS recon (v1.3.2 #8)

Date: 2026-11-12 · Substrate: Opera **beta 104.0.5262** base.apk (classes3.dex
for all named classes; verified same `abp.manifest` bytes in **stable
103.3.5234** — sha256 `d75fb6859a440bb43593fac72a391659c368a625f0ff9967ff00393d17ae8cc6`,
byte-identical). GX has no `abp.manifest` (WebView app) — patch is
stable+beta only.

Toolchain this session (fresh sandbox): jadx 1.5.2 (`/.tools/jadx-1.5.2`),
baksmali 3.0.10 (`/.tools/baksmali.jar`), dumps under `/.tools/recon/`
(`jadx-beta` partial, `jadx-c1` = classes.dex, `jadx-c3` = classes3.dex,
`smali-c1`, `smali-c3`).

## 1. Where the list catalog + per-mode defaults live

`assets/op/abp.manifest` — a length-prefixed binary, parsed by
`zi3.h()` → `z4o.l0(izd)` (classes3; `izd` = DataInputStream helper:
`h()` = u16-len string, `k()` = u32, plus readInt/readShort/readByte).
Format (reverse-engineered, round-trip byte-exact — see
`scripts/abp_manifest_patch.py`):

```
int32 head(0) | str base_url | 4 sets: u16 count + (str name, str sha256)
  sets in order: ADBLOCK_URL, CDB_URL, TRACKER_URL, ADBLOCK_CSS  (sj3 enum)
int16 s | u32 meta_count | per meta: u32 blob_len; blob {
  str name; u32 meta_len(0=none); meta { int32 MODE_BITMASK; u8 category;
    str s1; str s2; str s3 }; int32 version; int16 ts }
```

- `MODE_BITMASK`: bit0 = on in BALANCED, bit1 = on in ENHANCED; other bits
  exist (bit3 = 8 seen on tier2/ublock_min — internal flag, preserved).
  CUSTOM mode ignores the bitmask (see §2).
- category (`ti3`): 0 RECOMMENDED, 1 OTHER, 2 REGIONAL.
- List names appear in BOTH the ADBLOCK_URL set (network rules) and the
  ADBLOCK_CSS set (element-hiding rules) — two different compiled files,
  that's why the raw byte stream shows each name with two hashes.

Stock (both stable 103 + beta 104) mode map:

| mode | lists on |
|---|---|
| BALANCED (bit0) | easylist, nocoin, ublock_min, opera_fixes, tier1+tier2_allow_rules, testcase |
| ENHANCED (bit1) | easylist, nocoin, opera_fixes, ublock, adguard_mobile_ads, tier1+tier2, testcase |
| (bitmask 0 — CUSTOM-only) | **all 34 regional_\*, adguard_ads** |
| CDB_URL set | fanboy-cookiemonster (follows `banner_blocker` toggle) |
| TRACKER_URL set | easyprivacy (follows `tracker_blocker` toggle) |

Update base URL: `https://blocklists.operacdn.com/` (hash-addressed files
— old hashes stay downloadable, so pinning our catalog keeps updates working).

`opera_fixes` ("Opera Ad Blocker Site Fixes") is [BE] RECOMMENDED and its
bundled compiled assets (`2add4739…` = mixed net rules + IN_WHITE/ELEMHIDE
exceptions; `bf14726e…` = third-filter net rules) contain whitelist
directives — NOT pure whitelists, so the v1.3.0 content-based
DisableAcceptableAds neutralizer does not catch it. It must be removed by
NAME from the manifest.

## 2. Settings storage + the apply chain (all classes3)

`com.opera.android.settings.SettingsManager.<init>` — the defaults Bundle.
Relevant stock defaults:

```java
putInt("ad_blocking", 0);                    // ad blocker OFF
putInt("banner_blocker", 0);
putInt("tracker_blocker", 1);
putInt("dns_over_https_enabled", 0);         // secure DNS OFF
putInt("dns_over_https_mode", 0);            // 0=DEVICE_DEFAULT
putString("dns_over_https_custom_server_template", "");
putInt("ad_blocking_mode", 0);               // a7j: 0 BALANCED, 1 ENHANCED, 2 CUSTOM
putString("ad_blocking_mode.selected_custom_lists", null);  // JSON array of names
```

DoH provider enum `l7j`: `DEVICE_DEFAULT(0, "")`, `CLOUDFLARE(1,
"https://opera.cloudflare-dns.com/dns-query")`, `GOOGLE(2,
"https://dns.google/dns-query{?dns}")`, `CUSTOM(3)`; read via
`l7j.values()[n("dns_over_https_mode")]` (SettingsManager:576).

Apply chain: `us4` (VM, listens to the 6 settings keys) + `kkc`/`lkc` +
`qs4.k` combine settings × manifest → `Set<ts4>` (per-list checked state:
mode bitmask / custom-selected / banner/tracker toggles) → `pi3` (watches
settings flow + Room `active_block_lists` via `t02` case 27) →
`pi3.a(force, now, set)` → `ni3` writes `dj3` rows into the
`block_lists` Room DB → `n9d` copies matching bundled assets
(`abp_files/op/<hash>`) into the files dir, `lj3` downloads updates, engine
consumes. So **editing the manifest bitmasks flips both the UI checkboxes
and the actual active set**.

Custom-list support already EXISTS in the UI (beta 104 / stable 103 —
`selected_custom_lists` string present in both): Custom mode screen `lk`
renders `ck` (catalog list), `zj` (custom-URL entries) and `ak`
("add custom list", `nvm.e` = Uri) rows; save path `lk.onDetach` writes
mode + JSON array. **No patch needed for "add custom blocklists"** — it
ships in the app; our defaults patch just needs the defaults.

## 3. Manifest refresh threat (must be neutered)

`zi3` (extends `no7`, provider name "blocklist_manifest", created by
`qp2.x`): the catalog can be replaced at runtime by **server-pushed
content** — `no7.a(io7,int,nch,jch)`: empty payload → `h()` (APK assets),
non-empty → `q(bytes)` (pushed manifest); pushed bytes are PERSISTED by
`ko7` to a cache file (`pd6.a(c,d)`) and replayed on boot via
`no7.k(izd)` (ko7.a case 0). A pushed stock manifest would silently revert
our defaults. Neuter: make `zi3.k()` and `zi3.q()` always `return h()`
(assets). Push ACKs still fire; only the manifest stays pinned.

## 4. Patch design (v1.3.2 #8 — "Adblock defaults + Secure DNS")

**A. Resource patch — `assets/op/abp.manifest`** (rewriter:
`scripts/abp_manifest_patch.py`, tested on stock bytes: round-trip
byte-identical, output re-parses clean):
1. remove `opera_fixes` from ADBLOCK_URL + ADBLOCK_CSS sets and metadata;
2. bitmask |= 3 for every remaining ADBLOCK_URL/ADBLOCK_CSS list
   (39 promotions: 34 regionals, adguard_ads, adguard_mobile_ads, ublock,
   ublock_min, tier2) → balanced AND enhanced = all 43 lists on;
3. CDB/TRACKER sets untouched (follow their toggles; tracker_blocker is
   already default-ON).

Result: default-on = the AdGuard list the user measured at 100% (+
EasyList, uBO full, AdGuard Mobile, NoCoin, every regional) with
"opera site fixes" gone. tier1/tier2 stay subscribed but empty (v1.3.0
Acceptable-Ads patch neutralizes their content).

**B. Build step — empty the opera_fixes bundled assets**: replace
`assets/abp_files/op/2add4739de65724a…` and `…/bf14726e1a09695e…` with the
gzip'd empty compiled list (byte-identical to `e87a67d8…`, same technique
as DisableAcceptableAdsPatch) — belt-and-braces once the manifest no longer
references them.

**C. Smali patch — SettingsManager defaults** (classes3.dex,
`com/opera/android/settings/SettingsManager.smali`, in `<init>`; anchors =
the const-string + following putInt; v3=0, v4=1 in that method):
```
const-string v0, "ad_blocking"            → putInt(v1, v0, v4)   # 1 (ON)
const-string v0, "dns_over_https_enabled" → putInt(v1, v0, v4)   # 1 (ON)
const-string v0, "dns_over_https_mode"    → putInt(v1, v0, v4)   # 1 (CLOUDFLARE)
```
(`ad_blocking_mode` stays 0 = BALANCED — with all-BE bitmasks balanced
already includes every list; `tracker_blocker` already 1.)

**D. Smali patch — pin the manifest to assets** (classes.dex → wait: zi3
is in classes.dex! — `smali-c1/zi3.smali`; NOTE for the W2 pipeline: W2
rebuilds classes3.dex only, so D needs the same treatment on classes.dex
or the v131 binary patcher byte-form):
```
.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2
    invoke-virtual {p0}, Lzi3;->h()Ljava/lang/Object;
    move-result-object v0
    return-object v0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 2
    invoke-virtual {p0}, Lzi3;->h()Ljava/lang/Object;
    move-result-object v0
    return-object v0
.end method
```
(`h()` loads `op/abp.manifest` from APK assets with stock fallback to the
empty `zi3.k` static on parse failure — unchanged.)

## 5. Residual notes / risks

- `zi3` lives in **classes.dex** (not classes3) — the W2 hybrid pipeline
  currently rebuilds classes3 only; D must either extend to classes.dex or
  be expressed as a binary-patcher byte edit (original method bodies are
  tiny; `k` = 2 invoke-static/move/return, `q` = 5 instructions).
- Pushed manifests still get cached to disk (ko7.b) but never parsed once
  D is in — no revert path remains.
- List files are hash-addressed on `blocklists.operacdn.com` — a pinned
  catalog keeps fetching the exact compiled lists Opera shipped; regionals
  not bundled in the APK get downloaded on first enable (needs network on
  first run; balanced/enhanced with regionals = ~40 downloads, a few MB).
- "All lists shipped with uBlock Origin": within what Opera's CDN serves,
  this equals the catalog minus opera_fixes (easylist, ublock, ublock_min,
  adguard_ads, adguard_mobile_ads, easyprivacy, fanboy-cookiemonster,
  nocoin, all regionals). Lists uBO ships that Opera does not host (Peter
  Lowe, URLhaus, uBlock-filters-annoyances, …) cannot be added without
  serving compiled lists ourselves — out of scope for the default set;
  users can add raw-URL lists via the built-in Custom-mode "add list" UI
  only if the engine accepts them (unverified — the Uri row exists, but
  whether the engine parses non-compiled ABP syntax is untested).
- Device test matrix unchanged: ad_blocking on/off toggle, list picker
  (balanced/enhanced/custom checkbox states), blocklists.operacdn.com
  fetches, DoH indicator (opera.cloudflare-dns.com queries).
