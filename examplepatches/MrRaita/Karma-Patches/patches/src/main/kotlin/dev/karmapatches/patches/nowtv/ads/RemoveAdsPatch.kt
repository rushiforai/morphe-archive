package dev.karmapatches.patches.nowtv.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.karmapatches.debugLogSmali
import dev.karmapatches.patches.nowtv.NOW_TV_COMPATIBILITY

/** Banner reklamları (Google Ad Manager) hiç yüklemeden gizler. */
@Suppress("unused")
val removeBannerAdsPatch = bytecodePatch(
    name = "Remove banner ads",
    description = "Removes Google Ad Manager banners across the NOW app.",
    default = true,
) {
    compatibleWith(NOW_TV_COMPATIBILITY)

    execute {
        // p0 = AdManagerAdView. GONE (8) yapıp çık; reklam isteği hiç gitmez.
        loadAdWithRetryFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual { p0, v0 }, Lcom/google/android/gms/ads/admanager/AdManagerAdView;->setVisibility(I)V
                ${debugLogSmali("p1", "p2", "banner ad blocked")}
                return-void
            """,
        )
    }
}

/**
 * Dizi/film/program videolarındaki IMA (VMAP) reklamlarını kapatır.
 * ExoPlayer 2.18 DefaultMediaSourceFactory, AdsLoader null dönerse
 * "Playing media without ads" diyerek içeriği reklamsız oynatır.
 */
@Suppress("unused")
val removeVideoAdsPatch = bytecodePatch(
    name = "Remove video ads",
    description = "Disables IMA/VMAP pre-roll and mid-roll ads in on-demand videos.",
    default = true,
) {
    compatibleWith(NOW_TV_COMPATIBILITY)

    execute {
        vodAdsLoaderProviderFingerprint.method.addInstructions(
            0,
            """
                ${debugLogSmali("p0", "p1", "vod ads loader disabled")}
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
