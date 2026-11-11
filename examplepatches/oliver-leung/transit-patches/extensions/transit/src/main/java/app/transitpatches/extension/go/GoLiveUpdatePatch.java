package app.transitpatches.extension.go;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import com.thetransitapp.droid.shared.model.cpp.ImageViewModel;
import com.thetransitapp.droid.shared.model.cpp.SmartString;

import java.util.Locale;

import djinni.java.src.DynamicIsland;
import djinni.java.src.DynamicIslandContent;
import djinni.java.src.DynamicIslandFloatingServiceNameContent;
import djinni.java.src.DynamicIslandImageContent;
import djinni.java.src.DynamicIslandStopContent;
import djinni.java.src.DynamicIslandTextContent;
import djinni.java.src.DynamicIslandTimeContent;
import djinni.java.src.FloatingServiceName;
import djinni.java.src.GOLiveActivity;
import djinni.java.src.GOLiveActivityFooter;
import djinni.java.src.GOLiveActivityPlatformData;
import djinni.java.src.Label;
import djinni.java.src.TextOrImageWithBackground;
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
    private static final String WORD_SEPARATOR = " ";
    private static final String LOCAL_IMAGE_TYPE = "LOCAL";
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
        String remainingTime = null;
        if (timebar != null) {
            remainingTime = setTripTimes(builder, formatter, androidWidget.getFooter());
            setProgress(builder, timebar);
        }

        DynamicIsland dynamicIsland = platformData == null ? null : platformData.getDynamicIsland();
        setStatusBarChip(context, builder, formatter, dynamicIsland, remainingTime);

        Notification liveUpdate = builder.build();
        liveUpdate.extras.remove(EXTRA_CONTAINS_CUSTOM_VIEW);
        liveUpdate.extras.remove(EXTRA_COMPAT_TEMPLATE);
        liveUpdate.extras.putBoolean(EXTRA_REQUEST_PROMOTED_ONGOING, true);
        return liveUpdate;
    }

    @Nullable
    private static String setTripTimes(Notification.Builder builder,
                                       SmartStringFormatter formatter,
                                       @Nullable GOLiveActivityFooter footer) {
        if (footer == null) {
            return null;
        }

        String arrivalTime = format(formatter, footer.getArrivalTime());
        String remainingTime = format(formatter, footer.getRemainingTime());
        builder.setSubText(join(arrivalTime, remainingTime));
        return remainingTime;
    }

    @RequiresApi(Build.VERSION_CODES.BAKLAVA)
    private static void setStatusBarChip(Context context,
                                         Notification.Builder builder,
                                         SmartStringFormatter formatter,
                                         @Nullable DynamicIsland dynamicIsland,
                                         @Nullable String remainingTime) {
        DynamicIslandContent leading = dynamicIsland == null ? null : dynamicIsland.getLeading();
        DynamicIslandContent trailing = dynamicIsland == null ? null : dynamicIsland.getTrailing();

        String trailingText = text(formatter, trailing);
        String leadingText = trailingText == null ? text(formatter, leading) : null;
        boolean leadingFirst = leadingText != null;
        DynamicIslandContent first = leadingFirst ? leading : trailing;
        DynamicIslandContent second = leadingFirst ? trailing : leading;

        String chipText = leadingFirst ? leadingText : trailingText;
        builder.setShortCriticalText(chipText == null ? remainingTime : chipText);

        Icon chipIcon = icon(context, image(first));
        if (chipIcon == null) {
            chipIcon = icon(context, image(second));
        }
        if (chipIcon != null) {
            builder.setSmallIcon(chipIcon);
        }
    }

    @Nullable
    private static String text(SmartStringFormatter formatter, @Nullable DynamicIslandContent content) {
        if (content instanceof DynamicIslandTimeContent) {
            DynamicIslandTimeContent timeContent = (DynamicIslandTimeContent) content;
            return joinWords(format(formatter, timeContent.getTime()), timeContent.getUnitSymbol());
        }
        if (content instanceof DynamicIslandStopContent) {
            int numberOfStops = ((DynamicIslandStopContent) content).getNumberOfStops();
            return numberOfStops > 0 ? String.valueOf(numberOfStops) : null;
        }
        if (content instanceof DynamicIslandTextContent) {
            DynamicIslandTextContent textContent = (DynamicIslandTextContent) content;
            return joinWords(format(formatter, textContent.getTitle()), textContent.getSubtitle());
        }
        if (content instanceof DynamicIslandFloatingServiceNameContent) {
            return serviceName(((DynamicIslandFloatingServiceNameContent) content).getFloatingServiceName());
        }
        return null;
    }

    @Nullable
    private static String serviceName(@Nullable FloatingServiceName floatingServiceName) {
        TextOrImageWithBackground badge = floatingServiceName == null
                ? null : floatingServiceName.getTextOrImageWithBackground();
        Label label = badge == null ? null : badge.getText();
        String text = label == null ? null : label.getText();
        return TextUtils.isEmpty(text) ? null : text;
    }

    @Nullable
    private static ImageViewModel image(@Nullable DynamicIslandContent content) {
        if (content instanceof DynamicIslandTimeContent) {
            return ((DynamicIslandTimeContent) content).getImage();
        }
        if (content instanceof DynamicIslandStopContent) {
            return ((DynamicIslandStopContent) content).getImage();
        }
        if (content instanceof DynamicIslandImageContent) {
            return ((DynamicIslandImageContent) content).getImage();
        }
        if (content instanceof DynamicIslandFloatingServiceNameContent) {
            FloatingServiceName floatingServiceName =
                    ((DynamicIslandFloatingServiceNameContent) content).getFloatingServiceName();
            return floatingServiceName == null ? null : floatingServiceName.getImage();
        }
        return null;
    }

    @SuppressLint("DiscouragedApi")
    @Nullable
    private static Icon icon(Context context, @Nullable ImageViewModel image) {
        ImageViewModel.ImageType imageType = image == null ? null : image.getType();
        if (imageType == null || !LOCAL_IMAGE_TYPE.equals(imageType.name()) || TextUtils.isEmpty(image.getName())) {
            return null;
        }

        String resourceName = image.getName().replace('-', '_').toLowerCase(Locale.ROOT);
        int resourceId = context.getResources().getIdentifier(resourceName, "drawable", context.getPackageName());
        return resourceId == 0 ? null : Icon.createWithResource(context, resourceId);
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

    @Nullable
    private static String joinWords(@Nullable String text, @Nullable String suffix) {
        if (text == null) {
            return null;
        }
        if (TextUtils.isEmpty(suffix) || text.endsWith(suffix)) {
            return text;
        }
        return text + WORD_SEPARATOR + suffix;
    }
}
