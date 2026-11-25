package app.masareef.patches.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.masareef.patches.telemetry.resource.androidManifest
import app.masareef.patches.telemetry.resource.removeUsesPermission

val removeAdvertisingIdPatch = resourcePatch(
    description = "Removes the Advertising ID permission."
) {
    execute {
        androidManifest {
            removeUsesPermission("""com\.google\.android\.gms\.permission\.AD_ID""")
        }
    }
}
