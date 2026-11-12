package community.nobrokerhood

/**
 * NoBrokerHood 3.6.11 (versionCode 712) — 11-patch corrected candidate.
 *
 * Retains the prior 11-patch baseline but replaces two ineffective hooks:
 * the post-approval media renderer and notification tap metadata handling.
 *
 * Broadens the existing homepage-billboard patch to also clear both the
 * TopAdState and BannerState observable lists/loading/expansion flags.
 * These additional getter hooks existed in the earlier 16-patch build where
 * the top banner was absent; the individual contribution is not proven.
 *
 * WARNING: New hooks are experimental until tested on-device. Do not alter FCM
 * reception, security approval actions, channels, or token registration.
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
val hidePostApprovalMediaPatch = bytecodePatch(
    name = "NoBrokerHood: Hide post-approval sponsored media",
    description = "Suppress the Compose PacCard image/video renderer while retaining the approval screen (experimental).",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        // Observed path in 3.6.11:
        // PreApprovalBannerActivityNew.R1 -> preapprovalbanner/i.d -> sg/t0.G0
        // This composable's source name is PacCard (ApprovalComposables.kt:812).
        // The previous DisplayEntryBannerFragment.initRecyclerView hook did not
        // affect this separate Compose rendering path.
        Fingerprint(
            definingClass = "Lsg/t0;",
            name = "G0",
            returnType = "V",
            parameters = listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Lc4/m;",
                "Lcom/app/nobrokerhood/newnobrokerhood/postApprovalCard/data/model/CardPersonalizedData;",
                "Z", "Lkotlin/jvm/functions/Function2;", "Ljava/lang/String;",
                "Li3/r;", "I", "I",
            ),
        ).matchSingle().method.returnEarly()
    }
}

@Suppress("unused")
val stopNotificationPromoBrowserRedirectPatch = bytecodePatch(
    name = "NoBrokerHood: Sanitize entry/exit notification ad links",
    description = "Remove promotional URL extras when building entry/exit notification tap intents (experimental).",
    default = false,
) {
    compatibleWith(NOBROKERHOOD_3611)
    execute {
        // DoorFirebaseMessagingService.J builds a PendingIntent from an Intent
        // that carries screenName, gaClick, destination_route and hybridUrl.
        // J invokes I(Intent, String[]) before creating the PendingIntent.
        // Thus I is a narrow, early tap-intent sanitation point.
        // It only modifies CHECK_IN / CHECK_OUT, preserving other event types.
        Fingerprint(
            definingClass = "Lcom/app/nobrokerhood/notifications/DoorFirebaseMessagingService;",
            name = "I",
            returnType = "V",
            parameters = listOf("Landroid/content/Intent;", "[Ljava/lang/String;"),
        ).matchSingle().method.addInstructionsWithLabels(
            0,
            """
            if-eqz p1, :nbhIntentDone
            const-string v0, "screenName"
            invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0
            const-string p0, "CHECK_IN"
            invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result p0
            if-nez p0, :nbhSanitize
            const-string p0, "CHECK_OUT"
            invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result p0
            if-eqz p0, :nbhIntentDone
            :nbhSanitize
            const-string v0, "gaClick"
            invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const-string v0, "hybridUrl"
            invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const-string v0, "target_url"
            invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const-string v0, "url"
            invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            const-string v0, "destination_route"
            invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
            const-string v0, "chromeTab"
            invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result p0
            if-eqz p0, :nbhIntentDone
            const-string v0, "destination_route"
            invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
            :nbhIntentDone
            nop
            """.trimIndent(),
        )
    }
}
