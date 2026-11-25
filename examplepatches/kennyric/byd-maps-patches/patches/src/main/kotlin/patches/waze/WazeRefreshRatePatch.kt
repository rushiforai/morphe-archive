package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

private object WazeDisplayModeFingerprint : Fingerprint(
    definingClass = "Lcom/waze/utils/p;",
    parameters = listOf("Landroid/view/Display;"), returnType = "V",
    strings = listOf("Ignoring mode with ID = %d. Refresh rate is too high: %.6f"),
)

/** Forsigh/waze-patches' display ceiling, with a runtime switch and editable limit. */
@Suppress("unused")
val wazeHighRefreshRatePatch = bytecodePatch(
    name = "Allow high refresh rate",
    description = "Lets Waze select supported phone display modes up to an adjustable ceiling. Does not guarantee rendering FPS.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeCustomizationPatch)

    val target by intOption(
        key = "targetRefreshRate", default = 90, title = "Refresh rate ceiling (Hz)",
        description = "60 to 120 Hz. Editable in Customization. Restart Waze after changing it; higher rates may use more power.",
        required = true,
    )

    execute {
        val rate = target ?: throw PatchException("Choose a refresh rate ceiling")
        if (rate !in 60..120) throw PatchException("Refresh rate ceiling must be 60 to 120 Hz")
        val method = WazeDisplayModeFingerprint.method
        val code = method.implementation!!.instructions.toList()
        val at = code.indices.singleOrNull { index ->
            val instruction = code[index]
            instruction.opcode == Opcode.CONST_WIDE_HIGH16 &&
                (instruction as? WideLiteralInstruction)?.wideLiteral == 0x404e000000000000L &&
                code.subList(index + 1, minOf(index + 5, code.size)).any {
                    it.opcode == Opcode.CMPL_DOUBLE || it.opcode == Opcode.CMPG_DOUBLE
                }
        } ?: throw PatchException("Expected exactly one 60 Hz display-mode ceiling feeding a double comparison")
        val register = (code[at] as OneRegisterInstruction).registerA
        method.replaceInstruction(at, "invoke-static { }, $WAZE_CUSTOMIZATION->refreshRateCeiling()D")
        method.addInstructions(at + 1, "move-result-wide v$register")
        declareWazeToggle("highRefreshRate")
        declareWazeValue("highRefreshRate", "DISPLAY_REFRESH_RATE", rate)
    }
}
