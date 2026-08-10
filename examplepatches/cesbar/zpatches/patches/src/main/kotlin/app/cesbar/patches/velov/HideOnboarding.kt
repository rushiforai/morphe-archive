package app.cesbar.patches.velov

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.findElementByAttributeValueOrThrow

@Suppress("unused")
val hideOnboardingPatch = resourcePatch(
    name = "Hide onboarding screen",
    description = "Hide the onboarding \"Plan you journey\" screen"
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->

            val activityNode = document.childNodes.findElementByAttributeValueOrThrow(
                "android:name",
                "com.jcdecaux.vls.app.howto.HowToActivity"
            )

            activityNode.setAttribute("android:enabled", "false")
        }
    }
}
