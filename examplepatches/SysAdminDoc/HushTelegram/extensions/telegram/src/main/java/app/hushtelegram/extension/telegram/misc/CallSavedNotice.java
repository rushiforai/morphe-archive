/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Icon;
import android.net.Uri;
import androidx.annotation.Nullable;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The notification after a call recording is saved (#72), when the person asked for it: a tap
 * plays the recording, Share hands it to any app, and Saved Messages sends it to the account's
 * own chat. Saved Messages goes through Telegram's direct share, the way its share sheet's chat
 * shortcuts do, so Telegram sends the file straight away. Without the account or Telegram's
 * share key it opens Telegram's chat picker instead.
 */
public final class CallSavedNotice {
    private CallSavedNotice() {}

    static final String CHANNEL = "hushtelegram_call_recordings";
    static final int NOTIFICATION_ID = 0x4854_4352;
    static final String LAUNCH_ACTIVITY = "org.telegram.ui.LaunchActivity";
    private static final String USER_CONFIG = "org.telegram.messenger.UserConfig";
    private static final String SHARED_CONFIG = "org.telegram.messenger.SharedConfig";

    interface Reader<T> {
        T read() throws ReflectiveOperationException;
    }

    // Swapped by tests, which have no Telegram to ask.
    static Reader<Long> self = CallSavedNotice::selfId;
    static Reader<String> shareKey = CallSavedNotice::directShareHash;

    /** Posts the notification for the recording at [uri] called [name], when the switch is on. */
    static void show(Context context, @Nullable Uri uri, String name, String mime) {
        if (uri == null || !Settings.RECORD_CALLS_NOTIFY.get()) return;
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager == null) return;
        if (manager.getNotificationChannel(CHANNEL) == null) {
            NotificationChannel created = new NotificationChannel(CHANNEL, L10n.t("Call recordings"),
                    NotificationManager.IMPORTANCE_LOW);
            created.setShowBadge(false);
            manager.createNotificationChannel(created);
        }
        int icon = 0;
        try {
            icon = context.getResources().getIdentifier("notification", "drawable", context.getPackageName());
        } catch (Throwable unreadable) { }
        Notification.Builder builder = new Notification.Builder(context, CHANNEL)
                .setSmallIcon(icon != 0 ? icon : android.R.drawable.stat_sys_download_done)
                .setContentTitle(L10n.t("Call recording saved"))
                .setContentText(name)
                .setAutoCancel(true)
                .setLocalOnly(true)
                .setCategory(Notification.CATEGORY_STATUS)
                .setContentIntent(activity(context, 1, play(uri, mime)))
                .addAction(action(L10n.t("Share"), activity(context, 2, Intent.createChooser(send(uri, mime), name)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))))
                .addAction(action(L10n.t("Saved Messages"), activity(context, 3, savedMessages(context, uri, mime))));
        manager.notify(NOTIFICATION_ID, builder.build());
    }

    /** Opens the recording in the phone's player. */
    static Intent play(Uri uri, String mime) {
        return new Intent(Intent.ACTION_VIEW)
                .setDataAndType(uri, mime)
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    /** The recording as a share, readable by whichever app takes it. */
    static Intent send(Uri uri, String mime) {
        Intent send = new Intent(Intent.ACTION_SEND)
                .setType(mime)
                .putExtra(Intent.EXTRA_STREAM, uri)
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        send.setClipData(ClipData.newRawUri("", uri));
        return send;
    }

    /**
     * The share Telegram's LaunchActivity sends to Saved Messages: its direct share names the chat
     * as {@code dialogId} and proves it came from Telegram with {@code hash}, the key Telegram
     * keeps in SharedConfig. Either one missing leaves Telegram's chat picker to choose.
     */
    static Intent savedMessages(Context context, Uri uri, String mime) {
        Intent share = send(uri, mime)
                .setClassName(context.getPackageName(), LAUNCH_ACTIVITY)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            long id = self.read();
            String key = shareKey.read();
            if (id != 0 && key != null && !key.isEmpty()) share.putExtra("dialogId", id).putExtra("hash", key);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_CALL_DEBUG, "saved messages share", failure);
        }
        return share;
    }

    private static PendingIntent activity(Context context, int request, Intent intent) {
        return PendingIntent.getActivity(context, request, intent, PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
    }

    private static Notification.Action action(String label, PendingIntent intent) {
        return new Notification.Action.Builder((Icon) null, label, intent).build();
    }

    /** {@code UserConfig.getInstance(UserConfig.selectedAccount).getClientUserId()}. */
    private static long selfId() throws ReflectiveOperationException {
        Class<?> config = Class.forName(USER_CONFIG);
        int account = HostNames.field(config, "selectedAccount").getInt(null);
        Object instance = HostNames.method(config, "getInstance", int.class).invoke(null, account);
        return ((Number) HostNames.method(config, "getClientUserId").invoke(instance)).longValue();
    }

    /** {@code SharedConfig.directShareHash}, which Telegram makes once and checks on every direct share. */
    private static String directShareHash() throws ReflectiveOperationException {
        return (String) HostNames.field(Class.forName(SHARED_CONFIG), "directShareHash").get(null);
    }
}
