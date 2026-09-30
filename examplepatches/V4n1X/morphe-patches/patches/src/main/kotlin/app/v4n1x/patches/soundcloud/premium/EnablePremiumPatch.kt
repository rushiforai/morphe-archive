package app.v4n1x.patches.soundcloud.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.cloneMutable
import app.v4n1x.patches.soundcloud.shared.Constants.COMPATIBILITY_SOUNDCLOUD

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable SoundCloud Go+",
    description = "Enables SoundCloud Go+ premium features, offline listening, HQ audio, and disables audio/visual ads.",
) {
    compatibleWith(COMPATIBILITY_SOUNDCLOUD)

    execute {
        // Force Features to be enabled directly where they are parsed.
        val featureConstructor = FeatureConstructorFingerprint.method
        val featureClass = mutableClassDefBy(featureConstructor.definingClass)
        val patchedConstructor = featureConstructor.enablePremiumFeatures()
        featureClass.methods.remove(featureConstructor)
        featureClass.methods.add(patchedConstructor)

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

internal fun MutableMethod.enablePremiumFeatures(): MutableMethod {
    // This constructor has no locals in 2026.08.26: v0 is p0 (this). Reserve a
    // scratch register and let cloneMutable copy shifted parameters back into
    // the original register slots before executing the unchanged constructor.
    val patched = cloneMutable(name, accessFlags, parameters, returnType, 1)
    check(patched.implementation!!.registerCount <= 16) {
        "SoundCloud Feature constructor registers exceed the injected invoke format."
    }
    // Issue #2: plain addInstructions leaves inline branch labels attached to
    // temporary smali locations, producing invalid zero-offset branches.
    val continuation = patched.getInstruction(0)
    patched.addInstructionsWithLabels(
        0,
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
            if-eqz v0, :feature_continue
            const/4 p2, 0x1
        """.trimIndent(),
        ExternalLabel("feature_continue", continuation),
    )
    return patched
}
