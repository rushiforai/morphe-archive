package app.template.patches.nikerunclub.trackers

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.nikerunclub.NrcAdobeRegisterExtensionsFingerprint
import app.template.patches.shared.Constants.NIKE_RUN_CLUB_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * Disables Nike Run Club's **Adobe (Omniture) analytics**.
 *
 * NRC routes its usage/event telemetry through the Adobe Experience Platform SDK
 * (`com.nike.plusgps.core.analytics.AdobeRunningAnalytics` / `NikeOmnitureImpl` →
 * `com.adobe.marketing.mobile.*`). Every Adobe extension is registered in a single
 * `MobileCore.registerExtensions(list, callback)` call; no-op'ing that method means no
 * Adobe extension ever registers, so no event, identity or optimisation payload is
 * built or sent.
 *
 * Adobe APIs are null-safe when uninitialised (they log and no-op rather than throw),
 * so the app keeps running. Push (Urban Airship / FCM) and Nike's own first-party
 * Crashlytics-style telemetry module are deliberately left intact.
 *
 * See also [nikeDisableTrackerComponentsPatch], which disables the Adobe manifest
 * components (extension discovery service, Assurance/in-app-message activities) and
 * sets the documented collection opt-out flags.
 */
@Suppress("unused")
val nikeDisableTrackersPatch = bytecodePatch(
    name = "Disable trackers",
    description = "Disables Adobe (Omniture) analytics by stopping the Adobe Experience " +
        "Platform extension registration, so no tracking payload is built or sent.",
    default = true,
) {
    compatibleWith(NIKE_RUN_CLUB_COMPATIBILITY)

    execute {
        NrcAdobeRegisterExtensionsFingerprint.method.returnEarly()
    }
}
