# Du Chinese 3.6.1 research

Static inspection on 2026-11-02 found a local subscription preference and lesson-opening checks. The experimental patch changes the subscription getter and one confirmed next-lesson navigation check. A separate patch redirects native Google service references to MicroG. Offline emulator startup passed; server subscriptions, protected downloads and authenticated device behavior remain unverified.

## Artifact

| Item | Value |
| --- | --- |
| Original | Workspace `Du Chinese.apks`; preserved |
| APKS SHA-256 | `7da2e66090857375d4c5df7a8d440c311c5192ab972d2d9775dc4db1ed7e9dec` |
| Extracted base APK SHA-256 | `cb326c447ca0272a0a23fbe51cde3bb4b8953d9293a937629f2a49d798a4ea45` |
| Package | `org.sinamon.duchinese` |
| Version | `3.6.1`, version code `4178` |
| SDK | Minimum 21; target 36 |
| Splits | ABI `arm64_v8a`; locales `en`, `ja`, `zh`; density `xxxhdpi` |

Analysis files are under `/private/tmp/du-chinese-research`: `base.apk`, `artifact-identity.json`, `AndroidManifest.xml`, `dex-inventory.json`, `google-strings.txt` and `android-evidence.json`. REA used JADX headless 0.7.1 with JDK 21.0.12.1. APK signature verification passed during output checks; publisher identity was not independently verified. Package evidence: `ev_9e54222cb8215647c74ff8de22c1bbf09dbaed2a65b3c513eba52313cb2d929d`.

## Observed local checks

- Raw `Lorg/sinamon/duchinese/models/o;->M(Landroid/content/Context;)Z` reads the default shared preference `isSubscribed`, defaulting to false. REA found 30 direct using methods. Evidence: `ev_cd5e2d5af40361f08fe62a190800f65b30bca91fd9b58a58410276204156ea66`, `ev_9761bde65b5f3d0931aff3aa28bb139e7f8709336d5cd3e4f814edf89fa418ca`.
- `Zb.E.C(ListDocument, navController, Context, onPremiumRequired)` calls the premium-required callback when `lesson.isLocked()` is true and `o.M(context)` is false; otherwise it constructs lesson navigation state. Evidence: `ev_36254790e5cb003c9233bfeed362d391862871cdc15aaf0e341c7abf46a717d4`.
- Raw `Lec/J;->f(Landroid/content/Context;Lorg/sinamon/duchinese/services/media/PlaybackSpeed;)Lec/K;` refuses next-lesson navigation when the next lesson is absent or locked. It subsequently saves the reading-list position and returns a navigation result. Its `ListDocument.isLocked()` invoke is at code-unit offset 15 in `classes3.dex`. Evidence: `ev_0f1c515a7660ef3c18afb1d29fd8d7cb165403ced041fed997d66905715b1fc2`, `ev_3f67284a18d35f367df6e1446139a15f4755c8f15629b8bafaa5027a6778d1dd`.
- `ListDocument.isLocked()Z` reads its boolean backing field. The getter has 15 direct using methods, including UI checks, copies and storage. `Db.n.c` writes its result into the `is_locked` database column. The patch leaves this getter intact. Evidence: `ev_1ba1e8b6d089a2a7fc5e4a02cacb28a542406e3d3a62fd87331678883c75e981`, `ev_f7c0f3099de5207ade2ceeb82b80d16b4938148f463d2bd71ee3cdb0ae0a5a6b`.

`Enable local Premium controls` defaults to false and declares only inspected version 3.6.1 as experimental. It returns true from `o.M` and replaces the immediate boolean result of the single `ListDocument.isLocked()` call in `ec.J.f` with false. Exact class, method and parameter fingerprints, the `isSubscribed`/`context` strings, and invoke/result opcode checks make it fail when the expected code changes. The explicit next-lesson override covers one caller; the other 14 raw lesson-lock consumers remain unchanged.

**Inference:** these edits should enable the local controls that use the shared subscription getter and allow the confirmed next-lesson navigation path to proceed. They do not establish that content exists locally or that a server will return it.

## Billing and server state

- Play Billing is declared in the manifest. `zb.d.g` stores the real subscription SKU, order ID and token before calling `o.j0(context, true)`. This code is unchanged. Evidence: `ev_a283785ccefd33d8b459a90893555e6bbd5ca644b51b07caa0795ea2d1589ca9`.
- The home response handler `org.sinamon.duchinese.ui.fragments.home.y.h3` parses `MyPageResponse`, caches it, and writes `myPageResponse.isSubscribed()` through `o.j0`. Thus the preference also reflects received server state. Evidence: `ev_f0f5b2a70fc8181e989a938f65dd7809003d04dbc1219c3e18a6c0825f6e7796`.
- `SubscriptionActivity.R0` requests `purchases/status`, passing an existing subscription token as `t` and, when logged in, user UUID/token. The response contains account/device subscription booleans and Play subscription state/expiry. The observed account-subscription getter is used by subscription-screen presentation; it is unchanged. Evidence: `ev_c1d7aa181ea26a716460ad9bb99b9044430e18bce802d187a1efa28bd16a9113`, `ev_627d1961bee6c1d41a0103a2f945c82d3d2c34fa1e612da8a424e8f6ee5c0858`, `ev_f6ff8415523172f0f2eebcc68832b9b83e7b13070240934081340a918b7b7627`.

**Unknown:** enforcement on lesson, audio and vocabulary endpoints, receipt validation results and account-level entitlement. No receipts were fabricated and no live endpoint was contacted. The patch alters neither stored billing data nor these response handlers.

## Reading download diagnostics

The reading-text request is a GET using the lesson's CRD URL. Its error callback, `MarqueeActivityFragment$d.a(f5.u)`, discards the Volley error and opens the generic download-failed dialog. The subscription and MicroG patches leave the inspected reading URL, request, credentials and parser unchanged. These static findings do not establish the failing device's HTTP status.

The optional **Show reading download errors** patch adds these details to that dialog:

- The actual Volley error class.
- HTTP status when the error retains a network response.
- Response byte count and MIME type, when available.
- Up to four cause classes and three method locations per throwable, when available.
- Whether the original malformed-URL wrapper contains an empty or nonempty request URL.
- Original lesson input, accepted reader URL and latest binding-attempt URL presence.

The additional labels mean:

| Label | Observation |
| --- | --- |
| `Observed lesson URL` | Latest original `crdUrl` input observed on the model when the accepted reader binding was attempted |
| `Reader URL` | Actual URL value stored by that accepted reader binding |
| `Latest observed lesson URL` | Latest model input observed when a binding attempt reached the reader, including an attempt its one-time guard skipped |

These labels show only `null`, `empty`, `nonempty` or `unavailable`. The original input is recorded before null-to-empty normalization. The accepted observations remain unchanged when a later attempt skips the original URL store. A model update suppressed by the outer binding guard does not update `Latest observed lesson URL`. The model observation is a snapshot at binding time and is not atomically associated with the collected reader state. It does not identify a response, cache or stored document as its source.

Method locations contain only validated class and method names and positive line numbers. Missing line numbers do not prevent displaying the method. Cause cycles and longer chains are marked as omitted.

It excludes URL values, response contents, token values, exception messages, filenames and suppressed exceptions. Request URL presence is classified only for the original `RuntimeException` wrapper with an immediate `MalformedURLException` cause and its known message prefix. Lesson observations retain only fixed presence labels in synchronized maps with weak model and reader references. The details are consumed once on the callback thread; other dialog messages retain their original text. It changes neither requests nor entitlement.

To reproduce, refresh the Suchi source in Morphe, patch the original Du Chinese 3.6.1 APK with **Show reading download errors** enabled, and reopen the failing premium reading. Share the dialog details with the developer.

An HTTP 401 or 403 warrants checking authorization, account entitlement and the issued content URL. A missing attached response does not prove a transport failure: Volley can also discard response metadata while constructing another network error. The cause class can identify DNS, TLS or socket failures. Original error-construction branches provide these additional version-specific clues:

| Error class | Observed construction |
| --- | --- |
| `f5.a` | HTTP 401/403 authentication error |
| `f5.d` | Other HTTP 400–499 client error |
| `f5.s` | Server or remaining HTTP error |
| `f5.t` | Socket timeout |
| `f5.l` | No HTTP response object; may retain an I/O cause |
| `f5.j` | Response bytes unavailable; metadata may be absent |
| `f5.u` | The network dispatcher wraps an unexpected exception with its cause, without attaching response metadata |

On 2026-11-02, the user reported `f5.u`, no attached response, an immediate `java.lang.RuntimeException` at `g5.l.e` / `g5.b.a`, and a nested `java.net.MalformedURLException` at `java.net.URL.<init>`. The original dispatcher `f5.i.d` catches unexpected exceptions across request execution, response parsing and cache handling; its generic wrapper alone would not identify which stage failed. The reported nested cause and locations identify URL construction on this path. Evidence: `ev_ce8c923cd0b791786016d2e0ba8c819576f612b70d5fb98050f363cdf3dba043`.

The original `g5.h.a` constructs `new URL(request.M())` before opening a connection or obtaining a response code. `g5.b.a` catches its I/O exception, and `g5.l.e` wraps `MalformedURLException` in the reported `RuntimeException`. This accounts for the unavailable HTTP status without establishing an authorization failure. Evidence: `ev_bd0da6addc12defd4708231100a0f481b78dcd47c25fcd59d8ced1372269f88d`, `ev_72ee2df8438f1e96e3246a5e6a5614f29632607812eb87710d1e63ab58b9a97b`, `ev_f32eca6a89076556e4389903d94e2ce1e9c7f9a34a3275455f9377e61e341143`.

The user subsequently reported `Request URL: empty` with the same cause and method locations. This confirms an empty request URL on the reported device path: URL construction fails before a connection opens, so this attempt provides no HTTP status or authorization response.

An omitted `ListDocument.crdUrl` defaults to null. The selected lesson passes through `MarqueeRoute` / `ItemModel` into `ec.J.v`, which converts null to an empty string in `MarqueeUiState`. The exact `ec.H$a.A` binding passes that state URL as argument 4 to the fragment's `S3`; `y3` constructs the GET from the stored value. These steps preserve an already empty URL. Evidence: `ev_5a368cd08b94ece914945780fe9163078ecaf64b68918744aadc5c9ec33dff18`, `ev_b2dcecef2839c04b5b52e1da3eb14a730964711ea5773a21488562ba368e0be8`, `ev_bcb6204a052278b223dcbe8819dea70e2e01c96bdaca8a8154fce0d6ca42fcb9`, `ev_4b842a6ddd9aaeebe7ecb466969619ac6c5d905dec2f53af7025115bd039dd0c`, `ev_f9d8eeb34b2120fec22fe6eb7d5025fb2c53d083cfb0d270816a89da31a8fac2`.

Both binding layers have one-time guards. The checked later settings update preserves the existing URL, and no normal URL-refresh publisher was found within the direct-call search boundary. Original lesson storage also preserves `crd_url` on write/read conversion. Missing response metadata, stored null/empty metadata and a stale navigation snapshot remain possible origins; no later good URL, ignored update or server denial was observed. The next comparison is URL presence at those original inputs, without recording URL or credential values. Exact descriptors and offsets for 35 selected methods, 2,037 instructions and 22 REA records are retained privately under `/private/tmp/du-chinese-download-diagnostics/empty-url-provenance/`. Evidence: `ev_979aef9daa408bef91b4ff6eaaf7c8bf33488f94b6ced5c72d340aa2097fe020`, `ev_5af4b9fcd408c1bb815e3356354fb4eebfbf8d12203ce5e15a7dd5a4a81dc751`, `ev_b3ed78b739b1d1144a189957770a658863f15528099f8fccc847c3c243b31638`.

The checked collection/story response serializer declares `crd_url` optional and nullable. Its response, state, copy and navigation paths preserve the original lesson metadata. Collection initialization can publish saved or cached lessons before starting the normal fetch, and Favorites can open a stored document or its parent collection. Opening from the collection screen therefore does not by itself establish fresh metadata. Seventy-six selected methods, 2,996 instructions and forty-one REA records are retained under `/private/tmp/du-chinese-download-diagnostics/upstream-lesson-provenance/`. Evidence: `ev_d5a9d81f0e419e86ad63b0c7028f66d5307df7fd6c8f15b196c159a1722b4e85`, `ev_0a782e1211552d285ff75d783298bce0ed363d2588e8aef9c6f48c8c7b77edfc`, `ev_726b9330db948682efe7c929b4290470f8708f309cccc13d4c9df5b490cc0466`.

That list request retains the original stored subscription token as `t`, omitting it when absent or marked expired. For a registered account it also reads the original stored UUID/token. The seven checked credential source/helper bodies do not call the patched subscription getter `o.M`; credential writers and state history remain outside this trace. Evidence: `ev_f1695414d954cca97356f1829752ea1f780ca7d3671fc389f70f8ef0ec079dac`, `ev_79c63974cc1d834124f8c0eeac697031495c75cebd54333a26e28b6318e5cc45`.

The original reading GET inherits `xb.g.A`, which adds only a User-Agent header. Volley also supplies conditional cache headers, `If-None-Match` and `If-Modified-Since`. These selected producers attach no account UUID/token or Authorization header; the supplied lesson URL is passed unchanged through the request constructors. This does not establish content-server policy, signed-URL requirements or cookie behavior. Twelve original methods, 257 instructions and twelve supporting REA records are retained under `/private/tmp/du-chinese-download-diagnostics/crd-request-metadata/`. Evidence: `ev_f0d3057e49fa33c5db7b2801c22fd596b138171fa0edbfdb77ed86e519cef3c8`, `ev_a914c65f8000bda7f6c56d360131e78333784d3bea94fd2ed3031adcc8a74b96`, `ev_f0bfe6556c38a2e5449396140444e13470d39334185629bbd8057ac456eeae82`.

For the next device comparison, refresh the Suchi source and re-patch the original APK with the updated diagnostic enabled. Refresh the parent collection/list and wait for it to finish, then open the same reading in a new reading screen. Compare that with opening its stored document from Favorites, recording the entry path and all four URL-presence labels for each. `Observed lesson URL: null` with `Reader URL: empty` is consistent with the original normalization path, but does not prove both observations came from the same state publication. A later `Latest observed lesson URL: nonempty` with the reader still empty shows a newer observation at a binding attempt that did not replace that stored value. Equal empty-URL errors still leave the metadata source unresolved.

Invalid reading JSON uses the separate invalid-lesson dialog. The earlier `xb.a.c` downloader finding concerns audio and does not establish the reading-text failure.

## Google services and MicroG applicability

The native login activity inspected builds an email/password form. The retained `GoogleSignInAccount` references belong to obfuscated Google library classes; they do not demonstrate an app login flow. Raw base-DEX class inventory contains none of the exact classes `GoogleSignInClient`, `GoogleSignInOptions`, `GetGoogleIdOption` or `androidx.credentials.CredentialOption`. An obfuscated or dynamic Google login path remains unproven. Evidence: `ev_69a4d068ec0938aac296556377964e9d58abe3c71a3e744aa66044cd5095b5ef`, `ev_dc9decd56b53fecd4f31708dddf020846faa1a7e9312916f4a15def50aed28f1`.

FCM is active in shipped native code. `DuFcmMessagingService.r(String)` handles a new token and forwards it to account storage; `o.w0` constructs a `user_devices` request containing the account UUID/token and `gcm_token`. The manifest declares an exported Firebase receiver protected by `com.google.android.c2dm.permission.SEND`, the C2DM receive action, and non-exported services using the internal `com.google.firebase.MESSAGING_EVENT` action. Evidence: `ev_3470db934ae6a4bcef587a27ab8c4115450eafa15e3f7542b31de54ab87db06b`, `ev_338e8b1a426ce46b32c012bc75998d46a0f02978e2c6648d7dd34d3ebad20b4b`, package evidence above.

The availability checks are obfuscated:

| Raw method | Observed behavior |
| --- | --- |
| `LY5/n;->f(Landroid/content/Context;I)I` | Google services manifest, package, signature, version and enabled checks; codes 0/1/2/3/9 |
| `LY5/k;->h(Landroid/content/Context;I)I` | Calls `Y5.n.f`; returns updating code 18 or the underlying result |

These correspond to the `GooglePlayServicesUtilLight` and `GoogleApiAvailabilityLight` patterns, so a shared MicroG helper needs these exact descriptors rather than the unobfuscated names. JADX reports duplicated-block warnings in `Y5.n.f`; its reconstructed branches are unsuitable for proving precise control flow. Evidence: `ev_cc31a46fe80dea10eba3cf657a796842af72206ced6463f2b46271d5bcb2343f`, `ev_90b46a555ddae29ea08b217be4d61287191fa503f1ed265da5f96f51a0a75275`.

The base DEX contains these external service-action constants:

| Action | Routing finding |
| --- | --- |
| `com.google.android.gms.common.telemetry.service.START` | MicroG-RE vendor alias previously confirmed |
| `com.google.android.gms.signin.service.START` | MicroG-RE vendor alias previously confirmed; app sign-in use unproven |
| `com.google.android.gms.ads.identifier.service.START` | Preserve; provider uses the original action |
| `com.google.android.gms.measurement.START` | Provider support requires a separate check |

The shared **MicroG integration** patch includes these exact obfuscated availability methods. It redirects selected external package, account, service and provider identifiers to `app.revanced.android.gms`, adds a package query and original signer metadata, and makes both availability checks return success. Class/Binder descriptors, app-local provider authorities, internal Firebase actions and Play Billing routing retain their original values. The unsupported or unverified service actions above also remain unchanged.

The patched base APK and supplied splits installed on an isolated Android 37 emulator and reached onboarding/`MainActivity` offline without a package crash. The patch requires the matching MicroG provider for Google services; FCM delivery, account registration and paid feature behavior remain unverified. See [validation results](validation.md).

## Validation

All three Du Chinese patches compiled with Kotlin 2.4.21 and Morphe Patcher 2.1.0, applied together to the original base APK, and produced verified DEX and resources with no hierarchy findings. The current Gradle build, twenty-three JUnit tests and bundle loader checks passed. All lines and branches of the six new lesson-state helper methods are covered.

The v1.1.0 diagnostics APK installed with the original supplied splits and reached `MainActivity` on an offline Android 35 emulator without a package crash. An Android test using the updated APK's real Volley classes verified synthetic HTTP 403 metadata, a DNS cause class, the original malformed-URL wrapper's nested cause and location, and the actual callback's null-fragment cleanup. These fixtures contacted no backend and do not identify the reported device failure. See [validation results](validation.md).

The current lesson-state fixture exercised the actual patched lesson publication and binding methods with synthetic state. Input classifications, accepted and skipped stores, both lifetime guards, direct helper rendering and complete callback cleanup passed. It does not establish live dialog rendering or production state ordering; the detailed fixture boundaries are recorded in [validation results](validation.md).
