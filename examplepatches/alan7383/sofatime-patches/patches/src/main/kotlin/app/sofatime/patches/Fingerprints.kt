package app.sofatime.patches

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
    custom = custom@{ method, _ ->
        val impl = method.implementation ?: return@custom false
        !impl.instructions.any { it.opcode?.name?.startsWith("invoke") == true }
    }
)

val crashlyticsRegistrarGetComponents = Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;",
    name = "getComponents",
    returnType = "Ljava/util/List;"
)

val sessionsRegistrarGetComponents = Fingerprint(
    definingClass = "Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;",
    name = "getComponents",
    returnType = "Ljava/util/List;"
)
