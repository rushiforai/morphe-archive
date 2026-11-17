/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val KNOWN_FILES = "$EXTENSION_PACKAGE/misc/KnownFiles;"
internal const val KNOWN_FILE = "$KNOWN_FILES->knownFile(Ljava/lang/Object;Ljava/io/File;)Ljava/io/File;"
internal const val KNOWN_PHOTO_SIZE = "Lorg/telegram/tgnet/TLRPC\$PhotoSize;"

/**
 * Where getPathToAttach's last return hands back `new File(dir, getAttachFileName(object, ext))`,
 * or [missing], why a file this account has no record of keeps its download button. [call] is
 * the name call, [attach] the register the object is in there, and [spare] one nothing reads
 * from there to the return.
 */
internal class KnownFilePlan(
    val method: MutableMethod?,
    val call: Int,
    val attach: Int,
    val spare: Int,
    val missing: String?,
) {
    /**
     * The build writes the name over the object's register, so the object goes into [spare] right
     * before the name call. The extension sees it with the File right before the return, after
     * whatever the storage folder's hook put there, so a file in a folder Telegram's moved from
     * still counts as there and only a missing one is looked for.
     */
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        val target = into(method!!)
        val count = target.implementation!!.instructions.size
        val ret = (call until count).first { target.getInstruction(it).opcode == Opcode.RETURN_OBJECT }
        val file = target.getInstruction(ret).namedRegisters().single()
        val invoke = if (spare <= 15 && file <= 15) "invoke-static {v$spare, v$file}, $KNOWN_FILE"
            else "invoke-static/range {v$spare .. v$file}, $KNOWN_FILE"
        target.addInstructionsAtControlFlowLabel(ret, """
            $invoke
            move-result-object v$file
        """)
        target.addInstructionsAtControlFlowLabel(call, "move-object/from16 v$spare, v$attach")
    }

    /** The same inserts on a copy, so a smali problem refuses before the app is touched. */
    fun rehearse() = apply { MutableMethod(ImmutableMethod.of(it)) }

    companion object {
        fun missing(why: String) = KnownFilePlan(null, -1, -1, -1, why)
    }
}

/** The runtime the insert calls and the stubs it reads Telegram's objects with. A change there refuses the whole patch. */
internal fun BytecodePatchContext.requireKnownFilesRuntime() {
    requireStatusMethod("knownFiles")
    controlHook(KNOWN_FILES, "knownFile", listOf("Ljava/lang/Object;", "Ljava/io/File;"), "Ljava/io/File;")
    controlHook(KNOWN_FILES, "documentName", listOf("Ljava/lang/Object;"), "Ljava/lang/String;")
    controlHook(KNOWN_FILES, "size", listOf("Ljava/lang/Object;"), "J")
}

/**
 * The return [older] found is the one getPathToAttach makes for a document, photo or video that
 * isn't on the account's own list of saved paths. The build passes the object to the name call
 * and writes the name back over it, so a register nobody reads from that call to the return has
 * to carry it. A jump onto anything after the name call, or no such register, leaves every file
 * as Telegram shows it.
 */
internal fun resolveKnownFiles(older: OlderFilePlan): KnownFilePlan {
    val method = older.method ?: return KnownFilePlan.missing(older.missing ?: "Telegram's download path changed")
    val at = older.at
    val call = at - 3
    val body = method.controlBody()
    val name = body[call].call() ?: return KnownFilePlan.missing("Telegram's download path changed")
    val registers = body[call].namedRegisters()
    val slot = name.parameterTypes.map { it.toString() }.indexOf(TL_OBJECT)
    if (registers.size != 2 || slot < 0) return KnownFilePlan.missing("Telegram's download path changed")
    val attach = registers[slot]
    val flow = ControlFlow.of(method)
    val into = Array(body.size) { mutableListOf<Int>() }
    flow.normal.forEachIndexed { from, targets -> targets.forEach { into[it] += from } }
    if ((call + 1..at).any { into[it] != listOf(it - 1) }) {
        return KnownFilePlan.missing("Telegram's download path is reached another way")
    }
    val live = RegisterLiveness.of(method).liveInto(call)
    val named = (call..at).flatMap { body[it].namedRegisters() }.toSet()
    val file = body[at].namedRegisters().single()
    val free = (0 until method.implementation!!.registerCount).filter { it !in live && it !in named }
    val spare = (if (file <= 15) free.firstOrNull { it <= 15 } else free.firstOrNull { it == file - 1 })
        ?: return KnownFilePlan.missing("Telegram's download path has no free register")
    return KnownFilePlan(method, call, attach, spare, null)
}

/** What KnownFiles reads from a document or a photo size: its own file name, and its size in bytes. */
internal fun BytecodePatchContext.writeKnownFilesStubs() {
    writeStub(KNOWN_FILES, "documentName", 2, """
        instance-of v0, p0, $DOCUMENT
        if-eqz v0, :hush_none
        check-cast p0, $DOCUMENT
        invoke-static {p0}, $DOCUMENT_NAME
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    writeStub(KNOWN_FILES, "size", 3, """
        instance-of v0, p0, $DOCUMENT
        if-eqz v0, :hush_photo
        check-cast p0, $DOCUMENT
        iget-wide v0, p0, $DOCUMENT->size:J
        return-wide v0
        :hush_photo
        instance-of v0, p0, $KNOWN_PHOTO_SIZE
        if-eqz v0, :hush_none
        check-cast p0, $KNOWN_PHOTO_SIZE
        iget v0, p0, $KNOWN_PHOTO_SIZE->size:I
        int-to-long v0, v0
        return-wide v0
        :hush_none
        const-wide/16 v0, 0x0
        return-wide v0
    """)
}
