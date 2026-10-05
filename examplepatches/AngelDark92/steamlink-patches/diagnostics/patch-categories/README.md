# Patch category validation — 2026-10-03

All 29 public patches carry the 7 agreed categories; stable catalogs contain 26 entries.
The 4 catalogs were generated from freshly compiled patch objects. Removing their new
`category` fields produces exactly the original catalog metadata. Patch mutation bodies,
exact compatibility, defaults, dependency sets, options and canonical resource bytes are unchanged.

The category DSL requires patcher **1.13.0**, bundled in Manager **1.30.0** and Desktop
**1.15.1**. Plugin **1.3.4** supplies Kotlin **2.4.10**; the matching smali revision is
**d856bad65f**. The local compiler **2.3.21** compiled both source sets without disabling
metadata checks. These local results do not establish a successful Gradle/CI release.

## Results

These are historical manual-classpath results, not validation of Gradle dependency
scopes. The subsequent [run 37129119119](https://github.com/AngelDark92/steamlink-patches/actions/runs/37129119119)
for commit `9c63254039e9078489764acac040241751c99194` failed in
`:patches:compileTestKotlin`: `PatchCategoriesTest` could not resolve
`com.google.gson.JsonParser`. The manual recipe supplied `gson.jar`, hiding the
missing `testImplementation(libs.gson)` declaration. Production compilation and
Android packaging passed. The corrective change declares Gson for tests and
runs the complete clean Gradle test/Android/catalog gate before semantic-release.

- Retained decoded inputs: **139 passed, 0 skipped, 0 failed** JUnit tests.
- Isolated tracked-input checkout: **127 passed, 12 skipped, 0 failed**. The skipped
  cases are existing native-byte audits whose ignored decoded inputs are absent.
- Documentation: **4 passed**, generated reference rendered twice identically, and the
  manual grouped index links resolve to existing detailed entries.
- D8 Release/API26 packaging passed. The final archive loads **29 patches**, the exact
  category counts, and **5 default-enabled bundles** using patcher 1.13.0.
- All 3 freshly assembled API33 helper extensions parse to their expected helper classes;
  no original SDL/controller classes are added. Current smali emits standard DEX040 with
  a `0x70` header at API33; the matching parser accepts it. No DEX headers were rewritten.
- Standard Gradle attempts failed before compilation because plugins **1.3.3** and then
  **1.3.4** could not resolve. Their logs and cleanup receipts are retained here.
- No GitHub workflow was run, release published, APK installed, or device/SteamVR state changed.

[Validation receipt](validation.json) includes exact counts and the retained local bundle hash.
This bundle is a local fallback validation artifact, not a published release or patched APK.

## Reproduction

Normal build, once the authenticated Morphe registry is available:

```powershell
./Verify-Build.ps1 -Tasks ':patches:test',':patches:buildAndroid'
./gradlew.bat :patches:generatePatchesList -PreleaseChannel=experimental
python .github/scripts/test_generate_patches_readme.py
python -X utf8 .github/scripts/generate_patches_readme.py AngelDark92/steamlink-patches dev patches-list-all.json TECHNICAL_REFERENCE.md
```

The retained local recipes use the existing cached compiler/JUnit/Gson tools and the
[official Desktop 1.15.1 runtime](https://github.com/MorpheApp/morphe-desktop/releases/download/v1.15.1/morphe-desktop-1.15.1-all.jar)
at `build/startup-boundary-tools/morphe-desktop-1.15.1-all.jar`:

```powershell
python -X utf8 diagnostics/patch-categories/Validate-Local.py --out build/category-recheck/fresh-compiled
python -X utf8 diagnostics/patch-categories/Package-Local.py --work build/category-recheck
```

`Validate-Local.py` compiles canonical production/tests, assembles API33 extensions,
generates all 4 catalogs using the production generator, compares other metadata to HEAD,
and runs JUnit. `--root` can point to an isolated copy of tracked working-tree inputs
without ignored decoded APKs. `Package-Local.py` packages `fresh-compiled` beneath its
supplied work directory; that directory name does not determine fixture availability.
Both recipes are local diagnostic tools, not CI replacements. Remove their caller-owned
temporary source/compiler outputs after preserving logs and any required deliverable.

The general cached compiler helper also accepts `-PatcherRuntime` for an explicit runtime;
its default now points to Desktop 1.15.1 rather than the older category-incompatible runtime.

## Artifact lifecycle

Retain the compact logs, JUnit reports, recipes, validation/cleanup receipts, final local
MPP and official runtime tool. The temporary tracked-input copy, compiler classes,
assembled extension staging, catalog staging and D8 intermediates are task-owned scratch.
[Cleanup receipt](cleanup.json) records only their explicit deletion allowlist. Automatic
approval review rejected its deletion before execution with "blocked by policy"; no files
were removed. Cleanup is deferred until policy permits removal after fresh path checks. Original
APKs, exact decoded bases, canonical native payloads, previous artifacts and other workspace
repositories are preserved.
