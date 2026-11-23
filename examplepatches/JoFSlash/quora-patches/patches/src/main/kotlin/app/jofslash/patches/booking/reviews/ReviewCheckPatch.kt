package app.jofslash.patches.booking.reviews

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/booking/ReviewCheck;"

private const val REVIEWS_ACTIVITY =
    "Lcom/booking/ugc/presentation/reviews/activity/marken/PropertyReviewsActivity;"

// The action the reviews reactor builds with the list of reviews the screen displays, every time
// the list changes (first load, pagination, filters). Its first argument is the List<HotelReview>.
private const val REVIEWS_LOADED =
    "Lcom/booking/ugc/presentation/reviews/activity/marken/reactors/ReviewsReactor\$ReviewsLoaded;"

// The reviews screen. Its constructor runs before onCreate and is a safe place to hook the
// activity's lifecycle and add the banner.
internal object ReviewsActivityConstructorFingerprint : Fingerprint(
    definingClass = REVIEWS_ACTIVITY,
    name = "<init>",
    returnType = "V",
)

internal object ReviewsLoadedConstructorFingerprint : Fingerprint(
    definingClass = REVIEWS_LOADED,
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

@Suppress("unused")
val reviewCheckPatch = bytecodePatch(
    name = "Review check",
    description = "Scans the reviews already shown on a hotel's reviews screen for scam, money and " +
            "booking red flags (extra charges, pay-outside-platform, not as described, bookings " +
            "not honoured, fraud) and shows a small banner above the booking button. Tap it to read the flagged " +
            "reviews. It's keyword matching on your phone, a heads-up and not a verdict — not AI, " +
            "not fake-review detection. Keywords cover English, Slovak, Czech, German, Polish, " +
            "Hungarian, Italian, French and Spanish.",
    default = true
) {
    category("Search")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")

    execute {
        // Add the banner to the reviews screen, right after its superclass constructor runs.
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

        // Capture the list of reviews the screen shows, as the reactor builds the ReviewsLoaded action.
        ReviewsLoadedConstructorFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onReviewsLoaded(Ljava/util/List;)V"
        )
    }
}
