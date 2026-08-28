package app.mctoolbox.patches.premium

import app.morphe.patcher.Fingerprint

/**
 * tz0.smali - Decision point for premium overlay.
 * Checks ya0.Q, if true → runs premium overlay Runnable (crashes).
 * If false → runs normal Runnable.
 * We bypass the Q check to always run the normal path.
 */
object PopupDecisionFingerprint : Fingerprint(
    definingClass = "Ltz0;",
    name = "a",
    returnType = "V",
    parameters = listOf()
)

/**
 * ya0.smali - Premium state holder.
 */
object SetPremiumStateFingerprint : Fingerprint(
    definingClass = "Lya0;",
    name = "H",
    returnType = "V",
    parameters = listOf("Z")
)
