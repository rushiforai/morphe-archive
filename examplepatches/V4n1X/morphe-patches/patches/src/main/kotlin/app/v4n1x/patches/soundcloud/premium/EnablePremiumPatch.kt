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
    name = "Enable SoundCloud Go",
    description = "Enables the local SoundCloud Go plan controls and the offline_sync, no_audio_ads and " +
        "hq_audio feature switches, hides Go upsells and fan plan-transition screens, and disables client " +
        "ad requests and display placements. SoundCloud's servers still decide which streams, downloads and " +
        "audio quality the account may fetch: high-bitrate audio and encrypted offline copies require a real " +
        "Go+ subscription.",
) {
    compatibleWith(COMPATIBILITY_SOUNDCLOUD)

    execute {
        // Force Features to be enabled directly where they are parsed.
        val featureConstructor = FeatureConstructorFingerprint.method
        val featureClass = mutableClassDefBy(featureConstructor.definingClass)
        val patchedConstructor = featureConstructor.enablePremiumFeatures()
        featureClass.methods.remove(featureConstructor)
        featureClass.methods.add(patchedConstructor)

        // Override UserConsumerPlan to the Go+ High Tier. The plan type stays
        // "go-plus" so the client features remain available; the title is the
        // honest local label shown in the app.
        UserConsumerPlanConstructorFingerprint.method.addInstructions(
            0,
            """
                const-string p1, "high_tier"
                const-string p5, "go-plus"
                const-string p6, "SoundCloud Go"
            """.trimIndent()
        )

        // Keep the cached plan and tier reads consistent with the parsed plan.
        CurrentTierFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/configuration/plans/Tier;->HIGH:Lcom/soundcloud/android/configuration/plans/Tier;
                return-object v0
            """.trimIndent()
        )
        CurrentConsumerPlanFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/configuration/plans/ConsumerPlan;->GO_PLUS:Lcom/soundcloud/android/configuration/plans/ConsumerPlan;
                return-object v0
            """.trimIndent()
        )

        // Prevent offboarding / downgrades.
        GetDowngradeTierFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/configuration/plans/Tier;->HIGH:Lcom/soundcloud/android/configuration/plans/Tier;
                return-object v0
            """.trimIndent()
        )

        // Disable upsells.
        MapToPlanFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/soundcloud/android/upsell/UpsellType${'$'}None;->INSTANCE:Lcom/soundcloud/android/upsell/UpsellType${'$'}None;
                return-object v0
            """.trimIndent()
        )

        // Suppress the fan-facing Go/Go+ onboarding and offboarding screens.
        // The offboarding overload gained a RootActivity parameter in newer
        // releases, so apply whichever signature this version has.
        listOf(
            SuppressOffboardingTransitionFingerprint,
            SuppressOffboardingTransitionLegacyFingerprint,
        ).forEach { fingerprint ->
            fingerprint.matchOrNull()?.method?.addInstructions(0, "return-void")
        }
        SuppressOnboardingTransitionFingerprint.method.addInstructions(0, "return-void")

        // The forced no_audio_ads switch already covers this, but keep the
        // explicit ad gates off as well.
        ShouldRequestAdsFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        MonetizableAdGeoFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Disable ad placements by clearing only the enabled flag. The GAM and
        // Aditude configuration objects stay intact because they are still read
        // elsewhere; nulling them risks a NullPointerException.
        AdPlacementConfigCtorFingerprint.matchAll().forEach { match ->
            val method = match.method
            val enabledIndex = method.parameterTypes.indexOfFirst { it == "Z" }
            check(enabledIndex >= 0) {
                "SoundCloud AdPlacementConfiguration constructor has no enabled flag: ${method.parameterTypes}"
            }
            // p0 is the receiver, so parameter index 0 is p1. Emitting the
            // parameter-relative register avoids depending on the local count.
            method.addInstructions(0, "const/4 p${enabledIndex + 1}, 0x0")
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
