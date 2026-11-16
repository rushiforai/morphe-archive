package io.github.jordanwoodson.patches.rumble.player

import app.morphe.patcher.Fingerprint
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
