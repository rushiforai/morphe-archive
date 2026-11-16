# v11 crash diagnosis & v12 design (2026-11-15)

## Root cause of v11 startup crash (proven)
The v11 asset pipeline (`asset_pipeline.py`) corrupted `assets/op/abp.manifest`:
- Its parser only understood the FIRST section (ADBLOCK_URL, 44 entries).
- It removed `opera_fixes` from section 1 (count fixed 44->41, OK) but its
  "region-B excision" also deleted the `opera_fixes` entry it found in the
  tail — which was actually an entry of the **ADBLOCK_CSS section (42 entries)**,
  WITHOUT decrementing that section's u16 count.
- Result: parser misalignment (`bad hash None` at ADBLOCK_CSS[41]) ->
  `vi3` parse exception in `z4o.l0` -> `zi3.h()` catches -> EMPTY fallback
  manifest (null base Uri) -> blocklist subsystem fails during startup ->
  white screen ~10s -> crash. Reproduces every launch. (Verified by exact
  re-implementation of the parser: scripts/abp_validate.py.)

## Manifest format (exact, big-endian)
int32 version | u16-len base URL | 4 sections x (u16 count; count x [u16-len id,
u16-len 64-hex sha256]) for ADBLOCK_URL / CDB_URL / TRACKER_URL / ADBLOCK_CSS |
u16 ttl | u32 metadata_count | entries x (u32 entry_len; u16-len key, u32 sublen,
[sub: int32 a, u8 section, u16-len s1, s2, s3], int32 b, u16 c).
s3 = maintainer homepage. Stock: ADBLOCK_URL=44, CDB_URL=1(fanboy-cookiemonster),
TRACKER_URL=1(easyprivacy), ADBLOCK_CSS=42 (CSS variants; NOT in ADBLOCK_URL:
tier1/tier2_allow_rules). ttl=1.

## Update mechanism (v11-era code)
- Manifest: assets-only (`zi3.h()` reads `op/abp.manifest`), never refreshed
  from network -> hashes frozen per build; lists on CDN are content-addressed
  (`base + sha256`, base=https://blocklists.operacdn.com/) so they never change.
- Fetch: pi3 -> qs4.k -> c09.j -> ni3 -> dj3 (name/section/hash) -> cj3.a(Uri)
  groups by hash -> f9 pswitch_6bf builds `base.buildUpon().appendPath(hash)`
  -> OkHttp (Content-Type: application/octet-stream) -> non-2xx rejected
  (cv2 "Request failed with error code") -> `lj3.b(stream, hash, dir)`:
  computes sha256 of received bytes, **throws "SHA256 checksum mismatch" and
  deletes the temp file unless it equals the manifest hash**, then renames to
  `dir/<manifest-hash>`. Files are **gzip blobs** (hash = hash of gzipped
  bytes); engine reads them directly (also from `assets:abp_files/op/<hash>`).

## v12 design
1. CRASH FIX: ship the exact v9/v10 asset layer (stock abp.manifest + the 12
   stock bundled files). All 39 PD.9 ids exist in the stock catalog (44).
2. MAINTAINER-DIRECT UPDATES (user request):
   a. `f9.u(String url, String hash)` static helper + two static String[]
      arrays (hash -> maintainer URL), inserted into f9 (classes3).
      Patch point: f9 pswitch_6bf after `Uri.toString()` -> `move-result-object v1`,
      insert `invoke-static {v1, v9}, Lf9;->u(...) move-result-object v1`.
      Unmapped hashes (incl. all ADBLOCK_CSS) fall back to CDN (still works).
   b. `cv2` gzip-normalizer `f9.v(InputStream)`: read all bytes; if not starting
      1f 8b, gzip-encode; return ByteArrayInputStream. Inserted in cv2
      pswitch_3a4 between `byteStream()` and `lj3.b(...)` so the stored file is
      ALWAYS gzip (maintainers serve plain text; OkHttp may auto-decompress).
   c. `lj3.b` checksum gate bypass: `Intrinsics.a(p0,p1) / move-result v3` ->
      append `const/4 v3, 0x1` (comparison always passes; file stored under
      the requested hash name).
3. All v11 smali patches retained (verified clean; the 4 v11-only UI patches
   are lazy screens, not startup path).

## Files (recovered from GitHub release sandbox-storage)
v9/v10/v11 APKs, v10 build scripts, v11 patch bundle, PATCH-NOTES, keystore
(cert 62:C9:FA:6F:... verified). Workspace rebuilt under /home/z/my-project/work.
