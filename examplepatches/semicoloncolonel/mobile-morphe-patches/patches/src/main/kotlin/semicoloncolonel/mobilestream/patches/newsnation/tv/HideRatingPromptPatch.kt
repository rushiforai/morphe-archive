package semicoloncolonel.mobilestream.patches.newsnation.tv

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// NewsNation Android TV 4.71. The "rate this app" dialog is gated by a server
// rule, RatingDialogRules, whose `enabled` flag the app reads through
// getEnabled(). That getter now always reports false, so the dialog is never
// due. Rating from Settings still works.
//
// The phone app shares the package name and has no rating prompt. Morphe
// Manager can still select this patch for it, so it does nothing there.

internal object RatingDialogEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/haystack/android/common/model/flagmanager/RatingDialogRules;",
    name = "getEnabled",
    parameters = listOf(),
    returnType = "Z",
)

@Suppress("unused")
val hideRatingPromptPatch = bytecodePatch(
    name = "Hide rating prompt (Android TV)",
    description = "Stops the \"rate this app\" dialog in the Android TV app.",
) {
    compatibleWith(Constants.TV_COMPATIBILITY)

    execute {
        val method = RatingDialogEnabledFingerprint.methodOrNull ?: return@execute
        method.returnEarly(
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
