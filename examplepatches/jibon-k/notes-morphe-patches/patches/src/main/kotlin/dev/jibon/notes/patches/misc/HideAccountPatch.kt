package dev.jibon.notes.patches.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES

private object IsSupportedAccountFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/support/senl/nt/base/common/util/DeviceUtils;",
    name = "isSupportedAccount",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val hideAccountPatch = bytecodePatch(
    name = "Hide Samsung account features",
    description = "Hides Samsung Cloud sync, sign-in prompts, sharing, Galaxy AI and note locking. " +
        "They need a Samsung-signed app; this matters mostly on Samsung phones, where the account exists.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)

    execute {
        IsSupportedAccountFingerprint.method.returnEarly(false)
    }
}
