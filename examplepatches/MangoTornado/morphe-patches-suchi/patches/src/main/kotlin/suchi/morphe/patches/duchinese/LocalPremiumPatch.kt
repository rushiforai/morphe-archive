package suchi.morphe.patches.duchinese

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val subscriptionFingerprint = Fingerprint(
    definingClass = "Lorg/sinamon/duchinese/models/o;",
    name = "M",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("isSubscribed"),
)

private val nextLessonFingerprint = Fingerprint(
    definingClass = "Lec/J;",
    name = "f",
    returnType = "Lec/K;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lorg/sinamon/duchinese/services/media/PlaybackSpeed;",
    ),
    strings = listOf("context"),
)

@Suppress("unused")
val localPremiumPatch = bytecodePatch(
    name = "Enable local Premium controls",
    description = "Overrides Du Chinese's local subscription and next-lesson checks for research. " +
        "Server entitlement and content availability remain unverified.",
    default = false,
) {
    compatibleWith(duChineseCompatibility)

    execute {
        val subscription = subscriptionFingerprint.method
        val nextLesson = nextLessonFingerprint.method
        val instructions = nextLesson.implementation!!.instructions.toList()
        val lockedCalls = instructions.withIndex().filter { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference != null &&
                reference.definingClass == "Lorg/sinamon/duchinese/models/json/ListDocument;" &&
                reference.name == "isLocked" &&
                reference.parameterTypes.isEmpty() &&
                reference.returnType == "Z"
        }
        val lockedCall = lockedCalls.singleOrNull()
            ?: throw PatchException("Du Chinese's next-lesson lock check has changed.")
        val resultIndex = lockedCall.index + 1
        val result = instructions.getOrNull(resultIndex)
        if ((lockedCall.value.opcode != Opcode.INVOKE_VIRTUAL &&
                lockedCall.value.opcode != Opcode.INVOKE_VIRTUAL_RANGE) ||
            result?.opcode != Opcode.MOVE_RESULT
        ) {
            throw PatchException("Du Chinese's next-lesson lock result has changed.")
        }

        subscription.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        nextLesson.replaceInstruction(
            resultIndex,
            BuilderInstruction21s(Opcode.CONST_16, (result as OneRegisterInstruction).registerA, 0),
        )
    }
}
