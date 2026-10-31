/*
 * Approach adapted from HushGram's "Hide Meta AI" patch (GPL-3,
 * https://github.com/SysAdminDoc/HushGram): the share sheet's "hatch" case and the quick
 * promotion builder. Meta AI feed units are dropped by Block.replaceFeedItemType.
 */
package com.feurstagram.patches.metaai

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.feurstagram.patches.shared.Constants.EXTENSION
import com.feurstagram.patches.shared.freeLocals
import com.feurstagram.patches.shared.hasStringEndingWith
import com.feurstagram.patches.shared.returnEarlyIf

private const val META_AI_CLASS = "Lcom/feurstagram/extension/MetaAi;"
private const val STRING_EQUALS = "Ljava/lang/String;->equals(Ljava/lang/Object;)Z"

/**
 * Index of the move-result of `name.equals("hatch")` followed by an if-eqz on it: the share
 * sheet's case for Meta AI's target (shown as Muse on some accounts). The reverse comparison
 * (`"hatch".equals(x)`, which only moves an existing target) has the constant as receiver and
 * is not matched.
 */
private fun Method.hatchCaseMoveResult(): Int? {
    val code = implementation?.instructions?.toList() ?: return null
    val at = code.indices.firstOrNull { at ->
        if (at + 3 >= code.size) return@firstOrNull false
        val const = code[at]
        if (const.opcode != Opcode.CONST_STRING && const.opcode != Opcode.CONST_STRING_JUMBO) return@firstOrNull false
        if (const.getReference<StringReference>()?.string != "hatch") return@firstOrNull false
        val hatch = (const as OneRegisterInstruction).registerA
        val call = code[at + 1] as? FiveRegisterInstruction ?: return@firstOrNull false
        val result = code[at + 2] as? OneRegisterInstruction ?: return@firstOrNull false
        val test = code[at + 3] as? OneRegisterInstruction ?: return@firstOrNull false
        code[at + 1].opcode == Opcode.INVOKE_VIRTUAL && code[at + 1].getReference<MethodReference>()?.toString() == STRING_EQUALS &&
            call.registerD == hatch && call.registerC != hatch &&
            code[at + 2].opcode == Opcode.MOVE_RESULT && code[at + 3].opcode == Opcode.IF_EQZ &&
            test.registerA == result.registerA
    }
    return at?.plus(2)
}

// The share sheet's target builder: one case per target name; Meta AI's compares with "hatch".
internal object ShareHatchCaseFingerprint : Fingerprint(
    custom = { method, _ -> method.hatchCaseMoveResult() != null && method.hasStringEndingWith("whatsapp_status") },
)

// Turns a server-sent quick promotion (the "Meet Muse" card) into the controller that builds its
// card; answering null builds no card. Picked by template, which the method names in three strings.
internal object QuickPromotionControllerFingerprint : Fingerprint(
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType.startsWith("L") &&
            method.parameterTypes.size == 2 &&
            listOf("fixed_banner_ig", "social_context_condensed_megaphone_ig", "inline_editing_standard_megaphone_ig")
                .all { method.hasStringEndingWith(it) }
    },
)

// The "About this reel" summary (generated text, sources, Ask Meta AI box) in the ⋯ menus of
// posts and reels comes from one static factory, (UserSession, mediaId, Z, Z) -> its own class.
// Every menu leaves the whole block out when it answers null, which it does itself when there is
// no summary, so returning null at its entry removes the lot.
internal object AboutThisReelFactoryFingerprint : Fingerprint(
    parameters = listOf("Lcom/instagram/common/session/UserSession;", "Ljava/lang/String;", "Z", "Z"),
    custom = { method, classDef ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == classDef.type
    },
)

@Suppress("unused")
val hideMetaAiPatch = bytecodePatch(
    name = "Hide Meta AI",
    description = "Removes Meta AI and Muse from the share sheet, quick-promotion cards and the " +
        "\"About this reel\" summary with its Ask Meta AI box; " +
        "its feed units (Vibes, Meta AI chats, Imagine) are dropped by the feed item filter. " +
        "Gated on the Meta AI and Muse toggle.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    extendWith(EXTENSION)

    execute {
        ShareHatchCaseFingerprint.method.apply {
            val moveResult = hatchCaseMoveResult()!!
            val register = (getInstruction(moveResult) as OneRegisterInstruction).registerA
            // A "no" here moves on to the next target name, as for an unknown one.
            addInstructions(
                moveResult + 1,
                """
                    invoke-static/range { v$register .. v$register }, $META_AI_CLASS->shareTarget(Z)Z
                    move-result v$register
                """,
            )
        }

        AboutThisReelFactoryFingerprint.method.returnEarlyIf(
            "isMetaAiBlocked",
            "const/4 v0, 0x0\n            return-object v0",
        )

        QuickPromotionControllerFingerprint.method.apply {
            if (freeLocals() < 1) throw PatchException("$name has no free register for the promotion hook")
            // Instance method: p0 is this, p1 the first parameter, p2 the promotion.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p2 .. p2 }, $META_AI_CLASS->dropsPromotion(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :build
                    const/4 v0, 0x0
                    return-object v0
                """,
                ExternalLabel("build", getInstruction(0)),
            )
        }
    }
}
