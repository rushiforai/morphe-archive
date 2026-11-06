# renshuu research

Inspected on 2026-11-02 using REA with JADX headless 0.7.1.

| Artifact | Value |
| --- | --- |
| Package | `com.renshuu.renshuu_org` |
| Version / code | `1.2.20260311` / `154` |
| Base APK SHA-256 | `6591e876769ab0f2456c93abb374197696a60f15e01a651d851884f049f498ea` |
| APKS SHA-256 | `e6f043ac3ca3843c212bd79fb0a87c227e684ef0d8f876fdbfa55a40ccc9aa48` |

## Observed controls

`MainActivityViewModel.processUserData()` parses stored `user_data` with Gson. It posts native menu state from `proEnabled == "1"`, `readingBuddy == "yes"` and `textAnaylzer == "yes"`; the last spelling is present in the APK. The first `Map` cast holds that parsed data, before entry iteration. Evidence: `ev_fdebf367ba2eaa3082b623f83fe3ce48ef0b1d557f9f5724dc18571fe3281f70`.

The **Enable Pro menus** patch injects a helper after that cast. It changes existing feature keys in this temporary map, preserving account identity, schedules, stored preferences and purchase handling. It does not add a Pro key to guest data. Native `getProEnabled()` consumers include `MainActivity.initMenu()` and activity observers. Evidence: `ev_76bd2fac031149d2fd9c079a33b223225f46fcd251062a0f6566cd45bfda80ac`.

`checkPurchases()` obtains RevenueCat customer information and reports purchase details to a renshuu `andpaypush.php` endpoint. The APK loads its web UI remotely. These observations do not establish the server's entitlement checks or access to web features. The patch changes no receipts, purchase tokens or account entitlement requests. Evidence: `ev_33d30053099eb67006d985433c3cd80ee7f2c60ab04cd3739a8f85cedc918353`.

## MicroG

Native login uses legacy Google Sign-In and Firebase Auth. Firebase messaging is used for notifications. **MicroG integration** routes selected external Google package, account, service and provider identifiers to `app.revanced.android.gms`, adds its package query and original signing-certificate metadata, and overrides the two availability methods. Internal Firebase actions, Binder interfaces, class names and Play Billing identifiers retain their original values. Evidence: `ev_be33297517bec972bf400ce4c4146d16d7b737e94cc4ff1303045f65f3be82bf`, `ev_9900c199a15a4f8c5b532c40ea72a056fa35e5683383d7458045d56e358f33a2`.

The patch requires a compatible MicroG installation with package `app.revanced.android.gms`. Its availability override reports success, so it must be selected only for a device with that provider installed. On 2026-11-02, the user reported that renshuu works and MicroG sign-in succeeds on their device. Android and MicroG versions were not supplied; notification delivery, session persistence, account switching and billing remain unverified.

## Validation

Both patches are disabled by default and target only the inspected version, marked experimental.

Offline checks compiled the patch sources with Kotlin 2.4.21 and Morphe Patcher 2.1.0. Pro-state and protocol-routing tests passed. Both patches applied to the original base APK and produced DEX and resources. SDK DEX verification found the same 176 optional-dependency hierarchy findings in the original and patched APK; no findings were added.

The signed `.mpp` passed loader and signature checks, and the full Gradle build and tests passed. The patched base APK and supplied splits installed on an isolated Android 37 emulator; offline startup reached `LoginActivity` without a package crash. The later user device report confirms startup and MicroG sign-in, but does not establish server-controlled premium access or complete the remaining developer checks. No live entitlement endpoint was called during the automated checks. See [validation results](validation.md).

## Developer verification

1. Compare stock and patched native menus using a developer-provided free test account.
2. Verify Reading Buddy and Text Analyzer web behavior against documented server entitlement rules.
3. Confirm login with MicroG, account switching and sign-out on the target Android versions.
4. Verify FCM registration and delivery after backgrounding and restarting the app.
5. Repeat purchase and restore flows using the developer's billing test environment.
