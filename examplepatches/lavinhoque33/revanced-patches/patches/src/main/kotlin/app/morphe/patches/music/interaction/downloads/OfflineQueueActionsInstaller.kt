/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.interaction.jam.JAM_UI
import app.morphe.patches.music.interaction.jam.getMutableMethod
import app.morphe.patches.music.interaction.jam.p0Register
import app.morphe.patches.music.interaction.jam.registerAt
import app.morphe.patches.music.interaction.manualqueue.ACCESS as MANUAL_ACCESS
import app.morphe.patches.music.interaction.manualqueue.DISPATCH as MANUAL_DISPATCH
import app.morphe.patches.music.interaction.manualqueue.EXT as MANUAL_QUEUE
import app.morphe.patches.music.interaction.playlisttracktap.QueueAddEndpointCommandFingerprint
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val EXT = "Lapp/morphe/extension/music/patches/downloads/OfflineQueueActions;"
private const val CARRIER = $$"Lapp/morphe/extension/music/patches/downloads/OfflineQueueActions$Carrier;"
private const val OWNER = $$"Lapp/morphe/extension/music/patches/downloads/OfflineQueueActions$Owner;"
private const val LOOKUP = $$"Lapp/morphe/extension/music/patches/downloads/OfflineQueueActions$Lookup;"
private const val ROW = $$"Lapp/morphe/extension/music/patches/downloads/OfflineQueueActions$Row;"
private const val TAP_SOURCE = $$"Lapp/morphe/extension/music/patches/downloads/OfflineQueueActions$TapSource;"
private const val NAVIGATOR = $$"Lapp/morphe/extension/music/patches/downloads/PlayerFallback$Navigator;"
private const val QUEUE_ROW = $$"Lapp/morphe/extension/music/patches/downloads/PlayerFallback$QueueRow;"
private const val EXECUTOR = "Ljava/util/concurrent/Executor;"
private const val FUTURE = "Lcom/google/common/util/concurrent/ListenableFuture;"
private const val MAP = "Ljava/util/Map;"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/List;"
private const val TAG = "com.google.android.libraries.youtube.innertube.endpoint.tag"
private const val CAST_MOVE = "Move performed instead of add while casting."
private const val LOCAL_ENQUEUE = "patch_jamLocalEnqueue"
private const val LOCAL_SUCCESS = "patch_jamLocalSuccess"

private data class QueueActionAbi(
    val manager: String, val enqueue: String, val lookup: String, val request: String,
    val callback: String, val success: String, val result: String,
    val wrapper: String,
)

private val queueActionAbis = mapOf(
    "9.45.51" to QueueActionAbi("Liac;", "c", "Ljli;", "e", "Liaa;", "b", "Licm;", "Lhzm;"),
    "9.40.51" to QueueActionAbi("Liaw;", "c", "Ljlm;", "e", "Liau;", "b", "Lidb;", "Liag;"),
    "9.15.51" to QueueActionAbi("Lnyo;", "c", "Lohq;", "a", "Lnyl;", "ht", "Loil;", "Lnxf;"),
    "8.30.54" to QueueActionAbi("Lnlb;", "b", "Lnsu;", "a", "Lnky;", "gN", LIST, "Lnjc;"),
    "8.28.54" to QueueActionAbi("Lnju;", "b", "Lnrm;", "a", "Lnjr;", "gI", LIST, "Lnhv;"),
    "8.12.54" to QueueActionAbi("Lncy;", "b", "Lnjx;", "a", "Lncw;", "fW", LIST, "Lnaz;"),
)

private data class QueueClickAbi(
    val click: String, val facade: String, val navigatorGetter: String, val navigator: String,
    val presenters: List<String>, val item: String, val itemField: String = "j",
)

private val queueClickAbis = mapOf(
    "9.45.51" to QueueClickAbi("Ladov;", "Labxt;", "n", "Labxi;", listOf("Ljeo;"), "Lhwm;"),
    "9.40.51" to QueueClickAbi("Ladhh;", "Labro;", "n", "Labrd;", listOf("Ljet;"), "Lhxj;"),
    "9.15.51" to QueueClickAbi("Lbdlu;", "Lbacz;", "w", "Lbacc;", listOf("Lqtp;"), "Lnoq;", "k"),
    "8.30.54" to QueueClickAbi("Lazvn;", "Lawzc;", "t", "Lawye;", listOf("Lqec;"), "Lnan;"),
    "8.28.54" to QueueClickAbi("Lazix;", "Lawqp;", "t", "Lawpr;", listOf("Lqcu;"), "Lmzd;"),
    "8.12.54" to QueueClickAbi("Laxck;", "Lauof;", "q", "Launh;", listOf("Lptb;", "Lpui;"), "Lmss;"),
)

internal fun BytecodePatchContext.installOfflineQueueActions(commandType: String) {
    var stage = "version ABI"
    try {
        val abi = checkNotNull(queueActionAbis[packageMetadata.versionName]) { "no matching native queue version" }

        stage = "resolver route to ${abi.manager}->${abi.enqueue}"
        val manager = mutableClassDefBy(abi.manager)
        val enqueue = classDefBy(abi.manager).methods.single {
            it.name == abi.enqueue && it.parameterTypes == listOf(commandType) && it.returnType == "V"
        }
        val resolver = QueueAddEndpointCommandFingerprint.match().method
        val scope = prepareLocalQueueScope(resolver, enqueue, commandType)

        stage = "metadata call ${abi.lookup}->${abi.request}"
        val client = mutableClassDefBy(abi.lookup)
        val nativeLookup = client.methods.single {
            it.name == abi.request && it.parameterTypes == listOf(commandType, EXECUTOR) && it.returnType == FUTURE
        }
        val nativeBody = manager.methods.single { candidate ->
            candidate.name in setOf(abi.enqueue, LOCAL_ENQUEUE) && candidate.parameterTypes == listOf(commandType) &&
                    candidate.returnType == "V" && candidate.steps().any { it.call() == nativeLookup }
        }
        val steps = nativeBody.steps()
        val lookupIndex = steps.indices.single { steps[it].call() == nativeLookup }
        val call = steps[lookupIndex] as ReferenceInstruction
        check(steps[lookupIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                listOf(nativeBody.p0Register, call.reg(0), call.reg(1), call.reg(2)).all { it < 16 }) {
            "queue metadata future is not a single replaceable invocation"
        }

        stage = "native completion ${abi.callback}->${abi.success}, result ${abi.result}"
        val callback = classDefBy(abi.callback).methods.single {
            (it.name == abi.success || it.name == LOCAL_SUCCESS) &&
                    it.parameterTypes == listOf(OBJECT) && it.returnType == "V" &&
                    it.steps().any { step ->
                        step.opcode == Opcode.CHECK_CAST && step.getReference<TypeReference>()?.type == abi.result
                    } && it.steps().any { step ->
                        step.call()?.let { call ->
                            call.name == "addAll" && call.parameterTypes == listOf("I", "Ljava/util/Collection;")
                        } == true
                    }
        }
        val result = if (abi.result == LIST) null else classDefBy(abi.result).methods.single {
            it.name == "<init>" && it.parameterTypes.size == 2 && it.parameterTypes.first() == LIST &&
                    it.parameterTypes.last().startsWith("L") && !AccessFlags.PRIVATE.isSet(it.accessFlags)
        }
        val applyReply = prepareApplyReply(callback, abi.manager, abi.result)

        stage = "native row factory ${abi.lookup}->rvxRestoreSong"
        val factoryBridge = client.methods.single {
            it.name == "rvxRestoreSong" && it.parameterTypes == listOf("[B") && it.returnType == OBJECT
        }
        val factory = factoryBridge.steps().mapNotNull(Instruction::call).last()
        val row = mutableClassDefBy(factory.returnType)
        check(QUEUE_ROW in row.interfaces && factory.parameterTypes.size == 1) {
            "native row factory is not the captured watch-next row ABI"
        }

        stage = "local queue ownership and replay continuation for ${abi.manager} via ${abi.wrapper}"
        val modelAccess = prepareLocalModelAccess(manager, abi.wrapper)

        stage = "Up Next occurrence click"
        val queueClick = prepareQueueClick(commandType)

        stage = "bridge and hook emission"
        val command = mutableClassDefBy(commandType)
        val gate = mutableClassDefBy(EXT).methods.single { it.name == "supported" && it.returnType == "Z" }

        // Discovery above is all-or-nothing. Every connected decline still calls the original native lookup.
        modelAccess()
        command.addQueueAttachment(CARRIER, "rvxQueueTicket", "rvxOfflineQueueTicket")
        row.addQueueAttachment(ROW, "rvxOfflineInsertion", "rvxOfflineInsertionOwner")
        client.interfaces.add(LOOKUP)
        client.addDownloadsBridge("rvxStockQueueLookup", listOf(OBJECT, EXECUTOR), FUTURE, 3, """
            check-cast p1, $commandType
            invoke-virtual {p0, p1, p2}, $nativeLookup
            move-result-object p1
            return-object p1
        """)
        client.addDownloadsBridge("rvxOfflineResult", listOf(LIST), OBJECT, 4,
            if (result == null) "return-object p1" else """
                new-instance v0, ${abi.result}
                const/4 v1, 0x0
                invoke-direct {v0, p1, v1}, $result
                return-object v0
            """,
        )
        val bridge = "${manager.type}->rvxOfflineLookup(${client.type}$commandType$EXECUTOR)$FUTURE"
        manager.addDownloadsBridge("rvxOfflineLookup", listOf(client.type, commandType, EXECUTOR), FUTURE, 4, """
            invoke-static {p0, p1, p2, p3}, $EXT->lookup($OBJECT$LOOKUP$OBJECT$EXECUTOR)$FUTURE
            move-result-object p1
            return-object p1
        """)
        nativeBody.replaceInstruction(lookupIndex,
            "invoke-virtual {v${nativeBody.p0Register}, v${call.reg(0)}, v${call.reg(1)}, v${call.reg(2)}}, $bridge")
        scope()
        applyReply()
        queueClick()
        gate.replaceInstruction(0, "const/4 v0, 0x1")
        printInfo("OfflineQueueActions: 1 local resolver scope $resolver; 1 metadata future $nativeLookup in " +
            "$nativeBody; result ${abi.result} via $factory; 1 native completion gate $callback; " +
            "1 Up Next click; 1 native occurrence commit; 1 native occurrence publisher")
    } catch (exception: Exception) {
        printWarn("OfflineQueueActions: native enqueue unavailable on Music ${packageMetadata.versionName}: " +
            "$stage: ${exception.message}")
    }
}

/** A locally materialized reply may have been queued on the native executor before its model was replaced. */
private fun BytecodePatchContext.prepareApplyReply(callback: Method, manager: String, result: String): () -> Unit {
    val owner = mutableClassDefBy(callback.definingClass)
    val managerField = owner.fields.single { it.type == manager && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val body = callback.getMutableMethod()
    val start = body.steps().first()
    val fetchItems = if (result == LIST) "check-cast p1, $LIST" else {
        val items = classDefBy(result).fields.single { it.type == LIST && !AccessFlags.STATIC.isSet(it.accessFlags) }
        """
            check-cast p1, $result
            iget-object p1, p1, $items
        """
    }
    check(body.p0Register in 1..14) { "native queue callback registers cannot address its result" }

    return {
        val guard = "${owner.type}->rvxAllowsOfflineQueueReply($OBJECT)Z"
        owner.addDownloadsBridge("rvxAllowsOfflineQueueReply", listOf(OBJECT), "Z", 3, """
            if-eqz p1, :rvx_stock_reply
            $fetchItems
            iget-object v0, p0, $managerField
            invoke-static {v0, p1}, $EXT->allowsReply($OBJECT$LIST)Z
            move-result v0
            return v0
            :rvx_stock_reply
            const/4 v0, 0x1
            return v0
        """)
        body.addInstructionsWithLabels(0, """
            invoke-virtual {p0, p1}, $guard
            move-result v0
            if-nez v0, :rvx_stock_callback
            return-void
        """, ExternalLabel("rvx_stock_callback", start))
    }
}

/** Replace Jam's enable check at the same width so its already-assembled branch targets stay valid. */
internal fun BytecodePatchContext.finishOfflineQueueActions() {
    val abi = queueActionAbis[packageMetadata.versionName] ?: return
    val manager = mutableClassDefBy(abi.manager)
    if (manager.methods.none { it.name == "rvxOfflineLookup" }) return
    val wrapper = manager.methods.singleOrNull { method ->
        method.name == abi.enqueue && method.steps().any { it.call()?.name == LOCAL_ENQUEUE }
    } ?: return
    val start = wrapper.steps().first()
    val enabled = "$JAM_UI->enabled()Z"
    check(wrapper.p0Register <= 14 && start.opcode == Opcode.INVOKE_STATIC &&
            start.call()?.toString() == enabled) {
        "OfflineQueueActions: unexpected Jam forwarding wrapper"
    }

    val commandType = wrapper.parameterTypes.single().toString()
    val gate = "rvxJamQueueEnabled"
    manager.addDownloadsBridge(gate, listOf(commandType), "Z", 3, """
        invoke-static {p0, p1}, $EXT->localTicket($OBJECT$OBJECT)Z
        move-result v0
        if-eqz v0, :rvx_jam_enabled
        const/4 v0, 0x0
        return v0
        :rvx_jam_enabled
        invoke-static {}, $enabled
        move-result v0
        return v0
    """)
    wrapper.replaceInstruction(0, "invoke-virtual {p0, p1}, ${manager.type}->$gate($commandType)Z")
    printInfo("OfflineQueueActions: 1 optional Jam native edge $wrapper")
}

/** Prove the populated non-Cast branch even when the FIFO patch has already rewritten its slow join. */
private fun prepareLocalQueueScope(
    resolver: MutableMethod, enqueue: Method, commandType: String,
): () -> Unit {
    val steps = resolver.steps()
    check(resolver.parameterTypes == listOf(commandType, MAP)) { "queue command root does not match Downloads" }
    val fast = requireNotNull(steps.indices.singleOrNull { index ->
        steps[index].call()?.let { it.definingClass == enqueue.definingClass && it.name == "k" &&
                it.parameterTypes.size == 2 && it.returnType == "Z" } == true
    }) { "missing or ambiguous native fast insertion" }
    val managerReg = (steps[fast] as ReferenceInstruction).reg(0)

    val manual = "$MANUAL_QUEUE->dispatch($MANUAL_ACCESS$OBJECT$MANUAL_DISPATCH)V"
    val slow = requireNotNull(steps.indices.singleOrNull {
        val call = steps[it].call()
        call == enqueue || call?.toString() == manual
    }) { "missing or ambiguous native/FIFO slow enqueue join" }
    val fifo = steps[slow].call()?.toString() == manual
    val (slowOwner, rootReg) = if (fifo) {
        stagedFifoArguments(steps, slow)
    } else {
        val call = steps[slow] as ReferenceInstruction
        listOf(call.reg(0), call.reg(1))
    }
    check(slowOwner == managerReg) { "native local queue owner diverges at the slow join" }

    val metadata = requireNotNull(steps.indices.singleOrNull { steps[it].text() == TAG }) {
        "missing or ambiguous native endpoint tag"
    }
    val cast = requireNotNull(steps.indices.singleOrNull { steps[it].text() == CAST_MOVE }) {
        "missing or ambiguous Cast move arm"
    }
    val notify = requireNotNull(steps.subList(cast, metadata).mapNotNull(Instruction::call).firstOrNull {
        it.definingClass == resolver.definingClass && it.name == "e" &&
                it.parameterTypes.size == 1 && it.returnType == "V"
    }) { "missing original queue notification" }
    val notices = steps.indices.filter { steps[it].call() == notify }
    val local = notices.last { it < metadata }
    val mapAccess = steps[metadata + 1] as ReferenceInstruction
    val mapReg = mapAccess.reg(0)
    check(cast < local && local < metadata && metadata < fast && fast < slow && slow < notices.last() &&
            mapAccess.call()?.toString() == "$MAP->get($OBJECT)$OBJECT" &&
            listOf(managerReg, rootReg, mapReg).all { it < 16 }) { "missing isolated populated native resolver arm" }
    val localEntry = if (fifo) {
        val prepare = local - 2
        val expected = "${resolver.definingClass}->rvxManualPrepare(" +
                "${enqueue.definingClass}${notify.parameterTypes.single()}$MAP)$MANUAL_DISPATCH"
        check(steps[prepare].call()?.toString() == expected && steps[local - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                stagedFifoArguments(steps, prepare) == listOf(
                    managerReg, (steps[local] as ReferenceInstruction).reg(1), mapReg,
                )) { "unexpected FIFO local branch entry" }
        prepare - 3
    } else local
    val address = IntArray(steps.size + 1)
    steps.forEachIndexed { index, step -> address[index + 1] = address[index] + step.codeUnits }
    val castGate = requireNotNull((0 until cast).lastOrNull { index ->
        val branch = steps[index] as? OffsetInstruction
        branch != null && branch.opcode == Opcode.IF_EQZ && address[index] + branch.codeOffset == address[localEntry]
    }) { "native Cast decision does not enter the proven local arm" }
    val beforeNativeGates = (0 until castGate).first { index ->
        val step = steps[index]
        step is ReferenceInstruction && step.opcode == Opcode.INVOKE_VIRTUAL && step.reg(0) == managerReg &&
                step.call()?.let { it.definingClass == enqueue.definingClass &&
                        it.parameterTypes.isEmpty() && it.returnType == "Z" } == true
    }

    fun filterCommand(arguments: String, call: String) = """
        invoke-static {$arguments}, $EXT->$call
        move-result-object v$rootReg
        if-nez v$rootReg, :rvx_queue_command
        return-void
        :rvx_queue_command
        check-cast v$rootReg, $commandType
    """

    return {
        val context = "v$managerReg, v$rootReg, v$mapReg"
        val signature = "($OBJECT$OBJECT$MAP)$OBJECT"
        resolver.addInstructionsWithLabels(local + 1, filterCommand(context, "prepare$signature"))
        // Only the Cast fallthrough enters this arm. The stock branch still owns the non-Cast route.
        resolver.addInstructionsWithLabels(castGate + 1,
            filterCommand("v$rootReg", "castCommand($OBJECT)$OBJECT"))
        resolver.addInstructionsWithLabels(beforeNativeGates, filterCommand(context, "checkPlayerCommand$signature"))
    }
}

/** FIFO stages the original owner, Root/endpoint and dispatch/context in three fresh range registers. */
private fun stagedFifoArguments(steps: List<Instruction>, invoke: Int): List<Int> {
    val range = steps[invoke] as? RegisterRangeInstruction
    check(range != null && steps[invoke].opcode == Opcode.INVOKE_STATIC_RANGE &&
            range.registerCount == 3 && invoke >= 3) { "unexpected FIFO range invocation" }
    return (0..2).map { index ->
        val move = steps[invoke - 3 + index] as? TwoRegisterInstruction
        check(move != null && move.opcode == Opcode.MOVE_OBJECT_FROM16 &&
                move.registerA == range.startRegister + index) { "unexpected FIFO argument staging" }
        move.registerB
    }
}

/** Resolve the same stock backing queue for the operations manager, player storage, and navigator. */
private fun BytecodePatchContext.prepareLocalModelAccess(manager: MutableClass, wrapperType: String): () -> Unit {
    val current = Fingerprint(
        name = "rvxCurrent", parameters = emptyList(), returnType = "I",
        custom = { _, owner -> NAVIGATOR in owner.interfaces },
    ).matchSingle().method
    val nav = mutableClassDefBy(current.definingClass)
    val videoId = nav.methods.single {
        it.name == "rvxVideoId" && it.parameterTypes == listOf(OBJECT) && it.returnType == "Ljava/lang/String;"
    }.steps().mapNotNull(Instruction::call).single()
    val navigatorAccess = current.steps()
    val provider = navigatorAccess.mapNotNull { it.getReference<FieldReference>() }.single()
    val getProvider = navigatorAccess.mapNotNull(Instruction::call).first()
    val currentIndex = navigatorAccess.mapNotNull(Instruction::call).last()
    val storage = mutableClassDefBy(currentIndex.definingClass)
    val store = manager.fields.single { it.type == storage.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val cursor = storage.methods.single { it == currentIndex }
    val model = cursor.steps().mapNotNull { it.getReference<FieldReference>() }.single()
    val mode = storage.methods.single { it.name == "f" && it.parameterTypes.isEmpty() && it.returnType.startsWith("L") }
    val modeRead = mode.steps().mapNotNull(Instruction::call).single {
        it.definingClass == model.type && it.parameterTypes.isEmpty() && it.returnType == mode.returnType
    }
    val modeClass = classDefBy(mode.returnType)
    val init = modeClass.methods.single { it.name == "<clinit>" }.steps()
    val localName = init.indices.single { init[it].text() == "LOCAL" }
    val local = init.drop(localName + 1).first { it.opcode == Opcode.SPUT_OBJECT }.getReference<FieldReference>()!!
    check(local.definingClass == modeClass.type && local.type == modeClass.type) { "missing stock LOCAL queue mode" }
    val modelClass = Fingerprint(
        name = "rvxOfflineCursor", parameters = emptyList(), returnType = "I",
        custom = { _, owner -> OFFLINE_QUEUE_MODEL in owner.interfaces },
    ).matchSingle().classDef
    check(modelClass.methods.any { it.name == "rvxRetainLocalShuffle" && it.returnType == "I" }) {
        "native replay continuation is unavailable"
    }
    val queueBase = mutableClassDefBy(requireNotNull(modelClass.superclass))
    val listIndexOf = "$LIST->indexOf($OBJECT)I"
    val laneLookup = queueBase.methods.single { method ->
        val parameters = method.parameterTypes
        method.returnType == "I" && parameters.size == 2 && parameters[0] == "I" &&
                parameters[1].startsWith("L") && method.steps().any {
                    it.call()?.toString() == listIndexOf
                }
    }
    val laneSteps = laneLookup.steps()
    val nativeIndexOf = laneSteps.indices.single { laneSteps[it].call()?.toString() == listIndexOf }
    val indexCall = laneSteps[nativeIndexOf] as ReferenceInstruction
    val modelRegister = laneLookup.p0Register
    check(laneSteps.first().opcode == Opcode.MONITOR_ENTER &&
            (laneSteps.first() as OneRegisterInstruction).registerA == modelRegister &&
            laneSteps.take(nativeIndexOf).any {
                it.call()?.toString() == "Landroid/util/SparseArray;->get(I)$OBJECT"
            } &&
            indexCall.opcode == Opcode.INVOKE_INTERFACE && indexCall.reg(1) == modelRegister + 2 &&
            modelRegister in 0..15) { "unrecognized native occurrence lookup: $laneLookup" }
    val publishOccurrence = prepareOccurrencePublisher(queueBase, laneLookup.parameterTypes[1])

    // Stock storage can publish the playback decorator instead of its backing queue.
    val wrapper = classDefBy(wrapperType)
    val wrapperBase = classDefBy(requireNotNull(wrapper.superclass))
    val delegate = wrapperBase.fields.single {
        it.type == model.type && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                AccessFlags.FINAL.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    check(wrapper.methods.any { constructor ->
        constructor.name == "<init>" && modelClass.type in constructor.parameterTypes &&
                constructor.steps().any { step ->
                    step.call()?.let { call ->
                        call.name == "<init>" && call.definingClass == wrapperBase.type &&
                                delegate.type in call.parameterTypes
                    } == true
                }
    }) { "native local wrapper does not delegate to the replay model" }

    return {
        // Stock commit searches its own lanes; a projected Up Next index is not a lane-relative index.
        laneLookup.replaceInstruction(nativeIndexOf,
            "invoke-static {v$modelRegister, v${indexCall.reg(0)}, v${indexCall.reg(1)}}, " +
                "$EXT->nativeCommitIndex($OBJECT$LIST$OBJECT)I")
        publishOccurrence()
        modelClass.addDownloadsBridge("rvxOfflineVideoId", listOf(OBJECT), "Ljava/lang/String;", 2, """
            check-cast p1, ${videoId.definingClass}
            invoke-interface {p1}, $videoId
            move-result-object p1
            return-object p1
        """)
        storage.interfaces.add(OWNER)
        // Read the current model directly. Taking the storage monitor here would reverse its lock order on replay.
        storage.addDownloadsBridge("rvxOfflineQueue", emptyList(), OBJECT, 4, """
            iget-object v0, p0, $model
            if-eqz v0, :rvx_no_local_model
            invoke-interface {v0}, $modeRead
            move-result-object v1
            sget-object v2, $local
            if-ne v1, v2, :rvx_no_local_model
            instance-of v1, v0, $wrapperType
            if-eqz v1, :rvx_core
            check-cast v0, $wrapperType
            iget-object v0, v0, $delegate
            :rvx_core
            instance-of v1, v0, ${modelClass.type}
            if-eqz v1, :rvx_no_local_model
            return-object v0
            :rvx_no_local_model
            const/4 v0, 0x0
            return-object v0
        """)
        val getModel = "${storage.type}->rvxOfflineQueue()$OBJECT"
        manager.interfaces.add(OWNER)
        manager.addDownloadsBridge("rvxOfflineQueue", emptyList(), OBJECT, 2, """
            iget-object v0, p0, $store
            invoke-virtual {v0}, $getModel
            move-result-object v0
            return-object v0
        """)
        nav.interfaces.add(OWNER)
        nav.addDownloadsBridge("rvxOfflineQueue", emptyList(), OBJECT, 2, """
            iget-object v0, p0, $provider
            invoke-interface {v0}, $getProvider
            move-result-object v0
            check-cast v0, ${storage.type}
            if-eqz v0, :rvx_no_store
            invoke-virtual {v0}, $getModel
            move-result-object v0
            :rvx_no_store
            return-object v0
        """)
    }
}

/** Patch only the current-row notification. Other stock users of the comparator still match content. */
private fun BytecodePatchContext.prepareOccurrencePublisher(
    queueBase: MutableClass,
    itemType: CharSequence,
): () -> Unit {
    val name = if (packageMetadata.versionName == "8.12.54") "j" else "h"
    val publisher = queueBase.methods.single { it.name == name && it.returnType == "V" && it.parameterTypes.size == 1 }
    val steps = publisher.steps()
    val compare = steps.indices.single {
        steps[it].opcode == Opcode.INVOKE_VIRTUAL &&
                steps[it].call()?.let { call ->
                    call.parameterTypes == listOf(itemType) && call.returnType == "Z"
                } == true
    }
    val call = steps[compare] as ReferenceInstruction
    val compareMethod = call.call()!!
    val comparator = classDefBy(compareMethod.definingClass).methods.single { it == compareMethod }.steps()
    val previous = comparator.first().getReference<FieldReference>()!!
    val carrier = call.reg(0)
    val current = call.reg(1)
    val model = publisher.p0Register
    val scratch = (steps[compare + 1] as OneRegisterInstruction).registerA
    check(steps.first().opcode == Opcode.MONITOR_ENTER &&
            (steps.first() as OneRegisterInstruction).registerA == model &&
            steps[compare + 1].opcode == Opcode.MOVE_RESULT &&
            listOf(model, carrier, current, scratch).distinct().size == 4 &&
            listOf(model, carrier, current, scratch).all { it in 0..15 } &&
            comparator.first().opcode == Opcode.IGET_OBJECT && previous.definingClass == compareMethod.definingClass &&
            comparator[1].opcode == Opcode.INVOKE_STATIC &&
            comparator[1].call()?.parameterTypes == listOf(OBJECT, OBJECT) && comparator[1].call()?.returnType == "Z" &&
            steps.drop(compare + 2).any { it.opcode == Opcode.IPUT_OBJECT &&
                    it.getReference<FieldReference>() == previous } &&
            steps.drop(compare + 2).any { it.opcode == Opcode.INVOKE_INTERFACE &&
                    it.call()?.parameterTypes == listOf(OBJECT, publisher.parameterTypes.single()) }) {
        "unrecognized native current-row publisher: $publisher"
    }
    return {
        publisher.replaceInstruction(compare, "iget-object v$scratch, v$carrier, $previous")
        publisher.addInstructionsWithLabels(compare + 1,
            "invoke-static {v$model, v$scratch, v$current}, $EXT->samePublishedOccurrence($OBJECT$OBJECT$OBJECT)Z")
    }
}

/** The stock click wrapper delegates to its own row handler before dispatch. Only Up Next handlers get a bridge. */
private fun BytecodePatchContext.prepareQueueClick(commandType: String): () -> Unit {
    val abi = queueClickAbis.getValue(packageMetadata.versionName!!)
    val navigatorGetter = classDefBy(abi.facade).methods.single {
        it.name == abi.navigatorGetter && it.parameterTypes.isEmpty() && it.returnType == abi.navigator
    }
    val click = mutableClassDefBy(abi.click).methods.single {
        it.name == "onClick" && it.parameterTypes == listOf("Landroid/view/View;") && it.returnType == "V"
    }
    val steps = click.steps()
    val handlerLoad = steps[0] as TwoRegisterInstruction
    val handler = requireNotNull(steps[0].getReference<FieldReference>())
    val guard = steps[1] as ReferenceInstruction
    val dispatch = steps.indices.single { index ->
        steps[index].call()?.let { it.parameterTypes == listOf(commandType, MAP) && it.returnType == "V" } == true
    }
    val mergeMap = steps.indices.single { steps[it].call()?.toString() == "Ljava/util/HashMap;->putAll($MAP)V" }
    val key = (steps[mergeMap - 2] as ReferenceInstruction).reg(1)
    check(steps[0].opcode == Opcode.IGET_OBJECT && handlerLoad.registerB == click.p0Register &&
            guard.call()?.let { it.definingClass == handler.type && it.returnType == "Z" } == true &&
            guard.reg(0) == handlerLoad.registerA && steps[3].opcode == Opcode.IF_NEZ &&
            dispatch == mergeMap + 3 && steps[dispatch + 1].opcode == Opcode.RETURN_VOID &&
            steps[mergeMap + 1].opcode == Opcode.IGET_OBJECT &&
            (steps[mergeMap + 1] as TwoRegisterInstruction).registerB == click.p0Register &&
            (steps[mergeMap + 2] as ReferenceInstruction).let { it.reg(0) != key && it.reg(1) != key } &&
            (steps[dispatch] as ReferenceInstruction).let { (0..2).none { index -> it.reg(index) == key } }) {
        "unexpected click handler/dispatch layout"
    }

    val presenters = abi.presenters.map { type ->
        val presenter = mutableClassDefBy(type)
        val occurrence = presenter.fields.single { it.name == abi.itemField && it.type == abi.item }
        val facade = presenter.fields.single { it.type == abi.facade && !AccessFlags.STATIC.isSet(it.accessFlags) }
        check(handler.type in presenter.interfaces && presenter.methods.any { method ->
            method.steps().any { it.opcode == Opcode.IPUT_OBJECT && it.getReference<FieldReference>() == occurrence }
        }) { "missing stock Up Next row binding for $type" }
        Triple(presenter, occurrence, facade)
    }

    return {
        presenters.forEach { (presenter, occurrence, facade) ->
            presenter.interfaces.add(TAP_SOURCE)
            presenter.addDownloadsBridge("rvxBoundQueueRow", emptyList(), OBJECT, 2, """
                iget-object v0, p0, $occurrence
                return-object v0
            """)
            presenter.addDownloadsBridge("rvxBoundQueueNavigator", emptyList(), OBJECT, 2, """
                iget-object v0, p0, $facade
                invoke-interface {v0}, $navigatorGetter
                move-result-object v0
                return-object v0
            """)
        }
        // The logging key register is dead after Map.put; save the handler before stock may clobber p0.
        click.addInstructionsWithLabels(dispatch, """
            invoke-static {v$key}, $EXT->onQueueRowClick($OBJECT)Z
            move-result v$key
            if-eqz v$key, :rvx_original_dispatch
            return-void
            :rvx_original_dispatch
            nop
        """)
        click.addInstructionsWithLabels(mergeMap + 1, "iget-object v$key, p0, $handler")
    }
}

private fun MutableClass.addQueueAttachment(contract: String, accessor: String, fieldName: String) {
    interfaces.add(contract)
    instanceFields.add(ImmutableField(type, fieldName, OBJECT, AccessFlags.PRIVATE.value or AccessFlags.VOLATILE.value,
        null, emptySet(), emptySet()).toMutable())
    val field = "$type->$fieldName:$OBJECT"
    addDownloadsBridge(accessor, emptyList(), OBJECT, 2, """
        iget-object v0, p0, $field
        return-object v0
    """)
    addDownloadsBridge(accessor, listOf(OBJECT), "V", 2, """
        iput-object p1, p0, $field
        return-void
    """)
}

private fun Method.steps() = implementation?.instructions?.toList().orEmpty()
private fun Instruction.call() = getReference<MethodReference>()
private fun Instruction.text() = getReference<StringReference>()?.string
private fun ReferenceInstruction.reg(index: Int) = requireNotNull(registerAt(index))
