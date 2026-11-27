package app.morphe.patches.waze.map.routeballoons

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.waze.shared.Constants.COMPATIBILITY_WAZE

@Suppress("unused")
val hideRouteBalloonsPatch = bytecodePatch(
    name = "Hide route balloons",
    description = "Removes the street name balloons shown along the route on the Waze map.",
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        mutableClassDefBy("Lcom/waze/jni/protos/map/MapContent\$NavigationContent\$ShowActiveRoute;")
            .methods.single { it.name == "setShowRoutingLabels" }
            .addInstructions(0, "const/4 p1, 0x0")
    }
}
