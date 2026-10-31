package dev.jibon.notes.patches.pen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

private object IsSpenModelFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/support/senl/nt/base/common/util/DeviceUtils;",
    name = "isSpenModel",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val penDevicePatch = bytecodePatch(
    name = "Treat as pen device",
    description = "Turns on the app's pen features (pen toolbar, hover) on a device with an active pen " +
        "that isn't a Samsung S Pen. Leave it off on devices without an active pen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)

    execute {
        IsSpenModelFingerprint.method.returnEarly(true)
    }
}
