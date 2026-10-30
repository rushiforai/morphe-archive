package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val SETTINGS_CLASS = "$EXTENSION_PACKAGE/Settings;"

// The filtering itself lives in the extension's SduiComponentFilter; these patches switch it on.

@Suppress("unused")
val hideSuggestedPostsPatch = bytecodePatch(
    name = "Hide suggested posts",
    description = "Removes \"Suggested\" posts from outside your network from the feed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")
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
    category("Ads")
    dependsOn(sduiComponentFilterPatch)
    execute { markIncluded("isHidePromotedJobsIncluded") }
}

@Suppress("unused")
val feedFiltersPatch = bytecodePatch(
    name = "Feed filters",
    description = "Adds optional filters (off by default, turned on in Fakh Patches): focus mode, " +
        "celebrations, job cards, network activity (likes, comments, reposts), video posts, \"Recommended for you\", puzzle games, the \"New posts\" pill and \"Show translation\".",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")
    dependsOn(sduiComponentFilterPatch)
    execute { markIncluded("isFeedFiltersIncluded") }
}

/**
 * The HomeNavPanelFeature lambda that reads HomeNavPanelAggregateResponse.upsellSlotContent and builds the
 * "Try Premium" card in the native "Me" panel (inlined there from HomeNavPanelTransformer.toPremiumViewData
 * in 4.1.1264). With a null slot it shows nothing for free members (and still shows "Access my Premium" for
 * actual Premium members).
 */
private object NavPanelPremiumFingerprint : Fingerprint(
    name = "invoke",
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/linkedin/android/home/navpanel/HomeNavPanelAggregateResponse;",
            name = "upsellSlotContent",
        ),
    )
)

@Suppress("unused")
val hidePremiumUpsellsPatch = bytecodePatch(
    name = "Hide Premium upsells",
    description = "Removes Premium and AI upsell cards and banners, including on profiles and the profile menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Ads")
    dependsOn(sduiComponentFilterPatch)
    execute {
        markIncluded("isHidePremiumIncluded")

        NavPanelPremiumFingerprint.let {
            val index = it.instructionMatches.first().index
            val register = it.method.getInstruction<TwoRegisterInstruction>(index).registerA
            it.method.addInstructions(
                index + 1,
                """
                    invoke-static { v$register }, $SETTINGS_CLASS->navPanelUpsell(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, Lcom/linkedin/android/pegasus/dash/gen/voyager/dash/premium/PremiumUpsellSlotContent;
                """
            )
        }
    }
}
