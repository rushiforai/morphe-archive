package app.noam.patches.chesscom.shared

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.BytecodePatchContext

/** Makes the extension's `Features.<marker>()` return true, so Noam's Patches lists the feature. */
context(context: BytecodePatchContext)
internal fun markFeaturePatched(marker: String) {
    context.mutableClassDefBy(Constants.FEATURES).methods.first { it.name == marker }
        .replaceInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
}

/** "Lcom/example/Foo;" -> "com.example.Foo" */
internal fun String.toBinaryName() = substring(1, length - 1).replace('/', '.')
