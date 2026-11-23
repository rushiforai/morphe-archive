package dev.materialtidal.patches.tidal.playback.linn

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object BroadcastProvidersManagerInitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/aspiro/wamp/sonos/SonosBroadcastProviderFactory;",
            name = "<init>",
        ),
        methodCall(
            name = "init",
            parameters = emptyList(),
            returnType = "V",
        ),
    ),
)

internal object BroadcastItemViewHolderBindFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET,
            definingClass = "Lcom/tidal/android/resources/R\$drawable;",
            name = "ic_broadcast_audio",
        ),
        fieldAccess(
            opcode = Opcode.SGET,
            definingClass = "Lcom/tidal/android/resources/R\$drawable;",
            name = "ic_broadcast_local",
        ),
        fieldAccess(
            opcode = Opcode.SGET,
            definingClass = "Lcom/tidal/android/resources/R\$drawable;",
            name = "ic_broadcast_chromecast",
        ),
    ),
    custom = { method, _ ->
        method.parameterTypes.size == 1 && !method.name.startsWith("<")
    },
)

internal object BroadcastManagerDisconnectFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        opcode(Opcode.NEW_INSTANCE),
        opcode(Opcode.INVOKE_DIRECT),
        methodCall(
            name = "disconnect",
            returnType = "V",
        ),
    ),
    custom = { method, classDef ->
        method.parameterTypes.size == 1 &&
            classDef.interfaces.size == 2 &&
            classDef.methods.any { it.name == "getVolumeControl" }
    },
)

internal object AudioPlayerSwitchPlaybackFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/player/a;",
    parameters = listOf("Lcom/aspiro/wamp/player/PlaybackType;"),
    returnType = "V",
    custom = { method, _ -> !method.name.startsWith("<") },
)

internal object LocalPlayQueueClassFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    custom = { method, classDef ->
        method.parameterTypes.size == 6 &&
            classDef.interfaces.size == 1 &&
            classDef.methods.any { it.name == "initFrom" }
    },
)

internal object LocalPlaybackOnActionPreviousFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/boombox/a;",
    name = "onActionPrevious",
    parameters = listOf("Z"),
    returnType = "V",
)

internal object CastCredentialsHelperFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/cast/a;",
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.size == 1 &&
            !method.name.startsWith("<")
    },
)

internal object BroadcastAudioPlayerSingletonFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/player/a\$c;",
    parameters = emptyList(),
    returnType = "Lcom/aspiro/wamp/player/a;",
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

internal object ItemUpdatedNotifierFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/player/c;",
    parameters = emptyList(),
    returnType = "V",
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) && !method.name.startsWith("<")
    },
)

internal object MusicServiceOnDestroyFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/player/MusicService;",
    name = "onDestroy",
    parameters = emptyList(),
    returnType = "V",
)
