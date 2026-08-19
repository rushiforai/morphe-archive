package app.riky.patches.electron

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object CustomerInfoPremiumStateFingerprint : Fingerprint(
    definingClass = "Lcl5;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;")
)
