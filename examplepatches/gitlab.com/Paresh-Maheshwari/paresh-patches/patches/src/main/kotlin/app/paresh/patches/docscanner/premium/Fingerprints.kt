package app.paresh.patches.docscanner.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Find the class via product ID strings in its static constructor
private val premiumClassFingerprint = Fingerprint(
    strings = listOf("com.cv.proversion", "com.cv.large_amount")
)

// Target b() in that class: public static Z(), calls two static Z methods, has if-eqz branch
object IsPremiumFingerprint : Fingerprint(
    classFingerprint = premiumClassFingerprint,
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(),
    filters = listOf(
        methodCall(returnType = "Z"),
        methodCall(returnType = "Z")
    )
)
