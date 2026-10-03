package app.morphe.patches.iscreen.content

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.iscreen.shared.Constants.COMPATIBILITY_ISCREEN
import app.morphe.util.returnEarly

@Suppress("unused")
val tvodContentPatch = bytecodePatch(
    name = "Free TVOD content",
    description = "Spoofs TVOD content to be free",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ISCREEN)

    execute {
        GetTvodFingerprint.matchAll().forEach {
            it.method.returnEarly(false)
        }
    }
}