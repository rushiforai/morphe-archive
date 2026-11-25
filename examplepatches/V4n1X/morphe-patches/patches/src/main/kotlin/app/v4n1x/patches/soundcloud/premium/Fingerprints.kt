package app.v4n1x.patches.soundcloud.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object FeatureConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/plans/Feature;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
        "Ljava/util/List;",
    )
)

object UserConsumerPlanConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/plans/UserConsumerPlan;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
        "Ljava/lang/String;",
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Ljava/lang/String;"
    )
)

object CurrentTierFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    name = "getCurrentTier",
    returnType = "Lcom/soundcloud/android/configuration/plans/Tier;"
)

object CurrentConsumerPlanFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    name = "getCurrentConsumerPlan",
    returnType = "Lcom/soundcloud/android/configuration/plans/ConsumerPlan;"
)

object GetDowngradeTierFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/data/ConfigurationSettingsStorage;",
    strings = listOf("pending_plan_downgrade"),
    returnType = "Lcom/soundcloud/android/configuration/plans/Tier;"
)

object MapToPlanFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/upsell/UpsellVisibilityController;",
    name = "mapToPlan"
)

object SuppressOffboardingTransitionFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/DefaultConfigurationUpdatesLifecycleObserver;",
    name = "c",
    returnType = "V",
    parameters = listOf(
        "Lcom/soundcloud/android/payments/plantransitions/pub/PlanInTransition\$Fan;",
        "Lcom/soundcloud/android/payments/plantransitions/pub/TransitionType\$Offboarding;",
        "J",
        "J",
        "Ljava/lang/String;"
    )
)

object SuppressOffboardingTransitionLegacyFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/DefaultConfigurationUpdatesLifecycleObserver;",
    name = "c",
    returnType = "V",
    parameters = listOf(
        "Lcom/soundcloud/android/architecture/view/RootActivity;",
        "Lcom/soundcloud/android/payments/plantransitions/pub/PlanInTransition\$Fan;",
        "Lcom/soundcloud/android/payments/plantransitions/pub/TransitionType\$Offboarding;",
        "J",
        "J",
        "Ljava/lang/String;"
    )
)

object SuppressOnboardingTransitionFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/DefaultConfigurationUpdatesLifecycleObserver;",
    name = "d",
    returnType = "V",
    parameters = listOf(
        "Lcom/soundcloud/android/payments/plantransitions/pub/PlanInTransition\$Fan;",
        "Lcom/soundcloud/android/payments/plantransitions/pub/TransitionType\$Onboarding;",
        "J",
        "J",
        "Ljava/lang/String;"
    )
)

object ShouldRequestAdsFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    name = "getShouldRequestAds",
    returnType = "Z"
)

object MonetizableAdGeoFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    name = "isMonetizableAdGeo",
    returnType = "Z"
)

object AdPlacementConfigCtorFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/ads/display/data/config/AdPlacementConfiguration;",
    name = "<init>"
)
