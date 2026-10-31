package app.morphe.extension.mapsautomotive.patches;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Icon;

/**
 * The notification that leads to the problem report without Maps' Settings: after a crash (posted by
 * the crash handler before the process ends) and at each start in safe mode. One notification at a
 * time, silent and without heads-up, because the car may be moving; tapping it opens
 * {@link ReportActivity}. Removed once a report is queued.
 */
final class ReportNotice {
    private static final String CHANNEL = "morphe_problems";
    private static final int ID = 0x4D43;

    private ReportNotice() {
    }

    static void crash(Context context, boolean safeModeStarts) {
        boolean thai = UiDensityPatch.isThai(context);
        post(context, thai ? "Maps Car ปิดตัวผิดปกติ" : "Maps Car closed unexpectedly", safeModeStarts
                ? (thai ? "เด้ง 2 ครั้งใน 10 นาที เปิดครั้งหน้าจะอยู่ใน safe mode (ปิดฟีเจอร์เสริม) แตะเพื่อส่งรายงาน"
                : "It crashed twice in 10 minutes, so it starts in safe mode (extra features off). Tap to send a report.")
                : (thai ? "แตะเพื่อส่งรายงานปัญหา คุณจะเห็นข้อมูลทั้งหมดก่อนส่ง"
                : "Tap to send a problem report. You see everything before it is sent."));
    }

    static void safeMode(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        post(context, thai ? "Maps Car อยู่ใน safe mode" : "Maps Car is in safe mode", thai
                ? "ฟีเจอร์เสริมปิดอยู่หลังเด้ง 2 ครั้ง แตะเพื่อส่งรายงาน หรือเปิดฟีเจอร์กลับ"
                : "Extra features are off after 2 crashes. Tap to send a report or turn them back on.");
    }

    static void cancel(Context context) {
        try {
            NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager != null) manager.cancel(ID);
        } catch (RuntimeException error) {
            ReportLog.w(ReportPatch.TAG, "notification not removed", error);
        }
    }

    private static void post(Context context, String title, String text) {
        try {
            NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager == null) return;
            boolean thai = UiDensityPatch.isThai(context);
            NotificationChannel channel = new NotificationChannel(CHANNEL,
                    thai ? "ปัญหาของ Maps Car" : "Maps Car problems", NotificationManager.IMPORTANCE_DEFAULT);
            channel.setSound(null, null);
            channel.enableVibration(false);
            manager.createNotificationChannel(channel);
            Intent open = new Intent(context, ReportActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            PendingIntent tap = PendingIntent.getActivity(context, 0, open,
                    PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
            Notification notification = new Notification.Builder(context, CHANNEL)
                    .setSmallIcon(Icon.createWithResource("android", android.R.drawable.stat_notify_error))
                    .setContentTitle(title)
                    .setContentText(text)
                    .setStyle(new Notification.BigTextStyle().bigText(text))
                    .setCategory(Notification.CATEGORY_ERROR)
                    .setContentIntent(tap)
                    .setAutoCancel(true)
                    .build();
            manager.notify(ID, notification);
        } catch (RuntimeException error) {
            ReportLog.w(ReportPatch.TAG, "notification not posted", error);
        }
    }
}
