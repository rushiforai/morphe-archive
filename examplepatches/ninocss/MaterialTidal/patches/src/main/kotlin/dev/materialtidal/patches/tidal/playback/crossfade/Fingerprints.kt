package dev.materialtidal.patches.tidal.playback.crossfade

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal object CrossfadeFeatureFlagClinitFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    filters = listOf(
        string("mf-player-crossfade"),
        string("Player Crossfade Enabled"),
    ),
)

internal object CrossfadePreferenceInitFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/settings/CrossfadePreference;",
    name = "<init>",
    returnType = "V",
)

internal object CrossfadePreferenceReadFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/settings/CrossfadePreference;",
    parameters = emptyList(),
    returnType = "I",
    filters = listOf(
        string("crossfade_duration"),
    ),
)

internal object CrossfadePreferenceFlowFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/settings/CrossfadePreference;",
    parameters = emptyList(),
    returnType = "Lkotlinx/coroutines/flow/Flow;",
    filters = listOf(
        string("crossfade_duration"),
    ),
)

internal object CrossfadeDurationLambdaFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/settings/CrossfadePreference\$durationMs\$1;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
)

internal object AudioAndPlaybackSettingsBuildFingerprint : Fingerprint(
    parameters = emptyList(),
    returnType = "Ljava/util/List;",
    filters = listOf(
        string("connectivity"),
    ),
    custom = { _, classDef ->
        classDef.fields.any { it.type == "Lcom/aspiro/wamp/settings/CrossfadePreference;" }
    },
)

internal object SettingsItemCrossfadeCommitFingerprint : Fingerprint(
    name = "call",
    parameters = emptyList(),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("crossfade_duration"),
    ),
)

internal object BoomboxOnActivatedFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/boombox/a;",
    name = "onActivated",
    returnType = "V",
    filters = listOf(
        string("back_buffer_duration_ms"),
        string("streaming_quality"),
    ),
)

internal object ExoPlayerPlaybackEngineInitFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/sdk/player/playbackengine/ExoPlayerPlaybackEngine;",
    name = "<init>",
    returnType = "V",
)

internal object TrackContextMenuBuildFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/contextmenu/menu/track/TrackContextMenu;",
    parameters = emptyList(),
    returnType = "Ljava/util/List;",
    filters = listOf(
        string("track"),
    ),
)

internal object AppOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/App;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
)
