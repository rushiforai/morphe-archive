package io.github.liongalahad.nuviotv.patches.subtitles.localstoragesubtitles

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.iface.Method

internal const val SUBTITLE = "Lcom/nuvio/tv/domain/model/Subtitle;"
internal const val SUBTITLE_COMPANION = "Lcom/nuvio/tv/domain/model/Subtitle\$Companion;"
internal const val SUBTITLE_CONFIGURATION =
    "Landroidx/media3/common/MediaItem\$SubtitleConfiguration;"

private const val LIST = "Ljava/util/List;"
private const val FUNCTION_0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION_1 = "Lkotlin/jvm/functions/Function1;"

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

/** The complete three-rail subtitle overlay, matched by stable models, callbacks and focus behavior. */
internal object SubtitleOverlayFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("__off__", "__unknown__"),
    filters = listOf(
        methodCall(definingClass = SUBTITLE, name = "getLang", returnType = "Ljava/lang/String;"),
        methodCall(
            definingClass = SUBTITLE_COMPANION,
            name = "languageCodeToName",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "Ljava/lang/String;"
        )
    ),
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.size == 17 &&
            parameters.take(5) == listOf("Z", LIST, "I", LIST, SUBTITLE) &&
            parameters[6] == "I" && parameters[7] == LIST && parameters[8] == "Z" &&
            parameters.slice(9..13) == listOf(
                FUNCTION_1, FUNCTION_1, FUNCTION_0, FUNCTION_1, FUNCTION_0
            ) && parameters.last() == "I"
    }
)

/** Builds visible internal/addon option rows for the selected subtitle language. */
internal object SubtitleOptionBuilderFingerprint : Fingerprint(
    returnType = LIST,
    parameters = listOf(
        LIST, LIST, LIST,
        "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"
    ),
    filters = listOf(
        methodCall(definingClass = SUBTITLE, name = "getLang", returnType = "Ljava/lang/String;"),
        methodCall(
            definingClass = SUBTITLE_COMPANION,
            name = "languageCodeToName",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "Ljava/lang/String;"
        ),
        methodCall(definingClass = SUBTITLE, name = "getAddonName", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getId", returnType = "Ljava/lang/String;")
    )
)

/** Restores initial D-pad focus when the subtitle overlay is reopened. */
internal object SubtitleInitialFocusFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf(
        "overlay_open focus=option selectedLanguage=",
        "overlay_open focus=language selectedLanguage="
    )
)

/** Central player-event dispatcher used to refresh the active engine before opening overlays. */
internal object PlayerEventDispatcherFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("event-select-subtitle-internal", "event-select-subtitle-addon"),
    filters = listOf(
        methodCall(definingClass = SUBTITLE, name = "getId", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getLang", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getAddonName", returnType = "Ljava/lang/String;")
    ),
    custom = { method, _ -> method.parameterTypes.size == 2 }
)

/** Writes a user-selected addon subtitle into Nuvio's persistent track preference. */
internal object RememberAddonSubtitleFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("user-remember-subtitle-addon"),
    filters = listOf(
        methodCall(definingClass = SUBTITLE, name = "getId", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getUrl", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getLang", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getAddonName", returnType = "Ljava/lang/String;")
    ),
    custom = { method, _ ->
        method.parameterNames().let { it.size == 2 && it[1] == SUBTITLE }
    }
)

/** Writes a user-selected embedded subtitle into Nuvio's track preference. */
internal object RememberInternalSubtitleFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("user-remember-subtitle-internal"),
    custom = { method, _ ->
        method.parameterNames().let { it.size == 2 && it[1] == "I" }
    }
)

/** Writes Nuvio's explicit subtitle-disabled preference. */
internal object RememberDisabledSubtitleFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("user-remember-subtitle-disabled"),
    custom = { method, _ -> method.parameterTypes.size == 1 }
)

/** Selects an external subtitle through either Nuvio playback engine. */
internal object SelectAddonSubtitleFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("select-addon-subtitle"),
    filters = listOf(
        methodCall(definingClass = SUBTITLE, name = "getId", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getUrl", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getLang", returnType = "Ljava/lang/String;")
    ),
    custom = { method, _ ->
        method.parameterNames().let { it.size == 2 && it[1] == SUBTITLE }
    }
)

/** Applies Nuvio's subtitle-disabled state to the active playback engine. */
internal object DisableSubtitlesFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("disable-subtitles"),
    custom = { method, _ -> method.parameterTypes.size == 1 }
)

/** Applies an embedded subtitle track to the active playback engine. */
internal object SelectInternalSubtitleFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("select-subtitle-track", "Selecting INTERNAL subtitle trackIndex="),
    custom = { method, _ ->
        method.parameterNames().let { it.size == 2 && it[1] == "I" }
    }
)

/** Restores saved audio/subtitle track preferences after Media3 track updates. */
internal object RestoreTrackPreferencesFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("TRACK_PREF restore: internal subtitle index="),
    custom = { method, _ ->
        method.parameterNames().let {
            it.size == 3 && it[1] == LIST && it[2] == LIST
        }
    }
)

/** Persists Nuvio's per-content audio/subtitle track choice. */
internal object PersistTrackPreferencesFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("INTERNAL", "ADDON", "DISABLED"),
    custom = { method, _ -> method.parameterTypes.size == 1 }
)

/** Loads Nuvio's per-title preference and exposes the title/season/episode identity fields. */
internal object LoadTrackPreferencesFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("TRACK_PREF load: contentId="),
    custom = { method, _ -> method.parameterTypes.size == 1 }
)

/** Converts a Nuvio Subtitle into a Media3 sidecar configuration. */
internal object SubtitleConfigurationFingerprint : Fingerprint(
    returnType = SUBTITLE_CONFIGURATION,
    filters = listOf(
        methodCall(definingClass = SUBTITLE, name = "getLang", returnType = "Ljava/lang/String;"),
        methodCall(definingClass = SUBTITLE, name = "getUrl", returnType = "Ljava/lang/String;")
    )
)

/** Downloads sidecar subtitle text; local imports are supplied before its HTTP-only path. */
internal object SubtitleTextDownloaderFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf(
        "User-Agent",
        "text/plain, text/vtt, application/x-subrip, */*"
    ),
    custom = { method, _ ->
        method.parameterNames().let {
            it.size == 3 && it[1] == "Ljava/lang/String;" &&
                it[2] == "Ljava/lang/String;"
        }
    }
)
