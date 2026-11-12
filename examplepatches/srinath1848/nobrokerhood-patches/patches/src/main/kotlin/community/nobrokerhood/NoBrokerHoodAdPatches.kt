package community.nobrokerhood

/**
 * NoBrokerHood 3.6.11 (versionCode 712) — consolidated 11-patch candidate.
 *
 * Retains the 10-patch curated baseline and adds a targeted AppBarIsland
 * single-banner renderer suppression experiment for the blue visitor promo.
 *
 * Broadens the existing homepage-billboard patch to also clear both the
 * TopAdState and BannerState observable lists/loading/expansion flags.
 * These additional getter hooks existed in the earlier 16-patch build where
 * the top banner was absent; the individual contribution is not proven.
 *
 * WARNING: New UI hooks are experimental until tested. Does not alter FCM
 * reception, security approvals, notification channels, or registration.
 */

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.returnEarly

private val NOBROKERHOOD_3611 = Compatibility(
    name = "NoBrokerHood",
    packageName = "com.app.nobrokerhood",
    targets = listOf(AppTarget(version = "3.6.11")),
)
@Suppress("unused")
val hideVisitorAdsPatch = bytecodePatch(
    name = "NoBrokerHood: Hide visitor-flow ads",
    description = "Hide the visitor-flow promotional carousel (3.6.11).",
    default = true,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass = "Lcom/app/nobrokerhood/features/visitorflow/presentation/composables/AdBannerKt;",
            name = "AdBannerSection",
            returnType = "V",
            parameters = listOf(
                "Lcom/app/nobrokerhood/features/visitorflow/presentation/VisitorFlowViewModel;",
                "Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "Ljava/lang/String;",
                "Lcom/app/nobrokerhood/features/visitorflow/presentation/UiState;",
                "Lkotlin/jvm/functions/Function1;", "Li3/r;", "I", "I",
            ),
        ).matchSingle().method.returnEarly()
    }
}

@Suppress("unused")
val hideHomeFeedAdsPatch = bytecodePatch(
    name = "NoBrokerHood: Hide feed ad cards",
    description = "Hide forum/home-feed ad cards (3.6.11).",
    default = true,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass = "Lcom/app/nobrokerhood/features/home_feed/ui/HomeFeedAdBannerKt;",
            name = "HomeFeedAdBanner",
            returnType = "V",
            parameters = listOf(
                "Lc4/m;",
                "Lcom/app/nobrokerhood/features/forum_new/home/model/FeedAdCard;",
                "Z", "Z", "Lkotlin/jvm/functions/Function1;",
                "Lkotlin/jvm/functions/Function3;",
                "Lkotlin/jvm/functions/Function3;",
                "Z", "Li3/r;", "I", "I",
            ),
        ).matchSingle().method.returnEarly()
    }
}

@Suppress("unused")
val hidePromotionDialogsPatch = bytecodePatch(
    name = "NoBrokerHood: Hide promotional popups",
    description = "Suppress app-level marketing dialogs (3.6.11).",
    default = true,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass = "Lcom/app/nobrokerhood/activities/ya;",
            name = "showAdvertisement",
            returnType = "V",
            parameters = listOf(
                "Lcom/app/nobrokerhood/newnobrokerhood/promotions/data/PromotionsResponse;"
            ),
        ).matchSingle().method.returnEarly()
    }
}

@Suppress("unused")
val hideExpandedNotificationImagesPatch = bytecodePatch(
    name = "NoBrokerHood: Hide expanded notification images (experimental)",
    description = "Hide large banner images in entry/exit notifications while retaining text (3.6.11).",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass =
                "Lcom/app/nobrokerhood/notifications/DoorFirebaseMessagingService;",
            name = "U",
            returnType = "Landroidx/core/app/o\$j;",
            parameters = listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Z",
                "Ljava/lang/String;",
            ),
        ).matchSingle().method.addInstructions(0, "const-string p3, \"\"")
    }
}

@Suppress("unused")
val useDefaultBrowserInsteadOfChromePatch = bytecodePatch(
    name = "NoBrokerHood: Default browser, block known ad hosts (experimental)",
    description = "Keep default-browser support but block known Multipl and Innovid ad-tracking hosts.",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass = "Lcom/app/nobrokerhood/utilities/t1;",
            name = "R7",
            returnType = "V",
            parameters = listOf("Landroid/app/Activity;", "I", "Ljava/lang/String;"),
        ).matchSingle().method.addInstructionsWithLabels(
            0,
            """
            if-eqz p3, :blocked
            invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
            move-result-object v2
            invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;
            move-result-object v2
            const-string v0, "apps.multipl.in"
            invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :blocked
            const-string v0, "multipl.in"
            invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :blocked
            const-string v0, "dts.innovid.com"
            invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :blocked
            const-string v0, "innovid.com"
            invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :blocked
            new-instance v0, Landroid/content/Intent;
            const-string v1, "android.intent.action.VIEW"
            invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
            move-result-object v2
            invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
            const-string v1, "android.intent.category.BROWSABLE"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;
            invoke-virtual {p1, v0, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
            return-void
            :blocked
            return-void
            """.trimIndent(),
        )
    }
}

@Suppress("unused")
val suppressFullscreenReminderPatch = bytecodePatch(
    name = "NoBrokerHood: Stop full-screen permission nag",
    description = "Stop the home-screen full-screen alert reminder without changing permissions.",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass = "Lcom/app/nobrokerhood/activities/HomeActivity;",
            name = "m8",
            returnType = "V",
            parameters = emptyList(),
        ).matchSingle().method.returnEarly()
    }
}

@Suppress("unused")
val hideComposeSideAdPatch = bytecodePatch(
    name = "NoBrokerHood: Hide floating promotional sidebar",
    description = "Hide the SideAd.kt Compose renderer attached to the RIGHT_AD home section.",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass = "Lsh/u0;",
            name = "f",
            returnType = "V",
            parameters = listOf(
                "Ljava/lang/String;", "Ljava/lang/String;",
                "Lcom/app/nobrokerhood/features/homepage/data/remote/models/Icon;",
                "Ljava/lang/String;", "Z",
                "Lkotlin/jvm/functions/Function0;", "Lkotlin/jvm/functions/Function0;",
                "Li3/r;", "I", "I",
            ),
        ).matchSingle().method.returnEarly()
    }
}

@Suppress("unused")
val clearTopAdStateAtConstructionPatch = bytecodePatch(
    name = "NoBrokerHood: Hide homepage billboard",
    description = "Clear both top-billboard state and app-bar banner state to hide rotating top ads.",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass =
                "Lcom/app/nobrokerhood/features/homepage/data/remote/models/TopAdState;",
            name = "<init>",
            returnType = "V",
            parameters = listOf(
                "Z", "Z", "Ljava/util/List;", "Ljava/lang/Long;",
                "Z", "Ljava/lang/String;", "Z",
            ),
        ).matchSingle().method.addInstructions(
            0,
            """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object p3
            """.trimIndent(),
        )
        // Reuse the earlier source's getter paths as a single selectable fix.
        // The constructor alone did not reliably cover the Visitors/Services tabs.
        val topModel = "Lcom/app/nobrokerhood/features/homepage/data/remote/models/TopAdState;"
        val appBarModel = "Lcom/app/nobrokerhood/features/app_bar_banner/data/models/BannerState;"
        for (model in listOf(topModel, appBarModel)) {
            Fingerprint(
                definingClass = model,
                name = "getList",
                returnType = "Ljava/util/List;",
                parameters = emptyList(),
            ).matchSingle().method.addInstructions(
                0,
                """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
            Fingerprint(
                definingClass = model,
                name = "isLoading",
                returnType = "Z",
                parameters = emptyList(),
            ).matchSingle().method.returnEarly(false)
            Fingerprint(
                definingClass = model,
                name = "isExpanded",
                returnType = "Z",
                parameters = emptyList(),
            ).matchSingle().method.returnEarly(false)
        }
    }
}

/**
 * EXPERIMENTAL: The earlier island-strip experiments changed a section type
 * or skipped only the AppBarIsland horizontal-list renderer. Neither removed
 * the blue visitor-tab offer. This patch skips two other direct render paths
 * in AppBarIsland.kt: the single-card render method s(...) and the horizontal
 * row F(...). It may hide legitimate app-bar island content, so test the
 * visitor controls and disable if anything else disappears.
 *
 * This is not proven to be the Domino's source until tested on-device.
 */
@Suppress("unused")
val hideVisitorIslandOfferPatch = bytecodePatch(
    name = "NoBrokerHood: Hide visitor promotional island",
    description = "Suppress AppBarIsland single-card and horizontal promotional rendering (experimental).",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass = "Lsh/s;",
            name = "s",
            returnType = "V",
            parameters = listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Lc4/m;", "Z", "Z", "Ljava/lang/String;", "Z",
                "Ljava/lang/String;",
                "Lkotlin/jvm/functions/Function1;",
                "Lkotlin/jvm/functions/Function0;",
                "Li3/r;", "I", "I", "I",
            ),
        ).matchSingle().method.returnEarly()
        Fingerprint(
            definingClass = "Lsh/s;",
            name = "F",
            returnType = "V",
            parameters = listOf(
                "Lg2/j1;", "Ljava/util/List;",
                "Lkotlin/jvm/functions/Function1;",
                "Lkotlin/jvm/functions/Function0;",
                "Lc4/m;", "Lrh/b;", "Z", "Ljava/util/Set;", "Lb2/l3;",
                "Ljava/lang/Boolean;", "Ljava/lang/Boolean;",
                "Lkotlin/jvm/functions/Function0;", "Li3/r;", "I", "I", "I",
            ),
        ).matchSingle().method.returnEarly()
    }
}

@Suppress("unused")
val hidePostApprovalAdContainerPatch = bytecodePatch(
    name = "NoBrokerHood: Skip post-approval ad container (experimental)",
    description = "Do not initialize the image/video ad RecyclerView after entry approval; preserve approval details.",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass = "Lcom/app/nobrokerhood/fragments/DisplayEntryBannerFragment;",
            name = "initRecyclerView",
            returnType = "V",
            parameters = emptyList(),
        ).matchSingle().method.returnEarly()
    }
}

@Suppress("unused")
val stopNotificationPromoBrowserRedirectPatch = bytecodePatch(
    name = "NoBrokerHood: Stop promotional browser launches from notifications",
    description = "Clear advertising click metadata and browser-directed routes from notification intents, preserving security-event fields (experimental).",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        Fingerprint(
            definingClass = "Lcom/app/nobrokerhood/activities/DoorSplashScreen;",
            name = "R1",
            returnType = "V",
            parameters = emptyList(),
        ).matchSingle().method.addInstructionsWithLabels(
            0,
            """
            move-object/from16 v0, p0
            invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
            move-result-object v0
            if-eqz v0, :nbhNotificationRouteDone
            const-string v1, "uniqueCode"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
            move-result v1
            if-nez v1, :nbhRecognizedNotification
            const-string v1, "messageType"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
            move-result v1
            if-eqz v1, :nbhNotificationRouteDone
            :nbhRecognizedNotification
            const-string v1, "gaClick"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const-string v1, "screenName"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v2
            const-string v3, "CHECK_IN"
            invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v3
            if-nez v3, :nbhDropHybridUrl
            const-string v3, "CHECK_OUT"
            invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v3
            if-eqz v3, :nbhCheckRoute
            :nbhDropHybridUrl
            const-string v1, "hybridUrl"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            :nbhCheckRoute
            const-string v1, "destination_route"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v2
            const-string v3, "chromeTab"
            invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v3
            if-nez v3, :nbhRemoveExternalRoute
            const-string v1, "deeplink"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v2
            if-eqz v2, :nbhNotificationRouteDone
            const-string v3, "https://"
            invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v3
            if-nez v3, :nbhRemoveExternalRoute
            const-string v3, "http://"
            invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v3
            if-nez v3, :nbhRemoveExternalRoute
            const-string v3, "target_url"
            invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
            move-result v3
            if-eqz v3, :nbhNotificationRouteDone
            :nbhRemoveExternalRoute
            const-string v1, "destination_route"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const-string v1, "deeplink"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const-string v1, "url"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const-string v1, "hybridUrl"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const-string v1, "target_url"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
            :nbhNotificationRouteDone
            nop
            """.trimIndent(),
        )
    }
}
