# Nike Run Club patches

**App:** Nike Run Club (`com.nike.plusgps`) · **versions 4.80.0 (vc 1717895889) and
4.80.1 (vc 1717921629)** · minSdk 29 / targetSdk 36 · universal APK (arm64-v8a,
armeabi-v7a, x86, x86_64).

**Signer (SHA-256):** `25512576dacc619bd925d1ea05a3e140311d31b0b853183abe1d9da8fd3f240f`.

NRC is a large native Kotlin/Compose app (16 dex) built on Nike's own
`com.nike.mpe.*` platform modules. Unlike the fully-obfuscated consumer apps, the
platform-module class/method names are **kept** (Nike ships keep rules for its
plugin surface), so the fingerprints below use real dex names.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Enable dark mode** | ✅ | Turns on NRC's built-in dark theme. |
| **Remove ads** | ✅ | No ad SDK ships; disables any ad-init provider and strips the ad-ID / ad-services / install-referrer permissions. |
| **Disable trackers** | ✅ | Stops Adobe (Omniture) analytics (extension registration) + disables Adobe messaging components and sets Firebase collection opt-outs. |
| **Nike obfuscator access-gate bypass** | ✅ | Forces `libnike-obfuscator.so`'s signing-certificate gate to allow, so the obfuscated OIDC client id decrypts on a re-signed build (fixes the `accounts.nike.com` HTTP 500 on sign-in). |

## Dark mode

NRC already ships a complete dark theme (`OneNikeDarkTheme` plus a dark Compose
colour mode) but keeps it switched off. The single gate is
`com.nike.mpe.capability.design.implementation.internal.DefaultDesignManager.useDarkMode()`:

```
allowDarkMode && (forceDarkMode || systemDarkMode)
```

- `allowDarkMode` — set from a **remote configuration flag** (off in the shipping build),
- `forceDarkMode` — user/forced override,
- `systemDarkMode` — mirrors the system `uiMode`.

`getColorMode()` returns `ColorMode.Dark` when this is `true`, and every Compose
design provider reads that static colour mode. The patch forces `useDarkMode()` to
`true`, so the Compose surface renders dark regardless of the system setting.

**Status:** bytecode-verified (`useDarkMode()` now starts `const/4 v0, 1; return v0`)
and the app launches cleanly on a patched build. The on-device *visual* confirmation
is pending — NRC gates its themed UI behind sign-in (`AuthorizedActivity`), and the
Welcome screen is a full-bleed photo, so the dark theme can only be seen after
logging in. Older View-based screens keep the light app theme; the modern UI is
Compose.

## Ads

NRC declares **no ad SDK** — the `com.google.android.gms.ads` classes in the dex are
an unused transitive dependency (no `MobileAdsInitProvider`, no App-ID meta-data, no
ad surface). The patch keeps the standard ad-init providers disabled defensively and
strips `AD_ID`, `ACCESS_ADSERVICES_*` and the install-referrer permission.

## Telemetry

- **Adobe Experience Platform (Omniture)** is NRC's usage/event telemetry
  (`com.nike.plusgps.core.analytics.AdobeRunningAnalytics` / `NikeOmnitureImpl` →
  `com.adobe.marketing.mobile.*`). Every Adobe extension is registered through a
  single `MobileCore.registerExtensions(List, AdobeCallback)` call; the patch no-ops
  that method, so no Adobe extension ever registers and no event/identity/optimisation
  payload is built or sent. Adobe APIs are null-safe when uninitialised, so the app
  keeps running.
- The Adobe manifest components are also disabled: `ExtensionDiscoveryService`,
  `AssuranceActivity`, `com.adobe.mobile.MessageFullScreenActivity`.
- Firebase collection opt-out meta-data is set defensively (NRC ships only FCM +
  Installations, no Firebase Analytics extension).
- **Left intact on purpose:** Urban Airship / FCM **push** (the user asked push to keep
  working) and Nike's own first-party telemetry module.

## OIDC login — the `accounts.nike.com` 500

**Symptom:** on a patched build the app launches fine, but tapping *Sign in* makes
Nike's authorize endpoint answer **HTTP 500**. The base app loads normally in the same
browser, so the rejection is about the request the app sends, not about the network.

**Root cause (confirmed statically and in an offline native harness):** NRC obfuscates its
client configuration with `libnike-obfuscator.so`. The library has two layers — a keyed
transform (`x`) and an **access gate** (`a`). Before every transform the gate asks Android
for the APK's own signing certificate
(`PackageManager.getPackageInfo(..., GET_SIGNATURES)` → `PackageInfo.signatures[0]`) and
compares it against Nike's Play certificate, which is baked into the library. The expected
certificate length is compiled into the gate as the immediate `0x332` = **818 bytes**, which
is exactly the length of Nike's `NIKEBOOM` certificate (verified: 818-byte DER, SHA-256
`25512576…f240f`, the same signer the bundle already declares).

On the Play-signed build the comparison succeeds. On a **re-signed** build it fails, the
gate refuses, and the transform returns the literal string
`Invalid Access: Device info reported to Nike.` instead of the configuration value. The
OIDC `client_id` is one of those values: `res/values/strings.xml` holds it as a 408-char
base64 ciphertext (`oauth_oidc_app_id`), and
`com.nike.plusgps.componets.oidc.OIDCComponentModule` (note the misspelled package)
decrypts it at runtime with
`obfuscator.decrypt(application.getString(R.string.oauth_oidc_app_id))`. So the authorize
request on a patched build carries the error string instead of the client id — and Nike's
endpoint answers 500.

**Proof (offline harness: pristine `.so` loaded into the JVM behind a mocked
`Context`/`PackageManager`/`PackageInfo`/`Signature`, real JNI call):**

| library | certificate | `decrypt(oauth_oidc_app_id)` |
|---|---|---|
| pristine | genuine Play cert (818 B) | `cdaf4dbcc130faa860b8860aa771b9db` (the real client id) |
| pristine | foreign cert (804 B) | `Invalid Access: Device info reported to Nike.` |
| pristine | Play cert with **one byte flipped** (818 B) | `Invalid Access: Device info reported to Nike.` |
| patched (taken from the real patched APK) | foreign cert | `cdaf4dbcc130faa860b8860aa771b9db` |

The third row matters: the tampered certificate is the *same length* as the genuine one and
still fails, so the gate compares certificate **content**, not size.

**The patch** (`patches/.../nikerunclub/oidc/NikeObfuscatorGateBypassPatch.kt`) replaces the
body of the gate with an unconditional "allowed" (`return 1`) in every shipped ABI:

| ABI | gate offset | stub |
|---|---|---|
| arm64-v8a | `0x4098` | `mov w0, #1` / `ret` (`20 00 80 52 c0 03 5f d6`) |
| armeabi-v7a | `0x3238` | `movs r0, #1` / `bx lr` (`01 20 70 47`) |
| x86 | `0x3fd0` | `mov eax, #1` / `ret` (`b8 01 00 00 00 c3`) |
| x86_64 | `0x4000` | `mov eax, #1` / `ret` (`b8 01 00 00 00 c3`) |

The keyed transform is untouched, so the configuration decrypts exactly as on the
Play-signed build. Each stub is applied through the repo's existing
`rawResourcePatch` + `Replacement` primitive, anchored on the unique function prologue of
the gate in that ABI, so a future Nike release that moves the gate fails loudly instead of
silently shipping a broken login.

**Status:** static + offline-native verified end-to-end (bundle → real 4.80.1 APK →
patched library → correct OIDC client id with a foreign certificate). Device confirmation
of the actual sign-in is still pending.

## Verification (2026-11-08)

Build: all four patches apply cleanly (`Applied: Disable tracker components /
Disable trackers / Enable dark mode / Remove ads`, `failedPatches: []`).

Bytecode spot-checks on the patched dex:
- `DefaultDesignManager.useDarkMode()Z` → `const/4 v0, #int 1 / return v0`.
- `MobileCore.registerExtensions(List, AdobeCallback)V` → `return-void` (no-ops the
  `MobileCoreInitializer.registerExtensions` call).

Manifest (`aapt2 dump xmltree`): Adobe `ExtensionDiscoveryService`, `AssuranceActivity`
and `MessageFullScreenActivity` all `android:enabled="false"`; `firebase_*` /
`google_analytics_*` opt-out meta-data present and `false`; `AD_ID` /
`ACCESS_ADSERVICES_*` / `com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE`
removed.

Device: patched APK installs and launches to `WelcomeActivity` with no
`FATAL`/`VerifyError`/`UnsatisfiedLinkError`.

> Note: a stray bare `BIND_GET_INSTALL_REFERRER_SERVICE` permission (no package
> prefix — a malformed declaration) remains in the manifest; it is inert.

## Verification (2026-11-19) — obfuscator gate bypass

- Bundle: `./gradlew :patches:assemble` → `patches/build/libs/patches-0.7.1.mpp`;
  `morphe list-patches` shows `Nike obfuscator access-gate bypass`, `Enabled: true`.
- Applied to the real 4.80.1 campaign APK with that patch alone:
  `Applied: Nike obfuscator access-gate bypass`, `failedPatches: []`, APK rebuilt,
  aligned and signed in 13.4 s.
- Library bytes in the patched APK (extracted back out of the output APK):

  | ABI | gate bytes after patching | stub present | prologue tail preserved |
  |---|---|---|---|
  | arm64-v8a | `20 00 80 52 c0 03 5f d6 fa 67 02 a9 …` | ✅ | ✅ |
  | armeabi-v7a | `01 20 70 47 2d e9 00 0f 87 b0 83 46 …` | ✅ | ✅ |
  | x86 | `b8 01 00 00 00 c3 83 ec 2c e8 00 00 00 00 …` | ✅ | ✅ |
  | x86_64 | `b8 01 00 00 00 c3 41 56 41 55 41 54 53 …` | ✅ | ✅ |

  (The repo's `Replacement` pads a short replacement with zeroes, which would have
  clobbered the rest of the prologue — the patch therefore builds an equal-length
  replacement: stub + untouched prologue tail.)
- Functional proof with the patched x86_64 library taken from that output APK:
  `decrypt(oauth_oidc_app_id)` → `cdaf4dbcc130faa860b8860aa771b9db` with a **foreign**
  certificate (pristine library + foreign certificate → `Invalid Access: Device info
  reported to Nike.`).
- Output APK: `apksigner verify` → **Verifies** (v2 scheme, signer `CN=Morphe`);
  `zipalign -c -v 4` → `Verification succesful`; native libraries remain deflated and
  `android:extractNativeLibs="true"`, so the patched `.so` is extracted at install time
  and no zip-alignment constraint applies to it.
