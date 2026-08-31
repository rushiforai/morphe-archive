package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val hidePromotionalUiPatch = bytecodePatch(
    name = "Hide Promotional UI",
    description = "Suppresses home banners, export promos, subscription paywalls, Pro badges, Lynx promo modals, and PC diversion popups.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        HomeBotBannerFragmentOnCreateViewFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        OverseaHomeTopBannerFragmentOnCreateViewFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        HomeBackgroundHelperIsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        VegaSubscribeImplIFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        ComposeSubscribeActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-super/range {p0..p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual/range {p0}, Lcom/vega/subscription/widget/ComposeSubscribeActivity;->finish()V
                return-void
            """
        )

        BusinessMarkViewRefreshFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, Lcom/vega/infrastructure/extensions/ViewExtKt;->b(Landroid/view/View;)V
                return-void
            """
        )

        BottomBannerHelperIsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        BottomBannerHelperShowFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        ExportCampaignEnableConfigIsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        PcGuideBannerOptEntranceAbIsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        ResourcePositionAreaInitFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-static {p1, v0}, Lcom/vega/infrastructure/extensions/ViewExtKt;->d(Landroid/view/View;Z)V
            """
        )

        ResourcePositionAreaLoadResourceFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )

        ImageResourcePositionAreaLoadResourceFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )

        WebActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual/range {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;
                move-result-object v0
                if-eqz v0, :cc_web_skip
                invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v0

                const-string v1, "image_lynx_global_unsafe_pkg_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_web_finish

                const-string v1, "image_lynx_promotion_desktop"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_web_finish

                const-string v1, "image_lynx_subscription_free_trial_gift_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_web_finish

                const-string v1, "image_lynx_ad_after_export_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_web_finish

                const-string v1, "image_lynx_ad_intercept_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_web_finish

                goto :cc_web_skip

                :cc_web_finish
                invoke-super/range {p0..p1}, Lcom/vega/web/WebBaseActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual/range {p0}, Lcom/vega/web/WebActivity;->finish()V
                return-void

                :cc_web_skip
            """
        )

        LynxActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual/range {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;
                move-result-object v0
                if-eqz v0, :cc_lynx_skip
                invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v0

                const-string v1, "image_lynx_global_unsafe_pkg_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_lynx_finish

                const-string v1, "image_lynx_promotion_desktop"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_lynx_finish

                const-string v1, "image_lynx_subscription_free_trial_gift_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_lynx_finish

                const-string v1, "image_lynx_ad_after_export_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_lynx_finish

                const-string v1, "image_lynx_ad_intercept_modal"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :cc_lynx_finish

                goto :cc_lynx_skip

                :cc_lynx_finish
                invoke-super/range {p0..p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual/range {p0}, Lcom/vega/main/LynxActivity;->finish()V
                return-void

                :cc_lynx_skip
            """
        )

        DiversionPCActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual {p0}, Lcom/lemon/vega/ug/ui/DiversionPCActivity;->finish()V
                return-void
            """
        )

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
