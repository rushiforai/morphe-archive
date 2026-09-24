/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.instagram.patches;

import android.app.Notification;
import android.app.Notification.Builder;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.Locale;

@SuppressWarnings("unused")
public class ForceNotificationGroupingPatch {
    private static final String MODE_ALL = "all";
    private static final String MODE_CATEGORY = "category";
    private static final String DEFAULT_GROUP_BASE = "app.morphe.notification_group";
    private static final String GROUP_SUFFIX = ".morphe.notification_group";
    private static final String LEGACY_GROUP_ALL = "morphe.instagram.notifications";
    private static final String LEGACY_GROUP_PREFIX = LEGACY_GROUP_ALL + ".";
    private static final String LOG_TAG = "MorpheIgNotifGroup";
    private static final String PREFS_NAME = "morphe_notification_grouping";
    private static final String PREF_GROUPING_MODE = "grouping_mode";
    private static final String PREF_GROUP_BASE = "group_base";
    private static final String PREF_STRICT_ALL_GROUPING = "strict_all_grouping";
    private static final String PREF_SUMMARY_TITLE = "summary_title";
    private static final String PREF_SUMMARY_TEXT = "summary_text";
    private static final String PREF_DEBUG_LOGGING = "debug_logging";
    private static final String SUMMARY_TAG = "morphe.notification_group_summary";
    private static final String LEGACY_SUMMARY_TAG = "morphe.instagram.notification_group_summary";
    private static final String TEST_ACTION = "app.morphe.NOTIFICATION_GROUPING_TEST";
    private static final String LEGACY_TEST_ACTION = "app.morphe.instagram.NOTIFICATION_GROUPING_TEST";
    private static final String CONFIG_ACTION = "app.morphe.NOTIFICATION_GROUPING_CONFIG";
    private static final String LEGACY_CONFIG_ACTION = "app.morphe.instagram.NOTIFICATION_GROUPING_CONFIG";
    private static final String TEST_CHANNEL_ID = "morphe_notification_grouping_test";
    private static final String TEST_TAG = "morphe.notification_grouping_test";
    private static final String LEGACY_TEST_TAG = "morphe.instagram.notification_grouping_test";
    private static final int SUMMARY_ID_BASE = 0x4d4f5247;
    private static final int TEST_ID_BASE = 0x4d4f5400;
    private static volatile Context applicationContext;
    private static volatile boolean testReceiverRegistered;

    /**
     * Patched at build time from the patch option.
     */
    private static String buildDefaultGroupingMode() {
        return MODE_ALL;
    }

    /**
     * Patched at build time from the patch option.
     */
    private static boolean buildDefaultStrictAllGrouping() {
        return true;
    }

    /**
     * Patched at build time from the patch option.
     */
    private static boolean buildDefaultDebugLogging() {
        return false;
    }

    /**
     * Called from Instagram's application bootstrap.
     */
    public static void setContext(Context context) {
        initialize(context);
    }

    /**
     * Called from Instagram's application bootstrap.
     */
    public static void initialize(Context context) {
        if (context == null) {
            return;
        }

        applicationContext = context.getApplicationContext();
        registerReceiver(applicationContext);
        debug("Initialized notification grouping context");
    }

    /**
     * Injection point.
     */
    public static Notification.Builder apply(Notification.Builder builder) {
        if (builder == null) {
            return null;
        }

        try {
            Notification notification = builder.build();
            String groupKey = groupKeyFor(notification);
            boolean isSummary = isGroupSummary(notification);

            builder.setGroup(groupKey);
            builder.setGroupSummary(isSummary);
            builder.setGroupAlertBehavior(Notification.GROUP_ALERT_CHILDREN);
            builder.setShortcutId(null);
            debug("Notification.Builder grouped as " + groupKey + ", summary=" + isSummary);
        } catch (Throwable ignored) {
            // Notification building must never be blocked by this cosmetic patch.
            debug("Notification.Builder grouping failed: " + ignored);
        }

        return builder;
    }

    /**
     * Injection point.
     */
    public static Object applyCompatBuilder(Object builder) {
        if (builder == null) {
            return null;
        }

        try {
            Method build = builder.getClass().getMethod("build");
            Object built = build.invoke(builder);

            if (!(built instanceof Notification)) {
                return builder;
            }

            String groupKey = groupKeyFor((Notification) built);
            boolean isSummary = isGroupSummary((Notification) built);
            invokeIfExists(builder, "setGroup", new Class<?>[]{String.class}, groupKey);
            invokeIfExists(builder, "setGroupSummary", new Class<?>[]{boolean.class}, isSummary);
            invokeIfExists(builder, "setGroupAlertBehavior", new Class<?>[]{int.class}, Notification.GROUP_ALERT_CHILDREN);
            invokeIfExists(builder, "setShortcutId", new Class<?>[]{String.class}, (Object) null);
            debug("NotificationCompat.Builder grouped as " + groupKey + ", summary=" + isSummary);
        } catch (Throwable ignored) {
            // Notification building must never be blocked by this cosmetic patch.
            debug("NotificationCompat.Builder grouping failed: " + ignored);
        }

        return builder;
    }

    /**
     * Injection point for already built notifications, right before they are posted.
     */
    public static Notification beforeNotify(Notification notification) {
        if (notification == null) {
            return null;
        }

        try {
            String groupKey = groupKeyFor(notification);
            boolean isSummary = isGroupSummary(notification);
            Notification groupedNotification = notification;

            Context context = applicationContext;
            if (Build.VERSION.SDK_INT >= 23 && context != null) {
                Builder builder = Builder.recoverBuilder(context, notification);
                builder.setGroup(groupKey);
                builder.setGroupSummary(isSummary);
                builder.setGroupAlertBehavior(Notification.GROUP_ALERT_CHILDREN);
                builder.setShortcutId(null);
                normalizeAllMode(builder);
                groupedNotification = builder.build();
            } else {
                debug("Skipping final rebuild for " + groupKey + ": missing context or unsupported Android version");
            }

            groupedNotification.flags |= Notification.FLAG_LOCAL_ONLY;
            groupedNotification.flags |= isSummary ? Notification.FLAG_GROUP_SUMMARY : 0;
            if (!isSummary) {
                groupedNotification.flags &= ~Notification.FLAG_GROUP_SUMMARY;
                ensureGroupSummary(groupKey, groupedNotification);
            }

            debug("NotificationManager.notify grouped as " + groupKey + ", summary=" + isSummary
                    + ", original=" + notificationDebugInfo(notification)
                    + ", grouped=" + notificationDebugInfo(groupedNotification));
            return groupedNotification;
        } catch (Throwable ignored) {
            // Notification posting must never be blocked.
            debug("NotificationManager.notify grouping failed: " + ignored);
            return notification;
        }
    }

    private static void invokeIfExists(Object target, String methodName, Class<?>[] parameterTypes, Object... args) {
        try {
            target.getClass().getMethod(methodName, parameterTypes).invoke(target, args);
        } catch (Throwable ignored) {
        }
    }

    private static boolean isGroupSummary(Notification notification) {
        return (notification.flags & Notification.FLAG_GROUP_SUMMARY) != 0;
    }

    private static void ensureGroupSummary(String groupKey, Notification child) {
        Context context = applicationContext;
        if (context == null) {
            debug("Skipping summary for " + groupKey + ": missing context");
            return;
        }

        NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager == null) {
            debug("Skipping summary for " + groupKey + ": missing notification manager");
            return;
        }

        try {
            Builder builder;
            if (Build.VERSION.SDK_INT >= 26 && child.getChannelId() != null) {
                builder = new Builder(context, child.getChannelId());
            } else {
                builder = new Builder(context);
            }

            if (Build.VERSION.SDK_INT >= 23 && child.getSmallIcon() != null) {
                builder.setSmallIcon(child.getSmallIcon());
            } else if (child.icon != 0) {
                builder.setSmallIcon(child.icon);
            }

            builder.setContentTitle(summaryTitle(context));
            builder.setContentText(summaryText(context));
            builder.setShowWhen(false);
            builder.setLocalOnly(true);
            builder.setGroup(groupKey);
            builder.setGroupSummary(true);
            builder.setGroupAlertBehavior(Notification.GROUP_ALERT_CHILDREN);
            builder.setColor(child.color);

            Notification summary = builder.build();
            summary.flags |= Notification.FLAG_GROUP_SUMMARY;
            summary.flags |= Notification.FLAG_LOCAL_ONLY;
            manager.notify(SUMMARY_TAG, summaryIdFor(groupKey), summary);
            debug("Posted summary for " + groupKey);
        } catch (Throwable error) {
            debug("Summary creation failed for " + groupKey + ": " + error);
        }
    }

    private static int summaryIdFor(String groupKey) {
        return SUMMARY_ID_BASE ^ groupKey.hashCode();
    }

    private static void normalizeAllMode(Builder builder) {
        if (!MODE_ALL.equals(groupingMode()) || !strictAllGrouping()) {
            return;
        }

        try {
            builder.setSortKey(null);
            builder.setSubText(null);
            builder.setCategory(Notification.CATEGORY_STATUS);
            if (Build.VERSION.SDK_INT >= 29) {
                builder.setLocusId(null);
                builder.setAllowSystemGeneratedContextualActions(false);
            }
        } catch (Throwable error) {
            debug("Strict all-mode normalization failed: " + error);
        }
    }

    private static void registerReceiver(Context context) {
        if (testReceiverRegistered) {
            return;
        }

        try {
            IntentFilter filter = new IntentFilter(TEST_ACTION);
            filter.addAction(LEGACY_TEST_ACTION);
            filter.addAction(CONFIG_ACTION);
            filter.addAction(LEGACY_CONFIG_ACTION);
            if (Build.VERSION.SDK_INT >= 33) {
                context.registerReceiver(TEST_RECEIVER, filter, Context.RECEIVER_EXPORTED);
            } else {
                context.registerReceiver(TEST_RECEIVER, filter);
            }
            testReceiverRegistered = true;
            debug("Registered notification grouping receiver: " + TEST_ACTION + ", " + CONFIG_ACTION);
        } catch (Throwable error) {
            debug("Receiver registration failed: " + error);
        }
    }

    private static final BroadcastReceiver TEST_RECEIVER = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (intent == null) {
                return;
            }

            if (CONFIG_ACTION.equals(intent.getAction()) || LEGACY_CONFIG_ACTION.equals(intent.getAction())) {
                applyConfig(intent);
                return;
            }

            if (!(TEST_ACTION.equals(intent.getAction()) || LEGACY_TEST_ACTION.equals(intent.getAction()))
                    || !debugLogging()) {
                return;
            }

            if (intent.getBooleanExtra("clear", false)) {
                clearTestNotifications(context);
                return;
            }

            int count = Math.max(1, Math.min(intent.getIntExtra("count", 5), 20));
            boolean grouped = intent.getBooleanExtra("grouped", true);
            postTestNotifications(context, count, grouped);
        }
    };

    private static void applyConfig(Intent intent) {
        Context context = applicationContext;
        if (context == null) {
            return;
        }

        try {
            SharedPreferences.Editor editor = preferences(context).edit();
            if (intent.hasExtra("mode")) {
                String mode = intent.getStringExtra("mode");
                if (MODE_ALL.equals(mode) || MODE_CATEGORY.equals(mode)) {
                    editor.putString(PREF_GROUPING_MODE, mode);
                }
            }
            if (intent.hasExtra("groupBase")) {
                String groupBase = sanitizePreferenceString(intent.getStringExtra("groupBase"));
                if (groupBase == null) {
                    editor.remove(PREF_GROUP_BASE);
                } else {
                    editor.putString(PREF_GROUP_BASE, groupBase);
                }
            }
            if (intent.hasExtra("strictAll")) {
                editor.putBoolean(PREF_STRICT_ALL_GROUPING, intent.getBooleanExtra("strictAll", true));
            }
            if (intent.hasExtra("summaryTitle")) {
                String title = sanitizePreferenceString(intent.getStringExtra("summaryTitle"));
                if (title == null) {
                    editor.remove(PREF_SUMMARY_TITLE);
                } else {
                    editor.putString(PREF_SUMMARY_TITLE, title);
                }
            }
            if (intent.hasExtra("summaryText")) {
                String text = sanitizePreferenceString(intent.getStringExtra("summaryText"));
                if (text == null) {
                    editor.remove(PREF_SUMMARY_TEXT);
                } else {
                    editor.putString(PREF_SUMMARY_TEXT, text);
                }
            }
            if (intent.hasExtra("debug")) {
                editor.putBoolean(PREF_DEBUG_LOGGING, intent.getBooleanExtra("debug", false));
            }
            editor.apply();
            debug("Updated runtime config: mode=" + groupingMode()
                    + ", groupBase=" + groupAllKey()
                    + ", strictAll=" + strictAllGrouping()
                    + ", debug=" + debugLogging());
        } catch (Throwable error) {
            debug("Runtime config update failed: " + error);
        }
    }

    private static void postTestNotifications(Context context, int count, boolean grouped) {
        NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager == null) {
            debug("Skipping test notifications: missing notification manager");
            return;
        }

        ensureTestChannel(manager);
        clearTestNotifications(context);

        for (int i = 0; i < count; i++) {
            try {
                Builder builder;
                if (Build.VERSION.SDK_INT >= 26) {
                    builder = new Builder(context, TEST_CHANNEL_ID);
                } else {
                    builder = new Builder(context);
                }

                builder.setSmallIcon(context.getApplicationInfo().icon);
                builder.setContentTitle(appLabel(context) + " test " + (i + 1));
                builder.setContentText("Test notification");
                builder.setWhen(System.currentTimeMillis() + i);
                builder.setShowWhen(true);
                builder.setLocalOnly(true);
                builder.setAutoCancel(true);

                Notification notification = builder.build();
                if (grouped) {
                    notification = beforeNotify(notification);
                }

                manager.notify(TEST_TAG, TEST_ID_BASE + i, notification);
            } catch (Throwable error) {
                debug("Posting test notification " + i + " failed: " + error);
            }
        }

        debug("Posted " + count + " test notifications, grouped=" + grouped);
    }

    private static void clearTestNotifications(Context context) {
        NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager == null) {
            return;
        }

        for (int i = 0; i < 20; i++) {
            manager.cancel(TEST_TAG, TEST_ID_BASE + i);
            manager.cancel(LEGACY_TEST_TAG, TEST_ID_BASE + i);
        }

        cancelSummaries(manager, SUMMARY_TAG, groupAllKey(), groupPrefix());
        cancelSummaries(manager, LEGACY_SUMMARY_TAG, LEGACY_GROUP_ALL, LEGACY_GROUP_PREFIX);
        debug("Cleared test notifications");
    }

    private static void cancelSummaries(NotificationManager manager, String tag, String groupAll, String groupPrefix) {
        manager.cancel(tag, summaryIdFor(groupAll));
        manager.cancel(tag, summaryIdFor(groupPrefix + "messages"));
        manager.cancel(tag, summaryIdFor(groupPrefix + "interactions"));
        manager.cancel(tag, summaryIdFor(groupPrefix + "content"));
        manager.cancel(tag, summaryIdFor(groupPrefix + "account"));
        manager.cancel(tag, summaryIdFor(groupPrefix + "other"));
    }

    private static void ensureTestChannel(NotificationManager manager) {
        if (Build.VERSION.SDK_INT < 26) {
            return;
        }

        NotificationChannel existingChannel = manager.getNotificationChannel(TEST_CHANNEL_ID);
        if (existingChannel != null) {
            return;
        }

        NotificationChannel channel = new NotificationChannel(
                TEST_CHANNEL_ID,
                "Morphe notification grouping test",
                NotificationManager.IMPORTANCE_DEFAULT
        );
        channel.setDescription("Temporary notifications used to test Morphe Instagram notification grouping.");
        manager.createNotificationChannel(channel);
    }

    private static String groupKeyFor(Notification notification) {
        if (MODE_CATEGORY.equals(groupingMode())) {
            String category = categoryFor(notification);
            debug("Detected category " + category);
            return groupPrefix() + category;
        }

        return groupAllKey();
    }

    private static String groupingMode() {
        String defaultValue = buildDefaultGroupingMode();
        Context context = applicationContext;
        if (context == null) {
            return defaultValue;
        }

        String value = preferences(context).getString(PREF_GROUPING_MODE, defaultValue);
        if (MODE_ALL.equals(value) || MODE_CATEGORY.equals(value)) {
            return value;
        }

        return defaultValue;
    }

    private static boolean strictAllGrouping() {
        Context context = applicationContext;
        return context == null
                ? buildDefaultStrictAllGrouping()
                : preferences(context).getBoolean(PREF_STRICT_ALL_GROUPING, buildDefaultStrictAllGrouping());
    }

    private static boolean debugLogging() {
        Context context = applicationContext;
        return context == null
                ? buildDefaultDebugLogging()
                : preferences(context).getBoolean(PREF_DEBUG_LOGGING, buildDefaultDebugLogging());
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    private static String groupAllKey() {
        Context context = applicationContext;
        if (context == null) {
            return DEFAULT_GROUP_BASE;
        }

        String configured = sanitizePreferenceString(preferences(context).getString(PREF_GROUP_BASE, null));
        if (configured != null) {
            return configured;
        }

        String packageName = context.getPackageName();
        return packageName == null || packageName.isEmpty()
                ? DEFAULT_GROUP_BASE
                : packageName + GROUP_SUFFIX;
    }

    private static String groupPrefix() {
        return groupAllKey() + ".";
    }

    private static String summaryTitle(Context context) {
        String configured = sanitizePreferenceString(preferences(context).getString(PREF_SUMMARY_TITLE, null));
        return configured != null ? configured : appLabel(context);
    }

    private static String summaryText(Context context) {
        String configured = sanitizePreferenceString(preferences(context).getString(PREF_SUMMARY_TEXT, null));
        return configured != null ? configured : appLabel(context);
    }

    private static String appLabel(Context context) {
        try {
            CharSequence label = context.getPackageManager().getApplicationLabel(context.getApplicationInfo());
            String value = label == null ? null : sanitizePreferenceString(label.toString());
            if (value != null) {
                return value;
            }
        } catch (Throwable ignored) {
        }

        String packageName = context.getPackageName();
        return packageName == null || packageName.isEmpty() ? "App" : packageName;
    }

    private static String sanitizePreferenceString(String value) {
        if (value == null) {
            return null;
        }

        String trimmed = value.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }

    private static String categoryFor(Notification notification) {
        String source = notificationText(notification);

        if (containsAny(source,
                "direct", "message", "messag", "dm", "chat", "inbox",
                "messaggio", "messaggi")) {
            return "messages";
        }

        if (containsAny(source,
                "like", "liked", "comment", "commented", "mention", "mentioned", "tagged",
                "follow", "followed", "follower", "request", "reply", "replied",
                "piace", "commento", "commentato", "menzion", "taggat", "segui",
                "follower", "richiest", "rispost")) {
            return "interactions";
        }

        if (containsAny(source,
                "story", "stories", "reel", "post", "live", "broadcast",
                "storia", "storie", "diretta")) {
            return "content";
        }

        if (containsAny(source,
                "login", "security", "password", "account",
                "accesso", "sicurezza")) {
            return "account";
        }

        String category = notification.category;
        if (category != null && !category.isEmpty()) {
            return sanitizeCategory(category);
        }

        return "other";
    }

    private static String notificationText(Notification notification) {
        StringBuilder builder = new StringBuilder();

        append(builder, notification.getChannelId());
        append(builder, notification.category);

        Bundle extras = notification.extras;
        if (extras != null) {
            append(builder, extras.getCharSequence(Notification.EXTRA_TITLE));
            append(builder, extras.getCharSequence(Notification.EXTRA_TEXT));
            append(builder, extras.getCharSequence(Notification.EXTRA_SUB_TEXT));
            append(builder, extras.getCharSequence(Notification.EXTRA_SUMMARY_TEXT));
            append(builder, extras.getCharSequence(Notification.EXTRA_BIG_TEXT));
            append(builder, extras.getCharSequence(Notification.EXTRA_TITLE_BIG));
        }

        return builder.toString().toLowerCase(Locale.US);
    }

    private static String notificationDebugInfo(Notification notification) {
        if (notification == null) {
            return "null";
        }

        return "channel=" + notification.getChannelId()
                + ", category=" + notification.category
                + ", group=" + notification.getGroup()
                + ", sort=" + notification.getSortKey()
                + ", shortcut=" + (Build.VERSION.SDK_INT >= 26 ? notification.getShortcutId() : null)
                + ", textHash=" + notificationText(notification).hashCode();
    }

    private static void append(StringBuilder builder, Object value) {
        if (value != null) {
            builder.append(' ').append(value);
        }
    }

    private static boolean containsAny(String value, String... needles) {
        for (String needle : needles) {
            if (value.contains(needle)) {
                return true;
            }
        }

        return false;
    }

    private static String sanitizeCategory(String category) {
        StringBuilder builder = new StringBuilder(category.length());
        String lowerCategory = category.toLowerCase(Locale.US);

        for (int i = 0; i < lowerCategory.length(); i++) {
            char c = lowerCategory.charAt(i);
            if ((c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')) {
                builder.append(c);
            }
        }

        return builder.length() == 0 ? "other" : builder.toString();
    }

    private static void debug(String message) {
        if (debugLogging()) {
            Log.d(LOG_TAG, message);
        }
    }
}
