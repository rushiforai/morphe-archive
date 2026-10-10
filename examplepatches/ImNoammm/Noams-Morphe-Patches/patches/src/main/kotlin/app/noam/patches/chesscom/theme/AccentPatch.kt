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
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val ACCENT = "${Constants.EXTENSION_PACKAGE}/theme/Accent;"

/** chess.com's green palette, green25 to green900 (green300 = #81B64C is the brand green). */
private val GREENS = listOf(
    0xFFF6FFE3L, 0xFFF3FFCFL, 0xFFEBFFBDL, 0xFFD8FA9DL, 0xFFB2E068L, 0xFF81B64CL,
    0xFF5D9948L, 0xFF45753CL, 0xFF305730L, 0xFF204227L, 0xFF1C3724L, 0xFF162921L,
)

@Suppress("unused")
val accentPatch = bytecodePatch(
    name = "Accent color",
    description = "Your own colour in place of chess.com's green, chosen in Noam's Patches → " +
        "Accent color: buttons, highlights, icons and text of the app.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("accentPatched")

        // The design system's colour palette: static colours set in <clinit>, one getter each.
        var palette: ClassDef? = null
        classDefForEach { classDef ->
            if (palette != null || !classDef.type.startsWith("Lcom/chess/designsystem/tokens/")) return@classDefForEach
            val init = classDef.methods.firstOrNull { it.name == "<clinit>" } ?: return@classDefForEach
            if (init.implementation?.instructions?.any { (it as? WideLiteralInstruction)?.wideLiteral == GREENS[5] } == true) {
                palette = classDef
            }
        }
        val paletteClass = mutableClassDefBy(palette ?: throw PatchException("The colour palette was not found"))

        // Which static field holds which green.
        val shades = mutableMapOf<String, Int>()
        var constant: Long? = null
        paletteClass.methods.single { it.name == "<clinit>" }.implementation!!.instructions.forEach { instruction ->
            when {
                instruction is WideLiteralInstruction -> constant = instruction.wideLiteral
                instruction.opcode == Opcode.SPUT_WIDE -> {
                    val field = (instruction as ReferenceInstruction).reference as FieldReference
                    val shade = GREENS.indexOf(constant ?: return@forEach)
                    if (shade >= 0) shades[field.name] = shade
                }
            }
        }
        if (shades.size != GREENS.size) throw PatchException("Found ${shades.size} of ${GREENS.size} greens")

        var hooked = 0
        paletteClass.methods.forEach { method ->
            if (method.parameterTypes.isNotEmpty() || method.returnType != "J") return@forEach
            val body = method.implementation?.instructions?.toList() ?: return@forEach
            if (body.size != 2 || body[0].opcode != Opcode.SGET_WIDE || body[1].opcode != Opcode.RETURN_WIDE) return@forEach
            val shade = shades[((body[0] as ReferenceInstruction).reference as FieldReference).name] ?: return@forEach
            val value = method.getInstruction<OneRegisterInstruction>(1).registerA
            val self = method.implementation!!.registerCount - 1
            if (self == value || self == value + 1 || self > 15) throw PatchException("Unexpected palette registers")
            method.addInstructions(
                1,
                """
                    const/16 v$self, $shade
                    invoke-static { v$value, v${value + 1}, v$self }, $ACCENT->palette(JI)J
                    move-result-wide v$value
                """,
            )
            hooked++
        }
        if (hooked == 0) throw PatchException("No green palette getters were found")
    }
}
