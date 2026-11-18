// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.layout.hidegfycatpreviews

import app.edbfi.patches.shared.string
import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val hideGfycatPreviewsPatch =
    patch(
        name = "Hide Gfycat link previews",
        description = "Hides the blank previews of Gfycat links in comments and posts. Gfycat shut down in 2023.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)

        execute {
            val isGfycat = IsGfycatFingerprint.matchSingle().originalMethod
            val method = LinkPreviewFingerprint(isGfycat).matchSingle().method
            val code = method.instructions
            // The last test before the preview: link.contains("tenor.com") turns it on. Then `if-eqz preview, :skip`.
            val tenor = code.indices.singleOrNull { code[it].string == "tenor.com" }
                ?: throw PatchException("Expected one \"tenor.com\" literal in ${method.name}")
            val contains = code.getOrNull(tenor + 1)
            val containsReference = contains?.getReference<MethodReference>()
            if (contains?.opcode != Opcode.INVOKE_VIRTUAL || containsReference?.name != "contains" || containsReference.definingClass != "Ljava/lang/String;") {
                throw PatchException("The \"tenor.com\" literal isn't tested with String.contains in ${method.name}")
            }
            val link = (contains as FiveRegisterInstruction).registerC
            val tenorRead = code.getOrNull(tenor + 2)
            if (tenorRead?.opcode != Opcode.MOVE_RESULT) throw PatchException("The \"tenor.com\" test's result isn't read in ${method.name}")
            val tenorResult = (tenorRead as OneRegisterInstruction).registerA
            val decision = (tenor + 3 until code.size).firstOrNull {
                code[it].opcode == Opcode.IF_EQZ && (code[it] as OneRegisterInstruction).registerA != tenorResult
            } ?: throw PatchException("No preview decision follows the \"tenor.com\" test in ${method.name}")
            val preview = (code[decision] as OneRegisterInstruction).registerA
            val skip = (code[decision] as BuilderOffsetInstruction).target.location.instruction
                ?: throw PatchException("The preview decision in ${method.name} has no target")
            val next = decision + 1
            // The preview: new nb.d(link, index), built right after the decision.
            val builds = (next until minOf(next + 8, code.size)).any {
                val reference = code[it].getReference<MethodReference>()
                code[it].opcode == Opcode.INVOKE_DIRECT && reference?.name == "<init>" &&
                    reference.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/Integer;")
            }
            if (!builds) throw PatchException("The preview decision in ${method.name} doesn't build a preview")
            if (code[next].location.labels.isNotEmpty()) throw PatchException("A branch lands after the preview decision in ${method.name}")
            if (preview > 255 || link > 15) throw PatchException("The preview decision's registers are out of range in ${method.name}")

            // A Gfycat link's preview can only fail: skip it, leaving the decision false as the app would.
            method.addInstructionsWithLabels(
                next,
                """
                    invoke-static { v$link }, ${isGfycat.definingClass}->${isGfycat.name}(Ljava/lang/String;)Z
                    move-result v$preview
                    xor-int/lit8 v$preview, v$preview, 0x1
                    if-eqz v$preview, :no_preview
                """,
                ExternalLabel("no_preview", skip),
            )
        }
    }
