package app.southstar21.patches.instagram.misc.extension

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.shared.MainActivityWindowFocusFingerprint

internal const val INSTAGRAM_HOOKS_CLASS = "Lapp/southstar21/extension/instagram/InstagramHooks;"

/**
 * Bundles the Instagram extension (extensions/instagram) into the app and calls its shared
 * hook, which sets up settings, adds the southstar21 Patches button to the profile page and
 * starts every included patch. Every Instagram patch depends on this.
 */
val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/instagram.mpe")

    execute {
        MainActivityWindowFocusFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $INSTAGRAM_HOOKS_CLASS->onMainActivityWindowFocusChanged(Landroid/app/Activity;)V"
        )
    }
}
