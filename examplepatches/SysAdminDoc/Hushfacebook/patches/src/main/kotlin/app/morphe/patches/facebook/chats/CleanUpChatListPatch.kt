/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.cloneMutableAndPreserveParameters
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val CHAT_LIST = "$EXTENSION_PACKAGE/chats/ChatList;"
internal const val NOTES_TILES_HOOK = "$CHAT_LIST->notesTiles(Ljava/util/List;)Ljava/util/List;"
internal const val HIDES_PROMOTION = "$CHAT_LIST->hidesPromotion()Z"
internal const val IMMUTABLE_COPY_OF = "$IMMUTABLE_LIST_TYPE->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST_TYPE"

/**
 * Two switches for the list inside Facebook's own Chats: the row of notes and active friends above
 * the chats, and the promotion banners at the top. See ChatListAnchors.kt for what each hook sits
 * on and why only these two pieces are here.
 *
 * Both hooks ask their switch when Chats builds the piece, so the patch can stay in a build with
 * the switches off. Every anchor is found before the first edit.
 */
@Suppress("unused")
val cleanUpChatListPatch = bytecodePatch(
    // The README table check reads this literal; CHAT_LIST_PATCH carries the same text for the messages.
    name = "Clean up Facebook's chat list",
    description = "Two switches for Chats inside Facebook, both off until you turn them on. One empties the list behind the row " +
        "above your chats, so friends' notes and who's active go, and your own note tile may go too. The other takes out the " +
        "promotional banners at the top of Chats, like the one asking you to turn on notifications. Your chats, search " +
        "and new messages stay.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val store = classDefByStrings(NOTES_TILES, StringComparisonType.EQUALS).mapNotNull(::notesTrayOf).singleOrNull()
            ?: throw PatchException(
                "$CHAT_LIST_PATCH: expected one tile state whose constructor checks \"$NOTES_TILES\" and stores " +
                    "an ImmutableList, found none or several",
            )
        val questions = PROMOTION_TAGS.map { tag ->
            val found = classDefByStrings(tag, StringComparisonType.EQUALS).mapNotNull { bannerQuestion(it, tag) }
            found.singleOrNull() ?: throw PatchException(
                "$CHAT_LIST_PATCH: expected one Chats plugin whose builder loads \"$tag\" and whose show question " +
                    "takes ThreadListParams, found ${found.size}",
            )
        }
        // Everything that edits needs room first, so a build without it is refused before any edit.
        val tray = mutableClassDefBy(store.method.definingClass).methods.single {
            it.name == store.method.name && it.parameterTypes.map(Any::toString) == store.method.parameterTypes.map(Any::toString)
        }
        val asks = questions.map { question ->
            mutableClassDefBy(question.definingClass).methods.single {
                it.name == question.name && it.parameterTypes.map(Any::toString) == question.parameterTypes.map(Any::toString)
            }
        }
        tray.emptyTilesWhileHidden(store.store, store.list)
        // 577's diode question has no local at all (it works in its parameter registers), so a
        // question without one is replaced by a copy with its parameters moved down, freeing v0.
        asks.forEach { ask ->
            val target = if (ask.localRegisterCount() >= 1) ask
            else ask.cloneMutableAndPreserveParameters(mutableClassDefBy(ask.definingClass))
            target.answerNoWhileHidingPromotions()
        }
        enableStatus("chatListCleanup")
    }
}

/**
 * Before the constructor stores its tile list, the list goes through the extension and back
 * through ImmutableList.copyOf, which hands the same list back unless the switch asks for none.
 * A range call, because the list's register can sit anywhere in a method with many registers.
 */
internal fun MutableMethod.emptyTilesWhileHidden(store: Int, list: Int) {
    if (getInstruction<OneRegisterInstruction>(store).registerA != list) {
        throw PatchException("$CHAT_LIST_PATCH: $definingClass->$name doesn't store the list from v$list at $store")
    }
    addInstructions(
        store,
        """
            invoke-static/range { v$list .. v$list }, $NOTES_TILES_HOOK
            move-result-object v$list
            invoke-static/range { v$list .. v$list }, $IMMUTABLE_COPY_OF
            move-result-object v$list
        """,
    )
}

/**
 * First thing in a promotion banner's show question: ask the extension, and answer no when the
 * switch says the banner goes. Otherwise Facebook's own question runs from its first instruction.
 */
internal fun MutableMethod.answerNoWhileHidingPromotions() {
    requireLocals(CHAT_LIST_PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HIDES_PROMOTION
            move-result v0
            if-eqz v0, :facebook
            const/4 v0, 0x0
            return v0
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
