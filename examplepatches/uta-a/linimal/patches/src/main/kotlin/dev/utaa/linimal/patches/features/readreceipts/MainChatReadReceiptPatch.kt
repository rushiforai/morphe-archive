package dev.utaa.linimal.patches.features.readreceipts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Annotation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.features.browser.externalBrowserChatTextLinkPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.HASH_MAP
import dev.utaa.linimal.patches.util.LONG
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.branchTargetAddress
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.instructionAddress
import dev.utaa.linimal.patches.util.instructionWritesRegister
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import dev.utaa.linimal.patches.util.registerSurvivesBetween

private const val SHARED_PREFERENCES = "Landroid/content/SharedPreferences;"
private const val SHARED_PREFERENCES_EDITOR = "Landroid/content/SharedPreferences\$Editor;"
private const val TALK_SERVICE_CLIENT = "Ljp/naver/line/android/thrift/client/TalkServiceClient;"
private const val THROWABLE_SCRATCH_REGISTER = 0

/** 公式の「既読にする」ボタンの coroutine。DebugMetadata の `c` / `f` は難読化されません。 */
private const val MARK_AS_READ_BUTTON_COROUTINE =
    "com.linecorp.line.chat.ui.impl.message.list.row.UnreadMarkViewController\$bindMarkAsReadButton\$1\$1"
private const val MARK_AS_READ_BUTTON_SOURCE = "UnreadMarkViewController.kt"
private const val READ_RECEIPT_HOOKS =
    "Ldev/utaa/linimal/extension/features/readreceipts/ReadReceiptHooks;"
private const val SHOULD_SUPPRESS =
    "$READ_RECEIPT_HOOKS->shouldSuppressAutomatic(Ljava/lang/String;)Z"
private const val BEGIN_MANUAL =
    "$READ_RECEIPT_HOOKS->beginManualInvocation(Ljava/lang/String;)V"
private const val CLEAR_MANUAL =
    "$READ_RECEIPT_HOOKS->clearManualInvocation()V"
private const val REGISTER_SUPPLIER =
    "$READ_RECEIPT_HOOKS->registerSupplierFromCurrentInvocation(Ljava/lang/Object;Ljava/lang/String;)V"
private const val PREPARE_SUPPLIER =
    "$READ_RECEIPT_HOOKS->prepareSupplier(Ljava/lang/Object;Ljava/lang/String;)V"
private const val CLEAR_PREPARED =
    "$READ_RECEIPT_HOOKS->clearPreparedSupplier()V"

/** 命令 0 の if-eqz が飛び越す先。local update と chat-list Runnable の合流点です。 */
private const val OUTBOUND_GATE_MERGE_INDEX = 5

/**
 * 通常チャットの outbound read-receipt sender を、FAILED_CHAT_CHECKED 専用 queue・成功時の
 * SharedPreferences remove・RPC の全てを組み合わせて識別します。OpenChat/Square、Service Chat、
 * AI Character の経路はこの fingerprint に含めません。
 *
 * <p>このメソッドは「既読にする」処理そのもので、ローカル未読のクリア（`(String)V`）と既読位置の
 * 前進（`(J, String)V`）を実行してから RPC（`(I, String, String)V`）を呼びます。これらの名前は
 * 版ごとに難読化が変わるため、署名と呼び出し順で識別します。`readWithoutReceiptLocalReadBlockPatch` が
 * 同じメソッドの先頭へ別の gate を注入するため、fingerprint は複製せずここを共有します。
 * 両者が同じメソッドへ当たることを定義として保証するためです。</p>
 */
internal val outboundGateFingerprint = Fingerprint(
    returnType = VOID,
    parameters = listOf(LONG, STRING, BOOLEAN),
    // MethodCallFilter は interface bridge の declaration variation を過度に狭めるため、ここでは
    // 全 reference/opcode 条件を custom predicate で同時に検証します。
    custom = { method, _ -> hasOutboundGateReferences(method) },
)

/** FAILED_CHAT_CHECKED を保持する encrypted preference wrapper だけを queue clear の対象にします。 */
private val failedChatCheckedStoreFingerprint = Fingerprint(
    returnType = VOID,
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(fieldAccess(name = "FAILED_CHAT_CHECKED", opcode = Opcode.SGET_OBJECT)),
    custom = { _, classDef -> classDef.fields.any { it.type == SHARED_PREFERENCES } },
)

/**
 * 公式の「既読にする」ボタンが動かす coroutine。26.11.0 の `MainChatMarkAsReadExecutor` は metadata も
 * 消え、26.16.0 では送信後・リアクション後・メッセージ削除後の自動既読も同じ executor を通るため、
 * executor ではなくボタンの coroutine だけを「手動」の起点にします。
 */
private val markAsReadButtonFingerprint = Fingerprint(
    name = "invokeSuspend",
    returnType = OBJECT,
    parameters = listOf(OBJECT),
    custom = { _, classDef -> classDef.annotations.any(::isMarkAsReadButtonMetadata) },
)

/** Rx Single を作る supplier factory。constructor -> Rx Single -> cached scheduler chain を必須にします。 */
internal val supplierFactoryFingerprint = Fingerprint(
    parameters = listOf(STRING),
    custom = { method, classDef ->
        hasSupplierFactoryReferences(method) && classDef.methods.any(::hasOutboundGateReferences)
    },
)

/** RxJava の実装文字列を使い、難読化された scheduler field 名ではなく cached scheduler type を導きます。 */
private val cachedThreadSchedulerFingerprint = Fingerprint(
    strings = listOf("RxCachedThreadScheduler"),
)

private data class OutboundGateShape(
    val insertionIndex: Int,
    val queueField: FieldReference,
    val queueInit: MethodReference,
    val queueMapField: FieldReference,
    val queueStoreField: FieldReference,
    val storePreferencesField: FieldReference,
)

/** 手動既読ボタンから executor を呼ぶ命令の位置。いずれも注入前の index です。 */
internal data class ManualButtonShape(
    val executorCallIndex: Int,
    val cleanupIndex: Int,
    val chatIdRegister: Int,
    val executorCall: MethodReference,
)

private data class SupplierFactoryShape(
    val supplierType: String,
    val onSubscribeType: String,
    val constructorIndex: Int,
    val supplierRegister: Int,
    val chatIdRegister: Int,
)

private fun hasOutboundGateReferences(method: Method): Boolean {
    val instructions = method.implementation?.instructions?.toList() ?: return false
    fun indexOfCallAfter(startExclusive: Int, predicate: (MethodReference, Opcode) -> Boolean): Int =
        instructions.withIndex().firstOrNull { (index, instruction) ->
            index > startExclusive &&
                methodReference(instruction)?.let { reference -> predicate(reference, instruction.opcode) } == true
        }?.index ?: -1

    val localUpdate = indexOfCallAfter(-1) { reference, opcode ->
        opcode == Opcode.INVOKE_INTERFACE &&
            reference.parameterTypes.map(CharSequence::toString) == listOf(STRING) && reference.returnType == VOID
    }
    val runnable = indexOfCallAfter(localUpdate) { reference, opcode ->
        opcode == Opcode.INVOKE_VIRTUAL && reference.name == "run" &&
            reference.parameterTypes.isEmpty() && reference.returnType == VOID
    }
    val mapGet = indexOfCallAfter(runnable) { reference, opcode ->
        opcode == Opcode.INVOKE_VIRTUAL && methodMatches(reference, HASH_MAP, "get", listOf(OBJECT), OBJECT)
    }
    val mapPut = indexOfCallAfter(mapGet) { reference, opcode ->
        opcode == Opcode.INVOKE_VIRTUAL && methodMatches(reference, HASH_MAP, "put", listOf(OBJECT, OBJECT), OBJECT)
    }
    val localRead = indexOfCallAfter(mapPut) { reference, opcode ->
        opcode == Opcode.INVOKE_INTERFACE &&
            reference.parameterTypes.map(CharSequence::toString) == listOf(LONG, STRING) && reference.returnType == VOID
    }
    val rpc = indexOfCallAfter(localRead) { reference, opcode ->
        opcode == Opcode.INVOKE_INTERFACE && isChatCheckedRpc(reference)
    }
    val remove = indexOfCallAfter(rpc) { reference, opcode ->
        opcode == Opcode.INVOKE_INTERFACE &&
            methodMatches(reference, SHARED_PREFERENCES_EDITOR, "remove", listOf(STRING), SHARED_PREFERENCES_EDITOR)
    }
    val failedSave = indexOfCallAfter(remove) { reference, opcode ->
        opcode == Opcode.INVOKE_INTERFACE &&
            methodMatches(reference, SHARED_PREFERENCES_EDITOR, "putLong", listOf(STRING, LONG), SHARED_PREFERENCES_EDITOR)
    }
    return localUpdate >= 0 && runnable >= 0 && mapGet >= 0 && mapPut >= 0 && localRead >= 0 &&
        rpc >= 0 && remove >= 0 && failedSave >= 0
}

/** Talk サービスの既読送信 RPC。interface は非難読化で、メソッド名だけが版ごとに変わります。 */
private fun isChatCheckedRpc(reference: MethodReference): Boolean =
    reference.definingClass == TALK_SERVICE_CLIENT &&
        reference.parameterTypes.map(CharSequence::toString) == listOf("I", STRING, STRING) &&
        reference.returnType == VOID

private fun hasSupplierFactoryReferences(method: Method): Boolean {
    if (!method.returnType.startsWith("L")) {
        return false
    }
    val instructions = method.implementation?.instructions?.toList() ?: return false
    return instructions.any { instruction ->
        methodReference(instruction)?.let { reference ->
            instruction.opcode == Opcode.INVOKE_DIRECT && reference.name == "<init>" &&
                reference.parameterTypes.size == 1 && reference.returnType == VOID
        } == true
    } && instructions.any { instruction ->
        methodReference(instruction)?.let { reference ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL && reference.parameterTypes.size == 1 &&
                reference.returnType == method.returnType
        } == true
    }
}

/**
 * local update と chat-list Runnable を元どおり実行した直後に gate を置きます。suppression 時は
 * 既読位置の前進、RPC、失敗保存より前で終了し、同じ FAILED_CHAT_CHECKED queue の map/prefs だけを消去します。
 *
 * <p>注入は合流点そのものではなく、その直後の location に置きます。合流点は先頭の if-eqz の分岐先
 * であり、dexlib2 の注入では Label が既存 location に残るため、第 4 引数 Z が false の経路だけが
 * gate を飛び越して送信まで到達してしまいます。</p>
 */
val readReceiptOutboundGatePatch = bytecodePatch(
    name = "Automatic read receipts",
    description = "通常チャットの既読送信を、実行時設定で止められるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(externalBrowserChatTextLinkPatch)

    execute {
        val gateMatches = outboundGateFingerprint.matchAllOrNull().orEmpty()
        val storeMatches = failedChatCheckedStoreFingerprint.matchAllOrNull().orEmpty()
        if (gateMatches.size != 1 || storeMatches.size != 1) {
            if (gateMatches.size == 1) {
                // queue clear を一意に構成できない限り、gate 単体も適用済みとして扱わない。
                recordUnsafeFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_GATE),
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "ReadReceiptFailedQueueStoreNotUnique",
                )
            } else {
                recordFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_GATE),
                    expectedTargetCount = 1,
                    actualTargetCount = gateMatches.size,
                    reason = "ReadReceiptOutboundGateNotUnique",
                )
            }
            if (storeMatches.size == 1) {
                // outbound gate へ注入しないため、store anchor だけを適用済みとして記録しない。
                recordUnsafeFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_PENDING_QUEUE_CLEAR),
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "ReadReceiptOutboundGateNotUnique",
                )
            } else {
                recordFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_PENDING_QUEUE_CLEAR),
                    expectedTargetCount = 1,
                    actualTargetCount = storeMatches.size,
                    reason = "ReadReceiptFailedQueueStoreNotUnique",
                )
            }
            return@execute
        }

        val shape = outboundGateShape(gateMatches.single(), storeMatches.single().originalClassDef.type)
        if (shape == null) {
            recordUnsafeFeatureStatus(
                listOf(
                    PatchId.READ_RECEIPTS_MAIN_CHAT_GATE,
                    PatchId.READ_RECEIPTS_MAIN_CHAT_PENDING_QUEUE_CLEAR,
                ),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadReceiptOutboundInstructionShapeMismatch",
            )
            return@execute
        }

        injectOutboundGate(gateMatches.single().method, shape)
        recordFeatureStatus(
            listOf(
                PatchId.READ_RECEIPTS_MAIN_CHAT_GATE,
                PatchId.READ_RECEIPTS_MAIN_CHAT_PENDING_QUEUE_CLEAR,
            ),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ReadReceiptOutboundGateAndQueueClearInjected",
        )
    }
}

/**
 * 公式の「既読にする」ボタンの coroutine で、executor 呼び出しを囲みます。
 *
 * <p>26.16.0 の executor は送信後（`SendMessageReadPointUpdaterImpl`）、リアクション送信後、メッセージ削除後
 * からも呼ばれます。executor 自体へ注入すると、それらが「手動」扱いになり、自動既読を停止していても
 * 既読が相手へ届きます。26.11.0 までと同じく、明示的なボタン操作だけを手動として扱います。</p>
 */
val readReceiptManualCallerPatch = bytecodePatch(
    name = "Manual read caller",
    description = "LINE 自身の手動既読操作を識別できるよう、呼び出し元スレッドへ印を付けます。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(readReceiptOutboundGatePatch)

    execute {
        val buttons = markAsReadButtonFingerprint.matchAllOrNull().orEmpty()
        val factories = supplierFactoryFingerprint.matchAllOrNull().orEmpty()
        if (buttons.size != 1 || factories.size != 1) {
            if (buttons.size == 1) {
                // supplier chain が一意でなければ、caller anchor だけを適用済みとしない。
                recordUnsafeFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_MANUAL_CALLER),
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "ReadReceiptManualCallerDependencyMismatch",
                )
            } else {
                recordFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_MANUAL_CALLER),
                    expectedTargetCount = 1,
                    actualTargetCount = buttons.size,
                    reason = "ReadReceiptManualCallerNotUnique",
                )
            }
            return@execute
        }

        val button = buttons.single()
        val shape = manualButtonShape(button.originalMethod)
        if (shape == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_MANUAL_CALLER),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadReceiptManualCallerInstructionShapeMismatch",
            )
            return@execute
        }

        // ボタンが呼ぶ interface の実装のうち、通常チャットの supplier factory へ届くものが 1 つだけであること。
        // OpenChat 用の実装は factory を呼ばないため、ここで除外されます。
        val factoryMethod = factories.single().originalMethod
        val executors = Fingerprint(
            parameters = shape.executorCall.parameterTypes.map(CharSequence::toString),
            returnType = shape.executorCall.returnType,
            custom = { method, classDef ->
                method.name == shape.executorCall.name &&
                    classDef.interfaces.contains(shape.executorCall.definingClass) &&
                    method.implementation?.instructions?.any { instruction ->
                        methodReference(instruction)?.sameMethod(factoryMethod) == true
                    } == true
            },
        ).matchAllOrNull().orEmpty()
        if (executors.size != 1) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_MANUAL_CALLER),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadReceiptManualExecutorNotUnique",
            )
            return@execute
        }

        injectManualCaller(button.method, shape)
        recordFeatureStatus(
            listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_MANUAL_CALLER),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ReadReceiptManualCallerCleanupInjected",
        )
    }
}

/** supplier identity へ caller thread の one-shot origin を移します。 */
val readReceiptSupplierRegistrationPatch = bytecodePatch(
    name = "Manual read handoff",
    description = "手動既読の印を、非同期処理へ引き継ぐための識別子として登録します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(readReceiptManualCallerPatch)

    execute {
        val factories = supplierFactoryFingerprint.matchAllOrNull().orEmpty()
        val schedulerTypes = cachedThreadSchedulerFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
        if (factories.size != 1 || schedulerTypes.isEmpty()) {
            if (factories.size == 1) {
                // cached scheduler を確認できない限り、factory anchor だけを適用済みとして記録しない。
                recordUnsafeFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_REGISTRATION),
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "ReadReceiptSupplierSchedulerUnavailable",
                )
            } else {
                recordFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_REGISTRATION),
                    expectedTargetCount = 1,
                    actualTargetCount = factories.size,
                    reason = "ReadReceiptSupplierFactoryNotUnique",
                )
            }
            return@execute
        }

        val shape = supplierFactoryShape(factories.single(), schedulerTypes, requireRegistration = false)
        if (shape == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_REGISTRATION),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadReceiptSupplierFactoryInstructionShapeMismatch",
            )
            return@execute
        }

        factories.single().method.addInstructions(
            shape.constructorIndex + 1,
            "invoke-static { v${shape.supplierRegister}, v${shape.chatIdRegister} }, $REGISTER_SUPPLIER",
        )
        recordFeatureStatus(
            listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_REGISTRATION),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ReadReceiptSupplierRegistrationInjected",
        )
    }
}

/** worker thread で supplier identity を allowance へ変換し、return/exception 全出口で cleanup します。 */
val readReceiptSupplierPreparationPatch = bytecodePatch(
    name = "Manual read permit",
    description = "非同期処理側で手動既読の識別子を送信許可へ変換し、処理の終了時に破棄します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(readReceiptSupplierRegistrationPatch)

    execute {
        val factories = supplierFactoryFingerprint.matchAllOrNull().orEmpty()
        val schedulerTypes = cachedThreadSchedulerFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
        if (factories.size != 1 || schedulerTypes.isEmpty()) {
            if (factories.size == 1) {
                recordUnsafeFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_PREPARATION),
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "ReadReceiptSupplierPreparationSchedulerUnavailable",
                )
            } else {
                recordFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_PREPARATION),
                    expectedTargetCount = 1,
                    actualTargetCount = factories.size,
                    reason = "ReadReceiptSupplierPreparationFactoryUnavailable",
                )
            }
            return@execute
        }

        val factoryShape = supplierFactoryShape(factories.single(), schedulerTypes, requireRegistration = true)
        if (factoryShape == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_PREPARATION),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadReceiptSupplierRegistrationChainMismatch",
            )
            return@execute
        }

        val workerMatches = supplierWorkerFingerprint(factoryShape.supplierType, factoryShape.onSubscribeType).matchAllOrNull().orEmpty()
        if (workerMatches.size != 1) {
            recordFeatureStatus(
                listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_PREPARATION),
                expectedTargetCount = 1,
                actualTargetCount = workerMatches.size,
                reason = "ReadReceiptSupplierWorkerNotUnique",
            )
            return@execute
        }

        val workerShape = supplierWorkerShape(workerMatches.single(), factories.single())
        if (workerShape == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_PREPARATION),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadReceiptSupplierWorkerInstructionShapeMismatch",
            )
            return@execute
        }

        injectSupplierPreparation(workerMatches.single().method, workerShape)
        recordFeatureStatus(
            listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_SUPPLIER_PREPARATION),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ReadReceiptSupplierPreparationCleanupInjected",
        )
    }
}

private fun outboundGateShape(match: Match, failedStoreType: String): OutboundGateShape? {
    val method = match.method
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions
    val parameterStart = implementation.registerCount - 5 // this + wide J + String + boolean
    val localMark = parameterStart + 4
    val thisRegister = parameterStart
    val readPointLow = parameterStart + 1
    val chatId = parameterStart + 3
    if (
        implementation.registerCount != 10 ||
        parameterStart != 5 ||
        instructions.size < 76 ||
        !isOneRegister(instructions[0], Opcode.IF_EQZ, localMark) ||
        !isIgetObject(instructions[1], localMark, thisRegister) ||
        !isInvoke(instructions[2], Opcode.INVOKE_INTERFACE, listOf(localMark, chatId), null, listOf(STRING), VOID) ||
        !isIgetObject(instructions[3], localMark, thisRegister) ||
        !isInvoke(instructions[4], Opcode.INVOKE_VIRTUAL, listOf(localMark), "run", emptyList(), VOID) ||
        !isIgetObject(instructions[5], localMark, thisRegister)
    ) {
        return null
    }

    val queueField = fieldReference(instructions[5]) ?: return null
    val queueType = queueField.type
    val queueInit = methodReference(instructions[7])
    val queueMapField = fieldReference(instructions[8])
    val mapGet = methodReference(instructions[9])
    val mapPut = methodReference(instructions[18])
    if (
        queueField.definingClass != match.originalClassDef.type ||
        !isOneRegister(instructions[6], Opcode.MONITOR_ENTER, localMark) ||
        queueInit == null ||
        queueInit.definingClass != queueType ||
        queueInit.parameterTypes.isNotEmpty() ||
        queueInit.returnType != VOID ||
        !isInvoke(instructions[7], Opcode.INVOKE_VIRTUAL, listOf(localMark), queueInit.name, emptyList(), VOID) ||
        queueMapField == null ||
        queueMapField.definingClass != queueType ||
        queueMapField.type != HASH_MAP ||
        !isTwoRegister(instructions[8], Opcode.IGET_OBJECT, 0, localMark) ||
        mapGet == null ||
        !methodMatches(mapGet, HASH_MAP, "get", listOf(OBJECT), OBJECT) ||
        !isInvokeRegisters(instructions[9], listOf(0, chatId)) ||
        mapPut == null ||
        !methodMatches(mapPut, HASH_MAP, "put", listOf(OBJECT, OBJECT), OBJECT) ||
        !isInvokeRegisters(instructions[18], listOf(3, chatId, 0)) ||
        !hasOutboundTail(instructions, readPointLow, chatId, thisRegister)
    ) {
        return null
    }

    val removeIndex = instructions.indexOfFirst { instruction ->
        methodReference(instruction)?.let {
            methodMatches(it, SHARED_PREFERENCES_EDITOR, "remove", listOf(STRING), SHARED_PREFERENCES_EDITOR)
        } == true
    }
    if (removeIndex < 4) {
        return null
    }
    val queueStoreField = fieldReference(instructions[removeIndex - 4])
    val storePreferencesField = fieldReference(instructions[removeIndex - 3])
    if (
        !isIgetObject(instructions[removeIndex - 4], 5, localMark) ||
        !isIgetObject(instructions[removeIndex - 3], 5, 5) ||
        queueStoreField == null ||
        queueStoreField.definingClass != queueType ||
        queueStoreField.type != failedStoreType ||
        storePreferencesField == null ||
        storePreferencesField.definingClass != failedStoreType ||
        storePreferencesField.type != SHARED_PREFERENCES ||
        !isInvokeRegisters(instructions[removeIndex], listOf(5, chatId)) ||
        !isOneRegister(instructions[removeIndex + 1], Opcode.MOVE_RESULT_OBJECT, 5) ||
        !isInvoke(instructions[removeIndex + 2], Opcode.INVOKE_INTERFACE, listOf(5), "apply", emptyList(), VOID)
    ) {
        return null
    }

    // 注入位置が既存の分岐先や例外 handler の先頭と一致すると、その経路だけが gate を飛び越します。
    // mutable 側の label 配置ではなく、transform 前 Match の instruction/exception table で判定します。
    val originalImplementation = match.originalMethod.implementation ?: return null
    val originalInstructions = originalImplementation.instructions.toList()
    val insertionIndex = outboundGateInsertionIndex(
        originalInstructions,
        exceptionHandlerAddresses(originalImplementation),
    ) ?: return null

    return OutboundGateShape(
        insertionIndex = insertionIndex,
        queueField = queueField,
        queueInit = queueInit,
        queueMapField = queueMapField,
        queueStoreField = queueStoreField,
        storePreferencesField = storePreferencesField,
    )
}

private fun hasOutboundTail(
    instructions: List<BuilderInstruction>,
    readPointLow: Int,
    chatId: Int,
    thisRegister: Int,
): Boolean {
    val q0Index = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_INTERFACE && methodReference(instruction)?.let { method ->
            method.parameterTypes.map(CharSequence::toString) == listOf(LONG, STRING) && method.returnType == VOID
        } == true
    }
    val rpcIndex = instructions.indexOfFirst { instruction ->
        methodReference(instruction)?.let(::isChatCheckedRpc) == true
    }
    val putLongIndex = instructions.indexOfFirst { instruction ->
        methodReference(instruction)?.let { method ->
            methodMatches(method, SHARED_PREFERENCES_EDITOR, "putLong", listOf(STRING, LONG), SHARED_PREFERENCES_EDITOR)
        } == true
    }
    return q0Index > 18 &&
        rpcIndex > q0Index &&
        putLongIndex > rpcIndex &&
        isInvokeRegisters(instructions[q0Index], listOf(9, readPointLow, readPointLow + 1, chatId)) &&
        isIgetObject(instructions[q0Index - 1], 9, thisRegister) &&
        isInvokeRegisters(instructions[rpcIndex], listOf(0, 9, chatId, 1))
}

/**
 * 合流点の直後へ注入するため、合流点が v9 に読み込んだ queue は gate の scratch 用途で潰れます。
 * fail-open で元の flow へ戻る `:originalQueue` で同じ iget-object を読み直し、続く monitor-enter が
 * 元どおり queue を掴めるようにします。
 */
private fun injectOutboundGate(method: MutableMethod, shape: OutboundGateShape) {
    val queueField = fieldSmali(shape.queueField)
    // 初期化 method 名は固定せず、元の flow が monitor-enter 直後に呼ぶ命令から導いたものを使います。
    val queueInit = methodSmali(shape.queueInit)
    val queueMapField = fieldSmali(shape.queueMapField)
    val queueStoreField = fieldSmali(shape.queueStoreField)
    val storePreferencesField = fieldSmali(shape.storePreferencesField)
    method.addInstructionsWithLabels(
        shape.insertionIndex,
        """
            invoke-static { v8 }, $SHOULD_SUPPRESS
            move-result v9
            if-eqz v9, :originalQueue
            iget-object v9, v5, $queueField
            monitor-enter v9
            invoke-virtual { v9 }, $queueInit
            iget-object v0, v9, $queueMapField
            invoke-virtual { v0, v8 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            iget-object v0, v9, $queueStoreField
            iget-object v0, v0, $storePreferencesField
            invoke-interface { v0 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v0
            invoke-interface { v0, v8 }, Landroid/content/SharedPreferences${'$'}Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v0
            invoke-interface { v0 }, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
            monitor-exit v9
            return-void
            :clearFailure
            move-exception v0
            monitor-exit v9
            goto :originalQueue
            :originalQueue
            iget-object v9, v5, $queueField
        """.trimIndent(),
    )

    // suppress branch の queue clear 自体が異常なら monitor を解放して、元の queue/RPC flow へ fail-open。
    val implementation = checkNotNull(method.implementation)
    implementation.addCatch(
        implementation.newLabelForIndex(shape.insertionIndex + 5),
        implementation.newLabelForIndex(shape.insertionIndex + 16),
        implementation.newLabelForIndex(shape.insertionIndex + 18),
    )
}

private fun isMarkAsReadButtonMetadata(annotation: Annotation): Boolean {
    val strings = annotation.elements.associate { element ->
        element.name to (element.value as? StringEncodedValue)?.value
    }
    return strings["c"] == MARK_AS_READ_BUTTON_COROUTINE && strings["f"] == MARK_AS_READ_BUTTON_SOURCE
}

/**
 * ボタンの coroutine から executor 呼び出しの位置を求めます。suspend 呼び出しは同じ thread で
 * 同期的に戻るため、`move-result-object` の直後で解除すれば印は次の処理へ漏れません。
 * supplier 登録が印を消費するので、通常は解除時点で既に空です。
 */
internal fun manualButtonShape(method: Method): ManualButtonShape? {
    val implementation = method.implementation ?: return null
    if (implementation.tryBlocks.isNotEmpty()) {
        return null
    }
    val instructions = implementation.instructions.toList()
    val calls = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.INVOKE_INTERFACE && methodReference(instructions[index])?.let { reference ->
            val parameters = reference.parameterTypes.map(CharSequence::toString)
            parameters.size == 2 && parameters[0] == STRING && parameters[1].startsWith("L") &&
                reference.returnType == OBJECT
        } == true
    }
    val callIndex = calls.singleOrNull() ?: return null
    val call = instructions[callIndex] as? FiveRegisterInstruction ?: return null
    val cleanupIndex = callIndex + 2
    val handlerAddresses = exceptionHandlerAddresses(implementation)
    if (
        call.registerCount != 3 ||
        instructions.getOrNull(callIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT ||
        cleanupIndex > instructions.lastIndex ||
        isDivertedInjectionIndex(instructions, callIndex, handlerAddresses) ||
        isDivertedInjectionIndex(instructions, cleanupIndex, handlerAddresses)
    ) {
        return null
    }
    return ManualButtonShape(
        executorCallIndex = callIndex,
        cleanupIndex = cleanupIndex,
        chatIdRegister = call.registerD,
        executorCall = checkNotNull(methodReference(call)),
    )
}

/**
 * executor 呼び出しの直前で印を付け、正常時は結果を受け取った直後、例外時は handler で解除します。
 * 元のメソッドに try block は無く、handler は例外を投げ直すだけなので、v0 を潰しても元の処理へ影響しません。
 */
private fun injectManualCaller(method: MutableMethod, shape: ManualButtonShape) {
    method.addInstructions(shape.cleanupIndex, "invoke-static { }, $CLEAR_MANUAL")
    method.addInstructions(shape.executorCallIndex, "invoke-static/range { v${shape.chatIdRegister} .. v${shape.chatIdRegister} }, $BEGIN_MANUAL")

    val implementation = checkNotNull(method.implementation)
    val handlerIndex = implementation.instructions.size
    method.addInstructions(
        handlerIndex,
        """
            move-exception v$THROWABLE_SCRATCH_REGISTER
            invoke-static { }, $CLEAR_MANUAL
            throw v$THROWABLE_SCRATCH_REGISTER
        """.trimIndent(),
    )
    // begin の次（executor 呼び出し）から cleanup の手前までを覆います。
    implementation.addCatch(
        implementation.newLabelForIndex(shape.executorCallIndex + 1),
        implementation.newLabelForIndex(shape.cleanupIndex + 1),
        implementation.newLabelForIndex(handlerIndex),
    )
}

private fun supplierFactoryShape(
    match: Match,
    cachedSchedulerTypes: Set<String>,
    requireRegistration: Boolean,
): SupplierFactoryShape? {
    val method = match.method
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions
    val parameterStart = implementation.registerCount - 2
    if (implementation.registerCount != 3 || parameterStart != 1 || instructions.size !in 8..9) {
        return null
    }
    val supplierNew = instructions[0]
    val supplierType = typeReference(supplierNew) ?: return null
    val supplierRegister = (supplierNew as? OneRegisterInstruction)?.registerA ?: return null
    val constructor = instructions.getOrNull(1)
    val constructorReference = methodReference(constructor)
    if (
        supplierNew.opcode != Opcode.NEW_INSTANCE ||
        supplierRegister != 0 ||
        constructorReference == null ||
        constructorReference.definingClass != supplierType ||
        constructorReference.name != "<init>" ||
        constructorReference.parameterTypes != listOf(match.originalClassDef.type, STRING) ||
        constructorReference.returnType != VOID ||
        !isInvokeRegisters(constructor, listOf(supplierRegister, parameterStart, parameterStart + 1))
    ) {
        return null
    }

    val registrationIndex = 2
    val registrationPresent = isInvoke(
        instructions.getOrNull(registrationIndex),
        Opcode.INVOKE_STATIC,
        listOf(supplierRegister, parameterStart + 1),
        "registerSupplierFromCurrentInvocation",
        listOf(OBJECT, STRING),
        VOID,
        definingClass = READ_RECEIPT_HOOKS,
    )
    if (requireRegistration != registrationPresent) {
        return null
    }
    val wrapperNewIndex = if (registrationPresent) 3 else 2
    val wrapperNew = instructions.getOrNull(wrapperNewIndex)
    val wrapperConstructor = instructions.getOrNull(wrapperNewIndex + 1)
    val schedulerRead = instructions.getOrNull(wrapperNewIndex + 2)
    val schedule = instructions.getOrNull(wrapperNewIndex + 3)
    val scheduleReference = methodReference(schedule)
    val onSubscribeType = methodReference(wrapperConstructor)?.parameterTypes?.singleOrNull()?.toString()
    val result = instructions.getOrNull(wrapperNewIndex + 4)
    val returned = instructions.getOrNull(wrapperNewIndex + 5)
    val schedulerField = fieldReference(schedulerRead)
    if (
        wrapperNew?.opcode != Opcode.NEW_INSTANCE ||
        !isOneRegister(wrapperNew, Opcode.NEW_INSTANCE, 1) ||
        onSubscribeType == null ||
        !isInvoke(
            wrapperConstructor,
            Opcode.INVOKE_DIRECT,
            listOf(1, supplierRegister),
            "<init>",
            listOf(onSubscribeType),
            VOID,
            definingClass = typeReference(wrapperNew),
        ) ||
        schedulerField == null ||
        schedulerField.type !in cachedSchedulerTypes ||
        !isOneRegister(schedulerRead, Opcode.SGET_OBJECT, parameterStart + 1) ||
        scheduleReference == null ||
        scheduleReference.parameterTypes.size != 1 ||
        !isInvoke(
            schedule,
            Opcode.INVOKE_VIRTUAL,
            listOf(1, parameterStart + 1),
            null,
            scheduleReference.parameterTypes.map(CharSequence::toString),
            method.returnType,
        ) ||
        !isOneRegister(result, Opcode.MOVE_RESULT_OBJECT, 1) ||
        !isOneRegister(returned, Opcode.RETURN_OBJECT, 1)
    ) {
        return null
    }
    return SupplierFactoryShape(
        supplierType = supplierType,
        onSubscribeType = onSubscribeType,
        constructorIndex = 1,
        supplierRegister = supplierRegister,
        chatIdRegister = parameterStart + 1,
    )
}

/** supplier worker（`run()V`、registers 6 / ins 1）における `this` の register。 */
private const val THIS_REGISTER = 5

/** prefix 内でだけ使う一時 register。元の命令 4 の `const-wide/16 v3` が pair の上位半分として潰します。 */
private const val SCRATCH_REGISTER = 4

/**
 * supplier worker へ注入する位置。**注入前**の命令列における index です。
 *
 * <ul>
 *   <li>0: prefix（`prepareSupplier`）。`run()` に入るすべての経路が通る必要があります。</li>
 *   <li>7: read point == 0 の早期 `return-void` の直前 cleanup。</li>
 *   <li>10: `d()` 正常終了後の `return-void` の直前 cleanup。</li>
 * </ul>
 *
 * <p>[injectSupplierPreparation] は先行する注入ぶんずれた index（0 / 9 / 13）を使うため、
 * 分岐先かどうかの判定はここに並べた注入前の index で行わなければ意味を持ちません。</p>
 */
internal val SUPPLIER_PREPARATION_INJECTION_INDICES = listOf(0, 7, 10)

internal data class SupplierWorkerShape(val chatIdField: FieldReference)

private fun supplierWorkerFingerprint(supplierType: String, onSubscribeType: String) = Fingerprint(
    definingClass = supplierType,
    name = "run",
    returnType = VOID,
    parameters = emptyList(),
    filters = listOf(
        methodCall(parameters = listOf(STRING), returnType = LONG, opcode = Opcode.INVOKE_VIRTUAL),
        methodCall(parameters = listOf(LONG, STRING, BOOLEAN), returnType = VOID, opcode = Opcode.INVOKE_VIRTUAL),
    ),
    custom = { _, classDef -> classDef.interfaces.contains(onSubscribeType) },
)

private fun supplierWorkerShape(match: Match, factory: Match): SupplierWorkerShape? {
    val method = match.method
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions
    val readPointCallIndex = instructions.indexOfFirst { instruction ->
        methodReference(instruction)?.let { it.definingClass == factory.originalClassDef.type && it.parameterTypes == listOf(STRING) && it.returnType == LONG } == true
    }
    val outboundCallIndex = instructions.indexOfFirst { instruction ->
        methodReference(instruction)?.let {
            it.definingClass == factory.originalClassDef.type &&
                it.parameterTypes == listOf(LONG, STRING, BOOLEAN) && it.returnType == VOID
        } == true
    }
    val parameterStart = implementation.registerCount - 1 // this のみ（run()V は引数なし）
    val chatIdField = fieldReference(instructions.elementAtOrNull(1))
    if (
        implementation.registerCount != 6 ||
        implementation.tryBlocks.isNotEmpty() ||
        instructions.size != 11 ||
        readPointCallIndex != 2 ||
        outboundCallIndex != 9 ||
        !isIgetObject(instructions[0], 0, 5) ||
        !isIgetObject(instructions[1], 5, 5) ||
        !isInvokeRegisters(instructions[2], listOf(0, 5)) ||
        !isOneRegister(instructions[3], Opcode.MOVE_RESULT_WIDE, 1) ||
        instructions[7].opcode != Opcode.RETURN_VOID ||
        !isOneRegister(instructions[8], Opcode.CONST_4, 3) ||
        !isInvokeRegisters(instructions[9], listOf(0, 1, 2, 5, 3)) ||
        instructions[10].opcode != Opcode.RETURN_VOID ||
        // 命令 0 の時点で値を持つのは parameter register だけです。scratch はその手前から選びます。
        SCRATCH_REGISTER >= parameterStart ||
        chatIdField == null ||
        chatIdField.definingClass != method.definingClass ||
        chatIdField.type != STRING ||
        // prefix が scratch へ書いてから読み出すまでに、その値が生き残ることを実際の並びで確認します。
        !prefixKeepsScratchRegister(prefixInstructions(chatIdField))
    ) {
        return null
    }

    // prefix と cleanup は、run() に入った全経路が必ず通らなければ one-shot が残留します。
    // mutable 側の label 配置ではなく、transform 前 Match の instruction/exception table で判定します。
    // try block は上で拒否済みなので handler の集合は空ですが、前提が崩れた場合に備えて渡します。
    val originalImplementation = match.originalMethod.implementation ?: return null
    if (
        supplierPreparationInjectionDiverted(
            originalImplementation.instructions.toList(),
            exceptionHandlerAddresses(originalImplementation),
        )
    ) {
        return null
    }
    return SupplierWorkerShape(chatIdField)
}

/**
 * [SUPPLIER_PREPARATION_INJECTION_INDICES] のいずれかが既存の分岐先や例外 handler の先頭と
 * 一致するかどうか。一致する位置へ注入すると、その経路だけが prepare / cleanup を飛び越します。
 */
internal fun supplierPreparationInjectionDiverted(
    instructions: List<Instruction>,
    handlerAddresses: Set<Int>,
): Boolean = SUPPLIER_PREPARATION_INJECTION_INDICES.any { index ->
    isDivertedInjectionIndex(instructions, index, handlerAddresses)
}

/**
 * 注入する prefix 2 命令の並び。`iget-object v4, v5, <chatId>` で chatId を読み、直後に
 * `prepareSupplier(this, chatId)` へ渡します。v5 は命令 1（元の index 1）で chatId に潰されるため、
 * prepare はそれより前でなければ `this` を渡せません。
 */
private fun prefixInstructions(chatIdField: FieldReference): List<Instruction> = listOf(
    ImmutableInstruction22c(Opcode.IGET_OBJECT, SCRATCH_REGISTER, THIS_REGISTER, chatIdField),
    ImmutableInstruction35c(
        Opcode.INVOKE_STATIC,
        2,
        THIS_REGISTER,
        SCRATCH_REGISTER,
        0,
        0,
        0,
        ImmutableMethodReference(READ_RECEIPT_HOOKS, "prepareSupplier", listOf(OBJECT, STRING), VOID),
    ),
)

/**
 * prefix が scratch register へ書いた値を、読み出すまで保持しているかどうか。
 *
 * <p>書き込みと読み出しの index を並びから求め、その区間で値が潰されないことを確認します。
 * 区間を固定値で書くと、prefix に命令を足したときに検証が素通りします。実際に
 * `registerSurvivesBetween(prefix, SCRATCH_REGISTER, 0, 1)` は区間が空で恒真になっており、
 * wide 命令による破壊を防ぐという意図をまったく果たしていませんでした。</p>
 */
internal fun prefixKeepsScratchRegister(prefix: List<Instruction>): Boolean {
    val writeIndex = prefix.indexOfFirst { instructionWritesRegister(it, SCRATCH_REGISTER) }
    if (writeIndex < 0) {
        return false
    }
    val useIndex = prefix.indexOfFirst { index ->
        invokeReadsRegister(index, SCRATCH_REGISTER)
    }
    if (useIndex <= writeIndex) {
        return false
    }
    return registerSurvivesBetween(prefix, SCRATCH_REGISTER, writeIndex, useIndex)
}

/**
 * invoke が [register] を引数として読むかどうか。35c 形式は使わない slot が 0 を返すため、
 * `registerCount` を超えて読むと register 0 を誤検出します。
 */
private fun invokeReadsRegister(instruction: Instruction, register: Int): Boolean {
    val invoke = instruction as? FiveRegisterInstruction ?: return false
    return listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF, invoke.registerG)
        .take(invoke.registerCount)
        .contains(register)
}

private fun injectSupplierPreparation(method: MutableMethod, shape: SupplierWorkerShape) {
    val chatIdField = with(shape.chatIdField) { "$definingClass->$name:$type" }

    // v5(p0) は元の命令 1 で chatId に潰されるため、prepare はその手前で呼びます。v4 は元の命令 4 の
    // const-wide/16 v3 が pair の上位半分として潰すので、直後の 1 命令でしか使いません。
    method.addInstructions(
        0,
        """
            iget-object v$SCRATCH_REGISTER, v$THIS_REGISTER, $chatIdField
            invoke-static { v$THIS_REGISTER, v$SCRATCH_REGISTER }, $PREPARE_SUPPLIER
        """.trimIndent(),
    )

    // 元の index 7（read point == 0 の return）は prefix 2 命令ぶん後ろの index 9 です。
    method.addInstructions(9, "invoke-static { }, $CLEAR_PREPARED")
    // d() 正常終了後の return は、その cleanup 1 命令ぶんさらに後ろの index 13 です。
    method.addInstructions(13, "invoke-static { }, $CLEAR_PREPARED")

    val implementation = checkNotNull(method.implementation)
    val handlerIndex = implementation.instructions.size
    method.addInstructions(
        handlerIndex,
        """
            move-exception v0
            invoke-static { }, $CLEAR_PREPARED
            throw v0
        """.trimIndent(),
    )
    // 元の supplier に handler はありません。prefix の直後から末尾までを覆い、どの経路でも one-shot を残しません。
    implementation.addCatch(
        implementation.newLabelForIndex(2),
        implementation.newLabelForIndex(handlerIndex),
        implementation.newLabelForIndex(handlerIndex),
    )
}

private fun methodReference(instruction: Instruction?): MethodReference? =
    (instruction as? ReferenceInstruction)?.reference as? MethodReference

private fun fieldReference(instruction: Instruction?): FieldReference? =
    (instruction as? ReferenceInstruction)?.reference as? FieldReference

private fun typeReference(instruction: Instruction?): String? =
    ((instruction as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.TypeReference)?.type

private fun fieldSmali(field: FieldReference): String = "${field.definingClass}->${field.name}:${field.type}"

private fun methodSmali(method: MethodReference): String =
    "${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"

private fun methodMatches(
    reference: MethodReference,
    definingClass: String,
    name: String,
    parameters: List<String>,
    returnType: String,
): Boolean = reference.definingClass == definingClass &&
    reference.name == name &&
    reference.parameterTypes.map(CharSequence::toString) == parameters &&
    reference.returnType == returnType

private fun MethodReference.sameMethod(other: Method): Boolean =
    definingClass == other.definingClass &&
        name == other.name &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString) &&
        returnType == other.returnType

private fun isOneRegister(instruction: Instruction?, opcode: Opcode, register: Int): Boolean =
    instruction?.opcode == opcode && (instruction as? OneRegisterInstruction)?.registerA == register

private fun isTwoRegister(
    instruction: Instruction?,
    opcode: Opcode,
    first: Int,
    second: Int,
): Boolean = instruction?.opcode == opcode &&
    (instruction as? TwoRegisterInstruction)?.let { it.registerA == first && it.registerB == second } == true

private fun isIgetObject(instruction: Instruction?, destination: Int, receiver: Int): Boolean =
    isTwoRegister(instruction, Opcode.IGET_OBJECT, destination, receiver)

private fun isInvoke(
    instruction: Instruction?,
    opcode: Opcode,
    registers: List<Int>,
    name: String?,
    parameters: List<String>,
    returnType: String,
    definingClass: String? = null,
): Boolean {
    val reference = methodReference(instruction) ?: return false
    return instruction?.opcode == opcode &&
        (definingClass == null || reference.definingClass == definingClass) &&
        (name == null || reference.name == name) &&
        reference.parameterTypes.map(CharSequence::toString) == parameters &&
        reference.returnType == returnType &&
        isInvokeRegisters(instruction, registers)
}

private fun isInvokeRegisters(instruction: Instruction?, expected: List<Int>): Boolean {
    val invoke = instruction as? FiveRegisterInstruction ?: return false
    val actual = listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF, invoke.registerG)
        .take(invoke.registerCount)
    return actual == expected
}

/**
 * outbound gate の注入位置。命令 0 の if-eqz は local update と chat-list Runnable を飛び越して queue
 * 取得へ分岐するため、その分岐先そのものへ注入すると第 4 引数 Z が false の経路だけが gate を飛び越し、
 * 抑制されないまま送信へ到達します。分岐先の直後なら fall-through と分岐の双方が gate を通ります。
 */
internal fun outboundGateInsertionIndex(
    instructions: List<Instruction>,
    handlerAddresses: Set<Int>,
): Int? {
    if (instructions.getOrNull(0)?.opcode != Opcode.IF_EQZ) {
        return null
    }
    val mergeAddress = branchTargetAddress(instructions, 0) ?: return null
    val mergeIndex = instructions.indices
        .firstOrNull { index -> instructionAddress(instructions, index) == mergeAddress }
        ?: return null
    if (mergeIndex != OUTBOUND_GATE_MERGE_INDEX) {
        return null
    }
    val insertionIndex = mergeIndex + 1
    return insertionIndex.takeUnless { isDivertedInjectionIndex(instructions, it, handlerAddresses) }
}
