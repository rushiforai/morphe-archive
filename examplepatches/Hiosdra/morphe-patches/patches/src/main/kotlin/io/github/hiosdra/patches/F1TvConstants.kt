package io.github.hiosdra.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val F1_TV_PACKAGE = "com.formulaone.production"
internal const val BASE_PLAYER_ACTIVITY = "Lcom/avs/f1/ui/player/BasePlayerActivity;"
internal const val PLAYER_SWITCHER = "Lcom/avs/f1/interactors/playback/PlayerSwitcher;"
internal const val PLAYBACK_USE_CASE = "Lcom/avs/f1/interactors/playback/PlaybackUseCase;"

internal const val F1_TV_VERSION = "3.0.48.1-SP157.6.0-release-R52-mobile"
internal const val F1_TV_VERSION_CODE = 30481000

internal val COMPATIBILITY_F1_TV = Compatibility(
    name = "F1 TV",
    packageName = F1_TV_PACKAGE,
    description = "F1 TV mobile APK",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xE10600,
    targets = listOf(
        AppTarget(
            version = F1_TV_VERSION,
            minSdk = 29,
            description = "versionCode $F1_TV_VERSION_CODE",
        ),
    ),
)
