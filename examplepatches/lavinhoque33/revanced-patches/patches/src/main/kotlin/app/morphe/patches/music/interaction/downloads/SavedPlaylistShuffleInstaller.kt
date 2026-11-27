/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-26.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.Utils.printWarn
import app.morphe.util.addFreeRegisters
import app.morphe.util.cloneMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val REPLAY = "Lapp/morphe/extension/music/patches/downloads/OfflineReplayHooks;"
private const val LOCAL_QUEUE = $$"Lapp/morphe/extension/music/patches/downloads/OfflineReplay$LocalShuffleQueue;"
internal const val OFFLINE_QUEUE_MODEL = $$"Lapp/morphe/extension/music/patches/downloads/OfflineQueueActions$Queue;"
private const val OWNS_REPLY = "$REPLAY->ownsLocalPlaylistShuffleReply(Ljava/lang/Object;)Z"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/List;"
private const val STRING = "Ljava/lang/String;"
private const val MARKER = "rvxShuffleStart"
private const val CONTINUATION = "rvxShuffleContinuation"
private const val APPLY_SHUFFLE = "rvxApplyLocalShuffle"
private const val RETAIN_SHUFFLE = "rvxRetainLocalShuffle"

private data class ShuffleAbi(
    val queue: String,
    val apply: String,
    val commit: String,
    val shuffle: String,
    val shuffleState: String,
    val rowRequest: String,
    val playlistId: String,
    val foreignCommitOwner: String? = null,
)

private val shuffleAbis = mapOf(
    "9.45.51" to ShuffleAbi("Lhzx;", "v", "K", "y", "Lajtz;", "n", "u", "Lgtr;"),
    "9.40.51" to ShuffleAbi("Liar;", "u", "K", "y", "Lajjj;", "n", "u", "Lgvf;"),
    "9.15.51" to ShuffleAbi("Lnyb;", "u", "z", "B", "Lbnqa;", "n", "t", "Lkdl;"),
    "8.30.54" to ShuffleAbi("Lnko;", "t", "p", "z", "Lbjco;", "l", "t"),
    "8.28.54" to ShuffleAbi("Lnjh;", "s", "p", "y", "Lbiok;", "l", "t"),
    "8.12.54" to ShuffleAbi("Lncl;", "q", "j", "x", "Lbfzr;", "k", "s"),
)

internal class SavedPlaylistShuffle(
    val marker: FieldReference,
    val continuation: FieldReference,
    val install: () -> Unit,
)

/** The stock panel publishes SHUFFLE_ALL; the local shuffle transaction then permutes the committed occurrences. */
internal fun BytecodePatchContext.prepareSavedPlaylistShuffle(
    response: MutableClass, requestType: String, protoType: String,
): SavedPlaylistShuffle? = try {
    val abi = shuffleAbis[packageMetadata.versionName] ?: error("no stock queue ABI for this version")
    val queue = mutableClassDefBy(abi.queue)
    val replyType = response.type
    val apply = queue.methods.single {
        it.name == abi.apply && it.returnType == "V" && it.parameterTypes.firstOrNull() == replyType &&
            it.parameterTypes.size in 1..2 && it.parameterTypes.all { type -> type.startsWith("L") } &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val steps = apply.implementation!!.instructions.toList()
    val commitStep = steps[steps.lastIndex - 1]
    val commit = checkNotNull(commitStep.getReference<MethodReference>()) { "missing queue commit call" }
    val commitCall = commitStep as? FiveRegisterInstruction ?: error("unexpected commit registers")
    val scratch = apply.implementation!!.registerCount
    val receiver = scratch - apply.parameterTypes.size - 1
    check(commitStep.opcode == Opcode.INVOKE_VIRTUAL && steps.last().opcode == Opcode.RETURN_VOID &&
        commit.definingClass == queue.type && commit.name == abi.commit && commit.returnType == "V" &&
        commitCall.registerC == receiver && commitCall.registerCount == commit.parameterTypes.size + 1 &&
        scratch < 15) { "unrecognized queue commit" }

    val stockCommit = queue.methods.single { it.name == commit.name && it.parameterTypes == commit.parameterTypes }
    val stockShuffle = queue.methods.single {
        it.name == abi.shuffle && it.parameterTypes == listOf("Z") && it.returnType == "V"
    }
    val localShuffle = stockShuffle.localShuffleBody()
    val currentIndex = localShuffle.mapNotNull { it.getReference<MethodReference>() }.first {
        it.definingClass == queue.superclass && it.parameterTypes.isEmpty() && it.returnType == "I"
    }
    val primarySize = localShuffle.mapNotNull { it.getReference<MethodReference>() }.first {
        it.definingClass == queue.superclass && it.parameterTypes == listOf("I") && it.returnType == "I"
    }
    val rowMethod = if (commit.parameterTypes.isEmpty()) apply else stockCommit
    val rowSteps = if (rowMethod == apply) steps else stockCommit.implementation!!.instructions.toList()
    val splice = resolveRowSplice(rowMethod, rowSteps, currentIndex, primarySize)
    val currentItem = rowSteps.mapNotNull { it.getReference<MethodReference>() }.distinct().single {
        it.definingClass == queue.superclass && it.parameterTypes == listOf("I", "I") && it.returnType.startsWith("L")
    }
    val descriptor = classDefBy(currentItem.returnType).methods.single {
        it.name == abi.rowRequest && it.parameterTypes.isEmpty() && it.returnType == requestType
    }
    val playlistId = classDefBy(requestType).methods.single {
        it.name == abi.playlistId && it.parameterTypes.isEmpty() && it.returnType == STRING
    }
    val (panelType, panelRegister) = resolveAppliedPanel(apply, steps, receiver, commit, commitCall, protoType)
    val panelId = classDefBy(panelType).fields.single { it.name == "i" && it.type == STRING }
    check(steps.any { it.opcode == Opcode.IGET_BOOLEAN && it.getReference<FieldReference>()?.let { field ->
        field.definingClass == abi.shuffleState && field.name == "c" && field.type == "Z"
    } == true }) { "unrecognized shuffle panel state" }

    val installNativeMatch = prepareNativeShuffleMatch(queue, localShuffle, currentIndex, primarySize, currentItem)
    val installCommit = abi.foreignCommitOwner?.let { owner ->
        prepareModernCommit(owner, queue, stockCommit, splice)
    }
    check((installCommit != null) == (rowMethod != apply)) { "unrecognized queue commit dispatch" }

    val marker = ImmutableField(replyType, MARKER, "Z", AccessFlags.PUBLIC.value, null, emptySet(), emptySet())
    val continuation = ImmutableField(replyType, CONTINUATION, OBJECT, AccessFlags.PUBLIC.value,
        null, emptySet(), emptySet())
    SavedPlaylistShuffle(marker, continuation) {
        installNativeMatch()
        val typedCommit = installCommit?.invoke()
        // A refresh may retain an unrelated current row. The fresh start must own the selected primary occurrence.
        response.instanceFields.add(marker.toMutable())
        response.instanceFields.add(continuation.toMutable())
        queue.addDownloadsBridge(APPLY_SHUFFLE, listOf(replyType, panelType), "V", 6, """
            iget-boolean v0, p1, $marker
            if-eqz v0, :rvx_done
            iget-object v0, p2, $panelId
            if-eqz v0, :rvx_done
            invoke-virtual {p0}, $currentIndex
            move-result v1
            if-nez v1, :rvx_done
            invoke-virtual {p0, v1}, $primarySize
            move-result v2
            if-lez v2, :rvx_done
            invoke-virtual {p0, v1, v1}, $currentItem
            move-result-object v1
            if-eqz v1, :rvx_done
            invoke-interface {v1}, $descriptor
            move-result-object v1
            if-eqz v1, :rvx_done
            invoke-virtual {v1}, $playlistId
            move-result-object v1
            invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :rvx_done
            invoke-static {p1}, $OWNS_REPLY
            move-result v0
            if-eqz v0, :rvx_done
            const/4 v0, 0x0
            iput-boolean v0, p1, $marker
            const/4 v0, 0x1
            invoke-virtual {p0, v0}, $stockShuffle
            invoke-static {p0, p1}, $REPLAY->localPlaylistShuffleApplied($OBJECT$OBJECT)V
            :rvx_done
            return-void
        """)

        // Keep the exact reply alongside the stock-resolved panel, which already survives to the tail.
        val (patched, prefix) = apply.addFreeRegisters(2)
        val token = scratch + 1
        val commitIndex = prefix + steps.lastIndex - 1
        patched.addInstruction(commitIndex + 1,
            "invoke-virtual {v$receiver, v$scratch, v$panelRegister}, " +
                "${queue.type}->$APPLY_SHUFFLE($replyType$panelType)V")

        if (typedCommit != null) {
            patched.replaceInstruction(commitIndex, "iget-object v$token, v$scratch, $continuation")
            patched.addInstruction(commitIndex + 1, commitCall.withContinuation(token, typedCommit))
        } else {
            splice.retain(patched, prefix, token, "iget-object v$token, v$scratch, $continuation")
        }
        val reply = receiver + 1
        patched.addInstructionsWithLabels(prefix, """
            if-eqz v$reply, :rvx_shuffle_stock
            iget-boolean v$scratch, v$reply, $marker
            if-eqz v$scratch, :rvx_shuffle_stock
            invoke-static {v$reply}, $OWNS_REPLY
            move-result v$scratch
            if-nez v$scratch, :rvx_shuffle_stock
            return-void
            :rvx_shuffle_stock
            move-object/from16 v$scratch, v$reply
        """)
    }
} catch (exception: Exception) {
    printWarn("OfflineReplay: saved playlist Shuffle not hooked; launch behavior unchanged: ${exception.message}")
    null
}

/** The stock empty-list edge already rejoins at the metadata tail with no primary mutation. */
private class RowSplice(val receiver: Int, val selected: Int, val entry: Int, val metadata: Int) {
    fun retain(method: MutableMethod, prefix: Int, token: Int, loadToken: String = "") {
        val guard = "${method.definingClass}->$RETAIN_SHUFFLE(${OBJECT}I)I"
        val index = prefix + entry
        method.addInstructionsWithLabels(index, """
            $loadToken
            if-eqz v$token, :rvx_apply_rows
            invoke-virtual {v$receiver, v$token, v$selected}, $guard
            move-result v$token
            if-gtz v$token, :rvx_apply_metadata
            if-eqz v$token, :rvx_apply_rows
            return-void
        """,
            ExternalLabel("rvx_apply_rows", method.getInstruction(index)),
            ExternalLabel("rvx_apply_metadata", method.getInstruction(prefix + metadata)),
        )
    }
}

private fun resolveRowSplice(
    method: Method, steps: List<Instruction>, currentIndex: MethodReference, primarySize: MethodReference,
): RowSplice {
    val receiver = method.implementation!!.registerCount - method.parameterTypes.size - 1
    val cursor = steps.indexOfFirst { it.getReference<MethodReference>() == currentIndex }
    check(cursor >= 14 && method.implementation!!.tryBlocks.isEmpty()) { "unrecognized row install entry" }

    val selectedLoad = steps[cursor - 3] as TwoRegisterInstruction
    val max = steps[cursor - 2] as FiveRegisterInstruction
    val selected = selectedLoad.registerA
    val zero = max.registerC
    val empty = steps[cursor - 10] as BuilderOffsetInstruction
    val metadata = empty.target.location.index
    val zeroProducer = (cursor - 11 downTo 0).first { index ->
        val instruction = steps[index]
        instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.registerA == zero
    }
    val zeroLoad = steps[zeroProducer]
    check(selectedLoad.opcode == Opcode.IGET && selectedLoad.getReference<FieldReference>()?.type == "I" &&
        steps[cursor - 6].branchesTo(Opcode.IF_EQZ, cursor - 3, selected) &&
        max.getReference<MethodReference>()?.toString() == "Ljava/lang/Math;->max(II)I" &&
        max.opcode == Opcode.INVOKE_STATIC && max.registerCount == 2 && max.registerD == selected &&
        steps[cursor - 1].opcode == Opcode.MOVE_RESULT &&
        (steps[cursor - 1] as OneRegisterInstruction).registerA == selected &&
        empty.branchesTo(Opcode.IF_NEZ, metadata, selected) &&
        zeroLoad.opcode == Opcode.CONST_4 && (zeroLoad as NarrowLiteralInstruction).narrowLiteral == 0 &&
        metadata in (cursor + 4) until steps.lastIndex
    ) { "unrecognized row index or empty continuation" }

    val rowsIndex = if (zeroProducer == cursor - 11) cursor - 14 else cursor - 13
    val rows = steps[rowsIndex] as TwoRegisterInstruction
    val emptyCheck = steps[rowsIndex + 1] as FiveRegisterInstruction
    val emptyResult = steps[rowsIndex + 2] as OneRegisterInstruction
    val model = selectedLoad.registerB
    val metadataLoad = steps[metadata] as TwoRegisterInstruction
    val optionalCheck = metadata + if (steps[metadata + 1].opcode == Opcode.CHECK_CAST) 2 else 1
    check(rows.opcode == Opcode.IGET_OBJECT && rows.registerB == model &&
        emptyCheck.getReference<MethodReference>()?.toString() == "$LIST->isEmpty()Z" &&
        emptyCheck.opcode == Opcode.INVOKE_INTERFACE && emptyCheck.registerC == rows.registerA &&
        emptyResult.opcode == Opcode.MOVE_RESULT && emptyResult.registerA == selected &&
        steps[cursor - 9].getReference<MethodReference>()?.toString() == "$LIST->isEmpty()Z" &&
        (steps[cursor] as FiveRegisterInstruction).registerC == receiver &&
        steps.subList(cursor, metadata).any { it.getReference<MethodReference>() == primarySize } &&
        metadataLoad.opcode == Opcode.IGET_OBJECT && metadataLoad.registerB == model &&
        metadataLoad.getReference<FieldReference>()?.let {
            it.definingClass == selectedLoad.getReference<FieldReference>()?.definingClass &&
                it.type in setOf(OBJECT, "Lj\$/util/Optional;")
        } == true &&
        steps[optionalCheck].getReference<MethodReference>()?.toString() == "Lj\$/util/Optional;->isPresent()Z"
    ) { "unrecognized row install or metadata continuation" }

    val selector = steps[metadata - 1] as FiveRegisterInstruction
    val remove = steps[metadata - 2] as FiveRegisterInstruction
    val insert = steps[metadata - 3] as FiveRegisterInstruction
    check(listOf(selector, remove, insert).all {
        it.opcode == Opcode.INVOKE_VIRTUAL && it.registerC == receiver &&
            it.getReference<MethodReference>()?.definingClass == currentIndex.definingClass
    } && selector.registerD == selected &&
        selector.getReference<MethodReference>()?.let {
            it.name in setOf("T", "U", "J", "R") && it.parameterTypes.firstOrNull() == "I" && it.returnType == "V"
        } == true &&
        remove.registerD == zero && remove.getReference<MethodReference>()?.parameterTypes == listOf("I", "I", "I") &&
        insert.registerD == zero &&
        insert.getReference<MethodReference>()?.parameterTypes == listOf("I", "I", "Ljava/util/Collection;")
    ) { "unrecognized primary row mutations" }

    return RowSplice(receiver, selected, cursor - 2, metadata)
}

/** The three modern queue owners each have one other caller, a stock command resolver that has no replay token. */
private fun BytecodePatchContext.prepareModernCommit(
    foreignOwner: String, queue: MutableClass, stock: MutableMethod, splice: RowSplice,
): () -> MethodReference {
    val token = stock.implementation!!.registerCount
    check(stock.parameterTypes.size == 3 && token <= 15) { "unexpected native commit registers" }

    val foreign = mutableClassDefBy(foreignOwner).methods.single { candidate ->
        candidate.name == "c" && candidate.returnType == "V" && candidate.implementation?.instructions?.any {
            it.getReference<MethodReference>() == stock
        } == true
    }
    val foreignSteps = foreign.implementation!!.instructions
    val foreignIndex = foreignSteps.indices.single { foreignSteps[it].getReference<MethodReference>() == stock }
    val foreignCall = foreignSteps[foreignIndex] as FiveRegisterInstruction
    val foreignToken = foreign.implementation!!.registerCount
    check(foreignCall.opcode == Opcode.INVOKE_VIRTUAL && foreignCall.registerCount == 4 && foreignToken <= 15) {
        "unexpected stock command commit registers"
    }

    return {
        // Adding one parameter and one register leaves every original parameter in its original absolute register.
        val typed = stock.cloneMutable(
            registerCount = token + 1,
            parameters = stock.parameters + ImmutableMethodParameter(OBJECT, null, null),
        )
        splice.retain(typed, 0, token)
        queue.methods.remove(stock)
        queue.methods.add(typed)

        val (patched, prefix) = foreign.addFreeRegisters(1)
        val index = prefix + foreignIndex
        patched.replaceInstruction(index, "const/4 v$foreignToken, 0x0")
        patched.addInstruction(index + 1, foreignCall.withContinuation(foreignToken, typed))
        typed
    }
}

private fun FiveRegisterInstruction.withContinuation(token: Int, method: MethodReference): String =
    "invoke-virtual {v$registerC, v$registerD, v$registerE, v$registerF, v$token}, $method"

private fun BytecodePatchContext.prepareNativeShuffleMatch(
    queue: MutableClass, shuffle: List<Instruction>,
    currentIndex: MethodReference, primarySize: MethodReference, currentItem: MethodReference,
): () -> Unit {
    val state = checkNotNull(shuffle[0].getReference<FieldReference>())
    val localType = checkNotNull(shuffle[1].getReference<FieldReference>())
    val baseline = checkNotNull(shuffle[5].getReference<FieldReference>())
    val typeGetter = queue.methods.single {
        it.name == "d" && it.parameterTypes.isEmpty() && it.returnType == localType.type
    }
    val enumClass = classDefBy(localType.type)
    val enumInit = enumClass.methods.single { it.name == "<clinit>" }.implementation!!.instructions.toList()
    val local = enumInit.indexOfFirst { it.getReference<StringReference>()?.string == "SHUFFLE_TYPE_LOCAL" }
    check(shuffle[0].opcode == Opcode.IGET_OBJECT && state.definingClass == queue.type &&
        typeGetter.implementation!!.instructions.first().getReference<FieldReference>() == state &&
        shuffle[1].opcode == Opcode.SGET_OBJECT && localType.definingClass == enumClass.type &&
        enumClass.superclass == "Ljava/lang/Enum;" && local >= 0 &&
        enumInit[local + 3].opcode == Opcode.SPUT_OBJECT &&
        enumInit[local + 3].getReference<FieldReference>() == localType &&
        shuffle[3].opcode == Opcode.NEW_INSTANCE &&
        shuffle[4].getReference<MethodReference>()?.toString() == "Ljava/util/ArrayList;-><init>()V" &&
        shuffle[5].opcode == Opcode.IPUT_OBJECT && baseline.definingClass == queue.type && baseline.type == LIST &&
        shuffle[6].getReference<MethodReference>()?.let {
            it.definingClass == queue.superclass && it.parameterTypes == listOf(LIST) && it.returnType == "V"
        } == true
    ) { "unrecognized native local shuffle state or baseline" }

    return {
        queue.interfaces.add(LOCAL_QUEUE)
        queue.interfaces.add(OFFLINE_QUEUE_MODEL)
        queue.addDownloadsBridge("rvxOfflineCursor", emptyList(), "I", 2, """
            invoke-virtual {p0}, $currentIndex
            move-result v0
            return v0
        """)
        queue.addDownloadsBridge("rvxOfflineSize", emptyList(), "I", 2, """
            const/4 v0, 0x0
            invoke-virtual {p0, v0}, $primarySize
            move-result v0
            return v0
        """)
        queue.addDownloadsBridge("rvxOfflineItem", listOf("I"), OBJECT, 3, """
            const/4 v0, 0x0
            invoke-virtual {p0, v0, p1}, $currentItem
            move-result-object v0
            return-object v0
        """)

        // The admission bridge holds the native queue monitor throughout the comparison.
        queue.addDownloadsBridge("rvxMatchesLocalShuffle", listOf(LIST, "I"), "Z", 8, """
            if-eqz p1, :rvx_mismatch
            if-ltz p2, :rvx_mismatch
            invoke-virtual {p0}, $typeGetter
            move-result-object v0
            sget-object v1, $localType
            if-ne v0, v1, :rvx_mismatch
            iget-object v0, p0, $baseline
            if-eqz v0, :rvx_mismatch
            invoke-virtual {p0}, $currentIndex
            move-result v1
            if-ne v1, p2, :rvx_mismatch
            const/4 v1, 0x0
            invoke-interface {p1}, $LIST->size()I
            move-result v2
            if-ge p2, v2, :rvx_mismatch
            invoke-interface {v0}, $LIST->size()I
            move-result v0
            if-ne v0, v2, :rvx_mismatch
            invoke-virtual {p0, v1}, $primarySize
            move-result v0
            if-ne v0, v2, :rvx_mismatch
            const/4 v0, 0x0
            :rvx_compare
            if-ge v0, v2, :rvx_match
            invoke-virtual {p0, v1, v0}, $currentItem
            move-result-object v3
            invoke-interface {p1, v0}, $LIST->get(I)$OBJECT
            move-result-object v4
            if-ne v3, v4, :rvx_mismatch
            add-int/lit8 v0, v0, 0x1
            goto :rvx_compare
            :rvx_match
            const/4 v0, 0x1
            return v0
            :rvx_mismatch
            const/4 v0, 0x0
            return v0
        """)
        queue.addDownloadsBridge(RETAIN_SHUFFLE, listOf(OBJECT, "I"), "I", 4, """
            monitor-enter p0
            :rvx_check_start
            invoke-virtual {p0}, $currentIndex
            move-result v0
            if-eq v0, p2, :rvx_same_cursor
            const/4 p2, -0x1
            :rvx_same_cursor
            invoke-static {p0, p1, p2}, $REPLAY->retainQueueRows($OBJECT${OBJECT}I)I
            move-result v0
            :rvx_check_end
            monitor-exit p0
            return v0
            :rvx_check_error
            move-exception v0
            monitor-exit p0
            throw v0
            .catchall {:rvx_check_start .. :rvx_check_end} :rvx_check_error
        """)
    }
}

/**
 * The panel is extracted from the reply's proto, not the reply wrapper's optional cached panel. The modern
 * commit takes this panel directly; legacy apply uses it to build its row list before the no-argument commit.
 */
private fun resolveAppliedPanel(
    apply: Method, steps: List<Instruction>, receiver: Int,
    commit: MethodReference, commitCall: FiveRegisterInstruction, protoType: String,
): Pair<String, Int> {
    val loadIndex = steps.indexOfFirst { it.opcode == Opcode.IGET_OBJECT }
    val reply = receiver + 1
    val exit = steps.lastIndex
    check(when (loadIndex) {
        1 -> steps[0].branchesTo(Opcode.IF_EQZ, exit, reply)
        2 -> steps[0].branchesTo(Opcode.IF_NEZ, loadIndex, reply) && steps[1].branchesTo(Opcode.GOTO_16, exit)
        else -> false
    }) { "unrecognized panel extraction entry" }

    val load = steps[loadIndex] as TwoRegisterInstruction
    val proto = checkNotNull(load.getReference<FieldReference>())
    val extractor = steps[loadIndex + 1] as FiveRegisterInstruction
    val extract = checkNotNull(extractor.getReference<MethodReference>())
    val result = steps[loadIndex + 2] as OneRegisterInstruction
    val panelType = extract.returnType
    val panel = result.registerA
    val panelGuard = loadIndex + 3
    check(proto.definingClass == apply.parameterTypes.first() && proto.type == protoType && load.registerB == reply &&
        extractor.opcode == Opcode.INVOKE_STATIC && extract.parameterTypes == listOf(protoType) &&
        extractor.registerCount == 1 && extractor.registerC == load.registerA && panelType.startsWith("L") &&
        result.opcode == Opcode.MOVE_RESULT_OBJECT && panel in 0 until receiver &&
        steps[panelGuard].branchesTo(Opcode.IF_EQZ, exit, panel)) { "unrecognized panel extraction" }

    val body = steps.subList(panelGuard + 1, exit)
    check(apply.implementation!!.tryBlocks.isEmpty() && body.none { instruction ->
        val destination = (instruction as? OneRegisterInstruction)?.registerA
        val branch = instruction as? BuilderOffsetInstruction
        (instruction.opcode.setsRegister() && (destination == panel || destination == receiver)) ||
            (instruction.opcode.setsWideRegister() && destination == panel - 1) ||
            instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH ||
            (branch != null && branch.target.location.index <= panelGuard)
    }) { "panel register does not survive to commit" }

    if (commit.parameterTypes.isNotEmpty()) {
        check(commit.parameterTypes.first() == panelType && commitCall.registerD == panel) {
            "commit does not take the extracted panel"
        }
    } else {
        check((0 until body.size - 2).any { index ->
            val invoke = body[index]
            val move = body[index + 1]
            val read = body[index + 2]
            val builder = invoke.getReference<MethodReference>()
            val rows = read.getReference<FieldReference>()
            invoke.opcode == Opcode.INVOKE_VIRTUAL && invoke is FiveRegisterInstruction &&
                invoke.registerCount == 2 && invoke.registerC == receiver && invoke.registerD == panel &&
                builder != null && builder.definingClass == apply.definingClass &&
                builder.parameterTypes == listOf(panelType) && move.opcode == Opcode.MOVE_RESULT_OBJECT &&
                read.opcode == Opcode.IGET_OBJECT && read is TwoRegisterInstruction &&
                read.registerB == (move as OneRegisterInstruction).registerA &&
                rows != null && rows.definingClass == builder.returnType && rows.type == "Ljava/util/List;"
        }) { "queue row builder does not take the extracted panel" }
    }

    return panelType to panel
}

private fun Instruction.branchesTo(opcode: Opcode, target: Int, register: Int? = null): Boolean =
    this.opcode == opcode && this is BuilderOffsetInstruction && this.target.location.index == target &&
        (register == null || (this as? OneRegisterInstruction)?.registerA == register)

/** True jumps over server shuffle directly to the native primary-queue permutation. */
private fun Method.localShuffleBody(): List<Instruction> {
    val instructions = implementation!!.instructions.toList()
    val branch = instructions[1] as? BuilderOffsetInstruction ?: error("missing local shuffle branch")
    val target = branch.target.location.index
    val argument = implementation!!.registerCount - 1
    check(instructions[0].opcode == Opcode.MONITOR_ENTER && branch.opcode == Opcode.IF_NEZ &&
        (branch as? OneRegisterInstruction)?.registerA == argument &&
        target > 2 && target < instructions.size && instructions.subList(2, target).any {
            it.getReference<StringReference>()?.string == "requestServerShuffle"
        }) { "unrecognized local shuffle branch" }
    return instructions.drop(target).also { local ->
        check(local.any {
            it.getReference<MethodReference>()?.let { ref ->
                ref.definingClass == "Ljava/security/SecureRandom;" && ref.name == "nextInt"
            } == true
        }) { "missing local shuffle permutation" }
    }
}
