---
name: morphe-inspect-app
description: Inspect original Android app inputs and prove native hook contracts before creating or changing Santodan Morphe patches.
---

# Inspect the target app

Paths are relative to `E:\Morphe`. Repository: `santodan-patches`. Do not read the
whole `AI_Guide.md` (~1000 lines): run `rg -n '^##' santodan-patches/AI_Guide.md`
and read only the target app's section plus `### Scope and evidence`. Then read the
app's newest `docs/<App><version>.md`. Check `git status --short`.

## Inputs (recheck each task; hints as of 2026-11-23)

Originals are in `OriginalApps/` (`Apps/` holds outputs only). Confirm package and
version from the manifest, not the filename. Latest originals and repo targets:
NuvioTV 1.1.1 (`NuvioTV-1.1.1.apk`; `OriginalApps/NuvioTV/` is the upstream source
checkout, not proof of release DEX), Monet 1.1.2 (port tools in
`.inspect-monet-1.1.2`), Pillo 0.6.27 (`.apks`),
Car Scanner 2.2.52 (arm64 only; evidence in
`.inspect-carscanner-2.2.52`, porting recipe in `docs/CarScanner252.md`), TFD Companion 1.1.6 (`.apks`), Fylo 2.9, MEO 5.7.0.
Reddit: the latest original is 2026.47.0. Content filters and home flairs target it
(fixtures in `reddit-2026.47.0`); Start as guest still targets 2026.37.0. Ask before
porting guest. Preserve older support without extending it.

## Evidence

Use `Skills/inspection-evidence/.inspect-<app>-<version>`; see
`Skills/morphe-inspection-evidence/references/index.md`. Many folders already hold
the original `classes*.dex`. Before relying on them for a migration, compare their
hashes to the original ZIP entries; folder names are not provenance.

## Cheap DEX queries (prefer over decompiling or dumping whole classes)

```bash
CP="$(cygpath -m ~/.gradle/caches/modules-2/files-2.1/com.github.MorpheApp.smali/smali-dexlib2/4220ae75f7/*/smali-dexlib2-4220ae75f7.jar);$(cygpath -m "$(ls ~/.gradle/caches/modules-2/files-2.1/com.google.guava/guava/32.0.1-android/*/guava-32.0.1-android.jar)")"
Q="java -cp $CP E:/Morphe/Skills/morphe-inspect-app/scripts/DexQuery.java"
$Q methods 'Lbb/xs;->' <dex-folder|apk|.dex>     # signatures, flags, regs, size
$Q refs 'Ll0/j;->a(' <input>                       # call/field sites
$Q strings 'next up' <input>   ;  $Q literal 0x7f1103ed <input>
$Q dump 'Lna/c5;->b(JLg1/n;I)V' <input>            # pc, regs, refs; * = branch/handler target
```

`DexQuery` is read-only and runs from source (no compile step). Pipe through
`head`/`rg` and dump single methods rather than printing large ranges. Older tools
in `.inspect-source` are one-off helpers; review before running.

## Prove each hook

1. Trace inputs, outputs, state ownership and lifecycle, including the disabled
   path. Decompiled Java does not prove the DEX instruction layout.
2. Record for each hook: class and method descriptor, static/instance, parameter and
   return types, field/constructor contracts, the matched instruction sequence,
   register sources, and branch/try boundaries (`dump` marks targets with `*`).
   Insertions before an instruction that is a branch target are skipped by that
   branch.
3. Show uniqueness across all DEX files. Confirm runtime-facing symbols against the
   original DEX, not older mappings or upstream source (R8 renames and splits).
   Structural rankings are candidates only. Prove the role and full signature of
   any called method.

Output a compact evidence note: original path, package/version, proven contracts,
intended mutation, candidate source/verifier files, and open questions. Carry it into
`morphe-create-patch` instead of repeating raw output. If evidence is missing,
name the exact artifact or tool needed rather than inventing a hook.
