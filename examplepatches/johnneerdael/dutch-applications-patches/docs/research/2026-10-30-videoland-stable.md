# Videoland Android TV stable acceptance

The user confirmed that the finished patches have been properly tested with both a Premium account and a free account, and authorized promotion to main as a stable release. This supplements the local technical and native runtime evidence; the account acceptance is user-reported.

## Released behavior

The stable selection has three independent controls enabled by default: Disable tracking, Hide ads and Hide unavailable content. The last control was default-off during validation and is enabled for normal stable/Simple-mode installs after acceptance. Disabling it retains the normal catalogue and subscription action descriptions while the other selected controls remain independent.

Free-account playback remains limited to content Videoland makes available to that account. Subscription-required cards and action buttons are omitted, programme information and usable episodes remain, and exhausted empty seasons disappear. A season with later usable pages continues loading. Login, parental, geographic, release-window and DRM checks remain genuine. Unknown availability remains visible and can still fail when playback is requested. No Premium entitlement or older paid-episode access is granted.

Premium content already available to the account remains visible and uses the native player. Paid ad-supported plans have not been separately identified or validated in this acceptance. Ads already embedded in a broadcast/stream and live playback without a suitable fallback remain outside confirmed removal. Android TV app 1.117.0/build1622 uses the complete original publisher APKS and requires API 24 or newer. The observed acceptance device is a 32-bit ARM Android 14 TV; other hardware is not separately proven by these results.

## Validation and provenance

The promoted production runtime is byte-identical to the accepted availability extension: SHA256 `6f551325387528b46858d7b39039409f2a09622c8f382d62c8272689e1961917`. It contains 9 owned classes and 40 helper methods, with no compile-only stubs, trace helper or research routing patch. The original APKS SHA256 is `f3ceb9e7a87552d51f37e1bfe2b5c8d7d21e337e8e7564835a4891b92732bbdb`; publisher base SHA256 is `86b891e101c30b2c5588ff1e285d37a68e574a9e005f574844fc1b4df3760298`.

Native availability tests cover 92 assertions, including empty-page loading, cancellation/errors, raw keys, copied models, subscription button omission, recycled view reset, empty-season removal and nested parent count/offset restoration. Ad/tracking ART fixtures separately cover 27 actual-app cases. Independent verification preserves 140,770 original method graphs and original class/field declarations except the selected exact changes, with manifest and owned-helper checks. JVM tests enforce publisher input/native ABI and stable discovery/defaults; the full Python regression suite and documentation/release integration checks supplement them.

Observed free-account examples include Bureau Groningen retaining episode 3 and programme information after locked episode 1/2 cards are filtered, and Echte Gooische Moeders retaining two season 6 episodes followed directly by Trailers while empty seasons 1–5 headings disappear. These are test snapshots, not promises about future availability windows.

Research-only subscription target routing remains in diagnostic fixtures and is absent from the stable patch catalogue. Its older-episode investigation did not establish extra free-account playback access. No changes from unrelated development work are part of this promotion. Version selection, catalogue/README generation, signing and publication remain owned by the existing main release workflow.
