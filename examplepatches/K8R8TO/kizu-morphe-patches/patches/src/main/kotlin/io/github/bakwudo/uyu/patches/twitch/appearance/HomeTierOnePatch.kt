package io.github.bakwudo.uyu.patches.twitch.appearance

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.bakwudo.uyu.patches.twitch.settings.setPatchIncluded
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.EXTENSION_PACKAGE

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/appearance/HomeCleanupSupport;"
private const val BROWSER_ROUTER_CLASS = "Loy3;"

internal val homeTierOnePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(settingsPatch, hidePromotionsPatch)

    execute {
        setPatchIncluded("homeCleanup")

        BrowserRouterDisclaimerFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $EXTENSION_CLASS->disableLinkDisclaimer()Z
                move-result v0
                if-eqz v0, :kizu_link_disclaimer_original
                invoke-virtual {p0, p1, p2}, $BROWSER_ROUTER_CLASS->g(Landroidx/fragment/app/n;Landroid/net/Uri;Z)Z
                return-void
                :kizu_link_disclaimer_original
                nop
            """,
        )
    }
}
