# NOS Teletekst 2.8.10 implementation audit

Package `com.eoffice.android`, build 62, minSdk 23, original Play APKS.
Original base SHA-256:
`767b8abf5e85a6a55c5712dd66c73200ab0c3613f63a8ba2302afaf007cb5c2d`.
Publisher signer SHA-256:
`09c20f5d028a5065fbeb4a94ea4d4ba4a8fd2fa5c2dff161e32456608989ee14`.

Two independent default-on controls cover the established tracking and house
promotion paths. No application-wired commercial advertising loader or premium
gate was established. [Original research](research/2026-10-28/nos-teletekst.md)
and [tracking destinations and data](privacy/nos-teletekst/README.md) describe
the evidence and its limits. The user’s phone-test approval is recorded below.

## Tracking initialization

`AnalyticsModule.provideTracker(Context)` is the sole app-owned SdkTracker
construction site. Disable tracking preserves its native context null check,
then returns the shipped `MultiTracker` with a non-null empty `Tracker[]`.
The native aggregator accepts events and completes its ordinary zero-iteration
loop. It does not construct SdkTracker or the NOS/NPO analytics dependency tree.

This prevents Govolte's persistent queue, visibility heartbeats and independent
NMO DAM service from starting. Blocking a later logger alone would leave queued
uploads reachable. No separate NOS/NPO measurement provider or analytics
WorkManager subclass was established. Generic AndroidX/Hilt infrastructure
remains. Stored IDs and queue records are retained, without reporting successful
measurement delivery. `PageLifecycleObserver` already handles a null current
tracker; its repository constructor does not initialize analytics.

## House promotion

Hide promotions returns false at the private
`VoetbalscoresDialogController.dialogShouldBeShown(String, boolean)` predicate.
It prevents the scoreboard's NOS-app dialog before display and before its local
visit counter changes. Page 818 and other content remain. With this control
unselected, native third-visit, installed-NOS and other-page rules remain.
Tracking-only retains the real promotion; promotion-only retains analytics.

## Preserved behaviour and checks

Both changes retain the original method bodies behind guarded insertions.
There are 148 original method graph contracts covering Main/application
callbacks, rendering/errors, DI, trackers/lifecycle, promotion/storage and SDK
initialization. Only the two exact insertions are restored for comparison.
Emitted DEX declarations bind the verifier to the supplied APK.

Native fixtures execute the factory and DI wrapper, empty and nonempty tracker
loops, native null-context errors, third-visit promotions, refresh-off/zero/positive
intervals, TV's 60-second refresh and pause cancellation/focus clearing. Whole
graphs preserve page retrieval, retries, favourites, sharing, Google Play
security-provider setup and the TV-only informational privacy notice and
preferences. The TV notice is not a consent switch.

FULL patching, report, signature and decoded-effect checks cover the original,
each control independently and both together. Production preflight checks use
actual publisher certificates and invalid metadata/signers/minSdk, plus strict
method resolution and ABI negatives. The VM models explicit Android/SDK
boundaries; it does not emulate Android or a network capture. This workflow
does not install or reset an app on a phone.

## Off-device verification record

On 29 October 2026, original + tracking-only + promotions-only + combined FULL
validation passed report, signer and 148-method native checks. Production
preflight/selector regression passed 27 assertions; Python passed 127 tests and
release-branding Node checks passed 6. Strict documentation and local links
passed for 52 language pairs / 105 HTML files. All 75 previous catalogue entries
are unchanged: 77 controls across 17 apps. All 191 prior individual code, native
and extension payloads are byte-identical to stable v1.12.0; the aggregate DEX
is rebuilt and three NOS patch classes are added. This is off-device evidence,
with phone acceptance pending at the development gate.

## Phone acceptance and stable publication

On 29 October 2026 the user reported that NOS Teletekst had been tested and
approved publication on main. The approved candidate is **v1.13.0-dev.1**
(source `30167931893ff700a369b666e3f59660413733c6`, release commit
`c1f6f505d037811ea0a0a28ca24ec94010e3f3f8`). Its downloaded bundle SHA-256 is
`23d44d71e4b3bcb9fce0575fe4a0f80eb88813d92bf1792ed5193f1f7876f47a`.
All 195 code/extension/native payloads matched the tested candidate, with the
feed and CI provenance verified. Stable promotion retains this exact app code.
The user’s acceptance does not establish a decrypted traffic capture or an
exhaustive Android-device test matrix.
