package app.logm1lo.patches.calistree.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object GetActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/Map;",
    parameters = listOf(),
    filters = listOf(fieldAccess(
        opcode = Opcode.IGET_OBJECT, definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
        name = "active", type = "Ljava/util/Map;",
    ))
)

internal object GetActiveSubsFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/Set;",
    parameters = listOf(),
    filters = listOf(fieldAccess(
        opcode = Opcode.IGET_OBJECT, definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
        name = "activeSubscriptions\$delegate", type = "Lkm/j;",
    ))
)

internal object EntitlementMapFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/util/Map;",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
    filters = listOf(methodCall(
        opcode = Opcode.INVOKE_VIRTUAL, definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
        name = "getAll", returnType = "Ljava/util/Map;", parameters = listOf(),
    ))
)

internal object AllPurchasedIdsFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/Set;",
    parameters = listOf(),
    filters = listOf(fieldAccess(
        opcode = Opcode.IGET_OBJECT, definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
        name = "allPurchasedProductIds\$delegate", type = "Lkm/j;",
    ))
)

internal object CustomerInfoMapFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/CustomerInfoMapperKt;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/util/Map;",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            definingClass = "Llm/o0;",
            name = "l",
            returnType = "Ljava/util/Map;",
            parameters = listOf("[Lkm/p;"),
        ),
    )
)
