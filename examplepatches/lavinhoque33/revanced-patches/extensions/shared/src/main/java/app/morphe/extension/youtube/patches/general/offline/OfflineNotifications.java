/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-10.
 * Modified by lavinhoque33, 2026-10-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.Icon;
import android.media.session.MediaSession;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.utils.Logger;

/**
 * Notifications of the built-in downloader and the offline player.
 * <p>
 * Action buttons are explicit service intents to the two hooked stock services, because the
 * patched app cannot declare a receiver of its own.
 */
@SuppressLint({"NotificationPermission", "MissingPermission"}) // The stock app declares POST_NOTIFICATIONS.
final class OfflineNotifications {
    private static final String DOWNLOAD_CHANNEL = "rvx_offline_downloads";
    private static final String PLAYBACK_CHANNEL = "rvx_offline_playback";

    static final int DOWNLOAD_PROGRESS_ID = 0x52565801;
    static final int PLAYBACK_ID = 0x52565802;

    private static final int FLAGS = PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT;
    private static final int CANCEL_ALL_REQUEST_CODE = 14;

    private OfflineNotifications() {
    }

    @Nullable
    static NotificationManager manager(Context context) {
        return (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
    }

    private static void createChannels(Context context) {
        NotificationManager manager = manager(context);
        if (manager == null) return;
        manager.createNotificationChannel(new NotificationChannel(DOWNLOAD_CHANNEL,
                str("revanced_offline_notification_channel_downloads"), NotificationManager.IMPORTANCE_LOW));
        NotificationChannel playback = new NotificationChannel(PLAYBACK_CHANNEL,
                str("revanced_offline_notification_channel_playback"), NotificationManager.IMPORTANCE_LOW);
        playback.setShowBadge(false);
        manager.createNotificationChannel(playback);
    }

    private static PendingIntent serviceIntent(Context context, String service, String action,
                                               @Nullable String key, int requestCode) {
        Intent intent = new Intent(action).setClassName(context, service);
        if (key != null) intent.putExtra(OfflineScreens.EXTRA_VIDEO_ID, key);
        return PendingIntent.getService(context, requestCode, intent, FLAGS);
    }

    private static PendingIntent activityIntent(Context context, Intent intent, int requestCode) {
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return PendingIntent.getActivity(context, requestCode, intent, FLAGS);
    }

    static Notification buildDownloadProgress(Context context, @Nullable OfflineDownloader.Task task, int queued) {
        createChannels(context);
        Notification.Builder builder = new Notification.Builder(context, DOWNLOAD_CHANNEL)
                .setSmallIcon(android.R.drawable.stat_sys_download)
                .setOnlyAlertOnce(true)
                .setOngoing(true)
                .setShowWhen(false)
                .setContentIntent(activityIntent(context, OfflineScreens.libraryIntent(context), 1));

        if (task == null) {
            builder.setContentTitle(str("revanced_offline_download_preparing"))
                    .setProgress(0, 0, true);
            return builder.build();
        }

        int percent = task.getPercent();
        String text = task.subtitleStatus != null ? task.subtitleStatus : switch (task.getState()) {
            case MERGING -> str("revanced_offline_download_merging");
            case SAVING -> str("revanced_offline_download_saving");
            case QUEUED -> str("revanced_offline_download_queued");
            default -> percent < 0
                    ? str("revanced_offline_download_starting")
                    : str("revanced_offline_download_progress", percent);
        };
        final OfflineDownloader.Batch batch = task.batch;
        if (batch != null) text = task.index + "/" + batch.total + " · " + text;
        if (queued > 0) text = text + " · " + str("revanced_offline_download_queued_count", queued);

        builder.setContentTitle(task.title)
                .setContentText(text)
                .setProgress(100, Math.max(0, percent), percent < 0 || task.getState() != OfflineDownloader.State.DOWNLOADING)
                .addAction(action(context, android.R.drawable.ic_menu_close_clear_cancel, str("revanced_offline_cancel"),
                        serviceIntent(context, OfflineServiceHooks.KEEP_ALIVE_SERVICE,
                                OfflineServiceHooks.ACTION_DOWNLOAD_CANCEL, task.key, task.key.hashCode())));
        if (batch != null) {
            if (!batch.title.isEmpty()) builder.setSubText(batch.title);
            builder.addAction(action(context, android.R.drawable.ic_menu_close_clear_cancel,
                    str("revanced_offline_cancel_all"),
                    serviceIntent(context, OfflineServiceHooks.KEEP_ALIVE_SERVICE,
                            OfflineServiceHooks.ACTION_DOWNLOAD_CANCEL_ALL, null, CANCEL_ALL_REQUEST_CODE)));
        }
        return builder.build();
    }

    private static Notification.Action action(Context context, int icon, String title, PendingIntent intent) {
        return new Notification.Action.Builder(Icon.createWithResource(context, icon), title, intent).build();
    }

    /** @param key {@link OfflineVideo#key()} of the saved download. */
    static void showDownloadFinished(Context context, String key, String title) {
        createChannels(context);
        NotificationManager manager = manager(context);
        if (manager == null) return;
        Notification notification = new Notification.Builder(context, DOWNLOAD_CHANNEL)
                .setSmallIcon(android.R.drawable.stat_sys_download_done)
                .setContentTitle(title)
                .setContentText(str("revanced_offline_download_complete"))
                .setAutoCancel(true)
                .setContentIntent(activityIntent(context, OfflineScreens.preferYouTubePlayerIntent(context, key),
                        key.hashCode()))
                .build();
        manager.notify(resultId(key), notification);
    }

    static void showDownloadFailed(Context context, String key, String title, String reason) {
        createChannels(context);
        NotificationManager manager = manager(context);
        if (manager == null) return;
        Notification notification = new Notification.Builder(context, DOWNLOAD_CHANNEL)
                .setSmallIcon(android.R.drawable.stat_notify_error)
                .setContentTitle(title)
                .setContentText(str("revanced_offline_download_failed", reason))
                .setStyle(new Notification.BigTextStyle().bigText(str("revanced_offline_download_failed", reason)))
                .setAutoCancel(true)
                .setContentIntent(activityIntent(context, OfflineScreens.libraryIntent(context), 1))
                .build();
        manager.notify(resultId(key), notification);
    }

    /** The one notification of a finished playlist download. */
    static void showBatchSummary(Context context, OfflineDownloader.Batch batch, String summary) {
        createChannels(context);
        NotificationManager manager = manager(context);
        if (manager == null) return;
        Notification notification = new Notification.Builder(context, DOWNLOAD_CHANNEL)
                .setSmallIcon(batch.failed.get() > 0 ? android.R.drawable.stat_notify_error
                        : android.R.drawable.stat_sys_download_done)
                .setContentTitle(batch.title.isEmpty() ? str("revanced_offline_batch_title") : batch.title)
                .setContentText(summary.replace('\n', ' '))
                .setStyle(new Notification.BigTextStyle().bigText(summary))
                .setAutoCancel(true)
                .setContentIntent(activityIntent(context, OfflineScreens.libraryIntent(context), 1))
                .build();
        manager.notify(("rvx_offline_batch_" + batch.id).hashCode(), notification);
    }

    private static int resultId(String videoId) {
        return ("rvx_offline_result_" + videoId).hashCode();
    }

    static Notification buildPlayback(Context context, MediaSession.Token token, String title,
                                      String author, @Nullable Bitmap artwork, boolean playing,
                                      @Nullable String key) {
        createChannels(context);
        final String service = OfflineServiceHooks.BACKGROUND_SERVICE;
        Notification.Builder builder = new Notification.Builder(context, PLAYBACK_CHANNEL)
                .setSmallIcon(playing ? android.R.drawable.ic_media_play : android.R.drawable.ic_media_pause)
                .setContentTitle(title)
                .setContentText(author)
                .setLargeIcon(artwork)
                .setOnlyAlertOnce(true)
                .setShowWhen(false)
                .setVisibility(Notification.VISIBILITY_PUBLIC)
                .setOngoing(playing)
                .setCategory(Notification.CATEGORY_TRANSPORT)
                .setContentIntent(activityIntent(context, OfflineScreens.playerIntent(context, key), 2))
                .setDeleteIntent(serviceIntent(context, service, OfflineServiceHooks.ACTION_PLAYBACK_CLOSE, null, 13))
                .addAction(action(context, android.R.drawable.ic_media_previous, str("revanced_offline_previous"),
                        serviceIntent(context, service, OfflineServiceHooks.ACTION_PLAYBACK_PREVIOUS, null, 10)))
                .addAction(action(context,
                        playing ? android.R.drawable.ic_media_pause : android.R.drawable.ic_media_play,
                        playing ? str("revanced_offline_pause") : str("revanced_offline_play"),
                        serviceIntent(context, service, OfflineServiceHooks.ACTION_PLAYBACK_TOGGLE, null, 11)))
                .addAction(action(context, android.R.drawable.ic_media_next, str("revanced_offline_next"),
                        serviceIntent(context, service, OfflineServiceHooks.ACTION_PLAYBACK_NEXT, null, 12)))
                .addAction(action(context, android.R.drawable.ic_menu_close_clear_cancel, str("revanced_offline_close"),
                        serviceIntent(context, service, OfflineServiceHooks.ACTION_PLAYBACK_CLOSE, null, 13)))
                .setStyle(new Notification.MediaStyle()
                        .setMediaSession(token)
                        .setShowActionsInCompactView(0, 1, 2));
        return builder.build();
    }

    static void cancel(Context context, int id) {
        try {
            NotificationManager manager = manager(context);
            if (manager != null) manager.cancel(id);
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not cancel notification " + id, ex);
        }
    }

    static void notify(Context context, int id, Notification notification) {
        try {
            NotificationManager manager = manager(context);
            if (manager != null) manager.notify(id, notification);
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not post notification " + id, ex);
        }
    }
}
