/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.downloadspeed

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val UPLOAD_SPEED = "$EXTENSION_PACKAGE/misc/UploadSpeed;"
internal const val UPLOAD_OPERATION = "Lorg/telegram/messenger/FileUploadOperation;"
internal const val UPLOAD_REQUESTS = "$UPLOAD_OPERATION->maxRequestsCount:I"
internal const val UPLOAD_CHUNK = "$UPLOAD_OPERATION->uploadChunkSize:I"
internal const val UPLOAD_HOOK = "$UPLOAD_SPEED->requests(I)I"

/** Where FileUploadOperation stores how many pieces it keeps in flight, and the register holding that number. */
internal class FasterUploadsPlan(val method: MutableMethod, val index: Int, val register: Int) {
    fun insert(target: MutableMethod = method) = target.addInstructionsAtControlFlowLabel(index,
        "invoke-static/range {v$register .. v$register}, $UPLOAD_HOOK\nmove-result v$register")

    /** The same edit on a copy, so a smali problem shows before the app is touched. */
    fun rehearse() = insert(MutableMethod(ImmutableMethod.of(method)))
}

/**
 * startUploadRequest sets {@code maxRequestsCount = max(1, (slowNetwork ? 32 : 2048) / pieceKB)} once, before it
 * sizes the encrypted-file IV list from it. The one write is the place to scale it.
 */
internal fun BytecodePatchContext.resolveFasterUploads(): FasterUploadsPlan {
    requireStatusMethod("fasterUploads")
    controlHook(UPLOAD_SPEED, "requests", listOf("I"), "I")
    val owner = tgMutableClassDefByOrNull(UPLOAD_OPERATION)
    controlShape(owner != null, "Telegram's file uploader is missing")
    val writes = owner!!.methods.filter { method -> method.controlBody().any { it.opcode == Opcode.IPUT && it.controlRef() == UPLOAD_REQUESTS } }
    val method = writes.controlSingle("the upload piece limit")
    val body = method.controlBody()
    val at = body.indices.filter { body[it].opcode == Opcode.IPUT && body[it].controlRef() == UPLOAD_REQUESTS }.controlSingle("the upload piece limit write")
    val register = (body[at] as OneRegisterInstruction).registerA
    controlShape(register <= 255 && body.take(at).any { it.controlRef() == UPLOAD_CHUNK } &&
        body.take(at).any { it.opcode == Opcode.DIV_INT_2ADDR || it.opcode == Opcode.DIV_INT } &&
        body.take(at).any { it.controlRef() == "Ljava/lang/Math;->max(II)I" }, "the upload piece limit is no longer sized from the piece size")
    return FasterUploadsPlan(method, at, register)
}
