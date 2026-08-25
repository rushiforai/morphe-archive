package app.template.patches.rustore.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.auth.disableVkIdAuthPrompt
import app.template.patches.rustore.gaming.disableGamingProfile
import app.template.patches.rustore.loyalty.disableLoyaltyProgram
import app.template.patches.rustore.navigation.hideFeaturedAndGamesTabs
import app.template.patches.rustore.notifications.hideNotificationButtons
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description =
        "Removes advertisements, search recommendations, and the unsolicited " +
            "VK ID prompt, with options for additional interface cleanup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    val disableGamingProfileOption by booleanOption(
        key = "disableGamingProfile",
        default = true,
        title = "Disable gaming profile",
        description = "Removes the Game Profile section and usage statistics screen.",
    )
    val disableLoyaltyProgramOption by booleanOption(
        key = "disableLoyaltyProgram",
        default = true,
        title = "Disable loyalty program",
        description =
            "Disables loyalty onboarding, points, notifications, links, and " +
                "cashback banners.",
    )
    val hideFeaturedAndGamesTabsOption by booleanOption(
        key = "hideFeaturedAndGamesTabs",
        default = true,
        title = "Hide Featured and Games tabs",
        description = "Removes the Featured and Games tabs and opens Apps by default.",
    )
    val hideNotificationButtonsOption by booleanOption(
        key = "hideNotificationButtons",
        default = true,
        title = "Hide notification buttons",
        description = "Removes notification buttons from the search bar and Mine screen.",
    )

    execute {
        disableVkIdAuthPrompt()

        RawAdvertisementRepoGetFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v0
                    return-object v0
                """,
            )

        PersonalRecommendationAdvertisementRepoGetFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v0
                    check-cast v0, Ljava/io/Serializable;
                    return-object v0
                """,
            )

        PromoRepositoryGetFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v0
                    check-cast v0, Ljava/io/Serializable;
                    return-object v0
                """,
            )

        SearchZeroContentConstructorFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    const/4 p1, 0x0
                    const/4 p2, 0x0
                    const/4 p4, 0x0
                """,
            )

        if (disableGamingProfileOption != false) {
            disableGamingProfile()
        }
        if (disableLoyaltyProgramOption != false) {
            disableLoyaltyProgram()
        }
        if (hideFeaturedAndGamesTabsOption != false) {
            hideFeaturedAndGamesTabs()
        }
        if (hideNotificationButtonsOption != false) {
            hideNotificationButtons()
        }
    }
}
