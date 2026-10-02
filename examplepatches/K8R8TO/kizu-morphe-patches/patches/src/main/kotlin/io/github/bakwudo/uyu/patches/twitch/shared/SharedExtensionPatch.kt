package io.github.bakwudo.uyu.patches.twitch.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

internal const val EXTENSION_PACKAGE = "Lapp/morphe/extension"

internal val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/twitch.mpe")

    execute {
        TwitchApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, Lapp/morphe/extension/Utils;->setContext(Landroid/content/Context;)V",
        )
    }
}
