package patches.weerplaza

import app.morphe.patcher.Fingerprint
import patches.shared.uniqueMatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private val premiumResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        listOf("nav_menu", "nav_menu_nl", "nav_menu_nl_winter").forEach {
            document("res/menu/$it.xml").use { doc -> doc.one("android:id", "@id/nav_remove_ads").setAttributeNS(ANDROID, "android:visible", "false") }
        }
        document("res/layout/fragment_settings_menu.xml").use { doc -> doc.one("android:id", "@id/menu_subscriptions").collapse() }
        document("res/layout/main_drawer.xml").use { doc -> doc.one("android:id", "@id/promotion_paywall").collapse() }
    }
}
@Suppress("unused")
val hidePremiumBanner = bytecodePatch(
    name = "Hide Premium banner",
    description = "Hides subscription menus, settings promotions, automatic paywalls, declined-consent upsells and locked-hourly subscription notices. Paid hourly data remains unchanged for subscribers.",
) {
    dependsOn(originalInput)
    compatibleWith(weerplaza)
    dependsOn(premiumResources, googleMapsCompatibility)
    execute {
        installWebSanitizer(WebControl.Premium)
        installPremiumNavigationGuard()
        // The false branch renders only a subscription call-to-action. Return before
        // creating that group; the subscribed path keeps its original hourly data.
        Fingerprint(definingClass = "Ld8/q0;", name = "k", returnType = "V",
            parameters = listOf("Ljava/util/List;", "Z", "Lud/a;", "Landroidx/compose/runtime/Composer;", "I"),
            strings = listOf("com.meteoplaza.app.views.localweather.items.compose.AdditionalHourlyData (ForecastView.kt:267)"))
            .uniqueMatch().method.apply {
                addInstructionsWithLabels(0, "if-nez p1, :subscribed\nreturn-void",
                    ExternalLabel("subscribed", getInstruction(0)))
            }
        Fingerprint(definingClass = "Ll8/g;", name = "j", returnType = "V", strings = listOf("PromotionPaywall: user is subscribed, skipping")).uniqueMatch().method.addInstructions(0, "return-void")
        Fingerprint(definingClass = "Ll7/g\$d;", name = "a", returnType = "Ljava/lang/Object;", parameters = listOf("Lt9/l;", "Lld/e;"), strings = listOf("ConsentHelper: user declined, launching SubscribeActivity")).uniqueMatch().method.addInstructions(0, "sget-object v0, Lfd/i0;->a:Lfd/i0;\nreturn-object v0")
    }
}
