# Pimsleur static research

Inspected on 2026-11-02 with REA/JADX (reported provider version `0.7.1`) and a bounded offline Hermes v96 reader. The original workspace archive was preserved. Findings describe the extracted base APK and its shipped bytecode; publisher identity, device behavior and backend enforcement were not verified. APK signature verification passed during output checks.

| Artifact | Value |
| --- | --- |
| Package | `com.simonandschuster.pimsleur.unified.android` |
| Version | `8.1`, version code `759` |
| Android SDK | Minimum `24`, target `36` |
| Archive SHA-256 | `290e073e95492c70008bc7d8fd0ea874a7a6cccd20547d165cdcd6db5ec5a065` |
| Base APK SHA-256 | `15629eef999249cd02e79e8af056df9272551ce82126993480130811a68ffef9` |

## Recovered local Premium controls

The app uses React Native and an 8,269,940-byte Hermes v96 `assets/index.android.bundle`, SHA-256 `00de65410c84a4907be54bfe11d211b8a7f5e868264f7e924af9398131fec0c5`. Its SHA-1 footer verifies. Offline decoding recovered all 64,230 strings and 49,524 function headers covering 37,660 distinct bodies. All bodies decoded with the version-specific opcode definitions, without unknown opcodes, truncated operands or out-of-range string/function references. Original JavaScript source was not reconstructed.

| Function | ID | Byte offset / size | Recovered decision |
| --- | ---: | --- | --- |
| `isPU` | `7158` | `3521571 / 41` | Reads `entities.productInfo[0].isPU`, defaulting to false. |
| `getPremiumStatus` | `7169` | `3522424 / 84` | Reads `languagePicker.selectedProduct.isPU`; when `isAllAccess`, reads `languagePicker.allAccessSelectLanguageLevel.isPremium`. Both default to false. |
| `isSupportPremiumFeature` | `27725` | `5515916 / 534` | Consumes `isPU`, `isFreeLesson`, reading and bonus-pack state, then branches to a not-available modal. |

Module function `7106` creates and exports the first two selectors. There are 107 typed instruction references to `isPU`, including reads in Premium feature, AI feature and UI code; this count includes property definitions and does not establish 107 runtime calls. `getPremiumStatus` has two export-property references, so its runtime consumers remain less certain.

The experimental, disabled-by-default **Enable local Premium controls** patch targets version `8.1` and requires the exact original Hermes bundle hash. It replaces only the two selector bodies with `LoadConstTrue r0; Ret r0`, fills the remaining body bytes with `Unreachable`, and repairs the footer. The bodies are not shared with other function headers. The patch does not mutate stored entitlement, receipt data, authentication or backend request builders. Other checks, including bonus packs, free lessons and AI availability, remain relevant.

Both an independently derived bundle and the actual patcher output pass structural verification: 128 differing bytes fall entirely within the two bodies and the footer, all 37,658 other distinct function bodies and all headers/tables remain unchanged, and both replacement bodies decode to return true with valid unreachable padding. Its SHA-256 is `30a659353cf17666a027c038ea47262427ede69c2d15992ceebcc561379a7cb4`. This verifies the bytecode change, not device execution or content access.

## Purchase and server boundary

Decoded function `18183` creates a `@@purchase/verifyReceiptViaBackend` action using request-builder function `18189`. That builder constructs `POST /account/{customerId}/receipt` with `productId`, `transactionId`, `originalMessage`, `transactionResult`, `receipt`, `storeDomain`, `isMultiple` and `appVersion`. `verifyTransaction` (`18191`) selects this action on Android; a separate builder handles restore requests.

These are recovered request definitions and platform branches. No request was sent, no receipt was forged, and backend acceptance rules or download controls were not observed. Google Play Billing, Nitro IAP and OpenIAP are packaged; native `NativeLoginModule.exchangeTokens` also uses Auth0. A developer-controlled free/entitled account comparison is still needed to establish behavior after the local selectors change.

## Additional selector effects

Static tracing connects `isPU` to metadata beyond presentation. Function `16020` captures its result; `16021` stores it as `premium` in a new queued learning-streak record. Functions `16026` and `16027` read the queue and copy that field into `learningStreakRequests`. The original request builder `10753`, file offset `3867716`, constructs `POST /sync-learning-streak/cumulate-learn-time` from those records. Existing queued records retain their earlier `premium` value when learning time is added.

This establishes a path from the local override to queued metadata and request construction. Scheduler execution, network transmission and backend acceptance were not observed. The inspected receipt and Auth0 token builders retain their original input sources; unchanged builder instructions do not establish unchanged values for every outgoing payload. Private analyst evidence: `PIM-APP-20261102-01` and `PIM-APP-20261102-03`.

The separate `isMiniLessonAccessible` function (`7176`) still checks original all-access state or purchased products for the current language. It does not call either overridden selector. `getFullLessonProgress` (`15378`) uses `isPU` to select progress views and storage namespaces, while other user/product metadata readers remain independent. No statically named `getPremiumStatus` consumer was recovered beyond its export writes; indirect use remains unknown. Private analyst evidence: `PIM-APP-20261102-02`.

## Lesson downloads and playback

Further static tracing found that lesson downloads use original selected-product/all-access metadata and returned lesson media links independently of the two overridden selectors. `getCurrentAndSubUserIdFromState` (`15409`) supplies the original product flag to the metadata loader; normalization (`15415` / `15417`) carries it into the product model. The normalized `isPU` value is therefore not necessarily a raw server response flag.

The download builder (`40685` / `40687`) copies supplied audio links and retains the original free-product lesson limit and practice-resource flag. Missing audio links skip resource creation. Empty metadata is not replaced with a course, and the inspected MainAudio mount and reload paths filter out lessons with empty audio links before building their playlists.

The original downloader (`15427`) constructs a GET using the supplied URL. Its completion predicate (`15434`) requires HTTP 200 and checks MP3 length against `Content-Length`; failures retain the original retry, cleanup and pause behavior. Successful callbacks retain URL-to-local-path bookkeeping and queue persistence. Restore success independently requires a returned purchase record.

These findings establish client construction and branches. Network transmission, backend entitlement, media availability and downstream empty-playlist behavior remain unobserved. Private analyst evidence `PIM-DOWNLOAD-20261102-01` through `-04`, with 24 verified supporting artifacts, is retained in `download-content-path-report.md` and `download-content-path-ledger.json` under `/private/tmp/pimsleur-research/`.

## Decoder provenance

REA `6.7.0` has no advertised Hermes decoder. A cached `hermesc` reports HBC v98 and rejects the original v96 file; changing only a private inspection copy's version header also fails deserialization. Neither output was used as control-flow evidence.

The successful reader uses verified upstream schema and v96 opcode references from `P1sec/hermes-dec`, pinned commit `2e796663e1fedb93dca51060797ebf3327b3fedb`. Reference documents were retrieved read-only and checked against upstream Git blob hashes. Retrieved Python modules were parsed as AST data, never imported or executed. The private utility and AGPL-3.0 reference notices remain outside the public patch repository. No source map, target-code execution or live service was required to recover the bytecode.

## MicroG applicability

Both named availability methods are present with the exact DEX prototype `(Landroid/content/Context;I)I`: `GooglePlayServicesUtilLight.isGooglePlayServicesAvailable` and `GoogleApiAvailabilityLight.isGooglePlayServicesAvailable`. The wrapper delegates to the utility and maps an updating condition to status `18`. JADX reports duplicated blocks in the utility body, so its reconstructed branch details should not be used as exact control-flow evidence.

An app-owned handler configures Marketing Cloud push with the original FCM sender and registration delay until a contact key is set. Its native `MCService.d(Context,String)` requests a Firebase Messaging token; original completion handling preserves failure retries, token storage and refresh listeners. This supplies a concrete notification compatibility test candidate. SDK readiness, token acquisition, server registration and delivery remain unobserved. Evidence: `ev_329f273e40dc0470dd7696c755c05a1948d6f89b3b8a59bebffa31fdeb47e320`, `ev_c96d5e5de45d190bc419d34787e6bbb818e5f1179d90c2d7391fe8f8aeb908e7`, `ev_1a8ced893fb82da3ac237cd6142d42607d813de5e2f376ec27315cb190021799`.

The Android OneTrust `setupSFMCSDK` and `enablePush` bridges are empty; their JavaScript calls do not establish initialization or activation. The separate `RNSFMCSdk.getSystemToken` bridge returns cached token storage through SDK-ready callbacks, rather than requesting a new FCM token. Original permission, consent and contact-key conditions remain relevant. Forty-five supporting REA records and selected Hermes function evidence are retained under `/private/tmp/pimsleur-research/app-notification-followup/`; `PIM-NOTIFICATION-20261102-01` through `-03` identify analyst findings. Evidence: `ev_1c8de49c25a5cc9cdadf27769939ac942afe41cb68b04fbfd7b84c9ee440f73c`, `ev_4eff75c6af9a681d2ba75918e710c8a9b2860ecefe9cbd3a0aaaf4c6e3724f37`.

A bounded trace of `GoogleSignInClient.getSignInIntent` found only an SDK-internal caller. A subsequent JavaScript/native bridge trace connects the inspected Google login button to Auth0's browser authorization flow, preserving the original provider connection, scope and redirect handling. That route reaches Auth0's authentication activity and Custom Tabs; the bundled Google Sign-In SDK alone does not establish a MicroG requirement for it. Other dynamic and reflective routes remain unverified. Google Play Billing's `com.android.vending` route must stay intact when testing messaging changes. Evidence: `ev_5991964d4f3b85a43f9dd320f2c2f67281fab6385836a95868f9e88e18f26c69`, `ev_7ab7a1bdde28966b5c164d1156fb1a17386796e8d6443c5221b9835c9a887a77`.

The inspected Android Facebook login branch separately constructs original Facebook session/profile requests and Auth0 token exchange, then passes returned credentials into the existing callback and storage flow. No login or exchange was executed, and browser/provider configuration, successful authentication and every indirect Google-service use remain unverified. Original Hermes function locations, bridge bindings and 32 supporting REA records are retained privately under `/private/tmp/pimsleur-research/app-login-followup/`; `PIM-LOGIN-20261102-01` through `-03` identify analyst findings. Evidence: `ev_c3915b84e145bbc78586ff574893ddad07ae7b7656eebb238fcd5eff62ce316c`, `ev_2888a8e10f5155d817053e665b30a3e35934335b2140427cc7966cca5fc88427`.

The shared **MicroG integration** patch targets only inspected version `8.1`, marked experimental and disabled by default. It redirects selected native external Google package, account, service and provider identifiers to `app.revanced.android.gms`, adds its package query and original signer metadata, and makes both availability methods return success. It leaves the Hermes bundle, class/Binder descriptors, internal Firebase actions and Play Billing routing unchanged. A matching MicroG installation is required. This native routing does not establish JavaScript compatibility, successful login or notification delivery.

## Validation

The combined local Premium + MicroG patches compiled with Kotlin 2.4.21 and Morphe Patcher 2.1.0, applied to the original base APK, and produced patched DEX, compiled resources and the modified Hermes asset. SDK DEX verification found the same 58 optional-dependency hierarchy findings in the original and patched APK; no findings were added. Protocol-routing and compiled manifest checks passed. The raw asset is exported as `other-resources/assets/index.android.bundle` for APK assembly, separately from `resources.apk`.

A second patcher run rejected a changed Hermes asset with the same app version before mutation. The signed `.mpp` passed loader and signature checks, and the full Gradle build and tests passed. Split-APK startup checks reached a native Pairip protection boundary; see [validation results](validation.md) for the original and re-signed controls. Paid feature behavior remains unverified.

## Evidence

Canonical REA records are exported locally at `/private/tmp/pimsleur-research/evidence.json`. Hermes findings are supplemental analyst decoding, separate from those records: `hermes-v96-tables.json`, `hermes-v96-decode-summary.json`, `hermes-v96-string-references.json`, `hermes-v96-selected-functions.txt`, `hermes-v96-backend-and-gate-functions.json` and `hermes-v96-premium-verification.json` in the same directory. Primary reference provenance is in the workspace `.research-tools/hermes-v96-source-references.json`.

The app-level follow-up is retained privately in `app-level-findings.md` and its referenced instruction, object-template and request-builder records. The `PIM-APP-20261102-*` identifiers label analyst evidence, not REA records. No source map or developer test build was used.

| Observation | REA evidence ID |
| --- | --- |
| Package identity | `ev_d2e7575130977ebb1ed86901d386a2e5629e91c7ffb404f2e26780e39aa27fb6` |
| Native app inventory | `ev_a15c101561d7a5a74ddc56d00bc4fb261fca326455f85fa4243c3bbe3a74ea78` |
| Auth0 token exchange | `ev_c3915b84e145bbc78586ff574893ddad07ae7b7656eebb238fcd5eff62ce316c` |
| Native IAP inventory | `ev_94b8f75ca3f41cd5f74497b95896e3953848df4bc7c76a91c20a36cf913c5c14` |
| FCM caller | `ev_f866284b4f634f08898ad7b6e53022b34d934ecfe73c5018556205176f67f2b3` |
| Google sign-in caller trace | `ev_d5c55f48672fd5fc282402d6760fb70392d18b8e176e7b5b920f113582cb5b0f` |
| Utility availability method | `ev_232d1b07d81319e925ad89eca945006afd06ef1c7a9e7a26dec5bf07a4cb6913` |
| API availability wrapper | `ev_ffe4c81f116b55e1464fc956e0536ebfe0ef6c6f8d8f5df6a4687e96c7f248e8` |
