package app.template.patches.videoplayer

import app.morphe.patcher.Fingerprint

val VideoPlayerPurchaseListContainsUnlockFingerprint = Fingerprint(
    definingClass = "Lt62;",
    name = "M",
    parameters = listOf("Ljava/util/List;"),
    returnType = "Z"
)

val VideoPlayerSetAdFreeModeFingerprint = Fingerprint(
    definingClass = "Lj51;",
    name = "k",
    parameters = listOf("Z"),
    returnType = "V"
)

val VideoPlayerBillingStateGetters = listOf(
    Fingerprint(
        definingClass = "Lt62\$b;",
        name = "a",
        parameters = listOf("Lt62\$b;"),
        returnType = "Z"
    ),
    Fingerprint(
        definingClass = "Lt62\$b;",
        name = "c",
        parameters = listOf("Lt62\$b;"),
        returnType = "Z"
    ),
    Fingerprint(
        definingClass = "Lt62\$b;",
        name = "e",
        parameters = emptyList(),
        returnType = "Z"
    ),
    Fingerprint(
        definingClass = "Lt62\$b;",
        name = "f",
        parameters = emptyList(),
        returnType = "Z"
    )
)
