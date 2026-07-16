package app.jouss.patches.plusmessenger.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER

object PremiumFeaturesBlockedFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "premiumFeaturesBlocked",
    returnType = "Z",
    parameters = listOf(),
)

object IsPremiumUserFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isPremiumUser",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)

object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/UserConfig;",
    name = "isPremium",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val plusPremiumPatch = bytecodePatch(
    name = "Plus Premium",
    description = "Unlocks premium feature UI and shows premium badge on self only."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        // Suppress "get premium" popups
        PremiumFeaturesBlockedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // UserConfig.isPremium() returns true - this is only for current user
        IsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // isPremiumUser(user) returns true only for self user
        IsPremiumUserFingerprint.method.addInstructions(0, """
            if-eqz p1, :not_self
            iget-boolean v0, p1, Lorg/telegram/tgnet/TLRPC${'$'}User;->self:Z
            if-eqz v0, :not_self
            const/4 v0, 0x1
            return v0
            :not_self
            nop
        """)
    }
}
