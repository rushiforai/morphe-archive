package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV

private const val SEARCH_YOU_MAY_LIKE_EXPERIMENT = "Lcom/ss/android/ugc/aweme/tv/search/v2/h;"

/** Enables the "You may like" panel on the search landing screen. */
@Suppress("unused")
val enableSearchLandingRecommendationsPatch = bytecodePatch(
    name = "Enable search landing recommendations",
    description = "Turns on the \"You may like\" trending panel on the search landing screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)

    execute {
        val flag = mutableClassDefBy(SEARCH_YOU_MAY_LIKE_EXPERIMENT).methods.first {
            it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }

        flag.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
