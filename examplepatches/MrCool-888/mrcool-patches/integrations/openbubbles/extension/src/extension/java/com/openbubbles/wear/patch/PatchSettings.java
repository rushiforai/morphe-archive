package com.openbubbles.wear.patch;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import androidx.compose.runtime.Composer;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import com.openbubbles.wear.bridge.EmbeddedRuntime;
import com.localob.messaging.app.settings.AccountStatusSectionKt;
import com.localob.messaging.app.settings.SettingRowsKt;
import kotlin.Unit;

/** Runtime settings belong to OpenBubbles, which enforces them on every request. */
public final class PatchSettings {
    static final String PREFS = "morphe_wear_patches";
    static final String ENABLED = "wear_bridge_enabled";
    private static final String CLASSIC_REPLY_MENU = "classic_reply_menu";
    private static final String CLASSIC_REPLY_MENU_INSTALLED = "com.openbubbles.wear.patch.CLASSIC_REPLY_MENU";
    private static final String REVERSE_SWIPE_TO_REPLY = "reverse_swipe_to_reply";
    private static Boolean classicReplyMenuActive;
    private static Boolean reverseSwipeToReplyActive;
    // Native OB 2.0.0 BackendForegroundService's dedicated status channel.
    static final String READY_NOTIFICATION_CHANNEL = "com.localob.messaging.backend";

    private PatchSettings() { }

    static boolean hasClassicReplyMenu(Context context) {
        try {
            Bundle metadata = context.getPackageManager().getApplicationInfo(
                    context.getPackageName(), PackageManager.GET_META_DATA).metaData;
            return metadata != null && metadata.getBoolean(CLASSIC_REPLY_MENU_INSTALLED);
        } catch (PackageManager.NameNotFoundException ignored) {
            return false;
        }
    }

    public static boolean isClassicReplyMenuEnabled(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(CLASSIC_REPLY_MENU, true);
    }

    static boolean isClassicReplyMenuActive(Context context) {
        if (classicReplyMenuActive == null) classicReplyMenuActive = isClassicReplyMenuEnabled(context);
        return classicReplyMenuActive;
    }

    static void setClassicReplyMenuEnabled(Context context, boolean enabled) {
        isClassicReplyMenuActive(context);
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putBoolean(CLASSIC_REPLY_MENU, enabled).apply();
    }

    static boolean isReverseSwipeToReplyEnabled(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(REVERSE_SWIPE_TO_REPLY, true);
    }

    static boolean isReverseSwipeToReplyActive(Context context) {
        // Native swipe handlers are remembered by the transcript until restart.
        if (reverseSwipeToReplyActive == null) reverseSwipeToReplyActive = isReverseSwipeToReplyEnabled(context);
        return reverseSwipeToReplyActive;
    }

    static void setReverseSwipeToReplyEnabled(Context context, boolean enabled) {
        isReverseSwipeToReplyActive(context);
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putBoolean(REVERSE_SWIPE_TO_REPLY, enabled).apply();
    }

    public static boolean isEnabled(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(ENABLED, true);
    }

    public static void setEnabled(Context context, boolean enabled) {
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putBoolean(ENABLED, enabled).apply();
        try { EmbeddedRuntime.onBackendChanged(); }
        catch (Throwable error) { Log.w("OBWearPatch", "Unable to refresh embedded bridge", error); }
    }

    public static boolean isReadyNotificationHidden(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        NotificationChannel channel = manager.getNotificationChannel(READY_NOTIFICATION_CHANNEL);
        return channel != null && channel.getImportance() == NotificationManager.IMPORTANCE_NONE;
    }

    public static void openReadyNotificationSettings(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager.getNotificationChannel(READY_NOTIFICATION_CHANNEL) == null) {
            NotificationChannel channel = new NotificationChannel(READY_NOTIFICATION_CHANNEL,
                    "Background connection", NotificationManager.IMPORTANCE_MIN);
            channel.setDescription("Keeps the connection to Apple open so messages arrive.");
            channel.setShowBadge(false);
            channel.setSound(null, null);
            channel.enableVibration(false);
            manager.createNotificationChannel(channel);
        }
        // Android owns foreground-service channel visibility; keep the connection service running.
        context.startActivity(new Intent(Settings.ACTION_CHANNEL_NOTIFICATION_SETTINGS)
                .putExtra(Settings.EXTRA_APP_PACKAGE, context.getPackageName())
                .putExtra(Settings.EXTRA_CHANNEL_ID, READY_NOTIFICATION_CHANNEL));
    }

    public static String diagnostics(Context context) { return EmbeddedRuntime.diagnostics(context); }

    public static void clearCache(Context context) { EmbeddedRuntime.clearCache(context); }

    public static void accountStatusAndPatches(Composer composer, int flags) {
        AccountStatusSectionKt.AccountStatusSection(composer, flags);
        try {
            Context context = (Context) composer.consume(AndroidCompositionLocals_androidKt.getLocalContext());
            SettingRowsKt.SettingLink("Morphe patches", "Configure installed patches", null, () -> {
                context.startActivity(new Intent(context, PatchSettingsActivity.class));
                return Unit.INSTANCE;
            }, composer, 0, 4);
        } catch (RuntimeException error) {
            Log.w("OBWearPatch", "Unable to show patch settings", error);
        }
    }
}
