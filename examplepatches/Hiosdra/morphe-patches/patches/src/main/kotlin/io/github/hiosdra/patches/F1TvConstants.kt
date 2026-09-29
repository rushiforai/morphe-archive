package io.github.hiosdra.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val F1_TV_PACKAGE = "com.formulaone.production"
internal const val BASE_PLAYER_ACTIVITY = "Lcom/avs/f1/ui/player/BasePlayerActivity;"
internal const val PLAYER_SWITCHER = "Lcom/avs/f1/interactors/playback/PlayerSwitcher;"
internal const val PLAYBACK_USE_CASE = "Lcom/avs/f1/interactors/playback/PlaybackUseCase;"

internal const val F1_TV_VERSION = "3.0.49.4-SP166.4.1-release-R54.2-mobile"
internal const val F1_TV_VERSION_CODE = 30494002

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
