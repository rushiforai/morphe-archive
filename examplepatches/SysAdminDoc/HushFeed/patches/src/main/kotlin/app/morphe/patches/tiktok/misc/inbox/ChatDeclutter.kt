/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Follows kveld9's TikTok patch notes for the chat title bar and the sticker banner.
 */
package app.morphe.patches.tiktok.misc.inbox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.addInstruction
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/*
 * The chat screen's clutter, hidden one switch at a time. Every class here keeps its real
 * name on 47.0.3, 47.1.3 and 47.1.4, and so does every method the gates use, because the
 * message list protocols implement an interface and the title bar overrides a framework hook.
 */

private const val CHAT_TITLE_BAR_EXTENSION = "Lapp/morphe/extension/tiktok/inbox/ChatTitleBar;"
private const val TUX_ICON_VIEW = "Lcom/bytedance/tux/icon/TuxIconView;"

/** The call buttons at the right of a single chat's title bar are bound in this one method. */
internal object ChatTitleBarRightBindFingerprint : Fingerprint(
    definingClass = "/BaseSingleChatTitleBarRightAssem;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

/** The banner of sticker suggestions in a chat. Its enable check answers true. */
internal object ChatStickerBannerEnabledFingerprint : Fingerprint(
    definingClass = "/PreshownStickerBannerProtocol;",
    name = "isEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

/** The suggested reply cells in a chat's message list. */
internal object ChatSuggestedReplyEnabledFingerprint : Fingerprint(
    definingClass = "/IMUnifiedSuggestedReplyMsgProtocol;",
    name = "isEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

/** The banner that introduces suggested replies. */
internal object ChatSmartReplyIntroEnabledFingerprint : Fingerprint(
    definingClass = "/SmartReplyIntroBannerProtocol;",
    name = "isEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Where a call button is stored: the `iput-object` of a TuxIconView into a field of the
 * title bar's own class. The field names are obfuscated and differ between builds, so the
 * type is what identifies them. The chat details button next to them is never stored in a
 * field, which is what keeps it out of this.
 */
internal fun MutableMethod.callButtonStores(): List<Int> {
    val code = implementation ?: return emptyList()
    return code.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IPUT_OBJECT &&
            instruction.getReference<FieldReference>()?.let {
                it.type == TUX_ICON_VIEW && it.definingClass == definingClass
            } == true
    }.map { it.index }
}

/**
 * Hands each call button to the extension as it is stored. Exactly two stores are expected,
 * and anything else stops the patch rather than hiding a guess.
 */
internal fun MutableMethod.hideCallButtonsAtBind() {
    val stores = callButtonStores()
    if (stores.size != EXPECTED_CALL_BUTTONS) {
        throw PatchException(
            "Hide inbox items: the chat title bar stores ${stores.size} icon views in " +
                "$definingClass->$name, not $EXPECTED_CALL_BUTTONS; the call buttons moved.",
        )
    }
    // Later stores first, so each index is still where it was when the earlier ones go in.
    stores.sortedDescending().forEach { index ->
        val source = (implementation!!.instructions.elementAt(index) as OneRegisterInstruction).registerA
        addInstruction(
            index,
            "invoke-static/range {v$source .. v$source}, " +
                "$CHAT_TITLE_BAR_EXTENSION->hideCallButton(Landroid/view/View;)V",
        )
    }
}

internal const val EXPECTED_CALL_BUTTONS = 2
