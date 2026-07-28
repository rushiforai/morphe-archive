package app.sofatime.fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

val premiumStateClassFingerprint = Fingerprint(
    strings = listOf("PremiumState(purchased=")
)

val isPurchasedFingerprint = Fingerprint(
    classFingerprint = premiumStateClassFingerprint,
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(
        methodCall(definingClass = "Ljava/time/Instant;", name = "now")
    )
)
