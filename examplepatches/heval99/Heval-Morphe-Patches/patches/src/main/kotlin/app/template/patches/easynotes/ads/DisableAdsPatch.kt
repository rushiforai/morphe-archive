package app.template.patches.easynotes.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EASYNOTES

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes the 'notes_edit_banner' unit from utils/AdManager and the app-open ad " +
        "from App\$AppOpenAdManager. Both are gated on the single App.isAdFree() check, which " +
        "normally depends on a VIP subscription."
) {
    compatibleWith(COMPATIBILITY_EASYNOTES)

    execute {
        val isAdFree = AppIsAdFreeFingerprint.methodOrNull
            ?: throw PatchException("Failed to resolve App.isAdFree()Z (anchor string \"adshow_switch\")")

        isAdFree.returnEarly(true)
    }
}
