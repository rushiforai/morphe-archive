package app.morphe.patches.teamsnap.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object HasTeamSnapPlusTier1Fingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/teamsnap/teamsnap/subscription/SubscriptionManager\$SubscriptionState;"),
)

object GetCachedHasAdFreeSubscriptionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        method.name == "getCachedHasAdFreeSubscription" &&
        classDef.type == "Lcom/teamsnap/teamsnap/core/data/sharedprefs/AppPrefs;"
    },
)

object CanDisplayAdsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("I"),
    custom = { method, classDef ->
        method.name == "canDisplayAds" &&
        classDef.type == "Lcom/teamsnap/teamsnap/core/advertising/context/AdContext;"
    },
)
