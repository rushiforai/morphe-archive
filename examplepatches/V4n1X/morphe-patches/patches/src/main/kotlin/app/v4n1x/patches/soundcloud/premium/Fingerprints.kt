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

object GetDowngradeTierFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/configuration/data/ConfigurationSettingsStorage;",
    strings = listOf("pending_plan_downgrade"),
    returnType = "Lcom/soundcloud/android/configuration/plans/Tier;"
)

object MapToPlanFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/upsell/UpsellVisibilityController;",
    name = "mapToPlan"
)

object AdPlacementConfigCtorFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/ads/display/data/config/AdPlacementConfiguration;",
    name = "<init>"
)
