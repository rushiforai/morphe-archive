/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.Utils.printInfo
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val HOOK = "Lapp/morphe/extension/music/patches/downloads/OnesieFallback;"
private const val CONTROLLER = $$"Lapp/morphe/extension/music/patches/downloads/OnesieFallback$Controller;"
private const val FETCH = $$"Lapp/morphe/extension/music/patches/downloads/OnesieFallback$Fetch;"
private const val OBJECT = "Ljava/lang/Object;"
private const val EXCEPTION = "Ljava/lang/Exception;"
private const val ATOMIC = "Ljava/util/concurrent/atomic/AtomicBoolean;"
private const val NETWORK = "Lorg/chromium/net/NetworkException;"

private data class OnesieAbi(
    val controller: String, val source: String, val factory: String,
    val completer: String, val fail: String, val emit: String, val close: String,
    val gate: String, val closed: String, val cancelled: String, val error: String,
    val fallback: String, val service: String, val request: String,
    val converter: String, val errorType: String, val requestBase: String, val forward: String,
    val future: String = "n", val completion: String = "m",
)

internal fun BytecodePatchContext.prepareOnesieTransport(): (() -> Unit)? {
    val abi = when (packageMetadata.versionName) {
        "9.45.51" -> OnesieAbi("Lyqo;", "Lyqy;", "Lonz;", "Lyqm;", "a", "l", "d",
            "I", "K", "j", "L", "Lyrp;", "Lteq;", "Lwlz;", "Ltvq;", "Ltmw;", "Ltlf;", "y", "h", "D")
        "9.40.51" -> OnesieAbi("Lylw;", "Lymj;", "Lonr;", "Lylu;", "a", "w", "e",
            "W", "X", "r", "Y", "Lynv;", "Ltdf;", "Lwgt;", "Lsxk;", "Ltlh;", "Ltjq;", "y")
        "9.15.51" -> OnesieAbi("Latry;", "Latsu;", "Latrl;", "Latrw;", "hs", "v", "e",
            "W", "X", "q", "Y", "Latvg;", "Laiza;", "Laphq;", "Lajal;", "Lajlb;", "Lajjf;", "z")
        "8.30.54" -> OnesieAbi("Laqqe;", "Laqra;", "Laqpt;", "Laqqc;", "gM", "x", "f",
            "X", "Y", "q", "Z", "Laqtn;", "Lahcp;", "Lanau;", "Lahec;", "Lahnb;", "Lahlh;", "t")
        "8.28.54" -> OnesieAbi("Laqiw;", "Laqjs;", "Laqil;", "Laqiu;", "gH", "x", "f",
            "X", "Y", "q", "Z", "Laqmf;", "Lagzq;", "Lamuk;", "Lahbd;", "Lahkc;", "Lahii;", "t")
        "8.12.54" -> OnesieAbi("Laoku;", "Laolv;", "Laokj;", "Laoks;", "fV", "g", "f",
            "u", "V", "q", "D", "Laooh;", "Lafog;", "Lakyg;", "Lafpu;", "Lafyr;", "Lafwu;", "t")
        else -> return null
    }
    fun method(owner: String, name: String, params: List<String>, result: String) =
        classDefBy(owner).methods.single {
            it.name == name && it.parameterTypes == params && it.returnType == result
        }
    fun field(name: String, type: String) = classDefBy(abi.controller).fields.single {
        it.name == name && it.type == type
    }
    val gate = field(abi.gate, if (packageMetadata.versionName == "8.12.54") "Z" else ATOMIC)
    val claimResponse = if (gate.type == "Z") """
        iget-boolean v0, p0, $gate
        if-nez v0, :claim_done
        const/4 v2, 0x1
        iput-boolean v2, p0, $gate
    """ else """
        iget-object v0, p0, $gate
        const/4 v1, 0x0
        const/4 v2, 0x1
        invoke-virtual {v0, v1, v2}, $ATOMIC->compareAndSet(ZZ)Z
        move-result v0
        if-eqz v0, :claim_done
    """
    val closed = field(abi.closed, "Z")
    val cancelled = field(abi.cancelled, ATOMIC)
    val error = field(abi.error, "Z")
    val future = field(abi.future, "Lcom/google/common/util/concurrent/ListenableFuture;")
    val completer = field(abi.completion, abi.completer)
    val fail = method(abi.completer, abi.fail, listOf("Ljava/lang/Throwable;"), "V")
    val emit = method(abi.controller, abi.emit, listOf(EXCEPTION), "V")
    val invokeEmit = if (AccessFlags.PRIVATE.isSet(emit.accessFlags)) "invoke-direct" else "invoke-virtual"
    val close = method(abi.controller, abi.close, emptyList(), "V")
    val retry = classDefBy(abi.source).methods.single {
        it.name == "b" && it.parameterTypes.size == 1 && it.returnType == "J"
    }
    val code = retry.implementation!!.instructions.toList()
    val network = code.indices.single {
        code[it].opcode == Opcode.INSTANCE_OF && code[it].getReference<TypeReference>()?.type == NETWORK
    }
    check(code[network + 1].opcode == Opcode.IF_EQZ)
    val scratch = (code[network] as TwoRegisterInstruction).registerA
    val failure = (code.take(network).last { it.opcode == Opcode.MOVE_EXCEPTION } as OneRegisterInstruction).registerA
    val factory = classDefBy(abi.factory).methods.single {
        it.implementation?.instructions?.any { instruction ->
            instruction.getReference<MethodReference>()?.let { call ->
                call.definingClass == abi.source && call.name == "<init>"
            } == true
        } == true
    }
    val factoryCode = factory.implementation!!.instructions.toList()
    val constructed = factoryCode.indexOfFirst {
        it.getReference<MethodReference>()?.let { call ->
            call.definingClass == abi.source && call.name == "<init>"
        } == true
    }
    val sourceRegister = when (val call = factoryCode[constructed]) {
        is RegisterRangeInstruction -> call.startRegister
        else -> (call as FiveRegisterInstruction).registerC
    }
    val controllerRegister = (factoryCode.take(constructed).last {
        (it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == abi.controller) ||
            (it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.type == abi.controller)
    } as OneRegisterInstruction).registerA
    check(listOf(sourceRegister, controllerRegister, scratch, failure).all { it < 16 })
    val fallback = method(abi.fallback, "c",
        listOf(abi.service, "Ljava/lang/String;", abi.request, EXCEPTION), "V")
    val convert = classDefBy(abi.converter).methods.single {
        it.parameterTypes == listOf("Ljava/lang/Throwable;") && it.returnType == abi.errorType
    }
    val forward = method(abi.requestBase, abi.forward, listOf(abi.errorType), "V")
    val installFetch = if (packageMetadata.versionName in setOf("9.45.51", "9.40.51")) {
        prepareOnesieNetFetch(abi.controller)
    } else null
    val installReader = prepareOnesieReader(abi.controller)

    return {
        val controller = mutableClassDefBy(abi.controller)
        controller.interfaces.add(CONTROLLER)
        controller.addDownloadsBridge("rvxClaimFailure", emptyList(), "Z", 5, """
            const/4 v3, 0x0
            monitor-enter p0
            :claim_start
            iget-boolean v0, p0, $closed
            if-nez v0, :claim_done
            iget-object v0, p0, $cancelled
            invoke-virtual {v0}, $ATOMIC->get()Z
            move-result v0
            if-nez v0, :claim_done
            iget-object v0, p0, $future
            invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z
            move-result v0
            if-nez v0, :claim_done
            $claimResponse
            iput-boolean v2, p0, $error
            const/4 v3, 0x1
            :claim_done
            :claim_end
            monitor-exit p0
            return v3
            :claim_error
            move-exception v0
            monitor-exit p0
            throw v0
            .catchall {:claim_start .. :claim_end} :claim_error
        """)
        controller.addDownloadsBridge("rvxFailureLive", emptyList(), "Z", 3, """
            const/4 v1, 0x0
            iget-boolean v0, p0, $closed
            if-nez v0, :done
            iget-object v0, p0, $cancelled
            invoke-virtual {v0}, $ATOMIC->get()Z
            move-result v0
            if-nez v0, :done
            iget-object v0, p0, $future
            invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z
            move-result v0
            if-nez v0, :done
            const/4 v1, 0x1
            :done
            return v1
        """)
        controller.addDownloadsBridge("rvxFailFuture", listOf(EXCEPTION), "V", 3, """
            iget-object v0, p0, $completer
            invoke-virtual {v0, p1}, $fail
            return-void
        """)
        controller.addDownloadsBridge("rvxFailPacked", listOf(EXCEPTION), "V", 2, """
            $invokeEmit {p0, p1}, $emit
            return-void
        """)
        controller.addDownloadsBridge("rvxCloseFailure", emptyList(), "V", 1, """
            invoke-virtual {p0}, $close
            return-void
        """)
        val source = mutableClassDefBy(abi.source)
        source.addOnesieControllerField()
        source.addDownloadsBridge("rvxFailure", listOf(EXCEPTION), "Z", 3, """
            iget-object v0, p0, ${abi.source}->rvxController:$OBJECT
            invoke-static {v0, p1}, $HOOK->failed($OBJECT$EXCEPTION)Z
            move-result v0
            return v0
        """)
        mutableClassDefBy(factory.definingClass).findMutableMethodOf(factory).addInstructions(constructed + 1,
            "iput-object v$controllerRegister, v$sourceRegister, ${abi.source}->rvxController:$OBJECT")
        val mutableRetry = source.findMutableMethodOf(retry)
        val stockRetry = ExternalLabel("rvx_stock_retry", mutableRetry.getInstruction<Instruction>(network + 2))
        mutableRetry.addInstructionsWithLabels(network + 2, """
            invoke-virtual {p0, v$failure}, ${abi.source}->rvxFailure($EXCEPTION)Z
            move-result v$scratch
            if-eqz v$scratch, :rvx_stock_retry
            throw v$failure
        """, stockRetry)
        val mutableFallback = mutableClassDefBy(abi.fallback).findMutableMethodOf(fallback)
        val stockFallback = ExternalLabel("rvx_stock_fallback", mutableFallback.getInstruction<Instruction>(0))
        mutableFallback.addInstructionsWithLabels(0, """
            invoke-static {}, $HOOK->disconnected()Z
            move-result v0
            if-eqz v0, :rvx_stock_fallback
            invoke-static {p4}, $convert
            move-result-object v0
            invoke-virtual {p3, v0}, $forward
            return-void
        """, stockFallback)
        installReader()
        installFetch?.invoke()
        printInfo("PlayerFallback: Onesie first failure $retry; controller ${abi.controller}; scalar $fallback")
    }
}

internal fun app.morphe.patcher.util.proxy.mutableTypes.MutableClass.addOnesieControllerField() {
    instanceFields.add(ImmutableField(type, "rvxController", OBJECT, AccessFlags.PUBLIC.value,
        null, emptySet(), emptySet()).toMutable())
}

private fun BytecodePatchContext.prepareOnesieNetFetch(controller: String): () -> Unit {
    val newer = packageMetadata.versionName == "9.45.51"
    val factoryType = if (newer) "Lyph;" else "Lykk;"
    val taskType = if (newer) "Lypg;" else "Lykj;"
    val callbackType = if (newer) "Lypf;" else "Lyki;"
    val start = classDefBy(controller).methods.single {
        it.name == (if (newer) "j" else "s") && it.parameterTypes.isEmpty()
    }
    val startCode = start.implementation!!.instructions.toList()
    val constructFactory = startCode.indexOfFirst {
        it.getReference<MethodReference>()?.let { call ->
            call.definingClass == factoryType && call.name == "<init>"
        } == true
    }
    check(constructFactory >= 0)
    val startTask = classDefBy(factoryType).methods.single { it.name == "startFetchTask" }
    val taskCode = startTask.implementation!!.instructions.toList()
    val constructTask = taskCode.indexOfFirst {
        it.getReference<MethodReference>()?.let { call ->
            call.definingClass == taskType && call.name == "<init>"
        } == true
    }
    check(constructTask >= 0)
    val callback = classDefBy(callbackType).methods.single { it.name == "onFailed" }
    val callbackCode = callback.implementation!!.instructions.toList()
    val clock = callbackCode.indexOfFirst {
        it.getReference<FieldReference>()?.let { field ->
            field.definingClass == taskType && field.name == (if (newer) "k" else "j")
        } == true
    }
    check(clock >= 0 && callbackCode[clock].opcode == Opcode.IGET_OBJECT)
    val watchdog = classDefBy(taskType).fields.single { it.name == (if (newer) "s" else "q") }
    val stopWatchdog = classDefBy(watchdog.type).methods.single { it.name == "d" && it.parameterTypes.isEmpty() }
    val cancel = classDefBy(taskType).methods.single { it.name == "cancel" && it.parameterTypes.isEmpty() }

    return {
        mutableClassDefBy(factoryType).addOnesieControllerField()
        val task = mutableClassDefBy(taskType)
        task.addOnesieControllerField()
        task.interfaces.add(FETCH)
        task.addDownloadsBridge("rvxController", emptyList(), OBJECT, 2, """
            iget-object v0, p0, $taskType->rvxController:$OBJECT
            return-object v0
        """)
        task.addDownloadsBridge("rvxCancelFetch", emptyList(), "V", 2, """
            iget-object v0, p0, $watchdog
            invoke-virtual {v0}, $stopWatchdog
            invoke-virtual {p0}, $cancel
            return-void
        """)
        mutableClassDefBy(controller).findMutableMethodOf(start).addInstructions(constructFactory + 1,
            "iput-object v1, v13, $factoryType->rvxController:$OBJECT")
        mutableClassDefBy(factoryType).findMutableMethodOf(startTask).addInstructions(constructTask + 1, """
            iget-object v0, v1, $factoryType->rvxController:$OBJECT
            iput-object v0, v2, $taskType->rvxController:$OBJECT
        """)
        val method = mutableClassDefBy(callbackType).findMutableMethodOf(callback)
        val stock = ExternalLabel("rvx_stock_fetch_failure", method.getInstruction<Instruction>(clock + 1))
        method.addInstructionsWithLabels(clock + 1, """
            instance-of p2, p3, $NETWORK
            if-eqz p2, :rvx_stock_fetch_failure
            invoke-static {p0, p3}, $HOOK->failedFetch($OBJECT$EXCEPTION)Z
            move-result p2
            if-eqz p2, :rvx_stock_fetch_failure
            return-void
        """, stock)
        printInfo("PlayerFallback: Onesie NetFetch $callback; native cancel $cancel")
    }
}
