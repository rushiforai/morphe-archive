package dev.materialtidal.patches.tidal.layout.lyrics

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object LyricsAudioPlayerSwitchFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/player/a;",
    parameters = listOf("Lcom/aspiro/wamp/player/PlaybackType;"),
    returnType = "V",
    custom = { method, _ -> !method.name.startsWith("<") },
)

internal object LyricsAudioPlayerSingletonFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/player/a\$c;",
    parameters = emptyList(),
    returnType = "Lcom/aspiro/wamp/player/a;",
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

internal object LyricsTracksResourceMapperFingerprint : Fingerprint(
    returnType = "Lcom/tidal/android/tidalapi/domain/model/p;",
    parameters = listOf(
        "Lcom/tidal/sdk/tidalapi/generated/models/TracksResourceObject;",
        "Ljava/util/List;",
        "Ljava/util/List;",
        "Ljava/util/ArrayList;",
        "Ljava/util/ArrayList;",
        "Ljava/util/ArrayList;",
        "Ljava/util/ArrayList;",
        "Ljava/util/Map;",
    ),
)
