/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.writeStub
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val COPY_SEND_HELPER = "Lorg/telegram/messenger/SendMessagesHelper;"
private const val COPY_STRING = "Ljava/lang/String;"
private const val COPY_TEXT_TYPE = "Ljava/lang/CharSequence;"

/** One Telegram send method Forward as copy calls, with the stub register each argument reads and the literals the rest take. */
internal class CopySend(val method: Method, val sources: Map<Int, String>, val literals: Map<Int, Int>)

private fun Method.types() = parameterTypes.map { it.toString() }
private fun Method.callable() = AccessFlags.PUBLIC.isSet(accessFlags) && AccessFlags.STATIC.isSet(accessFlags)

/**
 * The three sends Forward as copy makes (text, a photo and a document), found by name and by the
 * types at the positions the call fills, so a renamed or reshaped send leaves the item out instead
 * of calling the wrong method. Null when any of them is missing.
 */
internal fun BytecodePatchContext.resolveCopySends(): Triple<CopySend, CopySend, CopySend>? {
    val methods = classDefByOrNull(COPY_SEND_HELPER)?.methods?.toList() ?: return null
    fun find(name: String, size: Int, shape: Map<Int, String>) = methods.filter { m ->
        m.name == name && m.callable() && m.types().size == size && shape.all { (i, t) -> m.types()[i] == t }
    }.singleOrNull()
    val text = find("prepareSendingText", 7, mapOf(1 to COPY_TEXT_TYPE, 2 to "J", 3 to "Z", 4 to "I", 5 to "I", 6 to "J"))
    val photo = find("prepareSendingPhoto", 17, mapOf(1 to COPY_STRING, 3 to "J", 7 to COPY_TEXT_TYPE, 11 to "I", 13 to "Z", 14 to "I", 15 to "I"))
    val document = find("prepareSendingDocument", 17, mapOf(1 to COPY_STRING, 2 to COPY_STRING, 4 to COPY_STRING, 5 to COPY_STRING, 6 to "J", 12 to "Z", 13 to "I"))
    if (text == null || photo == null || document == null) return null
    // The first argument is the account's holder, made with its own getInstance(I).
    val holder = listOf(text, photo, document).map { it.types()[0] }.toSet().singleOrNull() ?: return null
    val made = classDefByOrNull(holder)?.methods?.any {
        it.name == "getInstance" && AccessFlags.STATIC.isSet(it.accessFlags) && it.types() == listOf("I") && it.returnType == holder
    } ?: false
    if (!made) return null
    // Stub registers: p0 account, p1/p2 chat, then the strings in order.
    return Triple(
        CopySend(text, mapOf(1 to "p3", 2 to "p1"), mapOf(3 to 1)),
        CopySend(photo, mapOf(1 to "p3", 3 to "p1", 7 to "p4"), mapOf(13 to 1)),
        CopySend(document, mapOf(1 to "p3", 2 to "p3", 4 to "p5", 5 to "p4", 6 to "p1"), mapOf(12 to 1)),
    )
}

/** The call's smali and the register count it needs, with the account's holder as argument 0. */
internal fun copyCall(send: CopySend, stubParams: Int): Pair<String, Int> {
    val types = send.method.types()
    val widths = types.map { if (it == "J") 2 else 1 }
    val locals = widths.sum()
    val lines = StringBuilder()
    var reg = 0
    for ((i, type) in types.withIndex()) {
        val source = send.sources[i]
        if (i == 0) {
            lines.append("invoke-static/range {p0 .. p0}, $type->getInstance(I)$type\nmove-result-object v$reg\n")
        } else if (source != null) {
            val move = when (type) {
                "J" -> "move-wide/from16"
                "I", "Z" -> "move/from16"
                else -> "move-object/from16"
            }
            lines.append("$move v$reg, $source\n")
        } else if (send.literals.containsKey(i)) {
            lines.append("const/16 v$reg, 0x${send.literals[i]!!.toString(16)}\n")
        } else if (type == "J") {
            lines.append("const-wide/16 v$reg, 0x0\n")
        } else {
            lines.append("const/16 v$reg, 0x0\n")
        }
        reg += widths[i]
    }
    val m = send.method
    lines.append("invoke-static/range {v0 .. v${locals - 1}}, ${m.definingClass}->${m.name}(${types.joinToString("")})${m.returnType}\n")
    lines.append("const/4 v0, 0x1\nreturn v0")
    return lines.toString() to locals + stubParams
}

/** Writes the three send stubs and the switch that says they exist, or leaves Forward as copy out of the menu. */
internal fun BytecodePatchContext.writeSendCopyStubs() {
    val sends = resolveCopySends()
    if (sends == null) {
        patchLog.warning("Add Repeat to the message menu: this Telegram's send methods weren't found. Forward as copy stays out of the menu.")
        return
    }
    val (text, photo, document) = sends
    // Stub parameter registers: text (I, J, String) takes 4, photo 5, document 6.
    copyCall(text, 4).let { (smali, regs) -> writeStub(MESSAGE_MENU, "sendText", regs, smali) }
    copyCall(photo, 5).let { (smali, regs) -> writeStub(MESSAGE_MENU, "sendPhoto", regs, smali) }
    copyCall(document, 6).let { (smali, regs) -> writeStub(MESSAGE_MENU, "sendFile", regs, smali) }
    writeStub(MESSAGE_MENU, "sending", 1, "const/4 v0, 0x1\nreturn v0")
}
