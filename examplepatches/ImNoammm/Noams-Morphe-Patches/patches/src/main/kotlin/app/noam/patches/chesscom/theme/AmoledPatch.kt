package app.noam.patches.chesscom.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val AMOLED = "${Constants.EXTENSION_PACKAGE}/theme/Amoled;"
private const val DARK_SCHEME = "Lcom/chess/designsystem/tokens/StandardChessComColorScheme\$DARK_MODE;"
/** 0.3f, the strength of the redesign's background shade. */
private const val SHADE_ALPHA = 0x3e99999a

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
    description = "Pure black backgrounds instead of chess.com's dark grey, in the newer and the " +
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
        if (missing.isNotEmpty()) throw PatchException("Dark scheme colours not found: $missing")

        // The redesigned screens shade their background from the top: bgSecondary at 30 %
        // fading out, drawn over the theme background. Over black that is a grey haze; skip it.
        val bgSecondary = mutableClassDefBy(DARK_SCHEME).methods.single { method ->
            val first = method.implementation?.instructions?.firstOrNull() ?: return@single false
            method.parameterTypes.isEmpty() && method.returnType == "J" && first.opcode == Opcode.IGET_WIDE &&
                ((first as ReferenceInstruction).reference as FieldReference).name == "bgSecondary"
        }.name
        val shades = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("Lcom/chess/palette/core/modifier/")) return@classDefForEach
            classDef.methods.forEach { method ->
                if (method.returnType != "V" || method.parameterTypes.size != 1) return@forEach
                val body = method.implementation?.instructions ?: return@forEach
                val strength = body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == SHADE_ALPHA }
                val reads = body.count {
                    val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                    reference != null && reference.name == bgSecondary && reference.returnType == "J" &&
                        reference.parameterTypes.isEmpty() && reference.definingClass.startsWith("Lcom/chess/designsystem/tokens/")
                }
                if (strength && reads == 2) shades += classDef to method
            }
        }
        val (shadeClass, shadeMethod) = shades.singleOrNull()
            ?: throw PatchException("Expected one background shade, found ${shades.size}")
        mutableClassDefBy(shadeClass).methods.single {
            it.name == shadeMethod.name && it.parameterTypes == shadeMethod.parameterTypes && it.returnType == "V"
        }.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $AMOLED->enabled()Z
                    move-result v0
                    if-eqz v0, :morphe_shade
                    return-void
                """,
                ExternalLabel("morphe_shade", getInstruction(0)),
            )
        }

        // The theme background drawn behind the screens (a picture or a colour): black.
        mutableClassDefBy("Lcom/chess/themes/ThemeBackgroundManagerImpl;").methods.single {
            it.returnType == "Landroid/graphics/drawable/Drawable;" &&
                it.parameterTypes.map { type -> type.toString() } ==
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
