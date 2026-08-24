package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Spoofs client-side Pro/VIP status to unlock premium-gated effects, export " +
        "options (watermark removal where VIP-gated), and retouch subscribe checks. Also " +
        "disables watermark_trailer_config so the CapCut ending clip is not applied. " +
        "ISubscribe.isVip is native and not patchable here. Server-verified features may " +
        "still require a real subscription.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        // SubscribeApi / PayVip / IVipUserService chain.
        VegaSubscribeIsVipFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // EditorProxyModule / IVipUserService chain (non-native).
        PayVipIsVipFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Clipmonetize benefit checks (effects, export paywalls).
        UserInfoServiceVipStateFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/lemon/lv/clipmonetize/data/VipState;->SSVIP:Lcom/lemon/lv/clipmonetize/data/VipState;
                return-object v0
            """,
        )

        // Retouch / photo editor module bundled in CapCut.
        SubscribeFacadeIsSubscribedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // WatermarkTrailerConfig(boolean enableWatermark, boolean enableTrailer)
        WatermarkTrailerConfigInitFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
                const/4 p2, 0x0
            """,
        )
    }
}
