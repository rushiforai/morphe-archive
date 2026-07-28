package app.template.patches.rustore.mine

import app.morphe.patcher.Fingerprint

/**
 * Matches the `MineDestination` content lambda constructor whose boolean
 * selects between `MineV2Screen` and the classic `MineScreen`.
 */
object MineDestinationClassicFlagFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Z"),
    custom = { method, classDef ->
        classDef.sourceFile == "MineDestination.kt" &&
            method.implementation != null
    },
)
