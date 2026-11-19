package app.ahmedyarub.patches.x.premium

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private object QueuedToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Queued(undoUntil="),
)

private object UploadJobToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UploadJob(id="),
)

/**
 * The upload pipeline still holds a queued post until its undo window ends, and the upload banner
 * still offers Undo meanwhile, but the job is always queued with no window. This gives it one.
 */
@Suppress("unused")
val undoPostsPatch = bytecodePatch(
    name = "Enable Undo Posts",
    description = "Holds each post for a few seconds before sending it, so it can be undone.",
) {
    compatibleWith(COMPATIBILITY_X)

    val seconds by intOption(
        key = "undoSeconds",
        default = 10,
        title = "Undo period",
        description = "Seconds a post waits before it is sent.",
        required = true,
    )

    execute {
        val delay = seconds!!
        if (delay !in 1..60) throw PatchException("The undo period must be 1 to 60 seconds")

        val queued = QueuedToStringFingerprint.classDef.type
        val uploadJob = UploadJobToStringFingerprint.classDef.type

        fun createsJob(method: com.android.tools.smali.dexlib2.iface.Method) =
            method.implementation?.instructions?.let { instructions ->
                instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == queued } &&
                    instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == uploadJob }
            } == true

        mutableClassDefBy(classDefBy { classDef -> classDef.methods.any(::createsJob) }).methods.single(::createsJob).apply {
            // The job is queued as new Queued(null): a const 0 handed to its constructor.
            val create = instructions.first { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == queued }
            val noWindow = instructions[create.location.index + 1]
            if (noWindow.opcode != Opcode.CONST_4 || (noWindow as NarrowLiteralInstruction).narrowLiteral != 0) {
                throw PatchException("The post is not queued without an undo window")
            }
            val window = (noWindow as OneRegisterInstruction).registerA

            // Its expiry is the creation time plus a duration, just before; the window is made the
            // same way, from the same time, in the same registers, which are free by then.
            val expiry = instructions.last { instruction ->
                instruction.location.index < create.location.index && instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    instruction.getReference<MethodReference>()?.let {
                        it.definingClass == "Lkotlin/time/Instant;" && it.parameterTypes.map { type -> type.toString() } == listOf("J")
                    } == true
            } as FiveRegisterInstruction
            val plus = expiry.getReference<MethodReference>()!!
            val now = expiry.registerC
            val durationLow = expiry.registerD
            if (maxOf(now, durationLow + 1, window) > 15) throw PatchException("The post job keeps its times above v15")

            // A kotlin.time.Duration is its nanoseconds shifted left by one.
            val duration = delay * 1_000_000_000L shl 1

            val index = noWindow.location.index
            replaceInstruction(index, "const-wide v$durationLow, ${duration}L")
            addInstructions(
                index + 1,
                """
                invoke-virtual { v$now, v$durationLow, v${durationLow + 1} }, ${plus.definingClass}->${plus.name}(J)${plus.returnType}
                move-result-object v$window
                """,
            )

            // The app reuses that null for another type after the job is queued, so it is put
            // back once the window is handed over.
            val queuedWithWindow = instructions.first { instruction ->
                instruction.location.index > index && instruction.opcode == Opcode.INVOKE_DIRECT &&
                    instruction.getReference<MethodReference>()?.let { it.definingClass == queued && it.name == "<init>" } == true
            }.location.index
            addInstructions(queuedWithWindow + 1, "const/4 v$window, 0x0")
        }
    }
}
