package app.noam.patches.geocaching.search

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.geocaching.misc.extension.extensionHookPatch
import app.noam.patches.geocaching.shared.Constants
import app.noam.patches.geocaching.shared.enableFeature
import app.noam.patches.geocaching.shared.forcePremiumIn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal object PreferredMapTypeFingerprint : Fingerprint(
    definingClass = "Lk4c;",
    name = "e",
    returnType = "Lcom/groundspeak/geocaching/intro/map/type/MapType;",
    parameters = emptyList(),
)

/** cr7 case 2: the MapLibre map's "map ready" callback, which loads the style URL. */
private const val STYLE_URL_FIELD = "Lcom/groundspeak/geocaching/intro/mainmap/map/n;->F:Ljava/lang/String;"
private const val TO_GOOGLE_MAP = 0x7f0a0567
internal const val MAPLIBRE_FRAGMENT = "Lcom/groundspeak/geocaching/intro/mainmap/map/MapLibreFragment;"

/** The app keeps being told Trails (its MapLibre map); a layer picked in the picker lives in the saved preference. */
internal val nativeMapPatch = bytecodePatch(
    name = "Map without a Google key",
    description = "Uses the app's built-in MapLibre map instead of Google Maps, so no Google Maps key is needed.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(extensionHookPatch)

    execute {
        PreferredMapTypeFingerprint.method.replaceInstructions(
            0,
            """
                sget-object v0, Lcom/groundspeak/geocaching/intro/map/type/MapType;->M:Lcom/groundspeak/geocaching/intro/map/type/MapType;
                return-object v0
            """,
        )

        // Style URL for the picked layer.
        mutableClassDefBy("Lcr7;").methods.first { it.name == "a" }.apply {
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.IGET_OBJECT && (it as ReferenceInstruction).reference.toString() == STYLE_URL_FIELD
            }
            require(index >= 0) { "Map style URL read not found" }
            val register = getInstruction<TwoRegisterInstruction>(index).registerA
            replaceInstruction(index, "invoke-static { }, ${Constants.GC_MAP_STYLES}->styleUri()Ljava/lang/String;")
            addInstructions(index + 1, "move-result-object v$register")
        }

        // The map type picker gets "is Premium" to lock Trails; Trails is this map, so it stays open.
        forcePremiumIn("Ljy6;", "invoke")

        // Map type picker result: reload with the new layer instead of opening the Google map.
        mutableClassDefBy("Lhy6;").methods.first { it.name == "invoke" }.apply {
            val google = instructions.indexOfFirst {
                it.opcode == Opcode.CONST && (it as NarrowLiteralInstruction).narrowLiteral == TO_GOOGLE_MAP
            }
            require(google >= 0) { "Map type picker navigation not found" }
            val navigation = instructions.subList(0, google).indexOfLast {
                it.opcode == Opcode.INVOKE_STATIC &&
                    (it as ReferenceInstruction).reference.toString().startsWith("Landroidx/navigation/fragment/a;->a(")
            }
            require(navigation > 0 && instructions[navigation - 1].opcode == Opcode.IF_NEZ) { "Map type check not found" }
            addInstructions(
                navigation - 1,
                """
                    invoke-static/range { p0 .. p0 }, ${Constants.GC_MAP_STYLES}->reloadMap(Ljava/lang/Object;)V
                    sget-object p0, Lszb;->a:Lszb;
                    return-object p0
                """,
            )
        }
    }
}

internal val extraMapLayersPatch = bytecodePatch(
    name = "Extra map layers",
    description = "Street (OpenStreetMap), Satellite and Hybrid (Esri) and Terrain (OpenTopoMap) layers in the map " +
        "type picker, no keys needed.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(nativeMapPatch)

    execute {
        enableFeature("mapLayers")

        // The map type picker highlights the layer actually picked, not the Trails the app is told.
        mutableClassDefBy("Lvw4;").methods.first { it.name == "invoke" }.apply {
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    (it as ReferenceInstruction).reference.toString() == "Lk4c;->e()Lcom/groundspeak/geocaching/intro/map/type/MapType;"
            }
            require(index >= 0) { "Map type picker selection not found" }
            replaceInstruction(index, "invoke-static { }, ${Constants.GC_MAP_STYLES}->selectedType()Ljava/lang/Object;")
        }
    }
}

internal val keepMapPositionPatch = bytecodePatch(
    name = "Keep map in place after closing a cache",
    description = "Coming back to the map from a cache leaves it where it was instead of moving it and loading again.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(nativeMapPatch)

    execute {
        // Back on the map from a cache: keep the camera (and the caches shown) where they were.
        mutableClassDefBy(MAPLIBRE_FRAGMENT).methods.first { it.name == "onResume" }.apply {
            val start = instructions.indexOfFirst {
                it.opcode == Opcode.NEW_INSTANCE &&
                    (it as ReferenceInstruction).reference.toString() == "Lcom/groundspeak/geocaching/intro/mainmap/map/j;"
            }
            val call = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    (it as ReferenceInstruction).reference.toString() == "Lorg/maplibre/android/maps/MapView;->a(Lq28;)V"
            }
            require(start >= 0 && call > start) { "Map resume camera placement not found" }
            val register = getInstruction<OneRegisterInstruction>(start).registerA
            addInstructionsWithLabels(
                start,
                """
                    invoke-static/range { p0 .. p0 }, ${Constants.GC_MAP_VIEW}->shouldPlaceCamera(Ljava/lang/Object;)Z
                    move-result v$register
                    if-eqz v$register, :noam_keep_camera
                """,
                ExternalLabel("noam_keep_camera", getInstruction(call + 1)),
            )
        }
    }
}
