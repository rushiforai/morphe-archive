package app.linkedin.patches.feed

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
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
val feedFiltersPatch = bytecodePatch(
    name = "Feed filters",
    description = "Adds optional filters (off by default, turned on in Michii Patches): focus mode, " +
        "celebrations, job cards, reposts, video posts, the \"New posts\" pill and \"See translation\".",
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
private object NavPanelPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/navpanel/HomeNavPanelTransformer;",
    name = "toPremiumViewData",
    parameters = listOf("Lcom/linkedin/android/pegasus/dash/gen/voyager/dash/premium/PremiumUpsellSlotContent;"),
)

@Suppress("unused")
val hidePremiumUpsellsPatch = bytecodePatch(
    name = "Hide Premium upsells",
    description = "Removes Premium and AI upsell cards and banners, including on profiles and the Me panel.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(sduiComponentFilterPatch)
    execute {
        markIncluded("isHidePremiumIncluded")

        NavPanelPremiumFingerprint.method.apply {
            // At method entry every local register is free, so v0 can be used as scratch.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $SETTINGS_CLASS->hideNavPanelUpsell()Z
                    move-result v0
                    if-eqz v0, :keep
                    const/4 v0, 0x0
                    move-object/from16 p1, v0
                """,
                ExternalLabel("keep", getInstruction(0))
            )
        }
    }
}
