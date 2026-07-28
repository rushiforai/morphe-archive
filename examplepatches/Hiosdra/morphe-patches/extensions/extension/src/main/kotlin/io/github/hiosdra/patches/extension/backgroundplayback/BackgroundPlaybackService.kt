package io.github.hiosdra.patches.extension.backgroundplayback

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.app.PendingIntent
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.IBinder

/**
 * Keeps the patched F1 TV process in the foreground while its player is
 * continuing after the activity has gone behind the launcher or the screen is
 * off. The host app's existing Bitmovin player remains the audio source.
 */
class BackgroundPlaybackService : Service() {
    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
        startForeground(
            NOTIFICATION_ID,
            Notification.Builder(this, CHANNEL_ID)
                .setSmallIcon(android.R.drawable.ic_media_play)
                .setContentTitle("F1 TV playback")
                .setContentText("Playback is continuing in the background")
                .setCategory(Notification.CATEGORY_TRANSPORT)
                .setContentIntent(activityPendingIntent(ACTION_RESTORE_PIP, REQUEST_RESTORE_PIP))
                .addAction(
                    android.R.drawable.ic_media_play,
                    "Play / pause",
                    activityPendingIntent(ACTION_TOGGLE_PLAYBACK, REQUEST_TOGGLE_PLAYBACK),
                )
                .addAction(
                    android.R.drawable.ic_menu_close_clear_cancel,
                    "Stop player",
                    activityPendingIntent(ACTION_STOP_PLAYER, REQUEST_STOP_PLAYER),
                )
                .addAction(
                    android.R.drawable.ic_menu_view,
                    "Show PiP",
                    activityPendingIntent(ACTION_RESTORE_PIP, REQUEST_RESTORE_PIP),
                )
                .setOngoing(true)
                .build(),
            ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK,
        )
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int =
        START_NOT_STICKY

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onDestroy() {
        stopForeground(STOP_FOREGROUND_REMOVE)
        super.onDestroy()
    }

    private fun activityPendingIntent(action: String, requestCode: Int): PendingIntent {
        val intent = Intent()
            .setClassName(packageName, PLAYER_ACTIVITY_NAME)
            .setAction(action)
            .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_SINGLE_TOP)
        return PendingIntent.getActivity(
            this,
            requestCode,
            intent,
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
    }

    private fun createNotificationChannel() {
        val manager = getSystemService(NotificationManager::class.java)
        manager.createNotificationChannel(
            NotificationChannel(
                CHANNEL_ID,
                "F1 TV background playback",
                NotificationManager.IMPORTANCE_LOW,
            ),
        )
    }

    private companion object {
        const val CHANNEL_ID = "f1tv_background_playback"
        const val NOTIFICATION_ID = 1001
        const val PLAYER_ACTIVITY_NAME = "com.avs.f1.ui.player.BasePlayerActivity"
        const val ACTION_TOGGLE_PLAYBACK = "io.github.hiosdra.patches.ACTION_TOGGLE_PLAYBACK"
        const val ACTION_STOP_PLAYER = "io.github.hiosdra.patches.ACTION_STOP_PLAYER"
        const val ACTION_RESTORE_PIP = "io.github.hiosdra.patches.ACTION_RESTORE_PIP"
        const val REQUEST_TOGGLE_PLAYBACK = 1002
        const val REQUEST_STOP_PLAYER = 1003
        const val REQUEST_RESTORE_PIP = 1004
    }
}
