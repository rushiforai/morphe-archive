package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Fix picture-in-picture.
//
// YouTube TV works out its picture-in-picture shape from the player layout.
// While the player controls show, the layout gives a wider shape than 16:9,
// and each resize changes the layout again, so the window flips between the
// two shapes for several seconds after it shrinks, until the controls hide.
//
// Every call in the app to Activity.setPictureInPictureParams and
// Activity.enterPictureInPictureMode(params) now goes through
// YttvPictureInPicture, which sends the same settings with a 16:9 shape.
// ─────────────────────────────────────────────────────────────────────────────

private const val PIP = "Lsemicoloncolonel/mobilestream/extension/yttv/YttvPictureInPicture;"
private const val PARAMS = "Landroid/app/PictureInPictureParams;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"

private val Instruction.pipCall: String?
    get() {
        if (opcode != Opcode.INVOKE_VIRTUAL) return null
        val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
        if (reference.definingClass != "Landroid/app/Activity;" ||
            reference.parameterTypes.map { it.toString() } != listOf(PARAMS)
        ) {
            return null
        }
        return when (reference.name) {
            "setPictureInPictureParams" -> "setParams(Landroid/app/Activity;$PARAMS)V"
            "enterPictureInPictureMode" -> "enter(Landroid/app/Activity;$PARAMS)Z"
            else -> null
        }
    }

@Suppress("unused")
val fixPictureInPicturePatch = bytecodePatch(
    name = "Fix picture-in-picture",
    description = "Keeps the picture-in-picture window at the video's shape, so it does not flicker between sizes.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // Collect first, mutate after: mutableClassDefBy swaps the class map
        // entry, which must not happen mid-iteration.
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(EXTENSION_PACKAGE) &&
                classDef.methods.any { method -> method.implementation?.instructions?.any { it.pipCall != null } == true }
            ) {
                targets += classDef.type
            }
        }

        var replaced = 0
        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val call = instruction.pipCall ?: return@forEachIndexed
                    val registers = instruction as FiveRegisterInstruction
                    method.replaceInstruction(
                        index,
                        "invoke-static { v${registers.registerC}, v${registers.registerD} }, $PIP->$call",
                    )
                    replaced++
                }
            }
        }
        if (replaced == 0) throw PatchException("No picture-in-picture calls found")
    }
}
