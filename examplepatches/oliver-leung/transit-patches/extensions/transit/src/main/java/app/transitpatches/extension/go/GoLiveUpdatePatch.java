package app.transitpatches.extension.go;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import com.thetransitapp.droid.shared.model.cpp.SmartString;

import djinni.java.src.GOLiveActivity;
import djinni.java.src.GOLiveActivityFooter;
import djinni.java.src.GOLiveActivityPlatformData;
import djinni.java.src.Timebar;
import djinni.java.src.TimebarProgressIndicator;

@SuppressWarnings("unused")
public final class GoLiveUpdatePatch {
    private static final String TAG = "TransitPatches";
    private static final String EXTRA_REQUEST_PROMOTED_ONGOING = "android.requestPromotedOngoing";
    private static final String EXTRA_CONTAINS_CUSTOM_VIEW = "android.contains.customView";
    private static final String EXTRA_COMPAT_TEMPLATE = "androidx.core.app.extra.COMPAT_TEMPLATE";
    private static final String FALLBACK_TITLE = "Transit GO";
    private static final String TEXT_SEPARATOR = " \u00B7 ";
    private static final int PROGRESS_MAX = 100;

    private GoLiveUpdatePatch() {
    }

    /**
     * Injection point.
     *
     * @param context      The GO service.
     * @param formatter    The GO service, which formats the smart strings of the GO model.
     * @param platformData The GO model, or null before the GO model is available.
     * @param notification The GO notification built by the app.
     * @return The GO notification as a Live Update, or the unchanged notification
     * if it cannot be promoted.
     */
    public static Notification toLiveUpdate(Context context,
                                            SmartStringFormatter formatter,
                                            @Nullable GOLiveActivityPlatformData platformData,
                                            Notification notification) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.BAKLAVA) {
            return notification;
        }

        try {
            NotificationManager notificationManager = context.getSystemService(NotificationManager.class);
            if (notificationManager == null || !notificationManager.canPostPromotedNotifications()) {
                return notification;
            }

            NotificationChannel channel = notificationManager.getNotificationChannel(notification.getChannelId());
            if (channel == null || channel.getImportance() <= NotificationManager.IMPORTANCE_MIN) {
                return notification;
            }

            Notification liveUpdate = buildLiveUpdate(context, formatter, platformData, notification.clone());
            if (liveUpdate.hasPromotableCharacteristics()) {
                return liveUpdate;
            }
        } catch (Exception ex) {
            Log.e(TAG, "toLiveUpdate failure", ex);
        }

        return notification;
    }

    @RequiresApi(Build.VERSION_CODES.BAKLAVA)
    private static Notification buildLiveUpdate(Context context,
                                                SmartStringFormatter formatter,
                                                @Nullable GOLiveActivityPlatformData platformData,
                                                Notification notification) {
        CharSequence nextInstruction = notification.extras.getCharSequence(Notification.EXTRA_SUB_TEXT);
        Notification.Builder builder = Notification.Builder.recoverBuilder(context, notification)
                .setCustomContentView(null)
                .setCustomBigContentView(null)
                .setCustomHeadsUpContentView(null)
                .setStyle(null)
                .setContentText(nextInstruction)
                .setSubText(null);

        if (TextUtils.isEmpty(notification.extras.getCharSequence(Notification.EXTRA_TITLE))) {
            builder.setContentTitle(FALLBACK_TITLE);
        }

        GOLiveActivity androidWidget = platformData == null ? null : platformData.getAndroidWidget();
        Timebar timebar = androidWidget == null ? null : androidWidget.getTimebar();
        if (timebar != null) {
            setTripTimes(builder, formatter, androidWidget.getFooter());
            setProgress(builder, timebar);
        }

        Notification liveUpdate = builder.build();
        liveUpdate.extras.remove(EXTRA_CONTAINS_CUSTOM_VIEW);
        liveUpdate.extras.remove(EXTRA_COMPAT_TEMPLATE);
        liveUpdate.extras.putBoolean(EXTRA_REQUEST_PROMOTED_ONGOING, true);
        return liveUpdate;
    }

    @RequiresApi(Build.VERSION_CODES.BAKLAVA)
    private static void setTripTimes(Notification.Builder builder,
                                     SmartStringFormatter formatter,
                                     @Nullable GOLiveActivityFooter footer) {
        if (footer == null) {
            return;
        }

        String arrivalTime = format(formatter, footer.getArrivalTime());
        String remainingTime = format(formatter, footer.getRemainingTime());
        builder.setSubText(join(arrivalTime, remainingTime)).setShortCriticalText(remainingTime);
    }

    @RequiresApi(Build.VERSION_CODES.BAKLAVA)
    private static void setProgress(Notification.Builder builder, Timebar timebar) {
        TimebarProgressIndicator progressIndicator = timebar.getGoProgressIndicator();
        if (progressIndicator == null) {
            return;
        }

        final float progression = progressIndicator.getProgression();
        if (Float.isNaN(progression) || progression < 0f) {
            return;
        }

        final int progress = Math.round(Math.min(progression, 1f) * PROGRESS_MAX);
        builder.setStyle(new Notification.ProgressStyle().setProgress(progress));
    }

    @Nullable
    private static String format(SmartStringFormatter formatter, @Nullable SmartString smartString) {
        if (smartString == null) {
            return null;
        }

        String text = formatter.patch_formatSmartString(smartString);
        return TextUtils.isEmpty(text) ? null : text;
    }

    @Nullable
    private static String join(@Nullable String first, @Nullable String second) {
        if (first == null) {
            return second;
        }
        if (second == null) {
            return first;
        }
        return first + TEXT_SEPARATOR + second;
    }
}
