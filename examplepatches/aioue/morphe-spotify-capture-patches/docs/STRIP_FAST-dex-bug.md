# TODO: file Morphe Patcher bug — STRIP_FAST emits invalid empty dexes

Status: fix verified on device (see `CHANGELOG.md`, "Tested on device" 2026-10-09). File the report when convenient.

## Where

- Repo: MorpheApp/morphe-patcher (also affects Morphe Manager 1.34.0, which has no bytecode-mode setting — removed in `5ce9a12e` on 2026-09-22 — so STRIP_FAST is hardwired as the patcher default).
- Verified against: Patcher 1.15.1 (v1.15.1, 2026-10-05), the current release. HEAD `DexStripper.kt` still contains the same code path (`stripInPlace` updates `class_defs_size` but never zeroes `class_defs_off`/map entry when the dex empties).

## Bug

With `BytecodeMode.STRIP_FAST`, `DexStripper.stripInPlace` can remove all class_defs from an original dex. The resulting dex has `class_defs_size = 0` but:

1. `class_defs_off` (header `0x64`) left at the old value — ART requires offset 0 when size is 0. Runtime symptom on Android 16/17: `W/...: Failure to verify dex file 'base.apk!classes2.dex': Offset(1395604) should be zero when size is zero for class-defs.`
2. The `TYPE_CLASS_DEF_ITEM` map_list entry (size 0, stale offset) also survives. Zeroing the header offset alone is not enough: ART then fails with `Bad offset for section` / `Out of order map item` because map entries must stay sorted by offset. The canonical fix is to omit the map entry entirely (and shrink `file_size`/`data_size` by 12 bytes when the map is the last section).

Because ART rejects one dex, the whole APK's dex set fails to load and every app class throws `ClassNotFoundException` — for Spotify the manifest Application class fails first: `Unable to instantiate application com.spotify.music.SpotifyApplication`.

## Evidence (Spotify 9.1.88.2204, bundle 1.0.1, Manager 1.34.0 / Patcher 1.15.1, Pixel 8a)

- Stock APK: 16 dexes, 0 anomalies. Patched APK: 30 dexes, 14 with `class_defs_size=0` and nonzero `class_defs_off` (classes2, 4–16 excluding 3, plus none of the new classesN dexes — those are fine).
- `dexdump` (build-tools 36) verifies all 14 as broken pre-fix, all clean after the header+map fix.
- Workaround that produced a working install: zero `class_defs_off`, remove the size-0 `TYPE_CLASS_DEF_ITEM` map entry, decrement map count, shrink header `file_size`/`data_size` by 12, recompute SHA-1 signature (covers bytes 32+) and adler32 checksum (covers bytes 12+), re-zip, zipalign, re-sign. Two consecutive cold starts clean after reinstall.

## Suggested fix

In `DexStripper.stripInPlace`: when `newClassDefsSize == 0`, also zero `CLASS_DEFS_OFF_OFF` in the header and drop the `TYPE_CLASS_DEF_ITEM` map entry (keeping map sort order), adjusting `file_size`/`data_size`. A regression test asserting ART-verifier-clean output for fully-stripped dexes would catch it (`DexReadWriteTest` exists).
