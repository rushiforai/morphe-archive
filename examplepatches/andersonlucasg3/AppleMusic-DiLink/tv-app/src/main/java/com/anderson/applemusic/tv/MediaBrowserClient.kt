package com.anderson.applemusic.tv

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

/** One entry of the Apple Music browse tree. */
data class BrowseItem(
    val id: String,
    val title: String,
    val subtitle: String,
    val browsable: Boolean,
    val playable: Boolean,
    val artworkUri: String? = null,
)

/** What the Apple Music media session is currently doing. */
data class PlaybackSnapshot(
    val hasSession: Boolean = false,
    val playing: Boolean = false,
    val positionMs: Long = 0L,
    val durationMs: Long = 0L,
    val title: String = "",
    val artist: String = "",
    val album: String = "",
    val artwork: Bitmap? = null,
)

/**
 * Thin wrapper around the framework [MediaBrowser] / [MediaController] pair.
 *
 * The patched Apple Music engine exposes its Android Auto browse tree under
 * `__AUTO_ROOT__`; the root returned by [MediaBrowser.getRoot] only holds
 * `ROOT_MEDIA_ITEM`, which is useless for browsing.
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

    /** Re-reads the session state (the position advances while playing). */
    fun refreshPlayback() {
        val current = controller ?: return
        current.playbackState?.let { lastState = it }
        runCatching { current.metadata }.getOrNull()?.let { lastMetadata = it }
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
