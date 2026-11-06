# TEUIDA Credential Manager / MicroG research

Static inspection on 2026-11-02 found that package/action routing, original signer metadata, and a Play Services availability override do **not** cover TEUIDA's complete Google sign-in flow. The experimental, disabled-by-default **MicroG integration** candidate now includes TEUIDA `1.23.0` with additional credential hooks. Offline emulator startup checks are recorded in [validation results](validation.md). Account-based sign-in and notification delivery remain unverified.

## Inspected inputs

- TEUIDA base: `/private/tmp/teuida-research/base.apk`
- Base SHA-256: `0d1347c54f1b5563bf586d7a7bb77ae95f0d828778d65072ba73f77407d503aa`
- REA JADX provider: `0.7.1`; static class/method observations below.
- MicroG comparison: the current local `MicroG-RE` working tree; HEAD `c370569f63376ec857fb0707ff8ec6a66a56507d`. This source comparison does not establish which implementation is present in an installed MicroG APK.
- REA export: `/private/tmp/teuida-research/credential-evidence-kanji-agent.json`
- Supplemental direct DEX constant decoding: `/private/tmp/teuida-research/credential-dex-constants-kanji-agent.json`. This is separate from REA evidence.

## Shipped app observations

`net.teuida.teuida.util.base.GoogleSignInHelperKt.b` first checks `GoogleApiAvailability.isGooglePlayServicesAvailable`, then constructs a single `GetSignInWithGoogleOption` using `default_web_client_id`. It invokes Credential Manager, accepts a `CustomCredential` with `GoogleIdTokenCredential.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL`, parses its bundle, and sends the obtained token to Firebase Auth. Local routing changes do not replace this remote authentication step. [E1]

The four-argument `GetSignInWithGoogleOption` constructor passes an empty `allowedProviders` set and two `true` booleans to the optimized `CredentialOption` constructor. That constructor assigns the first boolean to `isSystemProviderRequired` and the second to `isAutoSelectAllowed`. Therefore the shipped Google option requires a system provider; there is no explicit Google provider component allowlist to replace. [E2, E3]

Direct decoding of `classes.dex` static field values establishes:

```text
GoogleIdTokenCredential.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL
  = com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL
CredentialProviderPlayServicesImpl.MIN_GMS_APK_VERSION = 230815045
CredentialProviderPlayServicesImpl.PRE_U_MIN_GMS_APK_VERSION = 252400000
```

`androidx.credentials.CredentialManager.a` contains the provider selection after R8 optimization. For this single Google option, a normal device on API 34 or later prefers `CredentialProviderFrameworkImpl` when the platform service exists. API 33 or earlier, TV/automotive devices, and devices with no available framework provider use the app's metadata-discovered provider. The decompiler reports duplicated control-flow blocks; these are static route observations, not a runtime trace. [E4, E5]

| Device / selected route | App behavior | Additional requirement beyond basic routing |
| --- | --- | --- |
| API 34+ normal device with platform Credential Manager | Framework conversion forwards the original type, `isSystemProviderRequired=true`, and empty provider set unchanged. | Request the MicroG capability type, permit a non-system provider, enable/select the MicroG Google ID credential provider, and accept its returned type. |
| API 33 or earlier; TV/automotive or framework-unavailable fallback | The app discovers `CredentialProviderPlayServicesImpl` through its own `androidx.credentials.CREDENTIAL_PROVIDER_KEY` service metadata. | Preserve an appropriate SDK route and map its request/response contract as described below. |
| Play Services fallback with availability check for `252400000` returning false | SDK invokes `CredentialProviderGetSignInIntentController.h`, which calls `Identity.getSignInClient(...).getSignInIntent(...)`. | Route the identity sign-in service/package to MicroG; this path constructs the Google token credential locally. |
| Play Services fallback with availability check for `252400000` returning true | SDK invokes the newer `IdentityCredentialManager.getClient(...).getCredential(...)`. | Route the identitycredentials service and map the Google credential type to the vendor capability, including the returned type check. |

The default provider availability check uses `230815045`. Its internal `isAvailableOnDevice(int)` delegates to Google API availability and interprets result `0` as available. An unconditional success override consequently also makes the newer `252400000` route available. It changes SDK routing, not just the application's initial preflight. [E6, E7]

The framework route forwards the option type and provider requirement into `android.credentials.CredentialOption.Builder`. It preserves the returned credential's type when converting the platform response back to AndroidX. A package or service-action replacement cannot fix either of these type checks. [E8]

## Local MicroG source observations

The relevant source was obtained through CodeGraph before inspection. Paths below are relative to the workspace:

- `MicroG-RE/play-services-core/src/main/AndroidManifest.xml:807` declares `com.google.android.gms.auth.api.credentials.credman.service.GoogleIdService`, protected by `android.permission.BIND_CREDENTIAL_PROVIDER_SERVICE`, with the platform credential-provider action and `credentials_provider_google_id` metadata.
- `MicroG-RE/play-services-core/src/main/res/xml/credentials_provider_google_id.xml:9` advertises **`app.revanced.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL`** as its capability.
- `MicroG-RE/play-services-core/src/main/kotlin/org/microg/gms/auth/credentials/provider/GoogleIdService.kt:45` handles that custom type. Its constant at line 179 is derived from `BuildConfig.BASE_PACKAGE_NAME`; the advertised XML capability must match the selected build flavor.
- `MicroG-RE/play-services-core/src/main/kotlin/org/microg/gms/auth/credentials/provider/SignInProxyActivity.kt:93` returns a `CustomCredential` with the same vendor type. The activity retains the original `com.google...BUNDLE_KEY_*` response keys.
- `MicroG-RE/play-services-core/src/main/kotlin/org/microg/gms/auth/credentials/identity/IdentitySignInService.kt:151` implements `getSignInIntent`; the main manifest routes `${basePackageName}.android.gms.auth.api.identity.service.signin.START`.
- `MicroG-RE/play-services-identity-credentials/core/src/main/AndroidManifest.xml:12` declares `${basePackageName}.android.gms.identitycredentials.service.START`.
- `MicroG-RE/play-services-identity-credentials/core/src/main/kotlin/org/microg/gms/identitycredentials/IdentityCredentialApiService.kt:104` implements the newer `getCredential` service and returns a chooser pending intent.
- `MicroG-RE/play-services-core/src/main/kotlin/org/microg/gms/auth/credentials/identity/IdentityCredentialChooserActivity.kt:91` accepts the vendor Google type and otherwise returns `NoCredentialException("Unsupported type: ...")`. Its result at line 230 also uses the vendor type.
- `MicroG-RE/play-services-base/core/src/main/kotlin/org/microg/gms/common/PackageSpoofUtils.kt:13` reads vendor `SPOOFED_PACKAGE_NAME` / `SPOOFED_PACKAGE_SIGNATURE` metadata. These affect MicroG's package identity handling; they do not alter Android's credential-provider selection or capability matching.

The newer identitycredentials backend **exists in this local tree**. Its presence does not mean that an arbitrary MicroG release supports it. Type mapping is necessary even when this backend is available. The older `getSignInIntent` controller converts its result into a Google token credential in the app instead, avoiding the provider capability string at that specific boundary. [E9–E11]

Protocol bundle keys should retain their `com.google.android.libraries.identity.googleid` names. TEUIDA's `GoogleIdTokenCredential.Companion.createFrom` reads exactly those keys, including a parcelable `Uri` for the profile image. The native MicroG provider supplies a parcelable URI; the newer chooser currently writes that field as a string at line 228. Image-field conversion on each Android API remains a compatibility question. [E12]

## Implemented candidate and verification still required

`patches/src/main/kotlin/suchi/morphe/patches/teuida/TeuidaMicroG.kt` supplements shared native package/action routing and signer metadata with three narrowly checked changes:

- It maps the exact Google credential type literal and its encoded `GoogleIdTokenCredential.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL` field constant to the MicroG capability. Google ID bundle keys and the SIWG subtype stay unchanged.
- In the four-argument `GetSignInWithGoogleOption` constructor, it changes only the system-provider Boolean passed to `GetCustomCredentialOption`; auto-select remains true and `allowedProviders` remains empty. Direct DEX inspection identified separate `v7` / `v8` Boolean loads, and the patch checks their positions, values, constructor prototype, and argument range before editing.
- In `CredentialProviderPlayServicesImpl.onGetCredential`, it replaces only the result consumed by the `252400000` backend-selection branch with false. The existing older `getSignInIntent` controller handles this fallback. Shared availability overrides therefore cannot select the newer identitycredentials backend for this request.

The API 34+ framework route remains active on supported devices and uses the vendor type with non-system eligibility. Its Android credential-provider setting must include MicroG's Google ID provider. The service class retains its `com.google.android.gms...GoogleIdService` name. The fallback deliberately uses the older controller, avoiding the newer chooser's optional profile-image schema mismatch.

The compatibility target remains exact version `1.23.0` and experimental. Constructor, field-constant, and backend-gate checks reject a changed shape before mutation. Static application and compiled-output validation are recorded below; they do not establish successful account authentication.

Developer verification should cover API 32/33, API 34, and a later API using the exact installed MicroG artifact: provider discovery, user provider selection, cancellation, returned type, optional image data, and a real developer-approved Google/Firebase sign-in. Check the client ID, original signer metadata, binder features, and package/action destinations independently. No static result here establishes successful token issuance, Firebase acceptance, notification registration, or complete Google API compatibility.

## Validation

All patch sources compiled with Kotlin 2.4.21 and Morphe Patcher 2.1.0, and the existing offline checks passed. Combined local Premium + MicroG application to the inspected base succeeded and generated eight DEX files plus compiled resources. SDK DEX verification reported the same 1,938 optional-dependency hierarchy findings as the original APK, with no added findings.

Compiled-output checks confirmed that four exact Google credential type literals and one encoded field constant were mapped; the Google option passed `system=false` and `auto-select=true` with an empty provider set; and the newer backend-selection result was false while its older controller remained present. Google ID bundle/protocol keys and protected billing/Firebase binder identifiers were unchanged. Compiled manifest and signer metadata checks passed. The packaged `.mpp` passed loader checks; the full Gradle task graph and device sign-in remain pending.

Local validation tools and outputs are under `/private/tmp/teuida-research`: `validate-credential-patch.py`, `credential-patch-apply.log`, `credential-applied/`, and `VerifyCredentialOutputs.kt`. The output check verifies the encoded type constant, exact type literals, constructor flags, retained empty provider set, older backend selection, and unchanged Google ID bundle/protocol keys.

## REA evidence

| Ref | Exact observation | Evidence ID |
| --- | --- | --- |
| E1 | `GoogleSignInHelperKt.b` | `ev_48f61d4095b1176876e17913280b0fa676f3485d1d18c20c0cb1358cc304368e` |
| E2 | `GetSignInWithGoogleOption.<init>` overload 3 | `ev_952f745cc4101e29d15191188c0e20b382098c86c8a7609509d750bb0623ed3b` |
| E3 | `CredentialOption.<init>(I,Bundle,Bundle,String,Set,Z,Z)` | `ev_1dfe8ef030e17f84a4e3b4689a95a41dbb7e2f5d85f9c7dac5e30871b7fb86b6` |
| E4 | `CredentialManager.a` provider selection | `ev_ee581729df285ef28f606d703a710536d4d9091f3e0736e80bbb2435f9bd51cb` |
| E5 | `CredentialProviderFactory.a` metadata discovery | `ev_b4b11646806e38363104461e4320c247eb56b5c61552dc2b0bb57bfc70cc37ae` |
| E6 | `CredentialProviderPlayServicesImpl.onGetCredential` overload 0 | `ev_30f45c28c916e91b6548fb609972ba214e16bf65c5e52e5ce822920386b869d9` |
| E7 | `CredentialProviderPlayServicesImpl.isAvailableOnDevice(int)` | `ev_1b0ff1cf9b688fca8d6e40b2a5088374c42438975df5e4b0bed97abf3af5b2f0` |
| E8 | `CredentialProviderFrameworkImpl.onGetCredential` | `ev_feea63bcecf3dbcc319628f0f2c08845f1f700efdbf521b08ae4f3f3935dec54` |
| E9 | `CredentialProviderGetSignInIntentController.h` | `ev_b2b52f87815835b00117d4c2a712a96ea3006064d1c2583d203e41a4548f89f7` |
| E10 | `CredentialProviderGetSignInIntentController.d` request conversion | `ev_6c701730da9663fbfd2572ce545ea2484b5d61d1d519a167bab20dcc9847999d` |
| E11 | `CredentialProviderGetSignInIntentController.e` response conversion | `ev_8bbeac3b58d1347617a622b5a65653a28aae7a1d841eb49d21335c5ede6aa809` |
| E12 | `GoogleIdTokenCredential.Companion.createFrom(Bundle)` | `ev_1651cc62bfbfd9c8ed5b2b0c381f9e9201b6a7debf0a955790ab8d662d74da4f` |
