package dev.utaa.linimal.patches.features.readwithoutreceipt

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.utaa.linimal.patches.features.readreceipts.outboundGateFingerprint
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.isSafeInjectionIndex

private const val READ_WITHOUT_RECEIPT_HOOKS =
    "Ldev/utaa/linimal/extension/features/readwithoutreceipt/ReadWithoutReceiptHooks;"
private const val SHOULD_BLOCK =
    "$READ_WITHOUT_RECEIPT_HOOKS->shouldBlockMarkAsRead(Ljava/lang/String;)Z"

/** this + J + String + Z の 4 parameter に対する register 数。J が 2 つ占めるため 5 です。 */
private const val PARAMETER_REGISTER_COUNT = 5

/** parameter 列の中で chatId (String) が何番目の register か。this, J, J, chatId の順です。 */
private const val CHAT_ID_PARAMETER_OFFSET = 3

internal data class MainChatMarkAsReadShape(val chatIdRegister: Int)

/**
 * 送信メソッドを通らない未読クリア（AsyncTask の本体）。
 *
 * @param scratchRegister 命令 1 が上書きする local register。注入ブロックの中でだけ使います。
 * @param resultField 元のメソッドが返す値の static field。抑止時も同じ値を返します。
 */
internal data class LocalUnreadClearShape(
    val chatIdRegister: Int,
    val scratchRegister: Int,
    val resultField: FieldReference,
)

/**
 * 「既読をつけずに読む」で開いたトークについて、ローカルの未読クリアごと既読処理を止めます。
 *
 * <p>メイン 1:1 / グループの「既読にする」は 1 つのメソッド
 * （`q33.e.d(J, String, Z)V` 相当）に集約されており、その中で次の順に実行されます。</p>
 *
 * <pre>
 *   Lu13/l;->Y(chatId)V           ローカル未読のクリア（トーク一覧と下部タブのバッジを消す）
 *   Lu13/l;->Q0(msgId, chatId)V   既読位置 read_up の前進
 *   TalkServiceClient->j1(...)V   sendChatChecked（相手へ既読を伝える RPC）
 * </pre>
 *
 * <p>[readWithoutReceiptMarkAsReadBlockPatch] が止めているのは最後の RPC だけで、その手前で
 * 先に走るローカル更新は素通りします。そのため「既読をつけずに読む」で開いても自分側の未読
 * バッジが消えていました。本 patch はこのメソッドの入口で、対象トークだけ本体を実行せず
 * 即座に return void し、ローカル更新と RPC をまとめて止めます。</p>
 *
 * <p>対象の特定には「自動既読の停止」と同じ [outboundGateFingerprint] を共有します。fingerprint
 * を複製すると、片方だけ別のメソッドへ当たる余地が残るためです。あちらは同じメソッドの
 * 命令 index 6（local update と chat-list Runnable の合流点の直後）へ注入するので、素の命令列を先に
 * 検証できるよう `readReceiptOutboundGatePatch` が先に走る位置へ本 patch を置いています。本 patch
 * 側は命令 0 の同一性を前提にせず、署名と register 割り当てだけを検証します。</p>
 *
 * <p>registerCount から parameter 列の開始位置を求め、chatId の register を決めます。scratch に
 * 使う v0 はメソッド入口では未初期化で、注入するブロックの外へ値を持ち出さないため安全です
 * （[readWithoutReceiptMarkAsReadBlockPatch] と同じ根拠）。local register が 1 つも無い
 * （parameterStart が 0 の）場合は v0 が parameter と衝突するため、注入せず Patch Status を
 * 記録して終了します。</p>
 *
 * <p>ロック画面系の未読クリア（送信メソッドの内部クラス）は `e0` と chat-list Runnable だけを実行し、
 * 送信メソッドを通りません。既読なし閲覧中のトークに限って同じ判定で飛ばします。自動既読の停止は
 * 送信メソッドと同じくローカル未読を消す設計なので、ここでは動作を変えません。どちらか一方でも
 * 特定できなければ未読維持として不完全なので、どちらも書き換えません。</p>
 */
val readWithoutReceiptLocalReadBlockPatch = bytecodePatch(
    name = "Read without receipt unread keep",
    description = "「既読をつけずに読む」で開いたトークだけ、ローカルの未読クリアも実行しないようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(readWithoutReceiptMarkAsReadBlockPatch)

    execute {
        val matches = outboundGateFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != 1) {
            recordFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK),
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "ReadWithoutReceiptMarkAsReadNotUnique",
            )
            return@execute
        }

        val match = matches.single()
        val shape = mainChatMarkAsReadShape(match.originalMethod)
        if (shape == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadWithoutReceiptMarkAsReadRegisterShapeMismatch",
            )
            return@execute
        }

        val localUpdate = outboundLocalUpdateReference(match.originalMethod)
        val senderInnerClassPrefix = match.originalClassDef.type.removeSuffix(";") + "$"
        val clearMatches = if (localUpdate == null) {
            emptyList()
        } else {
            Fingerprint(
                returnType = OBJECT,
                parameters = listOf(OBJECT),
                custom = { method, classDef ->
                    classDef.type.startsWith(senderInnerClassPrefix) &&
                        localUnreadClearShape(method, localUpdate) != null
                },
            ).matchAllOrNull().orEmpty()
        }
        val clearShape = clearMatches.singleOrNull()?.let { clear ->
            localUpdate?.let { localUnreadClearShape(clear.originalMethod, it) }
        }
        if (clearShape == null || !isSafeInjectionIndex(clearMatches.single().method.implementation, 1)) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK),
                expectedTargetCount = 2,
                actualTargetCount = 1 + clearMatches.size,
                reason = "ReadWithoutReceiptLocalUnreadClearNotUnique",
            )
            return@execute
        }

        clearMatches.single().method.addInstructionsWithLabels(
            1,
            """
                invoke-static/range { v${clearShape.chatIdRegister} .. v${clearShape.chatIdRegister} }, $SHOULD_BLOCK
                move-result v${clearShape.scratchRegister}
                if-eqz v${clearShape.scratchRegister}, :rwrUnreadClearContinue
                sget-object v${clearShape.scratchRegister}, ${clearShape.resultField.smali()}
                return-object v${clearShape.scratchRegister}
                :rwrUnreadClearContinue
                nop
            """.trimIndent(),
        )

        match.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { v${shape.chatIdRegister} .. v${shape.chatIdRegister} }, $SHOULD_BLOCK
                move-result v0
                if-eqz v0, :rwrLocalReadContinue
                return-void
                :rwrLocalReadContinue
                nop
            """.trimIndent(),
        )

        recordFeatureStatus(
            listOf(PatchId.READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_LOCAL_READ_BLOCK),
            expectedTargetCount = 2,
            actualTargetCount = 2,
            reason = "ReadWithoutReceiptLocalReadBlocked",
        )
    }
}

/**
 * chatId を保持する register を求めます。`outboundGateFingerprint` が署名を保証しているため、
 * ここでは register 割り当てだけを検証します。scratch の v0 を parameter と衝突させないよう、
 * local register が 1 つ以上あることを必須にします。
 */
internal fun mainChatMarkAsReadShape(method: Method): MainChatMarkAsReadShape? {
    val implementation = method.implementation ?: return null
    val parameterStart = implementation.registerCount - PARAMETER_REGISTER_COUNT
    if (parameterStart < 1) {
        return null
    }
    return MainChatMarkAsReadShape(chatIdRegister = parameterStart + CHAT_ID_PARAMETER_OFFSET)
}

/** 送信メソッドが最初に呼ぶローカル未読クリア。interface の `(String)V` で、名前は版ごとに変わります。 */
internal fun outboundLocalUpdateReference(method: Method): MethodReference? =
    method.implementation?.instructions?.firstNotNullOfOrNull { instruction ->
        instruction.methodReference()?.takeIf { reference ->
            instruction.opcode == Opcode.INVOKE_INTERFACE &&
                reference.parameterTypes.map(CharSequence::toString) == listOf(STRING) &&
                reference.returnType == VOID
        }
    }

/**
 * `check-cast String` / `iget` / `e0` / `iget` / `Runnable.run` / `sget` / `return-object` の 7 命令を
 * 完全に要求します。注入は check-cast の直後で、chatId が String と確定し、scratch は元の命令 1 が
 * 上書きする local register です。
 */
internal fun localUnreadClearShape(method: Method, localUpdate: MethodReference): LocalUnreadClearShape? {
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions.toList()
    if (instructions.size != 7 || implementation.tryBlocks.isNotEmpty()) {
        return null
    }
    val parameterStart = implementation.registerCount - 2 // this + Object
    val cast = instructions[0] as? OneRegisterInstruction ?: return null
    val receiver = instructions[1] as? TwoRegisterInstruction ?: return null
    val update = instructions[2] as? FiveRegisterInstruction ?: return null
    val run = instructions[4].methodReference() ?: return null
    val result = instructions[5] as? OneRegisterInstruction ?: return null
    val returned = instructions[6] as? OneRegisterInstruction ?: return null
    val resultField = (instructions[5] as? ReferenceInstruction)?.reference as? FieldReference ?: return null
    val castType = ((instructions[0] as? ReferenceInstruction)?.reference as? TypeReference)?.type
    val updateReference = update.methodReference() ?: return null
    val matches = instructions[0].opcode == Opcode.CHECK_CAST &&
        castType == STRING &&
        cast.registerA == parameterStart + 1 &&
        instructions[1].opcode == Opcode.IGET_OBJECT &&
        receiver.registerA < parameterStart &&
        update.opcode == Opcode.INVOKE_INTERFACE &&
        update.registerCount == 2 &&
        update.registerC == receiver.registerA &&
        update.registerD == cast.registerA &&
        updateReference.definingClass == localUpdate.definingClass &&
        updateReference.name == localUpdate.name &&
        updateReference.parameterTypes.map(CharSequence::toString) == listOf(STRING) &&
        updateReference.returnType == VOID &&
        instructions[3].opcode == Opcode.IGET_OBJECT &&
        run.name == "run" && run.parameterTypes.isEmpty() && run.returnType == VOID &&
        (instructions[4].opcode == Opcode.INVOKE_INTERFACE || instructions[4].opcode == Opcode.INVOKE_VIRTUAL) &&
        instructions[5].opcode == Opcode.SGET_OBJECT &&
        instructions[6].opcode == Opcode.RETURN_OBJECT &&
        returned.registerA == result.registerA
    if (!matches) {
        return null
    }
    return LocalUnreadClearShape(
        chatIdRegister = cast.registerA,
        scratchRegister = receiver.registerA,
        resultField = resultField,
    )
}

private fun Instruction.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun FieldReference.smali(): String = "$definingClass->$name:$type"
