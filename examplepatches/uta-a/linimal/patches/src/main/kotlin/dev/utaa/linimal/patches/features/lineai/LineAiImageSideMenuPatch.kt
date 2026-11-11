package dev.utaa.linimal.patches.features.lineai

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.unsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val LINE_AI_ENTRY_SOURCE = "Ljz1/a;"
private const val LINE_AI_CONTEXT_HOOK =
    "Ldev/utaa/linimal/extension/features/lineai/LineAiMessageContextMenuHooks;->adjustAvailability(Z)Z"

/** 画像メッセージ横の LINE AI ボタンの表示判定。入口の enum を渡す判定呼び出しで特定します。 */
private val lineAiImageSideMenuFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = LINE_AI_ENTRY_SOURCE,
            name = "IMAGE_MESSAGE_SIDE_MENU",
            type = LINE_AI_ENTRY_SOURCE,
            opcode = Opcode.SGET_OBJECT,
        ),
        methodCall(
            parameters = listOf("L", BOOLEAN, LINE_AI_ENTRY_SOURCE),
            returnType = BOOLEAN,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

internal data class LineAiImageSideMenuShape(val insertionIndex: Int, val availabilityRegister: Int)

/**
 * 判定結果の直後に分岐する形だけを受け入れます。hook は結果だけを同じ register で置き換えるため、
 * 非 range invoke で渡せる register に限り、分岐先や例外 handler の先頭には注入しません。
 */
internal fun lineAiImageSideMenuShape(
    instructions: List<Instruction>,
    callIndex: Int,
    handlerAddresses: Set<Int> = emptySet(),
): LineAiImageSideMenuShape? {
    val moveResult = instructions.getOrNull(callIndex + 1) as? OneRegisterInstruction ?: return null
    val branch = instructions.getOrNull(callIndex + 2) as? OneRegisterInstruction ?: return null
    val register = moveResult.registerA
    val insertionIndex = callIndex + 2
    if (
        moveResult.opcode != Opcode.MOVE_RESULT ||
        branch.opcode != Opcode.IF_EQZ ||
        branch.registerA != register ||
        register > 15 ||
        isDivertedInjectionIndex(instructions, insertionIndex, handlerAddresses)
    ) {
        return null
    }
    return LineAiImageSideMenuShape(insertionIndex, register)
}

/** 長押しメニューと同じ設定で、画像メッセージ横の LINE AI ボタンも抑制します。 */
val lineAiImageSideMenuPatch = bytecodePatch(
    name = "画像メッセージ横の LINE AI",
    description = "画像メッセージ横の LINE AI ボタンを、長押しメニューの LINE AI と同じ設定で取り除けるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(lineAiMessageContextMenuPatch)

    execute {
        val matches = lineAiImageSideMenuFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != 1) {
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.LINE_AI_IMAGE_SIDE_MENU,
                    expectedTargetCount = 1,
                    actualTargetCount = matches.size,
                    reason = "LineAiImageSideMenuNotUnique",
                ),
            )
            return@execute
        }

        val match = matches.single()
        val implementation = match.originalMethod.implementation
        val shape = implementation?.let {
            lineAiImageSideMenuShape(
                it.instructions.toList(),
                match.instructionMatches[1].index,
                exceptionHandlerAddresses(it),
            )
        }
        if (shape == null) {
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.LINE_AI_IMAGE_SIDE_MENU,
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "LineAiImageSideMenuShapeMismatch",
                ),
            )
            return@execute
        }

        match.method.addInstructions(
            shape.insertionIndex,
            """
                invoke-static/range { v${shape.availabilityRegister} .. v${shape.availabilityRegister} }, $LINE_AI_CONTEXT_HOOK
                move-result v${shape.availabilityRegister}
            """.trimIndent(),
        )
        patchStatusCollector.record(
            patchId = PatchId.LINE_AI_IMAGE_SIDE_MENU,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "LineAiImageSideMenuGated",
        )
    }
}
