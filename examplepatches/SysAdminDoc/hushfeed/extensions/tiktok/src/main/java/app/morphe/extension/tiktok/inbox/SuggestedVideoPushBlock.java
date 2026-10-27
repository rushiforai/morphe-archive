/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.inbox;

import android.app.Notification;
import android.app.NotificationManager;
import android.os.Build;

import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

/**
 * Stands in for every NotificationManager.notify call in TikTok, and drops the ones on its
 * "Videos you might like" channel: pushes such as "25M+ people viewed" about videos TikTok
 * picked, from no one you follow. The channel's id is {@code recommend_video_push} plus a
 * version suffix TikTok bumps now and then ({@code recommend_video_push_associated_4} on
 * 47.1.x), so only the start is compared. Everything else is posted exactly as TikTok asked.
 *
 * <p>Notification controls routes TikTok's notify calls through here too, for Turn off push
 * notifications ({@link PushShutoff}). Either patch can bring the routing in without the other,
 * so each check only counts in a build that carries its own patch.
 */
@SuppressWarnings("unused")
public final class SuggestedVideoPushBlock {
    /** The channel's base id, from the list PushService keeps. */
    static final String SUGGESTED_VIDEO_CHANNEL = "recommend_video_push";

    private SuggestedVideoPushBlock() {
    }

    public static void notify(NotificationManager manager, String tag, int id, Notification notification) {
        PushDeliveryReport.Stage blocked = blockReason(notification);
        if (blocked != null) { PushDeliveryReport.notification(blocked, notification); return; }
        PushDeliveryReport.beforeNotify(manager, notification);
        boolean returned = false;
        try { manager.notify(tag, id, notification); returned = true; }
        finally { PushDeliveryReport.notification(returned ? PushDeliveryReport.Stage.NOTIFY_RETURNED
                : PushDeliveryReport.Stage.NOTIFY_DID_NOT_RETURN, notification); }
    }

    public static void notify(NotificationManager manager, int id, Notification notification) {
        PushDeliveryReport.Stage blocked = blockReason(notification);
        if (blocked != null) { PushDeliveryReport.notification(blocked, notification); return; }
        PushDeliveryReport.beforeNotify(manager, notification);
        boolean returned = false;
        try { manager.notify(id, notification); returned = true; }
        finally { PushDeliveryReport.notification(returned ? PushDeliveryReport.Stage.NOTIFY_RETURNED
                : PushDeliveryReport.Stage.NOTIFY_DID_NOT_RETURN, notification); }
    }

    static boolean shouldBlock(Notification notification) {
        return blockReason(notification) != null;
    }

    private static PushDeliveryReport.Stage blockReason(Notification notification) {
        if (PushShutoff.dropsFromDrawer(notification)) return PushDeliveryReport.Stage.NOTIFY_PUSH_OFF;
        // Android only has channels from 8.0, and TikTok posts none of these without one.
        if (notification == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return null;
        // On by default, so a build with only Notification controls must not read it.
        if (!SettingsStatus.suggestedVideoPushBlockEnabled
                || !Settings.BLOCK_SUGGESTED_VIDEO_NOTIFICATIONS.get()) return null;
        String channel = notification.getChannelId();
        return channel != null && channel.startsWith(SUGGESTED_VIDEO_CHANNEL)
                ? PushDeliveryReport.Stage.NOTIFY_SUGGESTED : null;
    }
}
