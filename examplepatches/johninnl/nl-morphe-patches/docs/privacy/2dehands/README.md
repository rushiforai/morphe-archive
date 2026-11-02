# 2dehands privacy controls

Inspected original: `be.tweedehands.m` **16.19.0 / 633464**, minimum SDK **32**,
target SDK **37**. The supplied eight-member XAPK includes Notifications.
Publisher SHA-256: `7c2c46aca6a23f0523b69cac1a21f03078be6fd41b3811874c4be1344c23ba47`.
Stable publication uses the main release workflow. Signed-in account, incoming-push and checkout acceptance follows publication.

## Implemented policy

All four controls default on. Disable tracking includes Hide ads and Disable
ThreatMetrix; Skip consent screens includes all three. Belgian bindings are
independent of the Dutch publisher identity and R8 names. Shared Horizon
operations retain the Dutch defaults and have a rebuilt Marktplaats regression.

| Path | Control and evidence | Remaining boundary |
| --- | --- | --- |
| Google native/display, OpenWrap and Prebid | Advertising initialization, explicit slots, targeting, request admission and advertising metrics are stopped. Native no-content/error completion is retained. | Libraries remain packaged. Remote inventories can change. |
| ICAS, promoted/default Admarkt listings | Response filtering checks explicit item types, the native Admarkt source marker and paid ranking labels. Request capabilities omit identified advertising/promotional types. | Ordinary seller classifieds, pagination, metadata and legal notices remain. A listing title mentioning a brand is not itself treated as advertising. |
| Adjust/Criteo, Meta, Braze, Datadog, UserZoom and Firebase measurement | Audited entry, observer, lifecycle, re-enable and known persisted-upload controls are ported. | Braze marketing/push is disabled. Existing vendor history is not deleted. Functional authentication/FCM remain separate. |
| Gemius/CIM, `gabe.hit.gemius.pl` | Feature gate, initialization, identifier enablement, event admission and buffer flush are stopped. | No inference that a bundled endpoint received data outside the tested execution. |
| Sourcepoint, `cdn.privacy-mgmt.com` | Optional `pv-data` admission is stopped. Genuine rejection is requested after real configuration/messages are obtained, before any consent WebView is created. Manual editor closes. The app callback has defensive startup/manual/repeat/missing-library guards. | Configuration, reject-all and GDPR choice requests remain functional. Native consent-ready/error handling is preserved; UI closure is not treated as server acceptance. |
| Publisher view statistics and call tracking | Register-view admission returns the real not-registered outcome without scheduling HTTP work. The native non-tracked contact route is selected. | Listings/search/chat still send necessary request data to the marketplace. |
| ThreatMetrix, `faas.2dehands.be` | Initialization and profile/header waits are stopped; native empty-header behavior remains. | Protected account or payment operations can reject requests without profiling. |
| Firebase Installations / FCM | The original publisher fingerprint is used only in the FIS request header after re-signing. Optional client heartbeat resolution is skipped with tracking disabled. | Genuine registration/token/server outcomes remain; incoming notifications and account-linked push need separate acceptance. |
| Adyen | Existing optional event/timer/upload suppression is retained. | Initial functional SDK setup and genuine checkout-attempt exchange remain. No transaction has been performed. |

Five advertising/AdServices permissions are removed. Datadog/Adjust automatic
providers and both Adjust and legacy Google campaign receivers are disabled.
Functional permissions are not auto-granted.

## Verification

The verifier pins original metadata, manifest meaning, method graphs, translated
helpers, actual invoked-method/field ABI, the Notifications feature and all
fourteen native-library hashes. Edited methods are restored before comparison
with original hashes. Behavioral fixtures exercise emitted instructions for
ordinary/unknown/null/paid items, consent repeats and missing SDK, SDK admission,
publisher view admission and Firebase headers.

The full original + four individual selections + combined selection matrix has
passed; later changes must rerun affected profiles before delivery. Python tests
include genuine-original mutations, wrong metadata and complete split staging.
Release Gradle Android checks and extension tests have passed.

The optional SDK-wide hierarchy check reports **76 issues in the untouched
publisher original**, involving optional unavailable vendor libraries. Rebuilt
checks have the same normalized issue multiset, with no introduced issue.
This is a differential result, not a clean original SDK-wide verification.

Runtime evidence uses a task-owned read-only Android 16 ARM64 emulator and
observation hooks that preserve request and consent outcomes. Genuine reject-all
and GDPR choice requests returned HTTP 200 with **0 granted vendors out of 167**.
The revised path no longer emitted observed Sourcepoint page-view, index.html or
font requests. Anonymous home and search load real publisher data. An initially
empty home-feed response recovered through the native retry path.

Live testing also found that Admarkt inventory can arrive as DEFAULT_LISTING
without a paid label. The filter therefore uses `isAdmarktAd()`, not just the
label. Final runtime acceptance and artifact hashes are recorded at delivery;
account, incoming push and checkout success are not inferred from anonymous use.

## Evidence and limits

[Original comparison and approved port design](../../research/2dehands-16.19.0/README.md).
Local extraction, mutation reports, selection reports and runtime captures live
under `$TMPDIR/re/2dehands-16.19.0/`. No login credentials or transaction have
been used. No claim of anonymous protocol behavior, erased history or exhaustive
future remote-content coverage is made.
