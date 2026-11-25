package app.aliexpress.patches.media

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The full-screen image viewers (`module/picview`: PicViewActivity, PicViewFragment,
 * PicViewDetailDescFragment, PicViewEvaluationFragment) read a `hideSaveButton` intent extra /
 * fragment argument and hide their "Save" button when the opener sets it (e.g. some product
 * description and review images). Each read is
 * `const-string "hideSaveButton"` → `Bundle.getBoolean` / `Intent.getBooleanExtra` → `move-result vX`;
 * the patch forces vX to false right after.
 *
 * The original patch stubbed `sku/custom/data/vm/b.onBusinessResult` (matched on a
 * `FileServerUploadResult` cast string), which dropped the custom-SKU data result instead.
 */
private const val PICVIEW_PACKAGE = "Lcom/aliexpress/module/picview/"
private const val HIDE_SAVE_BUTTON = "hideSaveButton"
private val BOOLEAN_GETTERS = setOf("getBoolean", "getBooleanExtra")

@Suppress("unused")
val enableImageSavingPatch = bytecodePatch(
    name = "Enable image saving",
    description = "Always shows the Save button in the full-screen product and review image viewer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        var patched = 0

        getAllClassesWithString(HIDE_SAVE_BUTTON)
            .filter { it.type.startsWith(PICVIEW_PACKAGE) }
            .forEach { classDef ->
                mutableClassDefBy(classDef).methods.forEach methods@{ method ->
                    val instructions = method.implementation?.instructions?.toList() ?: return@methods

                    // Indexes of the `move-result` after each hideSaveButton boolean read.
                    // Reversed, so inserting after one does not shift the ones still to patch.
                    instructions.indices.filter { index ->
                        val instruction = instructions[index]
                        if (instruction.opcode != Opcode.CONST_STRING &&
                            instruction.opcode != Opcode.CONST_STRING_JUMBO
                        ) return@filter false
                        val string = ((instruction as ReferenceInstruction).reference as StringReference).string
                        if (string != HIDE_SAVE_BUTTON) return@filter false

                        val call = instructions.getOrNull(index + 1) as? ReferenceInstruction
                        val getter = call?.reference as? MethodReference
                        getter != null && getter.name in BOOLEAN_GETTERS && getter.returnType == "Z" &&
                            instructions.getOrNull(index + 2)?.opcode == Opcode.MOVE_RESULT
                    }.map { it + 2 }.reversed().forEach { moveResultIndex ->
                        val register = (instructions[moveResultIndex] as OneRegisterInstruction).registerA
                        // const/16 takes an 8-bit register (PicViewActivity reads into v18).
                        method.addInstruction(moveResultIndex + 1, "const/16 v$register, 0x0")
                        patched++
                    }
                }
            }

        if (patched == 0) throw PatchException("AliExpress: no hideSaveButton reads found.")
    }
}
