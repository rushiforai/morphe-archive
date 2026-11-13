/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 455 (2026-11-12).
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.threads.comments.RepliesParseFingerprint
import app.morphe.patches.threads.comments.responseListSite
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PATCH = "Hide suggested users"

/** What an opened post's page of replies reads each of its suggested threads as. */
internal const val RELATED_THREAD = "Lcom/instagram/api/schemas/RelatedThreadIntf;"

internal const val SUGGESTED_THREADS = "$EXTENSION_PACKAGE/comments/SuggestedThreads;"
internal const val RELATED_THREADS_CALL = "$SUGGESTED_THREADS->relatedThreads(Ljava/util/List;)Ljava/util/List;"

/**
 * Where the parse of an opened post's page of replies reads the page's suggested threads: in
 * [method], the call at [read] answers the list, and the `move-result-object` after it puts it in [list].
 */
internal class RelatedThreadsRead(val method: MutableMethod, val read: Int, val list: Int)

/**
 * Finds where an opened post reads the suggested threads Threads draws under its replies.
 *
 * Each page of replies Threads loads for an opened post comes with two lists: the replies, and the
 * related threads it shows as cards below them under a header of its own. The parse Filter comments
 * hooks reads both, one after the other, and walks each one, casting every entry of the second to
 * [RELATED_THREAD]. That cast tells the lists apart, so the read has to be the only one of its shape,
 * with nothing branching onto the instruction after it, or the patch refuses.
 */
internal fun BytecodePatchContext.relatedThreadsRead(): RelatedThreadsRead {
    val method = RepliesParseFingerprint.method
    val read = method.responseListSite(RELATED_THREAD, PATCH, "suggested threads")
    val list = (method.implementation!!.instructions.elementAt(read + 1) as OneRegisterInstruction).registerA
    return RelatedThreadsRead(method, read, list)
}

/**
 * Hands the list to the extension right after it's read, and walks what comes back. Call only with
 * what [relatedThreadsRead] found. `move-result-object` writes up to v255, so the call is a range call.
 */
internal fun hookRelatedThreads(read: RelatedThreadsRead) {
    read.method.addInstructions(
        read.read + 2,
        """
            invoke-static/range { v${read.list} .. v${read.list} }, $RELATED_THREADS_CALL
            move-result-object v${read.list}
        """,
    )
}
