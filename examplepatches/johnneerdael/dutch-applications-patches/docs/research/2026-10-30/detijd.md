# De Tijd: Hermes and anonymous article delivery

Research date: 30 October 2026. Target: `mobi.inthepocket.mediafin.detijd` **5.6.1 / 5060100**, minSdk26, original arm64 Play APKS. This note distinguishes **Seen** artifact/runtime observations, **Inferred** behavior and **Unknown** coverage. The [technical audit](../../detijd-audit.md) records hashes, controls and validation status.

## What changed the initial assessment

The initial static report observed `hasAccess:false`/HTTP 403 from the paywall path and client-side paragraph truncation. It left anonymous body availability unknown. The existing VI investigation demonstrated that a failed ordinary content route or a paywall decision does not exhaust an app's content-fetch mechanisms. VI's shipped premium-scope/article-header route was inspected before reviewing De Tijd's article, article-block, summary, translation and feed entry points. Runtime testing established usable bodies through the normal article path; the alternative routes were not runtime-tested.

**Seen:** De Tijd already obtains an anonymous client token through native Remote Config. Its normal article fetch is separate from its paywall decision. The actual anonymous session delivered multi-paragraph article bodies without an alternate header, scope or account-state patch.

## Bounded runtime observations

Testing used a fresh Android 14/API 34 arm64 emulator. The four original splits were used with only onboarding selector function 16251 replaced by a false return and the Hermes SHA-1 footer recomputed. This onboarding-only probe is distinct from the complete six-control candidate. No user account was signed in, and no installed USB-phone app was replaced, cleared or read.

| Natural article click | Normal article response | Normal paywall response |
| --- | --- | --- |
| `urn:article:10697906` | HTTP 200, 21 paragraphs | HTTP 403, `hasAccess:false` |
| `urn:article:10696933` | HTTP 200, 27 paragraphs | HTTP 403, `hasAccess:false` |

**Seen:** bodies contained multiple text paragraphs, headings, citations, editorial/embed types and `advertisement` paragraphs. The unmodified presentation path still showed the subscriber wall and truncation. Research retained statuses, field names, paragraph types and text lengths, excluding response text and header values. Private sanitized evidence: `apks/research/detijd-runtime/anonymous-article-shapes.json`.

**Seen after candidate installation:** the complete candidate opened the homepage without automatic consent/onboarding/service-banner UI. Reopening `urn:article:10697906` retained the HTTP 200/21-paragraph response and HTTP 403/`hasAccess:false` result. Seven scrolled layouts showed 11 unique long text views totalling 3,341 visible characters, with no subscriber wall and no AndroidRuntime or ReactNativeJS error observed through the test. The private sanitized summary is `apks/research/detijd-runtime/all-runtime-reading.json`.

**Inferred:** changing `shouldShowPaywall` function 25249 lets the article screen use the paragraphs already provided. This also reaches the original ad-insertion branch, requiring Hide ads as a dependency. **Unknown:** all article categories, publisher changes and any media or edition access. A denied paywall response neither proves a withheld article body nor grants unrelated server benefits.

## Follow-up: anonymous De essentie delivery

**Seen:** `MomentsFeedScreen` function 23982 calls `useMomentsFeed` 23637 unconditionally. Query callback 37266 uses the original Axios authentication and `GET content/feed/timeboxed/urn:agencygroup:tijd/MOMENTS`. A normal anonymous response returned HTTP 200 with three feed articles, each containing six paragraphs: three headings and three substantial text paragraphs. Private sanitized evidence: `apks/research/detijd-followup/moments-fresh-interactive.log`, request 6.

The feed mapper 23640 maps `settings` and `feed`; `MomentsArticle` 23988 renders the mapped paragraphs. Separately, screen 23982 sent anonymous users or users with a generic YBot offer object to `MomentsPaywall`. Its “Ga verder” callback 33367 only opens the offer's `ctaLink` in a WebView. It does not fetch or unlock the already-delivered feed.

The follow-up extends Read full articles with a presentation-only jump in function 23982: relative bytes 740–752 become `JmpLong +12`, continuing at the original empty/data branch 752. The genuine logged-in value, subscription/account fields, token, query, YBot data and hooks remain unchanged. The original weekend branch at 734 and empty state remain. This displays supplied data without making the app claim a login or subscription.

**Seen on the standard-six candidate:** the anonymous API 34 arm64 emulator opened De essentie directly, with no “Ga verder” or subscriber wall in the tested view. Its `7u`, `12u` and `17u` sections exposed three long text views of 169, 325 and 268 characters. Retained evidence: `apks/research/detijd-followup/anonymous-moments-repaired.png`, `standard-moments-layout.json` and `anonymous-moments-ui-summary.json`. The five normal bottom-bar buttons, including Mijn Tijd, remained present. Empty/weekend decisions are additionally covered by the emitted-bytecode model; live acceptance does not establish every future feed state.

## Follow-up: automatic in-app messages

**Seen:** Airship's public pause value reaches the automation engine at startup, but its paused path waits rather than completing a message. The selected message-only readiness boundary is `Lsu/n;->k(Lsu/x;Lau/b3;)Lau/i3;`, returning the real SDK enum `SKIP`. Original `au.t1` dispatch keeps action schedules separate. The unchanged `k0` engine consumes `SKIP` through schedule disposition and preparer/asset cleanup, avoiding the display executor and a `NOT_READY` wait.

The adapter factory covers fullscreen, HTML, modal, banner, layout and custom content. Legacy push in-app messages are converted into the same schedule/message path. The patch preserves notification delivery, SDK initialization, independent action schedules, screen-name handling and manual message-center/preferences/content paths. It suppresses messages through this executor regardless of campaign content; it does not establish complete Airship traffic silence or suppression of unrelated dialogs.

**Seen in the local emulator fixture:** the original SDK returned `READY` and a text-only `ScheduleAction` fixture opened its actual fullscreen activity (`popup-baseline.png`). The patched typed fixture returned `SKIP` through direct, dispatcher and engine readiness; its real `k0` consumer completed with `true` and zero adapter displays. A separate real persisted schedule moved from prepared to idle, ran schedule and asset cleanup and never entered the display executor. The retained console proof is `apks/research/detijd-followup/popup-patched-console.log`, summarized in `popup-runtime-summary.json`. The in-memory and persisted results are distinct checks; neither requires a remote campaign or account credential.

## Follow-up: Mijn Tijd remains a free-account feature

The user confirmed that Mijn Tijd works with a free De Tijd account; **no paid membership is required**. Keep its button visible by default. The separate **Hide Mijn Tijd (expert)** option is default-off and is recommended only when the user does not intend to use an account.

The optional edit changes the first 86 bytes of bottom-bar renderer function 33218, retaining the first 74. It returns the existing null result only for `profile`. It preserves De essentie, registered routes, original map/navigation indices, deep links and Moments/weekend labels. Compiled-metadata inspection confirms the false default; 504 emitted-prefix cases verify route/index/label/weekend/descriptor behavior.

**Seen on the expert-enabled candidate:** the emulator showed exactly four bottom buttons—Nieuws, Recent, De essentie and Meer—with no Mijn Tijd button. All four retained routes were visited successfully. Private layout evidence is saved as `apks/research/detijd-followup/expert-bottom-buttons.json` and four `expert-nav-*` captures. The default-six output retained all five normal buttons.

The real free-account session on the USB phone was preserved: no reinstall, data wipe or logout. Its existing installation signing certificate differs from the desktop-signed candidate, preventing an in-place update. Free-account Mijn Tijd functionality is supported by user confirmation and inspected source; the emulator acceptance remains anonymous and does not claim a logged-in or paid state.

## Hermes feasibility

**Seen:** the v98 asset has 39,206 functions, 38,817 non-empty; all decode strictly. The handover's function offsets, sizes and original entry bytes were reproduced. The last 20 bytes match SHA-1 of the preceding asset. Entry edits are padded only to the next original instruction boundary, preserving the remaining instruction stream and metadata.

The original six-control Kotlin transformer passed 63 non-empty subsets and six rejection checks. The follow-up's actual compiled transformer passes **127 non-empty subsets** under direct, forward/reverse and repeated composition, plus **ten corruption/policy rejection checks**. Its all-controls output matches the actual emitted APK asset exactly. Async callback replacements retain wrapper and done-result shapes rather than returning a raw value from a generator wrapper. The current native verifier pins **516 methods**, exception tables and payloads, with preservation checks for anonymous auth, Auth0, Didomi, Airship message/action dispatch and cleanup, push and manual access. Independent review also preserves 32 protected JS functions and 24 separately saved native contracts.

## Development release and remaining limits

The original six controls—Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens and Skip onboarding—are published in dev prerelease [v1.21.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.21.0-dev.1). The follow-up is published in [v1.22.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.22.0-dev.1). Its six standard controls remain default-on; Hide Mijn Tijd (expert) is the seventh control and defaults off. `python3 scripts/build_detijd.py` builds the tested De Tijd/shared MPP without unrelated app sources; the full repository/release build is separate. Historical published hashes remain unchanged in the technical audit.

All seven individual selections, all seven together and the standard-six selection pass real Morphe FULL patching, expected applied-selection reports, signature checks and independent decoded-output verification. The current verifier checks **23 Hermes contracts**, complete original reconstruction and the footer, **516 native contracts**, **504 navigation cases** and **16 Moments gate cases**. Three new portable navigation/Moments unit tests cover the semantic helpers. The earlier six-control validation used 21 Hermes and 496 native contracts, with 30 validator unit tests; that historical evidence is retained rather than relabeled as the follow-up.

Both current emitted assets remain uncompressed and four-byte aligned; all 39,206 headers and 38,817 non-empty functions strictly decode. The standard-six output decodes to 1,220,475 instructions; the expert-enabled output to 1,220,476. Exact APK/MPP/source hashes and guard results are recorded in the audit and private `verification-emitted-artifacts.json`.

Anonymous article reading, direct De essentie display, the local popup fixture and the expert/default navigation differences are accepted only for the tested emulator setup. The updated candidate on the USB phone, live push delivery, the exact original remote campaign, live tracking suppression, media playback, offline reading, all remote advertisements and other devices remain unverified. The server advertisement renderer is unresolved, sponsored-content labels remain, and no total traffic-silence claim is made.

## Stable approval

On 30 October 2026, the owner confirmed that De Tijd works correctly on the phone and explicitly approved release on main, requesting no further testing. Promote the exact De Tijd implementation from v1.22.0-dev.2: all seven controls, with the six standard controls enabled and Hide Mijn Tijd (expert) disabled by default. Mijn Tijd remains available with a free account; no paid subscription is required. De essentie displays the feed supplied by the normal API without an account or the marketing/“Ga verder” page. No additional local or device tests were performed after approval. Earlier validation and runtime evidence, and its limits for exhaustive traffic, push delivery, future feeds and other devices, remain unchanged.
