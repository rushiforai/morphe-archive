package app.atharv.patches.olaelectric.featureflags

import app.atharv.patches.olaelectric.shared.Constants.COMPATIBILITY_OLA_ELECTRIC
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val forceEnableFeaturesPatch = bytecodePatch(
    name = "Force enable Megaphone, Tamper Detection, Krutrim and Kruti",
    description = "Forces the Megaphone, Tamper & Fall Detection, Krutrim Assistant, and Kruti " +
        "features to always report as available, regardless of the server-driven onboarding " +
        "feature flags returned by the app's backend."
) {
    compatibleWith(COMPATIBILITY_OLA_ELECTRIC)
    extendWith("extensions/extension.mpe")

    execute {
        // Prepend an override check to getStatus(): if the entity's raw feature key matches
        // one of our target features, always return SHOW before the original field read runs.
        OnBoardingFeatureStatusFingerprint.method.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, Ldomain/domainModels/onBoarding/OnBoardingFeaturesEntity;->featureType:Ljava/lang/String;
                invoke-static { v0 }, Lapp/atharv/extension/olaelectric/FeatureOverridePatch;->shouldForceEnable(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :original
                sget-object v0, Ldomain/domainModels/onBoarding/OnBoardingFeatureVisibility;->SHOW:Ldomain/domainModels/onBoarding/OnBoardingFeatureVisibility;
                return-object v0
                :original
                nop
            """
        )
    }
}
