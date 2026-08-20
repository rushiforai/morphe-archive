package app.template.patches.livescore.misc.ads

import app.morphe.patcher.Fingerprint

// Livescore's AdsRemovalSettings is the single gate every ad system checks
// before showing anything. areAdsDisabled() returns true when the user is
// inside a purchased ad-free period (trial or paid). Callers include
// BannerManagerImpl (banner state machine -> Disabled), InterstitialAdsUseCase,
// MpuAdsConfig, HeroPlacementUseCase, CoverageSponsorshipSettings and
// AnnouncementBannerUseCase. Forcing it to return true makes every ad path
// early-out as if an ad-removal entitlement were active.
object AdsRemovalSettingsAreAdsDisabledFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/livescore/ads/config/AdsRemovalSettings;" &&
                method.name == "areAdsDisabled" &&
                method.returnType == "Z" &&
                method.parameters.isEmpty()
    }
)