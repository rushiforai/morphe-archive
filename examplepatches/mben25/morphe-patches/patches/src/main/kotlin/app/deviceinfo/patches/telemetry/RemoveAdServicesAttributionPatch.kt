package app.deviceinfo.patches.telemetry

import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.deviceinfo.patches.shared.resource.androidManifest
import app.deviceinfo.patches.shared.resource.removeUsesLibrary
import app.deviceinfo.patches.shared.resource.removeUsesPermission
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val removeAdServicesAttributionPatch = resourcePatch(
    name = "Remove AdServices Attribution",
    description = "Removes the ACCESS_ADSERVICES_ATTRIBUTION / ACCESS_ADSERVICES_AD_ID " +
        "permissions and the android.ext.adservices uses-library entry, so the Privacy " +
        "Sandbox AdServices APIs are never touched.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    execute {
        androidManifest {
            removeUsesPermission(
                """android\.permission\.ACCESS_ADSERVICES_ATTRIBUTION""",
                """android\.permission\.ACCESS_ADSERVICES_AD_ID""",
            )
            removeUsesLibrary("""android\.ext\.adservices""")
        }
    }
}
