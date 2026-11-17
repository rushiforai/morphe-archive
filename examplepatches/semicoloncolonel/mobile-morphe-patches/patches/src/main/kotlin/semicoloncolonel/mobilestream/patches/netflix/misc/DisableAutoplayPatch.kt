package semicoloncolonel.mobilestream.patches.netflix.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method
import semicoloncolonel.mobilestream.patches.netflix.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Netflix reads two autoplay preferences from the signed-in profile and uses
// them all over the browse and player UI:
//
//   isAutoPlayEnabled()         -> auto-advance to the next episode
//   disableVideoMerchAutoPlay() -> auto-play preview trailers while browsing
//
// They are plain no-argument boolean getters. The profile model keeps its name
// (com...model.leafs.UserProfile), but there is also an obfuscated wrapper that
// reads the same flags from the GraphQL profile; both keep the method names, so
// this forces the chosen answer on every class that implements either getter,
// which is version-resilient. The abstract interface declaration has no body,
// so it is skipped. These are normally account settings behind Netflix's
// website; the patch makes them local toggles in the app instead.

private fun isGetter(name: String): (Method) -> Boolean = { method ->
    method.name == name &&
        method.returnType == "Z" &&
        method.parameterTypes.isEmpty() &&
        method.implementation != null
}

@Suppress("unused")
val disableAutoplayPatch = bytecodePatch(
    name = "Disable autoplay",
    description = "Stops Netflix from auto-playing preview trailers while you browse, and from " +
        "auto-advancing to the next episode. Each can be turned off on its own.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    val disablePreviews by booleanOption(
        key = "disablePreviews",
        default = true,
        title = "Stop preview autoplay",
        description = "Stops the preview trailers that play by themselves on the browse screen.",
        required = true,
    )
    val disableNextEpisode by booleanOption(
        key = "disableNextEpisode",
        default = true,
        title = "Stop next-episode autoplay",
        description = "Stops the next episode from starting on its own when one ends.",
        required = true,
    )

    execute {
        if (disablePreviews != true && disableNextEpisode != true) {
            throw PatchException("Enable at least one of the Disable autoplay options.")
        }

        // disableVideoMerchAutoPlay() == true means "do not auto-play previews".
        if (disablePreviews == true) {
            val count = forEachMatchingMethod(
                classFilter = { true },
                methodFilter = isGetter("disableVideoMerchAutoPlay"),
            ) { it.returnEarly("const/4 v0, 0x1\nreturn v0") }
            if (count == 0) throw PatchException("disableVideoMerchAutoPlay() not found")
        }

        // isAutoPlayEnabled() == false means "do not auto-advance episodes".
        if (disableNextEpisode == true) {
            val count = forEachMatchingMethod(
                classFilter = { true },
                methodFilter = isGetter("isAutoPlayEnabled"),
            ) { it.returnEarly("const/4 v0, 0x0\nreturn v0") }
            if (count == 0) throw PatchException("isAutoPlayEnabled() not found")
        }
    }
}
