package app.syncit.patches.sync.scores

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.syncit.patches.sync.Constants.SYNC_FOR_REDDIT
import app.syncit.patches.sync.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/syncit/extension/ScoreColorPatch;"

@Suppress("unused")
val commentScoreColorPatch = patch(
    name = "Color comment scores",
    description = "Colors a comment's score number orange when positive and purple when negative. " +
            "The more points a comment has, the stronger the color. The word points keeps the normal " +
            "text color. Hidden scores are left alone."
) {
    compatibleWith(SYNC_FOR_REDDIT)

    dependsOn(sharedExtensionPatch)

    execute {
        val method = commentScoreFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        // The score is built as "<n> point" or "<n> points" and appended as one piece.
        val pointsText = instructions.indexOfFirst { instruction ->
            instruction.getReference<StringReference>()?.string == " point"
        }
        check(pointsText >= 0) { "Could not find where the comment score is built." }

        val appendIndex = (pointsText + 1 until instructions.size).firstOrNull { index ->
            val reference = instructions[index].getReference<MethodReference>()
            reference?.definingClass == "Loc/c;" &&
                    reference.name == "b" &&
                    reference.parameterTypes == listOf("Ljava/lang/CharSequence;")
        } ?: error("Could not find where the comment score is appended.")

        val builderRegister =
            (instructions[appendIndex] as FiveRegisterInstruction).registerC

        // The score starts where the builder was before the score text was appended.
        val startCall = (pointsText - 1 downTo 0).firstOrNull { index ->
            val reference = instructions[index].getReference<MethodReference>()
            reference?.definingClass == "Loc/c;" &&
                    reference.name == "n" &&
                    reference.parameterTypes.isEmpty() &&
                    reference.returnType == "I"
        } ?: error("Could not find where the comment score's start index was read.")

        val startResult = instructions[startCall + 1]
        check(startResult.opcode == Opcode.MOVE_RESULT) {
            "The builder position read is not followed by its result."
        }
        val startRegister = (startResult as OneRegisterInstruction).registerA

        // v3 holds the score text until it is appended; the controversial marker check reuses
        // it afterwards, so it is free here.
        method.addInstructions(
            appendIndex + 1,
            """
                invoke-virtual/range { p3 .. p3 }, Lxa/d;->L0()I
                move-result v3
                invoke-static { v$builderRegister, v$startRegister, v3 }, $EXTENSION_CLASS_DESCRIPTOR->apply(Loc/c;II)V
            """
        )
    }
}
