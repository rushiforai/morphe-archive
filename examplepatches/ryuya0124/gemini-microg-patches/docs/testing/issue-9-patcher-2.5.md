# Issue #9: Morphe Patcher 2.5 migration and memory use

[Issue #9](https://github.com/ryuya0124/gemini-microg-patches/issues/9) reported that the bundle was built for Morphe Patcher 1.12.0 while current Morphe uses Patcher 2.x, and that patching used a lot of memory until Morphe crashed.

## Causes

1. **Old bundle version forced legacy resource decoding.** The MPP manifest declared `Patcher-Version: 1.12.0`. Patcher 2.x keeps the 1.x behavior "decode all resources before patches execute" whenever any loaded bundle declares a version below 2.0.0 ([PatcherBehavior](https://github.com/MorpheApp/morphe-patcher/blob/v2.5.0/src/main/kotlin/app/morphe/patcher/PatcherBehavior.kt), adoption `EVERY_BUNDLE`). With this bundle loaded, Google was always fully decoded (11,265 files), also for the official patches loaded alongside it.
2. **String rewriting made more classes mutable than needed and compiled smali per instruction.** The package/GMS/permission redirects made every candidate class mutable before checking whether it had a string to change, and rewrote each `const-string` from smali text. Patcher 2.5 adds `replaceStrings()` for this: one indexed pass, and a class becomes mutable only if a string in it is replaced.
3. **Source no longer compiled with Patcher 2.5.** `compatibleWith(String)`, `getAllClassesWithString()` and `addInstructions(String)` without an index are hidden in 2.5. Desktop 2.x also renamed the result JSON field `patchingSteps` to `stepResults`, and ARSCLib renamed `valueAsString`/`setValueAsString`/`writeApk`.

## Changes

- MPP declares `Patcher-Version: 2.5.0`; tools pinned to Morphe Desktop 2.3.0 (Patcher 2.5.0, same as Android Manager 2.7.1) and official patches 2.3.0 for comparison.
- Compatibility is declared with `Compatibility` objects listing the exact registered versions from `VersionHookRegistry`. Unregistered versions are still refused at patch time.
- Gemini target, Google package and GMS redirects and clone permission references use `replaceStrings()`. The GMS replacement keeps the previous per-string rules unchanged.
- Read-only searches (process-name provider, signature verifier, eligibility, main-process check) inspect the original classes and make only the class they change mutable.
- Bytecode patches that use the instruction indexes depend on a read-only resource step, so Patcher 2's on-request decoder loads the 87 MB Google resource table before the indexes are built instead of on top of them. The manifest is not changed.

## Verification (2026-11-24, macOS, Desktop 2.3.0)

Inputs: Google 17.72.17.ve.arm64 base (`0ecc808f…1252`), xxhdpi split (`b8867397…cf7d`), Gemini 1.0.995038376 base (`af62293b…be`).

**Output equivalence with the published v0.3.5 MPP** (both generated with Desktop 2.3.0, default selection):

| | Google | Gemini |
|---|---|---|
| DEX classes compared (canonical instructions, registers, try blocks, fields) | 158,074 identical | 5,298 identical |
| `aapt2 dump resources` / `strings` / manifest `xmltree` | identical | identical |

`resources.arsc` bytes differ only because the on-request encoder drops two unused key strings and trailing empty `anim` entries; every resource, value and ID is the same. The xxhdpi split from `PatchSplit` matches the previous build exactly.

**Repository checks:** `check-repo.sh`, `build-all.sh` (Google, Gemini, split) with `verify-apks.sh` (DEX branches, work-profile eligibility, compliance redirect/feature gate, trampoline, clone contract, process name, permission setup, update compatibility), Gemini manifest and clone contract, `check-hook-profiles.sh`, MPP structure (28 JVM classes in Android DEX), and compilation of every `scripts/kotlin/*.kt` all pass.

**Memory and time, Google base, `java -Xmx… -jar morphe-desktop.jar patch`:**

| Max heap | Bundles | v0.3.5 | This change |
|---|---|---|---|
| 6 GB | this bundle | 3,771 MB RSS, 6.3 s | 2,057 MB RSS, 2.7 s |
| 6 GB | + official 2.3.0 | 4,505 MB RSS, 6.8 s | 2,012 MB RSS, 3.1 s |
| 1 GB | this bundle | ok, 7.0 s | ok, 5.5 s |
| 1 GB | + official 2.3.0 | ok, 7.2 s | ok, 5.9 s |
| 992 MB | this bundle | out of memory | out of memory |

Mutable classes: 350 → 348 of 158,074. Below about 1 GB of heap both versions fail while Patcher itself loads the 87 MB resource table and 14 DEX files; that floor comes from the Google APK, not from these patches. Without the resource preload step the new bundle needed about 1.15 GB, because the table was loaded on top of the instruction indexes.

## Not verified

- Generation in the Android Morphe Manager 2.7.1 GUI and runtime on a device or AVD. The dedicated Issue #8 AVDs are on the Windows host, not this Mac. The generated DEX and resources are content-identical to the runtime-verified v0.3.5 output, but HANDOFF requires a real Manager comparison after a Patcher update before release.
- Phones with less memory than the ~1 GB Java heap the Google APK needs can still fail; that is outside these patches.

## 500 MB heap on a phone

Target from the maintainer: Morphe on a phone has about 500 MB of heap for patching. Morphe Manager 2.7.1 patches either in its embedded JVM (allowed 2 GB on a 4 GB AVD) or, with "Use embedded VM" off, in Android's runtime with the app heap. The latter was set to 512 MB (`dalvik.vm.heapsize=512m`) on dedicated Android 12 (API 31) and Android 17 (API 37) AVDs to reproduce a phone.

**Cause.** As soon as a selected patch is a resource patch, Patcher 2.5 parses the whole 87 MB `resources.arsc` of Google with ARSCLib before any patch runs (`prepareDecodingOnRequest`). With the previous build Manager failed there: `OutOfMemoryError` at 511 MB in `TableBlock.load`, Android 12, Google 17.72.17 universal APK.

**Change.** The Google manifest edits (manifest tweaks, automatic clone setup, clone permission references) are raw resource patches now. When no other selected patch needs decoded resources, Patcher only extracts raw entries; the binary manifest is edited with ARSCLib (`AndroidManifestBlock`, no resource table) and written as the `AndroidManifest.xml` root entry, which replaces the manifest in the output APK. The package name in the `resources.arsc` package header is renamed in place, as compiling decoded resources did. When another selected patch needs decoded resources (for example official resource patches), the same edits run on the decoded document as before. The resource preload step is removed. The input APK path is not exposed to raw patches, so it is read from the patcher context by reflection and must resolve to exactly one APK with a manifest.

**Output.** Desktop 2.3.0 output of the raw path against the previous decoded path: all 158,075 DEX classes identical; manifest `aapt2 dump xmltree` identical except line numbers; resource table package name identical. `resources.arsc` is otherwise the original table, so it keeps the two key names (`checkbox` …) the decoding encoder had replaced with `id_0x…`.

**Manager 2.7.1, Android runtime, 512 MB heap:**

| Device | Input | Previous build | This build |
|---|---|---|---|
| Android 12 AVD | Google universal APK (minSdk 30) | OOM in resource table | ok, peak 288 MB, 12.6 s |
| Android 17 AVD | Google base APK only | – | ok, peak 269 MB; app needs the density split at runtime |
| Android 17 AVD | Google universal APK | – | ok, peak 293 MB, 35 s |
| Android 17 AVD | Google base + xxhdpi split as `.apks` | – | OOM in Manager's split merge before patching |
| Android 17 AVD | Gemini base APK | – | ok, peak 29 MB |

Embedded JVM (Manager default on this AVD): previous build ok with peak 1,043 MB. Desktop 2.3.0 with `-Xmx512m`: ok, 697 MB RSS.

The universal Google builds installed from Manager and launched on both Android versions without a crash (Discover offline without an account). Gemini launched and handed off to the Google clone. microG RE was installed; no account, chat or conversation-warning path was exercised.

**Remaining limit.** Manager merges a split bundle (`.apks`/`.apkm`) with ARSCLib before Patcher runs and parses the full table there; this does not fit in 512 MB and is outside these patches. On a low-memory phone use the single universal APK of the supported version, or keep Manager's embedded VM on.
