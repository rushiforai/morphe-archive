# AD 9.22.0 patch audit

Scope is the original `be.persgroep.android.news.mobilead` 9.22.0 / 9220000 APKS, minimum API32. Publisher signer lineage: `80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92` and `34a28a4862a6204d7c70ebacc7105fae14ac880486c5d2d56a2b9c17907b27c4`. Input archive SHA256: `beb00038585fe8777c41b029a6f4ef1caa22b081ac0d990cf273360448f677b7`. Source-stamp certificates are excluded from publisher identity. This is the Kubus/Popular native application; released Trouw/Volkskrant implementation signatures are not reused.

## Controls and guards

Every named patch and anonymous mutating dependency directly depends on the shared original-input preflight. Exact class/method descriptors resolve through singleton cardinality; inventoried multi-write and optional-component sites have explicit counts. Shared validation owns real SDK compatibility and original/wrong-target rejection tests.

| Named control | Named dependency | Concrete behavior |
| --- | --- | --- |
| Hide ads | none | Ordered concrete commercial DTO filtering; four banner technology flags disabled; video advertising false; game preroll flags false and midroll request replaced by the original error-state continuation. |
| Disable tracking | Hide ads | Audited native collector, pending-upload and re-enable controls; optional FIAM graph removal with all app consumers guarded; limited advertising identifiers. |
| Skip consent screens | Disable tracking, Hide ads | Complete automatic collectConsent with the real `Lnbi.a` Unit value; skip startup login and topic notifications, retain city selection with manual notification opt-in. |
| Hide Premium banner | none | Empty both automatic marketing resolver families, filter their empty placeholders and native Premium markers, retain LIVE and editorial promotions. |
| Read full articles | none | Force only the actual article repository's reduced parameter false, and complete both marketing resolvers with supported empty values. |

`contentFilters`, `emptyMarketingTemplates` and `trackingResources` are anonymous guarded dependencies. Original SDK objects, genuine account state, billing, purchases, consent providers and functional traffic are retained.

## Guest startup and notification choices

The first-run extension uses the original onboarding transitions and keeps the saved account, manual login, privacy controls, city selection and completion/deep-link handling. Only the router's two automatic login calls and one login-promotion route are redirected. The topic activity completes after its original super/Hilt initialization and before creating its fragment: that fragment otherwise saves preselected topics when it exits.

During the skipped topic transition, missing `USER_CHANNELS` are initialized to an empty set through the shipped encrypted preferences factory and editor. Existing empty or populated choices are retained; initialization does not invoke a subscription service. Restored city/follow-up stages keep absent preferences absent: automatic token replay and MainActivity skip missing choices, so these stages cannot subscribe to default topics. Explicitly opened topic settings retain their original behavior. The chosen-city follow-up starts with notification and newsletter toggles off, including when Android already grants notification permission. Resume preserves a manual notification choice while updating the permission explanation. Original Continue, permission-result, subscription and manual settings flows remain available.

The independent onboarding verifier executes actual emitted router/helper/activity instructions, parses packed/sparse switch payloads, and pins the original region, account and permission paths outside the exact edits. Phone screenshots establish the earlier unwanted prompts. After testing v1.6.0-dev.3, the user reported AD works and approved stable publication on 2026-10-28.

## Article delivery evidence

**Seen:** `Lht0.a(String,ZZ,Lzs3)Object` passes p2 to `cacCompatible` and p3 to the Retrofit `v6/article/{articleId}` reduced query. The patch forces p3 false and retains the complete original suspend/resume, error and DTO mapping body. `Ljla.a` returns the same actual `ResolveResponse(false,emptyList)` type as its existing fallback. All four app-owned consumers have supported no-template paths. `Ljq8.k` returns an actual empty ArrayList, retaining both resolver objects and SDK initialization.

**Seen, anonymous network evidence saved privately:** two articles marked premium in both full and reduced responses. No login, Authorization, subscription or purchase claim was used. The paired reduced responses have no top-level PARAGRAPH components. Ordinary native loads use `ArticleDetailNativeFragment.G(Bundle) -> vz0.x -> g0 -> rt0 -> j4m.h/j/k -> ht0.a`; the repository has only API/mapper fields and no observed article-store early return on these paths. A retained ViewModel may display its earlier state while loading. The patch does not invalidate offline/HTTP caches or synthesize text unavailable in an offline or truncated response. Full responses contain:

| Sanitized sample | Top-level components | Top-level paragraphs | Additional nested paragraphs | Substantive ending |
| --- | ---: | ---: | ---: | --- |
| ca43152 | 48 | 20 | 4 in GROUP, thus 24 recursively | Final top-level paragraph 28 words; stripped-content SHA256 `a27710a8aa4bf88bda5d212f87034986d0b13af56017b1b340c7cd11a846609a`. |
| d8d624f | 33 | 9 | 0 | Paragraph index 5 is 79 words, SHA256 `fe454eeb64ff21eb1e7f2f5993acdac3da1c52e0734ceb3d06d7cc4483b5eeca`; all three later short editorial/link paragraphs remain. |

`tests/ad_premium_evidence.py` tracks only component counts/order hashes, complete-payload hashes and ending hashes. It verifies the genuine private fixture pairs, premium metadata, every received paragraph, nested GROUP/video-news children, editorial media/links, input immutability and object identity/order through the actual emitted helper instructions. No raw article text or payload is in Git. Required local mode uses `AD_REQUIRE_PREMIUM_FIXTURES=1` and `AD_PREMIUM_FIXTURES=<private fixture directory>` (or verifier CLI equivalents). This evidence establishes availability for these received premium bodies, not an entitlement or guarantee for text the server never supplies.

## Ads and editorial preservation

**Seen:** the four `Lf96` technology flags feed the existing disabled-banner branch, which emits its native failure and resumes the original waiter. No merged SDK coroutine is stubbed. The DTO filters run before raw/cached constructor assignments; they copy input lists and keep surviving object identity/order. Explicit `ADVERTORIAL` markers and concrete Advertisement/CrossPromotionAdvertisement types are filtered. Article metadata marked ADVERTORIAL yields an empty whole body, so its commercial body is not retained after removing a disclosure. Premium/paidContent alone never makes an article commercial.

Mixed primary/list feed rows promote one surviving editorial secondary and remove it from its old secondary position to avoid duplication. Pure commercial rows and empty content-only groups disappear. Editorial Geldzaken PromoBanner, region controls, LIVE markers, syndicated articles, free HTML and unknown component types remain. InlineArticle containers remain even with default/null/empty body because original author/date and read-more navigation are independent of body contents. Originally empty MediaOverlay preserves identity; only actual nested child removal can produce a rebuilt or removed overlay. Mixed overlays retain their id and all editorial child objects.

VideoProduction has exactly 2 advertising-field writes and 3 CIM-field writes across ordinary and serialization constructors. The patch anchors each disabled value at the original write's branch target and retains live state, stream resources and metadata. Original video intent/media construction uses the nullable no-ad VAST path and still constructs playable editorial content. Amalia's shipped stream builder passes a null ad configuration; its premium/live flags and car plugin are retained.

The game `Ll37` constructor retains initialization/listeners but replaces its one requestAds with its existing error-state transition. Original StateFlow consumers map that state to the actual Generic error, then RewardRejected, AdBreakEnded and the existing playing state. No reward or paid state is fabricated. Original callback/state consumers are independently pinned.

## Native tracking and asynchronous contracts

**Seen:** concrete controls cover DPG Snowplow feature configuration/event delivery, Comscore start/events, Firebase analytics permanent deactivation, Crashlytics collection guard, Firebase Performance enqueue/transport, Piano pageview/pending sender/scheduler, Facebook event collection/pending flush, PIP telemetry, privacy error metrics, Usabilla automatic events/custom variables, native/JavaScript tracking bridges and video analytics POST `/api/v1/events/video.analytics.v1`. Dedicated completed suspend collectors return the actual obfuscated Kotlin Unit. PIP config/auth and manual Usabilla initialize/readiness/form callbacks remain original.

Firebase messaging telemetry uses exact methods on the R8-merged `Ldi5` class: M(Intent)/N(String,Bundle) are event sinks; W(Intent)/x() are collection predicates. Genuine notification service delivery is retained. Manifest deactivation prevents normal runtime setters from re-enabling analytics.

FIAM's four registrar metadata entries are removed; all three app-owned getter/dereference sites are nullable-guarded while surrounding application/activity/worker state stays intact. Messaging, Installations and RemoteConfig registration remain. AppSet/Piano identifier provider objects and required fields remain initialized, with acquisition disabled and nullable consumers preserved. Google acquisition returns actual nonnull `Info("",true)` from both boundaries. Advertising-profile ID getters return actual empty maps and inline Result<String> returns the actual empty String; account identifiers are not changed.

**Retained deliberately:** Catsure heartbeat/queue synchronization carries real active-client/player state, and its server role has not been established as optional analytics. It is not blocked merely because one response is ignored. Native WebView navigation/loading/height callbacks, PIP login bridges and editorial embeds remain. Gemius/Viafoura bundled types without reachable app integration are not blanket-stubbed.

## Verification and limits

All five original-artifact selected checks were observed RED before implementation. The generated-instruction semantic tests cover independent selection flags, input immutability, mixed rows, commercial-only wrappers, editorial inline defaults/read-more and overlay provenance. The emitted verifier separately pins original functional methods/remainders, SDK class/interface/static invocation contracts against actual API31 android.jar (below AD's API32 minimum), exact constructor counts and branch destinations, optional-component consumers and genuine private premium fixtures.

The corrected-source original baseline, all five individual selections and all controls combined passed Desktop FULL validation, patch-report checks, signing and independent decoded-output checks on 2026-10-28. Required private premium-fixture checks were enabled. The original article/collector implementation passed 33 Python tests and 350 actual-SDK input-guard assertions. The independent review's editorial-wrapper finding was fixed with failing-then-passing regressions, including checks on the emitted helper instructions. Logs remain in ignored `build/ad-matrix.log` and `build/validation/ad/`. Device/emulator changes were not made.

The onboarding extension passed the original baseline and all six selected-output checks (all five individual controls and their combination), FULL validation, signing and redecode (`build/ad-onboarding-matrix.log`). The final emitted verifier additionally passed the initial city, resume, manual Continue and both permission-result scenarios for both OS permission states, 106 unchanged onboarding method digests, four restored original instruction graphs and helper SDK/access checks (`build/ad-onboarding-semantic-final.log`). All 38 Python tests passed, and independent review found no remaining critical/important AD findings. The user subsequently reported AD works and approved stable publication on 2026-10-28 after testing v1.6.0-dev.3. This records user acceptance, without claiming an exhaustive device/network trace.

**Remaining evidence limits:** user-reported phone acceptance does not establish every asynchronous callback, media path, server variation, remote editorial-widget instrumentation or complete on-device network traffic. Private received FREE_HTML references `valley.ad.nl` publisher widgets/iframe resizing, `valley.gelderlander.nl` editorial embed/dossier utilities and `ad.nl` byline style/email/image assets. Here AD identifies the publisher domain, not a positively identified advertising collector. Instrumentation inside those remote documents remains unclassified; disabling JavaScript or stripping the documents would break the observed editorial embeds. Native collector coverage and preserved state contracts are static prerelease evidence, not a claim every possible request is eliminated. User acceptance is recorded above; exhaustive device/network coverage remains outside this evidence.
