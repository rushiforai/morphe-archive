package app.fblite.patches.ads

import app.fblite.patches.font.AttachBaseContextFingerprint
import app.fblite.patches.shared.Constants.COMPATIBILITY_FACEBOOK_LITE_530
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/fblite/extension/hideads/HideSponsoredPostsPatch;"

/**
 * Sponsored posts are inserted by the server into the feed's component tree, which is decoded by
 * X.1DY in the secondary dex. The extension adds a class with the same name that delegates to the
 * original and hides sponsored posts afterwards. This loads it at startup, before the secondary dex
 * exists, so it takes precedence.
 */
@Suppress("unused")
val hideSponsoredPostsPatch = bytecodePatch(
    name = "Hide sponsored posts",
    description = "Hides sponsored posts in the news feed and skips sponsored reels.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE_530)

    extendWith("extensions/hideads.mpe")

    execute {
        AttachBaseContextFingerprint.method.addInstructions(
            0,
            // attachBaseContext has 31 locals, so p0 and p1 are above v15 and need the range form.
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->loadDecoder(Landroid/content/Context;)V
                invoke-static/range { p0 .. p0 }, Lapp/fblite/extension/hideads/SponsoredReels;->install(Landroid/app/Application;)V
            """
        )
    }
}
