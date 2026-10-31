package app.kurageno8156lgtm

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val PKG = "com.ss.android.ugc.tiktok.lite"
private const val VER = "43.5.3"

private fun forceTrue() = """
    const/4 v0, 0x1
    return v0
""".trimIndent()

private fun forceFalse() = """
    const/4 v0, 0x0
    return v0
""".trimIndent()

@Suppress("unused")
val showSeekbarPatch = bytecodePatch(
    name = "Show Seekbar",
    description = "シークバー常時表示（43.5.3 実文字列対応）",
    default = true
) {
    compatibleWith(PKG(VER))
    execute {
        runCatching { ShouldShowSeekBarFingerprint.method.addInstructions(0, forceTrue()) }
        runCatching { ShouldShowSeekBarAltFingerprint.method.addInstructions(0, forceTrue()) }
    }
}

@Suppress("unused")
val playbackSpeedPatch = bytecodePatch(
    name = "Playback Speed",
    description = "速度メニュー解放。speed_list 等を強制（8倍リスト自体は別途配列改変が必要）",
    default = true
) {
    compatibleWith(PKG(VER))
    execute {
        // boolean ゲートは全部 ON
        listOf(
            PlaybackSpeedEnabledFingerprint,
            SpeedPanelGateFingerprint,
            SpeedLimitFingerprint
        ).forEach { fp ->
            runCatching {
                val m = fp.method
                if (m.returnType == "Z") m.addInstructions(0, forceTrue())
            }
        }
        // 検出用（後で speed_list 配列改変に使う）
        runCatching { SpeedListFingerprint.method }
        runCatching { SpeedPanelFingerprint.method }
        runCatching { VideoSpeedShowFingerprint.method }
        runCatching { PlayerSpeedFingerprint.method }
    }
}

@Suppress("unused")
val rememberClearDisplayPatch = bytecodePatch(
    name = "Remember Clear Display",
    description = "クリア表示の維持補助",
    default = true
) {
    compatibleWith(PKG(VER))
    execute {
        runCatching { ClearModeRememberFingerprint.method.addInstructions(0, forceTrue()) }
    }
}

@Suppress("unused")
val simSpoofRegionPatch = bytecodePatch(
    name = "SIM Spoof / Region Unlock",
    description = "リージョンゲート緩和",
    default = false
) {
    compatibleWith(PKG(VER))
    execute {
        runCatching { RegionLockGateFingerprint.method.addInstructions(0, forceTrue()) }
    }
}

@Suppress("unused")
val hideFeedAdsAndLivePatch = bytecodePatch(
    name = "Feed Filter & Hide Ads",
    description = "広告・LIVE 判定抑制",
    default = true
) {
    compatibleWith(PKG(VER))
    execute {
        runCatching { FeedAdGateFingerprint.method.addInstructions(0, forceFalse()) }
        runCatching { SplashOrFeedAdFingerprint.method.addInstructions(0, forceFalse()) }
        runCatching { FeedLiveCardFingerprint.method.addInstructions(0, forceFalse()) }
    }
}

@Suppress("unused")
val hideShopAndPromoUiPatch = bytecodePatch(
    name = "Hide Shop / Promo UI",
    description = "ショップ入口抑制",
    default = false
) {
    compatibleWith(PKG(VER))
    execute {
        runCatching { ShopEntryGateFingerprint.method.addInstructions(0, forceFalse()) }
    }
}

@Suppress("unused")
val unlimitedDownloadPatch = bytecodePatch(
    name = "Unlimited Downloads",
    description = "allow_download を強制 true（43.5.3 確認済み文字列）",
    default = true
) {
    compatibleWith(PKG(VER))
    execute {
        runCatching { AllowDownloadFingerprint.method.addInstructions(0, forceTrue()) }
        runCatching { DownloadAllowFingerprint.method.addInstructions(0, forceTrue()) }
        runCatching { DownloadEnableFingerprint.method.addInstructions(0, forceTrue()) }
        runCatching { DownloadRestrictFingerprint.method.addInstructions(0, forceFalse()) }
    }
}

@Suppress("unused")
val removeWatermarkPatch = bytecodePatch(
    name = "Remove Watermark",
    description = "without_watermark / with_watermark / add_watermark を 43.5.3 実文字列で強制",
    default = true
) {
    compatibleWith(PKG(VER))
    execute {
        // 透かし無し許可
        runCatching {
            val m = WithoutWatermarkFingerprint.method
            if (m.returnType == "Z") m.addInstructions(0, forceTrue())
        }
        runCatching {
            val m = DownloadWithoutWatermarkFingerprint.method
            if (m.returnType == "Z") m.addInstructions(0, forceTrue())
        }
        runCatching {
            val m = AclNoWatermarkFingerprint.method
            if (m.returnType == "Z") m.addInstructions(0, forceTrue())
        }

        // 透かし付与側を OFF
        runCatching {
            val m = WithWatermarkFingerprint.method
            if (m.returnType == "Z") m.addInstructions(0, forceFalse())
        }
        runCatching {
            val m = AddWatermarkFingerprint.method
            if (m.returnType == "Z") m.addInstructions(0, forceFalse())
        }
        runCatching {
            val m = ShouldAddWatermarkFingerprint.method
            if (m.returnType == "Z") m.addInstructions(0, forceFalse())
        }
        runCatching {
            val m = WaterMarkFlagFingerprint.method
            if (m.returnType == "Z") m.addInstructions(0, forceFalse())
        }

        // イベント／パス検出（後続の URL 切替用）
        runCatching { SaveWithoutWatermarkFingerprint.method }
        runCatching { CheckSaveLocalWithoutWmFingerprint.method }
        runCatching { PlayAddrFingerprint.method }
        runCatching { DownloadAddrFingerprint.method }
    }
}

@Suppress("unused")
val settingsHookStubPatch = bytecodePatch(
    name = "Settings Hook Stub",
    description = "設定フック検出スタブ",
    default = false
) {
    compatibleWith(PKG(VER))
    execute {
        runCatching { SettingsFragmentFingerprint.method }
    }
}
