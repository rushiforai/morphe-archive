package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.truecaller.shared.overrideFeatureToggle

private const val CONTACT_TYPE = "Lcom/truecaller/enterpriseinfo/api/model/ContactType;"

@Suppress("unused")
val hideBusinessMediaPatch = bytecodePatch(
    name = "Hide business media",
    description = "Hides brand images, videos and campaign cards on business contacts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. Brand images: every BusinessDetailsModel is built with an empty brandMedia list. Its
        // readers (the screen, its carousel items, the media-shown analytics) all check isEmpty or
        // iterate by size, so nothing is laid out or reported.
        val modelClass = BusinessDetailsModelToStringFingerprint.classDef
        val constructor = modelClass.methods.firstOrNull { method ->
            method.name == "<init>" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) == listOf(
                    "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", CONTACT_TYPE,
                    "Ljava/lang/String;", "Ljava/util/ArrayList;",
                )
        } ?: throw PatchException("${modelClass.type} has no (String, String, String, ContactType, String, ArrayList) constructor")
        // p6 is the brandMedia parameter; /range reaches it whatever the register count.
        constructor.addInstructionsChecked(
            0,
            """
                new-instance p6, Ljava/util/ArrayList;
                invoke-direct/range {p6 .. p6}, Ljava/util/ArrayList;-><init>()V
            """,
        )

        // 2. Promo video: the screen's nullable video thumbnail slot (Function2, p4) is cleared on
        // entry. With no brand images and no video the screen skips the carousel and keeps its
        // usual padding above the description. The recompose lambda passes p4 back in, which is
        // cleared again.
        val screen = BusinessDetailsScreenFingerprint.method
        if (screen.parameterTypes[1].toString() != modelClass.type) {
            throw PatchException("BusinessDetailsScreen takes ${screen.parameterTypes[1]}, not ${modelClass.type}")
        }
        // const/16 takes any register below v256 (p4 is v40 in 26.40.5); 0 is null for an object.
        screen.addInstructionsChecked(0, "const/16 p4, 0x0")

        // 3. Verified business campaign cards. Each surface ORs its own toggle with the master one,
        // so all of them are overridden in the toggle resolver:
        // - "featureBizVerifiedCampaigns" (master): in-call, after-call (ACS) and PACS gates.
        // - "featureBizVerifiedCampaignForOutgoingCalls": outgoing-call screens, checked when the
        //   master is off.
        // - "featureBizVerifiedCampaignInRevampedInCallUi": the revamped in-call screen.
        // - "featureBizVerifiedCampaignsCarouselACS": the after-call campaign carousel.
        // - "featureBizVerifiedCampaignsDetailsView", "featureBizVerifiedCampaignsCarouselDetailsView"
        //   and "featureBizVerifiedCampaignsDV3": the details view campaign card and carousel
        //   widgets and their fetches.
        // Message ID campaigns (featureBizVerifiedCampaignsMID*) are left alone.
        for (key in listOf(
            "featureBizVerifiedCampaigns",
            "featureBizVerifiedCampaignForOutgoingCalls",
            "featureBizVerifiedCampaignInRevampedInCallUi",
            "featureBizVerifiedCampaignsCarouselACS",
            "featureBizVerifiedCampaignsDetailsView",
            "featureBizVerifiedCampaignsCarouselDetailsView",
            "featureBizVerifiedCampaignsDV3",
        )) {
            overrideFeatureToggle(key, false)
        }
    }
}
