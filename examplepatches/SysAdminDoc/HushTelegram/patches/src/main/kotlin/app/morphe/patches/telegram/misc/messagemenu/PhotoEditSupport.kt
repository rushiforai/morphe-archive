/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val PHOTO_EDIT = "$EXTENSION_PACKAGE/misc/PhotoEdit;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val BITMAP = "Landroid/graphics/Bitmap;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"
private val ENTRY_ARGUMENTS = setOf("I", "Z", "J", STRING)

/**
 * The calls the chat's own video editor makes to open a file in Telegram's media editor, read off
 * that opener so Edit a copy makes the same ones for a photo: the viewer's [instance], [parent]
 * with the chat's [theme], the gallery entry [entry] (a path plus numbers), the viewer's [visible]
 * and [close], the [provider] that sends the edited copy to the chat, and [open] itself.
 */
internal class PhotoEditCalls(
    val chat: String, val instance: String, val parent: String, val theme: String, val entry: MethodReference, val entryRef: String,
    val visible: String, val close: String, val provider: String, val open: MethodReference, val openRef: String,
)

/** Edit a copy in the message menu: the stubs that open a downloaded photo in Telegram's editor, or why this build can't. */
internal class PhotoEditPlan(val missing: String?, private val calls: PhotoEditCalls? = null) {
    fun apply(context: BytecodePatchContext) = context.writePhotoEditStubs(calls!!)
}

/**
 * Telegram opens a picked video in its editor from one chat method: it takes the caption and the
 * path, readies the viewer for the chat, wraps the path in a gallery entry, closes the viewer if
 * it's up, and opens the list with a provider that sends what the editor hands back. Edit a copy
 * makes those calls for a photo, with the entry marked as a photo instead of a video.
 */
internal fun BytecodePatchContext.resolvePhotoEdit(chat: String): PhotoEditPlan = try {
    requireStatusMethod("photoEdit")
    controlHook(PHOTO_EDIT, "open", listOf(OBJECT, STRING, BITMAP), "Z")
    controlHook(PHOTO_EDIT, "icon", listOf(), "I")
    controlMembers(DRAWABLES, "static msg_photoeditor:I")
    PhotoEditPlan(null, photoEditCalls(chat))
} catch (refused: PatchException) {
    PhotoEditPlan(refused.message ?: "the chat's media editor can't be opened")
} catch (failed: RuntimeException) {
    PhotoEditPlan("the chat's media editor can't be opened (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The viewer's open: the list, two numbers, a flag, the provider and the chat, in that order. */
private fun MethodReference.opensFor(chat: String) = origReturnType == "V" && origParameterTypes.let {
    it.size == 6 && it[0] == ARRAY_LIST && it[1] == "I" && it[2] == "I" && it[3] == "Z" && it[5] == chat
}

private fun BytecodePatchContext.photoEditCalls(chat: String): PhotoEditCalls {
    val opener = tgMutableClassDefBy(chat).methods.filter { m ->
        m.origParameterTypes == listOf(CHAR_SEQUENCE, STRING) && m.origReturnType == "V" &&
            m.controlBody().any { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE && it.method()?.opensFor(chat) == true }
    }.controlSingle("the chat's media editor opener")
    val body = opener.controlBody()
    fun at(why: String, test: (Instruction) -> Boolean): Int {
        val hits = body.indices.filter { test(body[it]) }
        controlShape(hits.isNotEmpty(), why)
        // One call, made once or more: the first is the one that counts.
        controlShape(hits.map { body[it].controlRef() }.distinct().size == 1, "$why is ambiguous")
        return hits.first()
    }

    val openAt = at("the media editor's open") { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE && it.method()?.opensFor(chat) == true }
    val open = body[openAt].method()!!
    val viewer = open.origDefiningClass
    fun MethodReference.onViewer() = origDefiningClass == viewer
    val instanceAt = at("the media viewer's instance") {
        it.opcode == Opcode.INVOKE_STATIC && it.method()?.let { m -> m.onViewer() && m.parameterTypes.isEmpty() && m.origReturnType == viewer } == true
    }
    val parentAt = at("the media viewer's parent") {
        it.opcode == Opcode.INVOKE_VIRTUAL && it.method()?.let { m ->
            m.onViewer() && m.origReturnType == "V" && m.origParameterTypes.size == 3 && m.origParameterTypes[0] == ACTIVITY
        } == true
    }
    // The theme is the chat field read into the parent call's last argument just before it.
    val themeRegister = (body[parentAt] as FiveRegisterInstruction).registerF
    val themeRead = body.subList(0, parentAt).lastOrNull { it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerA == themeRegister }
    controlShape(themeRead?.controlField()?.definingClass == chat, "the chat's theme for the media viewer")
    val entryAt = at("the gallery entry") {
        it.opcode == Opcode.INVOKE_DIRECT_RANGE && it.method()?.let { m ->
            m.name == "<init>" && m.origParameterTypes.all { p -> p in ENTRY_ARGUMENTS } && m.origParameterTypes.count { p -> p == STRING } == 1
        } == true
    }
    val entry = body[entryAt].method()!!
    val visibleAt = at("the media viewer's visible check") {
        it.opcode == Opcode.INVOKE_VIRTUAL && it.method()?.let { m -> m.onViewer() && m.parameterTypes.isEmpty() && m.origReturnType == "Z" } == true
    }
    val closeAt = at("the media viewer's close") {
        it.opcode == Opcode.INVOKE_VIRTUAL && it.method()?.let { m -> m.onViewer() && m.origParameterTypes == listOf("Z", "Z") && m.origReturnType == "V" } == true
    }
    val providerAt = at("the editor's send provider") {
        it.opcode == Opcode.INVOKE_DIRECT && it.method()?.let { m -> m.name == "<init>" && m.origParameterTypes == listOf(chat, BITMAP, ARRAY_LIST) } == true
    }
    controlShape(listOf(instanceAt, parentAt, entryAt, visibleAt, closeAt, providerAt, openAt).zipWithNext().all { (a, b) -> a < b },
        "the media editor opener's calls are out of order")

    val calls = PhotoEditCalls(chat, body[instanceAt].controlRef()!!, body[parentAt].controlRef()!!, themeRead!!.controlRef()!!,
        entry, body[entryAt].controlRef()!!, body[visibleAt].controlRef()!!, body[closeAt].controlRef()!!, body[providerAt].controlRef()!!,
        open, body[openAt].controlRef()!!)
    requireReachable(calls.instance, true)
    for (ref in listOf(calls.parent, calls.theme, calls.entryRef, calls.visible, calls.close, calls.provider, calls.openRef)) {
        requireReachable(ref, false)
    }
    return calls
}

/** Registers the open stub's locals take: v0 to v6, the entry's arguments, then the open's receiver and six arguments. */
private fun photoEditLocals(entryTypes: List<String>) = 7 + entryTypes.sumOf { if (it == "J") 2 else 1 } + 7

private fun BytecodePatchContext.writePhotoEditStubs(calls: PhotoEditCalls) {
    val entryTypes = calls.entry.origParameterTypes
    val providerType = calls.provider.substringBefore("->")
    // v0 viewer, v1 list, v2 scratch then provider, v3 chat, v4 theme, v5 preview, v6 entry and its
    // arguments from v7, then the open's receiver and arguments from vB; p0 chat, p1 path, p2 preview last.
    val entryArgs = mutableListOf<String>()
    var r = 7
    for (type in entryTypes) {
        entryArgs += when (type) {
            STRING -> "move-object/from16 v$r, p1"
            "J" -> "const-wide/16 v$r, 0x0"
            else -> "const/16 v$r, 0x0"
        }
        r += if (type == "J") 2 else 1
    }
    val entryLast = r - 1
    val b = r
    val openArgs = mutableListOf("move-object/from16 v$b, v0")
    for ((i, type) in calls.open.origParameterTypes.withIndex()) {
        val to = b + 1 + i
        openArgs += when (type) {
            ARRAY_LIST -> "move-object/from16 v$to, v1"
            "I", "Z" -> "const/16 v$to, 0x0"
            calls.chat -> "move-object/from16 v$to, v3"
            else -> "move-object/from16 v$to, v2"
        }
    }
    val smali = listOf(
        "invoke-static {}, ${calls.instance}",
        "move-result-object v0",
        "move-object/from16 v3, p0",
        "check-cast v3, ${calls.chat}",
        "iget-object v4, v3, ${calls.theme}",
        "const/4 v2, 0x0",
        "invoke-virtual {v0, v2, v3, v4}, ${calls.parent}",
        "new-instance v1, $ARRAY_LIST",
        "invoke-direct {v1}, $ARRAY_LIST-><init>()V",
        "new-instance v6, ${calls.entryRef.substringBefore("->")}",
    ) + entryArgs + listOf(
        "invoke-direct/range {v6 .. v$entryLast}, ${calls.entryRef}",
        "invoke-virtual {v1, v6}, $ARRAY_LIST->add(Ljava/lang/Object;)Z",
        "invoke-virtual {v0}, ${calls.visible}",
        "move-result v2",
        "if-eqz v2, :hush_open",
        "const/4 v2, 0x0",
        "invoke-virtual {v0, v2, v2}, ${calls.close}",
        ":hush_open",
        "move-object/from16 v5, p2",
        "new-instance v2, $providerType",
        "invoke-direct {v2, v3, v5, v1}, ${calls.provider}",
    ) + openArgs + listOf(
        "invoke-virtual/range {v$b .. v${b + 6}}, ${calls.openRef}",
        "const/4 v0, 0x1",
        "return v0",
    )
    writeStub(PHOTO_EDIT, "open", photoEditLocals(entryTypes) + 3, smali.joinToString("\n"))
    writeStub(PHOTO_EDIT, "icon", 1, "sget v0, $DRAWABLES->msg_photoeditor:I\nreturn v0")
}
