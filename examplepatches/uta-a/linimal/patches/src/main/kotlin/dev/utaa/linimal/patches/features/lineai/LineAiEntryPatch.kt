package dev.utaa.linimal.patches.features.lineai

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.features.chat.chatPlusMenuPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.isSafeInjectionIndex

private const val LINE_AI_HOOK =
    "Ldev/utaa/linimal/extension/features/LineAiHooks;->adjustVisibility(Z)Z"

/**
 * LINE AI chat-information menu model。layout / drawable / label resource と親 model constructor signature を
 * 組み合わせるため、難読化された class / method 名を識別条件にしません。
 */
private val lineAiEntryFingerprint = Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("L", "Z"),
    filters = listOf(
        literal(0x7f0807d0), // chatmenu_ic_list_line_ai
        literal(0x7f1520e5), // lineai_assistant_title_lineai
        literal(0x7f0e0221), // chathistory_menu_text_with_icon_item
        methodCall(
            parameters = listOf("I", "I", "I", "Z", "Z"),
            returnType = "V",
            opcode = Opcode.INVOKE_DIRECT_RANGE,
        ),
    ),
)

val lineAiEntryPatch = bytecodePatch(
    name = "チャット情報の Agent i",
    description = "チャット情報画面にある Agent i の入口を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(chatPlusMenuPatch)

    execute {
        val matches = lineAiEntryFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != 1) {
            recordFeatureStatus(
                listOf(PatchId.AGENT_I_CHAT_INFORMATION_ENTRY),
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "LineAiEntryNotUnique",
            )
            return@execute
        }

        val method = matches.single().method
        val instructions = method.implementation?.instructions?.toList().orEmpty()
        val first = instructions.firstOrNull() as? ReferenceInstruction
        val firstReference = first?.reference as? MethodReference
        val firstSuperCall = matches.single().instructionMatches[3].instruction as? ReferenceInstruction
        val superReference = firstSuperCall?.reference as? MethodReference

        // p1 の null check 後かつ visibility boolean (p2) を parent model へ copy する前に注入します。
        if (
            first?.opcode != Opcode.INVOKE_VIRTUAL ||
            firstReference?.definingClass != "Ljava/lang/Object;" ||
            firstReference.name != "getClass" ||
            superReference?.parameterTypes != listOf("I", "I", "I", "Z", "Z") ||
            superReference.returnType != "V" ||
            !isSafeInjectionIndex(method.implementation, 1)
        ) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.AGENT_I_CHAT_INFORMATION_ENTRY),
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "LineAiEntryInstructionShapeMismatch",
            )
            return@execute
        }

        method.addInstructions(
            1,
            """
                invoke-static/range { p2 .. p2 }, $LINE_AI_HOOK
                move-result p2
            """.trimIndent(),
        )
        recordFeatureStatus(
            listOf(PatchId.AGENT_I_CHAT_INFORMATION_ENTRY),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "LineAiVisibilityAdjusted",
        )
    }
}
