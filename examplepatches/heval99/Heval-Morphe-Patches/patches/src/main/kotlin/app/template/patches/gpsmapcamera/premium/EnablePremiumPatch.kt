package app.template.patches.gpsmapcamera.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_GPSMAPCAMERA

/**
 * Every premium gate reads SubscriptionManager.isSubscribed(): the Remote Config switches for the
 * customize and photo EXIF features (each ANDed with !isSubscribed()), the "Watch ad" step in front
 * of the advanced place search, the upgrade banners and the ad managers. The getter answers true.
 * The cached flag, the purchase query and the listeners are untouched, so the flag never flips to
 * false and the listeners are never told so. The daily place-search counter applies to subscribers
 * too and is not changed.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks premium features and removes ads.",
) {
    compatibleWith(COMPATIBILITY_GPSMAPCAMERA)

    execute {
        IsSubscribedFingerprint.method.returnEarly(true)
    }
}
