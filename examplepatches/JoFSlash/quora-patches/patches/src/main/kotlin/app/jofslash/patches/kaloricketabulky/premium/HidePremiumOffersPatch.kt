package app.jofslash.patches.kaloricketabulky.premium

import app.jofslash.patches.kaloricketabulky.shared.Constants.APP
import app.jofslash.patches.kaloricketabulky.shared.Constants.COMPATIBILITY_KALORICKE_TABULKY
import app.jofslash.patches.kaloricketabulky.shared.clearBooleanParameter
import app.jofslash.patches.kaloricketabulky.shared.methodOf
import app.jofslash.patches.kaloricketabulky.shared.methodsWhere
import app.jofslash.patches.kaloricketabulky.shared.returnBoolean
import app.jofslash.patches.kaloricketabulky.shared.returnEarly
import app.morphe.patcher.patch.bytecodePatch

private const val UPSELL_BANNER_VIEW_MODEL = "$APP/compose/components/features/UpsellBannerViewModel;"
private const val PREMIUM_OFFER_CONDITION = "$APP/screenFragment/home/Conditions\$PremiumOffer;"
private const val INTERSTITIAL = "$APP/screenFragment/home/InterstitialKt;"
private const val HOME_TOP_BAR = "$APP/screenFragment/home/ui/HomeTopBarKt;"
private const val NAVIGATION_ACTIONS_VIEW_STATE = "$APP/screenFragment/NavigationActionsViewState;"

@Suppress("unused")
val hidePremiumOffersPatch = bytecodePatch(
    name = "Hide Premium offers",
    description = "Hides the Premium offers that show up by themselves: the trial banners on the home, search " +
            "and profile screens, the Premium offer after you sign in and the full-screen Premium offer after " +
            "an ad. Premium itself, its features and the offers you open yourself stay.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    execute {
        // Whether the "try Premium" banner is shown at a placement (home, every n-th search,
        // profile). The view model also checks that you have no subscription; this only says no.
        methodOf(UPSELL_BANNER_VIEW_MODEL, "isEnabled").returnBoolean(false)

        // The Premium offer screen the home screen opens once after you sign in.
        methodOf(PREMIUM_OFFER_CONDITION, "evaluate").returnBoolean(false)

        // The full-screen Premium offer shown after a full-screen ad is closed.
        methodOf(INTERSTITIAL, "showUpsellInterstitial").returnEarly()
    }
}

@Suppress("unused")
val hidePremiumButtonsPatch = bytecodePatch(
    name = "Hide Premium buttons",
    description = "Hides the Premium button in the home screen's top bar and the \"Get Premium benefits\" " +
            "button in the add menu (the + button). The Premium offers you open from a Premium feature stay.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    execute {
        // HomeTopBar(date, showPremiumButton, ...): the second parameter only decides the button.
        methodsWhere(HOME_TOP_BAR, "HomeTopBar(Date, boolean, ...)") {
            it.name == "HomeTopBar" && it.parameterTypes.size > 2 &&
                    it.parameterTypes[0].toString() == "Ljava/util/Date;" && it.parameterTypes[1].toString() == "Z"
        }.forEach { it.clearBooleanParameter(1) }

        // The add menu's view state (isPhotoButtonVisible, isPremiumButtonVisible).
        methodOf(NAVIGATION_ACTIONS_VIEW_STATE, "<init>", listOf("Z", "Z")).clearBooleanParameter(1)
    }
}
