package app.morphe.patches.iscreentv.content

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.iscreentv.shared.Constants.COMPATIBILITY_ISCREENTV
import app.morphe.util.returnEarly

@Suppress("unused")
val tvodContentPatch = bytecodePatch(
    name = "Free TVOD content",
    description = "Spoofs TVOD content to be free",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ISCREENTV)

    execute {
        GetTvodFingerprint.matchAll().forEach {
            it.method.returnEarly(false)
        }
    }
}