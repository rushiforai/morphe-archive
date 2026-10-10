/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.calldebug

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Disable call debug upload"
internal const val VOIP_DEBUG = "Lorg/telegram/messenger/voip/VoIPDebugToSend;"
internal const val SAVE_CALL_DEBUG = "Lorg/telegram/tgnet/tl/TL_phone\$saveCallDebug;"
internal const val SAVE_CALL_LOG = "Lorg/telegram/tgnet/tl/TL_phone\$saveCallLog;"
internal const val CALL_DEBUG = "$EXTENSION_PACKAGE/misc/CallDebug;"
private const val INPUT_FILE = "Lorg/telegram/tgnet/TLRPC\$InputFile;"
private const val FILE = "Ljava/io/File;"
private const val BOOL_FALSE = "Lorg/telegram/tgnet/TLRPC\$TL_boolFalse;"
private const val CONNECTIONS = "Lorg/telegram/tgnet/ConnectionsManager;"
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

@Suppress("unused")
val disableCallDebugPatch = bytecodePatch(
    name = PATCH,
    description = "Stops your phone from sending call problem reports and log files to Telegram when its server asks " +
        "for them. On by default. Turn it off in HushTelegram settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("disableCallDebug")
        requireStatusMethod("callDebugUpload")
        requireStatusMethod("callLogFileUpload")
        requireStatusMethod("callLogUpload")
        // Every gate, original return and borrowed register is checked before the first edit.
        val hooks = resolveCallDebugHooks()
        for ((target, hook) in hooks) {
            hook.method.addInstructionsAtControlFlowLabel(hook.index, hook.code,
                ExternalLabel("hush_done", hook.method.getInstruction(hook.finish)))
            when (target) {
                CallDebugTarget.DEBUG -> enableCapability("callDebugUpload")
                CallDebugTarget.FILE -> enableCapability("callLogFileUpload")
                CallDebugTarget.LOG -> enableCapability("callLogUpload")
            }
        }
        enableStatus("disableCallDebug")
    }
}

internal enum class CallDebugTarget(val capability: String) {
    DEBUG("callDebugUpload"), FILE("callLogFileUpload"), LOG("callLogUpload"),
}
internal data class CallDebugHook(val method: MutableMethod, val index: Int, val finish: Int, val code: String)

/** Kept requests and file calls select the private callbacks, without their synthetic names. */
internal fun BytecodePatchContext.resolveCallDebugHooks(): Map<CallDebugTarget, CallDebugHook> {
    val methods = mutableClassDefBy(VOIP_DEBUG).methods.toList()
    val done = methods.filter { it.constructs(SAVE_CALL_DEBUG) }.one("saveCallDebug method")
    shape(done.name == "done" && done.hasShape(listOf("J", "Z"), "V"), "call-end entry signature changed")
    val instructions = done.instructions()
    val flow = ControlFlow.of(done)
    val request = requestSite(done, SAVE_CALL_DEBUG)
    val cleanup = instructions.indices.filter { instructions[it].call()?.let { call ->
        call.definingClass == "Ljava/util/HashMap;" && call.name == "remove" &&
            call.hasShape(listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
    } == true }.one("pending call cleanup")
    val dataResult = cleanup + 1
    val cast = dataResult + 1
    val dataBranch = cast + 1
    val requestedBranch = request - 2
    val skip = request - 1
    shape(instructions.getOrNull(dataResult)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        instructions.getOrNull(cast)?.opcode == Opcode.CHECK_CAST &&
        instructions.getOrNull(dataBranch)?.opcode == Opcode.IF_EQZ &&
        instructions[dataResult].namedRegisters() == instructions[cast].namedRegisters() &&
        instructions[dataBranch].namedRegisters() == instructions[cast].namedRegisters() &&
        dataBranch < requestedBranch && instructions.getOrNull(requestedBranch)?.opcode == Opcode.IF_NEZ &&
        instructions.getOrNull(skip)?.opcode in GOTOS, "pending cleanup/data/request guards changed")
    val finish = flow.normal[skip].single()
    val requested = done.parameterRegisterNumber(1)
    shape(instructions[requestedBranch].namedRegisters() == listOf(requested) &&
        request in flow.normal[requestedBranch] && finish in flow.normal[dataBranch] &&
        instructions[finish].opcode == Opcode.RETURN_VOID, "server request no longer joins the stock call-end return")
    done.requireParameterIntact(PATCH, 1, listOf(requestedBranch, request))
    val dataType = (instructions[cast] as ReferenceInstruction).reference.toString()

    val log = methods.filter { it.constructs(SAVE_CALL_LOG) }.one("saveCallLog method")
    shape(log.hasShape(listOf(SAVE_CALL_DEBUG, INPUT_FILE), "V"), "call log callback signature changed")
    val logInstructions = log.instructions()
    val logFlow = ControlFlow.of(log)
    val logRequest = requestSite(log, SAVE_CALL_LOG)
    val fileBranch = logRequest - 2
    val noFile = logRequest - 1
    shape(logInstructions.getOrNull(fileBranch)?.opcode == Opcode.IF_NEZ &&
        logInstructions[fileBranch].namedRegisters() == listOf(log.parameterRegisterNumber(1)) &&
        logInstructions.getOrNull(noFile)?.opcode == Opcode.RETURN_VOID &&
        logRequest in logFlow.normal[fileBranch], "call log no longer checks a nonnull uploaded file")
    log.requireParameterIntact(PATCH, 1, listOf(fileBranch, logRequest))

    val upload = methods.filter { method -> method.instructions().any { it.fileUpload() } }.one("call log file upload")
    shape(upload.hasShape(listOf(FILE, SAVE_CALL_DEBUG), "V"), "call log file uploader signature changed")
    val uploading = upload.instructions()
    val uploadAt = uploading.indices.filter { uploading[it].fileUpload() }.one("FileLoader uploadFile call")
    val uploadFinish = ControlFlow.of(upload).normal[uploadAt].single()
    shape(uploading[uploadFinish].opcode == Opcode.RETURN_VOID, "file upload has unrelated work after it")

    // Validate the asynchronous opt-in chain, including its wrong-response and compression-failure exits.
    val response = methods.filter { it.hasShape(listOf(dataType, SAVE_CALL_DEBUG,
        "Lorg/telegram/tgnet/TLObject;", "Lorg/telegram/tgnet/TLRPC\$TL_error;"), "V") &&
        it.instructions().any { instruction -> instruction.opcode == Opcode.INSTANCE_OF && instruction.reference() == BOOL_FALSE }
    }.one("server log-file request callback")
    val responding = response.instructions()
    val responseFlow = ControlFlow.of(response)
    val typeCheck = responding.indices.filter { responding[it].opcode == Opcode.INSTANCE_OF && responding[it].reference() == BOOL_FALSE }
        .one("log-file opt-in response check")
    val responseBranch = typeCheck + 1
    val empty = responding.indices.filter { responding[it].call()?.let { call ->
        call.definingClass == "Landroid/text/TextUtils;" && call.name == "isEmpty"
    } == true }.one("log path empty check")
    val emptyBranch = empty + 2
    shape(responding.getOrNull(responseBranch)?.opcode == Opcode.IF_EQZ &&
        responding[responseBranch].namedRegisters() == listOf(responding[typeCheck].namedRegisters()[0]) &&
        responding[typeCheck].namedRegisters()[1] == response.parameterRegisterNumber(2) &&
        responding.getOrNull(empty + 1)?.opcode == Opcode.MOVE_RESULT && responding.getOrNull(emptyBranch)?.opcode == Opcode.IF_NEZ &&
        responding[emptyBranch].namedRegisters() == responding[empty + 1].namedRegisters(), "log-file opt-in checks changed")
    response.requireParameterIntact(PATCH, 2, listOf(typeCheck))
    val responseFinish = responseFlow.normal[responseBranch].single { it != responseBranch + 1 }
    shape(responding[responseFinish].opcode == Opcode.RETURN_VOID &&
        responseFinish in responseFlow.normal[emptyBranch] && typeCheck < empty &&
        responding.take(empty).any { it.field()?.let { field -> field.definingClass == dataType && field.type == "Ljava/lang/String;" } == true } &&
        responding.drop(emptyBranch + 1).any { it.call()?.let { call ->
            call.definingClass == "Lorg/telegram/messenger/DispatchQueue;" && call.name == "postRunnable"
        } == true }, "wrong response/empty log path no longer leave before log preparation")

    val compress = methods.filter { method -> method.instructions().any { it.gzip() } }.one("call log compression")
    shape(compress.hasShape(listOf(dataType, FILE, SAVE_CALL_DEBUG), "V"), "call log compression signature changed")
    val compressing = compress.instructions()
    val gzip = compressing.indices.filter { compressing[it].gzip() }.one("call log gzip call")
    val compressionBranch = gzip + 2
    shape(compressing.getOrNull(gzip + 1)?.opcode == Opcode.MOVE_RESULT &&
        compressing.getOrNull(compressionBranch)?.opcode == Opcode.IF_NEZ &&
        compressing[compressionBranch].namedRegisters() == compressing[gzip + 1].namedRegisters() &&
        compressing.getOrNull(compressionBranch + 1)?.opcode == Opcode.RETURN_VOID &&
        compressing.any { it.call()?.let { call -> call.definingClass == "Lorg/telegram/messenger/AndroidUtilities;" &&
            call.name == "runOnUIThread" } == true }, "failed compression no longer returns before file upload")

    return linkedMapOf(
        CallDebugTarget.DEBUG to gate(done, request, finish, "skipCallDebugUpload(Z)Z", requested),
        CallDebugTarget.FILE to gate(upload, uploadAt, uploadFinish, "skipCallLogFileUpload()Z"),
        CallDebugTarget.LOG to gate(log, logRequest, noFile, "skipCallLogUpload()Z"),
    )
}

private fun gate(method: MutableMethod, index: Int, finish: Int, hook: String, parameter: Int? = null): CallDebugHook {
    shape(!AccessFlags.STATIC.isSet(method.accessFlags), "call diagnostic callback became static")
    val answer = method.freeLocalsAt(PATCH, index, 1, targets = listOf(finish), highest = 255).single()
    val invoke = if (parameter == null) "invoke-static {}, $CALL_DEBUG->$hook"
        else "invoke-static/range {v$parameter .. v$parameter}, $CALL_DEBUG->$hook"
    return CallDebugHook(method, index, finish, "$invoke\nmove-result v$answer\nif-nez v$answer, :hush_done")
}

private fun requestSite(method: Method, type: String): Int {
    val instructions = method.instructions()
    val index = instructions.indices.filter { instructions[it].opcode == Opcode.NEW_INSTANCE && instructions[it].reference() == type }
        .one("$type construction")
    val initialize = instructions.getOrNull(index + 1)
    shape(initialize?.call()?.let { it.definingClass == type && it.name == "<init>" && it.parameterTypes.isEmpty() } == true &&
        initialize.namedRegisters() == instructions[index].namedRegisters(), "call diagnostic request constructor changed")
    val send = instructions.filter { it.call()?.let { call -> call.definingClass == CONNECTIONS && call.name == "sendRequest" &&
        call.hasShape(listOf("Lorg/telegram/tgnet/TLObject;", "Lorg/telegram/tgnet/RequestDelegate;"), "I") } == true }.one("$type sendRequest")
    shape(send.namedRegisters().size == 3 && send.namedRegisters()[1] == instructions[index].namedRegisters()[0],
        "call diagnostic request is not the object sent")
    return index
}

private fun shape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason; refuses changed call diagnostic geometry before editing")
}
private fun <T> List<T>.one(what: String): T {
    shape(size == 1, "$what has $size matches")
    return single()
}
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.reference(): String? = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Method.constructs(type: String) = instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == type }
private fun MethodReference.hasShape(parameters: List<String>, returns: String) = returnType == returns && parameterTypes.map { it.toString() } == parameters
private fun Instruction.fileUpload() = call()?.let { it.definingClass == "Lorg/telegram/messenger/FileLoader;" && it.name == "uploadFile" &&
    it.hasShape(listOf("Ljava/lang/String;", "Lorg/telegram/messenger/Utilities\$Callback;"), "V") } == true
private fun Instruction.gzip() = call()?.let { it.definingClass == "Lorg/telegram/messenger/AndroidUtilities;" && it.name == "gzip" &&
    it.hasShape(listOf(FILE, FILE), "Z") } == true
