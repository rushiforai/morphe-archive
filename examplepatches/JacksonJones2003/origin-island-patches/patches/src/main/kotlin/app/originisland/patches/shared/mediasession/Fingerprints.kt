package app.originisland.patches.shared.mediasession

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

private const val MEDIA_SESSION_CALLBACK_CLASS = "Landroid/media/session/MediaSession\$Callback;"
private const val MEDIA_BROWSER_SERVICE_RESULT_CLASS = "Landroid/service/media/MediaBrowserService\$Result;"

/**
 * Framework calls and overrides keep their names, so the fingerprints here match regardless
 * of how the app obfuscates the media session and media browser code around them.
 */
internal object MediaSessionSetMetadataFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "setMetadata",
            parameters = listOf("Landroid/media/MediaMetadata;")
        )
    )
)

internal object MediaSessionSetExtrasFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "setExtras",
            parameters = listOf("Landroid/os/Bundle;")
        )
    )
)

internal object MediaSessionSetPlaybackStateFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "setPlaybackState",
            parameters = listOf("Landroid/media/session/PlaybackState;")
        )
    )
)

internal object MediaSessionCallbackOnSetRatingFingerprint : Fingerprint(
    name = "onSetRating",
    returnType = "V",
    parameters = listOf("Landroid/media/Rating;"),
    custom = { _, classDef ->
        classDef.superclass == MEDIA_SESSION_CALLBACK_CLASS
    }
)

internal object MediaSessionCallbackOnPlayFingerprint : Fingerprint(
    name = "onPlay",
    returnType = "V",
    parameters = listOf(),
    custom = { _, classDef ->
        classDef.superclass == MEDIA_SESSION_CALLBACK_CLASS
    }
)

internal object MediaSessionCallbackOnCustomActionFingerprint : Fingerprint(
    name = "onCustomAction",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
    custom = { _, classDef ->
        classDef.superclass == MEDIA_SESSION_CALLBACK_CLASS
    }
)

internal object MediaSessionCallbackOnPlayFromMediaIdFingerprint : Fingerprint(
    name = "onPlayFromMediaId",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
    custom = { _, classDef ->
        classDef.superclass == MEDIA_SESSION_CALLBACK_CLASS
    }
)

/**
 * `MediaBrowserService.onLoadChildren(String parentId, Result result)`.
 */
internal object MediaBrowserServiceOnLoadChildrenFingerprint : Fingerprint(
    name = "onLoadChildren",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", MEDIA_BROWSER_SERVICE_RESULT_CLASS)
)

/**
 * `MediaBrowserService.onLoadChildren(String parentId, Result result, Bundle options)`.
 */
internal object MediaBrowserServiceOnLoadChildrenWithOptionsFingerprint : Fingerprint(
    name = "onLoadChildren",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", MEDIA_BROWSER_SERVICE_RESULT_CLASS, "Landroid/os/Bundle;")
)

internal object MediaBrowserServiceGetCurrentBrowserInfoFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/service/media/MediaBrowserService;",
            name = "getCurrentBrowserInfo"
        )
    )
)

/**
 * `MediaBrowserService.onGetRoot(String clientPackageName, int clientUid, Bundle rootHints)`.
 */
internal object MediaBrowserServiceOnGetRootFingerprint : Fingerprint(
    name = "onGetRoot",
    returnType = "Landroid/service/media/MediaBrowserService\$BrowserRoot;",
    parameters = listOf("Ljava/lang/String;", "I", "Landroid/os/Bundle;")
)

internal object MediaSessionConstructorFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "<init>"
        )
    )
)
