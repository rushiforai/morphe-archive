# RED-TEAM ADVERSARIAL VERIFICATION — Opera Beta 104 custom v12

Role: hostile verifier. Every claim re-derived from bytes on disk. Artifacts under
`work/audit-reports/scratch-red/` (scripts `step*.py`, JSON outputs, extracted assets).
Date: 2026-11-15. Target: `download/OperaBeta-104.0.5262.91143-custom-v12-universal.apk`
(sha256 `299e46406e1f0ea66f8d79c2ee874be2313607c6fda1d4206887390f6e63b8ac`, 151,163,457 B — hash+size re-confirmed).

---

## 1. Executive verdict

**The build is real and the core engineering claims hold.** All 44 patches are provably present
in the shipped APK (anchor-matched against a stock v9 disassembly I produced myself, replacement
verified in a disassembly of the shipped dexes I produced myself). Class sets are identical to
stock (45,244/45,244). The v11 crash fix is genuine: the asset layer is byte-identical to
v9/v10 and parses cleanly (with a working negative control on v11's corrupt manifest).

**But two release-documentation claims are false and the AB.4 design opens real integrity risk:**
the release notes claim "Signature: v1+v2+v3" — the APK verifies **v3-only**; and the checksum
gate is now disabled for *every* blocklist download (including the 9 CDN-fallback lists), so any
2xx body — captive-portal page, soft-200 HTML, or a redirect to a third-party host (observed:
`adblock.ee` → `ubo-et.lepik.io`) — is stored and served as a trusted blocklist under a
manifest-hash filename.

Tallies: **VERIFIED 9 claims-blocks · FAILED 2 (v1/v2 signature claim; v9-baseline size as
quoted in the brief) · NEW RISKS 8 · UNVERIFIABLE 1 (Play Protect).**
The v11-crash-fix claim (asset identity + clean parse) **HOLDS**.

---

## 2. Verification matrix

| # | Claim | Verdict | Evidence (command → result) |
|---|-------|---------|------------------------------|
| 0 | Shipped file is the claimed artifact | VERIFIED | `sha256sum` → `299e4640…b8ac`, `stat` → 151,163,457 B |
| 1 | audit dexes == shipped dexes | VERIFIED | `step1_provenance.py`: shipped `classes.dex` 83b4aee2…, `classes3.dex` 7dc48117…; `audit/classes{,3}.dex` identical (byte-compare). Also `work/v12/v12-classes{,3}.dex` identical (same hashes) |
| 2 | audit/c1, audit/c3 are baksmali of shipped dexes | VERIFIED | re-disassembled shipped dexes with `org.jf.baksmali.Main d` (2.5.2) → full-tree hash diff vs audit/c1, c3: **0 differing files** of 10,069 + 11,936 (`step1b_treediff.py`, `treediff.json`) |
| 3 | Signature verifies; cert = pinned 62:C9:…:DF | VERIFIED (with a caveat) | `apksigner verify --print-certs --verbose` → "Verifies"; cert SHA-256 `62c9fa6fdae682662993a5ab417c711779d1a0bc8ff643e44de5201187a96adf` == pin |
| 3a | "v1+v2+v3" (PATCH-NOTES-v12.md) | **FAILED** | same output: v1=false, **v2=false**, v3=true, v3.1/v4/SourceStamp=false. (META-INF v1 files exist but v1 does not verify.) Functional for minSdk 29, but the notes' claim is false |
| 3b | Same cert as v9/v10 (in-place upgrade) | VERIFIED | `apksigner verify --print-certs` on `recover/…v9-universal.apk` → same cert digest; v12 minSdk=29 (`aapt dump badging`: sdkVersion 29) so v3-only is installable Android 10+ |
| 4 | All 44 anchors match stock at build time | VERIFIED | `step3c_final_table.py` vs my own stock disassembly of `work/dex/base/classes{,3}.dex` (which hash-match `v9-unsigned.apk`): anchor count == 1/1 for all 44 |
| 5 | All 44 replacements present in shipped output; replaced text gone | VERIFIED | same script, post = audit trees (provenance-proven); label-normalized; `old_absent=True` for all 44; manifest.json 16-hex hashes recompute correctly for all 44 |
| 6 | Class-set equality, 45,244 total | VERIFIED | header parse (class_defs_size@0x60): v9=45,244 v12=45,244; per-dex identical counts; full descriptor sets equal (`step4b_classes_names.py`) |
| 7 | Asset layer byte-identical to v9/v10 (v11 fix) | VERIFIED | `step5_assets.py`: all 19 entries (`assets/op/*` 7 + `assets/abp_files/op/*` 12) byte-identical to v9-unsigned; abp.manifest d75fb685… == v9-signed == v10-signed (v11's differs, 2f2a4ac5…, as expected) |
| 7a | Manifest parses cleanly (4 sections) | VERIFIED | validator run (path-patched copy, see §5): v12 OK, all 11,682 B consumed; ADBLOCK_URL=44, CDB_URL=1, TRACKER_URL=1, ADBLOCK_CSS=42, 44 metadata. **Negative control:** v11 manifest → `STRUCTURAL FAILURE: ADBLOCK_CSS[41] … bad hash None` (matches DIAGNOSIS-v12.md) |
| 8 | Whole-APK diff vs stock limited to intended changes | VERIFIED | entry-level zip compare: only `classes.dex`, `classes3.dex` changed; added = 3 META-INF sig files; everything else (arsc, .so, services, kotlin_module, assets) byte-identical |
| 9 | AB.1–AB.4 work as described | VERIFIED w/ RISKS | §6; adversarial findings listed in §7 |
| 10 | 37 mapped URLs live | VERIFIED (8 sampled) | §8: 8/8 HTTP 200, all `https://`, all plain-text bodies |
| 11 | "Installs without Play Protect warning" | UNVERIFIABLE | needs on-device Play Protect verdicts (§9) |
| 12 | Brief's baseline "v9-unsigned.apk = 151,011,905 B" | **FAILED (doc)** | actual file is 150,461,969 B, sha256 `eedebe11…b5ebd`; 151,011,905 B is `recover/…v9-universal.apk` (signed). On-disk baseline is internally consistent (dex/base matches it) |

---

## 3. Patch table (44 rows)

Pre = my disassembly of stock `work/dex/base/classes{,3}.dex` (== `v9-unsigned.apk` dexes).
Post = `work/audit/c{1,3}` (proven = baksmali of shipped dexes). `msha` = manifest.json
`anchor_sha`/`replacement_sha` recompute from patch source. "old gone" = anchor text absent
from post (label-normalized).

| ID | target (tree/file) | anchor in pre | replacement in post | old gone | msha | verdict |
|----|--------------------|---------------|---------------------|----------|------|---------|
| P1 | c3/com/opera/android/OperaApplication.smali | 1/1 | 1 | yes | ok | **OK** |
| P6 | c3/com/opera/android/custom_views/SplashView.smali | 1/1 | 1 | yes | ok | **OK** |
| P7 | c3/ssi.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.0 | c3/com/opera/android/settings/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P2.1 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P2.2 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P2.3 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P2.4 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P2.5 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P2.6 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P2.7 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P2.8 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P2.9 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.1 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.2 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.3 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.4 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.5 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.6 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.7 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.8 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.10 | c3/sb6.smali | 1/1 | 1 | yes | ok | **OK** |
| PD.9 | c3/…/SettingsManager.smali | 1/1 | 1 | yes | ok | **OK** |
| P3 | c3/pfn.smali | 1/1 | 1 | yes | ok | **OK** |
| P4 | c1/d37.smali | 1/1 | 1 | yes | ok | **OK** |
| P5 | c1/d37.smali | 1/1 | 1 | yes | ok | **OK** |
| P5b | c1/d37.smali | 1/1 | 1 | yes | ok | **OK** |
| P5c | c1/d37.smali | 1/1 | 1 | yes | ok | **OK** |
| PV.1 | c3/ldn.smali | 1/1 | 3* | yes | ok | **OK** |
| PV.2 | c3/zfn.smali | 1/1 | 1 | yes | ok | **OK** |
| PV.3 | c3/cgn.smali | 1/1 | 1 | yes | ok | **OK** |
| PV.4 | c3/p12.smali | 1/1 | 1 | yes | ok | **OK** |
| PV.5 | c3/com/opera/android/esim/EsimTimeZoneChangeReceiver.smali | 1/1 | 1 | yes | ok | **OK** |
| PV.6 | c3/zfn.smali | 1/1 | 1 | yes | ok | **OK** |
| PV.7 | c3/zfn.smali | 1/1 | 1 | yes | ok | **OK** |
| PN.1 | c3/y2g.smali | 1/1 | 1 | yes | ok | **OK** |
| PT.1 | c3/bo3.smali | 1/1 | (deletion)† | yes | ok | **OK** |
| PT.2 | c3/rqd.smali | 1/1 | 1 | yes | ok | **OK** |
| PT.3 | c3/bo3.smali | 1/1 | 1 | yes | ok | **OK** |
| PA.1 | c3/k15.smali | 1/1 | 1 | yes | ok | **OK** |
| AB.1 | c3/f9.smali | 1/1 | 1 | yes‡ | ok | **OK** |
| AB.2 | c3/f9.smali | 1/1 | 1 | yes | ok | **OK** |
| AB.3 | c3/cv2.smali | 1/1 | 1 | yes‡ | ok | **OK** |
| AB.4 | c3/lj3.smali | 1/1 | 1 | yes‡ | ok | **OK** |

\* PV.1's verify-string legitimately occurs 3× post-patch (count-based anchor was the gate).
† PT.1's replacement is empty (sha `e3b0c44298fc1c14…` = sha256("")); the operative assertion is
anchor absence, which holds (33,413/33,423 "counts" in raw output are the vacuous `"".count`).
‡ insertion patches — anchor legitimately remains; "old gone" recorded True because verify_absent
is not declared for insertions.

Corroborating diffs: stock→build trees changed in exactly the 18 target files of c3 (+`d37.smali`
in c1); label-normalized stock→audit diffs add only 12 non-target files, all benign
round-trip artifacts (smali assembler drops explicit `= false`/`= 0x0t`/`= null` static-field
initializers — verified in jfc/m21/yk8/v2o/AFe1bSDK/SignInHubActivity and leanplum Constants,
ActionManager, Util, FileManager, MessageTemplates, obml Platform). Runtime-identical.

Also: `work/v12/verify-c1` and `verify-c3` are **byte-identical trees** to `audit/c1`/`audit/c3`
(0 differing files), i.e. the "re-verify on real output" tree and my independent disassembly agree.

---

## 4. Class-set equality

Header parse (`class_defs_size` @ 0x60):

| dex | v9 | v12 | identical name set |
|-----|----|-----|--------------------|
| classes.dex | 10,069 | 10,069 | yes |
| classes2.dex | 12,088 | 12,088 | yes |
| classes3.dex | 11,936 | 11,936 | yes |
| classes4.dex | 6,820 | 6,820 | yes |
| classes5.dex | 3 | 3 | yes |
| classes6.dex | 3,561 | 3,561 | yes |
| classes7.dex | 767 | 767 | yes |
| **total** | **45,244** | **45,244** | **yes (full descriptor sets equal)** |

Non-1/3 dexes are byte-identical between v9 and v12 (pass-through splice verified by hash).

---

## 5. Asset layer (the v11 crash fix) — HOLDS

- 19/19 asset entries (`assets/op/*` + `assets/abp_files/op/*`) sha256-identical v9↔v12;
  `abp.manifest` = 11,682 B, `d75fb6859a440bb43593fac72a391659c368a625f0ff9967ff00393d17ae8cc6`,
  also equal in signed v9 and v10; v11's manifest differs (2f2a4ac5…) — the corruption story is real.
- Clean parse (validator copy `abp_validate_red.py` — only the JSON-dump path was redirected to my
  scratch dir to avoid overwriting `work/abp_validate.out.json`; logic untouched):
  v12 OK, full 11,682 B consumed, version=0, base=`https://blocklists.operacdn.com/`, ttl=1,
  sections 44/1/1/42, 44 metadata entries, no trailing bytes.
- **Negative control:** v11 manifest → `STRUCTURAL FAILURE: ADBLOCK_CSS[41] id=' ': bad hash None`
  — exactly the documented v11 defect, proving the validator is discriminative.

---

## 6. Adversarial code review — AB.1–AB.4 (all from audit/c3 = shipped bytes)

**(a) f9.u / f9.v exist and are coherent.** `f9.smali:1282` `.method public static u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;` `.registers 6` (params v4,v5; locals v0–v3 used; linear scan of `Lf9;->V:`, `String.equals(p1)`, returns `W[i]`, else `return-object p0`). `f9.smali:1317` `.method public static v(Ljava/io/InputStream;)Ljava/io/InputStream;` `.registers 8` (static, param p0=v7; reads 0x2000-byte chunks into ByteArrayOutputStream, closes input; gzip-magic check b[0]==0x1f, b[1]==-0x75(0x8b) on ≥2 bytes → passthrough; else GZIPOutputStream re-wrap with `.catch Throwable` → **fallback returns the ORIGINAL plain bytes**, see R4). `<clinit>` builds V (37 hashes) and W (37 URLs) at `f9.smali:255/483`; 77 const-strings in the method. Fields V/W declared.

**(b) Call site.** `f9.smali:3297 :pswitch_6bf`: `check-cast v9, Ljava/lang/String;` → `Uri.buildUpon().appendPath(v9)` → `toString()` → `move-result-object v1` → **`invoke-static {v1, v9}, Lf9;->u(...)` → `move-result-object v1`** → `invoke-virtual {v0, v1}, Lfvh;->h(Ljava/lang/String;)V`. v9 is literally the string appended as the content-address path, so u() receives the manifest hash. `fvh.h(String)` (in classes4, `c4/fvh.smali:190`) rewrites `ws:`/`wss:` then `rma.o(p1,null)` → `iput fvh.a` = URL setter — same setter stock used for the CDN URL. Exactly **one** `appendPath` in f9 → single fetch-URL construction site. Request adds only `Content-Type: application/octet-stream` (no explicit Accept-Encoding → OkHttp BridgeInterceptor may add gzip + transparent-decompress; handled, see (d)).

**(c) cv2 normalizer position.** `cv2.smali:1100 :pswitch_3a4` (= case 0x6 of `pswitch_data_4d4`; the only cv2 instance with case 6 is constructed at `f9.smali:3354`): `pzh.q` false → `IOException("Request failed with error code: "+pzh.d)` wrapped in `q0i` (Result.failure) returned; true → `Lvzh;->byteStream()` → **`invoke-static {v1}, Lf9;->v(...)` → `move-result-object v1`** → `:try_start_3cf` … `invoke-static {v1, v9, v0}, Llj3;->b(...)` (dir from `lj3.c` provider) → Result.success. Normalizer is exactly between byteStream() and lj3.b, and handles 1f 8b.

**(d) lj3.b bypass.** Method `lj3.smali:92-394`: writes body through `c5o` digesting stream into a temp file; computes digest hex (`c8a.a`); `Intrinsics.a(computed, p1=requestedHash)` → `move-result v3` → **`const/4 v3, 0x1` (AB.4, line 311)** → `if-eqz v3, :cond_c3` (line 313). The mismatch branch (`:cond_c3`: delete temp + throw `lv0 "SHA256 checksum mismatch: Expected … got …"`) is **dead code**. Register audit: v3's only other use in the method is as loop scratch in `<init>`/other methods; after line 313 v3 is never read again → no corruption of other branches. Exactly **one** `Intrinsics.a(Object,Object)` in the class (probe: n=1). On match path: mkdirs → `renameTo(dir/<p1=manifest-hash>)` → return File.

### The five hunt questions

1. **Who else calls `lj3.b`?** `rg "Llj3;->b\(" audit/c3 audit/c1` → **exactly one call site: `cv2.smali:1155`** (case-6 handler; that cv2 instance is constructed only at `f9.smali:3354`). All other `Llj3;` refs are `<init>` (qi3:150), field reads (kj3, cj3, f9:3344, cv2:1147) and `lj3.a(Uri,String,Lwx)` (kj3:83, cj3:280). So the bypass affects **every** blocklist download — the 37 mapped maintainer fetches *and* the 9 unmapped CDN-fallback fetches (opera_fixes, tier1/tier2 allow-rules, testcase, uBlock-minimal, India, Macedonia, Iceland, Korea).
2. **HTTP 404 from a maintainer?** `pzh.q` false → `IOException("Request failed with error code: 404")` returned as Result.failure; `f9.smali:3381 `Lybh;->y`` rethrows in the per-hash download job; no CDN fallback (u() already replaced the URL), temp file not created, **previously stored file and bundled asset copies remain** — the list keeps its last-good content; startup is unaffected (manifest is assets-only). Evidence: cv2.smali:1108–1127; lj3.b never invoked.
3. **Plain text under manifest-hash filename?** Not via cv2 case 6 (v() guarantees gzip). **One residual path:** `f9.v`'s `.catch Throwable` fallback (`f9.smali:1405-1413`) returns the *plain* ByteArrayInputStream if `GZIPOutputStream.write/close` throws (OOM/IO) → lj3.b stores plain text under the hash name. Read side: `zuk.smali:100-125` sniffs magic 0x8b1f before wrapping (plain text would parse), `mgp.smali:95-105` `d()` unconditionally wraps GZIPInputStream (plain text fails that reader). Parse failure is a per-list runtime failure, not a startup crash (the v11 crash was manifest-parse at init). Probability: negligible (in-memory gzip failing), but the path exists.
4. **Double-gzip?** v() checks magic **after** fully reading the body, so: maintainer gzip w/o Content-Encoding → passthrough (single gzip); maintainer gzip with `Content-Encoding: gzip` → OkHttp BridgeInterceptor transparently decompresses (no explicit Accept-Encoding in the request) → v() sees plain → re-gzips (single gzip); plain → gzip. Double-gzip requires a maintainer serving **gzip-of-gzip bytes with no Content-Encoding** — then the magic check passes through and the engine's single unzip yields garbage. Currently theoretical: **0 of 8 probed maintainers serve gzip** (all magic 5b41/2120 plain text, see §8).
5. **OkHttp transparent decompression an issue?** No: the request sets only Content-Type; BridgeInterceptor-added `Accept-Encoding: gzip` decompression happens *before* `byteStream()`, so v() normalizes whatever reaches it. The real transport-level finding is the opposite: hostname pinning does not exist — `bz8.smali` "hostname blocklists.operacdn.com not verified" is only an **error-message classifier** (telemetry bucketing), and `lj3.<init>` builds its client with timeouts only (no CertificatePinner/HostnameVerifier). Maintainer TLS works, but so would any TLS host the URL map points to (see R2/R3).

---

## 7. New risks found (concrete failure scenarios)

- **R1 (FAILED claim).** PATCH-NOTES-v12.md says "Signature: v1+v2+v3". Actual: **v3-only** (v1=false, v2=false; v1 META-INF files present but non-verifying). Benign on Android ≥10 (minSdk 29) but the doc is wrong, and any consumer requiring v1/v2 (some MDM/emulator tooling) will reject the APK.
- **R2 (integrity).** AB.4 kills the SHA-256 gate for **all** downloads through lj3.b (incl. CDN fallbacks). Any 2xx body — captive portal, ISP hijack, soft-200 HTML error page, compromised maintainer — is stored as a trusted blocklist under a manifest-hash name and served to the engine. Stock behavior would have rejected it; v9 assets keep first run safe, but the first refresh cycle is now trust-on-fetch.
- **R3 (redirects).** Observed live: `https://adblock.ee/list.php` → **`https://ubo-et.lepik.io/list.txt`** (cross-domain, 200). With R2, the redirect target's content is fully trusted; the map owner (adblock.ee) does not control lepik.io. A hostile/compromised redirect target can push arbitrary "filter" content into the engine.
- **R4 (plain-text corner).** `f9.v` Throwable-fallback can store plain text under the hash name (see Q3) — engine readers that assume gzip (`mgp.d`) will fail parsing that list until the next successful refresh.
- **R5 (double-gzip).** Maintainer serving gzip-of-gzip without Content-Encoding → stored double-gzip → engine single-unzip yields garbage list (currently theoretical; 0/8 probed URLs serve gzip at all).
- **R6 (memory).** `f9.v` buffers the entire response in RAM (EasyList ≈ 2.0 MB plain; gzipped re-wrap doubles peak) per download, on top of OkHttp buffers. Minor on modern devices.
- **R7 (silent no-op mode).** `u()` uses case-sensitive `equals`; today manifest hashes are lowercase and 37/37 map keys match raw manifest bytes (verified). A future manifest regeneration with different casing would silently disable all redirects (benign CDN fallback, no error signal).
- **R8 (baseline doc drift).** The brief states `work/v9-unsigned.apk` = 151,011,905 B; actual = 150,461,969 B (`eedebe11…`). 151,011,905 B is the *signed* `recover/…v9-universal.apk`. Baselines on disk are self-consistent (dex/base == v9-unsigned dexes), but release docs should pin the right file.

---

## 8. Updater map probes (8/8 across 7 domains)

Map: 37 entries; domains — raw.githubusercontent.com ×21, filters.adtidy.org ×8, easylist-downloads.adblockplus.org ×3, easylist.to ×2, secure.fanboy.co.nz / stanev.org / adblock.ee ×1 each. **No `http://` entries.** All 37 map hashes verified present (raw-byte) in the shipped abp.manifest; manifest hashes all lowercase.

| URL | status | final URL | size | magic |
|-----|--------|-----------|------|-------|
| easylist.to/easylist/easylist.txt | 200 | (no redirect) | 2,069,962 | `5b 41` plain |
| secure.fanboy.co.nz/fanboy-cookiemonster.txt | 200 | (no redirect) | 906,528 | `5b 41` plain |
| raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt | 200 | (no redirect) | 469,901 | `21 20` plain |
| filters.adtidy.org/android/filters/9.txt | 200 | (no redirect) | 391,705 | `21 20` plain |
| easylist-downloads.adblockplus.org/easylistgermany.txt | 200 | (no redirect) | 281,371 | `5b 41` plain |
| stanev.org/abp/adblock_bg.txt | 200 | (no redirect) | 51,865 | `5b 41` plain |
| adblock.ee/list.php | 200 | **→ ubo-et.lepik.io/list.txt** | 15,487 | `21 20` plain |
| raw.githubusercontent.com/abpvn/abpvn/master/filter/abpvn.txt | 200 | (no redirect) | 46,234 | `5b 41` plain |

All plain text ⇒ cv2 gzip-normalization is on the hot path for every mapped list (as designed).

## 9. Unverifiable claims

- **"Installs without Play Protect warning"** — device-side Google Play Protect verdicts cannot be observed from this sandbox. Strengthening evidence would be: `adb install` on clean devices (multiple API levels ≥29) with Play Protect enabled, screenshot of any scanning dialogs; Play Protect app-verdict lookups for the sha256; longer-term telemetry of "harmful app" flags. The unchanged v9 lineage cert (`62c9fa…`) is the strongest available proxy and it checks out.

## 10. Evidence appendix (scripts & artifacts — all under `work/audit-reports/scratch-red/` unless noted)

- `step1_provenance.py` / `step1b_treediff.py` / `treediff.json` — dex extraction, hash compares, baksmali re-disassembly (`java -cp "/home/z/my-project/tools/*" org.jf.baksmali.Main d …`; note: the jar has no Main-Class manifest attr, so `java -jar` fails — must use the classpath form), full-tree diffs (0 diffs).
- `step3_patches.py` (first pass, mislabeled pre trees — superseded), `step3b_trees.py` (build/verify tree forensics; verify-c* == audit/c* 0 diffs), `step3c_final_table.py` / `patch_rows2.json` — the 44-row table; pre = `/tmp/redteam/stock-c{1,3}` (baksmali of `work/dex/base/classes{,3}.dex`, hashes 9e9a1471…/d0ef221b… == v9-unsigned.apk entries).
- `step4_classes.py` / `step4b_classes_names.py` / `classes2.json` — dex header class-def parse (45,244/45,244; name sets equal).
- `step5_assets.py` / `assets/asset_compare.json` — 19/19 assets identical; whole-APK entry diff (2 changed dexes + 3 META-INF).
- `abp_validate_red.py` (copy of `scripts/abp_validate.py` with dump path redirected), `assets/v12-abp.manifest`, `assets/v9-abp.manifest`, `v11-abp.manifest`, `abp_validate_red.out.json` — clean parse + negative control.
- `curl_results.txt` — 8 URL probes with status/final URL/size/sha-prefix/magic.
- apksigner: `/tmp/my-project/work/tools/android-14/apksigner verify --print-certs --verbose` on v12 (and `--print-certs` on recover/v9) — outputs quoted in §2.
- Hashes: shipped APK `299e46406e1f0ea66f8d79c2ee874be2313607c6fda1d4206887390f6e63b8ac`; shipped classes.dex `83b4aee20319575ba4bc36683b213db9cb6ae12378b6e8359f491e391a7e52b3`; classes3.dex `7dc4811773ac420eccc17ab5228aa0423e0753717465a3935019b1c52ced628e`; v9-unsigned.apk `eedebe11ca74641e088fefd68af0421d923fbfbfb827c93e6844b4a84e3b5ebd`; abp.manifest `d75fb6859a440bb43593fac72a391659c368a625f0ff9967ff00393d17ae8cc6`.
