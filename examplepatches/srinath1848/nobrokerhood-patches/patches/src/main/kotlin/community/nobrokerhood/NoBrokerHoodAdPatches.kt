package community.nobrokerhood

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.returnEarly

/*
 * NoBrokerHood 3.6.6
 * Version code: 707
 *
 * Experimental Morphe patches for removing advertisements.
 * Targets are specific to version 3.6.6.
 *
 * Does not deliberately modify visitor approvals,
 * security calls, or notification delivery.
 *
 * Compilation and runtime behaviour still require testing.
 */

private const val DOOR_PUSH =
    "Lcom/app/nobrokerhood/models/DoorPush;"

private val NOBROKERHOOD_366 = Compatibility(
    name = "NoBrokerHood",
    packageName = "com.app.nobrokerhood",
    targets = listOf(
        AppTarget(version = "3.6.6")
    )
)

/*
 * PATCH 1
 * Remove visitor screen advertisements.
 */

@Suppress("unused")
val hideVisitorAdsPatch = bytecodePatch(
    name = "NoBrokerHood: Hide visitor-flow ads",
    description = "Removes visitor screen advertising banners.",
    default = true
) {
    compatibleWith(NOBROKERHOOD_366)

    execute {
        Fingerprint(
            definingClass =
                "Lcom/app/nobrokerhood/features/visitorflow/presentation/composables/AdBannerKt;",
            name = "AdBannerSection",
            returnType = "V",
            parameters = listOf(
                "Lcom/app/nobrokerhood/features/visitorflow/presentation/VisitorFlowViewModel;",
                "Ljava/lang/Boolean;",
                "Ljava/lang/Boolean;",
                "Ljava/lang/String;",
                "Lcom/app/nobrokerhood/features/visitorflow/presentation/UiState;",
                "Lkotlin/jvm/functions/Function1;",
                "Li3/r;",
                "I",
                "I"
            )
        ).matchSingle().method.returnEarly()
    }
}

/*
 * PATCH 2
 * Remove home-feed advertising cards.
 */

@Suppress("unused")
val hideHomeFeedAdsPatch = bytecodePatch(
    name = "NoBrokerHood: Hide feed ad cards",
    description = "Removes home-feed advertising cards.",
    default = true
) {
    compatibleWith(NOBROKERHOOD_366)

    execute {
        Fingerprint(
            definingClass =
                "Lcom/app/nobrokerhood/features/home_feed/ui/HomeFeedAdBannerKt;",
            name = "HomeFeedAdBanner",
            returnType = "V",
            parameters = listOf(
                "Lcom/app/nobrokerhood/features/forum_new/home/model/FeedAdCard;",
                "Lkotlin/jvm/functions/Function3;",
                "Lkotlin/jvm/functions/Function3;",
                "Lc4/m;",
                "Li3/r;",
                "I",
                "I"
            )
        ).matchSingle().method.returnEarly()
    }
}

/*
 * PATCH 3
 * Remove promotional advertisement dialogs.
 */

@Suppress("unused")
val hidePromotionDialogsPatch = bytecodePatch(
    name = "NoBrokerHood: Hide promotional popups",
    description = "Suppresses application promotional dialogs.",
    default = true
) {
    compatibleWith(NOBROKERHOOD_366)

    execute {
        Fingerprint(
            definingClass =
                "Lcom/app/nobrokerhood/activities/lb;",
            name = "showAdvertisement",
            returnType = "V",
            parameters = listOf(
                "Lcom/app/nobrokerhood/newnobrokerhood/promotions/data/PromotionsResponse;"
            )
        ).matchSingle().method.returnEarly()
    }
}

/*
 * PATCH 4 - EXPERIMENTAL
 *
 * Hide optional door-notification banners.
 *
 * Do not enable until security notification
 * functionality has been tested.
 */

@Suppress("unused")
val hideDoorNotificationBannersPatch = bytecodePatch(
    name = "NoBrokerHood: Hide door-notification banners (experimental)",
    description = "Suppresses optional banners in door push data.",
    default = false
) {
    compatibleWith(NOBROKERHOOD_366)

    execute {
        Fingerprint(
            definingClass = DOOR_PUSH,
            name = "hasBanner",
            returnType = "Z",
            parameters = emptyList()
        ).matchSingle().method.returnEarly(false)
    }
}

/*
 * PATCH 5 - EXPERIMENTAL
 *
 * Suppress the display-entry banner fragment.
 *
 * May leave an empty UI container.
 * Disabled by default.
 */

@Suppress("unused")
val hideEntryBannerFragmentPatch = bytecodePatch(
    name = "NoBrokerHood: Hide entry banner fragment (experimental)",
    description = "Suppresses entry promotional fragment setup.",
    default = false
) {
    compatibleWith(NOBROKERHOOD_366)

    execute {
        Fingerprint(
            definingClass =
                "Lcom/app/nobrokerhood/fragments/DisplayEntryBannerFragment;",
            name = "onViewCreated",
            returnType = "V",
            parameters = listOf(
                "Landroid/view/View;",
                "Landroid/os/Bundle;"
            )
        ).matchSingle().method.returnEarly()
    }
}
