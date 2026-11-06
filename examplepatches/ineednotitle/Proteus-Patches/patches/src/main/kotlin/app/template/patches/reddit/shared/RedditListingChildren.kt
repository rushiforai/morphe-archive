package app.template.patches.reddit.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Shared Reddit listing choke points for the "Block AutoMod comments" and
 * "Content filters" patches.
 *
 * `com.reddit.domain.model.listing.Listing` is the deserialization container for
 * home/popular/subreddit/search feeds AND for comment threads.  Its `children`
 * field is written once in the primary constructor and exposed through
 * `getChildren()`.  Hooking both sites means the helpers see every row even if
 * a newer build starts mapping feed sections before a Listing is constructed.
 *
 * Verified on Reddit 2026.42.0 (the existing "Remove ads" patch uses the same
 * constructor field write) and 2026.37.0 (SantoDan's content-filter patch hooks
 * the same `getChildren()` getter).  Register discipline: `iput-object` uses a
 * 4-bit register pair, so the children register is always v0-v15 and a plain
 * `invoke-static { vN }` is valid.
 */
internal const val REDDIT_LISTING_CLASS = "Lcom/reddit/domain/model/listing/Listing;"

internal const val REDDIT_CONTENT_FILTER_HELPER =
    "Lapp/template/extension/extension/RedditContentFilterHelper;"

private const val CHILDREN_FIELD = "$REDDIT_LISTING_CLASS->children:Ljava/util/List;"

/** Constructor that assigns `children` (no name/returnType, matching the proven style). */
internal val ListingChildrenFingerprint = Fingerprint(
    definingClass = REDDIT_LISTING_CLASS,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    // Same three field writes as the proven "Remove ads" ListingFingerprint, so
    // the match stays unique if Reddit adds another constructor that writes a
    // children field.
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            smali = CHILDREN_FIELD,
        ),
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            smali = "$REDDIT_LISTING_CLASS->after:Ljava/lang/String;",
        ),
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            smali = "$REDDIT_LISTING_CLASS->before:Ljava/lang/String;",
        ),
    ),
)

/** Optional second layer: filter the list as it is read, not only as it is built. */
internal val ListingGetChildrenFingerprint = Fingerprint(
    definingClass = REDDIT_LISTING_CLASS,
    name = "getChildren",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

/**
 * Inject [helperMethod] before the `children` field write in `Listing.<init>`
 * and (when present) before every `return-object` in `getChildren()`.
 *
 * The helper signature must be `(Ljava/util/List;)Ljava/util/List;` so the same
 * register can carry the filtered list — no scratch registers, no `.locals`
 * changes, and no conflict with "Remove ads" (which injects at the same field
 * write; both patches wrap the list in sequence).
 */
context(patchContext: BytecodePatchContext)
internal fun injectListingChildrenFilter(helperMethod: String, logTag: String) {
    val constructor = ListingChildrenFingerprint.method
    val instructions = constructor.implementation?.instructions?.toList()
        ?: throw PatchException("$logTag: Listing.<init> has no implementation body")

    // Resolve the index from the CURRENT instruction list.  Other Reddit patches
    // may already have injected before this write, so a cached fingerprint
    // match index could be stale.
    val childrenIndex = instructions.indexOfFirst { instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IPUT_OBJECT &&
            field?.definingClass == REDDIT_LISTING_CLASS &&
            field.name == "children" &&
            field.type == "Ljava/util/List;"
    }
    if (childrenIndex < 0) {
        throw PatchException(
            "$logTag: Listing->children field write not found. " +
                "Re-verify with a fresh apktool dump of com.reddit.frontpage.",
        )
    }

    val childrenRegister = constructor.getInstruction<TwoRegisterInstruction>(childrenIndex).registerA
    // iput-object encodes both registers in 4 bits; guard anyway in case dexlib2
    // ever presents a wider form.
    if (childrenRegister > 15) {
        throw PatchException("$logTag: children register v$childrenRegister is too wide for invoke-static")
    }

    constructor.addInstructions(
        childrenIndex,
        """
            invoke-static { v$childrenRegister }, $REDDIT_CONTENT_FILTER_HELPER->$helperMethod(Ljava/util/List;)Ljava/util/List;
            move-result-object v$childrenRegister
        """.trimIndent(),
    )

    val getChildren = ListingGetChildrenFingerprint.methodOrNull
    if (getChildren == null) {
        println("$logTag: Listing.getChildren() not found; constructor hook only.")
        return
    }

    val returnIndices = getChildren.implementation?.instructions?.toList()
        ?.mapIndexedNotNull { index, instruction ->
            index.takeIf { instruction.opcode == Opcode.RETURN_OBJECT }
        }
        ?.reversed()
        .orEmpty()

    if (returnIndices.isEmpty()) {
        println("$logTag: Listing.getChildren() has no return-object; constructor hook only.")
        return
    }

    for (index in returnIndices) {
        val register = getChildren.getInstruction<OneRegisterInstruction>(index).registerA
        if (register > 15) {
            println("$logTag: skipping getChildren() return v$register (register too wide).")
            continue
        }
        getChildren.addInstructions(
            index,
            """
                invoke-static { v$register }, $REDDIT_CONTENT_FILTER_HELPER->$helperMethod(Ljava/util/List;)Ljava/util/List;
                move-result-object v$register
            """.trimIndent(),
        )
    }
    println("$logTag: hooked Listing.<init> and ${returnIndices.size} getChildren() return(s).")
}
