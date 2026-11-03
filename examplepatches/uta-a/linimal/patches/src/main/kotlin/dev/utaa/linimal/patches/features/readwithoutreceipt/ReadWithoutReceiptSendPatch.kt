package dev.utaa.linimal.patches.features.readwithoutreceipt

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.features.readreceipts.outboundGateFingerprint
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses

private const val STRING = "Ljava/lang/String;"
private const val HOOKS = "Ldev/utaa/linimal/extension/features/readwithoutreceipt/ReadWithoutReceiptSendHooks;"
private const val SUBMITTED = "linimalMessageSubmitted"
internal const val READ_AFTER_SEND = "linimalMarkReadAfterSend"
private const val SEND_COUNT = 13

private val textRequestFingerprint = Fingerprint(
    name = "toString", parameters = emptyList(), returnType = STRING,
    strings = listOf("Text(text=", ", targetChatId=", ", chatMessageSendSilentMode="),
)

/** 共通通信には触れず、各形式を送信キューへ渡す確認済み UI adapter の直後だけを観測します。 */
val readWithoutReceiptSendPatch = bytecodePatch(
    name = "既読なし閲覧中の送信で既読にする",
    description = "既読をつけずに開いた通常トークでも、送信操作で閲覧セッションを終了して既読を反映します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(readWithoutReceiptSessionPatch)
    execute {
        val ids = listOf(PatchId.READ_WITHOUT_RECEIPT_SEND, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_SEND)
        val texts = textRequestFingerprint.matchAllOrNull().orEmpty()
        val outbounds = outboundGateFingerprint.matchAllOrNull().orEmpty()
        if (texts.size != 1 || outbounds.size != 1) {
            recordUnappliedFeatureStatus(ids, 15, texts.size + outbounds.size, "SendReadModelsNotUnique")
            return@execute
        }
        val text = texts.single()
        val requestType = text.originalClassDef.superclass
        if (requestType == null) {
            recordUnsafeFeatureStatus(ids, 15, 2, "SendRequestBaseMissing")
            return@execute
        }
        val chatGetters = Fingerprint(
            definingClass = requestType, parameters = emptyList(), returnType = STRING,
            custom = { method, _ -> AccessFlags.ABSTRACT.isSet(method.accessFlags) },
        ).matchAllOrNull().orEmpty()
        val outbound = outbounds.single()
        val adapters = Fingerprint(
            parameters = listOf("Z"),
            filters = listOf(fieldAccess(name = "TO_BE_SENT_SILENTLY", opcode = Opcode.SGET_OBJECT)),
            custom = { _, classDef ->
                classDef.methods.any { method -> method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.NEW_INSTANCE &&
                        ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == text.originalClassDef.type
                } == true }
            },
        ).matchAllOrNull().orEmpty()
        if (chatGetters.size != 1 || adapters.size != 1) {
            recordUnappliedFeatureStatus(ids, 15, chatGetters.size + adapters.size,
                "SendReadTargetsNotUnique")
            return@execute
        }
        val chatGetter = chatGetters.single().originalMethod
        val textGetter = text.originalClassDef.methods.singleOrNull {
            it.name == chatGetter.name && it.parameterTypes.isEmpty() && it.returnType == STRING
        }
        val adapter = adapters.single()
        val sites = adapter.originalClassDef.methods.flatMap { method ->
            readWithoutReceiptSendSites(method, requestType).map { method to it }
        }
        val observationHook = readWithoutReceiptReadAttemptHook(outbound.originalMethod)
        val actual = sites.size + 2
        if (sites.size != SEND_COUNT || textGetter == null || !simpleTargetChatGetter(textGetter) ||
            !AccessFlags.PUBLIC.isSet(chatGetter.accessFlags) ||
            !AccessFlags.PUBLIC.isSet(outbound.originalMethod.accessFlags) || observationHook == null ||
            adapter.originalClassDef.methods.any { it.name == SUBMITTED } ||
            outbound.originalClassDef.methods.any { it.name == READ_AFTER_SEND }) {
            recordUnsafeFeatureStatus(ids, 15, actual, "SendReadShapeMismatch")
            return@execute
        }
        val submitted = generatedMethod(adapter.originalClassDef.type, SUBMITTED, listOf(requestType), 2, true)
        submitted.addInstructions(0, """
            invoke-virtual {p0}, $chatGetter
            move-result-object v0
            invoke-static {v0}, $HOOKS->onMessageSubmitted($STRING)V
        """.trimIndent())
        adapter.classDef.addGeneratedMethod(submitted)
        val readBridge = generatedMethod(outbound.originalClassDef.type, READ_AFTER_SEND, listOf("J", STRING), 6, false)
        readBridge.addInstructions(0, """
            invoke-static {p3}, Ldev/utaa/linimal/extension/features/readreceipts/ReadReceiptHooks;->prepareSentMessageRead($STRING)V
            const/4 v0, 0x1
            invoke-virtual {p0, p1, p2, p3, v0}, ${outbound.originalMethod}
        """.trimIndent())
        outbound.classDef.addGeneratedMethod(readBridge)
        // local read block より前で、実際に抑制する executor・J の両 register・chatId を保存します。
        checkNotNull(outbound.method.implementation).addInstruction(0, checkNotNull(observationHook))
        for ((method, site) in sites.sortedByDescending { it.second.index }) {
            val mutable = adapter.classDef.methods.single { it.name == method.name && it.parameterTypes == method.parameterTypes }
            mutable.addInstructions(site.index,
                "invoke-static/range {v${site.requestRegister} .. v${site.requestRegister}}, ${adapter.originalClassDef.type}->$SUBMITTED($requestType)V")
        }
        recordFeatureStatus(ids, 15, 15, "SendReadInjected")
    }
}

internal data class SendSubmissionSite(val index: Int, val requestRegister: Int)

/** 戻り値なしのキュー投入直後で、次の RETURN_VOID に分岐や handler が合流しない箇所だけを許可します。 */
internal fun readWithoutReceiptSendSites(method: Method, requestType: String): List<SendSubmissionSite> {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V") return emptyList()
    val implementation = method.implementation ?: return emptyList()
    val instructions = implementation.instructions.toList()
    return instructions.withIndex().mapNotNull { (index, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        val args = instruction as? FiveRegisterInstruction ?: return@mapNotNull null
        // 投入 API は (request, callback, Z)V。Z は送信 task へ渡るだけなので、値は判定に使いません。
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL || reference.returnType != "V" ||
            reference.parameterTypes.size != 3 || reference.parameterTypes[0] != requestType ||
            reference.parameterTypes[2] != "Z" ||
            args.registerCount != 4 || args.registerD >= implementation.registerCount ||
            instructions.getOrNull(index + 1)?.opcode != Opcode.RETURN_VOID ||
            isDivertedInjectionIndex(instructions, index + 1, exceptionHandlerAddresses(implementation))) return@mapNotNull null
        SendSubmissionSite(index + 1, args.registerD)
    }
}

private fun simpleTargetChatGetter(method: Method): Boolean {
    val instructions = method.implementation?.instructions?.toList() ?: return false
    if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags) || instructions.size != 2) return false
    val read = instructions[0] as? TwoRegisterInstruction ?: return false
    val field = (instructions[0] as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    val result = instructions[1] as? OneRegisterInstruction ?: return false
    return instructions[0].opcode == Opcode.IGET_OBJECT && field.type == STRING && field.definingClass == method.definingClass &&
        read.registerB == checkNotNull(method.implementation).registerCount - 1 &&
        instructions[1].opcode == Opcode.RETURN_OBJECT && result.registerA == read.registerA
}

/** this + J + String が連続する入口を range invoke で渡し、元の parameter を書き換えません。 */
internal fun readWithoutReceiptReadAttemptHook(method: Method): BuilderInstruction3rc? {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.parameterTypes != listOf("J", STRING, "Z") ||
        method.returnType != "V") return null
    val implementation = method.implementation ?: return null
    val register = implementation.registerCount - 5
    if (register < 1) return null
    return BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 4,
        ImmutableMethodReference(HOOKS, "recordReadAttempt", listOf("Ljava/lang/Object;", "J", STRING), "V"))
}

private fun generatedMethod(owner: String, name: String, parameters: List<String>, registers: Int, static: Boolean): MutableMethod {
    val implementation = MutableMethodImplementation(registers)
    implementation.addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
    return MutableMethod(ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, null, null) },
        "V", AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else AccessFlags.FINAL.value),
        null, null, implementation))
}

private fun MutableClass.addGeneratedMethod(method: MutableMethod) {
    methods.add(method)
    if (AccessFlags.STATIC.isSet(method.accessFlags)) directMethods.add(method) else virtualMethods.add(method)
}
