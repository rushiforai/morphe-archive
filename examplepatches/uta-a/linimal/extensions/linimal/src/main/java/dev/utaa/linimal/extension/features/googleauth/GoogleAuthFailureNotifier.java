package dev.utaa.linimal.extension.features.googleauth;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

/**
 * MicroG-RE へ向けた Google ドライブの token 要求が失敗したとき、失敗の種類を通知で知らせます。
 *
 * <p>LINE はどの失敗も「LINEにアクセスできません」の 1 種類の表示にまとめるため、利用者からは
 * MicroG-RE に接続できなかったのか、MicroG-RE がエラーを返したのかが分かりません。通知には
 * MicroG-RE が返したエラー文字列と、MicroG-RE・LINE・Android の version だけを載せ、
 * メールアドレスや token は載せません。</p>
 *
 * <p>同じ ID の通知を置き換え、音や振動は最初の 1 回だけにします。同じ内容は
 * {@link #SAME_FAILURE_INTERVAL_MILLIS} の間は出し直しません。</p>
 */
final class GoogleAuthFailureNotifier {
    static final long SAME_FAILURE_INTERVAL_MILLIS = 60 * 1000L;
    /** MicroG-RE から受け取るエラー文字列の上限。想定外に長い値を通知へそのまま載せないためです。 */
    static final int MAX_ERROR_LENGTH = 80;
    static final String TITLE = "Google ドライブの認証に失敗しました";
    private static final String CHANNEL_ID = "linimal_google_auth_failure";
    private static final int NOTIFICATION_ID = 0x4c4d4732;

    /** 失敗の種類。 */
    enum Kind {
        /** MicroG-RE の GetToken に bind できなかった。 */
        BIND_FAILED,
        /** MicroG-RE が token の代わりにエラー文字列を返した。 */
        MICROG_ERROR
    }

    private static final Object LOCK = new Object();
    private static String lastKey;
    private static long lastNotifiedAt = Long.MIN_VALUE;

    private GoogleAuthFailureNotifier() {
    }

    /**
     * 利用者の操作で解決できる要求（アクセス許可の確認など）は、LINE が MicroG-RE の画面を開くので通知しません。
     * エラー文字列が無い応答も対象外です。
     */
    static boolean isReportableError(String error) {
        if (error == null || error.isEmpty()) {
            return false;
        }
        switch (error) {
            case "OK":
            case "NeedPermission":
            case "NeedRemoteConsent":
            case "UserCancel":
                return false;
            default:
                return true;
        }
    }

    static void notifyFailure(Context context, Kind kind, String error) {
        if (context == null || kind == null) {
            return;
        }
        String safeError = sanitize(error);
        long now = System.currentTimeMillis();
        String key = kind.name() + ":" + safeError;
        synchronized (LOCK) {
            if (!shouldNotify(lastKey, lastNotifiedAt, key, now)) {
                return;
            }
            lastKey = key;
            lastNotifiedAt = now;
        }
        Context application = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        String text = message(kind, safeError) + "\n\n" + environment(
                versionName(application, GoogleAuthRoutingHooks.MICROG_PACKAGE),
                versionName(application, application.getPackageName()),
                Build.VERSION.RELEASE,
                Build.VERSION.SDK_INT);
        post(application, text);
    }

    /** 前回と違う内容か、同じ内容でも {@link #SAME_FAILURE_INTERVAL_MILLIS} 以上経っていれば通知します。 */
    static boolean shouldNotify(String lastKey, long lastNotifiedAt, String key, long now) {
        if (lastKey == null || !lastKey.equals(key) || lastNotifiedAt == Long.MIN_VALUE || now < lastNotifiedAt) {
            return true;
        }
        return now - lastNotifiedAt >= SAME_FAILURE_INTERVAL_MILLIS;
    }

    /** 英数字と一部の記号だけを残し、長さを制限します。 */
    static String sanitize(String error) {
        if (error == null) {
            return "";
        }
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < error.length() && builder.length() < MAX_ERROR_LENGTH; i++) {
            char c = error.charAt(i);
            if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')
                    || c == ' ' || c == '_' || c == '-' || c == '.' || c == ':') {
                builder.append(c);
            }
        }
        return builder.toString().trim();
    }

    /** 失敗の種類ごとの説明。原因の候補と、利用者が確かめられることを示します。 */
    static String message(Kind kind, String error) {
        if (kind == Kind.BIND_FAILED) {
            return "MicroG-RE に接続できませんでした（" + error + "）。"
                    + "MicroG-RE が停止していないか、バッテリーの設定でスリープや使用制限の対象になっていないかを確認してください。";
        }
        if ("NetworkError".equals(error)) {
            return "MicroG-RE がエラー「NetworkError」を返しました。"
                    + "選んだ Google アカウントが MicroG-RE に無いか、MicroG-RE が Google に接続できなかったか、"
                    + "Google が要求を拒否した可能性があります。"
                    + "MicroG-RE のアカウント、MicroG-RE の通信の制限、MicroG-RE からの通知を確認してください。";
        }
        return "MicroG-RE がエラー「" + error + "」を返しました。";
    }

    static String environment(String microgVersion, String lineVersion, String androidRelease, int sdk) {
        return "MicroG-RE " + orUnknown(microgVersion)
                + " / LINE " + orUnknown(lineVersion)
                + " / Android " + orUnknown(androidRelease) + " (SDK " + sdk + ")";
    }

    private static String orUnknown(String value) {
        return value == null || value.isEmpty() ? "不明" : value;
    }

    private static String versionName(Context context, String packageName) {
        try {
            return context.getPackageManager().getPackageInfo(packageName, 0).versionName;
        } catch (PackageManager.NameNotFoundException | RuntimeException ignored) {
            return null;
        }
    }

    private static void post(Context context, String text) {
        NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager == null) {
            return;
        }
        Notification.Builder builder;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(
                    CHANNEL_ID, "Linimal: バックアップの認証エラー", NotificationManager.IMPORTANCE_DEFAULT);
            channel.setDescription("MicroG-RE を使った Google ドライブの認証が失敗したときの詳細");
            manager.createNotificationChannel(channel);
            builder = new Notification.Builder(context, CHANNEL_ID);
        } else {
            builder = new Notification.Builder(context);
        }
        builder.setSmallIcon(android.R.drawable.stat_sys_warning)
                .setContentTitle(TITLE)
                .setContentText(text)
                .setStyle(new Notification.BigTextStyle().bigText(text))
                .setOnlyAlertOnce(true)
                .setAutoCancel(true);
        manager.notify(NOTIFICATION_ID, builder.build());
    }
}
