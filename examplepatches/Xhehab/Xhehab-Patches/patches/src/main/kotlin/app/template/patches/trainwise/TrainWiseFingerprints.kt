package app.template.patches.trainwise

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// CustomerInfo map mapper - converts CustomerInfo to a Map sent to React Native
val CustomerInfoMapFingerprint = Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/CustomerInfoMapperKt;",
    name = "map",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    returnType = "Ljava/util/Map;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL)
)
