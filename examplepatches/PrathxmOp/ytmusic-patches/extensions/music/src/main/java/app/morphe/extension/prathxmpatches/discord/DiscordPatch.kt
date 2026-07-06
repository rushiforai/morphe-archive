package app.morphe.extension.prathxmpatches.discord


import android.media.MediaMetadata as AndroidMediaMetadata
import android.media.session.PlaybackState
import app.morphe.extension.prathxmpatches.settings.Settings
import app.morphe.extension.shared.Utils
import timber.log.Timber

object DiscordPatch {
    private const val TAG = "DiscordSvc"

    private var currentMetadata: AndroidMediaMetadata? = null
    private var currentPlaybackState: PlaybackState? = null
    private var mediaSession: android.media.session.MediaSession? = null
    private var isInitialized = false
    @Volatile
    private var videoIdUpdated = false

    init {
        android.util.Log.e("DiscordSvc", "DiscordPatch class loaded!")
    }

    private val queueIdToVideoId = java.util.concurrent.ConcurrentHashMap<Long, String>()
    private val titleToVideoId = java.util.concurrent.ConcurrentHashMap<String, String>()

    private fun extractVideoId(url: String): String? {
        if (url.contains("/vi/")) {
            val parts = url.split("/vi/")
            if (parts.size > 1) {
                val idPart = parts[1]
                if (idPart.length >= 11) {
                    return idPart.substring(0, 11)
                }
            }
        }
        return null
    }

    private fun updateQueueVideoIds(queue: List<android.media.session.MediaSession.QueueItem>?) {
        if (queue == null) return
        for (item in queue) {
            val desc = item.description
            val iconUriStr = desc.iconUri?.toString()
            if (!iconUriStr.isNullOrEmpty()) {
                val videoId = extractVideoId(iconUriStr)
                if (videoId != null) {
                    queueIdToVideoId[item.queueId] = videoId
                    val title = desc.title?.toString()
                    val artist = desc.subtitle?.toString()
                    if (!title.isNullOrEmpty()) {
                        val key = if (!artist.isNullOrEmpty()) "$title - $artist" else title
                        titleToVideoId[key.lowercase()] = videoId
                    }
                }
            }
        }
    }

    @JvmStatic
    var currentVideoId: String? = null

    @JvmStatic
    fun setVideoId(videoId: String?) {
        android.util.Log.e("DiscordSvc", "setVideoId: $videoId")
        currentVideoId = videoId
        videoIdUpdated = true
        if (currentMetadata != null) {
            updatePresence()
        }
    }

    @JvmStatic
    fun onSetPlaybackState(state: PlaybackState?) {
        android.util.Log.e("DiscordSvc", "onSetPlaybackState: state=${state?.state}")
        if (state == null) return
        currentPlaybackState = state
        updatePresence()
    }

    @JvmStatic
    fun onSetMetadata(session: android.media.session.MediaSession?, metadata: AndroidMediaMetadata?) {
        android.util.Log.e("DiscordSvc", "onSetMetadata: session=$session, metadata=$metadata")
        mediaSession = session
        if (metadata == null) return

        val newTitle = metadata.getString(AndroidMediaMetadata.METADATA_KEY_TITLE)
        val newArtist = metadata.getString(AndroidMediaMetadata.METADATA_KEY_ARTIST)

        val oldTitle = currentMetadata?.getString(AndroidMediaMetadata.METADATA_KEY_TITLE)
        val oldArtist = currentMetadata?.getString(AndroidMediaMetadata.METADATA_KEY_ARTIST)

        if (newTitle != oldTitle || newArtist != oldArtist) {
            currentVideoId = null
        }
        videoIdUpdated = false

        currentMetadata = metadata
        updatePresence()
    }

    @JvmStatic
    fun onSetQueue(session: android.media.session.MediaSession?, queue: List<android.media.session.MediaSession.QueueItem>?) {
        android.util.Log.e("DiscordSvc", "onSetQueue: session=$session, queueSize=${queue?.size ?: 0}")
        mediaSession = session
        updateQueueVideoIds(queue)
        if (currentMetadata != null) {
            updatePresence()
        }
    }

    private fun updatePresence() {
        val context = Utils.getContext() ?: run {
            android.util.Log.e("DiscordSvc", "updatePresence: context is null!")
            return
        }
        if (!isInitialized) {
            android.util.Log.e("DiscordSvc", "updatePresence: initializing DiscordRpcManager")
            DiscordRpcManager.init(context)
            isInitialized = true
        }

        val enabled = Settings.DISCORD_RPC_ENABLED.get()
        val token = DiscordTokenStore.retrieve()
        val authorized = !token.isNullOrEmpty()

        android.util.Log.e("DiscordSvc", "updatePresence: enabled=$enabled, authorized=$authorized, tokenLength=${token?.length ?: 0}")

        if (!enabled || !authorized) {
            // Disconnect gateway if enabled flag or auth state changes
            if (DiscordRpcManager.isAuthorized()) {
                android.util.Log.d("DiscordSvc", "updatePresence: disconnecting because enabled=$enabled, authorized=$authorized")
                DiscordRpcManager.disconnect()
            }
            return
        }

        // If enabled and authorized, ensure connected/reconnecting
        if (!DiscordRpcManager.isAuthorized() && !token.isNullOrEmpty()) {
            if (DiscordRpcManager.connectionStatus.value == DiscordRpcManager.Status.Disconnected) {
                Timber.tag(TAG).i("updatePresence: RPC enabled but not active, reconnecting with saved token")
                DiscordRpcManager.reconnectWithToken(token)
            }
        }

        val metadata = currentMetadata ?: return
        val state = currentPlaybackState ?: return

        // Log all metadata keys using the public keySet() API
        try {
            val keys = metadata.keySet()
            android.util.Log.e("DiscordSvc", "keySet size: ${keys.size}")
            for (key in keys) {
                val value = try { metadata.getString(key) } catch (e: Throwable) {
                    try { metadata.getLong(key).toString() } catch (e2: Throwable) { "unknown_type" }
                }
                android.util.Log.e("DiscordSvc", "Metadata key: $key = $value")
            }
        } catch (e: Throwable) {
            android.util.Log.e("DiscordSvc", "Failed to log metadata keys via keySet()", e)
        }

        val title = metadata.getString(AndroidMediaMetadata.METADATA_KEY_TITLE) ?: return
        val artist = metadata.getString(AndroidMediaMetadata.METADATA_KEY_ARTIST) ?: ""
        val album = metadata.getString(AndroidMediaMetadata.METADATA_KEY_ALBUM) ?: ""
        var songId = currentVideoId ?: metadata.getString(AndroidMediaMetadata.METADATA_KEY_MEDIA_ID) ?: ""
        val durationMs = metadata.getLong(AndroidMediaMetadata.METADATA_KEY_DURATION)

        val isPlaying = state.state == PlaybackState.STATE_PLAYING
        val positionMs = state.position

        val startTimestamp = if (isPlaying) {
            if (state.lastPositionUpdateTime > 0) {
                val lastActiveWallTime = System.currentTimeMillis() - (android.os.SystemClock.elapsedRealtime() - state.lastPositionUpdateTime)
                lastActiveWallTime - positionMs
            } else {
                System.currentTimeMillis() - positionMs
            }
        } else {
            0L
        }

        val endTimestamp = if (isPlaying && durationMs > 0) {
            startTimestamp + durationMs
        } else {
            null
        }

        var artUri = ""
        var activeQueueItemId = -1L

        // Extract songId and artUri from MediaSession queue if possible
        try {
            val session = mediaSession
            val controller = session?.controller
            if (controller != null) {
                val queue = controller.queue
                val playbackState = controller.playbackState
                activeQueueItemId = playbackState?.activeQueueItemId ?: -1L
                android.util.Log.e("DiscordSvc", "MediaSession queue size: ${queue?.size ?: 0}, activeQueueItemId: $activeQueueItemId")
                
                updateQueueVideoIds(queue)

                if (queue != null) {
                    for (item in queue) {
                        val desc = item.description
                        android.util.Log.e("DiscordSvc", "QueueItem: id=${item.queueId}, title=${desc.title}, mediaId=${desc.mediaId}, iconUri=${desc.iconUri}, mediaUri=${desc.mediaUri}")
                        
                        // Compare explicitly using toLong() to avoid boxing / type mismatch issues
                        if (item.queueId.toLong() == activeQueueItemId.toLong()) {
                            android.util.Log.e("DiscordSvc", "Matched active queue item: id=${item.queueId}")
                            val qMediaId = desc.mediaId
                            val qIconUri = desc.iconUri?.toString()
                            if (songId.isEmpty() && !qMediaId.isNullOrEmpty()) {
                                songId = qMediaId
                            }
                            if (!qIconUri.isNullOrEmpty()) {
                                artUri = qIconUri
                            }
                        }
                    }
                }
            }
        } catch (e: Throwable) {
            android.util.Log.e("DiscordSvc", "Failed to extract from MediaSession queue", e)
        }

        // Try looking up in our queue video ID maps if still empty
        if (songId.isEmpty() && activeQueueItemId != -1L) {
            songId = queueIdToVideoId[activeQueueItemId].orEmpty()
        }
        if (songId.isEmpty() && title.isNotEmpty()) {
            val key = if (artist.isNotEmpty()) "$title - $artist" else title
            songId = titleToVideoId[key.lowercase()] ?: titleToVideoId[title.lowercase()].orEmpty()
        }

        if (songId.length == 11) {
            artUri = "https://i.ytimg.com/vi/$songId/hqdefault.jpg"
        }

        if (artUri.isEmpty()) {
            val metaUri = metadata.getString(AndroidMediaMetadata.METADATA_KEY_ART_URI)
                ?: metadata.getString(AndroidMediaMetadata.METADATA_KEY_ALBUM_ART_URI)
                ?: metadata.getString(AndroidMediaMetadata.METADATA_KEY_DISPLAY_ICON_URI)
            if (metaUri != null && metaUri.startsWith("http")) {
                artUri = metaUri
            }
        }

        android.util.Log.e("DiscordSvc", "updatePresence: songId=$songId, title=$title, artist=$artist, album=$album, artUri=$artUri")

        val song = MediaMetadata(
            id = songId,
            thumbnailUrl = artUri
        )

        val activity = DiscordActivityBuilder.build(
            song = song,
            artistName = artist,
            albumName = album,
            artistThumbnail = null,
            songTitle = title,
            startTimestamp = startTimestamp,
            endTimestamp = endTimestamp,
            advancedMode = true,
            stateTemplate = Settings.DISCORD_RPC_STATE_TEMPLATE.get(),
            detailsTemplate = Settings.DISCORD_RPC_DETAILS_TEMPLATE.get(),
            btn1Enabled = true,
            btn1Label = Settings.DISCORD_RPC_BUTTON1_LABEL.get(),
            btn1Url = Settings.DISCORD_RPC_BUTTON1_URL.get(),
            btn2Enabled = true,
            btn2Label = Settings.DISCORD_RPC_BUTTON2_LABEL.get(),
            btn2Url = Settings.DISCORD_RPC_BUTTON2_URL.get()
        )

        DiscordRpcManager.setActivity(
            activity = activity,
            songId = songId,
            isPlaying = isPlaying
        )
    }
}
