# De Tijd

**Supported app:** 5.6.1 · **Build:** 5060100 · **Input:** APKS

`mobi.inthepocket.mediafin.detijd`

[Download the original APKS](https://buzzheavier.com/57j3z167r1n2){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

De Tijd includes advertising and measurements of reading, screens and player use. All seven controls are available in [stable v1.22.0](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.22.0) after owner approval on the phone. The six standard controls are enabled by default; Hide Mijn Tijd (expert) remains optional. Each control and the combined candidate pass local patching, signing and decoded-output checks. The combined candidate also passed a bounded anonymous reading test on an Android 14 arm64 emulator.

An account-free emulator session received 21 and 27 paragraphs for two articles while the app showed a subscriber wall. The article control displays paragraphs already returned by the publisher; it preserves the normal requests and genuine account state.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising | The app inserts feed/article ads and creates native, banner and outstream hosts and video-ad links. | Hide ads stops the inventoried insertion and host paths and completes native ad loading through its existing error path. |
| Audience and interaction measurement | Snowplow and Gemius have reading, screen, scroll, audio or player measurement paths in the shipped code. | Disable tracking stops the selected initialization and event paths while retaining their completion contracts. |
| Targeting and video quality | Admantx keyword lookup, Mux consent handling and Firebase analytics defaults are separate from content delivery. | The inspected optional callbacks complete without enabling collection; analytics defaults are disabled or denied. |
| Article display | Two anonymous article responses contained multiple paragraphs despite denied paywall responses. The UI then reduced what it displayed. | Read full articles removes that display restriction and opens the delivered De essentie feed directly, without changing requests or account state. |
| Consent, introduction and promotions | Automatic consent UI, the tracking explainer, onboarding and a service banner have separate presentation decisions. | The matching controls skip these automatic screens and in-app promotions without recording consent or account access. |

## What remains and what is still unknown

Login, anonymous client-token retrieval, push initialization, Airship screen handling and manual privacy preferences remain. Automatic Airship in-app campaigns are skipped, including any service notices delivered through that channel; push notifications and the manual message centre remain available. Text-to-speech, gifted access, editions and content withheld by the server retain their real access rules. Two successful body samples do not establish every article.

De essentie opens the feed without the marketing or “Ga verder” page when the API supplies items, including for anonymous users. The combined candidate opened directly into the homepage and displayed multiple delivered article paragraphs without a subscriber wall in seven scrolled layouts. The paywall response still denied access; account state was unchanged. Media, offline reading, live tracking suppression and other devices remain unverified. A separate renderer for server-supplied advertisement paragraphs is unresolved, and sponsored editorial labels remain. Use the original Android 8.0+ Play split set; the tested input contains arm64 libraries.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens, Skip onboarding, Hide Mijn Tijd (expert).

Mijn Tijd is accessible with a free De Tijd account; no paid subscription is required. If you do not intend to use an account, enable **Hide Mijn Tijd (expert)** to remove its bottom-bar button. This expert option is off by default.

Disable tracking includes Hide ads. Skip consent screens includes both. Read full articles also includes Hide ads because the original full-display path inserts advertisements. Skip onboarding and Hide Premium banner are independent presentation options. Hide Premium banner hides automatic in-app promotions and the whole service banner, including any service or error notice shown there.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 30 October 2026; the owner confirmed phone behavior and approved stable publication: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/3c8ad7fd2683fb4579bd609f5b80ee5754d816c1/docs/detijd-audit.md) and [research note](https://github.com/johnneerdael/dutch-applications-patches/blob/3c8ad7fd2683fb4579bd609f5b80ee5754d816c1/docs/research/2026-10-30/detijd.md). All seven individual selections, the six default controls and the combined candidate pass output checks covering 23 Hermes edit contracts, complete asset reconstruction and 516 native contracts. The expert option is verified off by default; its enabled state preserves the other four bottom buttons. The anonymous De essentie feed and in-app campaign cleanup were tested on an emulator. An account-free emulator session established delivery for two articles; the combined candidate displayed multiple paragraphs for one without an observed app error. This is not exhaustive article or traffic coverage. [How to read the evidence](../reference/methodology.md).
