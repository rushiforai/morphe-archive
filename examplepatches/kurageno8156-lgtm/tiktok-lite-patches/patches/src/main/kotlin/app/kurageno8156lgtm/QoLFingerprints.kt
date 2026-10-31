package app.kurageno8156lgtm

import app.morphe.patcher.Fingerprint

// Seekbar (43.5.3 で確認済み)
object ShouldShowSeekBarFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("can not show seekbar, state: 1, not in resume")
)

object ShouldShowSeekBarAltFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("can not show seekbar, state: 10, video is prohibited")
)

// Speed — 43.5.3 実文字列
object SpeedListFingerprint : Fingerprint(
    strings = listOf("speed_list")
)

object SpeedPanelFingerprint : Fingerprint(
    strings = listOf("speed_panel")
)

object SpeedNormalPanelFingerprint : Fingerprint(
    strings = listOf("speed_normal_panel")
)

object VideoSpeedShowFingerprint : Fingerprint(
    strings = listOf("video_speed_show")
)

object PlaybackSpeedGuideFingerprint : Fingerprint(
    strings = listOf("playback_speed_guide_toast")
)

object PlayerSpeedFingerprint : Fingerprint(
    strings = listOf("playerSpeed")
)

object ChangeVideoSpeedFingerprint : Fingerprint(
    strings = listOf("change_video_speed")
)

object ClickVideoSpeedFingerprint : Fingerprint(
    strings = listOf("click_video_speed")
)

// Download / watermark — 43.5.3 実文字列
object AllowDownloadFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("allow_download")
)

object WithoutWatermarkFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("without_watermark")
)

object WithWatermarkFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("with_watermark")
)

object AddWatermarkFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("add_watermark")
)

object SaveWithoutWatermarkFingerprint : Fingerprint(
    strings = listOf("click_save_without_watermark")
)

object SaveWithWatermarkFingerprint : Fingerprint(
    strings = listOf("click_save_with_watermark")
)

object CheckSaveLocalWithoutWmFingerprint : Fingerprint(
    strings = listOf("check_save_local_without_watermark")
)

object DownloadAddrFingerprint : Fingerprint(
    strings = listOf("download_addr")
)

object PlayAddrFingerprint : Fingerprint(
    strings = listOf("play_addr")
)

// 既存 QoL 用の互換エイリアス（古いパッチ参照が残っても落ちないように）
object ShouldShowSeekBarAltFingerprint2 : Fingerprint(
    returnType = "Z",
    strings = listOf("can not show seekbar")
)

object PlaybackSpeedEnabledFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("playback_speed")
)

object SpeedPanelGateFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("speed_panel", "video_speed")
)

object SpeedControlParentFingerprint : Fingerprint(
    strings = listOf("playback_speed")
)

object SpeedControlParentAltFingerprint : Fingerprint(
    strings = listOf("video_speed_show")
)

object SpeedLimitFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("speed_list")
)

object ClearDisplayStateFingerprint : Fingerprint(
    strings = listOf("clear_display", "clearDisplay")
)

object ClearModeRememberFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("is_clear_mode", "clear_mode")
)

object FeedAdGateFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("is_ad", "isAd")
)

object FeedLiveCardFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("is_live", "live_type")
)

object SplashOrFeedAdFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("commercialize", "is_commerce_ad")
)

object ShopEntryGateFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("tiktok_shop", "shop_entry")
)

object DownloadAllowFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("allow_download")
)

object DownloadRestrictFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("download_restrict", "forbid_download")
)

object DownloadEnableFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("enable_download", "download_enable")
)

object AclNoWatermarkFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("without_watermark")
)

object NeedWatermarkFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("need_watermark")
)

object ShouldAddWatermarkFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("add_watermark")
)

object WaterMarkFlagFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("water_mark")
)

object DownloadWithoutWatermarkFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("without_watermark")
)

object DownloadUrlSelectFingerprint : Fingerprint(
    strings = listOf("download_addr", "play_addr")
)

object RegionLockGateFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf("region_lock", "is_region_available")
)

object CountryIsoGateFingerprint : Fingerprint(
    strings = listOf("getSimCountryIso", "getNetworkCountryIso")
)

object SettingsFragmentFingerprint : Fingerprint(
    strings = listOf("settings_fragment", "SettingFragment")
)

object SetSeekBarShowTypeFingerprint : Fingerprint(
    strings = listOf("setSeekBarShowType")
)
