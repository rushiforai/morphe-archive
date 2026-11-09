/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.util.names.tgMutableClassDefBy

internal const val STORY_SAVE = "Lapp/hushtelegram/extension/telegram/misc/StorySave;"
internal const val STORY_SHAREABLE = "$STORY_SAVE->shareable(I)Z"
internal const val STORY_PREMIUM = "$STORY_SAVE->premium(I)Z"
private const val SAVE_ICON = "Lorg/telegram/messenger/R\$drawable;->msg_gallery:I"
private const val SAVE_LABEL = "Lorg/telegram/messenger/R\$string;->SaveToGallery:I"
private const val LOCKED_ICON = "Lorg/telegram/messenger/R\$drawable;->msg_gallery_locked2:I"
private const val IS_PREMIUM = "Lorg/telegram/messenger/UserConfig;->isPremium()Z"
private const val ACCOUNT_OF = "Lorg/telegram/messenger/UserConfig;->getInstance(I)Lorg/telegram/messenger/UserConfig;"

/** Where the story menu reads "can be shared" and "is Premium" for Save to Gallery. */
private class StorySaveChecks(val share: Int, val premium: Int)

/** The story menu's two answers on the way to Save to Gallery, or why this build has no such spot. */
internal class StorySavePlan(val missing: String?, private val method: MutableMethod?) {
    fun apply() {
        val target = method ?: return
        // Read again here: another hook may have landed in this menu since the plan was made.
        val at = target.storySaveChecks() ?: throw IllegalStateException("the story menu changed under the patch")
        // The later spot goes in first so the earlier index still holds.
        target.ask(at.premium, STORY_PREMIUM)
        target.ask(at.share, STORY_SHAREABLE)
    }
}

/** The answer sits in the register the next branch tests, and nothing branches between the two. */
private fun MutableMethod.ask(read: Int, hook: String) {
    val register = (implementation!!.instructions.elementAt(read) as OneRegisterInstruction).registerA
    addInstructions(read + 1, "invoke-static/range {v$register .. v$register}, $hook\nmove-result v$register")
}

/**
 * PeerStoriesView's three-dot menu adds Save to Gallery behind
 * `!unsupported && allowShare && !isLive && isPremium()`, with a locked copy of the item for
 * accounts without Premium. Telegram's own save method only needs the story's file, so answering
 * yes at the allowShare and isPremium reads gives this one item back. isLive stays as it is, a
 * live story has no file. Both instruction runs are checked exactly because a build that moved
 * them is one this mustn't guess on.
 */
private fun Method.storySaveChecks(): StorySaveChecks? {
    val code = implementation?.instructions?.toList() ?: return null
    // The locked copy of the item has the same icon and label, so the reads in front tell them apart.
    // 13.1.1 loads the icon and the label right after the Premium branch. 13.2 loads the label once,
    // between the Premium answer and its branch, for both copies, and the icon after the branch.
    return code.indices.filter { code[it].controlRef() == SAVE_LABEL }.mapNotNull { at ->
        when {
            code.getOrNull(at - 1)?.controlRef() == SAVE_ICON -> code.storySaveChecksAt(at - 2, at - 3)
            code.getOrNull(at + 1)?.opcode == Opcode.IF_EQZ && code.drop(at + 2).any { it.controlRef() == SAVE_ICON } &&
                (code[at] as? OneRegisterInstruction)?.registerA != (code[at + 1] as OneRegisterInstruction).registerA ->
                code.storySaveChecksAt(at + 1, at - 1)
            else -> null
        }
    }.singleOrNull()
}

/** The Premium branch at [branch] tests the answer moved in at [answered], with the share and live checks before it. */
private fun List<Instruction>.storySaveChecksAt(branch: Int, answered: Int): StorySaveChecks? {
    val at = answered
    if (at < 8) return null
    val code = this
    val answer = (code[at] as? OneRegisterInstruction)?.registerA ?: return null
    val shared = (code[at - 8] as? OneRegisterInstruction)?.registerA ?: return null
    val shape = code[branch].opcode == Opcode.IF_EQZ && (code[branch] as OneRegisterInstruction).registerA == answer &&
        code[at].opcode == Opcode.MOVE_RESULT &&
        code[at - 1].controlRef() == IS_PREMIUM &&
        code[at - 2].opcode == Opcode.MOVE_RESULT_OBJECT &&
        code[at - 3].controlRef() == ACCOUNT_OF &&
        code[at - 4].opcode == Opcode.IGET &&
        code[at - 5].opcode == Opcode.IF_NEZ &&
        code[at - 6].opcode == Opcode.IGET_BOOLEAN &&
        code[at - 7].opcode == Opcode.IF_EQZ && (code[at - 7] as OneRegisterInstruction).registerA == shared &&
        code[at - 8].opcode == Opcode.IGET_BOOLEAN
    return if (shape) StorySaveChecks(at - 8, at) else null
}

internal fun Method.isStorySaveMenu(): Boolean = storySaveChecks() != null &&
    implementation!!.instructions.any { it.controlRef() == LOCKED_ICON }

internal fun BytecodePatchContext.resolveStorySave(): StorySavePlan {
    val found = classDefsMentioning(Mention.reference(SAVE_LABEL) and Mention.reference(LOCKED_ICON)).flatMap { cls ->
        cls.methods.filter { it.isStorySaveMenu() }
    }
    val match = found.singleOrNull() ?: return StorySavePlan(
        "the story menu no longer has one Save to Gallery check (found ${found.size})", null)
    val method = tgMutableClassDefBy(match.definingClass).methods.single { it.toString() == match.toString() }
    return StorySavePlan(null, method)
}
