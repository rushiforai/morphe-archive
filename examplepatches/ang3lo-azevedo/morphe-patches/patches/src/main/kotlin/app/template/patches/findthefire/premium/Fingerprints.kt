package app.template.patches.findthefire.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object EntitlementInfoIsActiveFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
)
