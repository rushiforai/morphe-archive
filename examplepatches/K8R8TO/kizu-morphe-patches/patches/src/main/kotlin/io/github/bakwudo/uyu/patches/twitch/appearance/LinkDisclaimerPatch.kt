package io.github.bakwudo.uyu.patches.twitch.appearance

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.EXTENSION_PACKAGE

private const val SUPPORT_CLASS = "$EXTENSION_PACKAGE/appearance/LinkDisclaimerSupport;"

internal val linkDisclaimerPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(settingsPatch)

    execute {
        BrowserRouterDisclaimerFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $SUPPORT_CLASS->shouldBypass()Z
                move-result v0
                if-eqz v0, :kizu_link_disclaimer_original
                invoke-virtual {p0, p1, p2, p3}, Loy3;->g(Landroidx/fragment/app/n;Landroid/net/Uri;Z)Z
                move-result v0
                if-eqz v0, :kizu_link_disclaimer_done
                invoke-interface {p4}, Lsii;->invoke()Ljava/lang/Object;
                :kizu_link_disclaimer_done
                return-void
                :kizu_link_disclaimer_original
                nop
            """,
        )
    }
}
