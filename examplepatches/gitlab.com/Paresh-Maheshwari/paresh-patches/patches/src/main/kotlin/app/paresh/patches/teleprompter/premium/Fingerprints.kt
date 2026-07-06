package app.paresh.patches.teleprompter.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

object EntitlementCheckFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
            name = "getEntitlements"
        ),
        methodCall(
            definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
            name = "getActive"
        )
    )
)
