package semicoloncolonel.mobilestream.patches.whitehouse.misc

import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// White House 47.7.8 — Skip launch video.
//
// The app is React Native, and its screens are Hermes bytecode (version 96)
// in assets/index.android.bundle. At launch, RootLayout reads "hasSeenIntro"
// from storage, and an unnamed callback then sets the intro state to
// (value !== "true"), hides the splash screen, and starts OneSignal. While
// that state is true, IntroVideo plays the intro clip over the app.
//
// That callback is the only unnamed function that both hides the splash
// screen and starts OneSignal. Its comparison, "StrictNeq r1, r3, r1", is
// replaced with "LoadConstFalse r1" twice (the same four bytes), so the intro
// state is always false. The splash screen and OneSignal steps are unchanged.
// ─────────────────────────────────────────────────────────────────────────────

private const val STRICT_NEQ = 17
private const val LOAD_CONST_FALSE = 121

@Suppress("unused")
val skipLaunchVideoPatch = rawResourcePatch(
    name = "Skip launch video",
    description = "Skips the intro clip that plays when the app opens.",
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.replaceInstructions(
            name = "",
            using = listOf("hideAsync", "initializeOneSignal"),
            forVersion = 96,
            find = byteArrayOf(STRICT_NEQ.toByte(), 1, 3, 1),
            replace = byteArrayOf(LOAD_CONST_FALSE.toByte(), 1, LOAD_CONST_FALSE.toByte(), 1),
        )
        file.writeBytes(bundle.toByteArray())
    }
}
