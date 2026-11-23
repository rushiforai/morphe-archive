package patapon888.morphe.patches.fruitninja.rating

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.fruitninja.FRUIT_NINJA_CLASSIC
import patapon888.morphe.patches.fruitninja.native.LibraryEdit
import patapon888.morphe.patches.fruitninja.native.RET
import patapon888.morphe.patches.fruitninja.native.arm64OnlyPatch
import patapon888.morphe.patches.fruitninja.native.patchGameLibrary

@Suppress("unused")
val removeRatingPromptsPatch = resourcePatch(
    name = "Remove rating prompts",
    description = "Removes the \"rate this app\" and review pop-ups. Only the arm64-v8a library is kept."
) {
    compatibleWith(FRUIT_NINJA_CLASSIC)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                LibraryEdit(0x1CE9804, "ffc301d1", RET), // RateAppManager.ShowRateAppPopup
                LibraryEdit(0x1CE9E40, "fe0f1ef8", RET), // RateAppManager.ShowReviewPopup
                LibraryEdit(0x1CEA554, "ff4301d1", RET), // RatingManager.ShowRatingPromptIfNeeded
                LibraryEdit(0x1CEA8D4, "ffc300d1", RET), // RatingManager.ShowRatingPromptOnLevelUp
            )
        )
    }
}
