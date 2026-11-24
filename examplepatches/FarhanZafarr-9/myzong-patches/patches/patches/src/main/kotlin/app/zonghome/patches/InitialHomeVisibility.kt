package app.zonghome.patches

import app.morphe.patcher.patch.rawResourcePatch

/** Each existing optional hide patch supplies only its own inflation-time defaults. */
internal fun initialHomeVisibility(hook:String)=rawResourcePatch {
    execute {
        if (!CustomizationSettings.enabled(hook)) return@execute
        val names=when(hook) {
            "hideMatch" -> setOf("cardSports")
            "hidePrayers" -> setOf("cardRamadan")
            "hideFamily" -> setOf("cardFamilyBundle","cardViewMy5Banner")
            "hideStreaks" -> setOf("streakView","layout7DaysStreak","cardViewStreak","cardViewStreakDetail")
            "hidePromotions" -> setOf("fragmentBanners","fragmentBannersNew","fragmentEntertainmentMenuTray",
                "layoutAdaptiveParentAd","tvBanner","cardViewFlashSale","ribbon","tvFlashSale","timeRemaining",
                "tvTime","tvRemaining","fragmentHotOffers")
            "hide5g" -> setOf("layout5g")
            "hideSmsCard" -> setOf("cardSms")
            "hideTariff" -> setOf("tvTariff")
            "hideLoanButton" -> setOf("btnLoan")
            "hideShortcutCard" -> setOf("cardTray")
            "hideWallet" -> setOf("z_wallet_view")
            "hideSteps" -> setOf("clStepCount","fragment_step_counter")
            "hideWeather" -> setOf("layoutWeatherWaly","imgWeatherExpend")
            "hideMyob" -> setOf("tv_myob","iv_myob","view_purple")
            "hideBachat" -> setOf("tv_bachat_bazar","iv_bachat_bazar","viewBachatBazar")
            "hideZong4u" -> setOf("tvZong4U","ivZong4U","viewZong4U")
            "hideOfferCounts" -> setOf("tvActiveInternetOffers","tvActiveVoiceOffers","tvActiveSmsOffers")
            "hideCityOffers" -> setOf("card_regional_offers")
            "hideHomeRecharge" -> setOf("btnRecharge")
            else -> error("Unknown Home initial visibility hook: $hook")
        }
        val shortcuts=setOf("tv_myob","tv_bachat_bazar","tvZong4U")
        val editor=CharcoalResources()
        val ids=editor.viewIds(compiledFile("resources.arsc").readBytes(),names+shortcuts+"card_view_myob")
        val file=compiledFile("res/layout/frag_home.xml")
        val visibility=if(hook=="hideHomeRecharge")4 else 8 // Preserve btnLoan's invisible width anchor.
        file.writeBytes(editor.initialVisibility(file.readBytes(),names.associate { ids.getValue(it) to visibility },
            ids.getValue("card_view_myob") to shortcuts.map { ids.getValue(it) }.toSet()))
    }
}
