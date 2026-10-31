package dev.karmapatches.patches.nowtv.ads

// İmza bilgileri NOW 7.6.258 base.apk içinden doğrulandı.
import app.morphe.patcher.fingerprint

/**
 * Banner reklam yükleyici (Google Ad Manager).
 * tr.com.nowtv.android.helpers.AdManagerExtensionsKt.loadAdWithRetry(
 *     AdManagerAdView, AdManagerAdRequest, int, long, long): void   (static)
 */
internal val loadAdWithRetryFingerprint = fingerprint {
    returns("V")
    parameters(
        "Lcom/google/android/gms/ads/admanager/AdManagerAdView;",
        "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;",
        "I",
        "J",
        "J",
    )
    custom { method, classDef ->
        classDef.type == "Ltr/com/nowtv/android/helpers/AdManagerExtensionsKt;" &&
            method.name == "loadAdWithRetry"
    }
}

/**
 * VOD oynatıcıda IMA reklam yükleyici sağlayıcısı (ExoPlayer AdsLoader.Provider lambda'sı).
 * VideoFragment.initPlayer$lambda$0$1(VideoFragment, Context, MediaItem$AdsConfiguration): AdsLoader
 * Ad R8 tarafından üretildiği için sadece tür imzasına güveniyoruz.
 */
internal val vodAdsLoaderProviderFingerprint = fingerprint {
    returns("Lcom/google/android/exoplayer2/source/ads/AdsLoader;")
    parameters(
        "Ltr/com/nowtv/android/fragments/VideoFragment;",
        "Landroid/content/Context;",
        "Lcom/google/android/exoplayer2/MediaItem\$AdsConfiguration;",
    )
    custom { _, classDef ->
        classDef.type == "Ltr/com/nowtv/android/fragments/VideoFragment;"
    }
}

/**
 * Canlı yayın oynatıcı başlatma: LiveStreamFragment.initPlayer()
 * İçinde "daioncdndaioncdn" log etiketi ve liveStreamTokenGenerator çağrısı var.
 */
internal val liveInitPlayerFingerprint = fingerprint {
    returns("V")
    parameters()
    strings("daioncdndaioncdn")
    custom { method, classDef ->
        classDef.type == "Ltr/com/nowtv/android/fragments/LiveStreamFragment;" &&
            method.name == "initPlayer"
    }
}

/**
 * DAION reklam başladı geri çağrısı: LiveStreamFragment.onDaionAdIn(AdModel)
 * Orijinal kod: isDaionAdVisible = true; playerControlBar.setVisibility(GONE)
 */
internal val daionAdInFingerprint = fingerprint {
    returns("V")
    parameters("Lcom/erstream/daion/exo_v2180/models/AdModel;")
    custom { method, classDef ->
        classDef.type == "Ltr/com/nowtv/android/fragments/LiveStreamFragment;" &&
            method.name == "onDaionAdIn"
    }
}
