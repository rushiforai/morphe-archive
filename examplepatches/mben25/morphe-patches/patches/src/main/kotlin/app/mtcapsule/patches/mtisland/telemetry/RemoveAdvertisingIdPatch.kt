package app.mtcapsule.patches.mtisland.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.mtcapsule.patches.shared.Constants.COMPATIBILITY_MT_CAPSULE
import app.mtcapsule.patches.shared.resource.androidManifest
import app.mtcapsule.patches.shared.resource.removeUsesPermission

@Suppress("unused")
val removeAdvertisingIdPatch = resourcePatch(
    name = "Remove Advertising ID",
    description = "Removes the Google Play Services Advertising ID permission.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MT_CAPSULE)

    execute {
        androidManifest {
            removeUsesPermission("""com\.google\.android\.gms\.permission\.AD_ID""")
        }
    }
}
