# Morphe Patcher 2.0 compatibility

The bundle now compiles against **Morphe Patcher 2.0.0**, matching
**Morphe Desktop 1.19.0**. The previous bundle compiled against Patcher 1.12.0
and failed during source import with `NoSuchMethodError` for the old
`Compatibility(..., List, boolean)` constructor. The first failure appeared in
Car Scanner, preventing the entire source from loading.

## Changes

- Migrate all Java compatibility declarations to the new `FormFactor` argument.
  NuvioTV and MEO use `TV`; the other apps use `MOBILE`.
- Use Patcher 2.0's full Java `AppTarget` constructor while retaining the existing
  target versions, minimum SDKs and experimental flags.
- Align smali to Patcher 2.0's `4220ae75f7` dependency to avoid duplicate dexlib2
  classes during Android bundle compilation.
- Include form-factor metadata in generated `patches-list.json`.
- Request extraction of Car Scanner's native archive entries before reading
  them. Patcher 2.0 extracts resources on demand; requesting only a workspace
  path no longer guarantees that the original APK entry exists on disk.
- Clear previously generated root DEX files in the Nuvio bundle verifier before
  writing the current output. Patcher 2.0 partitions DEX files differently;
  keeping previous output would produce false duplicate-class findings.
- Reconstruct the full APK DEX set in the verifier: Patcher 2.0's `STRIP_FAST`
  output contains replacement/new DEX files, while untouched original DEX files
  remain in the APK. The cross-DEX check must include both sets.

No app versions or native hook mappings were added. Existing app patch behavior
and targets are retained. Use a client with Patcher 2.0.0; the migrated bundle
is not intended for the old Patcher 1.12.0 runtime.

## Verification

For Android source bundles, use `:patches:verifyAndroidBundle`. It generates the
patch list, runs `buildAndroid`, and checks the final `.mpp` for root-level
`classes.dex` and valid DEX headers. Both `publish` and semantic-release require
this check. A regular JVM `build` alone produces an archive without DEX; it can
also replace an archive previously modified by `buildAndroid`. Always finish
release preparation with the Android bundle verification task.

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
.\build-local.ps1 :patches:verifyMorpheDesktopImport
.\build-local.ps1 :patches:verifyNuvioApkUpdates :patches:verifyCarScanner221Bundle
.\build-local.ps1 :patches:verifyNuvioBeta8Bundle :patches:verifyFirstDescendantVisibility
```

`verifyMorpheDesktopImport` deliberately runs with test classes and the exact
Desktop fat JAR alone, rather than Gradle's patcher runtime dependencies. It
checks public patch loading, unique names, supported packages, TV/mobile
metadata, app targets and option access. Override the desktop location using
`-PmorpheDesktopJar=<absolute-path>` if necessary. The default is the workspace
`morphe-desktop-1.19.0-all.jar`.

The local build and exact Desktop import passed: **28 patches across 7 apps**.
The original-DEX APK updater verifier and packaged Car Scanner **2.2.21**
verification also passed. Import was additionally checked using Desktop's
`list-patches --patches=<built-mpp>` command.

NuvioTV **1.1.0-beta.8** standalone selections and all fourteen behavior patches
together passed DEX reload, native-reference and cross-DEX checks, retaining the
same 36 optional-library findings as the original. TFD Companion **1.1.5**
manifest patching, resource compilation/reload and invalid-input checks passed.
The generated metadata comparison confirms that only the 28 form-factor values
were added; existing targets, options and other patch metadata are unchanged.

Desktop 1.19.0 also rebuilt all fifteen NuvioTV patches, including side-by-side
installation, with no failed patches. The unsigned validation APK is
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-patcher2-unsigned.apk`, package
`com.nuvio.santodan`, version `1.1.0-beta.8` / `1071`. ZIP alignment passed;
signature verification reports the expected missing signature manifest for the
explicitly unsigned output. This file has not been signed or installed.
The final APK verifier confirmed exact updater methods, all 17 playback hooks,
resolved extension signatures and no new cross-DEX findings.

The repaired bundle retains version **0.13.0** and replaces the existing
`v0.13.0` release assets, without moving the release tag or running the workflow.
The local bundle is `patches/build/libs/patches-0.13.0.mpp`. Because the version
number is unchanged, a client may retain its previously cached bundle: remove
the old local source/cache and reimport the repaired file if necessary. Adding
an APK to the GitHub release does not affect this constructor compatibility issue.

Logs are under `../.inspect-nuvio-beta8/patcher2-*.log`. This repair is committed
with `[skip ci]` and uploaded to the existing release manually. No workflow,
app installation or device test is required for this release asset replacement.
