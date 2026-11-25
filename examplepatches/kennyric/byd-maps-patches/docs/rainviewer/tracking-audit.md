# RainViewer tracking and advertising audit

Inspected target: `com.lucky_apps.RainViewer` **8.4.1 / 44084**. This is an app-code audit and a bounded Android emulator walkthrough, not a claim about every future server response.

## Disabled paths

| System | Original behavior and patch boundary |
| --- | --- |
| Google Mobile Ads | Auto-initializing provider plus app SDK initialization. Disable both and the final main-map, forecast, sharing, post-play and post-premium ad gates. No premium entitlement is forged. |
| Publisher promotions | Disable `InHouseBannerData.getDisplayAd`, chart promo blocks, the `mu2` purchase map hint, and Settings subscription offer cards. Skip subscription screens also takes the original no-offer path for automatic startup/web notices, including cached ones. Keep weather hints and plan status. |
| Google UMP | `lq2.a(FragmentActivity)` updates consent and can display the funding-choices notice before ad initialization. Skip this entry point only after ads/tracking are disabled. Do not write IAB consent or simulate acceptance. |
| Firebase Analytics | Hard-deactivate collection and ad storage/IDs through the manifest. Stop `b56` event enqueue, direct send and queued drain, plus `nr2` user properties. |
| Microsoft Clarity | Force the remote/cached Clarity gate off; return false from both initialization overloads and resume; disable `UploadSessionJob`. No session recording is started. |
| Crashlytics / Sessions | Remove the two Crashlytics registrars and Sessions registrar. Keep a non-null inert app crash-logger facade (`qb9` variant 15, `c56.i`) so error handling does not crash when Firebase's component is absent. Also hard-disable persisted collection decisions. |
| Firebase Performance | Hard-deactivate collection and stop metric/trace enqueue and dispatch (`zn7.b/c/d`). Retain instrumented HTTP wrappers because weather networking calls them. |
| Queued Firebase/CCT uploads | `l9.e(cya)` is the CCT HTTP boundary. Return a local HTTP-200-style result with zero next delay; avoid opening a connection and avoid retrying retained telemetry batches. |
| Publisher events | `ff4.j` sends legacy user events; `ff4.k` sends session/paywall events to `mobile/user/events`. Return completion locally. The paywall variant returns the actual expected response type with empty offer/product data, preventing coroutine cast errors or entitlement updates. |
| Notification-open measurement | `ff4.e(NotificationOpenedRequest, ...)` returns completion without reporting the open. Delivery/settings paths remain available. |
| Advertising identity | Remove AD_ID, the three AdServices permissions and Install Referrer permission. Return the all-zero advertising ID with limit-ad-tracking enabled. |

## Retained functional communications

Weather maps/tiles, place search, forecasts, station products, notification settings/delivery, remote app settings, and user-initiated billing/authentication remain network functions. Firebase Installations is still used by Firebase Messaging/remote configuration. These communications may include an installation identity, requested location, language, units and notification preferences. They are not replaced by fake local weather or payment responses.

The process-scoped observation records request construction and Java URL/DNS boundaries without query strings, credentials or response bodies. It complements the inspected sender boundaries. Native map networking and cached connections limit what a finite trace can prove; no emulator-wide DNS/packet absence is treated as proof of zero app tracking.
