package app.riky.patches.komoot

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_KOMOOT

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium features",
    description = "Unlock Premium features. Some features are not possible to patch " +
        "(server sided), such as saving a multi-days hike.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KOMOOT)

    execute {
        // Force premium=true when server config is deserialized into AppConfigV3.
        AppConfigV3Fingerprint.method.addInstruction(
            0,
            "sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
        )

        // Force premium=true on public user profiles parsed from API responses.
        PublicUserProfileV7Fingerprint.method.addInstruction(
            0,
            "const/4 p5, 0x1",
        )

        // Force routing permission to GRANTED so navigation is not paywalled client-side.
        // Primary constructor: getClass -> super.<init> -> iput-object mStatus (index 2).
        RoutingPermissionInitFingerprint.method.addInstruction(
            2,
            """
                sget-object p1, Lde/komoot/android/services/api/model/RoutingPermission${'$'}StatusPermission;->GRANTED:Lde/komoot/android/services/api/model/RoutingPermission${'$'}StatusPermission;
            """,
        )
    }
}
