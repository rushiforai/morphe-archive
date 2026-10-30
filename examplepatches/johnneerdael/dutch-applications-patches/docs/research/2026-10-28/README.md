# Dutch app ad, tracking and paywall research — 2026-10-28

Active scope: the nine unpatched inputs below. Flitsmeister is excluded at the user’s explicit request. FD and De Telegraaf remain outside this round.

Input location: /Volumes/EXT-SSD1/phone-apks. Private working evidence: /Volumes/MorpheResearch/research-2026-10-28 (SSD-backed APFS sparsebundle). Proprietary source, raw responses and keys remain outside Git.

This is a research round. SDK presence, verified application wiring and runtime behavior are separate evidence levels. Reports must mark seen/inferred/unknown, classify video advertising, preserve functional transport/auth/payment/push contracts, and assess body delivery before claiming a client paywall can be removed.

| Input | Package | Version/code | Min SDK | DEX | Platform hint | Status/report |
|---|---|---|---:|---:|---|---|
| dumpert-original.apks | nl.dumpert | 5.8.0 / 22001778 | 32 | 8 | Android native/SDK layers | [Static report complete](dumpert.md) |
| 9292-original.apks | nl.negentwee | 2.48.1 / 32189 | 32 | 4 | Android native/SDK layers | [Static report complete](9292.md) |
| rtl-nieuws-original.apks | nl.rtl.rtlnieuws | 12.7.1 / 1558 | 32 | 5 | Android native/SDK layers | [Static report complete](rtl-nieuws.md) |
| nos-teletekst-original.apks | com.eoffice.android | 2.8.10 / 62 | 23 | 3 | Android native/SDK layers | [Static report complete](nos-teletekst.md) |
| tvgids.nl-original.apk | nl.tvgids | 7.0.16 / 106691 | 26 | 2 | Flutter | [Static report complete](tvgids-nl.md) |
| omroep-brabant-original.apks | nl.omroepbrabant.android | 11.1.0 / 7331764 | 32 | 2 | Android native/SDK layers | [Static report complete](omroep-brabant.md) |
| parool-original.apks | be.persgroep.android.news.mobilepa | 7.53.1 / 23136515 | 32 | 8 | Android native/SDK layers | [Static report complete](parool.md) |
| marktplaats-original.apks | nl.marktplaats.android | 16.17.0 / 633462 | 32 | 5 | Android native/SDK layers | [Static report](marktplaats.md); [dev implementation](../../marktplaats-audit.md) |
| voetbal-international-original.apks | nl.vi | 5.13.52 / 910 | 32 | 11 | Android native/SDK layers | [Static report complete](voetbal-international.md) |

## Evidence requirements

- Artifact identity, all splits/DEX/native/asset coverage and genuine publisher signers, excluding source stamps.
- Application-owned ad callers and branch/callback contracts for banners, native/feed ads, interstitial/app-open/rewarded formats, and video IMA/VAST/VMAP/SSAI paths where present.
- Optional analytics/identifiers/crash/performance/attribution and consent re-enablement, including auto-init components and WebView/remote-script surfaces.
- Collector/content/auth/config/push/payment/consent-ack host roles; mixed transports remain explicitly classified.
- Applicable paywall/entitlement and body/media delivery boundaries, preserving real billing/session outcomes.
- Narrow candidate patch anchors, re-signing/startup risks, meaningful regressions and remaining runtime/server unknowns.

All nine inspected-build reports are written and reviewed at the stated static/anonymous-response evidence level. No application patch, build, signing, installation or device validation was performed in this round. Runtime behavior, re-signing, remote scripts/media and server enforcement remain explicitly bounded in each report.

## Candidate assessment

All nine have concrete ad or tracking targets. This establishes research suitability; it does not establish that every candidate can already be shipped or that every paid resource is available.

| App | Supported research direction | Material limit before release |
|---|---|---|
| **Parool — first priority** | High reuse of approved Trouw/Volkskrant boundaries; display/video ads, tracking and already-delivered article bodies. | Additional audio telemetry, game IMA, identifier header, BrandMetrics and monitoring routes need coverage; phone acceptance is outstanding. |
| Dumpert | Display/feed advertising, regular-player and Shorts video ads, analytics/IDs. | Remote embeds, actual VAST/stitched media and all callback/lifecycle paths need runtime capture. |
| RTL Nieuws | Display/native/video advertising and multiple app/player trackers. | Several independent ad and telemetry systems; premium-body delivery is unproven. |
| Omroep Brabant | Pinch display, Outbrain/StartApp, regular and vertical video ads, audience tracking. | Separate consent/player paths and remote creative behavior; no paywall established. |
| Voetbal International | Display/interstitial and both video-ad flows; app and player analytics. | Public route supplied teaser/paywall; the shipped app-header route subsequently delivered substantial Pro content for two samples. Implementation and media playback acceptance remain open. |
| 9292 | Display/station/post-purchase advertising, telemetry and ad-location side effect. | Establish re-signed startup baseline with Pairip licensing; preserve tickets/rentals and functional journey data. |
| Marktplaats | Third-party display/native/sponsored advertising, analytics and survey collection. | Distinguish advertising from actual seller listings; retain security, account, payments and messaging contracts. |
| NOS Teletekst | Audience tracking and optional in-house NOS-app promotion. | No commercial display/video-ad or paywall path established in this build. |
| TVgids.nl | Native advertising bridge, Dart ad layout/fallbacks, branded/affiliate promotions, OSB/Comscore/Sentry and background-push telemetry. | Extra Flutter/native integration effort; other-ABI parity, privacy-channel contracts and embedded YouTube behavior remain unverified. |

## Parool implementation handoff

The user prefers Parool as the starting point. Independent originals match **77 current candidate instruction bodies** and **19 retained-method hashes** against Trouw. Two ordinary anonymous Parool premium responses supplied substantial editorial bodies. The report records article IDs, late-paragraph hashes and response hashes without credentials or article text.

Start with separately reviewable ad and tracking controls, then the existing successful empty-marketing-template contract for received editorial bodies. Match the actual Parool artifact/package/version/resources. Preserve account/purchase/newspaper entitlements, real consent acknowledgments, callback/Job/Result completion and functional audio state coordination. The exact marketing-result boolean is `hasReducedContent`; the success-with-empty-templates mapping is the relevant contract. Additional discovered paths may also warrant future audits of the existing cohort, but this round did not modify it.

## Review and verification

- Verified all nine relocated originals against pinned working inputs during the SSD move; full decode is ready for every DEX.
- Confirmed report artifact identities, versions, input hashes, storage references and sanitized output; public inventory parses and scope excludes Flitsmeister.
- Independently checked representative source contracts for Dumpert, 9292 and Marktplaats (12 checks plus three base hashes), the RTL ad-profile branches, VI policy/dismissal, and NOS empty-tracker behavior.
- Re-read nine NOS and 36 Omroep exact method blocks. Parool comparison covers all 77 candidate/19 retained methods. TVgids has twelve actual ELF code-range hashes and six native-bridge method hashes, with a separate focused review of callback/IMA/OSB conclusions.
- Reports distinguish startup/queued collection, consent re-enablement, functional security/payment/push transports, ad creative video versus editorial media, and supplied content versus server withholding. These checks do not constitute app runtime tests.

Private audit and reproduction records remain on the SSD. Source code, raw captures, object pools, account data and shipped credentials are excluded from Git.
