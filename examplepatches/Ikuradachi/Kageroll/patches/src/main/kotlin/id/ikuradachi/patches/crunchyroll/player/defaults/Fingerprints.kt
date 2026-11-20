package id.ikuradachi.patches.crunchyroll.player.defaults

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object PlayerSettingsStorageConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("Landroid/content/SharedPreferences;"),
    filters = listOf(
        string("player_audio_language"),
        string("player_subtitles_language"),
        string("player_autoplay_setting"),
        string("stream_over_cellular"),
        string("show_closed_captions"),
        string("audio_description"),
        string("player_playback_speed_setting"),
    ),
)
