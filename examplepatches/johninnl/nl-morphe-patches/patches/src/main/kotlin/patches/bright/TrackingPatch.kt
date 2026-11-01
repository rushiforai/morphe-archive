package patches.bright

import app.morphe.patcher.patch.bytecodePatch

/**
 * Firebase Analytics, Crashlytics, Sessions and Performance collection and
 * the advertising-identifier surface, disabled through the exact provider
 * defaults the shipped SDKs honor, plus the audited ad-services permissions.
 * Includes Hide ads. Functional Firebase configuration, messaging, push and
 * authentication services remain; web-view measurement is not claimed.
 */
@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Turns off Firebase analytics, Crashlytics, sessions and performance collection, advertising-identifier access and the ad-services permissions the inspected build declares. Includes Hide ads; keeps push, configuration, authentication and account services.",
) {
    dependsOn(originalInput, runtime, hideAds, trackingResources)
    compatibleWith(bright)
    execute { selectControl("tracking") }
}
