package app.morphe.patches.shadhin.content

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shadhin.shared.Constants.COMPATIBILITY_SHADHIN
import app.morphe.patches.shadhin.shared.morphe.com.gm.shadhin.MainContentModel
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

@Suppress("unused")
val freeContentPatch =
    bytecodePatch(
        name = "Free content",
        description = "Marks content as free.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_SHADHIN)

        execute {
            MainContentModel.IsPaidFingerprint
                .matchSingle()
                .method
                .returnEarly(false)
        }
    }
