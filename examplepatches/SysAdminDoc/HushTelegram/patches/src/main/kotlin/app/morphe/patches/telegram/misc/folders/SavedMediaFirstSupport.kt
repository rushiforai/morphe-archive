/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val SAVED_MEDIA = "$EXTENSION_PACKAGE/misc/SavedMedia;"
internal const val SAVED_MEDIA_HOOK = "$SAVED_MEDIA->viewAsChats(I)I"
/** Telegram's own "View as Chats" for Saved Messages, which the chat list reads before it opens it. */
internal const val SAVED_VIEW_AS_CHATS = "Lorg/telegram/messenger/MessagesController;->savedViewAsChats:Z"
/** Every chat the chat list opens gets these, and the open that reads View as Chats loads both. */
private const val LIST_OPEN = "dialog_folder_id"
private const val MEDIA_TAB = "start_from"

/** One read of View as Chats: the instruction at [read] loads it into [register], which a test right after uses. */
internal class SavedMediaSite(val method: MutableMethod, val read: Int, val register: Int) {
    fun code() = """
        invoke-static/range {v$register .. v$register}, $SAVED_MEDIA_HOOK
        move-result v$register
    """

    fun apply(into: MutableMethod = method) {
        into.addInstructions(read + 1, code())
    }
}

/** The chat list's two reads of View as Chats: the preload in onFragmentCreate and the open on a tap. */
internal class SavedMediaFirst(val preload: SavedMediaSite, val open: SavedMediaSite) {
    val sites get() = listOf(preload, open)

    fun apply() = sites.forEach { it.apply() }
}

private class NoSavedMedia(why: String) : Exception(why)

private fun savedMediaNeeded(ok: Boolean, why: String) {
    if (!ok) throw NoSavedMedia(why)
}

/**
 * Open Saved Messages on its media (#103). The chat list opens Saved Messages on its shared media
 * page, the one with the saved chats, media and files tabs, when Telegram's own View as Chats is on,
 * and reads that setting once more to load the saved chats early. Both reads go through the
 * extension, which also answers yes when the switch is on. Nothing else reads it differently, so
 * Saved Messages' own menu and View as Messages on the saved chats tab work as before.
 *
 * @return the two reads, and null; or null and why there are none
 */
internal fun BytecodePatchContext.resolveSavedMediaFirst(): Pair<SavedMediaFirst?, String?> = try {
    Pair(savedMediaFirst(), null)
} catch (missing: NoSavedMedia) {
    Pair(null, missing.message)
} catch (missing: PatchException) {
    Pair(null, missing.message)
}

private fun BytecodePatchContext.savedMediaFirst(): SavedMediaFirst {
    requireStatusMethod("savedMediaFirst")
    controlHook(SAVED_MEDIA, "viewAsChats", listOf("I"), "I")
    // The chat list is the class whose list open loads the folder it came from and reads View as Chats.
    val lists = mutableListOf<String>()
    forEachClassMentioning(Mention.reference(SAVED_VIEW_AS_CHATS) and Mention.string(LIST_OPEN)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.methods.any { m -> m.controlBody().let { body -> body.any { it.controlString() == LIST_OPEN } && body.any { it.controlRef() == SAVED_VIEW_AS_CHATS } } }) {
            lists += cls.type
        }
    }
    savedMediaNeeded(lists.size == 1, "the chat list's open of Saved Messages is missing or ambiguous (${lists.size} found)")
    val list = tgMutableClassDefBy(lists.single())
    val reads = list.methods.flatMap { method ->
        method.controlBody().withIndex().filter { (_, it) -> it.controlRef() == SAVED_VIEW_AS_CHATS }.map { (at, _) -> method to at }
    }
    savedMediaNeeded(reads.size == 2, "the chat list reads View as Chats ${reads.size} times, not twice")
    val preload = reads.singleOrNull { (method, _) -> method.origName == "onFragmentCreate" && method.parameterTypes.isEmpty() }
    savedMediaNeeded(preload != null, "the chat list no longer reads View as Chats as it starts")
    val open = reads.single { it !== preload }
    savedMediaNeeded(!AccessFlags.STATIC.isSet(open.first.accessFlags) && open.first.controlBody().let { body ->
        body.any { it.controlString() == LIST_OPEN } && body.any { it.controlString() == MEDIA_TAB }
    }, "the chat list's tap no longer opens Saved Messages on its media")
    return SavedMediaFirst(site(preload!!.first, preload.second), site(open.first, open.second))
}

/** The read at [read] in [method]: a boolean field load that a test right after uses, with nothing else jumping in between. */
private fun site(method: MutableMethod, read: Int): SavedMediaSite {
    val body = method.controlBody()
    val where = "the chat list's ${method.origName}"
    savedMediaNeeded(body[read].opcode == Opcode.IGET_BOOLEAN, "$where no longer loads View as Chats as a field")
    val register = (body[read] as TwoRegisterInstruction).registerA
    val test = body.getOrNull(read + 1)
    savedMediaNeeded(test != null && (test.opcode == Opcode.IF_EQZ || test.opcode == Opcode.IF_NEZ) &&
        (test as OneRegisterInstruction).registerA == register, "$where no longer tests View as Chats right away")
    val flow = ControlFlow.of(method)
    savedMediaNeeded(flow.normal.withIndex().none { (at, to) -> at != read && read + 1 in to } && flow.exceptional.none { read + 1 in it },
        "something jumps between $where's read of View as Chats and its test")
    val site = SavedMediaSite(method, read, register)
    // Assembled on a copy first, so a build that can't take it keeps its code. smali drops an
    // instruction it can't build and only logs it, so count what went in.
    val copy = MutableMethod(ImmutableMethod.of(method))
    val before = copy.implementation!!.instructions.size
    try {
        site.apply(copy)
    } catch (failed: RuntimeException) {
        throw NoSavedMedia("$where doesn't take the hook (${failed.javaClass.simpleName}: ${failed.message})")
    }
    savedMediaNeeded(copy.implementation!!.instructions.size - before == 2, "$where doesn't take the whole hook")
    return site
}
