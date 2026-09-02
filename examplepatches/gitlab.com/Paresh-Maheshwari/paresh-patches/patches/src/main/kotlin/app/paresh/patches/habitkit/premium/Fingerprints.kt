package app.paresh.patches.habitkit.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// RevenueCat EntitlementInfo.isActive()
object EntitlementIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// RevenueCat SubscriptionInfo.isActive()
object SubscriptionInfoIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/SubscriptionInfo;",
    name = "isActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// EntitlementInfosMapperKt.map() — serializes entitlements for the purchases_flutter bridge
object EntitlementInfosMapFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
    returnType = "Ljava/util/Map;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
)
