# Omroep Brabant development increment

Continue the approved sequential rollout after verified RTL v1.10.0-dev.1.
The user delegated routine implementation choices and development publication.
This version-specific supplement records the implementer's choices; phone
acceptance and stable promotion remain separate.

Target `nl.omroepbrabant.android`, **11.1.0 / 7331764**, minSdk32, Play APKS.
Publisher signer SHA256
`5b364bd01320e86c272a126b37b62be15753363565d930706c721d4909416a03`.
Original APKS SHA256
`cf2dbf5a442f26005238cb5dd60727931e4c3f72f4a7e904ce19919eab12b1a0`;
base SHA256 `c0229a1054b91109eda4fb386ecce2eb8a4c5dc2436c843f3b1cd20f67f9a860`.

Three controls: Hide ads; Disable tracking includes ads; Skip consent screens
includes both. Use `patches.brabant`, the original-input guard and an independent
`brabant` decoded/APK-bound verification route. Keep all existing 67 catalog
entries and approved code payloads intact.

Use narrowly scoped native model/player/sender boundaries and actual supported
empty/failure/readiness states. Reusing the framework is appropriate; reusing
DPG/RTL SDK descriptors is not. A global ad-host/WebView block would also remove
content and the first-party article-read collector shares its host with news.
Hiding loaded views alone would retain requests and placeholder/pager items.

Pinch XML/Compose placements require actual failure/terminal and zero-space
handling. Suppress Outbrain before widget/Start.io MREC and remote bridge work.
Vertical VideoAd insertion must be removed before pager indices are computed.
Blue Billywig requires separate regular scheduling, ad-services/renderer and
late-data coverage; preserve content clip/playlist and ready/error/lifecycle
coordination rather than fabricate completed ads. Do not claim SSAI removal.

Tracking includes app and direct push analytics, Piano/ContentInsights/NMO,
optional IDs, Blue Billywig statistics including TCF re-enable, SDK collectors
and restored measurement queues. Preserve nonnull singleton initialization,
local article history and cleanup, coroutine/Task/Flow/callback completion,
actual push/token/deep links, radio/background/Auto/cast, weather/configuration,
manual feedback/privacy and external content. Unknown/mixed SDK traffic must
be disclosed rather than silently classified as suppressed.

Skip only automatic custom/UMP advertising-choice presentation once its
collection dependencies are stopped. Preserve real stored consent, manual
preferences and readiness. Do not return false globally from the generic
vendor gate: it controls useful embeds and puzzles. Do not fabricate consent,
UUIDs, tokens, accounts, subscriptions, receipts or delivered telemetry success.
No native paywall/entitlement was established, so no unlock control is proposed.

Acceptance: original-negative effects, independently pinned original/retained
methods and merged switch/error routing, actual emitted callback/player/list/
typed-result/queue/consent behavior, four signed Desktop FULL selections and
retained catalog/code proof. Promote the existing README tracking table with
domain, purpose, fields, effect and source-versus-capture provenance. One fresh
whole-increment review precedes verified dev workflow/attestation/downloaded
asset delivery. New output/caches/decodes stay on SSD; owned JVM jobs serialize
at1GiB. No phone installation/reset or stable merge is part of this increment.
