package dev.hyzor.patches.chesscom.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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

        // The design system's colour palette: static colours set in <clinit>.
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
        // The palette dropped two intermediate greens; require the rest, and shade 5 itself.
        if (shades.size < GREENS.size - 2 || shades.values.none { it == 5 }) {
            throw PatchException("Found ${shades.size} of ${GREENS.size} greens")
        }

        // The colours are built once in <clinit>, all packed through one (J)J helper.
        var converter: MethodReference? = null
        var lastLiteral: Long? = null
        paletteClass.methods.single { it.name == "<clinit>" }.implementation!!.instructions.forEach { instruction ->
            if (instruction is WideLiteralInstruction) lastLiteral = instruction.wideLiteral
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (converter == null && reference != null && instruction.opcode == Opcode.INVOKE_STATIC &&
                reference.returnType == "J" &&
                reference.parameterTypes.map { type -> type.toString() } == listOf("J") &&
                GREENS.contains(lastLiteral)
            ) {
                converter = reference
            }
        }

        val reference = converter ?: throw PatchException("The palette converter was not found")
        mutableClassDefBy(reference.definingClass).methods.single {
            it.name == reference.name && it.returnType == "J" &&
                it.parameterTypes.map { type -> type.toString() } == listOf("J") &&
                it.implementation != null
        }.apply {
            addInstructions(
                0,
                """
                    invoke-static { p0, p1 }, $ACCENT->pack(J)J
                    move-result-wide v0
                    return-wide v0
                """,
            )
        }
    }
}
