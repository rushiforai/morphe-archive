package dev.utaa.linimal.patches.features.readreceipts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.fallsThrough
import dev.utaa.linimal.patches.util.instructionAddress
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val JAVA_LIST = "Ljava/util/List;"
private const val INTENT = "Landroid/content/Intent;"
private const val NOTIFICATION_SERVICE =
    "Ljp/naver/line/android/access/remote/LineAccessServiceForNotification;"
private const val MARK_AS_READ_ACTION =
    "jp.naver.line.android.access.remote.action.MARK_AS_READ_ACTION"

/** 長押しメニューの「既読にする」。DebugMetadata の `c` / `f` は難読化されません。 */
private const val CONTEXT_MENU_COROUTINE =
    "com.linecorp.line.chatlist.viewmodel.ChatListContextMenuDialogModel\$markAsReadMainChat\$1"
private const val CONTEXT_MENU_SOURCE = "ChatListContextMenuDialogModel.kt"

/**
 * チャットサブタブの行アクションとプレビューメニューの「既読」。`z61/v1$e` の生成元は行アクション
 * （`b71/z0`）とメニュー結果（`y61/a.d`）だけで、メッセージリクエスト用の `$markMessageRequestsAsRead$2` は別です。
 */
private const val CHAT_SUBTAB_COROUTINE =
    "com.linecorp.line.chattab.chatsubtab.ChatSubTabActionRequestProcessor\$markMainChatAsRead\$2"
private const val CHAT_SUBTAB_SOURCE = "ChatSubTabActionRequestProcessor.kt"

/**
 * 一括既読メソッドの呼び出し元として許す coroutine。どちらも確認ダイアログまたはメニュー操作の後にだけ動きます。
 * ここに無い呼び出し元が増えた版では、自動経路が混ざっていないと確認できないため注入しません。
 */
private val MARK_ALL_AS_READ_COROUTINES = mapOf(
    "com.linecorp.line.chattab.ChatTabViewModel\$markAllAsReadForNormalChat\$2" to "ChatTabViewModel.kt",
    "com.linecorp.line.chatlist.viewmodel.ChatListHeaderViewModel\$markAllAsReadForNormalChat\$2" to
        "ChatListHeaderViewModel.kt",
)

private const val READ_RECEIPT_HOOKS =
    "Ldev/utaa/linimal/extension/features/readreceipts/ReadReceiptHooks;"
private const val BEGIN_MANUAL = "$READ_RECEIPT_HOOKS->beginManualInvocation(Ljava/lang/String;)V"
private const val CLEAR_MANUAL = "$READ_RECEIPT_HOOKS->clearManualInvocation()V"
private const val PREPARE_EXPLICIT = "$READ_RECEIPT_HOOKS->prepareExplicitRead(Ljava/lang/String;)V"
private const val CLEAR_PREPARED = "$READ_RECEIPT_HOOKS->clearPreparedSupplier()V"

/** 一括既読のループ内で、送信メソッドを呼ぶ命令の位置（いずれも注入前の index）。 */
internal data class MarkAllAsReadShape(
    val senderCallIndex: Int,
    val chatIdRegister: Int,
)

/**
 * 単一トークの supplier factory を呼ぶ命令の位置（いずれも注入前の index）。
 *
 * @param handlerCleanupIndices 呼び出しを覆う各 handler の中で印を解除する位置。覆う try が無い場合は空です。
 * @param needsCatchAll 覆う handler に catch-all が無く、それ以外の Throwable 用に handler を足す必要があるか。
 */
internal data class ExplicitFactoryCallShape(
    val factoryCallIndex: Int,
    val cleanupIndex: Int,
    val chatIdRegister: Int,
    val handlerCleanupIndices: List<Int> = emptyList(),
    val needsCatchAll: Boolean = false,
)

/**
 * トーク一覧の「すべて既読にする」、長押しの「既読にする」、通知の「既読」を、公式の既読ボタンと同じ
 * 手動操作として扱います。自動既読を停止していても、これらの操作だけは相手へ既読を送ります。
 *
 * <p>単一トークの入口は caller thread の印を supplier へ移す既存の受け渡しを使い、worker thread の
 * `prepareSupplier` が chatId 単位の一回限りの許可へ変換します。「すべて既読」は同じ thread で
 * 送信メソッドを順に呼ぶので、送信の直前に対象トークだけを許可し、直後に破棄します。</p>
 *
 * <p>既読なし閲覧中のトークは、送信メソッド先頭の local block と RPC block が別に止めるため、
 * ここで許可しても送られません。その場合に許可が次へ残らないよう、呼び出しの後で必ず破棄します。</p>
 */
val readReceiptExplicitMarkAsReadPatch = bytecodePatch(
    name = "Explicit mark as read",
    description = "すべて既読、長押しの既読、通知の既読を、手動の既読操作として識別します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(readReceiptSupplierPreparationPatch)

    execute {
        val allPatchIds = listOf(
            PatchId.READ_RECEIPTS_MAIN_CHAT_MARK_ALL_AS_READ,
            PatchId.READ_RECEIPTS_MAIN_CHAT_CONTEXT_MENU_READ,
            PatchId.READ_RECEIPTS_MAIN_CHAT_CHAT_SUBTAB_READ,
            PatchId.READ_RECEIPTS_MAIN_CHAT_NOTIFICATION_READ,
        )
        val gates = outboundGateFingerprint.matchAllOrNull().orEmpty()
        val factories = supplierFactoryFingerprint.matchAllOrNull().orEmpty()
        if (gates.size != 1 || factories.size != 1) {
            // 件数が一致しても注入していないので、OK と記録しません。
            recordUnappliedFeatureStatus(
                allPatchIds,
                expectedTargetCount = 1,
                matchCount = minOf(gates.size, factories.size),
                reason = "ExplicitMarkAsReadDependencyNotUnique",
            )
            return@execute
        }
        val gate = gates.single().originalMethod
        val factory = factories.single().originalMethod

        // --- すべて既読（タブの + メニューと More の 2 入口が同じメソッドへ合流します） ---
        val bulkMatches = Fingerprint(
            definingClass = gate.definingClass,
            returnType = JAVA_LIST,
            parameters = emptyList(),
            custom = { method, _ -> markAllAsReadShape(method) { it.sameMethod(gate) } != null },
        ).matchAllOrNull().orEmpty()
        if (bulkMatches.size != 1) {
            recordFeatureStatus(
                listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_MARK_ALL_AS_READ),
                expectedTargetCount = 1,
                actualTargetCount = bulkMatches.size,
                reason = "MarkAllAsReadNotUnique",
            )
        } else {
            val bulk = bulkMatches.single()
            val bulkMethod = bulk.originalMethod
            val callers = Fingerprint(
                custom = { method, _ ->
                    method.implementation?.instructions?.any { instruction ->
                        instruction.methodReference()?.sameMethod(bulkMethod) == true
                    } == true
                },
            ).matchAllOrNull().orEmpty().map { it.originalClassDef }
            val shape = markAllAsReadShape(bulkMethod) { it.sameMethod(gate) }
            if (shape == null || !areOnlyExplicitMarkAllCallers(callers.map(::coroutineMetadata))) {
                recordUnsafeFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_MARK_ALL_AS_READ),
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "MarkAllAsReadCallerNotExplicit",
                )
            } else {
                injectMarkAllAsRead(bulk.method, shape)
                recordFeatureStatus(
                    listOf(PatchId.READ_RECEIPTS_MAIN_CHAT_MARK_ALL_AS_READ),
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "MarkAllAsReadPerChatAllowanceInjected",
                )
            }
        }

        // --- 長押しの「既読にする」 ---
        val contextMenus = Fingerprint(
            name = "invokeSuspend",
            returnType = OBJECT,
            parameters = listOf(OBJECT),
            custom = { _, classDef ->
                coroutineMetadata(classDef) == (CONTEXT_MENU_COROUTINE to CONTEXT_MENU_SOURCE)
            },
        ).matchAllOrNull().orEmpty()
        recordFactoryCaller(
            patchId = PatchId.READ_RECEIPTS_MAIN_CHAT_CONTEXT_MENU_READ,
            targetCount = contextMenus.size,
            shape = contextMenus.singleOrNull()?.let { match ->
                contextMenuCallShape(match.originalMethod) { it.sameMethod(factory) }
            },
            inject = { shape -> injectFactoryCaller(contextMenus.single().method, shape) },
        )

        // --- チャットサブタブの行アクションとプレビューメニューの「既読」 ---
        val chatSubTabs = Fingerprint(
            name = "invokeSuspend",
            returnType = OBJECT,
            parameters = listOf(OBJECT),
            custom = { _, classDef ->
                coroutineMetadata(classDef) == (CHAT_SUBTAB_COROUTINE to CHAT_SUBTAB_SOURCE)
            },
        ).matchAllOrNull().orEmpty()
        recordFactoryCaller(
            patchId = PatchId.READ_RECEIPTS_MAIN_CHAT_CHAT_SUBTAB_READ,
            targetCount = chatSubTabs.size,
            shape = chatSubTabs.singleOrNull()?.let { match ->
                contextMenuCallShape(match.originalMethod) { it.sameMethod(factory) }
            },
            inject = { shape -> injectFactoryCaller(chatSubTabs.single().method, shape) },
        )

        // --- 通知の「既読」アクション ---
        val notifications = Fingerprint(
            definingClass = NOTIFICATION_SERVICE,
            name = "onStartCommand",
            returnType = "I",
            parameters = listOf(INTENT, "I", "I"),
            strings = listOf(MARK_AS_READ_ACTION),
        ).matchAllOrNull().orEmpty()
        recordFactoryCaller(
            patchId = PatchId.READ_RECEIPTS_MAIN_CHAT_NOTIFICATION_READ,
            targetCount = notifications.size,
            shape = notifications.singleOrNull()?.let { match ->
                notificationCallShape(match.originalMethod) { it.sameMethod(factory) }
            },
            inject = { shape -> injectFactoryCaller(notifications.single().method, shape) },
        )
    }
}

private fun recordFactoryCaller(
    patchId: PatchId,
    targetCount: Int,
    shape: ExplicitFactoryCallShape?,
    inject: (ExplicitFactoryCallShape) -> Unit,
) {
    if (targetCount != 1) {
        recordFeatureStatus(
            listOf(patchId),
            expectedTargetCount = 1,
            actualTargetCount = targetCount,
            reason = "ExplicitMarkAsReadEntryNotUnique",
        )
        return
    }
    if (shape == null) {
        recordUnsafeFeatureStatus(
            listOf(patchId),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ExplicitMarkAsReadEntryShapeMismatch",
        )
        return
    }
    inject(shape)
    recordFeatureStatus(
        listOf(patchId),
        expectedTargetCount = 1,
        actualTargetCount = 1,
        reason = "ExplicitMarkAsReadEntryInjected",
    )
}

/** 呼び出し元が許可済みの coroutine だけで、かつ 2 入口の両方が揃っていること。 */
internal fun areOnlyExplicitMarkAllCallers(callers: List<Pair<String?, String?>>): Boolean =
    callers.toSet() == MARK_ALL_AS_READ_COROUTINES.toList().toSet() &&
        callers.size == MARK_ALL_AS_READ_COROUTINES.size

/**
 * 一括既読のループを識別します。送信の呼び出しは 1 つだけで、許可の破棄を置く次の命令へ
 * 分岐が飛び込まず、append する handler へ制御が落ちないことを必須にします。元のメソッドに
 * try block が無いことも必須です（`<any>` の catch は重ねられません）。
 */
internal fun markAllAsReadShape(
    method: Method,
    isSender: (MethodReference) -> Boolean,
): MarkAllAsReadShape? {
    val implementation = method.implementation ?: return null
    if (implementation.tryBlocks.isNotEmpty()) {
        return null
    }
    val instructions = implementation.instructions.toList()
    val callIndex = instructions.indices.filter { index ->
        instructions[index].methodReference()?.let(isSender) == true
    }.singleOrNull() ?: return null
    val call = instructions[callIndex] as? FiveRegisterInstruction ?: return null
    val last = instructions.lastOrNull() ?: return null
    // this + J(2) + String + Z の 5 register。chatId は 4 番目の registerF です。
    if (
        call.opcode != Opcode.INVOKE_VIRTUAL ||
        call.registerCount != 5 ||
        fallsThrough(last) ||
        isDivertedInjectionIndex(instructions, callIndex) ||
        isDivertedInjectionIndex(instructions, callIndex + 1)
    ) {
        return null
    }
    return MarkAllAsReadShape(senderCallIndex = callIndex, chatIdRegister = call.registerF)
}

/**
 * 長押しとチャットサブタブの coroutine。factory 呼び出しは 1 つの try に覆われ、handler は正常時の後続
 * 処理と合流します。handler の先頭は注入できない（例外経路が飛び越す）ので、各 handler の次の命令の位置で
 * 印を解除します。catch-all が無い場合は、覆われない Throwable 用の handler を足す前提で、append した
 * handler へ制御が落ちないことも必須にします。
 */
internal fun contextMenuCallShape(
    method: Method,
    isFactory: (MethodReference) -> Boolean,
): ExplicitFactoryCallShape? {
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions.toList()
    val base = factoryCall(method, isFactory) ?: return null
    val callAddress = instructionAddress(instructions, base.factoryCallIndex)
    val covering = implementation.tryBlocks.filter { block ->
        callAddress >= block.startCodeAddress && callAddress < block.startCodeAddress + block.codeUnitCount
    }
    val handlers = covering.singleOrNull()?.exceptionHandlers?.takeIf { it.isNotEmpty() } ?: return null
    val handlerAddresses = exceptionHandlerAddresses(implementation)
    val tailIndices = handlers.map { handler ->
        val handlerIndex = instructions.indices.firstOrNull { index ->
            instructionAddress(instructions, index) == handler.handlerCodeAddress
        } ?: return null
        val tailIndex = handlerIndex + 1
        if (
            handlerIndex <= base.cleanupIndex ||
            !fallsThrough(instructions[handlerIndex]) ||
            isDivertedInjectionIndex(instructions, tailIndex, handlerAddresses)
        ) {
            return null
        }
        tailIndex
    }.distinct()
    val needsCatchAll = handlers.none { it.exceptionType == null }
    if (needsCatchAll && fallsThrough(instructions.last())) {
        return null
    }
    return base.copy(handlerCleanupIndices = tailIndices, needsCatchAll = needsCatchAll)
}

/**
 * 通知サービス。呼び出しを覆う try が無いので、factory が例外を投げると onStartCommand の外へ抜けて
 * プロセスごと終わり、印は残りません。この前提が崩れた版では注入しません。
 */
internal fun notificationCallShape(
    method: Method,
    isFactory: (MethodReference) -> Boolean,
): ExplicitFactoryCallShape? {
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions.toList()
    val base = factoryCall(method, isFactory) ?: return null
    val callAddress = instructionAddress(instructions, base.factoryCallIndex)
    val covered = implementation.tryBlocks.any { block ->
        callAddress >= block.startCodeAddress && callAddress < block.startCodeAddress + block.codeUnitCount
    }
    return base.takeUnless { covered }
}

private fun factoryCall(
    method: Method,
    isFactory: (MethodReference) -> Boolean,
): ExplicitFactoryCallShape? {
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions.toList()
    val callIndex = instructions.indices.filter { index ->
        instructions[index].methodReference()?.let(isFactory) == true
    }.singleOrNull() ?: return null
    val call = instructions[callIndex] as? FiveRegisterInstruction ?: return null
    val cleanupIndex = callIndex + 2
    val handlers = exceptionHandlerAddresses(implementation)
    if (
        call.opcode != Opcode.INVOKE_VIRTUAL ||
        call.registerCount != 2 ||
        instructions.getOrNull(callIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT ||
        isDivertedInjectionIndex(instructions, callIndex, handlers) ||
        isDivertedInjectionIndex(instructions, cleanupIndex, handlers)
    ) {
        return null
    }
    return ExplicitFactoryCallShape(
        factoryCallIndex = callIndex,
        cleanupIndex = cleanupIndex,
        chatIdRegister = call.registerD,
    )
}

/** 後ろの index から注入し、手前の index がずれないようにします。 */
private fun injectFactoryCaller(method: MutableMethod, shape: ExplicitFactoryCallShape) {
    shape.handlerCleanupIndices.sortedDescending().forEach { index ->
        method.addInstructions(index, "invoke-static { }, $CLEAR_MANUAL")
    }
    method.addInstructions(shape.cleanupIndex, "invoke-static { }, $CLEAR_MANUAL")
    method.addInstructions(
        shape.factoryCallIndex,
        "invoke-static/range { v${shape.chatIdRegister} .. v${shape.chatIdRegister} }, $BEGIN_MANUAL",
    )
    if (!shape.needsCatchAll) {
        return
    }

    // 既存の型付き handler が受けない Throwable 用です。投げ直すだけなので chatId の register を受け皿にできます。
    val implementation = checkNotNull(method.implementation)
    val handlerIndex = implementation.instructions.size
    method.addInstructions(
        handlerIndex,
        """
            move-exception v${shape.chatIdRegister}
            invoke-static { }, $CLEAR_MANUAL
            throw v${shape.chatIdRegister}
        """.trimIndent(),
    )
    // 注入後の index で、factory の呼び出しだけを覆います。
    implementation.addCatch(
        implementation.newLabelForIndex(shape.factoryCallIndex + 1),
        implementation.newLabelForIndex(shape.factoryCallIndex + 2),
        implementation.newLabelForIndex(handlerIndex),
    )
}

/**
 * 送信の直前で対象トークだけを許可し、直後に破棄します。送信先頭の既読なし block は許可を消費せずに
 * return するため、ここで破棄しないと thread に残ります。送信が例外で抜ける経路も handler で破棄します。
 * 例外経路では register の値を以後使わないので、chatId の register を例外の受け皿に使えます。
 */
private fun injectMarkAllAsRead(method: MutableMethod, shape: MarkAllAsReadShape) {
    method.addInstructions(shape.senderCallIndex + 1, "invoke-static { }, $CLEAR_PREPARED")
    method.addInstructions(
        shape.senderCallIndex,
        "invoke-static/range { v${shape.chatIdRegister} .. v${shape.chatIdRegister} }, $PREPARE_EXPLICIT",
    )

    val implementation = checkNotNull(method.implementation)
    val handlerIndex = implementation.instructions.size
    method.addInstructions(
        handlerIndex,
        """
            move-exception v${shape.chatIdRegister}
            invoke-static { }, $CLEAR_PREPARED
            throw v${shape.chatIdRegister}
        """.trimIndent(),
    )
    // 注入後の index で、送信の呼び出しだけを覆います。
    implementation.addCatch(
        implementation.newLabelForIndex(shape.senderCallIndex + 1),
        implementation.newLabelForIndex(shape.senderCallIndex + 2),
        implementation.newLabelForIndex(handlerIndex),
    )
}

/** DebugMetadata の `c` と `f`。annotation の型名は難読化されるため、要素名で読みます。 */
private fun coroutineMetadata(classDef: ClassDef): Pair<String?, String?> {
    classDef.annotations.forEach { annotation ->
        val strings = annotation.elements.associate { element ->
            element.name to (element.value as? StringEncodedValue)?.value
        }
        if (strings["c"] != null && strings["f"] != null) {
            return strings["c"] to strings["f"]
        }
    }
    return null to null
}

private fun Instruction.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MethodReference.sameMethod(other: Method): Boolean =
    definingClass == other.definingClass &&
        name == other.name &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString) &&
        returnType == other.returnType
