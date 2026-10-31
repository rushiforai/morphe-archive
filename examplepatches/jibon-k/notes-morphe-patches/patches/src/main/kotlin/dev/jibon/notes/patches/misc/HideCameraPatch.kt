package dev.jibon.notes.patches.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

private object IsSupportCameraFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/support/senl/nt/composer/main/base/presenter/menu/option/OptionMenuAddPresenter;",
    name = "isSupportCamera",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val hideCameraPatch = bytecodePatch(
    name = "Hide camera",
    description = "Removes Insert > Camera from the editor.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_NOTES)

    execute {
        IsSupportCameraFingerprint.method.returnEarly(false)
    }
}
