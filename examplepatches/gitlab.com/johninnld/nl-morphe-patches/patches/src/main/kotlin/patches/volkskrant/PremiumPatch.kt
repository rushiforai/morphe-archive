package patches.volkskrant

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Suppresses marketing templates, sticky purchase prompts and premium label presentation, retaining manual account navigation.") {
    dependsOn(originalInput)
    compatibleWith(volkskrant)
    dependsOn(emptyMarketingTemplates)
    execute {
        installPremiumWebCleanup()
        change("Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewDataMapper;", "invoke(ZLnl/persgroep/edition/viewdata/ViewDataString;Lnl/persgroep/edition/viewdata/ViewDataColor;)Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewData;", "sget-object v0, Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewData\$None;->INSTANCE:Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewData\$None;\nreturn-object v0")
    }
}
