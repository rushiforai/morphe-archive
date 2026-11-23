package app.template.patches.aare

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_AARE

/** PhoneLocationFeed.push(Location): gives the phone the car's GPS fix. */
internal object PhoneLocationFeedPushFingerprint : Fingerprint(
    definingClass = "Lnet/prototux/aare/car/PhoneLocationFeed;",
    name = "push",
    returnType = "V",
    parameters = listOf("Landroid/location/Location;"),
)

@Suppress("unused")
val tunnelNavigationPatch = patch(
    name = "Tunnel navigation",
    description = "With the car's GPS used for the phone, the position keeps moving in tunnels: it is estimated from the " +
        "car's speed, compass and gyroscope until the GPS is back.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AARE)

    extendWith("extensions/extension.mpe")

    dependsOn(settingsPatch)

    execute {
        registerSetting("tunnel_navigation")

        PhoneLocationFeedPushFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, Lapp/template/extension/aare/TunnelNavigation;->onPush(Ljava/lang/Object;Landroid/location/Location;)Z
                    move-result v0
                    if-eqz v0, :aare_tunnel
                    return-void
                """,
                ExternalLabel("aare_tunnel", getInstruction(0)),
            )
        }
    }
}
