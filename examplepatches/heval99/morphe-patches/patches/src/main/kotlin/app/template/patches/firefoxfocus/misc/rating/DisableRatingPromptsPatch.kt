package app.template.patches.firefoxfocus.misc.rating

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX_FOCUS
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// AppReviewStep names, stored as strings in the in-app review step preference.
internal const val STEP_PENDING = "Pending"

// AppReviewUtils.showAppReview(Activity), inlined into MainActivity.onCreate in 158.0. It asks
// Google Play for a review when the stored step is "ReviewNeeded" (set after the third app opening)
// or "Reviewed" more than 90 days ago, and opens the Play Store when the review flow fails. The
// step is read with getString(key, "Pending"). Only this check holds both other step names.
internal object ShowAppReviewFingerprint : Fingerprint(
    strings = listOf(
        string("ReviewNeeded", StringComparisonType.CONTAINS),
        string("Reviewed", StringComparisonType.CONTAINS),
    ),
    filters = listOf(
        string(STEP_PENDING),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getString",
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
    ),
)

@Suppress("unused")
val disableRatingPromptsPatch = bytecodePatch(
    name = "Disable rating prompts",
    description = "Disables the rating prompt.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX_FOCUS)

    execute {
        // The review check reads the stored step as "Pending", so it matches neither "ReviewNeeded"
        // nor "Reviewed" and never asks. The opening counter still runs; nothing else reads it.
        val method = ShowAppReviewFingerprint.method
        val moveResult = ShowAppReviewFingerprint.instructionMatches[2].index
        if (method.instructions.getOrNull(moveResult + 1)?.location?.labels?.isNotEmpty() != false) {
            throw PatchException("${method.definingClass}->${method.name}: the review step read is followed by a branch target")
        }
        val register = method.instructions[moveResult].let { (it as OneRegisterInstruction).registerA }
        method.addInstructionsChecked(moveResult + 1, "const-string v$register, \"$STEP_PENDING\"")
    }
}
