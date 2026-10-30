# PiTT Google sign-in study

## Scope and status

Historical research snapshot: 2026-10-29, PiTT 12.0.0 / 40892 (`com.ihad.ptt`).
The observations and alternative designs below describe the investigation, not
current installation instructions. The final auth-only adapter and Firebase
header correction are documented in [pitt-gmscore-study.md](pitt-gmscore-study.md)
and [pitt-firebase-client-identity.md](pitt-firebase-client-identity.md).
The user subsequently reported successful login and sufficient testing for
closeout. Temporary diagnostics used to isolate the failure have been removed.
See [pitt-implementation.md](pitt-implementation.md) for the maintained contract.

## Observed failure and evidence

- Selecting a Google account returns `ApiException` status 10 (`DEVELOPER_ERROR`).
  Google defines this as application misconfiguration, not a successful sign-in.
- The exported candidate's DEX entries match the qualified combined v3 output;
  its manifest matches that output. Its actual signing certificate differs from
  the original app's certificate. Google/Firebase configuration strings and their
  locale maps remain identical to the original and independently merged input.
  Do not generalize this to whole-APK/resource-table byte identity.
- Certificate/OAuth registration mismatch is strongly consistent with these
  observations. The developer's OAuth registration list is not available, so the
  error and certificate difference alone do not uniquely prove the sole cause.
- PiTT's sign-in result handler is `com.ihad.ptt.a.Y`, request 109. Failure occurs
  before `com.ihad.ptt.vd.S(GoogleSignInAccount)`, which reads the Google ID token,
  constructs `GoogleAuthCredential`, and calls Firebase sign-in with credential.
- The local sponsored flag does not produce a Google ID token. Billing receipt
  checks and their six-hour in-memory throttle are a separate mechanism, not an
  explanation for this Google authentication failure.

## Reference implementations

| Reference | Observed implementation | Relevance / limitation |
| --- | --- | --- |
| [Morphe YouTube GmsCore support](https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/youtube/misc/gms/GmsCoreSupportPatch.kt) | Routes supported Google app services through GmsCore and supplies original app identity metadata | Established patch architecture, not proof of PiTT/Firebase compatibility |
| [LINE research](https://github.com/andrewliang25/morphe-patches/blob/main/docs/line-patch-map.md) | Maintainer reports real Drive authorization and restore using MicroG-RE; separate Credential Manager account login remains unsupported there | Drive scope/token success must not be described as all Google sign-in working |
| [hxreborn GmsCore ID-token helper](https://github.com/hxreborn/morphe-patches/blob/2255584c5b2ad72e5c8cc86e8a41746d598fceb7/extensions/extension/src/main/java/app/hxreborn/extension/shared/GmsCoreSignIn.java) | Requests a server-client-audience token via AccountManager and delivers a host credential callback | Closer to PiTT's ID-token requirement; no reproduced PiTT success |
| [All-In-One Calculator adapter](https://github.com/hxreborn/morphe-patches/blob/2255584c5b2ad72e5c8cc86e8a41746d598fceb7/patches/src/main/kotlin/app/morphe/patches/allinonecalculator/misc/gms/GmsCoreSupportPatch.kt) | Connects a Flutter Google sign-in plugin to that helper | Host callback types differ from PiTT |
| [TikTok login compatibility](https://github.com/kveld9/kveld-morphe-patches/blob/7ce47b348450891ae2ff51bd38de580ab9c567a4/patches/src/main/kotlin/app/morphe/patches/tiktok/privacy/LoginCompatibilityPatch.kt) | Selects an existing Web OAuth fallback instead of native Google sign-in | Non-microG reference; requires an existing supported web route |
| [TeraBox Google login](https://github.com/hxreborn/morphe-patches/blob/2255584c5b2ad72e5c8cc86e8a41746d598fceb7/patches/src/main/kotlin/app/morphe/patches/terabox/misc/login/FixGoogleLoginPatch.kt) | Uses existing web account/session bridge | App-specific; not a generic embedded-WebView solution |
| [Firebase re-sign repair](https://github.com/rushiranpise/morphe-patches/blob/36e542058f41bf49791cffe67e37beba8460a2ad/patches/src/main/kotlin/app/template/patches/shared/firebase/SpoofFirebaseCertHashPatch.kt) | Adjusts Firebase Installations certificate hash / header | Not evidence of fixing Google's pre-token status 10 |
| [FairEmail OAuth](https://github.com/M66B/FairEmail/blob/master/app/src/main/java/eu/faircode/email/FragmentOAuth.java) | AppAuth browser authorization and code exchange for Gmail | Non-microG architecture, not a Firebase login patch |
| [K-9 Gmail configuration](https://github.com/thunderbird/thunderbird-android/blob/1d3437a6188fa316579d5be93a03a8d43a83cb83/app-k9mail/src/release/kotlin/app/k9mail/auth/K9OAuthConfigurationFactory.kt) | Registered Google client and app-specific redirect | Cannot substitute its client or audience for PiTT's |

Source availability is not runtime acceptance. The surveyed hxreborn snapshot
contains 19 app-specific GmsCore adapters; source/test file counts are not counts
of successful device logins.

## Non-microG findings

- [AppAuth](https://github.com/openid/AppAuth-Android) uses browser/Custom Tabs and
  PKCE; it explicitly does not support WebView authorization. Its
  [Google example](https://github.com/openid/AppAuth-Android/blob/master/app/README-Google.md)
  still requires registered client/certificate/redirect configuration.
- Google's [custom URI announcement](https://developers.googleblog.com/improving-user-safety-in-oauth-flows-through-new-oauth-custom-uri-scheme-restrictions/)
  describes default restrictions and a client-console opt-in. Do not assume an
  arbitrary Android redirect works without checking the actual client settings.
- [Firebase Web Google sign-in](https://firebase.google.com/docs/auth/web/google-signin)
  supports popup/redirect and manual ID-token handoff, using the project's Google
  client. This does not establish accepted PiTT web origin/redirect/audience.
- PiTT has three BROWSABLE activity filters: PTT links, Firebase GenericIdpActivity
  and Firebase RecaptchaActivity. No app-owned Google web OAuth fallback was
  established. GenericIdpActivity includes `sha1Cert` in its browser request.
- Bundled `getFallbackSignInIntent` / `APPAUTH_SIGN_IN` is SDK routing, not proof of
  web OAuth. A TikTok-style single fallback switch is therefore not justified.
- Root mount/original-signing-identity routes are not qualified for this target.

## GmsCore follow-up

The version-specific runtime and preferred auth-only adapter design are recorded
in [pitt-gmscore-study.md](pitt-gmscore-study.md).

## Historical investigation criteria

Compare a minimal auth-only adapter with broad GMS redirection. Establish the
actual supported token API and GmsCore variant before choosing either. Preserve
PiTT's original Firebase project, Google server client audience and real token
verification. Never manufacture a token, receipt or successful authentication.

The following was the investigation checklist; it is not an assertion that every
account/device/failure scenario has been reproduced:

1. The intended GmsCore variant is installed and visible; absence/cancellation
   produce actionable errors without crashing or a false success.
2. Consent and account selection return a real Google ID token for the existing
   server client; never log tokens, account identifiers or credential payloads.
3. Original Firebase credential sign-in succeeds, followed by the original PiTT
   account-state callback; distinguish each failure stage.
4. Cold start, signed-out and already-signed-in cases, account switching,
   cancellation, consent denial, network failure and token expiry behave normally.
5. Billing, IP lookup, ads policy, push notifications and unrelated Google-service
   clients retain their existing behavior; no broad string rewrite by assumption.
6. Input pins, independent APK graph/resource comparisons and exact-head build
   checks remain mandatory when the implementation changes.

## Official error/client references

- [CommonStatusCodes](https://developers.google.com/android/reference/com/google/android/gms/common/api/CommonStatusCodes)
- [Client authentication](https://developers.google.com/android/guides/client-auth)
- [Firebase Android Google sign-in](https://firebase.google.com/docs/auth/android/google-signin)
