# RainViewer

Support for **RainViewer 8.4.1 / 44084**, package `com.lucky_apps.RainViewer`, Android 10/API 29 or later; the publisher minSdk29 and minSdk32 variants are supported. Select the complete original APKM, including its ABI and resource splits. Published in stable patch bundle 1.24.0.

## Download and use

Use the supplied [RainViewer 8.4.1 download link](https://buzzheavier.com/ai8s8yfupvev). The audited local APKM has SHA-256 `b38cf76df9235a277b8ec8fba064f67e24820ba2b962b12741986bcfdb89e91b`; the mirror link is user-provided.

1. Import the latest stable patch bundle into Morphe and select the complete original 8.4.1 APKM.
2. All nine patches are enabled by default. Local Pro exposes client controls while the server account remains Free; deselect controls you do not want.
3. Hide AI insights and Hide weather warnings overlay are enabled by default. Ordinary forecast warnings remain visible.
4. Apply and install the patched app. Skip subscription screens also removes the unavailable Manage/Subscription details action from the plan card while preserving the plan badge.

Local Pro does not guarantee every advertised paid dataset. The tested build retains Free map/forecast request limits; the 72h label does not establish 72h of downloaded frames.

## Patches

| Patch | Behavior |
| --- | --- |
| Hide ads | Stops main-map, forecast and sharing banners; post-play, post-premium and sharing interstitials; in-house promotions; chart promo blocks; and the map purchase hint. |
| Disable tracking | Includes Hide ads. Stops app/Firebase analytics, Clarity recording, Crashlytics/Sessions startup, performance metrics, CCT telemetry uploads, publisher session/paywall events and notification-open measurement. Removes advertising/referrer permissions and returns an opted-out advertising ID. |
| Skip consent screens | Includes Disable tracking. Skips the automatic Google UMP request and notice without granting or recording consent. |
| Skip subscription screens | Finishes policy/purchase onboarding through the normal completion path; suppresses recurring/startup offers and Settings offer cards. Removes the plan card's Manage link and subscription-details navigation while retaining the plan status and feature information. |
| Fix Google services | Supplies the pinned original self-certificate SHA1 to the Google/Firebase metadata helper after re-signing; preserves other-package lookups. |
| Fix integrity | Includes Fix Google services. Uses the app's null-attestation fallback and renews only its anonymous app credential once, retaining settings and purchases. Verified against the supplied rooted emulator and publisher responses. |
| Enable local Pro features | Enabled by default. Uses the Pro tier for local capability/UI computation while keeping map and forecast requests within conservative Free limits. Includes Disable tracking and Hide AI insights. Does not alter billing, purchase responses or server errors. |
| Hide AI insights | Removes the forecast AI tab/panel while retaining normal temperature content. Stops automatic assistant requests. The tested Free session received code210 from the AI endpoint. |
| Hide weather warnings overlay | Enabled by default. Removes the map-layer warnings control and stops its overlay requests. Ordinary forecast warnings remain available. The supplied emulator showed a persistent error badge and rejected overlay requests. |

All patches include a minimal local Play-licensing compatibility change for re-signed builds. This APK has a licensing wrapper; it does not contain the virtualized callback system seen in some other PairIP apps.

The four privacy controls preserve premium state. The separate local Pro option exposes client controls; availability of remote data is measured separately. See the [premium-feature audit](premium-audit.md), [local Pro research](local-pro-research.md), [integrity investigation](integrity-investigation.md), [tracking audit](tracking-audit.md), and [validation evidence](validation.md).

To reproduce patch application:

```bash
python3 scripts/validate_rainviewer.py ORIGINAL.apkm patches/build/libs/patches-VERSION.mpp morphe-desktop-all.jar --output /tmp/rainviewer-validation
```

After decoding the combined patched APK and the original base APK with apktool:

```bash
python3 tests/verify_rainviewer.py PATCHED_DECODED ORIGINAL_DECODED
```

For a build selecting local Pro, pass `--local-pro` to that verifier. Also run `verify_rainviewer_integrity.py --attestation-disabled`, `verify_rainviewer_integrity_fix.py`, `verify_rainviewer_local_pro.py`, and `verify_rainviewer_warnings.py` with the two decoded directories, and `verify_rainviewer_ai.py PATCHED_DECODED`. These check emitted instructions and behavioral effects, including session-migration failures/restarts, request-model values and UI states.
