package dev.materialtidal.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_TIDAL = Compatibility(
    name = "TIDAL",
    packageName = "com.aspiro.tidal",
    appIconColor = 0x000000,
    targets = listOf(
        AppTarget(version = "2.220.1"),
    ),
)

internal const val EXTENSION_PATH = "extensions/tidal.mpe"

internal const val MATERIAL_YOU_CONFIG_CLASS = "Ldev/materialtidal/extension/tidal/theme/MaterialYouConfig;"
internal const val MATERIAL_YOU_ENGINE_CLASS = "Ldev/materialtidal/extension/tidal/theme/MaterialYouColorEngine;"
internal const val EXPRESSIVE_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/navbar/ExpressiveScaffoldBridge;"
internal const val EXPRESSIVE_FACTORY_CLASS = "Ldev/materialtidal/extension/tidal/navbar/ExpressiveViewFactory;"
internal const val EXPRESSIVE_PLAYER_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/player/ExpressivePlayerBridge;"
internal const val SONG_WAVEFORM_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/player/waveform/SongWaveformBridge;"
internal const val EXPRESSIVE_HOME_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/home/ExpressiveHomeBridge;"
internal const val EXPRESSIVE_PLAYLIST_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/playlist/ExpressivePlaylistBridge;"
internal const val EXPRESSIVE_MEDIA_PAGES_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/mediapages/ExpressiveMediaPagesBridge;"
internal const val EXPRESSIVE_SHEETS_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/sheets/ExpressiveSheetsBridge;"
internal const val EXPRESSIVE_SEARCH_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/search/ExpressiveSearchBridge;"
internal const val EXPRESSIVE_COLLECTION_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/collection/ExpressiveCollectionBridge;"

internal const val LINN_CONFIG_CLASS = "Ldev/materialtidal/extension/tidal/linn/LinnConfig;"
internal const val LINN_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/linn/LinnTidalBridge;"
internal const val LINN_BROADCAST_CONTROLLER_CLASS = "Ldev/materialtidal/extension/tidal/linn/LinnBroadcastController;"
internal const val LINN_FACTORY_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/linn/adapter/LinnBroadcastProviderFactoryAdapter;"
internal const val LINN_PROVIDER_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/linn/adapter/LinnBroadcastProviderAdapter;"
internal const val LINN_ITEM_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/linn/adapter/LinnBroadcastItemAdapter;"
internal const val LINN_BUTTON_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/linn/adapter/LinnBroadcastButtonAdapter;"
internal const val LINN_VOLUME_CONTROL_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/linn/adapter/LinnVolumeControlAdapter;"
internal const val LINN_VOLUME_PROVIDER_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/linn/adapter/LinnVolumeProviderAdapter;"
internal const val LINN_PLAYBACK_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/linn/adapter/LinnPlaybackAdapter;"

internal const val CROSSFADE_CONFIG_CLASS = "Ldev/materialtidal/extension/tidal/crossfade/CrossfadeConfig;"
internal const val CROSSFADE_ENGINE_CLASS = "Ldev/materialtidal/extension/tidal/crossfade/CrossfadeEngine;"
internal const val CROSSFADE_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/crossfade/CrossfadeTidalBridge;"
internal const val CROSSFADE_SETTINGS_ITEM_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/crossfade/CrossfadeSettingsItemAdapter;"
internal const val CROSSFADE_SETTINGS_CLICK_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/crossfade/CrossfadeSettingsClickAdapter;"
internal const val CROSSFADE_CONTEXT_MENU_ITEM_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/crossfade/CrossfadeContextMenuItemAdapter;"

internal const val PATCH_SETTINGS_BRIDGE_CLASS = "Ldev/materialtidal/extension/tidal/settings/PatchSettingsBridge;"
internal const val PATCH_SETTINGS_ITEM_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/settings/PatchSettingsItemAdapter;"
internal const val PATCH_SETTINGS_CLICK_ADAPTER_CLASS = "Ldev/materialtidal/extension/tidal/settings/PatchSettingsClickAdapter;"
