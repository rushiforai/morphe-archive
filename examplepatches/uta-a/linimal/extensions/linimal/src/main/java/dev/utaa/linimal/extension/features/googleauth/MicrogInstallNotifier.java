package dev.utaa.linimal.extension.features.googleauth;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

/**
 * 「MicroG-RE で Google ログインとバックアップを行う」が ON なのに MicroG-RE がないとき、導入を案内します。
 *
 * <p>通知とトーストの両方を出します。新規インストール直後の復元では通知がまだ許可されていないことが
 * 多く、通知だけでは気付けないためです。通知をタップすると MicroG-RE のリリースページをブラウザで開きます。
 * 1 回のバックアップ・復元で token の要求は何度か走るため、案内は {@link #MIN_INTERVAL_MILLIS} に
 * 1 回までにします。</p>
 */
final class MicrogInstallNotifier {
    static final long MIN_INTERVAL_MILLIS = 10 * 60 * 1000L;
    static final String RELEASES_URL = "https://github.com/MorpheApp/MicroG-RE/releases/latest";
    private static final String CHANNEL_ID = "linimal_microg_install";
    private static final int NOTIFICATION_ID = 0x4c4d4731;
    static final String TOAST_TEXT = "Google アカウントでのログインと、トークのバックアップ・復元には MicroG-RE が必要です。"
            + "MicroG-RE を入れ、LINE と同じ Google アカウントを追加してください。";

    private static final Object LOCK = new Object();
    private static long lastNotifiedAt = Long.MIN_VALUE;

    private MicrogInstallNotifier() {
    }

    static void notifyMissing(Context context) {
        if (context == null) {
            return;
        }
        long now = System.currentTimeMillis();
        synchronized (LOCK) {
            if (!shouldNotify(lastNotifiedAt, now)) {
                return;
            }
            lastNotifiedAt = now;
        }
        Context application = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        // どちらか一方が失敗しても、もう一方は出します。
        try {
            post(application);
        } catch (Throwable ignored) {
            // 通知を出せなくても、トーストで案内します。
        }
        try {
            showToast(application);
        } catch (Throwable ignored) {
            // トーストを出せなくても、LINE の処理には影響させません。
        }
    }

    /** token の要求は background thread から来るため、main thread でトーストを出します。 */
    private static void showToast(Context context) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Toast.makeText(context, TOAST_TEXT, Toast.LENGTH_LONG).show();
            } catch (Throwable ignored) {
                // 表示できない状態でも LINE の処理には影響させません。
            }
        });
    }

    /** 前回から {@link #MIN_INTERVAL_MILLIS} 以上経っていれば通知します。時計が戻った場合も通知します。 */
    static boolean shouldNotify(long lastNotifiedAt, long now) {
        if (lastNotifiedAt == Long.MIN_VALUE || now < lastNotifiedAt) {
            return true;
        }
        return now - lastNotifiedAt >= MIN_INTERVAL_MILLIS;
    }

    private static void post(Context context) {
        NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager == null) {
            return;
        }
        Notification.Builder builder;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(
                    CHANNEL_ID, "Linimal", NotificationManager.IMPORTANCE_DEFAULT);
            channel.setDescription("Linimal の機能に必要なアプリの案内");
            manager.createNotificationChannel(channel);
            builder = new Notification.Builder(context, CHANNEL_ID);
        } else {
            builder = new Notification.Builder(context);
        }

        Intent open = new Intent(Intent.ACTION_VIEW, Uri.parse(RELEASES_URL))
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        PendingIntent pending = PendingIntent.getActivity(
                context, 0, open, PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
        String text = "Google アカウントでのログインと、トークのバックアップ・復元には MicroG-RE が必要です。"
                + "タップして MicroG-RE を入手し、LINE と同じ Google アカウントを追加してください。";
        builder.setSmallIcon(android.R.drawable.stat_sys_warning)
                .setContentTitle("MicroG-RE が見つかりません")
                .setContentText(text)
                .setStyle(new Notification.BigTextStyle().bigText(text))
                .setContentIntent(pending)
                .setAutoCancel(true);
        manager.notify(NOTIFICATION_ID, builder.build());
    }
}
