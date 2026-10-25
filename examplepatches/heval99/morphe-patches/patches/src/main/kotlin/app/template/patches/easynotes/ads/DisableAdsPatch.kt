package app.template.patches.easynotes.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EASYNOTES

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_EASYNOTES)

    execute {
        val isAdFree = AppIsAdFreeFingerprint.methodOrNull
            ?: throw PatchException("Failed to resolve App.isAdFree()Z (anchor string \"adshow_switch\")")

        isAdFree.returnEarly(true)
    }
}
