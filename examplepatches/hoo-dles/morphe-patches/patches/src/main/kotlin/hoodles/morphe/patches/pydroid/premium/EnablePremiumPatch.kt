/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.pydroid.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import hoodles.morphe.compatibility.Compat
import hoodles.morphe.patches.pydroid.misc.meta.includeOriginalMetadataPatch

val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.PYDROID)

    dependsOn(includeOriginalMetadataPatch)

    execute {
        SetIsPremiumFingerprint.method.addInstructions(0, """
            const/4 p1, 0x1
        """.trimIndent())
    }
}