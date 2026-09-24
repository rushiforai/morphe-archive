package com.dowjames.patches.thinkdirty

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * Local premium state getter: m6h.l()Lo6h;
 *
 * This is the app's SharedPreferences-backed premium state object.
 * Patching it makes every local premium feature check see an active
 * premium profile.
 */
object PremiumStateGetterFingerprint : Fingerprint(
    definingClass = "Lm6h;",
    name = "l",
    returnType = "Lo6h;",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getString",
        )
    )
)

/**
 * Premium level check: m6h.n(Ljava/lang/Integer;)Z
 *
 * Used by feature gates that compare the current premium level against
 * a required level.
 */
object PremiumLevelCheckFingerprint : Fingerprint(
    definingClass = "Lm6h;",
    name = "n",
    returnType = "Z",
    parameters = listOf("Ljava/lang/Integer;"),
    filters = listOf(
        methodCall(
            definingClass = "Lm6h;",
            name = "l",
        )
    )
)
