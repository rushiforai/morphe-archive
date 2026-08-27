package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val securityNoticePatch = bytecodePatch(
    name = "Remove security notice",
    description = "Suppresses the modified-build security notice by disabling the risk SDK dialog entry point and the isCracking flag writer.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        // Make CrackingInterceptor.c(int) a no-op so the "isCracking" flag is
        // never persisted.
        CrackingWriteFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Make RiskControlService.execute short-circuit to "true" so the
        // VerifyDialog (WebView rendering the server's security notice) is
        // never launched.
        RiskControlExecuteFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Suppress the Lynx "app not secure" modal, desktop promotions, and ad modals:
        // if WebActivity is launched with any of these channels, finish() immediately.
        WebActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual/range {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;
                move-result-object v0
                if-eqz v0, :cc_skip
                invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v0
                
                const-string v1, "image_lynx_global_unsafe_pkg_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish
                
                const-string v1, "image_lynx_promotion_desktop"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish

                const-string v1, "image_lynx_subscription_free_trial_gift_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish

                const-string v1, "image_lynx_ad_after_export_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish

                const-string v1, "image_lynx_ad_intercept_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish
                
                goto :cc_skip
                
                :cc_finish
                invoke-super/range {p0..p1}, Lcom/vega/web/WebBaseActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual/range {p0}, Lcom/vega/web/WebActivity;->finish()V
                return-void
                
                :cc_skip
            """
        )

        // Same modals hosted by the generic LynxActivity (covers TransLynxActivity).
        LynxActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual/range {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;
                move-result-object v0
                if-eqz v0, :cc_skip
                invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v0
                
                const-string v1, "image_lynx_global_unsafe_pkg_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish
                
                const-string v1, "image_lynx_promotion_desktop"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish

                const-string v1, "image_lynx_subscription_free_trial_gift_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish

                const-string v1, "image_lynx_ad_after_export_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish

                const-string v1, "image_lynx_ad_intercept_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-eqz v2, :cc_finish
                
                goto :cc_skip
                
                :cc_finish
                invoke-super/range {p0..p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual/range {p0}, Lcom/vega/main/LynxActivity;->finish()V
                return-void
                
                :cc_skip
            """
        )

        // Suppress DiversionPCActivity (PC diversion/promotion popup)
        DiversionPCActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual {p0}, Lcom/lemon/vega/ug/ui/DiversionPCActivity;->finish()V
                return-void
            """
        )

        // Suppress NoLoginDiversionPCActivity (PC diversion/promotion popup when not logged in)
        NoLoginDiversionPCActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual {p0}, Lcom/lemon/vega/ug/ui/NoLoginDiversionPCActivity;->finish()V
                return-void
            """
        )
    }
}
