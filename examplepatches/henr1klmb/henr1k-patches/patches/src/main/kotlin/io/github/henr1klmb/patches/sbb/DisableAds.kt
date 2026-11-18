package io.github.henr1klmb.patches.sbb

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val HELPER = "Lio/github/henr1klmb/patches/shared/WebViewHelper;"

@Suppress("unused")
val disableAdsPatch = patch(
    name = "Disable ads",
    description = "Disables multiple ad types.",
) {
    compatibleWith(SBB_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Hide and disable SbbAdsView when attached to window
        SbbAdsViewAttachedFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent(),
        )

        // Disable ad request updates
        SbbAdsViewUpdateAdRequestFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        // Disable Google Mobile Ads Init Provider
        MobileAdsInitProviderFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        // Inject ad blocking script into WebViews
        SbbWebViewClientFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-static {p1}, $HELPER->injectAdBlock(Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}
