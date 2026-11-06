package id.ikuradachi.patches.bstation.player

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.content.applyUserInteractions
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val cleanPlayerPatch = bytecodePatch(
    name = "Clean player",
    description = "Hides selected player branding, recommendations, outro cards and optional comments and danmaku.",
) {
    category("Player")
    compatibleWith(COMPATIBILITY_BSTATION)

    val disableWatermark = booleanOption(
        key = "disableWatermark",
        default = true,
        title = "Disable player watermark",
        description = "Hides the top-right brand logo and copyright/premium watermark in the video player.",
    )

    val disableRecommendations = booleanOption(
        key = "disableRecommendations",
        default = true,
        title = "Disable player recommendation widget",
        description = "Disables fullscreen video player bottom-right recommendation widget.",
    )

    val disableOutroCard = booleanOption(
        key = "disableOutroCard",
        default = true,
        title = "Disable player outro unlock card",
        description = "Disables video player outro unlock video guide bottom-right card.",
    )

    val hideUserInteractions = booleanOption(
        key = "hideUserInteractions",
        default = false,
        title = "Hide user interactions",
        description = "Hides player comments and danmaku, disables danmaku sending, and preserves subtitle settings.",
    )

    execute {
        if (disableWatermark.value == true) applyWatermark()
        if (disableRecommendations.value == true) applyRecommend()
        if (disableOutroCard.value == true) applyOutro()
        if (hideUserInteractions.value == true) applyUserInteractions()
    }
}
