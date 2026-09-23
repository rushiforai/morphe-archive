# Steam Link 2.0.23 / 5002363 adaptation

Checked 2026-09-15. The new bundle contains the same 6 patches and option defaults as the previous recommended set, adapted to the new native addresses and Java code. Every previously supported exact version/build target, patch default and option definition is preserved in all 4 generated catalogs.

## Patch selection

| Patch | New recommended bundle | Adaptation |
|---|---|---|
| Galaxy XR high-resolution 3-projection fix | Yes | Verified 3 projection families × 2 eyes; reuse existing API layer without modifying Valve renderer bytes |
| GXR tongue bridge (version 5002322 and above) | Yes | Independently verified Android face-map block at `0x141c6c`; preserves standard tongue slot and other face expressions |
| Microphone input preset | Yes | `MOV W1` at `0xf44c0`; default Voice Recognition |
| OLED color calibration | Yes | Shader at `0x970a1`, 1087 bytes; formats at `0x10c840`, `0x10c8b0`, `0x10c920`; same Final balanced/sRGB8/no-dither defaults |
| Unrestricted battery usage | Yes | Battery-only call after stock `SteamLink.onCreate` super call; parameter registers verified before reuse |
| Visual Delay Fix | Yes | Pose hook at `0x101f1c`, 6 velocity stores, guarded executable mapping over `.comment`; default 60 ms |
| Device identity | Optional | Verified exact-product lookup; fills `xrvst2ue`/`xrvst2` entries; standalone missing `ids.xml` packaging fix scoped to this exact base |

The 14 legacy public patches remain excluded. The new bundle preserves Valve's native launcher, splash, XR activity start mode, runtime permission requests, controller/hand routing and face mapping. Retired experiments remain retired. The new exact compatibility is `(2.0.23, 5002363)`, never another version name paired with this build code.

## Exact inputs

| Input | Evidence |
|---|---|
| Original APK | `../Best Apks/android-steamlinkvr-release-2.0.23-5002363.apk`, 41,350,487 bytes |
| APK SHA-256 | `36b21974db9f5cd9f54cdf850565b80d31c76a2dd7608406fe160e3005d976d6` |
| Package metadata | `com.valvesoftware.steamlinkvr`, `2.0.23`, `5002363` |
| Signature | APK v2 verification passed; signer subject Valve Corporation; certificate SHA-256 `5dff6b05761447a5bdf919ea88fc6fdf20d301e30b2315415c4d368ec0fbda45` |
| Native library | `lib/arm64-v8a/libvrlink_scene.so`, 2,292,008 bytes |
| Native SHA-256 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` |

The original APK's binary manifest, native library and 4 configuration assets match the supplied decoded tree. Fresh apktool 3.0.3 decoding reproduced all 104 supplied smali files byte-for-byte. Source APK and decoded files were not modified.

Detailed evidence: [native addresses and call paths](native-targets.md), [Java/config and source provenance](surface-targets.md), [high-resolution topology](high-resolution.md).

## Validation results

- Current Kotlin production source compiled against cached Morphe dependencies; all **108 JUnit tests passed**.
- All **7 standalone patches** successfully patched the original signed APK as an input. Output audits checked expected scene bytes, stock DEX preservation or the battery-only modification, unchanged configs outside identity, and stock startup/native permission boundaries.
- The **6-patch recommended bundle** successfully patched both the original APK and the rebuilt decoded fixture. The packaged local `.mpp` was then used as the class/resource source to patch the original APK successfully again. Outputs are unsigned audit APKs.
- Forced excluded startup dependencies on 5002363 remained inert: stock DEX/native code and startup behavior markers were preserved.
- OLED production helpers passed **63 variants, 567 format/dither transitions and 126 checkbox cases per base** on 5001712 and 5002363. Checks covered exact diff regions, all format instructions, shader interfaces/NUL boundaries, idempotence and unchanged source hashes.
- New native helper audit passed **4 microphone presets/16 transitions**, tongue block/idempotence/invalid-byte checks, **6 representative HMD offsets/36 transitions**, and **24 combined native patch execution orders plus reapplication**. HMD offsets include 0, 1, 60, 100, 1000 and 4000 ms.
- Malformed HMD mapping regression covers 10 corrupted ELF headers on same-offset and changed-offset reapplication. The reviewer reproduced the original `p_memsz=0` issue, verified its rejection after the fix, and reported no remaining actionable findings.
- Older regression: **5 available recommendation fixtures**, **7 high-resolution fixtures**, and **6 Visual Delay fixtures** passed, including the new base. Old HMD outputs were independently compared with the preserved size-only helper on 5001712/5002244. Old native microphone options retained their original 4-byte sites.
- All 4 regenerated JSON catalogs retain **every old exact target, default and option definition**. The new pair exposes 7 individual patches and exactly 1 recommended bundle. The bundle membership test asserts the same 6 direct dependencies as the previous base.

Evidence logs and unsigned outputs: `build/audit-5002363/`. Catalog comparison: `catalog-regression.json`; final tests: `compile-final.log`; native options: `native-options-final.log`; OLED matrix: `oled-options.log`; original-APK bundle verification from packaged code: `archive-patching.log`.

## Build status and local artifact

The standard Gradle build remains blocked resolving the existing pinned plugin `app.morphe.patches:1.3.3`. No plugin version or repository authentication settings were changed. Validation used the locally cached Kotlin compiler and `morphe-desktop-1.13.1-all.jar`, compiling the current production source and freshly assembling the helper DEX resources.

Local bundle: `patches/build/libs/patches-1.16.0-5002363-local.mpp`.

SHA-256: `9f036c86fec67588480dd707d278ee4dc06af6682d6a996af3a2a9a44b54024a`.

This is a locally compiled and APK-tested bundle, not a published release or a successful Gradle release build. The release feed metadata remains unchanged.

## Repeatable checks

When the pinned Gradle plugin resolves:

```powershell
.\gradlew.bat test :patches:auditOledDecodedCompatibility :patches:auditSteamLink2363Native
.\gradlew.bat :patches:auditDecodedSteamLinkPatches
```

Cached local route (requires the cached dependency JARs described in the script):

The runner now matches Gradle's **JUnit 4** adapter and JVM 11 bytecode target.
Its default tool directory is `build/startup-boundary-tools`. Alongside the existing
Gson, JCommander, Kotlin-test and Morphe Desktop JARs, supply these Maven Central
artifacts with the filenames shown (the Kotlin adapter must match `kotlin-test.jar`):

| Local filename | Artifact in the verified cache |
|---|---|
| `junit4.jar` | `junit:junit:4.13.2` |
| `hamcrest-core.jar` | `org.hamcrest:hamcrest-core:1.3` |
| `kotlin-test-junit.jar` | `org.jetbrains.kotlin:kotlin-test-junit:2.3.21` |
| `junit.jar` | `org.junit.platform:junit-platform-console-standalone:1.12.2` (test launch only) |

The platform console JAR contains Jupiter APIs and must stay off the compiler
classpath; otherwise it can hide imports unavailable in CI. Test execution uses
its Vintage engine for JUnit 4. This cached compiler remains a fallback, not proof
that the authenticated Gradle release build passed. See
[`CI-JUNIT-FIX-20260915.md`](../steamlink-hitches/CI-JUNIT-FIX-20260915.md).

```powershell
& diagnostics/steamlink-5002363/Compile-CachedAudit.ps1 -JavaHome F:/Runtimes/Java21 -OutputDirectory build/audit-5002363/my-check
$auditCp = Get-Content build/audit-5002363/my-check/runtime-classpath.txt -Raw
java -cp $auditCp util.OledDecodedCompatibilityAudit (Get-Location).Path
java -cp $auditCp util.SteamLink2363NativeAudit (Get-Location).Path
java -cp $auditCp util.DecodedSteamLinkPatchAudit build/decoded-fixture-apks build/audit-5002363/my-check/apks recommended 4
```

The APK audit accepts a fixture directory. To repeat original-APK checks, copy the verified original APK under the fixture filename `decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363.apk` in an isolated directory; do not rebuild or overwrite the signed source. Audit modes include `public-modern 0..6`, `recommended 4`, and `startup-excluded 1`.

No APK installation, ADB command, device permission grant, headset run, SteamVR mutation or driver deployment was performed. Runtime format acceptance, rendering quality, actual HMD timing, microphone behavior and tongue tracking on 5002363 still require headset validation. Older runtime results are not presented as new-base proof.
