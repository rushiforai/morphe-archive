/*
 * Copyright 2026 De-Vanced
 * Copyright 2026 Hushfacebook contributors
 * [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
 *
 * Return-refresh hook adapted from Hushfacebook (GPL-3.0).
 * [https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/patches/src/main/kotlin/app/morphe/patches/facebook/feed/refresh/BlockReturnRefreshPatch.kt](https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/patches/src/main/kotlin/app/morphe/patches/facebook/feed/refresh/BlockReturnRefreshPatch.kt)
 */

package app.morphe.patches.facebook.feed.refresh

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.getFreeRegisterProvider

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val RETURN_REFRESH =
    "Lapp/morphe/extension/facebook/feed/ReturnRefresh;"
private const val SKIP = "$RETURN_REFRESH->shouldSkip()Z"

@Suppress("unused")
val blockReturnRefreshPatch = bytecodePatch(
    name = "Disable auto refresh",
    description = "Keeps the current feed position when you return to Facebook within ten minutes.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        if (packageMetadata.versionName != FacebookTargets.V580) {
            return@execute
        }

        val callback = ReturnRefreshCallbackFingerprint.method
        callback.skipBriefReturnRefresh()
        println(
            "[DisableAutoRefresh] callback=${callback.definingClass}->${callback.name}",
        )
    }
}

private fun MutableMethod.skipBriefReturnRefresh() {
    val register = getFreeRegisterProvider(0, 1)
        .getFreeRegister4Bit()
    addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $SKIP
            move-result v$register
            if-eqz v$register, :keep
            return-void
        """.trimIndent(),
        ExternalLabel("keep", getInstruction(0)),
    )
}
