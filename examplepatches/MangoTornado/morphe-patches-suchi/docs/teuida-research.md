# TEUIDA static research

Inspected on 2026-11-02 with REA and its JADX provider, reported version `0.7.1`. The original workspace archive was preserved. Its extracted base APK passed signature verification during output checks; publisher identity and backend enforcement remain unverified. Offline split-APK startup and Pairip protection checks are recorded in [validation results](validation.md).

| Artifact | Value |
| --- | --- |
| Package | `net.teuida.teuida` |
| Version | `1.23.0`, version code `939` |
| Android SDK | Minimum `32`, target `36` |
| Archive SHA-256 | `9426d84df488db554f6546b4748d2689d12c34af0ced843dc3dfdb24356003e4` |
| Base APK SHA-256 | `0d1347c54f1b5563bf586d7a7bb77ae95f0d828778d65072ba73f77407d503aa` |

## Local Premium controls

`UserShareds.l()Z` reads `MeData`'s `premium` value when a profile is present. Otherwise it reads a cached Boolean or the `premium` preference, defaulting to false. The profile's raw DEX getters are `MeData.s()Ljava/lang/Boolean;` and `MeData.t()Lnet/teuida/teuida/enums/PremiumState;`, returning the `premium` and `premiumState` fields. JADX displays these getters as `getPremium` and `getPremiumState`; patch fingerprints use the raw names.

The incoming trace identified 37 containing nodes for `UserShareds.l`, including curriculum, story, lesson, content and advertising code. `PremiumExtKt.b` provides a concrete consumer: the false branch displays a Premium access prompt, while the true branch displays a story welcome prompt.

The experimental, disabled-by-default **Enable local Premium controls** patch targets only version `1.23.0`. It makes these three getters return `true`, `Boolean.TRUE` and `PremiumState.PREMIUM`. It validates the two profile field references before mutation. The patch does not write profile fields, preferences, purchase receipts or server-side account entitlement.

The getters also affect behavior outside UI gates. `ThirdPartySdkManager.b` reads `UserShareds.l()` when building AppsFlyer's login event property `user_type`, so enabling the local Premium patch changes that classification. This is a static data-flow finding, not an observed event transmission. Evidence: `ev_38c9de6a8ce799b68c2eb235c5c0b6aa0de5adf238c7fc688794bd67d1a38556`.

`AmplitudeExtKt$setLoginInfo$1$1` reads the unchanged server `AmplitudeResponse` for its Identify properties. Its `MeData.t()` call instead gates a local FREE-to-non-FREE cache reconciliation; the Premium getter override suppresses that branch. The inspected RevenueCat login and customer-attribute builder still uses the original user ID, email, username and language fields without reading these Premium getters. Unchanged purchase/authentication source does not establish that every outgoing value is unchanged. Evidence: `ev_f7c5fba04201dd1836f7a859da79c28675cfcd0afc101807e5ab6701dee059d1`.

Trial and gift flows also use separate inputs. `FinishSubscriptionViewModel.h` reads the original `freeTrial` field without calling the overridden getters. Invitation-code visibility requires its original eligibility flag and a FREE state; the override changes the latter condition. Gift-specific subscription navigation consumes the overridden state, while gift-invitation eligibility still also requires its original flag and a positive remaining count. These are static branch findings; gift/trial expiry enforcement and network behavior remain unobserved. Evidence:
`ev_fd50bfda4ad856159761b064509318dcf8f6be64d8002cdec0c70c28108d0ac6`,
`ev_916b1fb246af0d8ac79ec459543a8ba88bc153320de76c0970ca804f9e2c7e08`,
`ev_41afcb4d79c7b88e9fecda9dbb633a9f2cf7fce47f412ce1835b0b8b5a930a75`,
`ev_b6f0fdb7fed73bd8575dbcb5221eb141653d731903fccd783a36330bfec86357`.

`PremiumRepositoryImpl.h` sends a `SendPurchaseSubscriptionRequest` through `TeuidaAPI.V` with authentication headers. A separate backend purchase path therefore exists. Static inspection does not establish its validation rules, whether downloaded content has further checks, or the behavior of inconsistent trial, gift and expiry fields. Device testing with developer-provided free and entitled accounts is required.

Further inspection found no external direct field consumers of `MeData.serviceDateTime`, `serviceEndDDay` or `giftPremiumActive` across all eight DEX entries: 339,367 implemented methods and 5,593,360 instructions were scanned. This result does not cover reflection or serialization. The gift-expiry screen reads separate preferences and updates its displayed clock every second; actual expiry enforcement remains unverified.

The original subscription-completion consumer updates `freeTrial` and `premiumState`, publishes the Premium event and activates cached Premium state only after `NetworkResult.Success`. Restore also retains the purchase-token and successful-network-result gates. Login, pending and failure branches remain independent of the three getter overrides. Complete asset downloads and backend acceptance remain untested. Evidence: `ev_d4ea0e8e2f4b4a574a39482c9fae6e3f52c92d8e814217c9df6daff2cd0da26e`; exact descriptors, offsets, scan scope and supporting records are retained under `/private/tmp/teuida-research/app-level-trial-expiry/`.

## Story media and playback cache

One original story flow runs from `CYAActivity.U` through the metadata response to `VideoPlayerExo` and Media3. It obtains the video URL, timing and timelines from the original `CYAData` response. The Premium getter also chooses numeric track-selection settings, so it affects more than the story access prompt. It supplies neither the media URL nor a successful network result. Evidence: `ev_f04c9e4579ef23677ebd1f8a411a08d4df9bef98ea017a5e8db50811abd61524`, `ev_d7ffd1e5768d44ce5507d6e88e655459c9d21681e85080803fe8c81cce733002`, `ev_38e14fcfc3172f7873cf69f74b06b38a2e6c3e9d8b16bf47dbeaa4200c532ad6`.

The original media path retains HTTP success/failure handling and on-demand disk caching. Received bytes pass through the cache sink, which finalizes written spans and deletes partial files on its exceptional path. Media-error diagnostics, retry scheduling and cache eviction remain original. These findings establish playback-cache wiring, without a live request, complete story download, actual rendered quality or backend entitlement verification. Exact descriptors and offsets for 44 selected methods, 2,937 instructions and 33 supporting REA records are retained privately under `/private/tmp/teuida-research/app-media-followup/`. Evidence: `ev_60bf191554eae7b7767319fcf96351f563f1b1bb4358cac38b54c5761eb58a4a`, `ev_d159231d785c8cc2522097974495af66636fec03298f81d54f128070c0ba59ed`, `ev_20c2ea1788bf174198016f6800fe8664a518eefa97c1d746e493561c440ef3bf`.

The selected story error callback discards the formatted player error and opens the original generic video-error dialog. Retry dismisses it and reuses the existing player; Close finishes the story activity. The eligible automatic retry also reuses that player. A separate ten-second buffering-stall callback logs diagnostics without directly opening this dialog. These paths establish neither successful recovery nor media-URL renewal. Device observations should distinguish a Retry/Close dialog from a freeze without one, then record whether Retry restores playback and whether Close exits. Nineteen original methods, 1,018 instructions and twenty REA records are retained under `/private/tmp/teuida-research/app-media-ui-followup/`. Evidence: `ev_f54187a2df9c5b87d08597f793d29c97b091b5e8e400068326ec03ad73bcaae6`, `ev_d2879b3a4ac22290729841e48ad4644a2718476b4f3e08d00265ed13f08838f4`, `ev_880b23149708fb6825b0abb768b05b5e94a8311c741e17330cf91b46cb47556e`.

## MicroG applicability

Both named availability methods exist with the exact DEX prototype `(Landroid/content/Context;I)I`: `GooglePlayServicesUtilLight.isGooglePlayServicesAvailable` and `GoogleApiAvailabilityLight.isGooglePlayServicesAvailable`. The wrapper delegates to the utility and maps an updating condition to `18`. The utility's JADX output contains duplicated-block warnings; precise branch conclusions require DEX inspection.

The app's `GoogleSignInHelperKt.b` uses **Credential Manager**, `GetSignInWithGoogleOption`, `GetCredentialRequest` and `GoogleIdTokenCredential`, then passes the ID token to Firebase Authentication. Legacy `GoogleSignInClient` redirection alone does not establish compatibility with this path. Credential provider discovery and routing need separate verification against the installed MicroG variant and Android version.

Native messaging is app-used: `FirebaseMessaging.getToken` has callers in `net.teuida.teuida.fcm.FcmTokenProvider.a` and `tech.notifly.utils.NotiflyFirebaseUtil.getFcmToken`. Messaging can be researched independently of the unresolved Credential Manager route. Google Play Billing's `com.android.vending` route must stay intact.

The experimental, disabled-by-default **MicroG integration** candidate now includes TEUIDA `1.23.0`. It maps the exact Google credential type to the MicroG provider capability, permits a non-system provider only for the Google sign-in option, and preserves the older `getSignInIntent` route in the Play Services fallback. Google ID bundle keys and Google Play Billing routing stay intact. On Android API 34+, the user must enable the MicroG Google ID credential provider. The [Credential Manager follow-up](teuida-microg-research.md) records the exact hooks and remaining device-verification requirements.

Further static tracing connects the Google credential helper to the app's SNS result model and login-request consumer. The helper schedules Firebase Authentication callbacks and passes the original credential ID and decoded subject to its app callback without awaiting Firebase completion. This describes callback ordering; it does not establish backend verification or successful authentication. Evidence: `ev_48f61d4095b1176876e17913280b0fa676f3485d1d18c20c0cb1358cc304368e`, `ev_e90be56c30d07bca97421bd7d64b2eebe69fe0cf686287e9df800878909f35ee`, `ev_eee91e5a49c02f3cd54cd99dae6751f47c988c92f16e43ef9d4e30c9a770e016`.

The original login repository stores the returned app token only after `NetworkResult.Success`. It then handles onboarding or fetches the original profile; a failed profile fetch yields `MeInfoFailed`, while a successful fetch saves the profile and yields `LoggedIn`. Credential-provider completion, Firebase completion, app login and profile retrieval therefore need separate device observations. No authentication request, callback result or token was changed. Exact method prototypes and fifteen verified REA records are retained privately under `/private/tmp/teuida-research/app-google-login-followup/`. Evidence: `ev_1b31b3e5e8000eef8c6d7640e85a7130f4b0f0e3d0b105a37ab77bf45cb77205`, `ev_65391b4f34dd1bbe4a28870401f4366a1a22a6ab103f69fc6043aea67507c0ff`.

## Validation

The combined local Premium + MicroG candidate compiled with Kotlin 2.4.21 and Morphe Patcher 2.1.0, applied to the original base APK, and produced patched DEX and compiled resources. SDK DEX verification found the same 1,938 optional-dependency hierarchy findings in the original and patched APK; no findings were added. Separate compiled-output checks verified the credential type constant/literals, provider flags, older backend selection, and unchanged Google ID bundle keys. Compiled manifest and signer metadata checks passed. The packaged `.mpp` passed loader checks; the full Gradle task graph and device testing are tracked in [validation results](validation.md).

## Evidence

Canonical records are exported locally at `/private/tmp/teuida-research/evidence.json`; the base APK and identity file are in that directory. No app account or live purchase service was used. The later offline emulator checks are recorded separately in [validation results](validation.md).

The additional app-level findings and method evidence are retained privately as `app-level-findings.md` and `app-level-evidence.json` in the same directory. They were obtained from the supplied artifact without a source map or developer test build.

| Observation | REA evidence ID |
| --- | --- |
| Package identity | `ev_1cd50e14b498f5c041acb3a8a8a3dde668a181923c0faf53d273799eefaf061a` |
| Shared Premium getter | `ev_067c885e1b4145e417806a41183fd2fe312c7b0ee7728a3155280fa9edfee4e3` |
| Profile Boolean getter | `ev_cc0f2567a65c2b506a84d4586ab6bd30089c9131cb878c5b97af2e804dc10488` |
| Profile state getter | `ev_d201b3b2ff6a5783544e78df4232e609c0da6a9583e3a1f584d136d7cf0cc95c` |
| Story prompt consumer | `ev_2aa7eb70a32691a712401d8c27701580993b4655a41e9c54dc36cc610a6e0017` |
| Shared getter callers | `ev_96966114499ba51d6fe7f52b0f66614abdf7d4668d31b4290968fc90fef3fd44` |
| Backend purchase request | `ev_28070274a61fa288e658118a5fc25c691235175a7fc9edfe46cab7a4bf833f2a` |
| Credential Manager sign-in | `ev_cc2de6706c7764393ce18d35bab9bdb721a4cf25be514ce77a1ed8e7949e0037` |
| Utility availability method | `ev_d23dd0a715fbe998a0280433fa3c7988966385f1c534a1a1e60a64f588d1a39b` |
| API availability wrapper | `ev_287b4c1174a2c019ae68e160681ffd75240961520c990d0b356ea79d500dd4af` |
| FCM callers | `ev_7f870da3f53114300ad7cbc6ef84ca7a81ca7d0440757a678d0b5a6e6199bb6b` |
