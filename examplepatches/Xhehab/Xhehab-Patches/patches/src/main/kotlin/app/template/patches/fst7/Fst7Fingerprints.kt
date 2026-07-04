package app.template.patches.fst7

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

val Fst7HybridGetActiveSubscriptionsFingerprint = Fingerprint(
    definingClass = "Lcom/margelo/nitro/iap/HybridRnIap\$getActiveSubscriptions\$1;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

val Fst7HybridHasActiveSubscriptionsFingerprint = Fingerprint(
    definingClass = "Lcom/margelo/nitro/iap/HybridRnIap\$hasActiveSubscriptions\$1;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)
