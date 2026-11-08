# Experimental two-site routing patch

The Java core is compiled and tested locally against Android Studio's real dexlib2 3.0.9. The Kotlin Morphe adapter and `.mpp` build are **not yet verified**. No installable APK or `.mpp` is supplied.

The experiment adds a branch to `btxk.h()` and `qxa.b(...)`: when the vehicle provider is specifically `tql` (projected car information) and its vehicle enum is `CAR`, select the existing `TWO_WHEELER` mode. All other cases run the original code, including the original MOTORCYCLE feature-flag behavior. It does not change enum definitions, globally enable configuration flags, or alter the car-information getter.

The exact original method signatures, registers, instruction operands/references/branches, and exception regions are pinned with complete SHA-256 fingerprints. The adapter also restricts package, versionName and versionCode. Both methods are validated before mutation; repeated application is rejected.

## Reproduce local tests

From the workspace root:

```powershell
.\scripts\test-core.ps1
```

Outputs: `analysis/experiment/classes2.dex`, `classes4.dex`, `verification.txt`. These are analysis artifacts, **not installable packages**. The other original DEX files are untouched. Tests re-read both output DEX files and compare all method bodies against expected bodies, then interpret the modified selector/builder prefix for 64 mock-host cases. The interpreter is not ART or a routing engine.

## Morphe build

Versions follow the official template checked on 2026-11-07: Gradle 9.8.2, plugin 2.1.0, patcher 2.2.0, smali commit 4220ae75f7. This workspace only has Gradle 9.5.x cached. A compatible Gradle installation, Morphe dependencies, and any GitHub Packages credentials required by upstream must be available before:

```powershell
gradle -p patch buildAndroid
```

No wrapper binary is fabricated or downloaded from an unverified source. Once dependencies are available, the Kotlin adapter must be compiled and tested using Morphe's actual patch application before treating any `.mpp` as usable. Source API references: [template example](https://github.com/MorpheApp/morphe-patches-template/blob/main/patches/src/main/kotlin/app/template/patches/example/ExamplePatch.kt), [context](https://github.com/MorpheApp/morphe-patcher/blob/main/src/main/kotlin/app/morphe/patcher/patch/BytecodePatchContext.kt), [MutableMethod](https://github.com/MorpheApp/morphe-patcher/blob/main/src/main/kotlin/app/morphe/patcher/util/proxy/mutableTypes/MutableMethod.kt).

## Limits requiring resolution

- Actual MS700CL vehicle type has not been read. UNKNOWN, TRUCK and native MOTORCYCLE keep original behavior; this patch targets a head unit reporting CAR.
- The selector now evaluates the vehicle provider earlier than the original feature-flag check. Provider initialization and connect/disconnect timing require a device test.
- `tql` has a reset-to-UNKNOWN path; the lifecycle callback resets it before publishing false. This is static evidence, not a proof against stale state during every reconnect race.
- When `qxa.b` reuses an existing `ybr`, it takes its existing request object. The experiment does not rewrite a pre-existing driving route. Cold starts and phone-to-AA handoff must be tested separately.
- New request mode serialization is traced to `yff.p -> cjfo.c`. Java rerouting reuses route/request objects, but native/offline reroute and server results remain unverified.
- The experiment does not provide rename/signing/AA-discovery support. Dutch's existing bridge targets a different Maps build; do not stack it without porting and verifying its source/license.
- No on-device execution, ART verification, real road routing, or claim of 125cc route legality.
