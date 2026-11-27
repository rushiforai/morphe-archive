package app.noam.patches.chesscom.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val ACCENT = "${Constants.EXTENSION_PACKAGE}/theme/Accent;"

/** chess.com's green palette, green25 to green900 (green300 = #81B64C is the brand green). */
private val GREENS = listOf(
    0xFFF6FFE3L, 0xFFF3FFCFL, 0xFFEBFFBDL, 0xFFD8FA9DL, 0xFFB2E068L, 0xFF81B64CL,
    0xFF5D9948L, 0xFF45753CL, 0xFF305730L, 0xFF204227L, 0xFF1C3724L, 0xFF162921L,
)

@Suppress("unused")
val accentPatch = bytecodePatch(
    name = "Accent color",
    description = "Your own color in place of chess.com's green, chosen in Noam's Patches → " +
        "Accent color: buttons, highlights, icons and text of the app.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("accentPatched")

        // The design system's colour palette: static colours set in <clinit>.
        var palette: ClassDef? = null
        classDefForEach { classDef ->
            if (palette != null || !classDef.type.startsWith("Lcom/chess/designsystem/tokens/")) return@classDefForEach
            val init = classDef.methods.firstOrNull { it.name == "<clinit>" } ?: return@classDefForEach
            if (init.implementation?.instructions?.any { (it as? WideLiteralInstruction)?.wideLiteral == GREENS[5] } == true) {
                palette = classDef
            }
        }
        val paletteClass = mutableClassDefBy(palette ?: throw PatchException("The color palette was not found"))

        // Each green is stored once, in <clinit>, and read straight from its field (the getters are
        // inlined), so it is swapped as it is stored. Greens the app no longer uses have no field.
        val init = paletteClass.methods.single { it.name == "<clinit>" }
        var constant: Long? = null
        val stores = mutableListOf<Pair<Int, Long>>()
        init.implementation!!.instructions.forEachIndexed { index, instruction ->
            if (instruction is WideLiteralInstruction) {
                constant = instruction.wideLiteral
            } else if (instruction.opcode == Opcode.SPUT_WIDE) {
                constant?.takeIf { it in GREENS }?.let { stores += index to it }
            }
        }
        if (stores.none { it.second == GREENS[5] }) throw PatchException("The brand green's field was not found")
        stores.reversed().forEach { (index, _) ->
            val value = init.getInstruction<OneRegisterInstruction>(index).registerA
            init.addInstructions(
                index,
                """
                    invoke-static/range { v$value .. v${value + 1} }, $ACCENT->palette(J)J
                    move-result-wide v$value
                """,
            )
        }
    }
}
