package com.torbenstriegel.morphe.patches.wetterradar.premium

import app.morphe.patcher.Fingerprint

// Version 2026.21: R8 reuses the old names for unrelated classes.
object FusedAccessCombine202621Fingerprint : Fingerprint(
    definingClass = "Lzf5;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;"
)

object AccessLevel202621Fingerprint : Fingerprint(
    definingClass = "Ldg5;",
    name = "d",
    parameters = listOf("Lat2;"),
    returnType = "Ljava/lang/Enum;"
)

object FusedAccessCombineFingerprint : Fingerprint(
    definingClass = "Ld95;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;")
)

/**
 * The FusedAccessProvider's AccessLevel decision.
 *
 * [Lg95;.d] is the suspend function returning the access enum [Lo6;]
 * (b = SUBSCRIPTION, c = MEMBERSHIP, d = LOGIN, e = NONE). The UI switches on
 * `o6.ordinal()` to decide whether to show paywall/upgrade surfaces.
 */
object AccessLevelFingerprint : Fingerprint(
    definingClass = "Lg95;",
    name = "d",
    parameters = listOf("Lvo2;")
)