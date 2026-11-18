package app.sircoderin.patches.kvaesitso

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.sircoderin.patches.shared.Constants.COMPATIBILITY_KVAESITSO

private const val EXTENSION_CLASS = "Lapp/sircoderin/extension/kvaesitso/AssistantFadeIn;"

/**
 * The search overlay pops in almost instantly (MagicOS / launcher-driven transitions override activity
 * animations). This animates the window content in from inside the app, mirroring the close animation.
 */
@Suppress("unused")
val searchFadeInPatch = patch(
    name = "Search fade-in",
    description = "Fades and gently scales the search overlay in when it opens, mirroring the close animation.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KVAESITSO)

    extendWith("extensions/extension.mpe")

    execute {
        // Index 1 = right after `invoke-super {p0}, Activity.onAttachedToWindow()`.
        SharedLauncherActivityOnAttachedToWindowFingerprint.method.addInstruction(
            1,
            "invoke-static { p0 }, $EXTENSION_CLASS->animateIn(Landroid/app/Activity;)V",
        )
        // Reopening a search window that was left with the Home gesture (no new window attach).
        // Index 2 = after `p1.getClass()` null check and `invoke-super onNewIntent`.
        SharedLauncherActivityOnNewIntentFingerprint.method.addInstruction(
            2,
            "invoke-static { p0 }, $EXTENSION_CLASS->animateIn(Landroid/app/Activity;)V",
        )
    }
}
