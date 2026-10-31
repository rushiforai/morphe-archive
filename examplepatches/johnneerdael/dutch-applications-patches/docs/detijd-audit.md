# De Tijd 5.6.1 patch audit

The anonymous app receives substantially more article text than its paywall view displays. On 30 October 2026, an account-free emulator session received **21 paragraphs** for `urn:article:10697906` and **27 paragraphs** for `urn:article:10696933`, while each article's normal paywall request returned HTTP 403 and `hasAccess:false`. The local candidate displays the already-delivered paragraphs by changing the presentation predicate. It preserves the requests, client token, paywall response, device identifier and actual subscription state.

The original six controls are published on the dev channel in [v1.21.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.21.0-dev.1). The follow-up described below is published in [v1.22.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.22.0-dev.1): it opens the delivered De essentie feed without an account or the “Ga verder” offer page, suppresses automatic Airship in-app messages through the SDK's completed-skip path, and adds a separate default-off Mijn Tijd button option. These changes are not present in the historical release artifact recorded below.

All seven individual selections, the combined selection and the six standard controls pass real Morphe FULL patching, signing and decoded-output validation. The standard-six candidate also opens De essentie directly and displays its supplied text on the anonymous emulator. The delivery samples and runtime acceptance remain specific to the inspected content and setup.

## Artifact identity

| Property | Inspected input |
| --- | --- |
| Package | `mobi.inthepocket.mediafin.detijd` |
| Version / build | 5.6.1 / 5060100 |
| Minimum / target SDK | 26 / 36 |
| Input | Original Play APKS: base, arm64-v8a, English and xxxhdpi splits |
| Base APK SHA-256 | `3542cf46404d877c2b1b92ed7127e29b5c746d692f930f8da488623dcf77c03d` |
| Publisher signer SHA-256 | `33b358dd130e12ea84e7231f191e7d94194c797226522237063da6396a0d3b9f` |
| Hermes asset SHA-256 | `e14787df25e9b2529bd18ee6860332ace0742646282bf4471043070cd8bb8c35` |

The shared original-input dependency checks package, version, versionCode, minimum SDK and publisher signer before mutation. The Play source stamp is separate from publisher identity. The bundle contains L'Echo branches, but no L'Echo artifact was validated and no L'Echo support is declared.

## Evidence and platform

**Seen:** the app is Endare's React Native application, using `com.endare.mediafin.MainApplication`. The legacy package name does not identify its current implementation. Business logic lives in the Hermes v98 asset `assets/index.android.bundle`, 9,112,324 bytes with 39,206 functions. All 38,817 non-empty functions pass strict instruction decoding. REA package inspection records the matching base identity in Evidence `ev_c388f4590309c5a99e758a02387791d245e799ca4eec916ed24b572fe31b5b29`.

**Seen:** anonymous authentication obtains the app's existing client-credentials token through native Remote Config and `lb.a`. It does not require an Auth0 user session. Native caller inspection, including REA Evidence `ev_4fd6419468fe4aa33be4395d2c42934eb1d474fdb18bb835a3e17d4db4acccc4`, informed the preservation checks. Decompiled output has type-inference limitations; fresh smali supplies the native patch contracts. No credential value or generated token is included in tracked source or evidence.

**Inferred:** the inspected callback and iterator completion shapes let the selected telemetry paths finish locally. **Unknown:** exhaustive traffic suppression, every media surface, every article and other Android versions. Runtime acceptance below covers the combined candidate on one anonymous emulator session; it is separate from the earlier onboarding-only delivery probe.

## Anonymous article delivery and the VI comparison

The VI investigation showed why an ordinary paywall result is insufficient evidence that the app cannot fetch a body: VI has a separate shipped article-scope/header mechanism. De Tijd's shipped article, article-block, summary, translation and feed entry points were inspected before testing its normal anonymous path. Alternate-route runtime tests were unnecessary once the ordinary article response supplied the body; they are not claimed as tested.

For the tested De Tijd articles, no alternative authorization mechanism was necessary. A fresh Android 14/API 34 arm64 emulator installed the four splits with only onboarding selector function 16251 changed to false and the Hermes footer recomputed. The probe entered the homepage without signing in. Natural article clicks issued the app's ordinary article and paywall requests.

| Article | Normal article GET | Delivered paragraphs | Normal paywall PUT |
| --- | --- | --- | --- |
| `urn:article:10697906` | HTTP 200 | 21, including multiple text paragraphs and editorial/embed types | HTTP 403, `hasAccess:false` |
| `urn:article:10696933` | HTTP 200 | 27, including multiple text paragraphs and editorial/embed types | HTTP 403, `hasAccess:false` |

The app still showed the subscriber wall and reduced display. The retained sanitized capture contains request paths, statuses, paragraph types and text lengths; it excludes response text and header values. The private capture is `apks/research/detijd-runtime/anonymous-article-shapes.json`. The tested state had no signed-in account; the user's USB installation and login were untouched.

The ordinary article portion changes only `shouldShowPaywall` function 25249. The follow-up adds the De essentie presentation edit described below. The original `usePaywall`, article fetch and anonymous token logic remain intact. The article predicate also selects an ad-insertion branch, so **Read full articles depends on Hide ads**. Text-to-speech, gifted access, editions, subscriptions and any body the publisher withholds remain separate server-controlled features. No universal body-availability claim follows from two samples.

The final combined candidate was then installed on the fresh API 34 arm64 emulator. It opened the homepage without the automatic consent screen, onboarding or service banner. Opening `urn:article:10697906` again retained the normal HTTP 200/21-paragraph article response and HTTP 403/`hasAccess:false` paywall response. Seven scrolled UI layouts exposed 11 unique long text views totalling 3,341 visible characters, with no subscriber wall in those layouts. No AndroidRuntime or ReactNativeJS error was observed through this reading check. The retained summary records counts rather than article text: `apks/research/detijd-runtime/all-runtime-reading.json`.

## Current controls

| Control | Default | Candidate behavior | Dependency |
| --- | --- | --- | --- |
| Hide ads | On | Suppress nine inventoried Hermes insertion, banner/native/outstream host and video-ad-link functions; reject the native ad-loading Promise once through its existing error path. | Original-input guard |
| Disable tracking | On | Stop inventoried native Gemius/audio Snowplow sends, remove the Gemius-only startup tail, deny eight Firebase analytics defaults, and stop the selected JS Snowplow, Admantx and Mux boundaries. | Hide ads |
| Hide Premium banner | On | Hide the service banner and return the SDK's `SKIP` readiness result for automatic Airship in-app messages. No account or subscription value changes. | Original-input guard; native promotion helper |
| Read full articles | On | Display delivered article paragraphs and open the supplied De essentie feed directly, bypassing only its login/offer presentation branches. | Hide ads |
| Skip consent screens | On | Suppress automatic Didomi setup UI and resolve the tracking-explainer decision false; preserve saved consent and manual privacy preferences. | Disable tracking, therefore Hide ads |
| Skip onboarding | On | Select the app navigator directly through function 16251. No persisted first-launch, account, subscription or consent field is written. | Original-input guard |
| Hide Mijn Tijd (expert) | Off | Hide only the Mijn Tijd bottom-bar button. Retain De essentie, the registered routes, navigation indices, weekend labels and manual account access. | Original-input guard |

Server-supplied `advertisement` paragraphs occurred in the sampled bodies. Their separate renderer is unresolved; the inventoried ad-host stops are not a claim that every remote ad surface is removed. Sponsored editorial labels remain disclosure and are retained. Hide Premium banner suppresses the whole service-banner visibility hook, including any error/service notice delivered through that banner, and all automatic Airship in-app messages through the inspected executor, regardless of campaign content. Airship screen-name handling, push initialization, independent action schedules and manual message-center paths remain. Manual login, logout, client-token refresh, native media, Didomi initialization and privacy preferences remain original native paths.

## Follow-up: De essentie, promotions and Mijn Tijd

### Delivered De essentie content

**Seen:** `MomentsFeedScreen` function 23982 calls `useMomentsFeed` 23637 unconditionally. Its query callback 37266 uses the ordinary authenticated Axios client for `GET content/feed/timeboxed/urn:agencygroup:tijd/MOMENTS`. An anonymous request returned HTTP 200 with three feed articles, each containing six paragraphs: three headings and three substantial text paragraphs. No alternative endpoint, signed-in user or fabricated access value was needed. The sanitized request evidence is `apks/research/detijd-followup/moments-fresh-interactive.log`, request 6.

The screen then used the genuine logged-in value and a generic YBot offer object to select `MomentsPaywall`, despite the separately supplied feed. Its “Ga verder” callback 33367 navigates to the offer's `ctaLink`; it does not load or unlock the feed. The follow-up changes only function 23982 relative bytes 740–752 to a direct jump to the existing empty/data decision at 752. The query, actual account state, offer data, hooks, paragraph mapping and weekend branch at 734 remain unchanged. A missing feed still takes the original empty or weekend path.

**Seen on the standard-six candidate:** De essentie opened directly on the API 34 arm64 emulator without an account, “Ga verder” page or subscriber wall in the tested view. The layout exposed the `7u`, `12u` and `17u` sections and three long text views of 169, 325 and 268 characters. Evidence: `apks/research/detijd-followup/anonymous-moments-repaired.png`, `standard-moments-layout.json` and `anonymous-moments-ui-summary.json`. This acceptance covers the supplied feed sample, not future publisher availability or every feed state.

### Automatic in-app promotions

**Seen:** the Airship pause getter feeds the automation engine at startup, but pausing retains waiting work. The selected boundary is instead the message-only readiness method `Lsu/n;->k(Lsu/x;Lau/b3;)Lau/i3;`. It returns the existing SDK enum `SKIP`. The unchanged executor dispatch separates message schedules from action schedules; the original engine handles `SKIP` through schedule disposition and preparer/asset cleanup, without entering the display executor or waiting on `NOT_READY`.

The shared message executor covers the shipped fullscreen, HTML, modal, banner, layout and custom adapters. Legacy push in-app messages are converted into the same schedule/message path. Notification delivery, independent action schedules, SDK initialization and manual message-center/preferences/content paths are retained. This is an automatic in-app-message control, not complete Airship traffic suppression or a stop for unrelated system/app dialogs.

**Seen in the emulator fixture:** the original SDK returned `READY`, and a text-only local `ScheduleAction` fixture actually opened the SDK fullscreen activity (`popup-baseline.png`). The patched typed fixture returned `SKIP` through direct, dispatcher and engine readiness; its actual `k0` consumer completed with `true` and zero adapter displays. A separate real persisted schedule reached `SKIP`, moved from prepared to idle, ran schedule and asset cleanup and never entered the display executor. Retained console proof is `apks/research/detijd-followup/popup-patched-console.log`, summarized in `popup-runtime-summary.json`. These are distinct typed in-memory and persisted-queue checks; no remote campaign or account credential was needed. Live push delivery and the exact remote campaign originally seen on the phone were not exercised by these local fixtures.

### Mijn Tijd and the free account

The user confirmed that Mijn Tijd works with a free De Tijd account; no paid membership is required. Keep it visible by default. Recommend **Hide Mijn Tijd (expert)** only when the user does not intend to use an account.

The optional edit replaces only the first 86 bytes of the bottom-bar renderer function 33218, with its first 74 bytes retained. It returns the existing null result for the `profile` route while preserving De essentie, original route registration, indices, deep links, label fallbacks and the Moments/weekend label. The compiled MPP explicitly declares `default = false`. Independent semantic checks cover 504 route/index/label/weekend/descriptor cases.

**Seen with the expert option enabled:** the emulator displayed exactly four bottom buttons—Nieuws, Recent, De essentie and Meer—and all four retained routes were visited successfully. Mijn Tijd was absent. The default-six output retained all five normal buttons, including Mijn Tijd. Private layout evidence is saved as `apks/research/detijd-followup/expert-bottom-buttons.json` and the four `expert-nav-*` captures.

The genuine free-account session on the USB phone was preserved: no reinstall, data wipe or logout was performed. Its existing installation signing certificate differs from the desktop-signed candidate, so the candidate cannot replace it in place. Free-account functionality is supported here by the user's confirmation and inspected source, not a claim that the anonymous emulator was signed in or had a paid subscription.

## Guarded Hermes editing

Each edit pins the complete bundle identity, function header, function-body digest and overwritten bytes. Short entries end at an original instruction boundary; opcode-zero padding follows an unconditional return or jump where needed. Function offsets, sizes, string tables and file length remain unchanged. The trailing 20 bytes are recomputed as SHA-1 of the preceding asset bytes.

Async tracking and consent wrappers retain their generator/Promise contracts. Their callback replacements mark the generator completed and return the original done-result shape: undefined for Snowplow initialization, false for Mux/tracking consent, and an empty mapped keyword string for Admantx. The shared Didomi setup function body covers functions 17047 and 34405 with one physical edit. The complete initializer is retained, including Airship and Didomi setup.

The original six-control transformer passed 63 non-empty control subsets and six negative checks. The current seven-group candidate passes **127 non-empty subsets**, with equal direct, forward and reverse composition, idempotence and **ten corruption/policy rejections**. Its compiled Kotlin output matches the actual all-controls APK asset byte-for-byte. These checks establish transformation and guard behavior, not app execution.

The current native verifier checks **516 original or retained method contracts**, including client authentication, Auth0, Didomi, Airship message/action dispatch and cleanup, plus functional manifest components and push/network permissions. The original passes no-control checks and rejects requested effects. Mutation checks reject a wrong Promise register, changed anonymous authentication and a disabled functional Remote Config default. A separate review authenticates 32 protected JS functions byte-for-byte and 24 independently saved native promotion/push/manual-access contracts. The historical release used 496 native contracts across 41 classes; its evidence remains recorded below.

## Follow-up build and validation

The targeted build still uses `python3 scripts/build_detijd.py` and only De Tijd/shared Kotlin sources. All seven individual selections, all controls together and the default six standard controls pass real Morphe Desktop FULL patching, expected applied-selection reports, signature verification and independent decoded-output checks. The current verifier checks **23 Hermes range/function contracts**, complete original reconstruction and the SHA-1 footer, **516 native contracts**, **504 navigation cases** and **16 Moments gate cases**. Three new portable navigation/Moments unit tests cover the semantic helpers. Function 17047 shares its body with 34405, so one physical edit covers both function identities.

The reviewed local MPP has SHA-256 `9b3fa5cc5297c728cd38c08811c5e5f3fc59885897062629f2a776613f3c8241`. Its temporary filename is `build/isolated-detijd/_patches/libs/patches-1.21.0-dev.1.mpp`; that project-version filename does **not** identify the published v1.21.0-dev.1 artifact. The published digest below remains unchanged. This follow-up awaits the next dev release.

| Reviewed follow-up output | APK SHA-256 | Hermes asset SHA-256 | Strict decoded instructions |
| --- | --- | --- | --- |
| Standard six; Mijn Tijd retained | `f85d921d5a163752d43e0cebbb3fd44281a745c6a8d8c6e92fdd06853eb37d77` | `a9461c66cc420976e219501ebbc94989b6fd5b31e76e426883c6cb88de394e6a` | 1,220,475 |
| All seven; expert Mijn Tijd hiding selected | `3c60e4ee90309f7aee89d9061c8e42799130b9074179200fef0763bf3b25f866` | `29d97fa7faec359160fb452131bae2336a614f4f9e88d25244f781a43ac3a3a2` | 1,220,476 |

Both emitted assets retain all 39,206 function headers, 38,817 non-empty functions and the original file length. Both are stored uncompressed and four-byte aligned. Their selected edits reconstruct the exact publisher bundle; the standard output leaves the complete bottom-tab renderer original. Compiled-metadata inspection independently confirms the expert control is off by default. Private evidence is retained under `apks/research/detijd-followup/verification-review.md`, `verification-emitted-artifacts.json` and `verification-guard.log`.

## Historical six-control build and validation

The original targeted local MPP containing only De Tijd and the shared guard, 11 class payloads plus Android DEX, built reproducibly with `python3 scripts/build_detijd.py`. Its payloads matched the tested isolated build. Output: `build/isolated-detijd/_patches/libs/patches-1.20.0-dev.4.mpp`. This was not a full repository build or a release artifact. The isolated task selected only De Tijd/shared Kotlin sources; it did not add a substitute Maps key or alter the full build's requirements.

The original `scripts/validate_targets.py` run passed the original input, each of the six individual selections with its dependencies, and all six together using real Morphe Desktop FULL patching. Each report recorded success with the expected applied selections; rebuilt APK signatures and independently decoded effects passed. That verifier checked 21 Hermes function contracts, reconstructed the complete original asset after reversing owned edits, and verified the SHA-1 footer. Its native helper checked 496 original/retained method contracts and functional manifest state. Thirty validator unit tests also passed, including De Tijd binary-asset routing and dependency checks.

The original six-control combined APK's Hermes asset was stored uncompressed at 9,112,324 bytes; SHA-256 was `143740b902c8c48a02f99ea91495bfa88c8b64db37d58e13300b2bceeadeca7f`. Selection JSON reports, signature logs and decoded-output verifier logs are retained under `build/validation/detijd/`. For that original candidate, all 58 app pages passed the template check using its compiled local metadata alongside existing release metadata. The strict bilingual site build and rendered-site check passed: 65 matched page pairs and 131 HTML files, with local links, anchors and language alternates verified. Generated release metadata remains untouched. These checks establish the tested behavior; they do not establish broad traffic silence. Published-asset verification is recorded separately below.

Historical signed six-control APK SHA-256: `24157968d05ba42c7cc749057755d72357d1e7edc510e94ae196a5991b0df366`. This exact file was installed on the dedicated emulator and launched successfully. Its 2,187 non-signature ZIP payloads match the earlier combined reading-test APK; the final installed file was pulled back and compared byte-for-byte with the delivered artifact.

[Research note](research/2026-10-30/detijd.md) · [Privacy effects](privacy/detijd/README.md) · [English guide](site/en/apps/detijd.md) · [Dutch guide](site/nl/apps/detijd.md).

## Published dev artifact

[v1.20.0-dev.5](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.5) was published after [Release 41040544140](https://github.com/johnneerdael/dutch-applications-patches/actions/runs/41040544140) succeeded. The downloaded MPP SHA-256 is `34cc33d327ee94fcd6e82bd6af270f5cf019d87ac2ffb7f440c39ec9ea9b8f44`, matching GitHub's asset digest. All ten De Tijd JVM class payloads match the locally tested bundle exactly; the Android DEX defines those ten classes. At that publication, metadata declared all six default-on controls for APKS 5.6.1 / 5060100 / minSdk 26, and the generated dev feed pointed to that asset. De Tijd remains a prerelease target; this documentation update does not promote its patch sources to main.

The downloaded release MPP was also applied to the original APKS with all six controls using Morphe Desktop FULL validation. Its report recorded success with no failed patches; APK signing verified, and independent re-decoding passed all 21 Hermes function contracts, complete original reconstruction, the footer and 496 native/functional contracts. This checks the published asset, not just the local build.

## Prerelease channel after stable v1.20.0

The channel was advanced to [v1.21.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.21.0-dev.1) after merging main's v1.20.0 history into dev. Morphe Manager compares both feeds when prereleases are enabled and selects the higher version, so v1.20.0-dev.5 was below the new stable v1.20.0. At publication, the new prerelease sorted above stable and included the complete dev catalogue: 126 controls for 29 apps, including De Tijd, Humo, HLN, Nieuwsblad, DS Nieuws and Videoland Android TV.

The downloaded `patches-1.21.0-dev.1.mpp` SHA-256 is `c0388025619e513e2587d787bd5bd083fe753a45a0f60912dcd7c372d6a849f4`, matching GitHub's digest. All 324 JVM classes, Android DEX, runtime extensions and native payloads match v1.20.0-dev.5 byte-for-byte. Every prior dev patch definition and app target is retained unchanged in published metadata. That historical documentation refresh did not change stable patch sources or metadata.

## Published follow-up

[v1.22.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.22.0-dev.1) contains all seven De Tijd controls: six standard controls enabled by default and Hide Mijn Tijd (expert) off by default. Its downloaded MPP SHA-256 is `79c7b32eb87ab597112e28b2caa5fc8764e25d7320aee661be8d39c034151406`, matching GitHub’s asset digest. All twelve De Tijd JVM classes match the tested candidate exactly, and all 314 other app/shared class payloads and non-De Tijd patch definitions are unchanged. The dev feed now sorts above stable v1.21.0.

## Stable approval

On 30 October 2026, the owner confirmed that De Tijd works correctly on the phone and explicitly approved release on main, requesting no further testing. Promote the exact De Tijd implementation from v1.22.0-dev.2: all seven controls, with the six standard controls enabled and Hide Mijn Tijd (expert) disabled by default. Mijn Tijd remains available with a free account; no paid subscription is required. De essentie displays the feed supplied by the normal API without an account or the marketing/“Ga verder” page. No additional local or device tests were performed after approval. Earlier validation and runtime evidence, and its limits for exhaustive traffic, push delivery, future feeds and other devices, remain unchanged.

Stable publication completed as [v1.22.0](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.22.0). The published MPP SHA-256 is `82508cabe708bebc6d4920237e9195f4e08dec3fde2d5a94cba3e4a01a4a121f`. Its twelve De Tijd class payloads match the owner-approved v1.22.0-dev.2 artifact exactly; published metadata confirms seven controls, six default-on and the Mijn Tijd expert option default-off. This is release identity verification, not additional app testing. The full dev catalogue was advanced to v1.23.0-dev.1 above the new stable line, retaining all 127 controls and app targets.
