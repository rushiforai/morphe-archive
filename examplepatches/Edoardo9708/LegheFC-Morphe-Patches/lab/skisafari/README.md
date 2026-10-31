# Ski Safari – Unlock All Items (lab)

Target: `com.yodo1.skisafarigp`, version 2.5 / versionCode 108, ARM64.

## Verified native code

- `ShopItemHelper.UnlockAllItems()` RVA `0xC8DC94`, file offset `0xC89C94`.
- `ShopItemHelper.TestUnlockAll()` RVA `0xC8FB90`, file offset `0xC8BB90`; its only instruction is `B 0xC8DC94`.
- The `UnlockAllItems` loop checks each catalog item's virtual `Unlocked` property, sets locked entries to unlocked, clears their `IsNew` flag, and calls `GameState.Save()` (`0xBC23F0`) after the catalog loop. The save call is unconditional on that path, including when no flags changed.
- `GameState.Save()` calls `Profile.Save(true)`; `Profile.Save(bool)` serializes/encrypts the profile and completes its local persistence path before returning.
- The profile class includes the saved coin count and stats separately; the unlock routine does not call coin setters or replace the Profile object.

These observations come from the exact original base APK and ARM64 split copied read-only from the Galaxy S23+. Il2CppDumper reported a protection warning, so the dump is treated as partial evidence; no protection bypass or runtime memory dump was used.

The base manifest reports `allowBackup=true` and `extractNativeLibs=true`; no explicit backup-rule XML was present in the APK. The ARM64 split includes `libpairipcore.so` (SHA-256 `b4b4cc04d323507ff577d86fffa809106ff22de033a783cf3d37752e1da19c0b`). Native PairIP remains unchanged. The current experimental patch reconstructs Java startup around the unavailable VM initialization; see the latest tablet investigation below.

## Runtime approach

The experimental Morphe patch adds `libskisafariunlock.so` and a small Java extension. It uses the verified `UnityPlayer.queueGLThreadEvent(Runnable)` dispatcher. The extension checks that each task executes on the exact `m_MainThread` instance, waits for the IL2CPP domain and profile, then calls the verified native method once. Readiness retries are queued at 500 ms intervals; there is no injected per-frame hook. Static analysis shows the game method calls `GameState.Save()` when it changes unlock flags. A dedicated SharedPreferences marker is committed after the native method returns, preventing repeat calls on later launches. This marker is separate from the game profile.

The original UI-thread approach was replaced by Unity's own queue after inspecting its bytecode. The Java bridge now runs on the tablet, but native unlock execution remains unverified. The helper also waits for `GameState.IsLoadRequested` to become false and a nonempty catalog; it verifies every returned item ID with `IsItemUnlocked` after the call. Only successful in-memory verification permits a marker. The marker does not independently verify persistence across process restarts. Do not use this build on the only copy of a live profile.

The method walks the complete `ShopItem` catalog. Static analysis confirms it changes local `Unlocked` flags and does not make billing calls or write purchase receipts. The catalog was not fully resolved, so this patch should be treated as potentially enabling locally catalogued purchase-associated items; it does not simulate or record a purchase.

## Strict build identity

`libil2cpp.so` SHA-256: `b24154995803633ab95eeea21836f67d74699b305a2ed631a2600c59dfdd639a`

`global-metadata.dat` SHA-256: `b8d2786c3be10261c7c666ce8155f4d1d6d98ec994586e16334219a5fc0f5144`

The patch fails closed if either file differs. The original native library is not replaced. Run the read-only verifier before patching:

```powershell
python .\lab\skisafari\verify-originals.py path\to\base.apk path\to\split_config.arm64_v8a.apk
```

Build the JNI helper on Windows with the installed Android NDK:

```powershell
powershell -ExecutionPolicy Bypass -File .\lab\skisafari\build-native.ps1
```

## Current limitations

- The Android runtime call has not been exercised on-device. Unity thread safety, PairIP/license behavior after Morphe re-signing, save visibility after process exit, and the precise item catalog still require a disposable test installation.
- A different APK signature can prevent updating the Play-installed original; keep the original app and its data untouched until a safe test plan exists.
- Standard Gradle compilation stops during plugin resolution: the existing GitHub credential receives HTTP 401 from GitHub Packages. Repository access is available; package-registry access is separate.

## Local Desktop build

The installed Morphe Desktop fat JAR provides the patcher API. `build-local.ps1` uses the installed Kotlin compiler, Java compiler and Android D8 to compile the new patch and merge it into an existing local bundle. Existing JVM classes and resources are preserved; D8 merges the patch and extension DEX files. This incremental local build does not replace verification of the complete repository with Gradle.

```powershell
.\lab\skisafari\build-local.ps1 -DesktopJar ..\morphe-desktop-1.20.0-all.jar -BaselineBundle ..\morphe-test-f13\patches-f13-local.mpp -OutputDirectory ..\morphe-test-skisafari-build2
```

For APK sets, `MergeApk.java` invokes the merger bundled in Morphe Desktop on a copy. The CLI patch command expects the resulting merged APK, not the ASPK container. All output stays on the PC; the scripts do not install applications.

Local verification completed with Morphe Desktop 1.20.0:

- Kotlin, Java and both DEX merges compiled successfully.
- Morphe listed the patch with package `com.yodo1.skisafarigp`, version `2.5`.
- The corrected resource loader resolves the helper through the patch bundle's classloader.
- Patching, rebuilding and signing the merged APK succeeded. Android apksigner verified APK Signature Scheme v2.
- `VerifyApk.java` found exactly one `onCreate` hook and the runtime extension in the final APK.
- ZIP CRC validation and SHA-256 checks confirmed unchanged original IL2CPP/metadata and the correct helper.
- Original bundle JVM classes and resources were preserved; only the combined DEX files and bundle manifest changed.

Output directory on this PC: `morphe-test-skisafari-build2` (outside the repository). The test APK SHA-256 is `b1ab4624e372b63f56cda9591ea9e42b2f5de9ccfc2c2ea360011bfd3976fd3e`. No runtime execution or persistent save success has been established.

## Tablet startup investigation (2026-10-30)

The user authorized replacing the original tablet installation. The test device is Samsung SM-T870, Android 13. The profile copy was restored before launch, and its SHA-256 remained identical to the PC backup after all tests. App-private data were inaccessible before replacement, so the external copy is not represented as a complete backup.

The locally signed app displays Google Play's "Download this game from Play" screen and exits before any `SkiSafari-Unlock` bridge log. Live crash capture identifies `SIGSEGV / SEGV_ACCERR` in `libpairipcore.so`, PC offset `0x5ECC4`, during startup. This is before Unity and before the native unlock helper is invoked.

Three controls isolate the problem:

| APK tested | Result |
| --- | --- |
| Unlock build with an experimental omission of Java license initialization | Same native crash before the bridge |
| Merged original APK, no unlock changes, signed with the same test key | Same native crash |
| Original base and ARM64 split kept separate, each signed with the test key | Same native crash |

All 12 original DEX files and all 15 native libraries in the merged control were verified byte-for-byte against the original APK set. In the split control, manifests, resources, assets, DEX and native files were unchanged; the signer replaced signing metadata, including the original SourceStamp marker. The tablet's previously installed original base APK also matched the source base APK SHA-256. Thus the failure is reproduced by re-signing the original APK set; the split merger and unlock logic are not required to trigger it. PairIP's exact internal failure condition has not been decoded.

The Java licensing omission was ineffective and was removed from the final patch. The game-thread dispatcher improvement is retained and compiles. No PairIP native instructions were changed speculatively. VMRunner is used by virtualized app code, so deleting the library would discard required execution machinery.

Runtime success, unlock success, reading the restored profile, and persistent save success remain unverified. A verified solution for locally signed PairIP startup is required before further unlock tests. These controls left the re-signed original split control installed. It was subsequently replaced by the build 6 research experiment described in `ONLINE-RESEARCH.md`, which also fails before Unity. Reverting to the original signature requires replacing that test installation again and restoring the external profile copy.

The final source (without the ineffective Java licensing change) was compiled into `morphe-test-skisafari-build4/patches-skisafari-local.mpp` and applied offline to produce `SkiSafari-unlock-experimental.apk`. Patching, rebuilding, signature verification, ZIP CRC checks and the DEX hook check passed. This final artifact was not installed for another redundant native-startup test.

## Online research and save alternative

See [ONLINE-RESEARCH.md](ONLINE-RESEARCH.md) for primary sources, tested startup strategies, their limits, and the independently verified save obfuscation routine. The historical build 6 diff is retained separately; current compiled sources include the later guarded startup reconstruction.

Read-only inspection of a profile copy:

```powershell
python .\lab\skisafari\inspect-profile.py path\to\ORIGINAL_40_CHARACTER_ID.profile
```

This tool validates the ID header, integer table, next-section count and exact XOR round trip. It does not implement an unlock edit or claim complete save-schema validation, and it never writes its input.

## Latest startup reconstruction: builds 7–15

This section supersedes the historical installed-build descriptions above. All tests target the SM-T870 tablet; the S23+ and original PC backup remain untouched.

- The original APK includes direct, non-VM SDK alternatives: `SplashActivity1`, `Yodo1Application1.onCreate`, and `Yodo1LagacyUnityActivity`. The manifest selects the two alternative activities, while the existing Application retains its base initialization and reuses the shipped direct `onCreate` lifecycle sequence.
- The legacy player's old `UnityPlayer(ContextWrapper)` call is adapted to the existing `UnityPlayer(Context)` constructor, preserving the object and arguments. The extension resolves inherited dispatcher methods correctly.
- Guarded, local literal repairs restore the Google Games Binder descriptor from its own interface factory, the HTTP/2 `:method` constant, WorkManager's WorkName table/foreign-key pragma and three column names from the database schema, and two diagnostic log prefixes. A null-only HandlerThread label fallback is limited to its four-instruction constructor. No receipt, payment response, purchase callback or server identity is fabricated.
- Build 13 reached the Java patch marker and loaded both `libmain.so` and the helper, then failed in an online-config diagnostic callback and OkHttp header initialization. Build 14 corrected those failures and remained alive for the initial 25-second observation, with a black screen while the tablet was dozing and keyguard was showing. A cold restart then exposed the missing WorkManager column literal repaired in build 15. A live process with no foreground focus is not proof of a working game.
- The updated native helper uses `RTLD_NOLOAD` with the existing IL2CPP image instead of assuming globally visible exports. It waits for the game's load-request flag to clear, rejects an empty catalog, and verifies unlock flags in memory before returning success. Two native rebuilds produced identical SHA-256 `30b436e598dbcab85d00ac4978a6b8e235c77ebc1b73893b0eccf7056e590e4a`.
- Desktop 1.20.0 full resource rebuilding consumed unchanged native input files twice when accessed with `ResourcePatchContext.get`. Identity checks now stream the source APK ZIP directly via the host's private `config.apkFile` fields. This workaround fails closed on unsupported host layouts; Manager/other patcher compatibility is unverified.

Native unlock execution, item persistence and restored-profile visibility are still **unverified**. Build 15 requires a foreground test on an unlocked tablet. It must not be merged to a release branch as a working unlock patch.

## Foreground results: build 18 (2026-10-31)

This section supersedes the earlier runtime status. The tested build is compiled from the current Kotlin/native sources; no new install or save restore is needed to reproduce the user's current tablet installation.

- Build 15 reached the Unity dispatcher but terminated with signal 11 before profile readiness. Static inspection showed `il2cpp_domain_get` lazily allocates a domain even before runtime initialization. Build 16 removes domain creation/thread attachment and waits for `il2cpp_get_corlib` plus an already attached `il2cpp_thread_current` on Unity's own thread. Unity now initializes normally and reaches the persistent profile.
- AppLovin 13.3.1 initialization then exposed missing configuration keys and a thread-name prefix. These literals were recovered by comparing the same classes with the official Maven Central AAR, retaining the original settings and defaults. No replacement SDK or original APK was added to Git.
- Build 18 compiled, patched, signed and installed successfully. It displayed the game's privacy screen and remained alive after several minutes. Logcat recorded `Profilo persistente pronto` and the actual `Avvio ShopItemHelper.UnlockAllItems()` call at 01:38:46, followed by the method's return.
- The postcondition reported some catalog entries still locked, so no successful one-shot marker was written. This is a real incomplete verification, not an unlock-all success. `Item_Booster.get_Unlocked` is verified to always return false and its setter is a single RET; other specialized categories also require separate examination. The current generic error text does not identify the failed category.
- The original imported profile stayed byte-for-byte unchanged. The game created an additional device-specific profile and saved data there. Static inspection confirms `GameState.CoinCount` adds the persistent profile's coins to the other-profile coin total; the active profile's separate zero coin field alone does not demonstrate loss of imported coins. Full progress visibility and persistence still require UI/restart verification.
- The user reports that the behavior they care about appears to work. This is recorded as user feedback, not proof that every item category or a cold-restart save check passed.

Runtime helper SHA-256: `c25c0db59c0eb45f55bd1df42407e4e56d790fd1af90dc5c0a40744a36d1b4b4`. Local artifacts remain outside Git under `morphe-test-skisafari-build18`. The branch remains experimental; no merge to dev/main or stable release was performed.
