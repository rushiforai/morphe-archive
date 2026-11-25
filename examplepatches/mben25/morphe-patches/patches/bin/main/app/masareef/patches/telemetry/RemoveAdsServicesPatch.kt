package app.masareef.patches.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.masareef.patches.telemetry.resource.androidManifest
import app.masareef.patches.telemetry.resource.removeProperty
import app.masareef.patches.telemetry.resource.removeUsesPermission

val removeAdsServicesPatch = resourcePatch(
    description = "Removes AdServices config and permissions."
) {
    execute {
        androidManifest {
            removeUsesPermission(
                """android\.permission\.ACCESS_ADSERVICES_ATTRIBUTION""",
                """android\.permission\.ACCESS_ADSERVICES_AD_ID""",
            )
            removeProperty(
                """android\.adservices\.AD_SERVICES_CONFIG""",
            )
        }
    }
}
