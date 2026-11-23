package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val HOME = "Lcom/zong/customercare/view/ui/FragHome;"
private const val EXTENSION = "Lapp/zonghome/extension/HomeCleanup;"

internal val myZongCompatibility = Compatibility(
    name = "My Zong",
    packageName = "com.zong.customercare",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x80c342,
    targets = listOf(AppTarget(version = "5.19.19.112"))
)

internal val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
}

private fun homePatch(name: String, description: String, hook: String) = bytecodePatch(
    name = name,
    description = description,
    default = true
) {
    compatibleWith(myZongCompatibility)
    dependsOn(sharedExtensionPatch,initialHomeVisibility(hook))
    execute {
        val method = Fingerprint(
            definingClass = HOME,
            name = "onViewCreated",
            returnType = "V",
            parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        ).method
        // Range form supports methods whose parameter registers are above v15.
        // No scratch register or existing instruction is overwritten.
        method.addInstruction(0, "invoke-static/range {p1 .. p1}, $EXTENSION->$hook(Landroid/view/View;)V")
    }
}

@Suppress("unused")
val hideMatchCardPatch = homePatch(
    "Hide home match card", "Hide the home-screen sports/match information card.", "hideMatch"
)
@Suppress("unused")
val hidePrayerCardPatch = homePatch(
    "Hide home prayer card", "Hide the home-screen prayer/Ramadan timing card.", "hidePrayers"
)
@Suppress("unused")
val hideFamilySectionPatch = homePatch(
    "Hide home family sharing", "Hide the complete family-sharing button group and MY5 banner.", "hideFamily"
)
@Suppress("unused")
val hideStreakCardsPatch = homePatch(
    "Hide home streak cards", "Hide the start-your-streak and seven-day streak sections.", "hideStreaks"
)
@Suppress("unused")
val hidePromotionsPatch = homePatch(
    "Hide home promotions", "Hide promotional banners, flash sales, hot offers, inline ads and the horizontal entertainment row.", "hidePromotions"
)
@Suppress("unused")
val hide5gShortcutsPatch = homePatch(
    "Hide home 5G shortcuts", "Hide the 5G map/settings/bundles shortcut group.", "hide5g"
)
