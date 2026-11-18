# Magic Earth 7.1.26.38 initial static findings

Status: investigation in progress; no patch built, no runtime acceptance, no physical device accessed.

## Input identity

Package: com.generalmagic.magicearth. Version code: 2026141716.
Base APK SHA-256: cc60a574395bf26fbcae6d16cdd2a7991cb11ac5e2bb04b46f7a9c1811e3a7ab.
ARM64 split SHA-256: 330f709fc0ef8f894d77dfb48be7170407c1128e013c16814e7a0e108f1b5539.
Supplied APKM remains unchanged in Downloads.

## Observed evidence

- ARM64 split contains libapp.so, libflutter.so, libGEM.so and libdartjni.so. Main application UI and subscription logic have Flutter AOT targets; Java patches alone do not establish an unlock.
- AndroidAutoService.createHostValidator (decompiled lines 16-19) already returns HostValidator.ALLOW_ALL_HOSTS_VALIDATOR. No change is required at this service admission point. This does not establish compatibility with every custom host.
- Manifest MainActivity has MAIN/LAUNCHER but no LEANBACK_LAUNCHER. Minimum Android API 28, required GLES 3.1. Adding a TV launcher entry alone cannot establish remote focus, input, rendering or location support.
- libapp.so string inventory contains premium_gate_handler.dart, settings_premium_gate.dart, content_store_premium_gate.dart and map_update_premium_gate.dart. These identify likely UI gating code, not recovered executable control flow.
- DebugSubscriptionOverrideStore, LoadDebugSubscriptionOverrideEvent, SetDebugSubscriptionOverrideEvent, copyWithDebugOverride and enforcePremiumGatesIfNeeded survive in the release AOT string table. Reachability, persistence keys and effective entitlement semantics remain unknown.
- FlutterMessageHandler dispatches onSubscriptionStatusUpdated(boolean) to MainActivity.FlutterCallbacksImpl, which broadcasts status to car connectivity. Changing this callback alone would not change Flutter entitlement or SDK authorization.
- libGEM.so contains CTelemetryLogger, SerializeUsage, SerializeStorageData and CNavTelemetryLogger names. Their inclusion establishes telemetry implementation code, not active collection or transmission.
- The Flutter string table contains “Zero Ads. Zero Tracking. 100% Yours.” This is product copy, not privacy verification. Amplitude-named strings overlap audio recording amplitude APIs and must not be classified as analytics without tracing.

## Requirement status

| Requirement | Current evidence | Still needed |
|---|---|---|
| Traffic-aware navigation | Traffic preferences and restrictions symbols exist | Trace entitlement and GEM online authorization; validate actual traffic routing |
| Activity recording | Activity recording bloc/config and start/stop messages exist | Recover local gate and storage dependencies; validate record/save/playback |
| Offline maps | Explicit premium-feature asset and content/map-update premium gates | Separate local gate from map service authorization; validate download and offline use |
| Elevation map style | Native car SettingsViewModel has onStyleHasElevationChanged calling SettingsRepository.setStyleHasElevation | Trace Flutter gate, terrain resources and native renderer; validate rendered style |
| Allowlist removal | CarAppService already accepts all hosts | Inspect other admission and surface paths before proposing changes |
| Custom Android TV surfaces | No TV launcher entry observed | Implement bounded compatibility changes and test input/rendering; universal compatibility is unproven |
| Ads/tracking removal | Native telemetry implementation names present | Trace initialization, opt-out controls and outbound usage; identify actual advertising code |
| Premium upsells | Flutter premium pages and gate paths present | Recover executable UI paths and hide offers without stranding navigation |

## Next implementation boundary

Recover Flutter AOT control flow before selecting entitlement/UI mutations. Inspect GEM telemetry controls and TV input behavior. Preserve SDK network functionality needed for navigation and map delivery. Keep changes scoped to this app; existing Spotify/Videoland work is unrelated. No source commit, promotion or publication has occurred.

## Evidence limitations

jadx terminated with exit 3 and 163 reported decompilation errors. Available Java and manifest output is partial evidence; do not treat the decompilation as a passing build. Repository code-review graph reported zero nodes and files, so it could not guide symbol lookup. No runtime was started.

Compact static evidence archive: .analysis/magic-earth/initial-static-evidence.tar.gz. Large temporary extraction removed after archiving; regenerate from the unchanged supplied APKM for deeper AOT analysis.

## AOT format investigation follow-up

The engine embeds Dart version 3.13.3, Android ARM64 with compressed pointers. Snapshot hash is `0451907c2eaa8467e848c0067bfe8ed4`. The libapp ELF exports `_kDartSnapshotText` (0x6e0000), `_kDartSnapshotData` (0x2c0), and `_kDartSnapshotBuildId` (0x1c8). These differ from the four VM/isolate exports required by the inspected upstream Blutter decoder. Its unmodified entry point exited 1 at the missing `_kDartVmSnapshotData` lookup. Its C++ loader also explicitly requires all four old symbols, so a Python alias alone would not resolve compatibility. No decoder or validation framework was modified.

This is a concrete analysis limitation for the attempted decoder, not proof that AOT recovery is impossible. Next AOT work must use a decoder supporting this snapshot layout or recover the relevant control flow independently. Do not retry the unchanged decoder or guess gate patch offsets from strings.

Native GEM exports Java setters/getters for application authorization and a verifier, plus activation operations. The selected native dynamic-symbol inspection found no telemetry/analytics/usage/consent-named exports. This does not imply telemetry is absent: earlier internal type strings establish telemetry implementation names. Disabling all SDK connectivity would also break traffic/map delivery, so that is not a suitable privacy implementation.

Exact native image hashes, selected export addresses, decoder revision and terminal failure are retained in `.analysis/magic-earth/aot-format-receipt.json` and `aot-decoder-failure.log`. No feature patches, runtime acceptance, device changes, commits or publication occurred during this pass.

## Independent snapshot decoding recovered

The unmodified dae analyzer (https://github.com/ejfkdev/dae; exact revision in `.analysis/magic-earth/reusable/README.md`) exported the exact ARM64 input with exit 0 using its hash-matched Dart 3.13.0 profile. The engine reports 3.13.3 with the same snapshot hash. dae warns the profile is unverified, so symbolic associations and generated IL require cross-checks before mutation. This resolves the practical decoder limitation; the earlier Blutter failure remains valid.

Recovered targets:

- `SubscriptionManagementState.get_isSubscribed`: 0xb79650, size 0x34. LLVM independently confirms its field loads, Boolean branch and return.
- `handlePremiumFeatureCheck`: 0xb96e90, size 0x140. Checks subscription state, otherwise invokes `showMakePaymentPanel`, then rechecks status. Preserve its async Future contract in any mutation.
- `enforcePremiumGatesIfNeeded`: 0xb794b4. Its non-subscribed path calls `_disableElevationWhenMapReady` (0xb7b400) and `_disableTrafficLayer` (0xb7af4c), alongside weather, TTS, HUD and waypoint policy. Prompt bypass alone would leave this enforcement active.
- `DebugSubscriptionOverrideStore.load`: 0x11cb184 returns a constant through the async path; `copyWithDebugOverride` (0x11cb134) copies existing subscription fields. Surviving debug names do not establish a usable release preference override.
- `confirmContentDownload` (0xc02bf8) calls `ensureSettingsPremium` (0xc02c7c), which calls the common premium check. `ensureMapUpdatePremium` is a separate gate at 0xba9154.

Direct callers of the common premium check include both activity-record start controls, map-layer traffic settings, map-style selection, route preferences and navigation settings. Caller evidence is in `.analysis/magic-earth/premium-gate-callers.txt`. This establishes client gates across the requested features, but does not prove remote traffic, map or terrain service authorization.

Decoded output is archived in `.analysis/magic-earth/dae-static-export.tar.gz`. `subscription-getter-llvm.txt` records the independent instruction cross-check. A documented reusable analyzer binary is retained to avoid rebuilding. No product patch, runtime session, physical device operation, commit or publication occurred. Next work must trace downstream feature requests and inlined subscription checks before a coherent guarded implementation batch including TV and privacy behavior.

## TV discovery implementation batch

Added `patches/magicearth/Compatibility.kt` and `TvLauncherPatch.kt`. The exposed control is deliberately named “Enable TV launcher”: it adds LEANBACK_LAUNCHER to the existing exported MAIN/LAUNCHER activity and declares touchscreen, faketouch and leanback optional. It preserves deep links, SDK minimum and required GLES 3.1. It rejects duplicate feature declarations before mutation and rejects repeat application. This does not establish remote input or universal surface compatibility; those remain acceptance requirements.

The supplied base APK passed apksigner verification. Publisher certificate SHA-256 is `fa91bd3a8bfa2b03bda48422b238d584f23921154a5279e721f2f90a74d38806`; the source-stamp certificate is distinct and is not used as publisher identity. Compatibility pins package, full version and version code 2026141716 with the shared original-input guard.

Added focused Kotlin coverage for launcher/deep-link/graphics preservation, optional features, duplicate-declaration rejection and repeat application. Build checkpoint is being executed in an isolated detached checkout based on 8f9b20f8, containing only this app's added source/test files. The first build stopped before compilation at missing Maps-key configuration; the retry uses the existing private key store without printing or copying its value into source. Full verification and runtime acceptance remain pending.

TV batch checkpoint result: `:patches:compileKotlin` and `:patches:test --tests patches.magicearth.TvLauncherTest` completed with Gradle exit 0. JUnit confirms the focused TV discovery assertions passed without errors or failures. Receipt: `.analysis/magic-earth/tv-launcher-junit.xml`; build log: `tv-launcher-build.log`. This proves source compilation and DOM transformation behavior, not patched-APK installation, device compatibility, or full-repository verification. No runtime acceptance was started.

## ARM64 local feature controls implementation batch

Added `LocalFeatureControlsPatch.kt`, exposed as an experimental, default-off “Enable local feature controls” control. It requires the complete ARM64 split set, exact publisher/version identity, and exact original libapp size/hash. Other ABIs and already changed images fail before mutation. This implementation does not yet cover ARMv7 in the supplied two-architecture archive.

The connected edit batch changes four ARM64 instructions:

- 0xb96f40: route the common premium prompt check to its existing true/Future return at 0xb96f58. Recording start controls, download confirmation and map-style/traffic settings use this helper.
- 0xba9270: route the map-update check to its existing true/Future return at 0xba9294.
- 0xb79628 and 0xb79630: NOP only the calls that disable elevation and traffic. Retain all other enforcement calls, subscription state, receipt processing, SDK activation and server replies.

Whole-image and per-function hashes plus exact instruction preimages are checked before producing a copy. ELF PT_LOAD inspection confirmed executable offset equals virtual address in this pinned image. LLVM independently decodes the edited branch destinations and NOP instructions; audit receipt is `.analysis/magic-earth/local-feature-edits.json` with instruction output in `local-feature-edits-llvm.txt`. These establish bounded static edits, not service authorization or runtime feature success.

Focused Kotlin tests use the actual original ARM64 libapp input to check the exact byte-change scope, existing async success branch destinations, input immutability, repeat-application rejection, altered-image rejection and truncation rejection. Compilation/test checkpoint is running in a detached isolated checkout. No Android runtime or physical device was started. Full verification, patched-APK application and functional acceptance remain required.

ARM64 batch checkpoint result: Gradle `:patches:compileKotlin :patches:test --tests patches.magicearth.LocalFeatureControlsTest` exited 0. JUnit confirms no failures, errors or skips with the supplied original image provided. This confirms compilation and bounded binary transformation checks; it does not establish a working feature unlock. Previous TV test evidence remains valid because its implementation was unchanged. Build and JUnit receipts are retained under `.analysis/magic-earth/local-feature-controls-*`.

## Premium promotion widgets implementation batch

Extended the same default-off ARM64 feature-control patch to return empty SizedBox widgets from four traced builders: onboarding `_PremiumSectionState.build` (0xbb5d44), content-store `PremiumRequiredNotice.build` (0xde0f4c), `_PremiumFeaturesViewState._buildPremiumCard` (0xc1e2c4), and `_buildUnlockButton` (0xc1e90c). These are selected promotional surfaces, not proof that every premium entry point is removed.

Each replacement saves/restores the original Dart x15 frame, calls the existing SizedBox allocation stub at 0x73b200, and returns the allocated widget rather than null. Independent LLVM disassembly verifies that stub encodes class ID 7394, matching the recovered SizedBox class. The common allocator at 0x12690ec initializes its fields to null and retains its existing allocation/GC slow path. This avoids relying on the analyzer's inconsistent inherited-field labels or guessed object-pool constants. Exact source function hashes/preimages are checked before mutation along with the full original image hash.

The combined native patch compiled, and the focused actual-input Kotlin checks completed with Gradle exit 0 and no JUnit failures/errors/skips. They verify all four widget entry frames, allocator call targets and returns in addition to the previous gate edits. Independent edited-image LLVM output is retained in `.analysis/magic-earth/premium-widget-edits-llvm.txt`; hashes/edits in `premium-widget-edits.json`. The isolated build baseline was 691aca8d; no unrelated working-copy changes were included. The previous native receipt describes the earlier four-instruction batch; the new combined hash is authoritative for this expanded batch. Runtime rendering and APK-level application remain unproven.

Privacy inspection also identified `com.google.android.datatransport.runtime.backends.TransportBackendDiscovery` in the original manifest. This is a separate investigation target from GEM CTelemetryLogger; the backend's presence alone does not prove active transmission. No ads SDK initialization or active tracking suppression has been verified.

Only a read-only adb device inventory was performed. A physical phone and emulator were listed; neither received app installation, UI input, instrumentation or state changes. No runtime ownership or reusable emulator baseline was established by that inventory. Owned build and scratch storage will be removed after retaining compact evidence.

## Google transport control implementation (not compiled yet)

Owner instruction: do not run Gradle until unused. Gradle daemon processes were observed; this pass did not establish that Gradle was unused and did not launch a Gradle command. No build/test success is claimed for the following new source.

Targeted jadx extraction of the exact original base APK completed with exit 0 for TransportRuntime and CctTransportBackend. TransportRuntime.send schedules new events through Scheduler.schedule; CctTransportBackend.send invokes Retries.retry and returns BackendResponse.ok after a successful HTTP response. These are transport capabilities; static inclusion does not establish which app feature emits events or whether any were transmitted.

Added the default-off “Disable Google telemetry transport” bytecode control and an actual-APK Kotlin test. The control replaces TransportRuntime.send with completion of its original TransportScheduleCallback.onSchedule(null) contract without queuing a new event. It also replaces CctTransportBackend.send with BackendResponse.ok(0), allowing the uploader to discard already queued CCT events without transmission or retry. Both original signatures/call paths are guarded and both replacements are prepared before class mutation. The original package/version/signer guard is mandatory. The code does not disable general SDK connectivity or modify GEM. No callback success is presented as a real upload: the control's stated behavior is local suppression.

Compilation, actual-input DEX checks, callback behavior, queue draining and runtime network suppression are pending. Native GEM telemetry remains a separate unimplemented requirement. Selected Java source and terminal jadx logs are retained in `.analysis/magic-earth/google-transport-source-evidence.tar.gz`; the static receipt records that no Gradle/test was run. No device was touched in this pass.

## GEM storage-path trace

No Gradle command was run. Live daemon-log inspection showed one daemon had started executing a build and had no later idle marker at the sampled time, so the owner's unused-only gate was not met. The Google transport patch remains uncompiled.

Independent ARM64 ADRP/ADD scanning found a reference at 0x10c6f68 to the exact diagnostic string `void sdk_internal::CTelemetryLogger::SerializeStorageData()` at 0x5e015a. The ELF .eh_frame_hdr sorted FDE table places the reference in the function range starting at 0x10c674c (next FDE begins at 0x10c7b94). This establishes an unwind boundary, not a demangled function name or complete source attribution: the native implementation could inline code. LLVM's nearest exported CreateSDKInstance label is not the function's recovered name.

The same bounded region references UTF-16 strings `GMcrashlogs` and `*.dmp` at 0x731998 and 0x7367b2. This ties the region to crash-report storage handling as well as the telemetry diagnostic. It does not establish telemetry transmission or identify a safe global opt-out. Direct B/BL searches found no callers to that FDE start; raw 64-bit address searches also found none. Callback registration, relative/packed relocations or indirect dispatch still need investigation; do not describe the function as unreachable.

No native telemetry edit was made from this evidence. Compact receipt and disassembly are retained as `.analysis/magic-earth/gem-storage-path-receipt.json` and `gem-storage-path-evidence.tar.gz`. No device, emulator or other build was changed.

## Google transport checkpoint and native callback recovery

Before Gradle execution, the live process inventory showed no Gradle clients and every live daemon's latest lifecycle marker was idle. The unused-only condition was checked again immediately before launching the isolated checkpoint. Baseline: 904d3fba. `:patches:compileKotlin :patches:test --tests patches.magicearth.GoogleTransportTest` exited 0 with the actual original base APK supplied. JUnit confirms no failures/errors/skips. This validates compilation and construction of both guarded method replacements, including their remaining callback/response invocations and rejection of repeat application. It does not prove callback execution, queue draining or network suppression at runtime. Receipts: `.analysis/magic-earth/google-transport-junit.xml` and `google-transport-build.log`.

The earlier empty B/BL search did not mean GEM storage serialization was unreachable. ARM64 ADR reference recovery found its entry address loaded at 0x10b4a1c and 0x10cc958. LLVM confirms both sites pass the function pointer 0x10c674c in x1 to helper 0x10c635c, with an object in x0 and zero in x2. Helper code captures the object and function pointer in a reference-counted structure, consistent with callback registration. This is stronger evidence of indirect dispatch than the earlier string-only trace. The exact role of the owning object, usage/event serialization and final network upload paths still require tracing before a native privacy edit.

Selected callback references and helper disassembly are retained in `.analysis/magic-earth/gem-storage-callback-references.json` and `gem-storage-callback-disassembly.txt`. No native code change or device operation occurred in this pass. Full verification and actual patched-APK/runtime acceptance remain pending.

## GEM telemetry object ownership and rejected factory suppression

The exact ref-counted telemetry RTTI name is at 0x749e71. ELF RELA entries connect it to typeinfo 0x2ac2e00 and vtable address point 0x2ac2dd8. The unique recovered code reference at 0x10cc2bc/0x10cc2c0 installs this vtable inside the factory starting at 0x10cc258. This identifies telemetry object creation independently of the nearest exported symbol name.

The factory is called by wrapper 0x10bb2bc, which invokes initialization at 0x10cc354. Initialization references UTF-16 `\Data\Temporary\telemetry.db` and SQL schema labels `stats`, `service`, `units`, `expire`, and `uploaded`. This establishes native statistics persistence capability beyond crash-report storage. It does not prove what user data is collected or sent.

A proposed empty-object factory opt-out was rejected on direct caller evidence: SDK code at 0x10b8f6c calls the wrapper, loads its resulting object, and at 0x10b8f8c branches on null to 0x10b8c3c, which assigns error -14 before returning through the SDK error path. Returning an empty pair would therefore risk disabling SDK startup. No such patch was written. Returning a successful initializer without establishing its invariants was also not implemented. Next native work must trace operational recording/serialization/upload methods while retaining a valid object and lifecycle.

Selected relocation/xref data and independent disassembly are retained in `.analysis/magic-earth/gem-telemetry-owner-evidence.tar.gz`. This pass changed no product code, launched no Gradle command, and touched no device or emulator. Owned native scratch was removed after evidence retention.

## GEM telemetry dispatch source batch (compilation pending)

Recovered SerializeUsage's lambda-related RTTI and its concrete vtables. Code references at 0x10cf140/0x10cf154 lie in the unwind-table function range 0x10cefd8–0x10cfa00. This region references the SQL predicate `expire < ? and uploaded = 0 returning service, units, expire` and CrashDump payload names. Its entry is loaded by ADR at 0x10bc458 and passed to the same job helper 0x10c635c used by the storage callbacks.

Added an experimental, default-off ARM64 “Disable GEM telemetry dispatch” resource control. It replaces exactly three result-unused calls to helper 0x10c635c with NOP: storage calls at 0x10b4a28 and 0x10cc964, and usage call at 0x10bc464. It preserves the required telemetry factory, initializer, database/schema setup and other SDK/native functions. The complete original libGEM size/hash and exact call preimages are mandatory before mutation. ARMv7 remains unsupported by this native control.

Added actual-image Kotlin checks for byte-change scope, original BL destinations, NOP replacements, unchanged factory/initializer prologues, input immutability, altered/truncated image rejection and repeat-application rejection. These new tests have not run. Gradle's live client and busy daemon were observed before the checkpoint, so no Gradle command was launched under the owner's unused-only rule.

Independent edited-image LLVM disassembly confirms the three NOPs and preserved surrounding control flow. Evidence is archived in `.analysis/magic-earth/gem-usage-dispatch-evidence.tar.gz`. This is static implementation evidence, not proof of native network suppression or healthy runtime navigation. Local statistics collection/storage may remain; this control is not represented as complete tracking removal. Full native telemetry coverage, runtime acceptance, remaining upsells, ARMv7 and broad surface compatibility stay open. Owned scratch was removed after archiving; no device or emulator was touched.

## GEM dispatch checkpoint and APK tooling readiness

After live Gradle clients disappeared and every live daemon's latest lifecycle state was idle, the unused-only condition was rechecked immediately before the isolated checkpoint. `:patches:compileKotlin :patches:test --tests patches.magicearth.GemTelemetryTest` completed with exit 0 against the exact original ARM64 GEM library. JUnit confirms no errors/failures/skips. The factory, initializer and every byte outside the three audited call sites remain unchanged by the tested transform. Receipts: `.analysis/magic-earth/gem-dispatch-junit.xml` and `gem-dispatch-build.log`. Runtime telemetry suppression is still unproven.

The installed Morphe desktop CLI is `/opt/homebrew/Cellar/morphe/2.0.0/libexec/morphe.jar`. The shell wrapper inherited an older JAVA_HOME and initially failed with UnsupportedClassVersionError (requires class-file version 70); the installed `/opt/homebrew/opt/openjdk/bin/java` (27.0.1.0.3) launches it successfully. Use an explicit task-owned MORPHE_DATA_DIR for future invocations. CLI help exposes `--exclusive`, per-name enable flags, `--striplibs=arm64-v8a`, result JSON, full bytecode mode, SDK verification, and unsigned output. The engine's BundleFormats declares APKM support. These establish tool capabilities, not successful patching of this input or ABI-strip ordering. No patch application or installation was performed.

Local engineering bundle identity must follow PUBLISHING.md: a clean source commit and `<canonical-version>+review.<source-sha>`, with the existing bundle signing identity. A feature branch remains local/unpublished; main promotion and release approval remain separate. Full verification and actual-input APK/runtime acceptance remain mandatory.

## Authorized phone installation

The owner explicitly requested a patched APK on the phone. Magic Earth was absent on the selected OnePlus phone; no existing installation or app data was removed. Other connected devices were not touched.

Built signed MPP `1.84.0+review.c53de0c004c2` from clean source commit c53de0c004c28be44b849c4e0bfe264615d4a599 after checking Gradle was unused. Bundle signature verified against committed morphe-signing.pub; SHA-256 644729dbf680fc42de4d46b02fd4b9617e84688e54ef0ebe8d16ddf02ae1d64b. No publication or main promotion occurred.

Applied all four app controls with the installed Morphe CLI to an ARM64 archive copy whose original base/native split hashes were verified unchanged. CLI patch, resource/DEX rebuild and signing all completed successfully, with no failed patches. APK signer uses the existing desktop Morphe keystore (certificate SHA-256 5d1055df4dc046456b2ce56ab4b3d89f4f7a21d54e8705c6891f2f96f57436e5).

Verified both patched native image hashes against the independent edit receipts, ARM64-only selection, phone/TV launcher declarations, and decompiled transport completion paths. Installed with explicit phone-targeted adb; exit 0 and Success. Pulled the installed base APK back and verified exact full-file SHA-256 a18846e29535454c55dc23ca499762fd1949dc9c259db4a3b84df8beaf65e820.

Delivered APK: `/Users/jneerdael/Downloads/MagicEarth-review-c53de0c004c2.apk`. Bundle and compact receipts are retained in `.analysis/magic-earth/phone-review/`. This proves installation of the intended patched bytes, not healthy runtime behavior or working traffic/offline/recording/elevation features. The app was not launched, permissions were not granted and no functional UI/GPS/network acceptance was performed. Full verification and the original goal's remaining acceptance requirements stay open.

## Owner-reported Android Auto failure and host compatibility correction

Owner confirms all four requested features work directly on the phone; Android Auto is the remaining critical reported failure. The screenshot reports that DriveDeck cannot bind because Magic Earth's AndroidAutoService requires androidx.car.app.ACCESS_SURFACE. The earlier observation that HostValidator accepts all hosts was incomplete: it did not account for the Android service permission checked before the validator runs. The TV launcher declaration does not solve Android Auto admission.

Added a guarded custom-host resource patch removing only that service's incoming permission attribute. Preserve the app's own uses-permission declarations, native navigation intents and library caller-package/UID ownership checks. Reused the shared androidAutoHostVisibility dependency used by Deezer so Android 11+ can resolve arbitrary host packages, with no host package allowlist. Maps likewise declares its navigation service without an incoming ACCESS_SURFACE binding gate while retaining its own surface permission.

Tracing the native session also found a separate preference-based AppUtils.checkSubscriptionStatus check: false displays a subscription dialog and prevents navigation service registration. Added a guarded native-car dependency to the existing local feature control, returning local eligibility without changing stored preferences, purchase receipts or SDK/server authorization. The previous working Flutter/native feature edits remain byte-identical.

The connected host batch compiled and its focused Kotlin checks passed against the actual original base APK, with no failures/errors/skips. Checks cover removal of only the binding gate, preserved unrelated service permissions/discovery, and replacement/repeat-rejection of the actual native eligibility method. Full host handshake, rendering and navigation acceptance remain pending until the corrected APK is installed and exercised.
