# Deezer 9.0.27.3: protected startup for re-signed builds

Source base: `e04d798c01cc` on `feature/deezer-9002703`. This batch ports the
`../deezer` protected-startup restoration into the shared patch bundle.

## Why the Play installation block appeared

Deezer 9.0.27.3 ships a PairIP wrapper as `android:name` on `<application>`.
The wrapper calls `SignatureCheck.verifyIntegrity` and
`LicenseClient.checkLicense` before Deezer's own `DZMidlet` lifecycle. A
re-signed APK cannot pass that Play installation check, so every patched build
must use Deezer's own lifecycle instead.

## Ported startup layer

- `StartupCompatibilityPatch.kt` restores `deezer.android.app.DZMidlet` in the
  manifest, disables the PairIP `StartupLauncher.launch` VM call, verifies the
  wrapper still extends `DZMidlet`, and checks the integrity/licence calls it
  replaces.
- `StartupStrings.kt` restores 1,560 static application string constants across
  32 holder classes that PairIP initializes before providers run.
- `StartupExtractedMethods.kt` restores 20 lifecycle methods.
- `StartupCallbacks.kt` restores 20 receiver/background callbacks.
- `StartupNativeLibraries.kt` applies integrity-checked deltas to
  `libflacJNI.so`, `libquickjs.so` and `libACRCloudUniversalEngine.so` for
  arm64-v8a, x86 and x86_64. No complete library is embedded.
- Every Deezer patch now depends on `deezerBase`, which depends on the startup
  restoration. The bypass applies even when the original package name is kept;
  `Side-by-side installation` only changes the Android identity.

## Verified input and output

Original APKM SHA-256:
`ca4c9662e18f49d11b234c1c21437767d7afe1551aa28abf9dbabdaa1be7d83e`.

All nine bundled Deezer patches applied together with no failed patch or step:
Android Auto API 9 media surface, Disable tracking, Google sign-in through
microG-RE, Player queue shortcuts, Search and sort playlists, Enable queue item
selection, Remove advertising, Remove premium upsell UI and Side-by-side
installation. The patched manifest names
`deezer.android.app.DZMidlet` as `<application>`; no PairIP application remains.

Runtime checks used a disposable ARM64 Android 15 automotive emulator. The
signed sibling build (`deezer.android.app.morphe`) started, reached
`AuthUIActivity`, and showed `WELCOME TO DEEZER` with sign-in choices. The
original-package build (four ordinary defaults, no side-by-side) also started
and reached the same welcome screen. Logcat contained no
`FATAL EXCEPTION`, `VerifyError`, `LicenseClient`, `SignatureCheck`, PairIP or
Play Store block during either launch.

The sibling run above included the microG patch. That patch was excluded from
the second ordinary-package run because its `WelcomeViewModel` rewrite produced
an unrelated `VerifyError`; startup itself was clean. The microG port remains a
separate acceptance item.

Focused JVM data tests pass:
`StartupCompatibility2703Test` covers the 32-class/1,560-string table and the
nine ABI-specific native deltas.
