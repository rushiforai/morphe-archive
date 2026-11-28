# Regain MicroG-RE integration

## Status matrix

| Verification stage | Status | Details |
|---|---|---|
| Source-level MicroG-RE match | Verified | Checked against `MorpheApp/MicroG-RE` (`GoogleIdService.kt`, `SignInProxyActivity.kt`, `credentials_provider_google_id.xml`, `PackageSpoofUtils.kt`, and `play-services-core/src/main/AndroidManifest.xml`). |
| Morphe patch implementation | Implemented | Opt-in patch (`default = false`) at `patches/src/main/kotlin/com/awt/regain/patches/MicroGReSupportPatch.kt` targeting `ai.regainapp` `76.1.2139`. |
| Patch-bundle compilation & API check | Build-verified in CI | `./gradlew :patches:buildAndroid` (including AnimalSniffer Android API 26 check) passes on the branch. |
| APK patch application via Morphe | Not yet tested | Requires running Morphe against the Regain `76.1.2139` APK. |
| On-device Google sign-in & backend `/auth/google_sign_in` | Not yet tested | Requires an Android 14+ (API 34+) device with MicroG-RE installed and enabled as a Credential Manager provider. |
| FCM registration & push delivery | Not yet tested | C2DM/IID names are remapped to MicroG-RE's `app.revanced` namespace; runtime delivery is unverified. |

A successful patch-bundle compilation does **not** establish that APK patching or end-to-end Google authentication works on a device.

## Target & runtime

- **Target app:** Regain (`ai.regainapp`), version `76.1.2139`
- **MicroG runtime:** Morphe MicroG-RE (`app.revanced` vendor namespace, package `app.revanced.android.gms`)
- **Patch default:** **off** (`default = false` — opt-in via Morphe)
- **App cloning:** Not used; Regain keeps its original package name `ai.regainapp`.

## Source-level evidence

Prior inspection of the Regain `76.1.2139` XAPK indicated its Google sign-in flow uses AndroidX `CredentialManager` (`CredentialProviderPlayServicesImpl`), Google Identity Services `GetSignInWithGoogleOption`, `TYPE_GOOGLE_ID_TOKEN_CREDENTIAL`, and `BUNDLE_KEY_ID_TOKEN`, posting the resulting ID token to `/auth/google_sign_in`.

Verified in `MorpheApp/MicroG-RE`:

- [GoogleIdService.kt](https://github.com/MorpheApp/MicroG-RE/blob/main/play-services-core/src/main/kotlin/org/microg/gms/auth/credentials/provider/GoogleIdService.kt): Matches `TYPE_GOOGLE_ID_TOKEN_CREDENTIAL = "${BuildConfig.BASE_PACKAGE_NAME}.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL"` (`app.revanced...`), while parsing the original `com.google.android.libraries.identity.googleid.*` subtype and `BUNDLE_KEY_*` keys. Annotated `@RequiresApi(34)`.
- [SignInProxyActivity.kt](https://github.com/MorpheApp/MicroG-RE/blob/main/play-services-core/src/main/kotlin/org/microg/gms/auth/credentials/provider/SignInProxyActivity.kt): Requests a Google ID token via MicroG-RE's assisted sign-in flow and returns a `CustomCredential(TYPE_GOOGLE_ID_TOKEN_CREDENTIAL, credentialData)` populated with `BUNDLE_KEY_ID_TOKEN` and profile fields.
- [credentials_provider_google_id.xml](https://github.com/MorpheApp/MicroG-RE/blob/main/play-services-core/src/main/res/xml/credentials_provider_google_id.xml): Advertises `<capability name="app.revanced.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL"/>` (`tools:targetApi="34"`).
- [PackageSpoofUtils.kt](https://github.com/MorpheApp/MicroG-RE/blob/main/play-services-base/core/src/main/kotlin/org/microg/gms/common/PackageSpoofUtils.kt): Reads `app.revanced.android.gms.SPOOFED_PACKAGE_NAME` and `app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE` (40-character hex SHA-1) from application `<meta-data>`.
- [play-services-core/src/main/AndroidManifest.xml](https://github.com/MorpheApp/MicroG-RE/blob/main/play-services-core/src/main/AndroidManifest.xml): Exposes all remapped GMS service actions, `phenotype`/`chimera`/`fonts` authorities, `AD_ID` permission, `iid.TOKEN_REQUEST`, and the four C2DM actions/permissions under `${basePackageName}`. Does **not** namespace `com.google.android.c2dm.intent.REGISTRATION`.

## What the patch changes

1. **Optional Play Services availability bypass.** Before rewriting `"com.google.android.gms"`, optionally patches `GooglePlayServicesUtilLight.isGooglePlayServicesAvailable` (return `0`) and `ensurePlayServicesAvailable` (early return) via `methodOrNull` when present, preventing `SERVICE_INVALID` signature rejections against `app.revanced.android.gms` without failing on R8-stripped builds.
2. **Credential type namespace.** Rewrites only `com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL` to `app.revanced.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL`. Subtype and `BUNDLE_KEY_*` keys remain unchanged.
3. **GmsCore package, authorities, and service actions.** Remaps `com.google.android.gms`, supported authorities (`phenotype`, `chimera`, `fonts`), exact and sub-path `content://com.google.android.gms.{phenotype,chimera,fonts}` URIs, and the MicroG-RE-supported GMS service actions (`identity.service.signin`, `identity.service.credentialsaving`, `auth.api.signin`, `auth.api.credentials`, `signin`, `measurement`, `common.telemetry`, `fido2.regular`, `fonts`, `phenotype`).
4. **Firebase/C2DM namespace.** Remaps `c2dm.intent.RECEIVE`, `c2dm.intent.REGISTER`, `c2dm.permission.RECEIVE`, `c2dm.permission.SEND`, `iid.TOKEN_REQUEST`, and `gms.permission.AD_ID` in both DEX and `AndroidManifest.xml` while explicitly keeping `com.google.android.c2dm.intent.REGISTRATION` and all Regain component class names unchanged.
5. **Android 11+ package visibility & spoofing metadata.** Adds `<package android:name="app.revanced.android.gms" />` to `<queries>` and sets `<meta-data>` entries for `app.revanced.android.gms.SPOOFED_PACKAGE_NAME`, `app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE` (`f1d63dc9f6d5b7ac1091b6a7723b957664d36f60`), and `app.revanced.MICROG_PACKAGE_NAME`.
6. **Opt-in default (`default = false`).** Devices using stock Google Play Services should leave this patch disabled so the stock Google credential provider continues matching the unrewritten credential type.

## Device setup and verification steps

1. Install a Morphe MicroG-RE build whose GmsCore package is `app.revanced.android.gms`, and add the Google account to use for sign-in.
2. On Android 14 (API 34) or newer, enable MicroG-RE's Google ID credential provider in system Credential Manager / Passwords, passkeys & accounts settings.
3. In Morphe, enable **MicroG-RE support** when patching Regain `76.1.2139` (keeping original package `ai.regainapp`).
4. Verify end-to-end on device:
   - Morphe applies the patch cleanly without fingerprint or resource errors.
   - Android Credential Manager displays MicroG-RE's account selector.
   - Selecting an account returns a non-empty Google ID token to Regain.
   - Regain's `/auth/google_sign_in` backend accepts the token and persists the session across restarts.
   - FCM registration/push delivery and any optional GMS features behave as expected.

If the provider does not appear or Regain rejects the ID token, capture `logcat` filtered for `GoogleIdService`, `SignInProxyActivity`, `SpoofUtils`, and `CredentialManager` before expanding any spoofing hooks.

## Reference implementation

Reviewed against `MorpheApp/morphe-patches@d38d9d841a965953751ef1f733e308bcde46a5a7`:

- [Shared GmsCore patch](https://github.com/MorpheApp/morphe-patches/blob/d38d9d841a965953751ef1f733e308bcde46a5a7/patches/src/main/kotlin/app/morphe/patches/shared/misc/gms/GmsCoreSupportPatch.kt)
- [Shared GmsCore fingerprints](https://github.com/MorpheApp/morphe-patches/blob/d38d9d841a965953751ef1f733e308bcde46a5a7/patches/src/main/kotlin/app/morphe/patches/shared/misc/gms/Fingerprints.kt)

This Regain patch intentionally omits Morphe's YouTube extension, app-cloning preferences, and Google-first-party GNP header hooks that do not apply to `ai.regainapp`.
