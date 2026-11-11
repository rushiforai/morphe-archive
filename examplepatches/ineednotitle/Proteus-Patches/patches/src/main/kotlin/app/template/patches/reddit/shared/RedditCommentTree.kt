package app.template.patches.reddit.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Comment-thread hooks for the Reddit "Block AutoMod comments" and "Show
 * deleted posts and comments" patches.
 *
 * Reddit's comment thread renderer does NOT flow through
 * `com.reddit.domain.model.listing.Listing`.  The comment tree store
 * (`com.reddit.comments.tree.c`, obfuscated `RedditCommentTreeStore`) emits an
 * obfuscated `Lc5l0;` TreeData object whose constructor receives:
 *
 *   a = changes (`Lhye;`)
 *   b = ordered tree item ids (`List`)
 *   c = id → comment (`Map`)
 *   d = id → tree item wrapper (`Map`)
 *
 * Hooking that constructor is the comment equivalent of the `Listing.children`
 * anchor.  The wrapper classes (`Lf5l0;` user comment, `Ld5l0;` ad,
 * `Le5l0;` more-comment) expose the kind-with-id string in their public `a`
 * field, while the comment map values are full `Comment` objects.
 *
 * Deleted comments are filtered on the same TreeData constructor: the comment
 * map is one batch, so one archive request covers every deleted row in the
 * thread instead of one request per `Comment` object.  The store's flow runs
 * in the application coroutine scope, so this is off the Compose UI thread.
 *
 * Verified against Reddit 2026.42.0:
 *   classes8.dex: `Lc5l0;.<init>:(Lhye;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)V`
 */

internal const val REDDIT_COMMENT_TREE_DATA_CLASS = "Lc5l0;"

internal const val REDDIT_TREE_CONTENT_FILTER_HELPER =
    "Lapp/template/extension/extension/RedditContentFilterHelper;"

internal const val REDDIT_DELETED_COMMENT_HELPER =
    "Lapp/template/extension/extension/RedditDeletedCommentHelper;"

private const val TREE_IDS_FIELD =
    "$REDDIT_COMMENT_TREE_DATA_CLASS->b:Ljava/util/List;"
private const val TREE_COMMENTS_FIELD =
    "$REDDIT_COMMENT_TREE_DATA_CLASS->c:Ljava/util/Map;"
private const val TREE_ITEMS_FIELD =
    "$REDDIT_COMMENT_TREE_DATA_CLASS->d:Ljava/util/Map;"

internal val CommentTreeDataFingerprint = Fingerprint(
    definingClass = REDDIT_COMMENT_TREE_DATA_CLASS,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        fieldAccess(opcode = Opcode.IPUT_OBJECT, smali = TREE_IDS_FIELD),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, smali = TREE_COMMENTS_FIELD),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, smali = TREE_ITEMS_FIELD),
    ),
)

/**
 * Inject the AutoMod tree filter before the TreeData fields are written.
 *
 * The fields are assigned from the constructor parameters in order (`b` from
 * p2, `c` from p3, `d` from p4).  Resolve the current source registers from
 * the field writes (other patches may have inserted instructions) and guard
 * the 4-bit `invoke-static` limit.
 */
context(patchContext: BytecodePatchContext)
internal fun injectAutoModCommentTreeFilter(logTag: String) {
    val constructor = CommentTreeDataFingerprint.method
    val listIndex = constructor.findTreeFieldWrite("b", "Ljava/util/List;", logTag)
    val commentsIndex = constructor.findTreeFieldWrite("c", "Ljava/util/Map;", logTag)
    val itemsIndex = constructor.findTreeFieldWrite("d", "Ljava/util/Map;", logTag)

    val listRegister = constructor.getTreeWriteRegister(listIndex)
    val commentsRegister = constructor.getTreeWriteRegister(commentsIndex)
    val itemsRegister = constructor.getTreeWriteRegister(itemsIndex)

    if (listIndex >= commentsIndex || commentsIndex >= itemsIndex) {
        throw PatchException("$logTag: unexpected TreeData constructor field order")
    }
    if (listRegister > 15 || commentsRegister > 15 || itemsRegister > 15) {
        throw PatchException(
            "$logTag: TreeData constructor registers v$listRegister/v$commentsRegister/" +
                "v$itemsRegister are too wide for invoke-static",
        )
    }

    constructor.addInstructions(
        listIndex,
        """
            invoke-static { v$listRegister, v$commentsRegister, v$itemsRegister }, $REDDIT_TREE_CONTENT_FILTER_HELPER->hideAutoModTreeIds(Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)Ljava/util/List;
            move-result-object v$listRegister
            invoke-static { v$commentsRegister, v$itemsRegister }, $REDDIT_TREE_CONTENT_FILTER_HELPER->hideAutoModTreeItems(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;
            move-result-object v$itemsRegister
            invoke-static { v$commentsRegister }, $REDDIT_TREE_CONTENT_FILTER_HELPER->hideAutoModTreeComments(Ljava/util/Map;)Ljava/util/Map;
            move-result-object v$commentsRegister
        """.trimIndent(),
    )

    println(
        "$logTag: hooked comments TreeData constructor " +
            "(ids=v$listRegister, comments=v$commentsRegister, items=v$itemsRegister).",
    )
}

/**
 * Inject the archive restore hook before the TreeData comments map is written.
 *
 * The map is the batch boundary: every deleted comment in the current tree
 * emission is resolved with one archive request.  The store's flow runs in the
 * application coroutine scope, so the lookup is off the Compose UI thread.
 */
context(patchContext: BytecodePatchContext)
internal fun injectCommentTreeUndelete(logTag: String) {
    val constructor = CommentTreeDataFingerprint.method
    val commentsIndex = constructor.findTreeFieldWrite("c", "Ljava/util/Map;", logTag)
    val commentsRegister = constructor.getTreeWriteRegister(commentsIndex)

    if (commentsRegister > 15) {
        throw PatchException(
            "$logTag: TreeData comments register v$commentsRegister is too wide for invoke-static",
        )
    }

    constructor.addInstructions(
        commentsIndex,
        """
            invoke-static { v$commentsRegister }, $REDDIT_DELETED_COMMENT_HELPER->undeleteTreeComments(Ljava/util/Map;)Ljava/util/Map;
            move-result-object v$commentsRegister
        """.trimIndent(),
    )

    println("$logTag: hooked comments TreeData constructor (batch archive restore).")
}

private fun Method.findTreeFieldWrite(
    fieldName: String,
    fieldType: String,
    logTag: String,
): Int {
    val instructions = implementation?.instructions?.toList()
        ?: throw PatchException("$logTag: TreeData.<init> has no implementation body")
    val index = instructions.indexOfFirst { instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IPUT_OBJECT &&
            field?.definingClass == REDDIT_COMMENT_TREE_DATA_CLASS &&
            field.name == fieldName &&
            field.type == fieldType
    }
    if (index < 0) {
        throw PatchException(
            "$logTag: TreeData->$fieldName field write not found. " +
                "Re-verify the obfuscated comment tree layout for this Reddit build.",
        )
    }
    return index
}

private fun Method.getTreeWriteRegister(index: Int): Int =
    getInstruction<TwoRegisterInstruction>(index).registerA
