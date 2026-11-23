package app.jofslash.patches.booking.upsells

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.enableSabaJsonFilter
import app.jofslash.patches.booking.shared.methodOf
import app.jofslash.patches.booking.shared.returnEarly
import app.jofslash.patches.booking.shared.sabaJsonFilterPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

private const val HIDE_UPSELLS = "Lapp/jofslash/extension/booking/HideUpsells;"

/** Says whether a server-driven page area ("shell region") is shown. Every page asks it. */
private const val SHELL_REGION_PROVIDER = "Lcom/booking/shellplatformcomponents/regions/DefaultShellRegionProvider;"

private const val CBCC_BANNERS = "Lcom/booking/cobrandcreditcardcomponents/acquisitionbanner"
private const val CBCC_INDEX_ONBOARDING =
    "Lcom/booking/cobrandcreditcard/embeddedonboarding/components/ui/IndexOnboardingSheetHostKt;"

private const val PRICE_MATCH_PROPERTY_BANNER =
    "Lcom/booking/geniusvipcomponents/pricematch/composables/banner/PropertyPagePriceMatchBannerKt;"
private const val YEAR_IN_TRAVEL_SHEET = "Lcom/booking/geniusyearintravelcomponents/sheet/YearInTravelWelcomeSheet;"
private const val ALMOST_PROMOTED_NUDGE =
    "Lcom/booking/genius/propertypage/components/GeniusRoomListAlmostPromotedNudgeViewModelImpl\$loadNudgeState\$1;"

private const val CROSS_SELL_KILL_SWITCH = "Lcom/booking/crosssellcomponents/killswitch/CrossSellKillSwitch;"
private const val CROSS_SELL = "Lcom/booking/crosssellcomponents/CrossSell;"
private const val CROSS_SELL_VIEW_MODEL = "Lcom/booking/crosssellcomponents/viewmodel/CrossSellViewModel;"
private const val PLACEMENT_TYPE = "Lcom/booking/crosssellservices/PlacementType;"

/** The "plan your trip with AI" card on the home screen (Booking's AI trip planner). */
private const val AI_TRIP_PLANNER_HOME_CARD = "Lcom/booking/chatai/companion/components/AitpHomescreenEntryPointKt;"

/** Makes a suspend function (or a coroutine body) finish at once with Unit, doing nothing. */
private fun MutableMethod.returnUnit() {
    requireLocalRegister()
    addInstructions(
        0,
        """
            sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
            return-object v0
        """
    )
}

/** The code added at the start of a method uses v0; it must not be one of the parameters. */
internal fun MutableMethod.requireLocalRegister() {
    val implementation = implementation ?: throw PatchException("$definingClass->$name has no code")
    val parameterRegisters = parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }.sum() +
            if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    if (implementation.registerCount <= parameterRegisters) {
        throw PatchException("$definingClass->$name has no free register")
    }
}

@Suppress("unused")
val hideUpsellsPatch = bytecodePatch(
    name = "Hide upsells",
    description = "Hides marketing that sells you something besides your stay: campaign banners, the " +
            "\"Offers\" row, attraction carousels and the AI trip planner card on the home screen; Booking's " +
            "promotional areas on the hotel page, in the booking form, on the confirmation and in My account; " +
            "offers to add a taxi, car, flight or attraction (\"Plan ahead\", \"Add to your stay\"); the Booking.com credit " +
            "card banners and sign-up sheet; the Genius VIP price match banner on hotel pages, the \"book 1 " +
            "more stay to reach Genius Level 2\" nudge and the \"Year in travel\" sheet. Prices, Genius " +
            "discounts and the rewards you have earned stay. Insurance offers are a separate patch.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")
    dependsOn(sabaJsonFilterPatch)

    execute {
        // Home screen offers. The home screen is a server-driven page; the blocks in its
        // promotional (campaign banner, "Offers" row), AI trip planner and ad areas, and the
        // "Popular attractions" carousel, are taken out of its JSON by their tracking ids (see
        // HomeOffers). The search box, recent searches, Genius, saved properties and your trips
        // stay.
        enableSabaJsonFilter("hideHomeOffers")
        // The AI trip planner card on the home screen: it emits nothing (and fetches nothing).
        methodOf(AI_TRIP_PLANNER_HOME_CARD, "AitpHomescreenEntryPoint").returnEarly()

        // Server-driven promotional areas: on the hotel page (hero and secondary), in the booking
        // form, on the confirmation, in My account and in the car, taxi, flight and attraction
        // funnels. The app checks here whether an area is on before it loads it, so an area that
        // is off isn't requested and takes no space. Must-see areas (such as policy and payment
        // notices) and the Genius loyalty area on the confirmation stay.
        // The method has no spare register, but it never reads "this" (the provider is an object
        // without state), so p0 holds the answer.
        methodOf(SHELL_REGION_PROVIDER, "isEnabled").addInstructions(
            0,
            """
                invoke-static { p1 }, $HIDE_UPSELLS->hideShellRegion(Ljava/lang/Enum;)Z
                move-result p0
                if-eqz p0, :shown
                const/4 p0, 0x0
                return p0
                :shown
                nop
            """
        )

        // Cross-sell (taxis, car rentals, flights, attractions for your stay). The kill switches
        // turn off the placements on the hotel page, the room page, the booking form and the
        // cancellation page, as Booking itself does when it switches them off.
        methodOf(CROSS_SELL_KILL_SWITCH, "isEnabled", emptyList()).returnEarly()
        // Every placement loads its offers through CrossSell.loadPlacement; the ones in
        // HideUpsells.CROSS_SELL (such as "Plan ahead" on the confirmation and booking details,
        // the sheet after booking, "Add to your stay" in the booking form and the home screen's
        // attraction, car and taxi carousels for your upcoming trip and last search) don't load
        // and stay empty, as before they load.
        methodOf(CROSS_SELL, "loadPlacement").apply {
            requireLocalRegister()
            addInstructions(
                0,
                """
                    iget-object v0, p0, $CROSS_SELL_VIEW_MODEL->placementType:$PLACEMENT_TYPE
                    invoke-static { v0 }, $HIDE_UPSELLS->hideCrossSell(Ljava/lang/Enum;)Z
                    move-result v0
                    if-eqz v0, :load
                    return-void
                    :load
                    nop
                """
            )
        }

        // The Booking.com credit card (co-branded, US): the banner in the booking form and in the
        // flights payment page, and the one on the confirmation. The composables emit nothing when
        // they return before touching the composer.
        methodOf("$CBCC_BANNERS/CoBrandCreditCardAcquisitionBannerSabaKt;", "CoBrandCreditCardAcquisitionBannerSaba")
            .returnEarly()
        methodOf("$CBCC_BANNERS/UsCoBrandedConfirmationBannerKt;", "UsCoBrandedConfirmationBanner").returnEarly()
        // The credit card sign-up sheet the home screen opens by itself.
        methodOf(CBCC_INDEX_ONBOARDING, "showCoBrandCreditCardEmbeddedOnboarding").returnEarly()

        // Genius marketing. The Genius discount in prices, the Genius badges and the benefits a
        // property gives Genius members aren't touched.
        // "Genius VIP: we'll match the price" banner on the hotel page (the price match itself,
        // and the price drop messages after booking, stay).
        methodOf(PRICE_MATCH_PROPERTY_BANNER, "PriceMatchPropertyBanner").returnEarly()
        // "Your year in travel" sheet the home screen opens by itself.
        methodOf(YEAR_IN_TRAVEL_SHEET, "show").returnUnit()
        // "Book 1 more stay to reach Genius Level 2" in the room list: the nudge state is loaded
        // by this flow; without it the nudge keeps its first state, hidden.
        methodOf(ALMOST_PROMOTED_NUDGE, "invokeSuspend").returnUnit()
    }
}
