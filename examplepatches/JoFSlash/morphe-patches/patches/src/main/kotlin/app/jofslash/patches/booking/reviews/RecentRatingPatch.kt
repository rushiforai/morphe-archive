package app.jofslash.patches.booking.reviews

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.callAfter
import app.jofslash.patches.booking.shared.methodOf
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/booking/RecentRating;"
private const val REVIEWS_ACTIVITY =
    "Lcom/booking/ugc/presentation/reviews/activity/marken/PropertyReviewsActivity;"
private const val REACTOR = "Lcom/booking/ugc/presentation/reviews/activity/marken/reactors/ReviewsReactor"

// The property page's overview: name and score, then the address, badges and external reviews,
// in one column.
private const val PROPERTY_OVERVIEW = "Lcom/booking/propertycomponents/title/compose/PropertyOverviewKt;"

// The reviews screen got the server's sort and filter options (the sort's filter id and its options).
internal object FiltersMetadataLoadedConstructorFingerprint : Fingerprint(
    definingClass = "$REACTOR\$FiltersMetadataLoaded;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Lcom/booking/ugc/review/model/ReviewsFilterMetadata;"),
)

// The user picked a sort or filter option: filter id, option ids.
internal object ApplyFilterOptionsConstructorFingerprint : Fingerprint(
    definingClass = "$REACTOR\$ApplyFilterOptions;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;"),
)

@Suppress("unused")
val recentRatingPatch = bytecodePatch(
    name = "Recent rating",
    description = "Shows the average score of a hotel's reviews from the last 6 months under its " +
            "name on the property page and on the reviews screen, so a hotel whose recent guests " +
            "score it lower than its overall score stands out. Booking.com sends no recent score, " +
            "so the patch loads the newest 50 reviews once per hotel through the app. It needs at " +
            "least 10 recent reviews.",
    default = true
) {
    category("Search")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")

    execute {
        // The reviews screen, for its banner.
        val constructor = ReviewsActivityConstructorFingerprint.method
        val instructions = constructor.implementation!!.instructions.toList()
        val superCall = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_DIRECT &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.name == "<init>" && it.definingClass != REVIEWS_ACTIVITY
                    }
        }
        if (superCall < 0) throw PatchException("Couldn't find the reviews activity's superclass constructor call")
        constructor.addInstruction(
            superCall + 1,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onReviewsActivity(Landroid/app/Activity;)V"
        )

        // The reviews the screen shows, its sort options and the sort the user picks.
        ReviewsLoadedConstructorFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onReviewsLoaded(Ljava/util/List;)V"
        )
        FiltersMetadataLoadedConstructorFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onFiltersMetadata(Ljava/lang/Object;)V"
        )
        ApplyFilterOptionsConstructorFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->onApplyFilterOptions(Ljava/lang/String;Ljava/util/List;)V"
        )

        // The line under the address on the property page: Address(address, modifier, composer, changed).
        val hooked = methodOf(PROPERTY_OVERVIEW, "PropertyOverviewContent").callAfter(
            PROPERTY_OVERVIEW,
            "Address",
            3,
            "$EXTENSION_CLASS->onPropertyOverview(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"
        )
        if (hooked != 1) throw PatchException("Expected one Address call in PropertyOverviewContent, found $hooked")
    }
}
