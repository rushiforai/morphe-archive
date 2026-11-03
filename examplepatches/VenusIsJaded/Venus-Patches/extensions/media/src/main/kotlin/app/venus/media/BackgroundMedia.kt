package app.venus.media

import android.app.Activity
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.PictureInPictureParams
import android.app.RemoteAction
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Color
import android.graphics.Rect
import android.graphics.drawable.Icon
import android.media.AudioManager
import android.media.MediaMetadata
import android.media.session.MediaSession
import android.media.session.PlaybackState
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.util.Rational
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import org.json.JSONObject
import java.io.File
import java.lang.ref.WeakReference
import java.net.HttpURLConnection
import java.net.URL

/**
 * Keep media playing (#134). Discord plays voice messages, audio files and chat videos in its own native player
 * (com.discord.media_player.MediaPlayer, ExoPlayer underneath) and pauses them the moment Discord leaves the screen:
 * voice messages and audio files through AudioPlayerManager.pauseCurrentPlayer(true) (sent by the JS
 * VoiceMessagesPlaybackManager when the app goes to the background), videos through MediaView's onHostPause.
 *
 * - **Sound** keeps playing instead, in Discord's own player. A media notification (with a MediaSession, so the lock
 *   screen, the quick settings player, Bluetooth buttons and Android Auto all get it) shows who sent it, where, the
 *   progress, play/pause and back/forward buttons. [MediaService] keeps Discord's process alive while it plays.
 *   Coming back to Discord hides the notification: the message's own player takes over again.
 * - **Videos** pop out into Android's picture-in-picture window when you leave Discord while one is playing with sound.
 *   The window shows only the video (a black overlay with a second surface for the same player sits over Discord's UI),
 *   with play/pause and back/forward buttons. Tapping it opens Discord where you were; closing it pauses the video.
 *
 * Settings are read from Venus' settings file at the moment they matter, like [app.venus.audio.Handsfree], so a
 * change applies without restarting. Only Java/Android APIs: the host's Kotlin helpers are obfuscated, and Discord's
 * classes are reached through reflection by their unobfuscated names.
 */
object BackgroundMedia {
    const val NOTIFICATION_ID = 0x7e5a5
    private const val PREFS = "venus-patches.json"
    private const val MAX_PREFS = 4 * 1024 * 1024
    private const val CHANNEL = "venus_media"
    private const val ACTION_TOGGLE = "app.venus.media.TOGGLE"
    private const val ACTION_BACK = "app.venus.media.BACK"
    private const val ACTION_FORWARD = "app.venus.media.FORWARD"
    private const val ACTION_STOP = "app.venus.media.STOP"
    private const val AUDIO_MANAGER = "com.discord.chat.presentation.message.view.voicemessages.AudioPlayerManager"
    private const val PLAYER_MANAGER = "com.discord.media_player.MediaPlayerManager"
    private const val PLAYER_VIEW = "com.discord.media_player.MediaPlayerView"
    private const val MEDIA_VIEW = "com.discord.chat.presentation.message.view.MediaView"

    @Volatile private var appContext: Context? = null
    private val main = Handler(Looper.getMainLooper())

    // Texts in the user's language, sent by Venus settings (labels). English until then.
    private var labels = JSONObject()

    // --- The sound session (voice messages and audio files) ---
    private var session: MediaSession? = null
    private var audioPlayer: Any? = null
    private var audioKey = ""
    private var audioUrl = ""
    private var audioPlaying = false
    private var foreground = false
    private var notification: Notification? = null
    private var art: Bitmap? = null
    private var artUrl = ""
    private val metas = JSONObject()
    private var noisyRegistered = false

    // --- The picture-in-picture window (videos) ---
    private var pipPlayer: Any? = null
    private var pipOriginalView: Any? = null
    private var pipActivity: WeakReference<Activity>? = null
    private var pipOverlay: FrameLayout? = null
    private var pipPlaying = false
    private var pipAspect = Rational(16, 9)
    private var pipExitedAt = 0L

    private var ticking = false
    private var receiverRegistered = false

    /** Remembers Discord's application, right after Application.onCreate's super call. Reads nothing. */
    @JvmStatic
    fun init(context: Context?) {
        appContext = context?.applicationContext ?: context
    }

    // ===================================================================== settings

    /** Venus' settings when Keep media playing is on, or null. A file without the switch on needs no JSON parsing. */
    private fun prefs(): JSONObject? = try {
        val context = appContext
        val file = if (context == null) null else File(context.filesDir, PREFS)
        if (file == null || !file.isFile || file.length() > MAX_PREFS) null
        else {
            val text = String(java.nio.file.Files.readAllBytes(file.toPath()), java.nio.charset.StandardCharsets.UTF_8)
            @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
            val raw = text as java.lang.String
            if (raw.indexOf("\"backgroundMedia\":true") < 0) null
            else {
                val json = JSONObject(text)
                if (json.optBoolean("backgroundMedia", false)) json else null
            }
        }
    } catch (_: Throwable) { null }

    private fun skipMs(): Long {
        val seconds = prefs()?.optInt("backgroundMediaSkip", 10) ?: 10
        return (if (seconds == 5 || seconds == 15 || seconds == 30) seconds else 10) * 1000L
    }

    @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
    private fun jstr(text: String): java.lang.String = text as java.lang.String

    /** A skip button's text, with the skip length in it. */
    private fun skipLabel(key: String, fallback: String): String =
        jstr(label(key, fallback)).replace("{n}", (skipMs() / 1000).toString())

    private fun label(key: String, fallback: String): String {
        val value = labels.optString(key, "")
        return if (value.length == 0) fallback else value
    }

    // ===================================================================== reflection

    private fun classOf(name: String): Class<*>? = try { Class.forName(name, false, BackgroundMedia::class.java.classLoader) } catch (_: Throwable) { null }

    private fun staticField(className: String, name: String): Any? = try {
        val field = classOf(className)!!.getDeclaredField(name)
        field.isAccessible = true
        field.get(null)
    } catch (_: Throwable) { null }

    private fun fieldOf(target: Any?, name: String): Any? {
        var type: Class<*>? = target?.javaClass
        while (type != null) {
            try {
                val field = type.getDeclaredField(name)
                field.isAccessible = true
                return field.get(target)
            } catch (_: NoSuchFieldException) {
                type = type.superclass
            } catch (_: Throwable) { return null }
        }
        return null
    }

    /** Calls the first method named [name] (or starting with it, for Kotlin's mangled value-class getters) with [args]. */
    private fun call(target: Any?, name: String, vararg args: Any?): Any? {
        if (target == null) return null
        var type: Class<*>? = target.javaClass
        while (type != null) {
            val methods = type.declaredMethods
            var i = 0
            while (i < methods.size) {
                val method = methods[i]
                @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
                val methodName = method.name as java.lang.String
                if (method.parameterTypes.size == args.size && (methodName.equals(name) || methodName.startsWith("$name-"))) {
                    return try {
                        method.isAccessible = true
                        method.invoke(target, *args)
                    } catch (_: Throwable) { null }
                }
                i++
            }
            type = type.superclass
        }
        return null
    }

    private fun isTrue(value: Any?) = value is Boolean && value
    private fun longOf(value: Any?) = if (value is Long) value else 0L

    private fun isPlaying(player: Any?) = isTrue(call(player, "isPlaying"))
    private fun position(player: Any?) = Math.max(0L, longOf(call(player, "currentPositionMs")))
    private fun duration(player: Any?): Long {
        val value = longOf(call(player, "durationMs"))
        return if (value > 0 && value < 86400000L) value else 0L
    }

    /** The voice message / audio file player, created by Discord on the first play. */
    private fun currentAudioPlayer(): Any? = staticField(AUDIO_MANAGER, "mediaPlayer")
    private fun audioManagerInstance(): Any? = staticField(AUDIO_MANAGER, "INSTANCE")

    /** The chat video player Discord last made active (MediaView players register here). */
    private fun activeVideoPlayer(): Any? {
        val ref = staticField(PLAYER_MANAGER, "activePlayerRef")
        return if (ref is WeakReference<*>) ref.get() else null
    }

    private fun snowflake(value: Any?): String {
        if (value == null) return ""
        val boxed = call(value, "getSnowflake")
        return if (boxed is Long) boxed.toString() else value.toString()
    }

    /** channelId/messageId/url of what [player] plays, as Discord's MediaSource knows them. */
    private fun sourceInfo(player: Any?): JSONObject {
        val out = JSONObject()
        val source = call(player, "getMediaSource") ?: return out
        try {
            out.put("channelId", snowflake(call(source, "getChannelId")))
            out.put("messageId", (call(source, "getMessageId") ?: "").toString())
            out.put("url", (call(source, "getSourceUrl") ?: "").toString())
        } catch (_: Throwable) { }
        return out
    }

    // ===================================================================== hooks

    /**
     * AudioPlayerManager.pauseCurrentPlayer(remember): Discord pauses with remember = true only because the app went to the
     * background. While the switch is on and something is playing, that pause is skipped and the media notification
     * takes over. Every other pause (audio focus lost, sign out, the user) goes through.
     */
    @JvmStatic
    fun keepAudio(remember: Boolean): Boolean {
        if (!remember) return false
        return try {
            val prefs = prefs() ?: return false
            if (!prefs.optBoolean("backgroundMediaAudio", true)) return false
            val player = currentAudioPlayer() ?: return false
            if (!isPlaying(player)) return false
            startAudio(player)
            true
        } catch (_: Throwable) { false }
    }

    /** MediaView's onHostPause: the video in the picture-in-picture window keeps playing. */
    @JvmStatic
    fun keepVideo(mediaView: View?): Boolean {
        val player = pipPlayer ?: return false
        return mediaView != null && fieldOf(mediaView, "mediaPlayer") === player
    }

    /** MainActivity.onUserLeaveHint (Home, Recents, another app): a video playing with sound pops out. */
    @JvmStatic
    fun onUserLeaveHint(activity: Activity?): Boolean {
        if (activity == null || Build.VERSION.SDK_INT < 26) return false
        return try {
            val prefs = prefs()
            if (prefs != null && prefs.optBoolean("backgroundMediaAudio", true) && isPlaying(currentAudioPlayer())) {
                // Start the service while Discord is still in front: Android 12+ refuses it a moment later.
                startAudio(currentAudioPlayer()!!)
            }
            if (prefs == null || !prefs.optBoolean("backgroundMediaVideo", true)) return false
            // In a call Discord's own picture-in-picture shows the call; never take it over.
            val audio = activity.getSystemService(AudioManager::class.java)
            if (audio != null && audio.mode == AudioManager.MODE_IN_COMMUNICATION) return false
            if (activity.isInPictureInPictureMode || !activity.packageManager.hasSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE)) return false
            val player = activeVideoPlayer() ?: return false
            if (!isPlaying(player) || isTrue(call(player, "isMuted"))) return false
            val source = call(player, "getMediaSource")
            if (source != null && isTrue(call(source, "isGifv"))) return false
            if (source != null && !isTrue(call(source, "isVideo")) && !isTrue(fieldOf(player, "hasVideoTrack"))) return false
            val mediaView = findMediaView(activity.window.decorView, player)
            val playerView = if (mediaView == null) null else fieldOf(mediaView, "mediaPlayerView")
            val surface = call(playerView, "getView") as? View
            val hint = Rect()
            pipAspect = Rational(16, 9)
            if (surface != null && surface.width > 0 && surface.height > 0) {
                pipAspect = clampAspect(surface.width, surface.height)
                surface.getGlobalVisibleRect(hint)
            }
            // The video's own size (ExoPlayer's VideoSize: width d, height e) beats the chat thumbnail's.
            val size = call(fieldOf(player, "exoPlayer"), "z")
            if (size != null && jstr(size.javaClass.name).endsWith("VideoSize")) {
                val w = fieldOf(size, "d") as? Int ?: 0
                val h = fieldOf(size, "e") as? Int ?: 0
                if (w > 0 && h > 0) pipAspect = clampAspect(w, h)
            }
            pipPlayer = player
            pipOriginalView = playerView
            pipActivity = WeakReference(activity)
            pipPlaying = true
            val builder = pipParams(activity, true)
            if (!hint.isEmpty) builder.setSourceRectHint(hint)
            if (activity.enterPictureInPictureMode(builder.build())) { tick(); true }
            else { clearPip(); false }
        } catch (_: Throwable) { clearPip(); false }
    }

    /**
     * ReactActivity.onPause: the screen is turning off. Android only lets an app start a foreground service while it's still
     * in front, so the notification and service start now, before Discord's own background pause arrives.
     */
    @JvmStatic
    fun onPause(activity: Activity?) {
        try {
            val power = activity?.getSystemService(android.os.PowerManager::class.java) ?: return
            if (power.isInteractive) return
            val prefs = prefs() ?: return
            val player = currentAudioPlayer() ?: return
            if (prefs.optBoolean("backgroundMediaAudio", true) && isPlaying(player)) startAudio(player)
        } catch (_: Throwable) { }
    }

    /** MainActivity.onPictureInPictureModeChanged: show only the video in the window, and give it back afterwards. */
    @JvmStatic
    fun onPipModeChanged(activity: Activity?, inPip: Boolean): Boolean {
        val player = pipPlayer ?: return false
        try {
            if (inPip) {
                if (activity == null || pipOverlay != null) return true
                val decor = activity.window.decorView as? ViewGroup ?: return true
                val overlay = FrameLayout(activity)
                overlay.setBackgroundColor(Color.BLACK)
                overlay.isClickable = true
                val view = classOf(PLAYER_VIEW)!!.getConstructor(Context::class.java).newInstance(activity)
                val surface = call(view, "getView") as View
                // Letterbox instead of Discord's crop, so the whole picture shows in the window.
                call(call(view, "getPlayerView"), "setResizeMode", 0)
                overlay.addView(surface, FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT, Gravity.CENTER))
                decor.addView(overlay, ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT))
                pipOverlay = overlay
                call(player, "reattachSurface", view)
            } else {
                pipExitedAt = SystemClock.uptimeMillis()
                restorePipSurface()
                // Expanding the window resumes Discord; closing it stops Discord instead (see onStop).
                main.postDelayed(Runnable { if (pipOverlay == null && pipActivity?.get()?.isInPictureInPictureMode != true) clearPip() }, 1500)
            }
        } catch (_: Throwable) { restorePipSurface(); clearPip() }
        return true
    }

    /** MainActivity.onStop: Discord stopped while (or right after) in the window, so the window was closed: pause. */
    @JvmStatic
    fun onStop(activity: Activity?) {
        val player = pipPlayer ?: return
        if (activity?.isInPictureInPictureMode == true || SystemClock.uptimeMillis() - pipExitedAt < 1500) {
            call(player, "pause")
            restorePipSurface()
            clearPip()
        }
    }

    /** MainActivity.onResume: back in Discord, the message's own player takes over from the notification. */
    @JvmStatic
    fun onResume(activity: Activity?) {
        if (session != null) main.post(Runnable { endAudio(false) })
    }

    // ===================================================================== picture-in-picture

    private fun clampAspect(width: Int, height: Int): Rational {
        // Android accepts 1:2.39 to 2.39:1.
        val ratio = width.toDouble() / height.toDouble()
        if (ratio > 2.39) return Rational(239, 100)
        if (ratio < 1 / 2.39) return Rational(100, 239)
        return Rational(width, height)
    }

    private fun findMediaView(view: View?, player: Any): View? {
        if (view == null) return null
        if (view.javaClass.name == MEDIA_VIEW && fieldOf(view, "mediaPlayer") === player) return view
        if (view is ViewGroup) {
            var i = 0
            while (i < view.childCount) {
                val found = findMediaView(view.getChildAt(i), player)
                if (found != null) return found
                i++
            }
        }
        return null
    }

    private fun pipParams(context: Context, playing: Boolean): PictureInPictureParams.Builder {
        val skip = (skipMs() / 1000).toString()
        val actions = ArrayList<RemoteAction>()
        actions.add(remote(context, android.R.drawable.ic_media_rew, skipLabel("back", "Skip back"), ACTION_BACK, 11))
        actions.add(if (playing) remote(context, android.R.drawable.ic_media_pause, label("pause", "Pause"), ACTION_TOGGLE, 12)
            else remote(context, android.R.drawable.ic_media_play, label("play", "Play"), ACTION_TOGGLE, 12))
        actions.add(remote(context, android.R.drawable.ic_media_ff, skipLabel("forward", "Skip forward"), ACTION_FORWARD, 13))
        val builder = PictureInPictureParams.Builder().setAspectRatio(pipAspect).setActions(actions)
        if (Build.VERSION.SDK_INT >= 31) builder.setSeamlessResizeEnabled(true)
        return builder
    }

    private fun remote(context: Context, icon: Int, title: String, action: String, code: Int): RemoteAction {
        registerReceiver()
        val intent = PendingIntent.getBroadcast(context, code, Intent(action + ".VIDEO").setPackage(context.packageName),
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)
        return RemoteAction(Icon.createWithResource(context, icon), title, title, intent)
    }

    private fun refreshPip() {
        val activity = pipActivity?.get() ?: return
        try { if (Build.VERSION.SDK_INT >= 26 && activity.isInPictureInPictureMode) activity.setPictureInPictureParams(pipParams(activity, pipPlaying).build()) } catch (_: Throwable) { }
    }

    private fun restorePipSurface() {
        val overlay = pipOverlay
        pipOverlay = null
        try { (overlay?.parent as? ViewGroup)?.removeView(overlay) } catch (_: Throwable) { }
        val original = pipOriginalView
        if (original != null) call(pipPlayer, "reattachSurface", original)
    }

    private fun clearPip() {
        pipPlayer = null
        pipOriginalView = null
        pipActivity = null
        pipOverlay = null
    }

    // ===================================================================== sound session

    private fun startAudio(player: Any) {
        val context = appContext ?: return
        val info = sourceInfo(player)
        val key = info.optString("messageId", "") + "|" + info.optString("url", "")
        if (session != null && audioPlayer === player && key == audioKey) { promote(); return }
        audioPlayer = player
        audioKey = key
        audioUrl = info.optString("url", "")
        audioPlaying = true
        if (Build.VERSION.SDK_INT >= 26) {
            val manager = context.getSystemService(NotificationManager::class.java)
            if (manager.getNotificationChannel(CHANNEL) == null || manager.getNotificationChannel(CHANNEL).name.toString() != label("channel", "Media playback")) {
                val channel = NotificationChannel(CHANNEL, label("channel", "Media playback"), NotificationManager.IMPORTANCE_LOW)
                channel.setShowBadge(false)
                channel.setSound(null, null)
                channel.enableVibration(false)
                manager.createNotificationChannel(channel)
            }
        }
        val media = session ?: MediaSession(context, "Venus").also { session = it }
        media.setCallback(SessionCallback)
        media.isActive = true
        registerReceiver()
        registerNoisy(true)
        refreshAudio(true)
        promote()
        tick()
    }

    private fun endAudio(pause: Boolean) {
        if (pause) call(audioManagerInstance(), "pauseCurrentPlayer", false)
        registerNoisy(false)
        try { session?.isActive = false; session?.release() } catch (_: Throwable) { }
        session = null
        audioPlayer = null
        audioKey = ""
        notification = null
        foreground = false
        try { MediaService.instance?.let { it.demote(); it.stopSelf() } } catch (_: Throwable) { }
        try { appContext?.getSystemService(NotificationManager::class.java)?.cancel(NOTIFICATION_ID) } catch (_: Throwable) { }
    }

    /** Keeps Discord running: the service carries the notification while sound plays. */
    private fun promote() {
        val context = appContext ?: return
        val service = MediaService.instance
        if (service != null) { foreground = service.promote(); return }
        try {
            val intent = Intent(context, MediaService::class.java)
            val started = if (Build.VERSION.SDK_INT >= 26) context.startForegroundService(intent) else context.startService(intent)
            foreground = started != null
        } catch (_: Throwable) { foreground = false }
        if (!foreground) post()
    }

    /** Paused: the notification stays (it can be swiped away now) but no longer keeps Discord running. */
    private fun demote() {
        MediaService.instance?.demote()
        foreground = false
        post()
    }

    private fun post() {
        val built = notification ?: return
        try { appContext?.getSystemService(NotificationManager::class.java)?.notify(NOTIFICATION_ID, built) } catch (_: Throwable) { }
    }

    /** The notification [MediaService] shows; a quiet placeholder when the session already ended. */
    @JvmStatic
    fun currentNotification(): Notification? {
        val built = notification
        if (built != null) return built
        val context = appContext ?: return null
        val builder = if (Build.VERSION.SDK_INT >= 26) Notification.Builder(context, CHANNEL) else @Suppress("DEPRECATION") Notification.Builder(context)
        return builder.setSmallIcon(smallIcon(context)).setContentTitle(label("audio", "Audio")).build()
    }

    private fun smallIcon(context: Context): Int {
        val id = context.resources.getIdentifier("ic_notification_24dp", "drawable", context.packageName)
        return if (id != 0) id else android.R.drawable.ic_media_play
    }

    private fun meta(): JSONObject? {
        val id = audioKey.substring(0, Math.max(0, jstr(audioKey).indexOf("|")))
        return if (id.length > 0) metas.optJSONObject(id) else null
    }

    /** Rebuilds the session's metadata, playback state and notification from the player. */
    private fun refreshAudio(metadataToo: Boolean) {
        val context = appContext ?: return
        val media = session ?: return
        val player = audioPlayer
        val meta = meta()
        val title = meta?.optString("title", "")?.let { if (it.length > 0) it else null } ?: fileTitle()
        val artist = meta?.optString("artist", "") ?: ""
        val where = meta?.optString("where", "") ?: ""
        val length = duration(player)
        if (metadataToo) {
            val metadata = MediaMetadata.Builder()
                .putString(MediaMetadata.METADATA_KEY_TITLE, title)
                .putString(MediaMetadata.METADATA_KEY_ARTIST, if (artist.length > 0) artist else "Discord")
                .putString(MediaMetadata.METADATA_KEY_ALBUM, where)
                .putLong(MediaMetadata.METADATA_KEY_DURATION, if (length > 0) length else -1L)
            val picture = art
            if (picture != null) metadata.putBitmap(MediaMetadata.METADATA_KEY_ART, picture)
            media.setMetadata(metadata.build())
            loadArt(meta?.optString("art", "") ?: "")
        }
        val skip = (skipMs() / 1000).toString()
        val state = PlaybackState.Builder()
            .setActions(PlaybackState.ACTION_PLAY or PlaybackState.ACTION_PAUSE or PlaybackState.ACTION_PLAY_PAUSE or PlaybackState.ACTION_STOP or
                PlaybackState.ACTION_SEEK_TO or PlaybackState.ACTION_REWIND or PlaybackState.ACTION_FAST_FORWARD)
            .setState(if (audioPlaying) PlaybackState.STATE_PLAYING else PlaybackState.STATE_PAUSED, position(player), if (audioPlaying) 1f else 0f)
            .addCustomAction(PlaybackState.CustomAction.Builder(ACTION_BACK, skipLabel("back", "Skip back"), android.R.drawable.ic_media_rew).build())
            .addCustomAction(PlaybackState.CustomAction.Builder(ACTION_FORWARD, skipLabel("forward", "Skip forward"), android.R.drawable.ic_media_ff).build())
            .build()
        media.setPlaybackState(state)

        val builder = if (Build.VERSION.SDK_INT >= 26) Notification.Builder(context, CHANNEL) else @Suppress("DEPRECATION") Notification.Builder(context)
        builder.setSmallIcon(smallIcon(context))
            .setContentTitle(title)
            .setContentText(if (artist.length > 0 && where.length > 0) "$artist · $where" else if (artist.length > 0) artist else where)
            .setOngoing(audioPlaying)
            .setShowWhen(false)
            .setOnlyAlertOnce(true)
            .setVisibility(Notification.VISIBILITY_PUBLIC)
            .setCategory(Notification.CATEGORY_TRANSPORT)
            .setContentIntent(openIntent(context, meta?.optString("link", "") ?: ""))
            .setDeleteIntent(broadcast(context, ACTION_STOP, 4))
            .addAction(Notification.Action.Builder(Icon.createWithResource(context, android.R.drawable.ic_media_rew), skipLabel("back", "Skip back"), broadcast(context, ACTION_BACK, 1)).build())
            .addAction(if (audioPlaying) Notification.Action.Builder(Icon.createWithResource(context, android.R.drawable.ic_media_pause), label("pause", "Pause"), broadcast(context, ACTION_TOGGLE, 2)).build()
                else Notification.Action.Builder(Icon.createWithResource(context, android.R.drawable.ic_media_play), label("play", "Play"), broadcast(context, ACTION_TOGGLE, 2)).build())
            .addAction(Notification.Action.Builder(Icon.createWithResource(context, android.R.drawable.ic_media_ff), skipLabel("forward", "Skip forward"), broadcast(context, ACTION_FORWARD, 3)).build())
            .setStyle(Notification.MediaStyle().setMediaSession(media.sessionToken).setShowActionsInCompactView(0, 1, 2))
        val picture = art
        if (picture != null) builder.setLargeIcon(picture)
        val color = meta?.optInt("color", 0) ?: 0
        if (color != 0) builder.setColor(color)
        notification = builder.build()
    }

    /** "Voice message", or the audio file's name, until Venus settings sends the message's details. */
    private fun fileTitle(): String {
        val url = audioUrl
        if (url.length == 0) return label("voice", "Voice message")
        var path = url
        val query = jstr(path).indexOf("?")
        if (query >= 0) path = path.substring(0, query)
        val name = Uri.decode(path.substring(jstr(path).lastIndexOf("/") + 1)) ?: ""
        val lower = jstr(jstr(name).toLowerCase(java.util.Locale.ROOT))
        return if (name.length == 0 || lower.startsWith("voice-message")) label("voice", "Voice message") else name
    }

    private fun openIntent(context: Context, link: String): PendingIntent {
        var intent: Intent? = null
        if (link.length > 0) {
            val view = Intent(Intent.ACTION_VIEW, Uri.parse(link)).setPackage(context.packageName)
            if (view.resolveActivity(context.packageManager) != null) intent = view
        }
        if (intent == null) intent = context.packageManager.getLaunchIntentForPackage(context.packageName) ?: Intent()
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        return PendingIntent.getActivity(context, 5, intent, PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)
    }

    private fun broadcast(context: Context, action: String, code: Int): PendingIntent =
        PendingIntent.getBroadcast(context, code, Intent(action).setPackage(context.packageName), PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)

    /** The sender's picture, downloaded once off the main thread. */
    private fun loadArt(url: String) {
        if (url.length == 0 || url == artUrl) return
        artUrl = url
        art = null
        val wanted = url
        Thread(Runnable {
            var bitmap: Bitmap? = null
            try {
                val connection = URL(wanted).openConnection() as HttpURLConnection
                connection.connectTimeout = 8000
                connection.readTimeout = 8000
                val stream = connection.inputStream
                try { bitmap = BitmapFactory.decodeStream(stream) } finally { stream.close(); connection.disconnect() }
            } catch (_: Throwable) { }
            val loaded = bitmap ?: return@Runnable
            main.post(Runnable {
                if (artUrl != wanted || session == null) return@Runnable
                art = loaded
                refreshAudio(true)
                if (foreground) MediaService.instance?.promote() else post()
            })
        }, "venus-media-art").start()
    }

    private fun registerNoisy(on: Boolean) {
        val context = appContext ?: return
        try {
            if (on && !noisyRegistered) {
                if (Build.VERSION.SDK_INT >= 33) context.registerReceiver(NoisyReceiver, IntentFilter(AudioManager.ACTION_AUDIO_BECOMING_NOISY), Context.RECEIVER_EXPORTED)
                else context.registerReceiver(NoisyReceiver, IntentFilter(AudioManager.ACTION_AUDIO_BECOMING_NOISY))
                noisyRegistered = true
            } else if (!on && noisyRegistered) {
                context.unregisterReceiver(NoisyReceiver)
                noisyRegistered = false
            }
        } catch (_: Throwable) { }
    }

    private fun registerReceiver() {
        if (receiverRegistered) return
        val context = appContext ?: return
        val filter = IntentFilter()
        filter.addAction(ACTION_TOGGLE); filter.addAction(ACTION_BACK); filter.addAction(ACTION_FORWARD); filter.addAction(ACTION_STOP)
        filter.addAction("$ACTION_TOGGLE.VIDEO"); filter.addAction("$ACTION_BACK.VIDEO"); filter.addAction("$ACTION_FORWARD.VIDEO")
        try {
            if (Build.VERSION.SDK_INT >= 33) context.registerReceiver(ActionReceiver, filter, Context.RECEIVER_NOT_EXPORTED)
            else context.registerReceiver(ActionReceiver, filter)
            receiverRegistered = true
        } catch (_: Throwable) { }
    }

    // ===================================================================== controls

    private fun audioAction(action: String) {
        val player = audioPlayer ?: return
        when (action) {
            ACTION_TOGGLE -> if (isPlaying(player)) call(audioManagerInstance(), "pauseCurrentPlayer", false)
                else { if (call(audioManagerInstance(), "playOrReset") == null && !isPlaying(player)) call(player, "play") }
            ACTION_BACK -> call(player, "seekTo", Math.max(0L, position(player) - skipMs()))
            ACTION_FORWARD -> { val end = duration(player); val to = position(player) + skipMs(); call(player, "seekTo", if (end > 0) Math.min(end, to) else to) }
            ACTION_STOP -> { endAudio(true); return }
        }
        main.postDelayed(Runnable { sync() }, 120)
    }

    private fun videoAction(action: String) {
        val player = pipPlayer ?: return
        when (action) {
            ACTION_TOGGLE -> if (isPlaying(player)) call(player, "pause") else call(player, "play")
            ACTION_BACK -> call(player, "seekTo", Math.max(0L, position(player) - skipMs()))
            ACTION_FORWARD -> { val end = duration(player); val to = position(player) + skipMs(); call(player, "seekTo", if (end > 0) Math.min(end, to) else to) }
        }
        main.postDelayed(Runnable { sync() }, 120)
    }

    /** Follows the players: play/pause from anywhere (the message's own button too), and the end of the recording. */
    private fun sync() {
        if (pipPlayer != null) {
            val playing = isPlaying(pipPlayer)
            if (playing != pipPlaying) { pipPlaying = playing; refreshPip() }
        }
        val player = audioPlayer
        if (session != null && player != null) {
            if (currentAudioPlayer() !== player || isTrue(call(player, "hasEnded"))) { endAudio(false); return }
            val playing = isPlaying(player)
            if (playing != audioPlaying) {
                audioPlaying = playing
                refreshAudio(false)
                if (playing) promote() else demote()
            }
        }
    }

    private fun tick() {
        if (ticking) return
        ticking = true
        main.postDelayed(object : Runnable {
            override fun run() {
                try { sync() } catch (_: Throwable) { }
                if (session != null || pipPlayer != null) main.postDelayed(this, 1000) else ticking = false
            }
        }, 1000)
    }

    private object ActionReceiver : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            val action = intent?.action ?: return
            try {
                if (jstr(action).endsWith(".VIDEO")) videoAction(action.substring(0, action.length - 6)) else audioAction(action)
            } catch (_: Throwable) { }
        }
    }

    private object NoisyReceiver : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            // Headphones unplugged or disconnected: pause instead of playing out loud.
            if (intent?.action == AudioManager.ACTION_AUDIO_BECOMING_NOISY && audioPlaying) audioAction(ACTION_TOGGLE)
        }
    }

    private object SessionCallback : MediaSession.Callback() {
        override fun onPlay() { if (!audioPlaying) audioAction(ACTION_TOGGLE) }
        override fun onPause() { if (audioPlaying) audioAction(ACTION_TOGGLE) }
        override fun onStop() { audioAction(ACTION_STOP) }
        override fun onRewind() { audioAction(ACTION_BACK) }
        override fun onFastForward() { audioAction(ACTION_FORWARD) }
        override fun onSeekTo(pos: Long) { call(audioPlayer, "seekTo", Math.max(0L, pos)); main.postDelayed(Runnable { refreshAudio(false); post() }, 120) }
        override fun onCustomAction(action: String, extras: android.os.Bundle?) { audioAction(action) }
    }

    // ===================================================================== bridge

    /**
     * Venus settings, through FileModule.moveFile with a private prefix: "venus-media-v1:" + JSON.
     *  - {action:"labels", labels:{...}}: the texts above in the user's language.
     *  - {action:"now"}: what the voice message / audio player is on ({channelId, messageId, url}), so settings can look
     *    the message up.
     *  - {action:"meta", messageId, title, artist, where, art, link, color}: that message's details for the notification.
     */
    @JvmStatic
    fun dispatch(request: String, promise: com.facebook.react.bridge.Promise): Boolean {
        return try {
            val json = JSONObject(request.substring("venus-media-v1:".length))
            when (json.optString("action")) {
                "labels" -> { labels = json.optJSONObject("labels") ?: JSONObject(); promise.resolve(true) }
                "now" -> {
                    val done = java.util.concurrent.CountDownLatch(1)
                    val out = arrayOf<String?>(null)
                    main.post(Runnable { try { out[0] = sourceInfo(currentAudioPlayer()).toString() } catch (_: Throwable) { }; done.countDown() })
                    done.await(500, java.util.concurrent.TimeUnit.MILLISECONDS)
                    promise.resolve(out[0] ?: "{}")
                }
                "meta" -> {
                    val id = json.optString("messageId", "")
                    main.post(Runnable {
                        if (id.length > 0) {
                            if (metas.length() > 30) { val keys = metas.keys(); while (keys.hasNext()) { keys.next(); keys.remove() } }
                            metas.put(id, json)
                            if (session != null && jstr(audioKey).startsWith("$id|")) { refreshAudio(true); if (foreground) MediaService.instance?.promote() else post() }
                        }
                    })
                    promise.resolve(true)
                }
                else -> promise.resolve(false)
            }
            true
        } catch (_: Throwable) {
            try { promise.resolve(false) } catch (_: Throwable) { }
            true
        }
    }
}
