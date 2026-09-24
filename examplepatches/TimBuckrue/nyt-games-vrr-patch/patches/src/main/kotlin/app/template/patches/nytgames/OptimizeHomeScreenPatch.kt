package app.template.patches.nytgames

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.NYT_GAMES_COMPATIBILITY

@Suppress("unused")
val nytGamesOptimizeHomeScreenPatch = bytecodePatch(
    name = "Optimize home screen (disable animated cards)",
    description = "Forces the NYT Games home screen to use its lightweight static-icon card " +
        "layout instead of the animated Rive cards. The Rive cards are embedded in the " +
        "Compose list via AndroidView interop, whose per-item churn plus Rive TextureView " +
        "compositing is the dominant UI-thread cost while scrolling — the reason busy home " +
        "screens can't hold 120 fps. Cards stay fully functional; they just don't animate.",
    default = false,
) {
    compatibleWith(NYT_GAMES_COMPATIBILITY)

    execute {
        // Force AbraModule's ShowNewGamesHomeAnimations provider to return false.
        // v0 is a valid local in the target method; we return before any original
        // instruction runs, so clobbering it is safe.
        showHomeAnimationsFlagFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
