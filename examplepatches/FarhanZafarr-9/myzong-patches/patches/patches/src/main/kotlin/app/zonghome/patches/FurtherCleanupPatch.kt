package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val HELPER = "Lapp/zonghome/extension/FurtherCleanup;"
private val target = Compatibility(
    name = "My Zong", packageName = "com.zong.customercare", apkFileType = ApkFileType.APK,
    appIconColor = 0x80c342, targets = listOf(AppTarget(version = "5.19.19.112"))
)

private fun screenPatch(title: String, detail: String, hook: String, usage: Boolean = false) = bytecodePatch(
    name = title, description = detail, default = true
) {
    compatibleWith(target)
    dependsOn(sharedExtensionPatch)
    if(!usage && hook!="spaceHomeSections")dependsOn(initialHomeVisibility(hook))
    execute {
        val screen = if (usage) "FragUsage" else "FragHome"
        Fingerprint(
            definingClass = "Lcom/zong/customercare/view/ui/$screen;", name = "onViewCreated",
            returnType = "V", parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        ).method.addInstruction(0, "invoke-static/range {p1 .. p1}, $HELPER->$hook(Landroid/view/View;)V")
    }
}

private val chatbotEntryGuard = bytecodePatch {
    execute {
        // .112-specific: REA traced access$showChatBot to this private opening method.
        Fingerprint(
            definingClass = "Lcom/zong/customercare/HomeActivity;", name = "receiveFile",
            returnType = "V", parameters = emptyList()
        ).method.addInstruction(0, "return-void")
    }
}

private fun navPatch(title: String, detail: String, hook: String, blockChatbot: Boolean = false) = bytecodePatch(
    name = title, description = detail, default = true
) {
    compatibleWith(target)
    dependsOn(sharedExtensionPatch)
    if (blockChatbot) dependsOn(chatbotEntryGuard)
    execute {
        val method = Fingerprint(
            definingClass = "Lcom/zong/customercare/HomeActivity;", name = "onCreate",
            returnType = "V", parameters = listOf("Landroid/os/Bundle;")
        ).method
        val exits = method.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        check(exits.isNotEmpty()) { "HomeActivity.onCreate has no normal return; refusing unsafe hook" }
        for (index in exits.reversed()) method.addInstruction(
            index, "invoke-static/range {p0 .. p0}, $HELPER->$hook(Landroid/app/Activity;)V"
        )
    }
}

@Suppress("unused")
val hideWalletPatch = screenPatch("Hide home Z Wallet", "Hide the Z Wallet section.", "hideWallet")
@Suppress("unused")
val hideStepCounterPatch = screenPatch("Hide home step counter", "Hide the step shortcut and step-counter panel.", "hideSteps")
@Suppress("unused")
val hideWeatherStripPatch = screenPatch("Hide home weather strip", "Hide the location/weather strip and its expand arrow.", "hideWeather")
@Suppress("unused")
val hideMakeYourOwnBundlePatch = screenPatch("Hide Make Your Own Bundle shortcut", "Individually hide MYOB; reflow remaining shortcuts.", "hideMyob")
@Suppress("unused")
val hideBachatBazaarPatch = screenPatch("Hide Bachat Bazaar shortcut", "Individually hide Bachat Bazaar; reflow remaining shortcuts.", "hideBachat")
@Suppress("unused")
val hideZong4uPatch = screenPatch("Hide Zong4U shortcut", "Individually hide Zong4U; reflow remaining shortcuts.", "hideZong4u")
@Suppress("unused")
val hideOfferCountPatch = screenPatch("Hide home active-offer counts", "Hide X offers active below data/minutes/SMS; retain values and progress.", "hideOfferCounts")
@Suppress("unused")
val hideUsageTopBannerPatch = screenPatch("Hide usage top banner", "Hide the large banner above usage summary.", "hideUsageBanner", true)
@Suppress("unused")
val hideUsagePromotionalSectionPatch = screenPatch("Hide usage promotions", "Hide the external promotion label and ad container on Usage.", "hideUsagePromotions", true)
@Suppress("unused")
val homeSpacingPatch = screenPatch("Space home sections", "Ensure at least 24dp above the options tray and regional/city offers.", "spaceHomeSections")
@Suppress("unused")
val hideMoreTabPatch = navPatch("Hide More bottom tab", "Hide More without removing its navigation destination.", "hideMore")
@Suppress("unused")
val hideZPlayTabPatch = navPatch("Hide Z Play bottom tab", "Hide Z Play; preserve the remaining bottom navigation items.", "hideZPlay")

@Suppress("unused")
val hideRegionalOffersPatch = screenPatch(
    "Hide home regional and city offers", "Hide the regional/city offer search section independently.", "hideCityOffers"
)
@Suppress("unused")
val hideChatbotPatch = navPatch(
    "Hide floating chatbot and dialog", "Hide the launcher and overlay, and block the .112 chatbot opening method.",
    "hideChatbot", true
)

@Suppress("unused")
val hideBundlePromotionsPatch = bytecodePatch(
    name = "Hide bundle browsing promotions",
    description = "Hide the advertising banner above the bundle browsing and results section.",
    default = true
) {
    compatibleWith(target)
    dependsOn(sharedExtensionPatch)
    execute {
        for (screen in listOf("FragBundlesMain", "FragBundleDetails")) Fingerprint(
            definingClass = "Lcom/zong/customercare/view/ui/$screen;", name = "onViewCreated",
            returnType = "V", parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        ).method.addInstruction(0, "invoke-static/range {p1 .. p1}, $HELPER->hideBundlePromotions(Landroid/view/View;)V")
    }
}

@Suppress("unused")
val hideHomeRechargePatch=screenPatch(
    "Hide Home recharge button", "Hide only the recharge button in the Home account header.", "hideHomeRecharge"
)

@Suppress("unused")
val hideOnlineRechargePromotionsPatch=bytecodePatch(
    name="Hide online recharge promotions",
    description="Hide banners and inline promotions on Online Recharge when that section is enabled.", default=true
) {
    compatibleWith(target)
    dependsOn(sharedExtensionPatch)
    execute {
        Fingerprint(
            definingClass="Lcom/zong/customercare/view/ui/FragOrPaymentMethods;",name="onViewCreated",
            returnType="V",parameters=listOf("Landroid/view/View;","Landroid/os/Bundle;")
        ).method.addInstruction(0,"invoke-static/range {p1 .. p1}, $HELPER->hideOnlinePromotions(Landroid/view/View;)V")
    }
}

@Suppress("unused")
val hideDrawerExtrasPatch=navPatch(
    "Hide drawer support and promotional links",
    "Hide Press Release, Find Us, Contact Us, Video Tutorials, FAQs and Feedback in the side menu.",
    "hideDrawerExtras"
)

@Suppress("unused")
val holdStartupCoverPatch=bytecodePatch(
    name="Hold startup until Home settles",
    description="Keep a matching dark brand cover for at least 450ms and until loading/three clean frames settle; maximum 1.8 seconds.",
    default=true
) {
    compatibleWith(target)
    dependsOn(sharedExtensionPatch)
    execute {
        val create=Fingerprint(
            definingClass="Lcom/zong/customercare/HomeActivity;",name="onCreate",
            returnType="V",parameters=listOf("Landroid/os/Bundle;")
        ).method
        val exits=create.implementation!!.instructions.withIndex().filter { it.value.opcode==Opcode.RETURN_VOID }.map { it.index }
        check(exits.isNotEmpty())
        for(index in exits.reversed())create.addInstruction(index,
            "invoke-static/range {p0 .. p0}, Lapp/zonghome/extension/StartupCover;->show(Landroid/app/Activity;)V")
    }
}
