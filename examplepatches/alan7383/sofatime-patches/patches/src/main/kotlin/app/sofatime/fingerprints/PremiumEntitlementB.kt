package app.sofatime.fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

val premiumEntitlementClassFingerprint = Fingerprint(
    strings = listOf("PremiumEntitlement(premiumState=")
)

val isPremiumFingerprint = Fingerprint(
    classFingerprint = premiumEntitlementClassFingerprint,
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN),
        methodCall(returnType = "Z")
    )
)

val isPremiumPurchasedFingerprint = Fingerprint(
    classFingerprint = premiumEntitlementClassFingerprint,
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN),
        fieldAccess(opcode = Opcode.IGET_BOOLEAN)
    )
)
