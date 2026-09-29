/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.xodo.pro

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat
import hoodles.morphe.patches.xodo.shared.signature.disableSignatureCheckPatch

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.XODO)

    dependsOn(disableSignatureCheckPatch)

    execute {
        IsProFingerprint.method.returnEarly(true)
    }
}