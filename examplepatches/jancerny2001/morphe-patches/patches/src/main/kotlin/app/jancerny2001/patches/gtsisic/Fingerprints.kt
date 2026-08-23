package app.jancerny2001.patches.gtsisic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall

object SecureFlagClassFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("Landroid/view/Window;", "Z", "L")
)

object SecureFlagMethodFingerprint : Fingerprint(
    classFingerprint = SecureFlagClassFingerprint,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        literal(8192),
        methodCall("Landroid/view/Window;->addFlags(I)V"),
        methodCall("Landroid/view/Window;->clearFlags(I)V")
    )
)