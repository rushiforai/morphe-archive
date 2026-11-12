package dev.utaa.linimal.patches.features.agenti

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.features.lineai.lineAiGalleryViewerPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.unsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.isSafeInjectionIndex

private const val FUNCTION3 = "Lnt8/q;"

/** 検索バー composable の引数の並び。AI ボタンの表示 boolean と、その直後の icon variant boolean。 */
private const val SEARCH_BAR_PARAMETER_COUNT = 10
private const val AI_BUTTON_PARAMETER_INDEX = 4

private const val CHAT_LIST_SEARCH_HOOK =
    "Ldev/utaa/linimal/extension/features/agenti/AgentIChatListSearchHooks;->adjustVisibility(Z)Z"

/**
 * トークタブ上部ヘッダの composable。Kotlin function reference の debug metadata
 * (`onClickSearchBar` / `onClickSearchBarQrScanner` / `onClickSearchBarAiButton`) を主条件にするため、
 * 難読化されたクラス名・メソッド名には依存しません。
 */
private val chatListSearchBarHeaderFingerprint = Fingerprint(
    returnType = OBJECT,
    parameters = listOf(OBJECT, OBJECT, OBJECT),
    filters = listOf(
        string("onClickSearchBar()V"),
        string("onClickSearchBarQrScanner()V"),
        string("onClickSearchBarAiButton()V"),
    ),
    custom = { _, classDef -> classDef.interfaces.contains(FUNCTION3) },
)

/**
 * トーク一覧（トークタブ）上部の検索行にある Agent i ボタンの表示 boolean だけを制御します。
 *
 * <p>検索ボックス本体、コードスキャンのアイコン、click callback、deeplink、analytics は変更しません。
 * ボタンは Row の中で条件付きに emit されるため、非表示時は隙間ごと消え、検索ボックス側の
 * weight(1f) が余白を吸収します。</p>
 */
val agentIChatListSearchPatch = bytecodePatch(
    name = "Agent i in chat list search",
    description = "トーク一覧上部の検索欄にある Agent i のボタンを、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(lineAiGalleryViewerPatch)

    execute {
        val headerMatches = chatListSearchBarHeaderFingerprint.matchAllOrNull().orEmpty()
        if (headerMatches.size != 1) {
            patchStatusCollector.record(
                agentIChatListSearchUnappliedRecord(
                    headerMatches.size,
                    "AgentIChatListSearchHeaderNotUnique",
                ),
            )
            return@execute
        }

        val header = headerMatches.single()
        val injectionShape = chatListSearchInjectionShape(header.method)
        if (injectionShape == null || !isSafeInjectionIndex(header.method.implementation, injectionShape.insertionIndex)) {
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.AGENT_I_CHAT_LIST_SEARCH,
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "AgentIChatListSearchSupplierShapeMismatch",
                ),
            )
            return@execute
        }

        // 検索バー composable を呼ぶ直前で、AI ボタン用 boolean だけを差し替えます。
        // 再 composition 用の restart lambda は、この差し替え後の値を capture します。
        header.method.addInstructions(
            injectionShape.insertionIndex,
            """
                invoke-static/range { v${injectionShape.visibilityRegister} .. v${injectionShape.visibilityRegister} }, $CHAT_LIST_SEARCH_HOOK
                move-result v${injectionShape.visibilityRegister}
            """.trimIndent(),
        )
        patchStatusCollector.record(
            patchId = PatchId.AGENT_I_CHAT_LIST_SEARCH,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "AgentIChatListSearchVisibilitySupplied",
        )
    }
}

private data class ChatListSearchInjectionShape(
    val insertionIndex: Int,
    val visibilityRegister: Int,
)

/**
 * AI ボタン boolean が「引数なしで boolean を返す interface supplier」から検索バー composable へ
 * 流れていることを、opcode と register の並びまで確認します。いずれかが崩れていれば注入しません。
 */
private fun chatListSearchInjectionShape(method: Method): ChatListSearchInjectionShape? {
    val instructions = method.implementation?.instructions?.toList() ?: return null

    val callIndices = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        val parameterTypes = reference?.parameterTypes?.map { it.toString() }
        index.takeIf {
            instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
                reference?.returnType == VOID &&
                parameterTypes != null &&
                parameterTypes.size == SEARCH_BAR_PARAMETER_COUNT &&
                parameterTypes[AI_BUTTON_PARAMETER_INDEX] == BOOLEAN &&
                parameterTypes[AI_BUTTON_PARAMETER_INDEX + 1] == BOOLEAN
        }
    }
    val callIndex = callIndices.singleOrNull() ?: return null
    val call = instructions[callIndex] as? RegisterRangeInstruction ?: return null
    if (call.registerCount != SEARCH_BAR_PARAMETER_COUNT) return null

    // range invoke の受け口は先頭 register から連続するため、AI ボタン boolean の register は一意です。
    val visibilityRegister = call.startRegister + AI_BUTTON_PARAMETER_INDEX
    if (visibilityRegister !in 0..15) return null

    val copyIndex = lastWriteIndex(instructions, callIndex, visibilityRegister) ?: return null
    val copy = instructions[copyIndex] as? TwoRegisterInstruction ?: return null
    if (copy.opcode != Opcode.MOVE || copy.registerA != visibilityRegister) return null

    val resultIndex = lastWriteIndex(instructions, copyIndex, copy.registerB) ?: return null
    val result = instructions[resultIndex] as? OneRegisterInstruction ?: return null
    if (result.opcode != Opcode.MOVE_RESULT || result.registerA != copy.registerB) return null

    val supplier = instructions.getOrNull(resultIndex - 1) ?: return null
    val supplierReference = (supplier as? ReferenceInstruction)?.reference as? MethodReference
        ?: return null

    return if (
        supplier.opcode == Opcode.INVOKE_INTERFACE &&
        supplierReference.parameterTypes.isEmpty() &&
        supplierReference.returnType == BOOLEAN
    ) {
        ChatListSearchInjectionShape(callIndex, visibilityRegister)
    } else {
        null
    }
}

private fun lastWriteIndex(
    instructions: List<Instruction>,
    exclusiveEnd: Int,
    register: Int,
): Int? = (exclusiveEnd - 1 downTo 0).firstOrNull { index ->
    writesRegister(instructions[index], register)
}

private fun writesRegister(instruction: Instruction, register: Int): Boolean {
    if (instruction !is OneRegisterInstruction) return false
    return when {
        instruction.opcode.setsWideRegister() ->
            instruction.registerA == register || instruction.registerA + 1 == register

        instruction.opcode.setsRegister() -> instruction.registerA == register
        else -> false
    }
}

internal fun agentIChatListSearchUnappliedRecord(matchCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.AGENT_I_CHAT_LIST_SEARCH,
    status = if (matchCount == 0) PatchStatus.TARGET_NOT_FOUND else PatchStatus.ERROR,
    expectedTargetCount = 1,
    actualTargetCount = matchCount,
    reason = reason,
)
