package app.template.patches.hikingmap.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// These names and signatures are for version 1.16.6 (153). Fail on a different
// layout instead of guessing at another boolean in the billing code.
internal object PremiumInfoFingerprint : Fingerprint(
    definingClass = "Lzh4;",
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(string("PremiumInfo(currentOrder="), string(", isTrialUsed=")),
)

internal object PremiumAccessFingerprint : Fingerprint(
    definingClass = "Lzj4;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(methodCall(definingClass = "Lzh4;", name = "a", returnType = "Z")),
)

internal object PremiumFlowFingerprint : Fingerprint(
    definingClass = "Ljq;",
    name = "j",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Lft0;"),
    filters = listOf(
        methodCall(definingClass = "Lzh4;", name = "a", returnType = "Z"),
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "valueOf"),
    ),
)
