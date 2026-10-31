# KIJK Android

**Supported app:** 9.8.0 · **Build:** 2026101500 · **Input:** APK

`nl.sbs.kijk`

[Use your own APK](../guides/downloads.md#local-original-inputs){ .md-button }

Select this file in Morphe Manager to apply the patches.

The Android phone and tablet app uses a native JWPlayer player. The patches remove its client video-ad configuration, stop optional audience and diagnostic collection, reject optional cookie purposes and skip automatic notification permission requests. Refresh the patch source in Morphe Manager, choose KIJK Android and use the original build 2026101500. The KIJK Android TV package is a separate target.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Full-screen and inline video ads | Two native paths attach VMAP advertising configuration or an advertising tag. | Hide ads takes their existing nullable content-only paths while retaining content, player configuration and DRM. |
| Tealium, Comscore and Conviva | Native startup, publish-settings retrieval, events and player measurement can create requests and queued work. | Disable tracking stops the inspected producers and queue/send boundaries. Conviva retains its typed player dependencies and completes its original callback locally. |
| Adjust attribution and advertising identifiers | The app initializes Adjust, forwards a push token and creates attribution events; separate queues send pending packages. | Disable tracking stops initialization, identifiers, events and those queue boundaries, and reports advertising tracking as limited. |
| Firebase and Salesforce analytics | Collection can be re-enabled through saved settings or SDK APIs, and historical uploads have separate paths. Salesforce also supplies functional push registration. | Disable tracking keeps inspected analytics disabled and completes queued upload paths locally, while preserving the functional push SDK and account registration. |
| OneTrust consent | The original SDK-ready callback can automatically show a full-screen banner. | Skip consent screens invokes OneTrust's genuine Reject All save action, preserves necessary purposes and completes the original ready path. Later manual privacy choices remain available. |
| Notification prompts and defaults | MainActivity automatically requests notification permission; the app's own notification preference defaults on. | Skip consent screens omits the automatic request and migrates the app preference off once. Manual opt-in and opt-out remain available. |

## What remains and what is still unknown

Content, configuration, authentication, account and DRM services remain functional. Push registration remains available for users who later opt in. On Android 13 or newer a fresh installation keeps notification permission denied until a manual choice; an existing OS grant is not revoked. The app's own default-off preference also applies on older Android versions.

The patches do not grant subscriptions, account entitlements or DRM licences. Broadcast advertising, advertising already stitched into media and remote Cast receiver advertising are outside this acceptance. Casting, live programmes, notification delivery, long sessions and every device or ABI need broader testing. The bounded traffic checks do not prove complete tracking silence.

Use the original APK on Android 8.0 (API 26) or newer. Updates must use the same signing key to preserve app data. The first patched consent-ready callback also rejects optional purposes on previously accepted installations; subsequent manual privacy and notification choices are retained unless OneTrust requires renewed consent.

## Available controls

Disable tracking, Hide ads, Skip consent screens.

All three default on, including in Simple mode. Skip consent screens includes Disable tracking; Hide ads remains independently selectable. Manual privacy settings and notification settings remain available.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Validated on 31 October 2026: [native phone research and exact contracts](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-kijk-mobile.md). Complete emitted-method comparisons cover all 55 selected changes, including original method tails and unchanged functional methods; the standalone consent selection covers 53 changes including tracking. Seventeen actual-APK ART fixture groups passed on Android 16. Frida observed guest VOD playback and the inspected ad/tracking boundaries; genuine OneTrust purpose and vendor refusal values were checked. The user tested the final three-control APK after a clean phone installation, confirmed it works and approved publication. No diagnostic Gadget is included. These results do not establish the untested cases listed above. [How to read the evidence](../reference/methodology.md).
