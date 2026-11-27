package app.unlimited.sportsnet.patches.alerts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import app.unlimited.sportsnet.patches.shared.Constants.COMPATIBILITY_SPORTSNET
import app.unlimited.sportsnet.patches.shared.originalSignaturePatch

private const val BUILDER = "Lcom/urbanairship/AirshipConfigOptions\$Builder;"
private const val FEATURE = "Lcom/urbanairship/PrivacyManager\$Feature;"

private object AirshipConfigBuildFingerprint : Fingerprint(
    definingClass = BUILDER,
    name = "build",
    returnType = "Lcom/urbanairship/AirshipConfigOptions;",
    parameters = listOf(),
)

/** Sets up push listeners, game alert channels and live score updates once Airship is ready. */
private object OnAirshipReadyFingerprint : Fingerprint(
    definingClass = "/SportsnetAirshipAutopilot;",
    name = "onAirshipReady",
    returnType = "V",
)

/** Without this permission Android shows no notifications from the app and never asks for it. */
private val removeNotificationPermissionPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("uses-permission")
            (0 until permissions.length).map { permissions.item(it) }
                .filter {
                    it.attributes.getNamedItem("android:name")?.nodeValue ==
                        "android.permission.POST_NOTIFICATIONS"
                }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}

@Suppress("unused")
val disableAlertsPatch = bytecodePatch(
    name = "Disable game alerts",
    description = "Turns off game alerts, live score notifications and Airship's pop-up messages " +
        "and tracking, and stops the app from asking to send notifications.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPORTSNET)
    dependsOn(originalSignaturePatch)
    dependsOn(removeNotificationPermissionPatch)

    execute {
        // Airship must still start, since the app expects it, but with every feature off:
        // push, in-app messages, analytics and contact data.
        AirshipConfigBuildFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                new-array v0, v0, [$FEATURE
                sget-object v1, $FEATURE->NONE:$FEATURE
                const/4 v2, 0x0
                aput-object v1, v0, v2
                invoke-virtual {p0, v0}, $BUILDER->setEnabledFeatures([$FEATURE)$BUILDER
                const/4 v0, 0x1
                invoke-virtual {p0, v0}, $BUILDER->setResetEnabledFeatures(Z)$BUILDER
            """
        )

        OnAirshipReadyFingerprint.method.returnEarly()
    }
}
