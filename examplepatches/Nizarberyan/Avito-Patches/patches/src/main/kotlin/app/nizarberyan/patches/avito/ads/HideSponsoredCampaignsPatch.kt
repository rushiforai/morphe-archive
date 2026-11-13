package app.nizarberyan.patches.avito.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.nizarberyan.patches.avito.shared.Constants.COMPATIBILITY_AVITO

@Suppress("unused")
val hideSponsoredCampaignsPatch = patch(
    name = "Hide sponsored campaigns",
    description = "Removes the sponsored campaigns Avito serves itself on every screen: " +
        "the sticky banner, notification ads, swipe-up ads and touching points.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AVITO)

    execute {
        // Fail every request to the campaign server before it is sent. All callers handle
        // a failed request as "no campaign", so nothing is shown and nothing is tracked.
        sponsoredCampaignRequestMethods.forEach { name ->
            Fingerprint(
                definingClass = MEDIA_SERVER_API_CLASS,
                name = name,
                returnType = "Ljava/lang/Object;",
            ).method.addInstructions(
                0,
                """
                    new-instance v0, Ljava/io/IOException;
                    const-string v1, "Sponsored campaigns are disabled"
                    invoke-direct { v0, v1 }, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
                    throw v0
                """,
            )
        }
    }
}
