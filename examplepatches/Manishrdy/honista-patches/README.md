# Honista patches

Testing repository for the Morphe **Honista v13 complete local fixes** patch bundle.

In Morphe Manager, add `https://github.com/Manishrdy/honista-patches` as a **Remote** patch source. The repository root `patches-bundle.json` points to the **v1.1.2** release. Alternatively, download `honista-patches-1.1.2.mpp` from that release and import it as a **Local** source. Select the original Honista v13 ARM64 APK and the complete local fixes patch. Supported package/version: `cc.honista.app`, `426.0.0.37.70` (version code `383207254`).

See [the patch project guide](honista-patches/README.md) for compatibility checks, included changes, building, and signing instructions. Updating an existing patched installation requires its original signing key, which stays outside Git.

## Build

```sh
cd honista-patches
./gradlew :patches:buildAndroid
```

The result is `honista-patches/patches/build/libs/patches-1.1.2.mpp`. JDK 17+ and Android SDK platform 36/build-tools 36.1.0 are required. Fresh GitHub Packages dependency downloads may require your own read-packages credentials as described in the guide.

## Files excluded from Git

| Files | Reason |
| --- | --- |
| `*.apk`, `*.apkm`, `*.xapk` | Original apps and generated APKs |
| `analysis/`, `decoded/` | Local investigations, screenshots, captures and full decompiled app |
| `output/`, `*.mpp`, `*.zip` | Generated release artifacts; attach the MPP to GitHub Releases |
| Markdown except `README.md` | Local action log and working notes |
| `build/`, `.gradle/`, `.kotlin/`, classes and logs | Regenerable build/cache files |
| Audit JSON/reports | Local validation records and workspace paths |
| Keystores, private keys, `.env` | Private signing and authentication material |
| IDE/macOS state | Machine-specific files |

The Gradle wrapper JAR, baseline class fingerprints, helper DEX and frozen startup-module DEX are required inputs and intentionally retained. `methods.dex` is generated from the tracked `payload-smali/` sources.

## Validation

Morphe Desktop 1.18.1 successfully patched the original APK with its default mode. All 17 changed/added classes and the startup-module asset match the tested build. Existing modified inputs are rejected. Android Manager UI testing remains pending because the phone was disconnected during bundle preparation.

## Validation fix (1.1.2)

The 1.1.2 release replaces build-time serialized DEX hashes with trusted reference classes serialized by the same runtime writer as the input. This addresses a portability problem in the validation behind the Manager error “differs from the tested original APK”: serialized DEX bytes are not a stable fingerprint across writer/runtime versions. Package/version checks and rejection of changed classes or existing helpers remain enabled. The reference contains only the nine protected original classes and is exported only after checking the original APK against the frozen hashes (the eight retained 1.1.1 entries plus the verified interceptor target). The stale `LX/hf;` replacement was also remapped to its current obfuscated interceptor class; the old name now identifies an unrelated UI class.

Build and import `honista-patches/patches/build/libs/patches-1.1.2.mpp` as a local source. The remote descriptor points to the 1.1.2 release. Run `./gradlew :patches:verifyInput :patches:verifyOriginal` from the patch project to check input guards and patch/compile the original APK. Local verification passed: all nine protected original classes accepted, modified inputs rejected, and the full patch compiled 35 DEX files with the expected module asset. Verification with Manager 2.7.1 / patcher 2.5.0 on Android remains pending; a genuinely different APK will still be rejected.

## Release history

| Version | APK version | Notes |
| --- | --- | --- |
| v1.1.2 | 426.0.0.37.70 (383207254) | Compare input/reference classes with the same runtime writer; correct stale interceptor target |
| v1.1.0 | 426.0.0.37.70 (383207254) | Re-port: remapped 6 R8-obfuscated class names, dropped 6 fully-inlined stubs |
| v1.0.0 | 426.0.0.37.70 (383207254) | Initial release |

## Privacy analysis

The following behaviors were observed during reverse-engineering of the Honista v13 ARM64 DEX for this re-port. These are findings about the **original unmodified app**, not the patched build.

### 1. HTTP interceptor on all outgoing traffic
Honista installs a custom OkHttp3 `Interceptor` (11 517-line class, now mapped as `LX/jچтι...`) on every outgoing request. It constructs a 9-element array, a `LinkedList`, and a `HashMap` before passing the request on — consistent with custom header injection or request tagging. The specific header names are decoded at runtime from an obfuscated integer-keyed string table (`LX/io->a(I)`), making static inspection impossible without dynamic analysis. The string constants `Pgfnphyasfe` and `StrGrpksudjdai` are present in the class and are likely obfuscated header or field names used for device or session tagging across all API calls.

### 2. Startup remote call to an undisclosed endpoint
`Apo3.q()` makes an asynchronous OkHttp3 `enqueue` call on every app start. The target class and URL are resolved at runtime by decoding integer IDs `0xc3501` and `0x61a8f` through `LX/io->a(I)`, hiding the endpoint from static analysis. The response is handled by an anonymous `Callback` (`Apo3$a`). On failure the call retries after a 2 s delay. This is consistent with a license check or telemetry ping to Honista's own servers, separate from Instagram's API.

### 3. Centralized feature-gate hub with 15+ Context methods
The class now mapped as `LX/qغ乆لء...` (formerly `LX/im`) is a large centralized manager with roughly 15 methods that all accept `android.content.Context` as an argument (`j0`, `a`, `Z`, `g`, `h`, `S`, `b`, `c`, `L0`, `E0`, `y0`, `m1`, `j2`, `L1`, `M1`). It is called from the startup activity and from settings-panel Fragments. Some of these methods may evaluate remote state or write to local storage to enforce feature access.

### 4. Obfuscated runtime class loading
Both `Apo3.q()` and `dپΡΩ...` (the sponsored-content stream wrapper, formerly `Asie`) use `ClassLoader.loadClass()` with class names decoded from integer IDs at runtime. This prevents static tools from knowing which classes are exercised on a given code path. It is a standard anti-analysis technique and is also used by Instagram itself, but it means auditing all code paths requires a running device.

### 5. No unexpected third-party SDKs detected
The reverse-engineering work traversed the full DEX (179 274 classes). No class packages corresponding to common analytics SDKs (Firebase, Adjust, AppsFlyer, Branch, Mixpanel, Amplitude, Segment, Sentry, etc.) were identified in the Honista-specific obfuscated namespace. The `com.instagram.*` and `X/*` class space is shared with the upstream Instagram base and is not Honista-specific. The behaviors above originate in Honista's own obfuscated code layer.
