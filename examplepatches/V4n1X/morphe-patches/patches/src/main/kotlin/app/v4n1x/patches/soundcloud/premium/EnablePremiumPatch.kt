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
        // Force Features to be enabled directly where they are parsed
        FeatureConstructorFingerprint.method.addInstructions(
            1,
            """
                const-string v0, "offline_sync"
                invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :cond_offline
                const/4 p2, 0x1
                :cond_offline
                
                const-string v0, "no_audio_ads"
                invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :cond_ads
                const/4 p2, 0x1
                :cond_ads
                
                const-string v0, "hq_audio"
                invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :cond_hq
                const/4 p2, 0x1
                :cond_hq
            """.trimIndent()
        )

        // Override UserConsumerPlan to Go+ High Tier
        UserConsumerPlanConstructorFingerprint.method.addInstructions(
            0,
            """
                const-string p1, "high_tier"
                const-string p5, "go-plus"
                const-string p6, "SoundCloud Go+"
            """.trimIndent()
        )

        // Prevent offboarding / downgrades
        GetDowngradeTierFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/configuration/plans/Tier;->HIGH:Lcom/soundcloud/android/configuration/plans/Tier;
                return-object v0
            """.trimIndent()
        )

        // Disable upsells
        MapToPlanFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/upsell/UpsellType${'$'}None;->INSTANCE:Lcom/soundcloud/android/upsell/UpsellType${'$'}None;
                return-object v0
            """.trimIndent()
        )

        // Disable AdPlacements
        AdPlacementConfigCtorFingerprint.matchAll().forEach { match ->
            val parameterOffset = if (match.method.parameterTypes.firstOrNull() == "I") 1 else 0
            match.method.addInstructions(
                0,
                listOf(1, 2, 3).joinToString("\n") { "const/4 p${parameterOffset + it}, 0x0" }
            )
        }
    }
}
