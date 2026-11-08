package semicoloncolonel.mobilestream.patches.appletv.tv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants

// Apple TV Android TV 17.0.2. The app's engine asks Java to show Google Play's
// review sheet through AndroidControlMessage.showInAppReviewRatingPrompt(int),
// and waits for an answer under that request id. The method now answers at
// once that the review flow did not launch, so no sheet is shown and the app
// carries on as it does when Play cannot show one.
//
// The phone app shares the package name but not this code. Morphe Manager can
// still select this patch for it, so it does nothing there.

private const val CONTROL = "Lcom/apple/atve/androidtv/appletv/AndroidControlMessage;"

@Suppress("unused")
val hideRatingPromptPatch = bytecodePatch(
    name = "Hide rating prompt (Android TV)",
    description = "Stops the review prompt from Google Play in the Android TV app.",
) {
    compatibleWith(Constants.TV_COMPATIBILITY)

    execute {
        if (classDefByOrNull(CONTROL) == null) return@execute
        val method = mutableClassDefBy(CONTROL).methods.firstOrNull {
            it.name == "showInAppReviewRatingPrompt" && it.parameterTypes.map { p -> p.toString() } == listOf("I")
        } ?: return@execute
        // (this, int): the int is the last register. Two scratch registers
        // are needed before it.
        val idRegister = method.implementation!!.registerCount - 1
        check(idRegister >= 3 && idRegister <= 15) { "Apple TV review prompt: unexpected registers" }
        method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                const-string v1, "Review prompt disabled"
                invoke-static { v$idRegister, v0, v1 }, Lcom/apple/atve/luna/Native;->sendControlMessageResponse(IZLjava/lang/String;)V
                return-void
            """,
        )
    }
}
