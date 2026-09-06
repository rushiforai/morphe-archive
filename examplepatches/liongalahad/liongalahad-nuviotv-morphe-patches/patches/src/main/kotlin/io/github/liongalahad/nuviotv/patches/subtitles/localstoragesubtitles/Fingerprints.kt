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

internal object SubtitleMediaSourceFingerprint : Fingerprint(
    returnType = "Landroidx/media3/exoplayer/source/MediaSource;",
    strings = listOf("context", "url", "headers", "subtitleConfigurations", "responseHeaders",
        "application/x-mpegURL", "application/dash+xml"),
    custom = { method, _ -> method.parameterNames() == listOf(
        "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;", LIST,
        "Ljava/lang/String;", "Ljava/util/Map;", "Ljava/lang/String;", FUNCTION_0,
        "Landroidx/media3/common/MediaMetadata;"
    ) }
)

/** The complete three-rail subtitle overlay, matched by stable models, callbacks and focus behavior. */
internal object SubtitleOverlayFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("__off__", "onInternalTrackSelected", "onAddonSubtitleSelected", "installedSubtitleAddonOrder"),
    filters = listOf(
        methodCall(definingClass = SUBTITLE, name = "copy\$default", returnType = SUBTITLE),
        methodCall(definingClass = SUBTITLE, name = "getLang", returnType = "Ljava/lang/String;")
    ),
    custom = { method, _ ->
        val parameters = method.parameterNames()
        parameters.size == 19 &&
            parameters.take(5) == listOf("Z", LIST, "I", LIST, SUBTITLE) &&
            parameters[6] == "I" && parameters[7] == LIST && parameters[8] == "Z" &&
            parameters.slice(8..10) == listOf("Z", "Z", "Z") &&
            parameters.slice(11..15) == listOf(
                FUNCTION_1, FUNCTION_1, FUNCTION_0, FUNCTION_1, FUNCTION_0
            ) && parameters.last() == "I"
    }
)

/** The language list extracted from the overlay by R8 in 0.9.0. */
internal object SubtitleLanguageRailFingerprint : Fingerprint(
    returnType = LIST,
    parameters = listOf(LIST, LIST, "Ljava/lang/String;", "Ljava/lang/String;", "Z",
        "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("__off__", "__unknown__", "component1(...)", "component2(...)"),
    filters = listOf(methodCall(definingClass = SUBTITLE_COMPANION, name = "languageCodeToName",
        parameters = listOf("Ljava/lang/String;"), returnType = "Ljava/lang/String;"))
)

/** 0.9.0 builds each addon option in a shared helper, including stream-provided subtitles. */
internal object SubtitleOptionBuilderFingerprint : Fingerprint(
    parameters = listOf(
        "Ljava/lang/String;", "Ljava/lang/String;", SUBTITLE
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
    ),
    custom = { method, _ -> method.returnType.startsWith("L") && method.returnType != "Ljava/lang/String;" }
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
            it.size == 4 && it[1] == "Ljava/lang/String;" &&
                it[2] == "Ljava/lang/String;" && it[3] == "Ljava/util/Map;"
        }
    }
)
