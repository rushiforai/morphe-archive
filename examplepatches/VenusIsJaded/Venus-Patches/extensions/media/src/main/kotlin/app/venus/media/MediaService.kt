package app.venus.media

import android.app.Service
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder

/**
 * Keeps Discord's process running while a voice message or audio file plays with Discord in the background (#134).
 * Without a foreground service Android freezes a backgrounded app after a few seconds, which stops the sound. It only
 * carries the media notification [BackgroundMedia] builds; all playback stays in Discord's own player.
 */
class MediaService : Service() {
    override fun onBind(intent: Intent?): IBinder? = null

    private fun releaseWake() {
        val lock = wake ?: return
        try {
            if (lock.isHeld) lock.release()
        } catch (_: Throwable) {
        }
    }

    private var wake: android.os.PowerManager.WakeLock? = null

    override fun onCreate() {
        super.onCreate()
        instance = this
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        instance = this
        // Android needs startForeground soon after startForegroundService, so it always runs; but when the sound already
        // ended before the service got going (Discord came back first), the placeholder is taken down at once instead of
        // staying as a notification with buttons that do nothing (#145).
        if (!promote() || !BackgroundMedia.audioActive()) stop()
        return START_NOT_STICKY
    }

    /** Shows the current media notification as this service's own. False when there's nothing to show any more. */
    fun promote(): Boolean {
        val notification = BackgroundMedia.currentNotification() ?: return false
        return try {
            // Decoding needs the CPU while the screen is off; released as soon as the sound pauses.
            if (wake == null) wake = getSystemService(android.os.PowerManager::class.java)
                ?.newWakeLock(android.os.PowerManager.PARTIAL_WAKE_LOCK, "venus:media")?.also { it.setReferenceCounted(false) }
            wake?.acquire(4 * 60 * 60 * 1000L)
            if (Build.VERSION.SDK_INT >= 29) startForeground(BackgroundMedia.NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK)
            else startForeground(BackgroundMedia.NOTIFICATION_ID, notification)
            true
        } catch (_: Throwable) { false }
    }

    /** Paused: the notification stays, but can be swiped away and no longer keeps Discord running. */
    fun demote() {
        releaseWake()
        try {
            if (Build.VERSION.SDK_INT >= 24) {
                stopForeground(STOP_FOREGROUND_DETACH)
            } else {
                @Suppress("DEPRECATION")
                stopForeground(false)
            }
        } catch (_: Throwable) { }
    }

    /** The sound ended or Discord came back: take the notification down with the service. */
    fun stop() {
        releaseWake()
        try {
            if (Build.VERSION.SDK_INT >= 24) {
                stopForeground(STOP_FOREGROUND_REMOVE)
            } else {
                @Suppress("DEPRECATION")
                stopForeground(true)
            }
        } catch (_: Throwable) { }
        stopSelf()
    }

    override fun onDestroy() {
        releaseWake()
        if (instance === this) instance = null
        super.onDestroy()
    }

    companion object {
        @Volatile
        @JvmStatic
        var instance: MediaService? = null
    }
}
