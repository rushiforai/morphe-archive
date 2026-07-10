package app.utsavrajput.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.utsavrajput.patches.shared.Constants.COMPATIBILITY_MX_PLAYER

// extendWith(...) is required here — just declaring `extension { name = ... }`
// in extensions/core/build.gradle.kts does NOT make Morphe merge the .mpe
// into the output APK. Without this, ExtensionHooks stays out of the final
// APK and any call to it throws NoClassDefFoundError at runtime (this was
// bug 2 from crash_log.txt).

/**
 * Repurposes two existing bottom-nav tabs to open the custom Modx
 * extension screens instead of their original destinations:
 *
 *   Search tab  -> ExtensionHooks.launchTools(context)
 *   Games tab   -> ExtensionHooks.launchAbout(context)
 *
 * Both tabs remain visually present and tappable — only the destination
 * changes. No new views, no layout edits, no new fields.
 *
 * IMPORTANT correction from the first version of this patch: bottom-nav
 * taps do NOT go through the shared Ln4d;->O1(String,Z)V dispatcher.
 * Each tab has its own small click-listener class (created in W(Bundle))
 * that calls a dedicated per-tab method directly:
 *
 *   Games tab  view -> new-instance Lnw; -> calls Ln4d;->y1()V
 *   Search tab view -> new-instance Lt8; -> calls Ln4d;->L1()V
 *
 * So this patch hooks y1() and L1() directly instead — same dead-code
 * prepend pattern as before, just on the correct anchor methods. Since
 * each method is already scoped to exactly one tab, no string check is
 * needed inside them (unlike the O1() dispatcher, which handles all
 * tabs and needed an if-check).
 *
 * O1() is intentionally left unpatched here — it's still used for
 * deep-link / programmatic tab switches (e.g. intent extras), and
 * leaving it alone keeps that path's original behavior untouched.
 */
val repurposeSearchAndGamesTabsPatch = bytecodePatch(
    name = "Repurpose Search/Games tabs to Tools/About",
    description = "Redirects the Search tab to the Modx Tools screen and the Games tab to the Modx About screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)
    extendWith("extensions/core.mpe")
    execute {
        SearchTabHandlerFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mxtech/videoplayer/b;->b:Lcom/mxtech/videoplayer/ad/ActivityWelcomeMX;
                invoke-static {v0}, Lapp/utsavrajput/extension/ExtensionHooks;->launchTools(Landroid/content/Context;)V
                return-void
            """,
        )

        GamesTabHandlerFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mxtech/videoplayer/b;->b:Lcom/mxtech/videoplayer/ad/ActivityWelcomeMX;
                invoke-static {v0}, Lapp/utsavrajput/extension/ExtensionHooks;->launchAbout(Landroid/content/Context;)V
                return-void
            """,
        )
    }
}
