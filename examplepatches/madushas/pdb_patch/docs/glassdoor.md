# Glassdoor patches

**App:** Glassdoor — Jobs & Careers (`com.glassdoor.app`) · **version 13.15.1** ·
versionCode `125125` · minSdk 32 / targetSdk 36 · XAPK bundle
(base + `config.arm64_v8a` + `config.en` + `config.mdpi` splits).

**Signer (SHA-256):** `417fbc259ee23a858641efaed3229cdca31cd9b514086c91fbe041b5c15fa952`.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Bypass PairIP** | ✅ | Neutralises the full-VM PairIP (licence/trial/native check + VM), restores the real `com.glassdoor.app.MainApplication`, removes `LicenseActivity`, **bakes the ~1.5k VM-held strings and the reflective-trampoline `Method` bindings**, and points the launcher at the AppCompat theme. |
| **Fix launcher theme (PairIP VM)** | (dependency) | Gives `MainActivity` `@style/AppTheme` instead of the splash theme whose runtime theme-swap lives in the VM. |
| **Remove ads** | ✅ | Strips the advertising-ID / ad-services / install-referrer permissions; disables any ad-SDK init provider. |
| **Disable AppsFlyer** | ✅ | No-ops `com.appsflyer.internal.AFa1uSDK` `start(...)` ×3 and `logEvent(...)` ×2 (the concrete `AppsFlyerLib` implementation). |
| **Disable tracker components** | ✅ | Disables the AppsFlyer install-referrer receiver/provider and any Google measurement component, adds the Crashlytics/Firebase-Analytics opt-out flags, removes install-referrer. Keeps FCM push. |

## Glassdoor's PairIP — what it is and what was recovered

Glassdoor ships the **full-VM** PairIP: `VMRunner` + `StartupLauncher` + `SignatureCheck` +
`VmDecryptor` + native `libpairipcore.so`. Two proven facts:

- the **original, Play-signed** app runs on the test emulator (it stops at the
  `com.pairip.licensecheck.LicenseActivity` paywall), so ARM translation is fine;
- an **unmodified merged + re-signed** APK dies with `Fatal signal 11 (SIGSEGV)` in the
  native layer → the VM cannot survive re-signing and must be neutralised.

Three distinct mechanisms were found in the dex, and **two of the three are fully recoverable
without the VM** — this is why Glassdoor gets much further than adidas:

1. **Reflective trampolines (recovered).** PairIP *extracts* a method: the real body stays in
   the dex under a renamed method (e.g. `MainActivity.y(Bundle)V` holds the real `onCreate`),
   and the original becomes a 3-instruction reflective shim
   (`sget-object <holder>;-><field>:Method` + `Method.invoke(null, [receiver,args])`).
   The `Method` the field must hold is exactly the **static synthetic bridge** in the same
   class:
   ```smali
   .method public static synthetic y$011(Lcom/…/MainActivity;Landroid/os/Bundle;)V
       invoke-virtual/range {p0 .. p1}, Lcom/…/MainActivity;->y(Landroid/os/Bundle;)V
   ```
   `tools/pairip/gd_methods.py` finds that bridge **from the dex alone** (matching signature,
   then verifying the bridge dispatches to a body that calls `invoke-super -><originalName>`),
   and `restorePairIpHolders` bakes a `<clinit>` that resolves it with
   `Class.getDeclaredMethod`. Six trampolines were found; **five resolved** (MainApplication
   and MainActivity `onCreate`/`onStart`/`onStop`/`onDestroy`). The sixth
   (`RevocationBoundService.onBind`) has no bridge and stays dead.
   *(Note: Android 14's `java.lang.reflect.Executable` no longer stores the method name, so
   the mapping cannot be read from a heap dump — it must come from the dex.)*
2. **VM-held strings (recovered).** `tools/pairip/gd_capture.py` parses a root `am dumpheap`
   of the **original signed** app (written against the AOSP `hprof.cc` writer: 13-byte roots,
   `u4` instance size, `0xfe`/`0x00` extensions) and extracts the static `String` values of
   the ~35 generated holder classes → baked into their `<clinit>`s (1457 strings).
3. **Direct `VMRunner.invoke(key, args)` (NOT recoverable).** Some methods — mostly
   receivers and `AsyncTask`s — call the native VM directly with an obfuscated key; their
   bodies are only in the encrypted VM programs (`assets/`), so they are no-ops (which is
   desirable for the *receivers*, e.g. AppsFlyer/Qualaroo/Iterable/work-manager, but also
   kills those `AsyncTask`s).

## Result / honest limits

- **Works:** no native `SIGSEGV`, no `NullPointerException`; the app boots through
  `MainApplication.onCreate` and `MainActivity.onCreate/onStart/onStop/onDestroy` and reaches
  the **real `com.glassdoor.app.presentation.ui.MainActivity`** with no crash (verified on
  RootEmu, x86_64 Android 14). This is further than adidas, whose build dies in
  `MainActivity`/`Application.onCreate`.
- **Limit:** the launcher theme swap (`heo.b()` → `setTheme(postSplashScreenTheme)`) and the
  `setContentView` path are **VM-only** (no dex body, no bridge), so the activity renders an
  **empty root view** — the UI content is never constructed and no API calls are made. Those
  remaining pieces need the VM programs decrypted (native reverse engineering) or a runtime
  capture on a device that can run the original VM.

So the patch set is complete and correct as far as static recovery goes; the residual is a
narrow, documented boundary rather than a fingerprint failure.

## Verification

- **Bytecode/resource (independent re-patch + decode):** `appliedPatches` = the four patches,
  `failedPatches: []`, `[killPairIpFull] callerMethods=20 cleared=20`; the patched manifest
  has `android:name="com.glassdoor.app.MainApplication"`, no `LicenseActivity`, the launcher
  `android:theme="@style/AppTheme"`, the opt-out meta-data, and no AD_ID/ads-services/
  install-referrer permissions.
- **Device (RootEmu):** installs, launches, `topResumedActivity` =
  `com.glassdoor.app/.presentation.ui.MainActivity`, process alive, **0 `Fatal signal`,
  0 `FATAL EXCEPTION`**; the empty content is the documented VM-only residual above.
