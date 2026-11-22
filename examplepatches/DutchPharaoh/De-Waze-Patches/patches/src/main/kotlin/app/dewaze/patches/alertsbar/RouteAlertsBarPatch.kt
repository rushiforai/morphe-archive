package app.dewaze.patches.alertsbar

import app.dewaze.patches.shared.Constants.COMPATIBILITY_WAZE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefBy

private const val EXTENSION_CLASS = "Lapp/dewaze/extension/RouteAlertsBarPatch;"
private const val SURFACE_CALLBACK = "Landroidx/car/app/SurfaceCallback;"
private const val SURFACE_CONTAINER = "Landroidx/car/app/SurfaceContainer;"

/**
 * The SurfaceCallback Waze registers with the car host; it fans every call out to a list of
 * listeners (obfuscated, Waze 5.27.4.900).
 */
private const val CAR_SURFACE_FAN_OUT = "Lcom/waze/car_lib/k/a/g;"

private const val ZONE_EXTENSION_CLASS = "Lapp/dewaze/extension/AverageSpeedZone;"
private const val NAVIGATION_INFO_BASE = "Lcom/waze/navigate/NavigationInfoNativeManagerBase;"
private const val INSIGHTS_INFRA_BASE = "Lcom/waze/insights_infra/InsightsInfraNativeManagerBase;"

/** Waze's speedometer state: (speed, units, isUsStyle, maxSpeedRoad, 4 flags); obfuscated, 5.27.4.900. */
private const val SPEEDOMETER_STATE = "Lcom/waze/bz/i;"
private const val SPEEDOMETER_STATE_INIT = "(ILjava/lang/String;ZIZZZZ)V"

@Suppress("unused")
val routeAlertsBarPatch = bytecodePatch(
    name = "Alerts bar in Android Auto",
    description = "Shows a vertical bar on the right of the Android Auto map with the reports " +
        "on your route in the next 10 km: speed cameras, police, accidents, jams, hazards and closures. " +
        "In a section control zone it also shows your average speed, the speed limit and the distance left.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    extendWith("extensions/extension.mpe")

    execute {
        // Waze's map engine swaps its frames natively, so the bar cannot be drawn into them.
        // Instead, swap the car surface for an intermediate one before any listener sees it; the
        // extension copies each frame to the real surface with the bar on top.
        val fanOut = mutableClassDefBy(CAR_SURFACE_FAN_OUT)
        if (SURFACE_CALLBACK !in fanOut.interfaces || fanOut.fields.none { it.type == "Ljava/util/List;" }) {
            throw PatchException("$CAR_SURFACE_FAN_OUT is not the car SurfaceCallback fan-out")
        }
        var hooked = 0
        fanOut.methods.forEach { method ->
            if (method.name != "onSurfaceAvailable" && method.name != "onSurfaceDestroyed") return@forEach
            if (method.parameterTypes.singleOrNull()?.toString() != SURFACE_CONTAINER) return@forEach
            // p1 is the container; replace it at the very start, before it is read.
            method.addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_CLASS->${method.name}(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, $SURFACE_CONTAINER
                """,
            )
            hooked++
        }
        if (hooked != 2) throw PatchException("Car surface callbacks not found ($hooked of 2)")

        // The car host covers part of the surface with its own UI (e.g. split screen); Waze moves
        // its buttons into the visible area, and so must the bar.
        var areaHooks = 0
        fanOut.methods.forEach { method ->
            if (method.name != "onVisibleAreaChanged" && method.name != "onStableAreaChanged") return@forEach
            if (method.parameterTypes.singleOrNull()?.toString() != "Landroid/graphics/Rect;") return@forEach
            method.addInstructions(
                0,
                "invoke-static { p1 }, $EXTENSION_CLASS->${method.name}(Ljava/lang/Object;)V",
            )
            areaHooks++
        }
        if (areaHooks != 2) throw PatchException("Car area callbacks not found ($areaHooks of 2)")

        // Section control: the zone reports (native callbacks, not obfuscated) and the speed limit.
        mutableClassDefBy(NAVIGATION_INFO_BASE).methods.apply {
            single { it.name == "onAverageSpeedCamZoneUpdateJNI" }.addInstructions(
                0,
                "invoke-static/range { p1 .. p1 }, $ZONE_EXTENSION_CLASS->onZoneUpdate([B)V",
            )
            single { it.name == "onAverageSpeedCamZoneClearJNI" }.addInstructions(
                0,
                "invoke-static { }, $ZONE_EXTENSION_CLASS->onZoneClear()V",
            )
        }
        mutableClassDefBy(INSIGHTS_INFRA_BASE).methods
            .single { it.name == "onSegmentInsightUpdatedJNI" }
            .addInstructions(0, "invoke-static/range { p1 .. p1 }, $ZONE_EXTENSION_CLASS->onSegmentInsights([B)V")

        val speedometerInit = mutableClassDefBy(SPEEDOMETER_STATE).methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.joinToString("", "(", ")V") == SPEEDOMETER_STATE_INIT
        } ?: throw PatchException("Speedometer state constructor not found")
        // p4 is maxSpeedRoad. Before the super call, but only a parameter register is read.
        speedometerInit.addInstructions(
            0,
            "invoke-static/range { p4 .. p4 }, $ZONE_EXTENSION_CLASS->onSpeedometerState(I)V",
        )
    }
}
