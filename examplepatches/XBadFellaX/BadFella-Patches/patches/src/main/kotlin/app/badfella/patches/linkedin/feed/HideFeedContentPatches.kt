package app.badfella.patches.linkedin.feed

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val SETTINGS_CLASS = "$EXTENSION_PACKAGE/Settings;"

// The filtering itself lives in the extension's SduiComponentFilter; these patches switch it on.

@Suppress("unused")
val hideSuggestedPostsPatch = bytecodePatch(
    name = "Hide suggested posts",
    description = "Removes \"Suggested\" posts from outside your network from the feed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(sduiComponentFilterPatch)
    execute { markIncluded("isHideSuggestedIncluded") }
}

@Suppress("unused")
val hidePromotedJobsPatch = bytecodePatch(
    name = "Hide promoted jobs",
    description = "Removes promoted job listings from the Jobs tab and job search.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(sduiComponentFilterPatch)
    execute { markIncluded("isHidePromotedJobsIncluded") }
}

@Suppress("unused")
val expandPostsPatch = bytecodePatch(
    name = "Expand posts",
    description = "Adds an option (off by default, turned on in BadFella Patches) to show posts expanded by default. " +
        "Tapping the text collapses them.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(sduiComponentFilterPatch)
    execute { markIncluded("isExpandPostsIncluded") }
}

@Suppress("unused")
val feedFiltersPatch = bytecodePatch(
    name = "Feed filters",
    description = "Adds optional filters (off by default, turned on in BadFella Patches): focus mode, " +
        "celebrations, job cards, reposts, posts from others' activity, \"Recommended for you\", video posts, " +
        "games, the \"New posts\" pill and \"See translation\".",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(sduiComponentFilterPatch)
    execute { markIncluded("isFeedFiltersIncluded") }
}

/**
 * HomeNavPanelTransformer.toPremiumViewData(PremiumUpsellSlotContent): builds the "Try Premium" card
 * in the native "Me" panel. With a null slot it returns nothing for free members (and still returns
 * "Access my Premium" for actual Premium members).
 */
private object NavPanelResponseFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/navpanel/HomeNavPanelAggregateResponse;",
    name = "<init>",
    custom = { method, _ ->
        method.parameterTypes.size == 4 &&
            method.parameterTypes[1].toString() == "Lcom/linkedin/android/pegasus/dash/gen/voyager/dash/premium/PremiumUpsellSlotContent;"
    },
)

@Suppress("unused")
/**
 * UniversalNavigationController.navigate(int, Bundle, NavOptions): every in-app navigation, including the server
 * driven full screen Premium page (premium_upsell_full_page_takeover) that LinkedIn opens on its own after launch.
 */
private object UniversalNavigateFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/infra/navigation/UniversalNavigationController;",
    name = "navigate",
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;", "Lcom/linkedin/android/infra/navigation/NavOptions;"),
)

val hidePremiumUpsellsPatch = bytecodePatch(
    name = "Hide Premium upsells",
    description = "Removes Premium and AI upsell cards and banners, including on profiles and the Me panel.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(sduiComponentFilterPatch)
    execute {
        markIncluded("isHidePremiumIncluded")

        // The Me panel's Premium bar is built from the upsell slot of this response. It is cleared here, which also
        // works where LinkedIn moved the code that reads it (4.1.1267). The slot goes through the extension because the
        // constructor has no free register.
        NavPanelResponseFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p2 .. p2 }, $SETTINGS_CLASS->navPanelUpsellSlot(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p2
                check-cast p2, Lcom/linkedin/android/pegasus/dash/gen/voyager/dash/premium/PremiumUpsellSlotContent;
            """
        )

        // Never open the full screen Premium page: with its only component hidden it would flash an empty page.
        UniversalNavigateFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p2 .. p2 }, $EXTENSION_PACKAGE/PremiumTakeover;->blocksNavigation(Landroid/os/Bundle;)Z
                    move-result v0
                    if-eqz v0, :navigate
                    return-void
                """,
                ExternalLabel("navigate", getInstruction(0))
            )
        }
    }
}
