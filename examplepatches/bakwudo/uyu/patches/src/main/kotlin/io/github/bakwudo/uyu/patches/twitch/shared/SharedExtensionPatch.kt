package io.github.bakwudo.uyu.patches.twitch.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

/** Class descriptor prefix of the extension code (see extensions/twitch). */
internal const val EXTENSION_PACKAGE = "Lio/github/bakwudo/uyu/extension"

internal const val EXTENSION_UTILS_CLASS = "$EXTENSION_PACKAGE/Utils;"

/**
 * Merges the extension code into the app and gives it the application context.
 * Every patch that calls extension code depends on this patch.
 */
internal val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/twitch.mpe")

    execute {
        // onCreate uses many registers, so p0 may not fit a 4-bit register.
        TwitchApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_UTILS_CLASS->setContext(Landroid/content/Context;)V",
        )
    }
}
