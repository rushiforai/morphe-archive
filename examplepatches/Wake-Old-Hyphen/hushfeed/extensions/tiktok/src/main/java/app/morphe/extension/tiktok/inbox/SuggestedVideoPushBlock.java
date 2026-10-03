/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.inbox;

import android.app.Notification;
import android.app.NotificationManager;
import android.os.Build;

import app.morphe.extension.tiktok.settings.Settings;

/**
 * Stands in for every NotificationManager.notify call in TikTok, and drops the ones on its
 * "Videos you might like" channel: pushes such as "25M+ people viewed" about videos TikTok
 * picked, from no one you follow. The channel's id is {@code recommend_video_push} plus a
 * version suffix TikTok bumps now and then ({@code recommend_video_push_associated_4} on
 * 47.1.x), so only the start is compared. Everything else is posted exactly as TikTok asked.
 */
@SuppressWarnings("unused")
public final class SuggestedVideoPushBlock {
    /** The channel's base id, from the list PushService keeps. */
    static final String SUGGESTED_VIDEO_CHANNEL = "recommend_video_push";

    private SuggestedVideoPushBlock() {
    }

    public static void notify(NotificationManager manager, String tag, int id, Notification notification) {
        if (shouldBlock(notification)) return;
        manager.notify(tag, id, notification);
    }

    public static void notify(NotificationManager manager, int id, Notification notification) {
        if (shouldBlock(notification)) return;
        manager.notify(id, notification);
    }

    static boolean shouldBlock(Notification notification) {
        // Android only has channels from 8.0, and TikTok posts none of these without one.
        if (notification == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return false;
        if (!Settings.BLOCK_SUGGESTED_VIDEO_NOTIFICATIONS.get()) return false;
        String channel = notification.getChannelId();
        return channel != null && channel.startsWith(SUGGESTED_VIDEO_CHANNEL);
    }
}
