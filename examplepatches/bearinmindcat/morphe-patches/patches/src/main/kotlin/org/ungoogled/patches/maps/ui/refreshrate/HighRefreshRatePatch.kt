package org.ungoogled.patches.maps.ui.refreshrate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.ungoogled.patches.maps.ui.activityContextHookPatch
import org.ungoogled.patches.maps.ui.markPatched
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS

/** org.ungoogled.ui.RefreshRate, the extension half. */
private const val REFRESH_RATE = "Lorg/ungoogled/ui/RefreshRate;"

/**
 * Maps' main window asking for 60 Hz (`preferredRefreshRate = 60.0f` in the main
 * Activity's onStart), the only 60 Hz window request in the app. The other write,
 * power saving mode's 30 Hz, stays as it is.
 */
private object WindowRefreshCapFingerprint : Fingerprint(
    filters = listOf(
        literal(60.0f),
        fieldAccess(
            opcode = Opcode.IPUT,
            definingClass = "Landroid/view/WindowManager\$LayoutParams;",
            name = "preferredRefreshRate",
            type = "F",
            location = MatchAfterImmediately(),
        ),
    ),
)

/** The map renderer's frame limiter, found by its dump; its target-rate setter is in the same class. */
private object MapFrameLimiterDumpFingerprint : Fingerprint(
    filters = listOf(string("  targetFrameRate: "), string("  targetFrameTimeMs: ")),
)

@Suppress("unused")
val highRefreshRatePatch = bytecodePatch(
    name = "120 refresh rate",
    description = "Lifts the 60 Hz limit Maps puts on itself, on the app and on the map, so it can run at " +
        "your screen's full refresh rate (such as 120 Hz). Uses more battery, most of all while navigating. " +
        "Off by default: switch it on on the Customization screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    // HIGH_REFRESH is refreshed from the Customization switch at every Activity attach.
    dependsOn(sharedExtensionPatch, activityContextHookPatch)

    execute {
        markPatched("highRefreshPatched")

        // 1. The window: the 60 passes through RefreshRate.window() on its way into the field.
        WindowRefreshCapFingerprint.let { fp ->
            val store = fp.instructionMatches.last().index
            val value = (fp.method.getInstruction(store) as TwoRegisterInstruction).registerA
            fp.method.addInstructions(
                store,
                """
                    invoke-static/range { v$value .. v$value }, $REFRESH_RATE->window(F)F
                    move-result v$value
                """,
            )
        }

        // 2. The map: the limiter's setter, `if (fps == 0) fps = 30; target = fps;
        //    frameMs = 1000 / fps`. Every caller that sets a rate goes through it.
        val limiter = MapFrameLimiterDumpFingerprint.method.definingClass
        val setter = mutableClassDefBy(limiter).methods.filter { m ->
            val literals = m.implementation?.instructions
                ?.mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }.orEmpty()
            m.returnType == "V" && m.parameterTypes.map { it.toString() } == listOf("J") &&
                30L in literals && 1000L in literals &&
                m.implementation!!.instructions.any { it.opcode == Opcode.DIV_LONG_2ADDR }
        }.singleOrNull() ?: throw PatchException("map frame rate setter not found in $limiter")
        setter.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p2 }, $REFRESH_RATE->map(J)J
                move-result-wide p1
            """,
        )
    }
}
