package app.v4n1x.patches.soundcloud.premium

import app.morphe.patcher.Fingerprint

// Plan / tier

/** Matches `UserConsumerPlan.<init>()` — constructs the user's plan object from backend data. */
object UserConsumerPlanConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/plans/UserConsumerPlan;",
    name = "<init>",
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
        "Ljava/lang/String;",
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

/** Matches `ConfigurationSettingsStorage.b()` — reads `pending_plan_downgrade` and returns the Tier. */
object GetDowngradeTierFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/data/ConfigurationSettingsStorage;",
    name = "b",
    returnType = "Lcom/soundcloud/android/configuration/plans/Tier;",
    parameters = emptyList(),
)

/** Matches `mapToPlan()` — maps backend upselling data to plan visibility.
 * Class is `RemoteUpsellVisibilityController` in 2026.07.03 and `UpsellVisibilityController` in 2026.08.19. */
object MapToPlanFingerprint : Fingerprint(
    name = "mapToPlan",
    returnType = "Lcom/soundcloud/android/upsell/UpsellType;",
)

// Tier/plan state

/** Matches `DefaultFeatureOperations.getCurrentTier()` — returns the active tier from local config. */
object GetCurrentTierFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Lcom/soundcloud/android/configuration/plans/Tier;",
    parameters = emptyList(),
)

/** Matches `DefaultFeatureOperations.getCurrentConsumerPlan()` — returns the active ConsumerPlan from local config. */
object GetCurrentConsumerPlanFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Lcom/soundcloud/android/configuration/plans/ConsumerPlan;",
    parameters = emptyList(),
)

/** Matches `DefaultFeatureOperations.getCurrentConsumerPlanTitle()` — returns the active ConsumerPlan title. */
object GetCurrentConsumerPlanTitleFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    name = "getCurrentConsumerPlanTitle",
)

// Ad blocking

/** Matches `DefaultFeatureOperations.getShouldRequestAds()` — determines whether ads should be requested. */
object GetShouldRequestAdsFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Z",
    parameters = emptyList(),
    name = "getShouldRequestAds",
)

/** Matches `DefaultFeatureOperations.isMonetizableAdGeo()` — returns whether ads can be monetized. */
object IsMonetizableAdGeoFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Z",
    parameters = emptyList(),
    name = "isMonetizableAdGeo",
)

// Offline & High Quality Audio features in DefaultFeatureOperations

/** Matches `DefaultFeatureOperations.isOfflineContentEnabled()` — returns whether offline content is enabled. */
object IsOfflineContentEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Z",
    parameters = emptyList(),
    name = "isOfflineContentEnabled",
)

/** Matches `DefaultFeatureOperations.isHighQualityAudioEnabled()` — returns whether high quality audio is enabled. */
object IsHighQualityAudioEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Z",
    parameters = emptyList(),
    name = "isHighQualityAudioEnabled",
)

/** Matches `DefaultFeatureOperations.getUpsellOfflineContent()` — returns whether offline upsell should show. */
object GetUpsellOfflineContentFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Z",
    parameters = emptyList(),
    name = "getUpsellOfflineContent",
)

/** Matches `DefaultFeatureOperations.getUpsellHighQualityAudio()` — returns whether HQ audio upsell should show. */
object GetUpsellHighQualityAudioFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Z",
    parameters = emptyList(),
    name = "getUpsellHighQualityAudio",
)

/** Matches `DefaultFeatureOperations.getUpsellHighTier()` — returns whether High tier upsell should show. */
object GetUpsellHighTierFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Z",
    parameters = emptyList(),
    name = "getUpsellHighTier",
)

/** Matches `DefaultFeatureOperations.getUpsellBothTiers()` — returns whether dual-tier upsell should show. */
object GetUpsellBothTiersFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Z",
    parameters = emptyList(),
    name = "getUpsellBothTiers",
)

/** Matches `DefaultFeatureOperations.getUpsellRemoveAudioAds()` — returns whether remove-ads upsell should show. */
object GetUpsellRemoveAudioAdsFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/features/DefaultFeatureOperations;",
    returnType = "Z",
    parameters = emptyList(),
    name = "getUpsellRemoveAudioAds",
)

/** Matches `OfflineListeningIndividualTracksExperiment.a()` — enables individual track download buttons in UI. */
object OfflineListeningIndividualTracksExperimentFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/features/offlinelisteningtracksexp/OfflineListeningIndividualTracksExperiment;",
    returnType = "Z",
    parameters = emptyList(),
    name = "a",
)
