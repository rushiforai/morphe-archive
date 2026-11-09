/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.downloadspeed

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val DOWNLOAD_MANAGER = "$EXTENSION_PACKAGE/misc/DownloadManager;"
private const val FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"
private const val PRIORITY_QUEUE = "Lorg/telegram/messenger/FileLoaderPriorityQueue;"
private const val SMALL_QUEUES = "$FILE_LOADER->smallFilesQueue:[$PRIORITY_QUEUE"
private const val LARGE_QUEUES = "$FILE_LOADER->largeFilesQueue:[$PRIORITY_QUEUE"
private const val SMALL_LIMIT = "Lorg/telegram/messenger/MessagesController;->smallQueueMaxActiveOperations:I"
private const val LARGE_LIMIT = "Lorg/telegram/messenger/MessagesController;->largeQueueMaxActiveOperations:I"

/** Why this build's queues can't be held to one download. */
private class Unqueued(val why: String) : Exception(why)

private fun need(ok: Boolean, why: String) {
    if (!ok) throw Unqueued(why)
}

/**
 * Where a new download picks its queue, and where a queue reads how many files it may run. [missing]
 * is why this build can't, and then nothing is edited.
 */
internal class DownloadManagerPlan(
    internal val pick: MutableMethod?,
    internal val pickAt: Int,
    private val queue: Int,
    private val scratch: Int,
    private val loader: Int,
    internal val count: MutableMethod?,
    internal val countAt: Int,
    private val countRegister: Int,
    val missing: String?,
) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        if (missing != null) return
        into(pick!!).addInstructionsAtControlFlowLabel(pickAt, """
            invoke-static {}, $DOWNLOAD_MANAGER->merge()I
            move-result v$scratch
            if-eqz v$scratch, :hush_own_queue
            iget-object v$scratch, v$loader, $LARGE_QUEUES
            const/4 v$queue, 0x0
            aget-object v$queue, v$scratch, v$queue
            :hush_own_queue
            nop
        """)
        into(count!!).addInstructionsAtControlFlowLabel(countAt, """
            invoke-static/range {v$countRegister .. v$countRegister}, $DOWNLOAD_MANAGER->limit(I)I
            move-result v$countRegister
        """)
    }

    /** The same edits on copies, so a smali or register problem refuses before the app is touched. */
    fun rehearse() = apply { MutableMethod(ImmutableMethod.of(it)) }

    companion object {
        fun missing(why: String) = DownloadManagerPlan(null, 0, 0, 0, 0, null, 0, 0, why)
    }
}

/** The runtime the hooks call. It's the extension's own, so a change there refuses whatever this build holds. */
internal fun BytecodePatchContext.requireDownloadManagerRuntime() {
    requireStatusMethod("downloadManager")
    controlHook(DOWNLOAD_MANAGER, "merge", listOf(), "I")
    controlHook(DOWNLOAD_MANAGER, "limit", listOf("I"), "I")
}

/**
 * FileLoader.loadFileInternal reads smallFilesQueue or largeFilesQueue by data center into one
 * register, and both ways meet at one instruction: the small way falls into it and the large way
 * jumps to it. The meeting point is where the queue is replaced, with the large queue of the first
 * data center, so every download of the account lands in one queue. The register that held the
 * array is a scratch there and must be dead.
 *
 * FileLoaderPriorityQueue.checkLoadingOperationInternal reads the queue's limit from
 * MessagesController into one register, large queue by a jump and small by falling through, and the
 * join is where the limit is replaced by 1.
 */
internal fun BytecodePatchContext.resolveDownloadManager(): DownloadManagerPlan = try {
    plan()
} catch (unqueued: Unqueued) {
    DownloadManagerPlan.missing(unqueued.why)
}

private fun BytecodePatchContext.plan(): DownloadManagerPlan {
    val loader = tgMutableClassDefByOrNull(FILE_LOADER)
    val queue = tgMutableClassDefByOrNull(PRIORITY_QUEUE)
    need(loader != null && queue != null, "Telegram's download queues are missing")
    val load = loader!!.methods.filter { it.origName == "loadFileInternal" && it.origReturnType == "Lorg/telegram/messenger/FileLoadOperation;" && it.implementation != null }
    need(load.size == 1, "FileLoader.loadFileInternal is missing or ambiguous")
    val pick = load.single()
    val body = pick.controlBody()
    val flow = ControlFlow.of(pick)
    val small = body.indices.filter { body[it].opcode == Opcode.IGET_OBJECT && body[it].controlRef() == SMALL_QUEUES }
    val large = body.indices.filter { body[it].opcode == Opcode.IGET_OBJECT && body[it].controlRef() == LARGE_QUEUES }
    need(small.size == 1 && large.size == 1, "FileLoader.loadFileInternal no longer reads the small and the large queue once each")
    val s = small.single()
    val l = large.single()
    val smallGet = body.getOrNull(s + 1)
    val largeGet = body.getOrNull(l + 1)
    need(smallGet?.opcode == Opcode.AGET_OBJECT && largeGet?.opcode == Opcode.AGET_OBJECT,
        "FileLoader.loadFileInternal no longer picks the queue by data center")
    val smallRead = body[s] as TwoRegisterInstruction
    val largeRead = body[l] as TwoRegisterInstruction
    val smallPick = smallGet as ThreeRegisterInstruction
    val largePick = largeGet as ThreeRegisterInstruction
    val scratch = smallRead.registerA
    val chosen = smallPick.registerA
    val self = smallRead.registerB
    need(largeRead.registerA == scratch && largePick.registerB == scratch && smallPick.registerB == scratch &&
        largePick.registerA == chosen && largeRead.registerB == self,
        "FileLoader.loadFileInternal reads the two queues through different registers")
    val join = s + 2
    val jump = body.getOrNull(l + 2)
    need(jump != null && jump.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32) &&
        flow.normal[l + 2].toSet() == setOf(join), "the small and large queue ways no longer meet in one place")
    need(body[join].namedRegisters().contains(chosen), "the queue is no longer used where the two ways meet")
    need(maxOf(scratch, chosen, self) <= 15, "the queue registers moved past the short instruction forms")
    need(scratch !in RegisterLiveness.of(pick).liveInto(join), "the register that held the queue array is still in use after it")
    need(chosen != self && chosen != scratch, "the queue registers overlap")

    val check = queueCounters(queue!!)
    need(check.size == 1, "FileLoaderPriorityQueue.checkLoadingOperationInternal is missing or ambiguous")
    val count = check.single()
    val countBody = count.controlBody()
    val countFlow = ControlFlow.of(count)
    val largeLimit = countBody.indices.filter { countBody[it].opcode == Opcode.IGET && countBody[it].controlRef() == LARGE_LIMIT }
    val smallLimit = countBody.indices.filter { countBody[it].opcode == Opcode.IGET && countBody[it].controlRef() == SMALL_LIMIT }
    need(largeLimit.size == 1 && smallLimit.size == 1, "the queue's limit is no longer read once for each queue")
    val big = largeLimit.single()
    val little = smallLimit.single()
    val limit = (countBody[little] as TwoRegisterInstruction).registerA
    val countJoin = little + 1
    need((countBody[big] as TwoRegisterInstruction).registerA == limit && countBody.getOrNull(big + 1)?.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32) &&
        countFlow.normal[big + 1].toSet() == setOf(countJoin), "the two limits no longer meet in one place")
    need(limit <= 15, "the limit register moved past the short instruction forms")
    return DownloadManagerPlan(pick, join, chosen, scratch, self, count, countJoin, limit, null)
}

/**
 * Where the queue counts its running files: checkLoadingOperationInternal, or, where R8 folded that
 * into the runnable checkLoadingOperations(boolean) runs (13.2), that runnable's run(), which reads
 * the limits. A run() reading neither limit belongs to some other class R8 merged in, so it's skipped.
 */
internal fun BytecodePatchContext.queueCounters(queue: MutableClass): List<MutableMethod> {
    val named = queue.methods.filter {
        it.origName == "checkLoadingOperationInternal" && it.parameterTypes.isEmpty() && it.origReturnType == "V" && it.implementation != null
    }
    if (named.isNotEmpty()) return named
    val runners = queue.methods.filter { method ->
        method.origName == "checkLoadingOperations" && method.parameterTypes.map(CharSequence::toString) == listOf("Z") && method.implementation != null
    }
    val owners = runners.flatMap { method ->
        method.controlBody().mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
            .filter { it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V" && it.definingClass != "Ljava/lang/Runnable;" }
            .map { it.definingClass }
    }.toSet()
    val names = TelegramNames.of(this)
    return owners.mapNotNull { tgMutableClassDefByOrNull(names.origType(it)) }.flatMap { owner ->
        owner.methods.filter { method ->
            method.name == "run" && method.parameterTypes.isEmpty() && method.returnType == "V" && method.implementation != null &&
                method.controlBody().any { it.controlRef() == SMALL_LIMIT || it.controlRef() == LARGE_LIMIT }
        }
    }
}
