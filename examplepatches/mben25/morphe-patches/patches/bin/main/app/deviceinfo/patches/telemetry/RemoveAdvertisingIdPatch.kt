package app.deviceinfo.patches.telemetry

import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.deviceinfo.patches.shared.resource.androidManifest
import app.deviceinfo.patches.shared.resource.removeUsesPermission
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val removeAdvertisingIdPatch = resourcePatch(
    name = "Remove Advertising ID",
    description = "Removes the Google Play Services Advertising ID permission.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    execute {
        androidManifest {
            removeUsesPermission("""com\.google\.android\.gms\.permission\.AD_ID""")
        }
    }
}
