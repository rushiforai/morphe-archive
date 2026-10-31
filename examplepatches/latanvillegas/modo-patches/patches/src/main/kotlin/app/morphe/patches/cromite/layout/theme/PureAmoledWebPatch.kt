package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

private const val CROMITE_WEB_VERSION = "153.0.8010.37"
private const val CONTROLLER =
    "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;"

/**
 * Preserve Chromium's existing true branches (forced dark and manual/per-site
 * darkening). Only replace the final false result with the opt-in AMOLED
 * automatic decision. Initialize the false-result register at method entry,\n * avoiding insertion adjacent to a branch-targeted final RETURN.\n * The helper returns false unless both AMOLED and
 * automatic mode are selected.
 */
private val webContentsDarkModeDecisionFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/night_mode/WebContentsThemeClient;",
    name = "isForceDarkWebContentEnabled",
    returnType = "Z",
    parameters = listOf("Lorg/chromium/content_public/browser/WebContents;"),
)

@Suppress("unused")
val pureAmoledWebPatch = bytecodePatch(
    name = "AMOLED automatic web darkening",
    description = "Adds automatic AMOLED web darkening while retaining Cromite's manual and per-site darkening.",
    default = false,
) {
    compatibleWith("org.cromite.cromite"(CROMITE_WEB_VERSION))
    dependsOn(cromiteAmoledBrightnessPatch)

    execute {
        classDefBy(CONTROLLER)
        val method = webContentsDarkModeDecisionFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val last = instructions.lastIndex
        check(last > 0 && instructions[last].opcode == Opcode.RETURN) {
            "AMOLED web: expected final boolean return in WebContentsThemeClient"
        }
        val result = instructions[last] as OneRegisterInstruction
        // Verified on Cromite 153.0.8010.37: v0 is initialized to false
        // at method entry, v3 is initialized to true, and the last two
        // instructions return v3 and v0 respectively.
        val initialZero = instructions.first()
        check(initialZero.opcode == Opcode.CONST_4 &&
            initialZero is NarrowLiteralInstruction &&
            initialZero.narrowLiteral == 0 &&
            (initialZero as OneRegisterInstruction).registerA == result.registerA &&
            instructions[last - 1].opcode == Opcode.RETURN &&
            (instructions[last - 1] as OneRegisterInstruction).registerA != result.registerA) {
            "AMOLED web: expected verified Cromite false-return register layout"
        }
        check(instructions.drop(1).dropLast(1).none {
            it is OneRegisterInstruction && it.registerA == result.registerA &&
                it.opcode.name.startsWith("CONST")
        }) {
            "AMOLED web: false-return register is reassigned"
        }

        // Preserve the branch-targeted final return by injecting immediately
        // after the verified initial false-register initialization.
        method.addInstructions(
            1,
            """
                invoke-static {}, $CONTROLLER->shouldAutoDarkenWebContents()Z
                move-result v${result.registerA}
            """.trimIndent(),
        )
    }
}
