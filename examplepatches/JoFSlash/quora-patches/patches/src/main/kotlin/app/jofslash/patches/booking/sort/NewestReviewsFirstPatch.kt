package app.jofslash.patches.booking.sort

import app.jofslash.patches.booking.reviews.ApplyFilterOptionsConstructorFingerprint
import app.jofslash.patches.booking.reviews.FiltersMetadataLoadedConstructorFingerprint
import app.jofslash.patches.booking.reviews.ReviewsActivityConstructorFingerprint
import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/booking/NewestReviews;"
private const val REVIEWS_ACTIVITY =
    "Lcom/booking/ugc/presentation/reviews/activity/marken/PropertyReviewsActivity;"

// The reviews screen (re)loads its list with these filters: filter id -> option ids, the sort
// ("user_sort") among them. LoadFilters(isChain, isBookingHomeProperty, defaultFilters).
internal object LoadFiltersConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/booking/ugc/presentation/reviews/activity/marken/reactors/ReviewsReactor\$LoadFilters;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Z", "Z", "Ljava/util/Map;"),
)

@Suppress("unused")
val newestReviewsFirstPatch = bytecodePatch(
    name = "Newest reviews first",
    description = "Opens a hotel's reviews sorted newest first instead of \"Most relevant\". You can " +
            "still pick another sort on the reviews screen.",
    default = true
) {
    category("Search")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")

    execute {
        // A new reviews screen: the user hasn't picked a sort on it yet.
        val constructor = ReviewsActivityConstructorFingerprint.method
        val instructions = constructor.implementation!!.instructions.toList()
        val superCall = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_DIRECT &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.name == "<init>" && it.definingClass != REVIEWS_ACTIVITY
                    }
        }
        if (superCall < 0) throw PatchException("Couldn't find the reviews activity's superclass constructor call")
        constructor.addInstruction(superCall + 1, "invoke-static {}, $EXTENSION_CLASS->onReviewsActivity()V")

        // Add the newest-first sort to the filters the screen loads with.
        LoadFiltersConstructorFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p3 .. p3 }, $EXTENSION_CLASS->onLoadFilters(Ljava/util/Map;)Ljava/util/Map;
                move-result-object p3
            """
        )

        // The sort's filter id, and whether the user picked a sort.
        FiltersMetadataLoadedConstructorFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onFiltersMetadata(Ljava/lang/Object;)V"
        )
        ApplyFilterOptionsConstructorFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->onApplyFilterOptions(Ljava/lang/String;Ljava/util/List;)V"
        )
    }
}
