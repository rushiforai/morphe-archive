package io.github.jordanwoodson.patches.rumble.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.jordanwoodson.patches.shared.compose.calls

internal const val PLAYER_SERVICE = "Lcom/rumble/videoplayer/player/RumblePlayerService;"

// The player's speed per scope (video page or elsewhere): set(videoScope, speed), named in its null checks.
internal object SpeedStoreSetFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "L"),
    strings = listOf("videoScope", "speed"),
)

// Media3's AspectRatioFrameLayout (inflated from XML, so the name is kept) sizes the video for its resize mode
// when measured. Rumble always uses FIT.
internal object AspectRatioMeasureFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/ui/AspectRatioFrameLayout;",
    name = "onMeasure",
    returnType = "V",
    parameters = listOf("I", "I"),
)

// The player service's audio focus listener (an Android interface method, so the name is kept).
internal object AudioFocusChangeFingerprint : Fingerprint(
    definingClass = PLAYER_SERVICE,
    name = "onAudioFocusChange",
    returnType = "V",
    parameters = listOf("I"),
)

// Adds or clears FLAG_KEEP_SCREEN_ON on the activity of a Context: (context, keepOn).
internal object KeepScreenOnFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Z"),
    custom = { method, _ ->
        method.calls("Landroid/view/Window;->addFlags(I)V") && method.calls("Landroid/view/Window;->clearFlags(I)V")
    },
)

// Media3's Format.toLogString(format), which names each value it prints ("id=1, mimeType=video/avc, res=1920x1080").
internal object FormatLogFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("L"),
    strings = listOf("id=", ", mimeType=", ", bitrate=", ", codecs=", ", res=", ", fps="),
)

// Rumble's TV player controls answer the remote in a static (player, focused control, KeyEvent, ...) handler:
// MEDIA_PLAY (126) plays, MEDIA_PAUSE (127) pauses, MEDIA_PLAY_PAUSE (85) asks whether it plays, FAST_FORWARD (90)
// and REWIND (89) skip 10000 ms where the video can seek. The phone app never shows that player, but the handler
// names the player's methods.
internal object TvRemoteKeysFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(
        methodCall(definingClass = "Landroid/view/KeyEvent;", name = "getKeyCode"),
        literal(126),
        literal(127),
        literal(85),
        literal(90),
        literal(10000),
        literal(89),
    ),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            "Landroid/view/KeyEvent;" in method.parameterTypes.map(CharSequence::toString)
    },
)
