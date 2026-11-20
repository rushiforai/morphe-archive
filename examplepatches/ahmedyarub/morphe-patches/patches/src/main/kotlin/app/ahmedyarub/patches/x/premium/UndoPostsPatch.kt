package app.ahmedyarub.patches.x.premium

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.logging.Logger

private const val INSTANT = "Lkotlin/time/Instant;"

private object QueuedToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Queued(undoUntil="),
)

private object UploadJobToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UploadJob(id="),
)

/**
 * The upload pipeline holds a queued post until its undo window ends, and the upload banner offers
 * Undo meanwhile. A freshly queued post is built with no window — `Queued(undoUntil = null)` — so
 * it is sent at once with nothing to undo. This gives every queued post a window of a few seconds.
 *
 * The one method that builds both [Queued] and the [UploadJob] wrapping it (the store's row → job
 * mapper) is where the window is decided. Right after the `Queued` instance is created, its
 * `undoUntil` argument register is overwritten with `now + the chosen delay`, before the
 * constructor consumes it — so the window is set the same way on every path, however the mapper
 * arrived at the construction.
 *
 * 12.44 removed the undo window from the upload pipeline: `Queued` became a plain object, the post
 * command lost its undo period, and the banner lost its Undo action. There it leaves the app
 * unchanged. It keeps the versions every X patch declares, which the bundle requires of one app.
 */
@Suppress("unused")
val undoPostsPatch = bytecodePatch(
    name = "Enable Undo Posts",
    description = "Holds each post for a few seconds before sending it, so it can be undone (X 12.43 and older).",
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

        // From 12.44 Queued has no undo window to extend.
        val queuedClass = QueuedToStringFingerprint.classDefOrNull ?: run {
            Logger.getLogger("UndoPostsPatch").warning("This X has no undo window (12.44 and later); Undo Posts changes nothing")
            return@execute
        }
        val queued = queuedClass.type
        val uploadJob = UploadJobToStringFingerprint.classDef.type

        fun Instruction.isFromEpochMilliseconds() =
            opcode == Opcode.INVOKE_STATIC &&
                getReference<MethodReference>()?.let {
                    it.definingClass == "Lkotlin/time/Instant\$Companion;" &&
                        it.parameterTypes.map { type -> type.toString() } == listOf("J") &&
                        it.returnType == INSTANT
                } == true

        // Two methods build both Queued and its UploadJob: the composer's enqueue command and the
        // store's row → job mapper. Only the mapper turns a stored millisecond undo time into an
        // Instant, so requiring that call selects the mapper, the method this patch rewrites.
        fun createsJob(method: Method) =
            method.implementation?.instructions?.let { instructions ->
                instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == queued } &&
                    instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == uploadJob } &&
                    instructions.any { it.isFromEpochMilliseconds() }
            } == true

        // kotlin.time.Instant's two Duration operators (plus and minus) share one shape — (J)Instant
        // — and are obfuscated. minus is implemented by negating and delegating to plus, so plus is
        // the one the other calls; this finds it without depending on the obfuscated name.
        val instantOps = classDefBy { it.type == INSTANT }.methods.filter { method ->
            method.parameterTypes.map { it.toString() } == listOf("J") && method.returnType == INSTANT
        }.toList()
        val plus = instantOps.firstOrNull { candidate ->
            instantOps.any { other ->
                other !== candidate && other.implementation?.instructions?.any { instruction ->
                    instruction.getReference<MethodReference>()?.let { it.definingClass == INSTANT && it.name == candidate.name } == true
                } == true
            }
        } ?: throw PatchException("Could not identify kotlin.time.Instant.plus")

        // A kotlin.time.Duration of the chosen seconds: nanoseconds, left-shifted by one (the unit bit).
        val duration = delay.toLong() * 1_000_000_000L shl 1

        mutableClassDefBy(classDefBy { classDef -> classDef.methods.any(::createsJob) }).methods.single(::createsJob).apply {
            val create = instructions.first {
                it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == queued
            }.location.index

            // Queued(undoUntil: Instant?) — the Instant the constructor receives.
            val constructor = instructions.first { instruction ->
                instruction.location.index > create && instruction.opcode == Opcode.INVOKE_DIRECT &&
                    instruction.getReference<MethodReference>()?.let { it.definingClass == queued && it.name == "<init>" } == true
            }
            val reference = constructor.getReference<MethodReference>()!!
            if (reference.parameterTypes.map { it.toString() } != listOf(INSTANT)) {
                throw PatchException("Queued is no longer constructed from a single Instant")
            }
            val window = (constructor as FiveRegisterInstruction).registerD

            // Instant's millisecond factory, as the app itself calls it in this method; reused so an
            // obfuscated name does not matter.
            val fromEpochMilliseconds = instructions.first { it.isFromEpochMilliseconds() }.getReference<MethodReference>()!!

            // One free pair, reused: first to hold the current time, then the delay to add to it.
            val insertAt = constructor.location.index
            val free = buildList {
                val provider = getFreeRegisterProvider(insertAt, 8)
                while (provider.hasFreeRegisters()) add(provider.getFreeRegister())
            }.sorted()
            val scratch = free.firstOrNull { it != window && it + 1 != window && it + 1 in free }
                ?: throw PatchException("No free register pair for the undo time")
            if (maxOf(scratch + 1, window) > 15) throw PatchException("The queued post keeps its registers above v15")

            addInstructions(
                insertAt,
                """
                invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
                move-result-wide v$scratch
                invoke-static { v$scratch, v${scratch + 1} }, ${fromEpochMilliseconds.definingClass}->${fromEpochMilliseconds.name}(J)$INSTANT
                move-result-object v$window
                const-wide v$scratch, ${duration}L
                invoke-virtual { v$window, v$scratch, v${scratch + 1} }, $INSTANT->${plus.name}(J)$INSTANT
                move-result-object v$window
                """,
            )
        }
    }
}
