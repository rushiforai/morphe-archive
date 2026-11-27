package app.noam.patches.chesscom.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val AMOLED = "${Constants.EXTENSION_PACKAGE}/theme/Amoled;"
private const val DARK_SCHEME = "Lcom/chess/designsystem/tokens/StandardChessComColorScheme\$DARK_MODE;"
/** 0.3f, the strength of the redesign's background shade. */
private const val SHADE_ALPHA = 0x3e99999a
/** 0.95f, the strength of the bottom bar's background. */
private const val BAR_ALPHA = 0x3f733333
/** chess.com's gray900, the bottom bar's color. */
private const val GRAY_900 = 0xff262421L

/** Background colours of the dark scheme and the role Amoled gives each (see Amoled.java). */
private val ROLES = mapOf(
    "bgPrimary" to 0, "bgSurface" to 0, "bgOpaque" to 0, "bgOpaqueLighter" to 0,
    "bgSecondary" to 1, "bgSecondaryAlt" to 1, "bgContainerDark" to 1,
    "bgTertiary" to 2,
    "bgQuaternary" to 3,
    "bgPanel" to 4,
    "bgOverlayBoard" to 5,
)

@Suppress("unused")
val amoledPatch = bytecodePatch(
    name = "AMOLED black",
    description = "Pure black backgrounds instead of chess.com's dark gray, in the newer and the " +
        "older screens. Switch it in Noam's Patches (then restart the app).",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("amoledPatched")

        // Each background getter of the dark scheme: return Amoled.color(value, role).
        val hooked = mutableSetOf<String>()
        mutableClassDefBy(DARK_SCHEME).methods.forEach { method ->
            if (method.parameterTypes.isNotEmpty() || method.returnType != "J") return@forEach
            val body = method.implementation?.instructions?.toList() ?: return@forEach
            if (body.size != 2 || body[0].opcode != Opcode.IGET_WIDE || body[1].opcode != Opcode.RETURN_WIDE) return@forEach
            val field = (body[0] as ReferenceInstruction).reference as FieldReference
            val role = ROLES[field.name] ?: return@forEach
            val value = method.getInstruction<OneRegisterInstruction>(1).registerA
            val self = method.implementation!!.registerCount - 1
            if (self == value || self == value + 1 || self > 15) throw PatchException("Unexpected registers in ${field.name}")
            method.addInstructions(
                1,
                """
                    const/4 v$self, $role
                    invoke-static { v$value, v${value + 1}, v$self }, $AMOLED->color(JI)J
                    move-result-wide v$value
                """,
            )
            hooked += field.name
        }
        val missing = ROLES.keys - hooked
        if (missing.isNotEmpty()) throw PatchException("Dark scheme colors not found: $missing")

        // The redesigned screens shade their background from the top: bgSecondary at 30 %
        // fading out, drawn over the theme background. Over black that is a grey haze, so both of its
        // colors become transparent. The method has to run on: in newer versions it then draws the
        // screen's content.
        val bgSecondary = mutableClassDefBy(DARK_SCHEME).methods.single { method ->
            val first = method.implementation?.instructions?.firstOrNull() ?: return@single false
            method.parameterTypes.isEmpty() && method.returnType == "J" && first.opcode == Opcode.IGET_WIDE &&
                ((first as ReferenceInstruction).reference as FieldReference).name == "bgSecondary"
        }.name
        fun readsBgSecondary(instruction: Instruction): Boolean {
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            return reference != null && reference.name == bgSecondary && reference.returnType == "J" &&
                reference.parameterTypes.isEmpty() && reference.definingClass.startsWith("Lcom/chess/designsystem/tokens/")
        }
        val shades = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("Lcom/chess/palette/core/modifier/")) return@classDefForEach
            classDef.methods.forEach { method ->
                if (method.returnType != "V" || method.parameterTypes.size != 1) return@forEach
                val body = method.implementation?.instructions ?: return@forEach
                val strength = body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == SHADE_ALPHA }
                val reads = body.count { readsBgSecondary(it) }
                if (strength && reads == 2) shades += classDef to method
            }
        }
        val (shadeClass, shadeMethod) = shades.singleOrNull()
            ?: throw PatchException("Expected one background shade, found ${shades.size}")
        mutableClassDefBy(shadeClass).methods.single {
            it.name == shadeMethod.name && it.parameterTypes == shadeMethod.parameterTypes && it.returnType == "V"
        }.apply {
            instructions.withIndex().filter { readsBgSecondary(it.value) }.map { it.index }.reversed().forEach { index ->
                val result = getInstruction(index + 1)
                if (result.opcode != Opcode.MOVE_RESULT_WIDE) throw PatchException("Unexpected background shade")
                val register = (result as OneRegisterInstruction).registerA
                addInstructions(
                    index + 2,
                    """
                        invoke-static/range { v$register .. v${register + 1} }, $AMOLED->shade(J)J
                        move-result-wide v$register
                    """,
                )
            }
        }

        // The bottom bar (behind Play and the tabs) is drawn in the gray900 token at 95 %, read
        // straight from the tokens instead of the scheme: black.
        val grays = mutableSetOf<String>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("Lcom/chess/designsystem/tokens/")) return@classDefForEach
            val code = classDef.methods.singleOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList()
                ?: return@classDefForEach
            code.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.CONST_WIDE || (instruction as WideLiteralInstruction).wideLiteral != GRAY_900) return@forEachIndexed
                val store = code.getOrNull(index + 3) ?: return@forEachIndexed
                if (store.opcode == Opcode.SPUT_WIDE) {
                    val field = (store as ReferenceInstruction).reference as FieldReference
                    grays += field.definingClass + "->" + field.name
                }
            }
        }
        fun barReads(code: List<Instruction>) = code.indices.filter { index ->
            val field = (code[index] as? ReferenceInstruction)?.reference as? FieldReference
            val strength = code.getOrNull(index + 1)
            code[index].opcode == Opcode.SGET_WIDE && field != null && field.definingClass + "->" + field.name in grays &&
                strength?.opcode == Opcode.CONST && (strength as NarrowLiteralInstruction).narrowLiteral == BAR_ALPHA
        }
        val bars = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val code = method.implementation?.instructions?.toList() ?: return@forEach
                repeat(barReads(code).size) { bars += classDef to method }
            }
        }
        val (barClass, barMethod) = bars.singleOrNull()
            ?: throw PatchException("Expected one bottom bar color, found ${bars.size}")
        mutableClassDefBy(barClass).methods.single {
            it.name == barMethod.name && it.parameterTypes == barMethod.parameterTypes && it.returnType == barMethod.returnType
        }.apply {
            val barIndex = barReads(instructions.toList()).single()
            val register = getInstruction<OneRegisterInstruction>(barIndex).registerA
            addInstructions(
                barIndex + 1,
                """
                    invoke-static/range { v$register .. v${register + 1} }, $AMOLED->bar(J)J
                    move-result-wide v$register
                """,
            )
        }

        // The theme background drawn behind the screens (a picture or a colour): black. R8 made it
        // static, with the manager as an extra first parameter.
        mutableClassDefBy("Lcom/chess/themes/ThemeBackgroundManagerImpl;").methods.single {
            it.returnType == "Landroid/graphics/drawable/Drawable;" &&
                it.parameterTypes.map { type -> type.toString() }.takeLast(2) ==
                listOf("Lcom/chess/themes/CurrentTheme\$Background;", "Landroid/content/Context;")
        }.apply {
            instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }.reversed()
                .forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstructions(
                        index,
                        """
                            invoke-static/range { v$register .. v$register }, $AMOLED->background(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
                            move-result-object v$register
                        """,
                    )
                }
        }
    }
}
