package app.cesbar.patches.velov

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.findElementByAttributeValueOrThrow

@Suppress("unused")
val useMultipleDevicesPatch = resourcePatch(
    name = "Use multiple devices",
    description = "Fix the login error \"Access denied. This account is already in use on another device.\" by pretending to be the web client"
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        document("res/values/strings.xml").use { document ->
            val activityNode = document.childNodes.findElementByAttributeValueOrThrow(
                "name",
                "iam_client"
            )
            activityNode.textContent = activityNode.textContent.replace("-android-", "-web-")
        }
    }
}
