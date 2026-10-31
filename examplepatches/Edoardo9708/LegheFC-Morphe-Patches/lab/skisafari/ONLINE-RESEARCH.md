# Startup and save alternatives (2026-10-30)

## Sources reviewed

- Google: https://support.google.com/googleplay/android-developer/answer/10183279?hl=en — Automatic protection includes licensing/redistribution checks and optional native anti-tamper controls.
- Kirby1997 Morphe source (GPL-3.0): https://github.com/Kirby1997/morphe-patches/blob/main/patches/src/main/kotlin/io/github/kirby1997/patches/twitter/BypassPairipPatch.kt — Startup-path strategy and explicit downstream virtualized-method limitations. The reviewed source blob was `758d0b740d5cdceaabc133633c0fc25473257a7a`.
- Kirby1997 license-only source: https://github.com/Kirby1997/morphe-patches/blob/main/patches/src/main/kotlin/io/github/kirby1997/patches/pairip/DisablePairipLicenseCheckPatch.kt — Explicitly does not solve native VM integrity checks.
- https://github.com/ahmedmani/pairipfix and https://github.com/ymuuuu/pairipfix-zygisk — Require rooted hooking environments; excluded by the task constraints.
- https://github.com/SafaSafari/bypass_libpairipcore — The CRC script writes original CRC values for changed archive entries. This is not a valid ZIP-integrity verification and was not used.

These sources do not establish compatibility with Ski Safari. No external executable or ready-made modified APK was installed.

## Local reproduction of the startup strategy

The initial direct VM-call scan found 24 caller methods, including startup calls in `androidx.core.app.CoreComponentFactory` and `Yodo1BaseApplication`. This count does not cover dynamically initialized reflection targets.

`experiments/pairip-startup-build6.patch` preserves an app-specific guarded experiment adapted from the Kirby1997 startup strategy. Its native PairIP library was unchanged and checked by SHA-256. It skipped the native startup launcher, retained the original Application super-call, omitted the local signature gate and license provider, and retained SDK VM callbacks. No license response, billing receipt or server transaction was fabricated.

Build 6 compiled, patched and signed successfully. On SM-T870 it reached the new Application log instead of the native `SIGSEGV`, then failed in `Yodo1Application.onCreate` on a null `java.lang.reflect.Method` (`TJheaMreAW.zYJ`). The original body behind that reflection target was not found among static methods with the matching typed signature. Other SplashActivity methods use the same initialization scheme. Skipping further SDK methods without reconstructing their bodies would risk breaking necessary startup and purchase-related behavior.

The build 6 experiment is retained as a historical research diff. Later compiled sources reconstruct startup with direct alternatives shipped in the APK and narrowly scoped constant repairs; current progress is documented in the README's latest-build section. Native unlock and persistence have not been verified.

Additional primary-source checks for the reconstructed literals:

- AndroidX WorkName schema: https://android.googlesource.com/platform/frameworks/support/+/ad0c5ae108ee47df3e209ed81589a8c4db851866/work/work-runtime/src/schemas/androidx.work.impl.WorkDatabase/14.json — agrees with the WorkName validation block in this exact APK's schema 16 (columns, composite primary key, cascading WorkSpec foreign key).
- OkHttp Header constants: https://raw.githubusercontent.com/square/okhttp/parent-4.12.0/okhttp/src/main/kotlin/okhttp3/internal/http2/Header.kt — confirms `TARGET_METHOD` encodes `:method`, which also remains in this APK as `TARGET_METHOD_UTF8`.

These checks support specific constant repairs, not a generic PairIP bypass or complete SDK restoration. Tests exposed additional missing constants on later cold starts, so short process-survival observations cannot establish success.

For builds 17–18, AppLovin's official integration documentation identifies the SDK coordinate `com.applovin:applovin-sdk`: https://support.applovin.com/en/max/android/overview/manual-integration . The exact version in the game's BuildConfig is 13.3.1. Static comparison used https://repo.maven.apache.org/maven2/com/applovin/applovin-sdk/13.3.1/applovin-sdk-13.3.1.aar (SHA-256 `ce34810afff4e1f9ccc5686b52daf21fa48c80772ff610763be90dacc5484a03`). The comparison recovers nine missing settings keys in `com.applovin.impl.l4` and the literal `AppLovinSdk:` in `r5$c.newThread`. The AAR was inspected on the PC only, not installed or bundled as executable code.

## Save route: confirmed observations, not an applied edit

`Profile.Obfuscate(string udid, byte[] data, int dataLength)` at RVA `0xBD93D0` XORs each byte with a character from the profile UDID: initial character index `3*length/4`, step two, wrap to zero. The observed routine iterates the entire byte array. The profile filename stem supplies the matching 40-character UDID.

On the PC backup, this decoded a matching UDID header, the separate coin count, and 170 integer entries encoded as BinaryReader length-prefixed UTF-8 keys plus little-endian int32 values. The next section has nine float entries. The decoded buffer has zero padding; re-obfuscation reproduces the original file exactly. This proves the obfuscation and inspected sections, not full save-schema or restore compatibility.

`Item.set_Unlocked(true)` (RVA `0xC52D74`) passes the object's name and value one to `GameState.SetInt`. Product subclasses override unlock behavior and must be distinguished from normal game items. A future save transformer must enumerate the actual item catalog, preserve all unrelated bytes/values, and validate every edited field. No unlock candidate has been written yet.

`inspect-profile.py` only reads its input and emits a structural report. It has no write or restore operation. Personal saves and decoded payloads stay outside Git. The original backup, phone, and game progress were not changed by this analysis.
