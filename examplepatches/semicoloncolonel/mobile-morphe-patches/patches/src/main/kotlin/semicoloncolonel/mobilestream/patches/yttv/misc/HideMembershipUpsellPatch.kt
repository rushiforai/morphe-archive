package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide the "Add to membership" home upsell shelf (OPT-IN, default OFF).
//
// The home feed is a flat list of item models rendered by one controller
// (identified at runtime: it binds each item's title through the header
// presenter, and its items flow in through a diff-update method taking
// (List, RecyclerView, BiPredicate) and an insert method taking (int, List)).
// Each shelf is split into a header item (carries the title), its card row, and
// dividers. This filters those feed lists through the extension, which drops the
// "Add to membership" header, the card row after it, and a trailing divider, so
// the whole shelf disappears with no empty space left behind. The playback and
// membership screens are untouched.
// ─────────────────────────────────────────────────────────────────────────────
private const val FILTER = "Lsemicoloncolonel/mobilestream/extension/yttv/MembershipUpsellFilter;"

// The feed controller's diff-update method: update(List, RecyclerView, BiPredicate).
internal object FeedDiffUpdateFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        method.implementation != null &&
            method.parameterTypes.map { it.toString() } == listOf(
                "Ljava/util/List;",
                "Landroid/support/v7/widget/RecyclerView;",
                "Ljava/util/function/BiPredicate;",
            ) &&
            // Same controller also exposes the (int, List) feed-insert method.
            classDef.methods.any { other ->
                other.returnType == "V" &&
                    other.parameterTypes.map { it.toString() } == listOf("I", "Ljava/util/List;")
            }
    },
)

private fun filterCall(register: String) =
    "invoke-static { $register }, $FILTER->filter(Ljava/util/List;)Ljava/util/List;\n" +
        "move-result-object $register"

@Suppress("unused")
val hideMembershipUpsellPatch = bytecodePatch(
    name = "Hide membership upsell",
    description = "Hides the \"Add to membership\" shelf on the home screen.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // Filter the diff-update list (first parameter).
        val controllerType = FeedDiffUpdateFingerprint.classDef.type
        FeedDiffUpdateFingerprint.method.addInstructions(0, filterCall("p1"))

        // Filter every (int, List) insert in the same controller (second
        // parameter). Filtering is a no-op on lists without the shelf.
        var inserts = 0
        mutableClassDefBy(controllerType).methods.forEach { method ->
            if (method.name == "<init>" || method.returnType != "V") return@forEach
            if (method.parameterTypes.map { it.toString() } != listOf("I", "Ljava/util/List;")) return@forEach
            // In a non-static (int, List) method the list is the second parameter, p2.
            method.addInstructions(0, filterCall("p2"))
            inserts++
        }
        if (inserts == 0) throw PatchException("Feed insert method (int, List) not found")
    }
}
