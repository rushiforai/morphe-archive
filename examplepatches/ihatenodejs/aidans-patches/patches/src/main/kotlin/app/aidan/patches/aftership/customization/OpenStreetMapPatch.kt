package app.aidan.patches.aftership.customization

import app.aidan.patches.aftership.auth.bypassSignatureCheckResourcePatch
import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

private const val TRACKING_MAP_FRAGMENT = "LA6/c0;"
private const val OSM_MAP_BRIDGE = "Lapp/aidan/extension/aftership/OsmMapBridge;"

@Suppress("unused")
val openStreetMapPatch = bytecodePatch(
    name = "OpenStreetMap Drop-in Replacement",
    description = "Replaces the broken Google Maps view with a free, self-contained OpenStreetMap (Leaflet) engine that renders routes, checkpoints, and dark/light styled tiles without requiring an API key.",
    default = true
) {
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    extendWith("extensions/extension.mpe")
    dependsOn(bypassSignatureCheckResourcePatch)

    val addZoomButtonsOption = booleanOption(
        key = "addZoomButtons",
        default = false,
        title = "Add Zoom Buttons",
        description = "Displays floating + and − zoom buttons on the map."
    )

    execute {
        val showZoomButtons = addZoomButtonsOption.value ?: false
        patchTrackingMapFragment(showZoomButtons)
    }
}

/**
 * In `TrackingMapFragment` (`LA6/c0;`), patches `b3()V` to delegate map rendering
 * to `OsmMapBridge.updateMap(this, showZoomButtons)`.
 *
 * @throws PatchException if the fragment class or implemented b3 method is missing.
 */
private fun BytecodePatchContext.patchTrackingMapFragment(showZoomButtons: Boolean) {
    val classDef = classDefByOrNull(TRACKING_MAP_FRAGMENT)
        ?: throw PatchException("Class $TRACKING_MAP_FRAGMENT not found")
    val mutableClass = mutableClassDefBy(classDef)
    val b3Method = mutableClass.methods.firstOrNull {
        it.name == "b3" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method b3 not found in $TRACKING_MAP_FRAGMENT")

    val constInstruction = if (showZoomButtons) "const/4 v0, 0x1" else "const/4 v0, 0x0"

    b3Method.addInstructions(
        0,
        """
            $constInstruction
            invoke-static {p0, v0}, $OSM_MAP_BRIDGE->updateMap(Ljava/lang/Object;Z)V
            return-void
        """.trimIndent()
    )
}
