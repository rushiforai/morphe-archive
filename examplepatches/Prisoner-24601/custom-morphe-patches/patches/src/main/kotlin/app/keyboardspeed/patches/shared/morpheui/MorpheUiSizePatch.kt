package app.keyboardspeed.patches.shared.morpheui

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_REDDIT
import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/keyboardspeed/extension/MorpheUiSizePatch;"

/**
 * The size utilities of the Morphe extensions, which convert dp to pixels.
 */
private const val DIM_CLASS = "Lapp/morphe/extension/shared/ui/Dim;"

private const val MORPHE_EXTENSION_PACKAGE = "Lapp/morphe/extension/"

private val DP_FIELD_NAME = Regex("dp(\\d+)")

@Suppress("unused")
val morpheUiSizePatch = bytecodePatch(
    name = "Morphe UI size on monitors",
    description = "Fixes the size of the buttons and dialogs that the Morphe patches add, such as the search " +
        "button of the comments, on a monitor such as with Samsung DeX, where they are otherwise much too big.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE, COMPATIBILITY_REDDIT)

    extendWith("extensions/extension.mpe")

    // The Morphe patches can be executed after this patch, so their code is changed in finalize.
    finalize {
        val logger = Logger.getLogger(this::class.java.name)
        val dim = mutableClassDefByOrNull(DIM_CLASS)
        if (dim == null) {
            logger.warning("Morphe size utilities not found, nothing to change")
            return@finalize
        }

        // Dim converts with the display metrics of the screen of the phone (Resources.getSystem()).
        // Use the display metrics of the screen the app is on instead.
        val getMetrics = dim.methods.first {
            it.name == "getMetrics" && it.parameterTypes.isEmpty() && it.returnType == "Landroid/util/DisplayMetrics;"
        }
        getMetrics.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->getDisplayMetrics()Landroid/util/DisplayMetrics;
                move-result-object v0
                if-eqz v0, :system
                return-object v0
            """,
            ExternalLabel("system", getMetrics.getInstruction(0)),
        )

        // The common sizes (Dim.dp48 and so on) are converted once, on the screen the app was on at the time.
        // Convert them each time they are used instead, with Dim.dp(float).
        val hasDpMethod = dim.methods.any {
            it.name == "dp" && it.parameterTypes.map { type -> type.toString() } == listOf("F") && it.returnType == "I"
        }
        if (!hasDpMethod) {
            logger.warning("Dim.dp(float) not found, the common sizes are not changed")
            return@finalize
        }
        val dpFieldValues = dim.fields
            .filter { it.type == "I" }
            .mapNotNull { field -> DP_FIELD_NAME.matchEntire(field.name)?.let { field.name to it.groupValues[1].toInt() } }
            .toMap()

        fun Instruction.dpFieldValue(): Int? {
            if (opcode != Opcode.SGET) return null
            val field = (this as ReferenceInstruction).reference as FieldReference
            return if (field.definingClass == DIM_CLASS) dpFieldValues[field.name] else null
        }

        val classesUsingDp = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(MORPHE_EXTENSION_PACKAGE) && classDef.type != DIM_CLASS &&
                classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.dpFieldValue() != null } == true
                }
            ) {
                classesUsingDp += classDef
            }
        }

        var changed = 0
        classesUsingDp.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                implementation.instructions
                    .mapIndexedNotNull { index, instruction -> instruction.dpFieldValue()?.let { index to it } }
                    .reversed()
                    .forEach { (index, dp) ->
                        val register = method.getInstruction<OneRegisterInstruction>(index).registerA
                        method.replaceInstruction(index, "const v$register, ${java.lang.Float.floatToIntBits(dp.toFloat())}")
                        method.addInstructions(
                            index + 1,
                            """
                                invoke-static/range { v$register .. v$register }, $DIM_CLASS->dp(F)I
                                move-result v$register
                            """,
                        )
                        changed++
                    }
            }
        }
        logger.info("Morphe UI sizes converted on the screen of the app: $changed uses")
    }
}
