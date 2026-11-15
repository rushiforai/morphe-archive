package app.template.patches.reddit.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Comment-thread hooks for the Reddit "Block AutoMod comments" and "Show
 * deleted posts and comments" patches.
 *
 * Reddit's comment thread renderer does NOT flow through
 * `com.reddit.domain.model.listing.Listing`.  The comment tree store
 * (`com.reddit.comments.tree.c`, obfuscated per build) emits a TreeData object
 * whose constructor receives:
 *
 *   a = changes (some build-specific type)
 *   b = ordered tree item ids (`List`)
 *   c = id → comment (`Map`)
 *   d = id → tree item wrapper (`Map`)
 *
 * The class and field names are R8 output and change between Reddit builds
 * (for example `Lc5l0;` on one 2026.42.0 build and `Lm5l0;` on another), so the
 * anchor is the constructor SHAPE, not a hard-coded class name:
 *
 *   <init>(L…;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)V
 *
 * and the ordered `IPUT_OBJECT` writes of those three parameter types.  This is
 * the comment equivalent of the `Listing.children` anchor.
 *
 * Deleted comments are filtered on the same TreeData constructor: the comment
 * map is one batch, so one archive request covers every deleted row in the
 * thread instead of one request per `Comment` object.  The store's flow runs
 * in the application coroutine scope, so this is off the Compose UI thread.
 *
 * Verified against the public Reddit 2026.42.0 APKM (versionCode 2642001):
 * `classes8.dex` TreeData is `Lm5l0;` with
 * `<init>(Lhye;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)V`.
 */

internal const val REDDIT_TREE_CONTENT_FILTER_HELPER =
    "Lapp/template/extension/extension/RedditContentFilterHelper;"

internal const val REDDIT_DELETED_COMMENT_HELPER =
    "Lapp/template/extension/extension/RedditDeletedCommentHelper;"

private const val TREE_LIST_TYPE = "Ljava/util/List;"
private const val TREE_MAP_TYPE = "Ljava/util/Map;"

internal data class TreeFieldWrite(
    val reference: FieldReference,
    val index: Int,
    val register: Int,
) {
    val type: String get() = reference.type.toString()
}

private data class CommentTreeLayout(
    val constructor: MutableMethod,
    val classType: String,
    val list: TreeFieldWrite,
    val comments: TreeFieldWrite,
    val items: TreeFieldWrite,
)

/**
 * A TreeData class is a concrete class whose 4-argument constructor takes a
 * build-specific value followed by `List`, `Map`, `Map`, and writes those three
 * values to fields of the same types in that order.
 */
internal fun ClassDef.matchesCommentTreeData(): Boolean {
    if (AccessFlags.INTERFACE.isSet(accessFlags) || AccessFlags.ABSTRACT.isSet(accessFlags)) {
        return false
    }

    val constructor = methods.firstOrNull { method ->
        method.name == "<init>" && method.parameterTypes.size == 4
    } ?: return false

    val parameters = constructor.parameterTypes.map { it.toString() }
    if (parameters[1] != TREE_LIST_TYPE ||
        parameters[2] != TREE_MAP_TYPE ||
        parameters[3] != TREE_MAP_TYPE
    ) {
        return false
    }

    val writes = constructor.fieldWrites()
    val list = writes.firstOrNull { it.type == TREE_LIST_TYPE } ?: return false
    val comments = writes.firstOrNull { it.type == TREE_MAP_TYPE && it.index > list.index }
        ?: return false
    val items = writes.firstOrNull { it.type == TREE_MAP_TYPE && it.index > comments.index }
        ?: return false

    val fieldTypes = fields.map { it.type.toString() }
    return fieldTypes.count { it == TREE_LIST_TYPE } >= 1 &&
        fieldTypes.count { it == TREE_MAP_TYPE } >= 2 &&
        list.index < comments.index &&
        comments.index < items.index
}

/**
 * Every instance-field write in the constructor, in instruction order.  The
 * field write order is stable across builds even when the class and field
 * names are re-obfuscated.
 */
internal fun Method.fieldWrites(): List<TreeFieldWrite> {
    val body = implementation ?: return emptyList()
    val writes = mutableListOf<TreeFieldWrite>()
    body.instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.IPUT_OBJECT) return@forEachIndexed
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            ?: return@forEachIndexed
        if (reference.definingClass != definingClass) return@forEachIndexed
        writes += TreeFieldWrite(
            reference = reference,
            index = index,
            register = (instruction as TwoRegisterInstruction).registerA,
        )
    }
    return writes
}

/**
 * Resolve the current TreeData class and constructor from the APK being
 * patched.  The lookup is repeated for every hook so that a hook installed by
 * an earlier patch is visible in the instruction indexes.
 */
context(patchContext: BytecodePatchContext)
private fun resolveCommentTreeData(): CommentTreeLayout {
    val classDef = patchContext.classDefByOrNull { it.matchesCommentTreeData() }
        ?: throw PatchException(
            "Comment tree: could not find the TreeData class. Expected a 4-argument " +
                "constructor with List/Map/Map writes; re-verify the Reddit build.",
        )

    val mutableClass = patchContext.mutableClassDefBy(classDef)
    val constructor = mutableClass.methods.firstOrNull { method ->
        method.name == "<init>" && method.parameterTypes.size == 4
    } ?: throw PatchException(
        "Comment tree: ${mutableClass.type} has no 4-argument constructor",
    )

    val writes = constructor.fieldWrites()
    val list = writes.firstOrNull { it.type == TREE_LIST_TYPE }
        ?: throw PatchException("Comment tree: ${mutableClass.type} has no List field write")
    val comments = writes.firstOrNull { it.type == TREE_MAP_TYPE && it.index > list.index }
        ?: throw PatchException("Comment tree: ${mutableClass.type} has no comment Map field write")
    val items = writes.firstOrNull { it.type == TREE_MAP_TYPE && it.index > comments.index }
        ?: throw PatchException("Comment tree: ${mutableClass.type} has no item Map field write")

    if (list.index >= comments.index || comments.index >= items.index) {
        throw PatchException(
            "Comment tree: unexpected ${mutableClass.type} constructor field order " +
                "(list=${list.index}, comments=${comments.index}, items=${items.index})",
        )
    }

    return CommentTreeLayout(
        constructor = constructor,
        classType = mutableClass.type,
        list = list,
        comments = comments,
        items = items,
    )
}

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
    val layout = resolveCommentTreeData()
    val constructor = layout.constructor

    val listRegister = layout.list.register
    val commentsRegister = layout.comments.register
    val itemsRegister = layout.items.register

    if (listRegister > 15 || commentsRegister > 15 || itemsRegister > 15) {
        throw PatchException(
            "$logTag: TreeData constructor registers v$listRegister/v$commentsRegister/" +
                "v$itemsRegister are too wide for invoke-static",
        )
    }

    constructor.addInstructions(
        layout.list.index,
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
        "$logTag: hooked ${layout.classType} TreeData constructor " +
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
    val layout = resolveCommentTreeData()
    val constructor = layout.constructor
    val commentsRegister = layout.comments.register

    if (commentsRegister > 15) {
        throw PatchException(
            "$logTag: TreeData comments register v$commentsRegister is too wide for invoke-static",
        )
    }

    constructor.addInstructions(
        layout.comments.index,
        """
            invoke-static { v$commentsRegister }, $REDDIT_DELETED_COMMENT_HELPER->undeleteTreeComments(Ljava/util/Map;)Ljava/util/Map;
            move-result-object v$commentsRegister
        """.trimIndent(),
    )

    println("$logTag: hooked ${layout.classType} TreeData constructor (batch archive restore).")
}
