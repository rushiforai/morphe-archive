package app.v4n1x.patches.soundcloud.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.v4n1x.patches.soundcloud.shared.Constants.COMPATIBILITY_SOUNDCLOUD

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable SoundCloud Go+",
    description = "Enables SoundCloud Go+ premium features, offline listening, HQ audio, and disables audio/visual ads.",
) {
    compatibleWith(COMPATIBILITY_SOUNDCLOUD)

    execute {
        // Override plan construction with Go+ (High tier).
        UserConsumerPlanConstructorFingerprint.method.addInstructions(
            0,
            """
                const-string p1, "high_tier"
                const-string p5, "go-plus"
                const-string p6, "SoundCloud Go+"
            """,
        )

        GetDowngradeTierFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/configuration/plans/Tier;->HIGH:Lcom/soundcloud/android/configuration/plans/Tier;
                return-object v0
            """,
        )

        MapToPlanFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/upsell/UpsellType${'$'}None;->INSTANCE:Lcom/soundcloud/android/upsell/UpsellType${'$'}None;
                return-object v0
            """,
        )

        // Force current tier to HIGH and plan to Go+.
        GetCurrentTierFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/configuration/plans/Tier;->HIGH:Lcom/soundcloud/android/configuration/plans/Tier;
                return-object v0
            """,
        )

        GetCurrentConsumerPlanFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/configuration/plans/ConsumerPlan;->GO_PLUS:Lcom/soundcloud/android/configuration/plans/ConsumerPlan;
                return-object v0
            """,
        )

        GetCurrentConsumerPlanTitleFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "SoundCloud Go+"
                return-object v0
            """,
        )

        // Enable offline content
        IsOfflineContentEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Enable High Quality Audio (HQ Audio 256kbps AAC)
        IsHighQualityAudioEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Suppress Upsell overlays and paywalls
        GetUpsellOfflineContentFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        GetUpsellHighQualityAudioFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        GetUpsellHighTierFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        GetUpsellBothTiersFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        GetUpsellRemoveAudioAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Enable individual track download buttons in bottom sheets and track menus
        OfflineListeningIndividualTracksExperimentFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Disable ads
        GetShouldRequestAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        IsMonetizableAdGeoFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
