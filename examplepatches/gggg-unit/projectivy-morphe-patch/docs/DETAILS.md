# Technical details

Maintained by gggg-unit. GPL-3.0-only; see NOTICE for references.

## Compatibility

No app version restriction. The patch recognizes the premium wrapper by its native boolean call, and the trial setter by its signature and time calculation. Ambiguous or missing matches stop patching before edits.

Official GitHub APKs 4.71, 4.72 and 4.73 passed patch application and instruction verification with Morphe Desktop 1.18.1. Device testing and Google Play builds are not verified. Future versions may require updates if their code structure changes.

## Build

Run `./build.ps1 -ToolRoot <tools-directory>` with Java installed. The tools directory must contain:

- `morphe-desktop-1.18.1-all.jar`
- Kotlin compiler 2.3.20 and JetBrains annotations under `gradle-home/caches/modules-2/files-2.1`
- Android SDK D8 at `android-sdk/build-tools/35.0.0/lib/d8.jar`

Output: `dist/patches-0.1.0.mpp`.

## Verification

`tools/Inspect.java` reads DEX instructions using the Morphe Desktop jar. Compile it with `javac -cp <desktop.jar> tools/Inspect.java`.

`tools/verify.py` compares original APKs in `downloads/` with unsigned test outputs in `build/`. Set `MORPHE_DESKTOP_JAR` to the jar path before running it. Test outputs are not installable releases.

Two methods change in 4.71; three in 4.72 and 4.73. Other methods in the two inspected classes remain unchanged. Results: [instruction-verification.json](instruction-verification.json).
