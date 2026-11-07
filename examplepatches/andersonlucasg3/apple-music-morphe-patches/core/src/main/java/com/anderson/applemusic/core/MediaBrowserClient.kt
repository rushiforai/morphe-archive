package com.anderson.applemusic.core

import android.content.ComponentName
import android.content.Context
import android.graphics.Bitmap
import android.media.MediaDescription
import android.media.MediaMetadata
import android.media.browse.MediaBrowser
import android.media.session.MediaController
import android.media.session.PlaybackState
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.util.Log

/**
 * Thin wrapper around the framework [MediaBrowser] / [MediaController] pair.
 *
 * The patched Apple Music engine exposes its Android Auto browse tree under
 * `__AUTO_ROOT__`; the root returned by [MediaBrowser.getRoot] only holds
 * `ROOT_MEDIA_ITEM`, which is useless for browsing.
 *
 * UI-agnostic: no Compose UI, no resources. The consuming app must declare
 * `android:sharedUserId="com.apple.android"`, be signed with the Morphe certificate
 * and add the `<queries>` for `com.apple.android.music` (see core/README.md).
 */
@Suppress("DEPRECATION")
class MediaBrowserClient(context: Context) {

    interface Listener {
        fun onConnected()
        fun onDisconnected(message: String)
        fun onChildren(parentId: String, items: List<BrowseItem>)
        fun onChildrenFailed(parentId: String)
        fun onPlayback(snapshot: PlaybackSnapshot)
    }

    var listener: Listener? = null

    private val appContext = context.applicationContext
    private val mainHandler = Handler(Looper.getMainLooper())
    private var browser: MediaBrowser? = null
    private var controller: MediaController? = null
    private var controllerCallback: MediaController.Callback? = null

    private val subscriptions = mutableMapOf<String, MediaBrowser.SubscriptionCallback>()
    private val childrenCache = mutableMapOf<String, List<BrowseItem>>()

    private var lastState: PlaybackState? = null
    private var lastMetadata: MediaMetadata? = null
    private var lastCustomActions: List<CustomAction> = emptyList()

    /**
     * Session custom actions of the last [PlaybackState], e.g. "Favorito",
     * "Adicionar à Biblioteca" and "Criar Estação". Empty until the engine publishes
     * a playback state.
     */
    val customActions: List<CustomAction> get() = lastCustomActions

    private val connectionCallback = object : MediaBrowser.ConnectionCallback() {
        override fun onConnected() {
            Log.i(TAG, "browser connected, root=${browser?.root}")
            attachController()
            listener?.onConnected()
            refreshPlayback()
        }

        override fun onConnectionFailed() {
            Log.e(TAG, "browser connection failed")
            listener?.onDisconnected("Não foi possível conectar ao Apple Music")
        }

        override fun onConnectionSuspended() {
            Log.w(TAG, "browser connection suspended")
            listener?.onDisconnected("Conexão com o Apple Music suspensa")
        }
    }

    fun connect() {
        if (browser != null) return
        val created = try {
            MediaBrowser(appContext, SERVICE, connectionCallback, null)
        } catch (t: Throwable) {
            Log.e(TAG, "MediaBrowser could not be created", t)
            listener?.onDisconnected("Apple Music não acessível")
            return
        }
        browser = created
        try {
            created.connect()
        } catch (t: Throwable) {
            Log.e(TAG, "connect() failed", t)
            listener?.onDisconnected("Falha ao conectar ao Apple Music")
        }
    }

    fun reconnect() {
        disconnect()
        connect()
    }

    fun disconnect() {
        controllerCallback?.let { cb -> runCatching { controller?.unregisterCallback(cb) } }
        controllerCallback = null
        controller = null
        subscriptions.clear()
        childrenCache.clear()
        lastCustomActions = emptyList()
        runCatching { browser?.disconnect() }
        browser = null
    }

    /** Subscribes to a browse node; cached children are delivered again immediately. */
    fun subscribe(parentId: String) {
        val cached = childrenCache[parentId]
        if (cached != null) {
            listener?.onChildren(parentId, cached)
            return
        }
        val current = browser ?: return
        if (subscriptions.containsKey(parentId)) return

        val callback = object : MediaBrowser.SubscriptionCallback() {
            override fun onChildrenLoaded(parentId: String, children: List<MediaBrowser.MediaItem>) {
                deliver(parentId, children)
            }

            override fun onChildrenLoaded(
                parentId: String,
                children: List<MediaBrowser.MediaItem>,
                options: Bundle,
            ) {
                deliver(parentId, children)
            }

            override fun onError(parentId: String) {
                Log.w(TAG, "subscribe failed for $parentId")
                listener?.onChildrenFailed(parentId)
            }

            override fun onError(parentId: String, options: Bundle) {
                Log.w(TAG, "subscribe failed for $parentId (with options)")
                listener?.onChildrenFailed(parentId)
            }
        }
        subscriptions[parentId] = callback
        try {
            current.subscribe(parentId, Bundle(), callback)
        } catch (t: Throwable) {
            Log.e(TAG, "subscribe threw for $parentId", t)
            subscriptions.remove(parentId)
            listener?.onChildrenFailed(parentId)
        }
    }

    private fun deliver(parentId: String, children: List<MediaBrowser.MediaItem>) {
        val items = children.map { it.toBrowseItem() }
        childrenCache[parentId] = items
        Log.i(TAG, "children parent=$parentId count=${items.size} art=${items.count { it.artworkUri != null }}")
        listener?.onChildren(parentId, items)
    }

    fun play(mediaId: String) {
        val current = controller
        if (current == null) {
            Log.e(TAG, "playFromMediaId without a MediaController")
            return
        }
        Log.i(TAG, "playFromMediaId $mediaId")
        try {
            current.transportControls.playFromMediaId(mediaId, null)
        } catch (t: Throwable) {
            Log.e(TAG, "playFromMediaId failed", t)
        }
    }

    fun togglePlayPause() {
        val current = controller ?: return
        val state = current.playbackState?.state
        if (state == PlaybackState.STATE_PLAYING) {
            current.transportControls.pause()
        } else {
            current.transportControls.play()
        }
    }

    fun skipNext() {
        controller?.transportControls?.skipToNext()
    }

    fun skipPrevious() {
        controller?.transportControls?.skipToPrevious()
    }

    fun seekTo(positionMs: Long) {
        controller?.transportControls?.seekTo(positionMs)
    }

    /**
     * Sends a session action published by the engine, e.g. the `action` of a
     * [CustomAction] from [customActions] ("Criar Estação", "Favorito", …).
     */
    fun sendCustomAction(actionId: String) {
        val current = controller
        if (current == null) {
            Log.e(TAG, "sendCustomAction without a MediaController: $actionId")
            return
        }
        Log.i(TAG, "sendCustomAction $actionId")
        try {
            current.transportControls.sendCustomAction(actionId, null)
        } catch (t: Throwable) {
            Log.e(TAG, "sendCustomAction failed: $actionId", t)
        }
    }

    /**
     * Re-reads the session position (the position advances while playing). Metadata is
     * deliberately not touched here: `MediaController.getMetadata()` marshals the album
     * art bitmap across a binder transaction, so it is only read from the callbacks.
     */
    fun refreshPlayback() {
        val current = controller ?: return
        current.playbackState?.let { lastState = it }
        emitPlayback()
    }

    private fun attachController() {
        val token = try {
            browser?.sessionToken
        } catch (t: Throwable) {
            Log.e(TAG, "sessionToken failed", t)
            null
        }
        Log.i(TAG, "sessionToken=$token")
        if (token == null) {
            listener?.onDisconnected("Sessão de mídia do Apple Music indisponível")
            return
        }
        val created = MediaController(appContext, token)
        val callback = object : MediaController.Callback() {
            override fun onPlaybackStateChanged(state: PlaybackState?) {
                lastState = state
                emitPlayback()
            }

            override fun onMetadataChanged(metadata: MediaMetadata?) {
                lastMetadata = metadata
                emitPlayback()
            }

            override fun onSessionDestroyed() {
                Log.w(TAG, "media session destroyed")
                listener?.onDisconnected("Sessão de reprodução encerrada")
            }
        }
        created.registerCallback(callback, mainHandler)
        controller = created
        controllerCallback = callback
        lastState = created.playbackState
        lastMetadata = created.metadata
        emitPlayback()
    }

    private fun emitPlayback() {
        val state = lastState
        val metadata = lastMetadata
        val duration = metadata?.getLong(MediaMetadata.METADATA_KEY_DURATION) ?: 0L
        var position = state?.position ?: 0L
        if (state != null && state.state == PlaybackState.STATE_PLAYING) {
            val elapsed = SystemClock.elapsedRealtime() - state.lastPositionUpdateTime
            if (elapsed > 0L) {
                position += (elapsed * state.playbackSpeed).toLong()
            }
        }
        val playing = state != null && (
            state.state == PlaybackState.STATE_PLAYING ||
                state.state == PlaybackState.STATE_BUFFERING ||
                state.state == PlaybackState.STATE_CONNECTING
            )
        val actions = state?.customActions.orEmpty().map { it.toCustomAction() }
        if (actions != lastCustomActions) {
            lastCustomActions = actions
            Log.i(
                TAG,
                "customActions=" + actions.joinToString { "${it.action} (\"${it.title}\", icon=${it.iconResId})" },
            )
        }
        listener?.onPlayback(
            PlaybackSnapshot(
                hasSession = state != null || metadata != null,
                playing = playing,
                positionMs = position.coerceAtLeast(0L),
                durationMs = duration,
                title = metadata?.getString(MediaMetadata.METADATA_KEY_TITLE).orEmpty(),
                artist = metadata?.getString(MediaMetadata.METADATA_KEY_ARTIST).orEmpty(),
                album = metadata?.getString(MediaMetadata.METADATA_KEY_ALBUM).orEmpty(),
                artwork = metadata?.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART)
                    ?: metadata?.getBitmap(MediaMetadata.METADATA_KEY_ART),
                customActions = actions,
            ),
        )
    }

    private fun MediaBrowser.MediaItem.toBrowseItem(): BrowseItem {
        val description: MediaDescription? = description
        return BrowseItem(
            id = mediaId.orEmpty(),
            title = description?.title?.toString().orEmpty(),
            subtitle = description?.subtitle?.toString().orEmpty(),
            browsable = isBrowsable,
            playable = isPlayable,
            artworkUri = description?.iconUri?.toString(),
        )
    }

    private fun PlaybackState.CustomAction.toCustomAction(): CustomAction = CustomAction(
        action = action.orEmpty(),
        title = name?.toString().orEmpty(),
        iconResId = icon,
        extras = extras.toStringMap(),
    )

    private fun Bundle?.toStringMap(): Map<String, String> {
        if (this == null) return emptyMap()
        val flat = LinkedHashMap<String, String>(size())
        for (key in keySet()) {
            flat[key] = get(key)?.toString().orEmpty()
        }
        return flat
    }

    companion object {
        private const val TAG = "AppleMusicTv"

        const val PACKAGE = "com.apple.android.music"
        const val AUTO_ROOT = "__AUTO_ROOT__"

        val SERVICE = ComponentName(PACKAGE, "$PACKAGE.player.MediaPlaybackService")

        fun isAppleMusicInstalled(context: Context): Boolean = try {
            context.packageManager.getPackageInfo(PACKAGE, 0)
            true
        } catch (e: Exception) {
            false
        }
    }
}
