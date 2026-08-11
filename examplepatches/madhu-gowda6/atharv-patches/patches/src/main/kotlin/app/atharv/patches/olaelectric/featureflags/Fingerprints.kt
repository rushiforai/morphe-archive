package app.atharv.patches.olaelectric.featureflags

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * domain.domainModels.onBoarding.OnBoardingFeaturesEntity.getStatus()
 *
 * This is the single choke point read by every ModelsKt helper (isFeatureEnabled,
 * isFeatureAvailable, isFeatureNullOrReturnEnabled, isTechPackPurchased,
 * isTechPackPurchasePending, etc.) to decide whether a server-driven onboarding feature is
 * SHOW / DISABLE / HIDE. Class and method names are not obfuscated in this app build
 * (verified against smali), so they are safe to reference directly.
 */
object OnBoardingFeatureStatusFingerprint : Fingerprint(
    definingClass = "Ldomain/domainModels/onBoarding/OnBoardingFeaturesEntity;",
    name = "getStatus",
    returnType = "Ldomain/domainModels/onBoarding/OnBoardingFeatureVisibility;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)
