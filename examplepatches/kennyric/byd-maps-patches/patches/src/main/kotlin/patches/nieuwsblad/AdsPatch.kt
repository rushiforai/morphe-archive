package patches.nieuwsblad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val hideAds = bytecodePatch(name = "Hide ads", description = "Suppresses Kaching advertising, sponsored publisher groups and identified Shop and NYT promotion cards.") {
    dependsOn(originalInput)
    compatibleWith(nieuwsblad)
    execute {
        change("Lbe/mediahuis/kaching/Kaching;", "requestAd(Lbe/mediahuis/kaching/advertisement/models/AdRequest;Landroid/view/ViewGroup;ZLbe/mediahuis/kaching/advertisement/models/AdHeightConstraint;)Lbe/mediahuis/kaching/KachingResult;", AD_DISABLED)
        change("Lbe/mediahuis/kaching/Kaching;", "getVideoPrerollUrl(Lbe/mediahuis/kaching/preroll/PrerollContext;Lbe/mediahuis/kaching/preroll/VideoRatio;)Lbe/mediahuis/kaching/KachingResult;", AD_DISABLED)
        change("Lbe/mediahuis/kaching/Kaching;", "getAudioPrerollUrl(Lbe/mediahuis/kaching/preroll/PrerollContext;)Lbe/mediahuis/kaching/KachingResult;", AD_DISABLED)
        val groupVisibility = exact(
            "Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;",
            "isHidden_delegate\$lambda\$0(Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;)Z",
        ).method
        check(groupVisibility.accessFlags and AccessFlags.STATIC.value != 0 &&
            groupVisibility.implementation!!.registerCount == 3) { "Expected the original two-local group visibility callback" }
        groupVisibility.addInstructionsWithLabels(0, """
            invoke-virtual {p0}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;->getGroupOptions()Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/GroupOptions;
            move-result-object v0
            if-eqz v0, :originalGroupVisibility
            invoke-virtual {v0}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/GroupOptions;->getGroupTheme()Ljava/lang/String;
            move-result-object v0
            const-string v1, "sponsored-content"
            invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :originalGroupVisibility
            const/4 v0, 0x1
            return v0
        """.trimIndent(), ExternalLabel("originalGroupVisibility", groupVisibility.getInstruction(0)))
        patches.shared.suppressMediahuisNytPromotion()
        patches.shared.suppressMediahuisShopPromotion()
        patches.shared.suppressMediahuisGroupPromotions()
    }
}
