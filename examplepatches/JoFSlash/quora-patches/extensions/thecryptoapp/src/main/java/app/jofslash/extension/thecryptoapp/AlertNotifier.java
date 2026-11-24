package app.jofslash.extension.thecryptoapp;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

import java.util.Locale;

/** Creates the alert channel and posts per-rule local notifications. */
public final class AlertNotifier {

    static final String TAG = CustomAlerts.TAG;

    public static final String CHANNEL_ID = "custom_price_alerts";
    public static final String CHANNEL_NAME = "Price alerts";

    private AlertNotifier() {
    }

    public static void ensureChannel(Context ctx) {
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                NotificationManager nm = ctx.getSystemService(NotificationManager.class);
                if (nm != null && nm.getNotificationChannel(CHANNEL_ID) == null) {
                    NotificationChannel channel = new NotificationChannel(
                            CHANNEL_ID, CHANNEL_NAME, NotificationManager.IMPORTANCE_HIGH);
                    channel.setDescription("Custom injected crypto price alerts");
                    nm.createNotificationChannel(channel);
                    Log.i(TAG, "notify: channel '" + CHANNEL_ID + "' created");
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "notify: could not create channel", t);
        }
    }

    /**
     * Whether a notification from us would show: notifications allowed for the app (Android 13+
     * asks) and our channel not turned off.
     */
    public static boolean canNotify(Context ctx) {
        try {
            NotificationManager nm = ctx.getSystemService(NotificationManager.class);
            if (nm == null || !nm.areNotificationsEnabled()) return false;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                NotificationChannel channel = nm.getNotificationChannel(CHANNEL_ID);
                if (channel != null && channel.getImportance() == NotificationManager.IMPORTANCE_NONE) return false;
            }
            return true;
        } catch (Throwable t) {
            return true;
        }
    }

    /**
     * Posts the alert for a rule. Notification id is derived from the rule id, so rules don't stack.
     * Returns whether it was posted where the user can see it.
     */
    public static boolean notifyRule(Context ctx, AlertRule rule, Double price, Double pct) {
        try {
            ensureChannel(ctx);
            NotificationManager nm = ctx.getSystemService(NotificationManager.class);
            if (nm == null) {
                Log.e(TAG, "notify: no NotificationManager");
                return false;
            }
            if (!canNotify(ctx)) {
                Log.w(TAG, "notify: notifications are off, not using up rule " + rule.displayName);
                return false;
            }

            String title = rule.displayName + " alert";
            String text;
            if (rule.isPercent()) {
                String dir = AlertRule.PCT_UP.equals(rule.direction) ? "up" : "down";
                String nowPct = pct == null ? "?" : String.format(Locale.US, "%+.2f%%", pct);
                text = String.format(Locale.US, "%s 24h change %s (target %s %.2f%%%s)",
                        rule.displayName, nowPct, dir, rule.targetPrice,
                        price == null ? "" : ", now " + PriceFormat.money(price));
            } else {
                String dir = rule.isUpward() ? "above" : "below";
                text = String.format(Locale.US, "%s is %s (target %s %s)",
                        rule.displayName, PriceFormat.money(price == null ? 0d : price),
                        dir, PriceFormat.money(rule.targetPrice));
            }
            if (rule.note != null && !rule.note.isEmpty()) {
                text = text + "  -  " + rule.note;
            }

            // Tapping opens our alerts screen.
            Intent open = new Intent(ctx, AlertsActivity.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            int piFlags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) piFlags |= PendingIntent.FLAG_IMMUTABLE;
            PendingIntent contentIntent = PendingIntent.getActivity(
                    ctx, rule.id.hashCode(), open, piFlags);

            Notification notification;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                notification = new Notification.Builder(ctx, CHANNEL_ID)
                        .setContentTitle(title)
                        .setContentText(text)
                        .setSmallIcon(android.R.drawable.ic_dialog_info)
                        .setContentIntent(contentIntent)
                        .setAutoCancel(true)
                        .build();
            } else {
                notification = new Notification.Builder(ctx)
                        .setContentTitle(title)
                        .setContentText(text)
                        .setSmallIcon(android.R.drawable.ic_dialog_info)
                        .setContentIntent(contentIntent)
                        .setAutoCancel(true)
                        .build();
            }

            nm.notify(rule.id.hashCode(), notification);
            Log.i(TAG, "notify: posted for rule " + rule.displayName + " -> " + text);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "notify: could not post for rule " + (rule != null ? rule.displayName : "?"), t);
            return false;
        }
    }
}
