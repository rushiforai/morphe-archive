package app.blackmagic.patches.gallery

import app.blackmagic.patches.shared.Constants.COMPATIBILITY_BLACKMAGIC_CAM
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val IGET_OPCODES = setOf(
    Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_WIDE, Opcode.IGET_BOOLEAN,
)

private fun FieldReference.smali() = "$definingClass->$name:$type"
private fun MethodReference.smali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

@Suppress("unused")
val smoothGalleryThumbnailsPatch = bytecodePatch(
    name = "Smooth gallery thumbnails",
    description = "Replaces the in-app gallery's grid thumbnail fetcher, which spins up a full " +
        "ExoPlayer + GL-readback pipeline per cell (hundreds of MB of transient graphics memory " +
        "and a short-lived player for every tile), with a direct " +
        "MediaMetadataRetriever.getScaledFrameAtTime decode at the tile size. This removes the " +
        "memory spikes that make browsing stutter and can trigger the low-memory killer mid-record.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLACKMAGIC_CAM)

    execute {
        val method = FrameFetcherLoadDataFingerprint.method
        val impl = method.implementation ?: throw PatchException("fetcher has no body")

        // The callback (Glide DataCallback) is the second parameter.
        val callbackType = method.parameterTypes[1].toString()

        // Discover every obfuscated reference from the method's own bytecode, keyed
        // purely on stable (non-obfuscated) types, so renames across versions are tolerated.
        val fieldReads = impl.instructions
            .filter { it.opcode in IGET_OPCODES }
            .map { (it as ReferenceInstruction).reference as FieldReference }

        val contextField = fieldReads.first { it.type == "Landroid/content/Context;" }
        val modelField = fieldReads.first {
            it.definingClass == method.definingClass &&
                it.type != "Landroid/content/Context;" && it.type != "Z"
        }
        val modelType = modelField.type
        val uriField = fieldReads.first { it.definingClass == modelType && it.type == "Landroid/net/Uri;" }
        val intFields = fieldReads.filter { it.definingClass == modelType && it.type == "I" }.distinct()
        // 3.5.1's loadData is a dispatcher that launches a coroutine, so the frame
        // position (a long) is read in the lambda, not here. Resolve it from the model
        // class definition instead of the dispatcher body.
        val posField = classDefBy(modelType).fields.first { it.type == "J" }
        if (intFields.size < 2) throw PatchException("gallery model shape changed (width/height)")
        val widthField = intFields[0]
        val heightField = intFields[1]

        val calls = impl.instructions
            .filter { it.opcode == Opcode.INVOKE_INTERFACE || it.opcode == Opcode.INVOKE_STATIC }
            .map { (it as ReferenceInstruction).reference as MethodReference }

        // The success callback is invoked from the coroutine lambda, not the
        // dispatcher, so resolve both callback methods from the interface definition.
        val callbackClass = classDefBy(callbackType)
        val deliver = callbackClass.methods.first {
            it.returnType == "V" &&
                it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Object;")
        }
        val onFailed = callbackClass.methods.first {
            it.returnType == "V" &&
                it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Exception;")
        }
        val uriExists = calls.first {
            it.returnType == "Z" &&
                it.parameterTypes.map { p -> p.toString() } ==
                listOf("Landroid/content/Context;", "Landroid/net/Uri;")
        }

        // Prepend a self-contained replacement body. Every path returns before the
        // original dispatcher (coroutine launch) runs, so it stays as unreachable dead
        // code and its try/catch blocks are never entered.
        //
        // The 3.5.1 dispatcher has only 8 registers (5 locals + this/Priority/callback),
        // many fewer than the old fetcher, so the body is packed into v0..v6 (reusing the
        // `this` and `Priority` slots after their last read) with the callback kept in p2.
        // getScaledFrameAtTime(timeUs, option, dstWidth, dstHeight) needs 6 contiguous
        // registers v0..v5; note option (2 = CLOSEST_SYNC) is the 2nd arg, not the last.
        method.addInstructionsWithLabels(
            0,
            """
                iget-object v6, p0, ${modelField.smali()}
                iget-object v3, p0, ${contextField.smali()}
                iget-object v4, v6, ${uriField.smali()}
                invoke-static { v3, v4 }, ${uriExists.smali()}
                move-result v0
                if-eqz v0, :fail
                new-instance v0, Landroid/media/MediaMetadataRetriever;
                invoke-direct { v0 }, Landroid/media/MediaMetadataRetriever;-><init>()V
                invoke-virtual { v0, v3, v4 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V
                iget-wide v1, v6, ${posField.smali()}
                const-wide/16 v4, 0x3e8
                mul-long/2addr v1, v4
                const/4 v3, 0x2
                iget v4, v6, ${widthField.smali()}
                iget v5, v6, ${heightField.smali()}
                invoke-virtual/range { v0 .. v5 }, Landroid/media/MediaMetadataRetriever;->getScaledFrameAtTime(JIII)Landroid/graphics/Bitmap;
                move-result-object v3
                invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->release()V
                if-eqz v3, :faildecode
                invoke-interface { p2, v3 }, ${deliver.smali()}
                return-void
                :faildecode
                new-instance v0, Ljava/lang/Exception;
                invoke-direct { v0 }, Ljava/lang/Exception;-><init>()V
                invoke-interface { p2, v0 }, ${onFailed.smali()}
                return-void
                :fail
                new-instance v0, Ljava/io/FileNotFoundException;
                invoke-direct { v0 }, Ljava/io/FileNotFoundException;-><init>()V
                invoke-interface { p2, v0 }, ${onFailed.smali()}
                return-void
            """.trimIndent(),
        )
    }
}
