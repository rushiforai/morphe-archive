package app.template.patches.videoplayer

import app.morphe.patcher.Fingerprint

val VideoPlayerPurchaseListContainsUnlockFingerprint = Fingerprint(
    definingClass = "Lg02;",
    name = "J",
    parameters = listOf("Ljava/util/List;"),
    returnType = "Z"
)

val VideoPlayerSetAdFreeModeFingerprint = Fingerprint(
    definingClass = "Lf11;",
    name = "k",
    parameters = listOf("Z"),
    returnType = "V"
)

val VideoPlayerBillingStateGetters = listOf(
    Fingerprint(
        definingClass = "Lg02\$b;",
        name = "a",
        parameters = listOf("Lg02\$b;"),
        returnType = "Z"
    ),
    Fingerprint(
        definingClass = "Lg02\$b;",
        name = "c",
        parameters = listOf("Lg02\$b;"),
        returnType = "Z"
    ),
    Fingerprint(
        definingClass = "Lg02\$b;",
        name = "e",
        parameters = emptyList(),
        returnType = "Z"
    ),
    Fingerprint(
        definingClass = "Lg02\$b;",
        name = "f",
        parameters = emptyList(),
        returnType = "Z"
    )
)
