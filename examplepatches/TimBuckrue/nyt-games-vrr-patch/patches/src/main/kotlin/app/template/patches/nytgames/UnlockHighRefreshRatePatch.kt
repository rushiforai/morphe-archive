package app.template.patches.nytgames

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.NYT_GAMES_COMPATIBILITY

private const val HELPER = "Lapp/template/extension/extension/RefreshRateHelper;"

@Suppress("unused")
val nytGamesHighRefreshRatePatch = bytecodePatch(
    name = "Unlock high refresh rate",
    description = "Let NYT Games render above 60 fps on 90/120 Hz and variable-refresh-rate " +
        "displays. The app never opts into high refresh, so Android's power-saving frame-rate " +
        "override pins it to 60 Hz; this makes each Activity window request the display's top " +
        "refresh rate (a seamless, adaptive-refresh-friendly hint), lifting that cap.",
    default = false,
) {
    compatibleWith(NYT_GAMES_COMPATIBILITY)

    // Merge the RefreshRateHelper extension class into the app.
    extendWith("extensions/extension.mpe")

    execute {
        // Register a process-wide refresh-rate opt-in from the Application's onCreate.
        // p0 == the Application instance; invoke-static needs no extra locals.
        applicationOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $HELPER->install(Landroid/app/Application;)V",
        )
    }
}
