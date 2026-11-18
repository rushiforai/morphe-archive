package io.github.kirby1997.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// The "Gold Home Likes You" free-reveal teaser — the modal that occasionally pops up
// showing 4 people who liked you and asks you to pick one. Selecting a face fires
// LaunchLikesYouGoldUpsellDeeplinkImpl, which routes to the Gold paywall; with our
// paywall-suppression patches active, that launch is torn down mid-flight and the
// selection continuation crashes the app.
//
// Fix it upstream of the crash: force the gate that decides whether to show the sheet
// to false, so the teaser never appears, nothing is selected, and the paywall launch
// is never reached. Cleaner and crash-free vs. dismissing the sheet's onCreateView.
//
// ShouldShowGoldLikesYouBottomSheetImpl is obfuscated to
// Lcom/tinder/likesyoumodal/usecase/b; and its invoke is the suspend fun
// `a(ContinuationImpl)Ljava/lang/Object;`, returning a boxed Boolean. Return
// Boolean.FALSE at offset 0 (coroutine completes synchronously = crash-safe).
object ShouldShowGoldLikesYouBottomSheetFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
    definingClass = "Lcom/tinder/likesyoumodal/usecase/b;",
    name = "a",
)

@Suppress("unused")
val disableLikesYouGoldUpsellPatch = bytecodePatch(
    name = "Disable Likes You Gold upsell modal",
    description = "Stops the \"pick one of the people who liked you\" Gold Home teaser from appearing, which also removes the crash that happened when selecting a face launched the Gold paywall.",
) {
    compatibleWith(Constants.TINDER)

    execute {
        ShouldShowGoldLikesYouBottomSheetFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """,
        )
    }
}
