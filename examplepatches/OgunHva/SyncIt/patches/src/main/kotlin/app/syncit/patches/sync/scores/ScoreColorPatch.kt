package app.syncit.patches.sync.scores

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.syncit.patches.sync.Constants.SYNC_FOR_REDDIT
import app.syncit.patches.sync.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/syncit/extension/ScoreColorPatch;"

@Suppress("unused")
val scoreColorPatch = patch(
    name = "Color post scores",
    description = "Colors a post's score number orange when positive and purple when negative. " +
            "The more points a post has, the stronger the color. The word points keeps the normal text color."
) {
    compatibleWith(SYNC_FOR_REDDIT)

    dependsOn(sharedExtensionPatch)

    execute {
        // The post statistics line keeps the score and the post in low registers.
        colorScoreWrites(postStatsFingerprint.method, tempRegister = 1, rangeInvoke = false)

        // The post header keeps them in high parameter registers, so the score is read with
        // a range invoke.
        colorScoreWrites(postHeaderFingerprint.method, tempRegister = 3, rangeInvoke = true)
    }
}

/**
 * Adds a color span over every score text [method] appends to its builder.
 *
 * The score view code writes the formatted score, then places its own span over it when the post
 * has been voted on. The span added here comes first, so a vote color still wins; otherwise the
 * score is colored by its value.
 */
private fun colorScoreWrites(
    method: MutableMethod,
    tempRegister: Int,
    rangeInvoke: Boolean,
) {
    val instructions = method.implementation!!.instructions.toList()

    val scoreWrites = instructions.withIndex().filter { (_, instruction) ->
        val reference = instruction.getReference<MethodReference>()
        reference?.definingClass == "Lt7/e0;" &&
                (reference.name == "a" || reference.name == "c") &&
                reference.parameterTypes == listOf("I") &&
                reference.returnType == "Ljava/lang/String;"
    }.map { it.index }

    check(scoreWrites.isNotEmpty()) { "Could not find where the score text is formatted." }

    // Last first, so each insertion leaves the earlier indexes untouched.
    for (scoreWrite in scoreWrites.asReversed()) {
        val appendIndex = (scoreWrite + 1 until instructions.size).firstOrNull { index ->
            val reference = instructions[index].getReference<MethodReference>()
            reference?.definingClass == "Loc/c;" &&
                    reference.name == "b" &&
                    reference.parameterTypes == listOf("Ljava/lang/CharSequence;")
        } ?: error("Could not find where the score text is appended.")

        val builderRegister =
            (instructions[appendIndex] as FiveRegisterInstruction).registerC

        // The score's start index is the last builder position read before it was written.
        val startCall = (scoreWrite - 1 downTo 0).firstOrNull { index ->
            val reference = instructions[index].getReference<MethodReference>()
            reference?.definingClass == "Loc/c;" &&
                    reference.name == "n" &&
                    reference.parameterTypes.isEmpty() &&
                    reference.returnType == "I"
        } ?: error("Could not find where the score's start index was read.")

        val startResult = instructions[startCall + 1]
        check(startResult.opcode == Opcode.MOVE_RESULT) {
            "The builder position read is not followed by its result."
        }
        val startRegister = (startResult as OneRegisterInstruction).registerA

        val readScore = if (rangeInvoke) {
            "invoke-virtual/range { p2 .. p2 }, Lxa/d;->L0()I"
        } else {
            "invoke-virtual { p2 }, Lxa/d;->L0()I"
        }

        method.addInstructions(
            appendIndex + 1,
            """
                $readScore
                move-result v$tempRegister
                invoke-static { v$builderRegister, v$startRegister, v$tempRegister }, $EXTENSION_CLASS_DESCRIPTOR->apply(Loc/c;II)V
            """
        )
    }
}
