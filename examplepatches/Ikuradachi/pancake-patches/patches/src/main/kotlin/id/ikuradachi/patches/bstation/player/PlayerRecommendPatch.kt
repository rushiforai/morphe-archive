package id.ikuradachi.patches.bstation.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val playerRecommendPatch = bytecodePatch(
    name = "Disable player recommendation widget",
    description = "Disables fullscreen video player bottom-right recommendation widget.",
) {
    category("Player")
    compatibleWith(COMPATIBILITY_BSTATION)

    execute {
        PlayerRecommendWidgetActivateFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V
                return-void
            """,
        )
        ChronosCheckRecommendDanmakuFingerprint.method.addInstructions(
            0,
            """
                new-instance p1, Ltv/danmaku/biliplayer/service/interact/biz/chronos/chronosrpc/methods/receive/CheckRecommendDanmaku${'$'}Response;
                invoke-direct {p1}, Ltv/danmaku/biliplayer/service/interact/biz/chronos/chronosrpc/methods/receive/CheckRecommendDanmaku${'$'}Response;-><init>()V
                const/4 v0, 0x0
                invoke-virtual {p1, v0}, Ltv/danmaku/biliplayer/service/interact/biz/chronos/chronosrpc/methods/receive/CheckRecommendDanmaku${'$'}Response;->setShow(Z)V
                const/4 v0, 0x0
                invoke-interface {p2, p1, v0}, Lp61/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                return-void
            """,
        )
    }
}
