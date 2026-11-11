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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus

private const val VOID = "V"
private const val INT = "I"
private const val STRING = "Ljava/lang/String;"
private const val READ_WITHOUT_RECEIPT_HOOKS =
    "Ldev/utaa/linimal/extension/features/readwithoutreceipt/ReadWithoutReceiptHooks;"
private const val SHOULD_BLOCK =
    "$READ_WITHOUT_RECEIPT_HOOKS->shouldBlockMarkAsRead(Ljava/lang/String;)Z"

/** Thrift IDL 上の RPC 名。既読送信 RPC の引数書き出しメソッドにだけ、非難読化の定数として現れます。 */
private const val SEND_CHAT_CHECKED_RPC_NAME = "sendChatChecked"

/** this + I + String + String の 4 parameter register に対する register 総数。空きは v0 の 1 つだけです。 */
private const val TOTAL_REGISTER_COUNT = 5
private const val PARAMETER_REGISTER_COUNT = 4

/**
 * `sendChatChecked` 文字列定数を持つメソッドを探す fingerprint。実 APK ではこの文字列を持つメソッドは
 * 2 件（`toString()` と Thrift 引数書き出しメソッド）で、`toString` を除くと 1 件に絞れます。
 */
private val sendChatCheckedFingerprint = Fingerprint(strings = listOf(SEND_CHAT_CHECKED_RPC_NAME))

/**
 * 指定した型を `new-instance` するメソッドを探す fingerprint。実 APK では、Thrift 引数書き出しメソッド
 * を持つクラスを new-instance するメソッドは、既読送信 RPC の choke point（`j1` 相当）の 1 箇所だけです
 * （全 DEX 走査で確認済み）。
 */
private fun newInstanceOfFingerprint(type: String) = Fingerprint(
    custom = { method, _ -> methodHasNewInstanceOf(method, type) },
)

internal data class LegacyTalkServiceRpcShape(val chatIdRegister: Int)

/**
 * 既読送信 RPC の choke point（`LegacyTalkServiceClientImpl->j1(I, String, String)V` 相当。第 2 引数が
 * トーク ID、第 3 引数が既読位置のメッセージ ID）の入口で、「既読をつけずに読む」対象トークだけ、本体を
 * 実行せず即座に return void します。この RPC はどのビジネスロジック経路から呼ばれても必ず通るため、
 * UI 側の経路特定に依存しません。
 *
 * <p>対象の特定は難読化名に依存しません。(1) 文字列定数 `sendChatChecked` を持つメソッドから
 * `toString` を除外して Thrift 引数書き出しメソッドの所属クラスを求め（[rpcArgWriterOwnerType]）、
 * (2) そのクラスを `new-instance` する唯一のメソッドを求め、(3) その命令列が `(I, String, String)V` ／
 * 命令 4 つ／`new-instance → invoke-direct <init> → invoke-virtual（引数なし）→ return-void` の並び／
 * try block なし、という shape を満たすことを検証します（[legacyTalkServiceRpcShape]）。どの段でも
 * 候補が一意にならなければ注入せず、Patch Status を記録して終了します。</p>
 *
 * <p>registerCount は 5 で引数が 4 つ（this + I + String + String）のため、空きレジスタは v0 の 1 つ
 * だけです。v0 は元の命令 0（`new-instance v0, ...`）の格納先であり、注入するブロックの外へは値を
 * 持ち出さないため、move-result の一時置き場として使っても安全です。</p>
 *
 * <p>MainChatReadReceiptPatch の `readReceiptOutboundGatePatch` は、この RPC を呼び出す側（通常チャット
 * の自動既読を止める、別機能）を独立した shape で識別しており、`j1` 自体の命令列は変更しません。
 * 両 patch が同じメソッドを競合して書き換えることはありません。</p>
 */
val readWithoutReceiptMarkAsReadBlockPatch = bytecodePatch(
    name = "既読をつけずに読むの既読停止",
    description = "「既読をつけずに読む」で開いたトークだけ、既読送信の RPC を実行しないようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(readWithoutReceiptPreviewMenuPatch)

    execute {
        val sendChatCheckedMatches = sendChatCheckedFingerprint.matchAllOrNull().orEmpty()
        val argWriterOwnerType = rpcArgWriterOwnerType(sendChatCheckedMatches.map { it.originalMethod })
        if (argWriterOwnerType == null) {
            // toString を除いた残りの所属クラス数。0 は候補が toString だけだったことを、2 以上は
            // 複数クラスに散らばって一意にならなかったことを示します。
            val ambiguousOwnerTypeCount = sendChatCheckedMatches
                .map { it.originalMethod }
                .filterNot { it.name == "toString" }
                .map { it.definingClass }
                .distinct()
                .size
            recordFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK),
                expectedTargetCount = 1,
                actualTargetCount = ambiguousOwnerTypeCount,
                reason = "ReadWithoutReceiptRpcArgWriterNotUnique",
            )
            return@execute
        }

        val callSiteMatches = newInstanceOfFingerprint(argWriterOwnerType).matchAllOrNull().orEmpty()
        if (callSiteMatches.size != 1) {
            recordFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK),
                expectedTargetCount = 1,
                actualTargetCount = callSiteMatches.size,
                reason = "ReadWithoutReceiptRpcCallSiteNotUnique",
            )
            return@execute
        }

        val match = callSiteMatches.single()
        val shape = legacyTalkServiceRpcShape(match.originalMethod, argWriterOwnerType)
        if (shape == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadWithoutReceiptRpcInstructionShapeMismatch",
            )
            return@execute
        }

        match.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { v${shape.chatIdRegister} .. v${shape.chatIdRegister} }, $SHOULD_BLOCK
                move-result v0
                if-eqz v0, :rwrRpcEntryContinue
                return-void
                :rwrRpcEntryContinue
                nop
            """.trimIndent(),
        )

        recordFeatureStatus(
            listOf(PatchId.READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_MARK_AS_READ_BLOCK),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ReadWithoutReceiptRpcEntryBlocked",
        )
    }
}

/**
 * `sendChatChecked` を持つメソッドから `toString()` を除外し、残りの所属クラスが 1 つに絞れる場合だけ
 * その型を返します。`toString` は Java/Kotlin のオーバーライドとして常にこの名前で残るため、除外条件
 * として難読化名に依存しません。
 */
internal fun rpcArgWriterOwnerType(candidates: List<Method>): String? =
    candidates.filterNot { it.name == "toString" }
        .map { it.definingClass }
        .distinct()
        .singleOrNull()

/** メソッドの命令列に、指定した型への `new-instance` が含まれるかどうか。 */
internal fun methodHasNewInstanceOf(method: Method, type: String): Boolean =
    method.implementation?.instructions?.any { instruction ->
        instruction.opcode == Opcode.NEW_INSTANCE && typeReference(instruction) == type
    } == true

/**
 * 既読送信 RPC choke point の shape 検証。`(I, String, String)V`／命令 4 つ／try block なし／
 * `new-instance → invoke-direct <init> → invoke-virtual（引数なし）→ return-void` の並びを要求します。
 * 一致すれば、第 2 引数（トーク ID）を保持するレジスタを返します。
 */
internal fun legacyTalkServiceRpcShape(method: Method, argWriterType: String): LegacyTalkServiceRpcShape? {
    val implementation = method.implementation ?: return null
    val parameterStart = implementation.registerCount - PARAMETER_REGISTER_COUNT
    if (
        method.returnType != VOID ||
        method.parameterTypes.map(CharSequence::toString) != listOf(INT, STRING, STRING) ||
        implementation.registerCount != TOTAL_REGISTER_COUNT ||
        parameterStart != 1 ||
        implementation.tryBlocks.isNotEmpty()
    ) {
        return null
    }

    val instructions = implementation.instructions.toList()
    if (instructions.size != 4) {
        return null
    }

    // p0(this) + p1(I) + p2(chatId String) + p3(messageId String)
    val thisRegister = parameterStart
    val intRegister = parameterStart + 1
    val chatIdRegister = parameterStart + 2
    val messageIdRegister = parameterStart + 3

    val constructorRef = methodReference(instructions[1])
    val rpcInvokeRef = methodReference(instructions[2])

    if (
        !isOneRegister(instructions[0], Opcode.NEW_INSTANCE, 0) ||
        typeReference(instructions[0]) != argWriterType ||
        instructions[1].opcode != Opcode.INVOKE_DIRECT ||
        constructorRef == null ||
        constructorRef.definingClass != argWriterType ||
        constructorRef.name != "<init>" ||
        constructorRef.returnType != VOID ||
        constructorRef.parameterTypes.map(CharSequence::toString) !=
        listOf(method.definingClass, INT, STRING, STRING) ||
        !isInvokeRegisters(instructions[1], listOf(0, thisRegister, intRegister, chatIdRegister, messageIdRegister)) ||
        instructions[2].opcode != Opcode.INVOKE_VIRTUAL ||
        rpcInvokeRef == null ||
        rpcInvokeRef.parameterTypes.isNotEmpty() ||
        // 送信メソッドの戻り値は捨てられるため型を問いません。実 APK では Object を返します。
        !isInvokeRegisters(instructions[2], listOf(0)) ||
        instructions[3].opcode != Opcode.RETURN_VOID
    ) {
        return null
    }

    return LegacyTalkServiceRpcShape(chatIdRegister = chatIdRegister)
}

private fun methodReference(instruction: Instruction?): MethodReference? =
    (instruction as? ReferenceInstruction)?.reference as? MethodReference

private fun typeReference(instruction: Instruction?): String? =
    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type

private fun isOneRegister(instruction: Instruction?, opcode: Opcode, register: Int): Boolean =
    instruction?.opcode == opcode && (instruction as? OneRegisterInstruction)?.registerA == register

private fun isInvokeRegisters(instruction: Instruction?, expected: List<Int>): Boolean {
    val invoke = instruction as? FiveRegisterInstruction ?: return false
    val actual = listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF, invoke.registerG)
        .take(invoke.registerCount)
    return actual == expected
}
