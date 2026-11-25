package app.mtcapsule.patches.mtisland.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.mtcapsule.patches.shared.Constants.COMPATIBILITY_MT_CAPSULE
import app.mtcapsule.patches.shared.resource.androidManifest
import app.mtcapsule.patches.shared.resource.removeUsesLibrary
import app.mtcapsule.patches.shared.resource.removeUsesPermission

@Suppress("unused")
val removeAdServicesAttributionPatch = resourcePatch(
    name = "Remove AdServices Attribution",
    description = "Removes the ACCESS_ADSERVICES_ATTRIBUTION / ACCESS_ADSERVICES_AD_ID " +
        "permissions and the android.ext.adservices uses-library entry, so the Privacy " +
        "Sandbox AdServices APIs are never touched.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MT_CAPSULE)

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
