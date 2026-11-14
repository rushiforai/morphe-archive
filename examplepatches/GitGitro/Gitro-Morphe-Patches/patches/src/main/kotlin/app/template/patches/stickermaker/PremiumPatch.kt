package app.template.patches.stickermaker

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.STICKER_MAKER_COMPATIBILITY

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Sticker Maker premium.",
    default = true,
) {
    compatibleWith(STICKER_MAKER_COMPATIBILITY)

    execute {
        listOf(IsPremiumFingerprint, PremiumDialogShownFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """,
                )
            }
        }

        SetPremiumDialogShownFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """,
            )
        }

        SetPremiumFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static {}, Lcom/marsvard/stickermakerforwhatsapp/ConstantsKt;->getHAWK_PREMIUM_PURCHASED()Ljava/lang/String;
                    move-result-object v0
                    const/4 v1, 0x1
                    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v1
                    invoke-static {v1, v0}, Lcom/orhanobut/hawk/f;->a(Ljava/lang/Object;Ljava/lang/String;)V
                    return-void
                """,
            )
        }
    }
}