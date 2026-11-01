/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.Manifest;
import android.app.NotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ComponentInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/**
 * Read-only local plumbing checks. No registration tokens, account data or network probes. The
 * Android notification settings row reads the same answer Android gives the report and opens
 * Android's own page for it; nothing here changes a permission or a setting.
 */
final class PushReadiness implements LogBufferManager.ReportSection {
    static final PushReadiness REPORT = new PushReadiness();
    private static final String MESSAGING = "com.google.firebase.MESSAGING_EVENT";
    private static final String RECEIVE = "com.google.android.c2dm.intent.RECEIVE";
    static final String GMS_CORE = "app.revanced.android.gms";
    private static final String GMS_CORE_RECEIVE = "app.revanced.android.c2dm.intent.RECEIVE";

    /** Overrides the GmsCore support flag for tests. Null reads the flag injected when patching. */
    @Nullable
    static volatile Boolean gmsCoreForTests;

    private PushReadiness() { }

    /** Whether this build sends push and Google sign-in to microG-RE, which renames the receive action. */
    static boolean gmsCore() {
        Boolean forced = gmsCoreForTests;
        return forced != null ? forced : SettingsStatus.gmsCoreSupport();
    }

    @Override public String title() { return "PUSH READINESS"; }

    @Override public List<String> lines() {
        Context context = Utils.getContext();
        if (context == null) return Collections.singletonList("local checks: unavailable; live delivery not proven");
        List<String> lines = new ArrayList<>();
        String permission = "not required before Android 13";
        try {
            if (Build.VERSION.SDK_INT >= 33) {
                permission = context.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS)
                        == PackageManager.PERMISSION_GRANTED ? "granted" : "denied";
            }
        } catch (RuntimeException unavailable) {
            permission = "unknown";
        }
        lines.add("notification_permission: " + permission);
        Boolean allowed = notificationsEnabled(context);
        String notifications = allowed == null ? "unknown" : allowed ? "enabled" : "disabled";
        boolean gmsCore = gmsCore();
        String delegate = "unknown";
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager != null) {
            try {
                String name = manager.getNotificationDelegate();
                delegate = name == null ? "none (delegation is optional)"
                        : "com.google.android.gms".equals(name) || GMS_CORE.equals(name) ? name : "other package (redacted)";
            } catch (RuntimeException unavailable) {
                // Do not include exception messages, which can contain private context.
            }
        }
        lines.add("notifications: " + notifications);
        lines.add("notification_delegate: " + delegate);
        if (gmsCore) {
            String microG = "unknown";
            try {
                context.getPackageManager().getPackageInfo(GMS_CORE, 0);
                microG = "installed";
            } catch (PackageManager.NameNotFoundException missing) {
                microG = "missing";
            } catch (RuntimeException unavailable) {
                // Keep the other checks when Android cannot answer this query.
            }
            lines.add("microg_re: " + microG);
        }
        for (String action : new String[]{MESSAGING, gmsCore ? GMS_CORE_RECEIVE : RECEIVE}) {
            boolean services = MESSAGING.equals(action);
            String status = "unknown";
            try {
                PackageManager pm = context.getPackageManager();
                String packageName = context.getPackageName();
                Intent intent = new Intent(action).setPackage(packageName);
                List<ResolveInfo> matches = services
                        ? pm.queryIntentServices(intent, PackageManager.MATCH_DISABLED_COMPONENTS)
                        : pm.queryBroadcastReceivers(intent, PackageManager.MATCH_DISABLED_COMPONENTS);
                int enabled = 0;
                int disabled = 0;
                for (ResolveInfo match : matches) {
                    ComponentInfo info = services ? match.serviceInfo : match.activityInfo;
                    if (info == null || !packageName.equals(info.packageName)) continue;
                    int state = pm.getComponentEnabledSetting(new ComponentName(packageName, info.name));
                    boolean active = state == PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                            || (state == PackageManager.COMPONENT_ENABLED_STATE_DEFAULT && info.enabled);
                    int appState = pm.getApplicationEnabledSetting(packageName);
                    active &= appState == PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                            || (appState == PackageManager.COMPONENT_ENABLED_STATE_DEFAULT
                            && info.applicationInfo != null && info.applicationInfo.enabled);
                    if (active) enabled++;
                    else disabled++;
                }
                status = enabled + disabled == 0 ? "missing"
                        : "present, enabled=" + enabled + ", disabled=" + disabled;
            } catch (RuntimeException unavailable) {
                // Keep the other checks when Android cannot answer this query.
            }
            lines.add((services ? "messaging_services: " : "messaging_receivers: ") + status);
        }
        String analytics = "unknown";
        try {
            ApplicationInfo app = context.getPackageManager().getApplicationInfo(
                    context.getPackageName(), PackageManager.GET_META_DATA);
            String key = "firebase_analytics_collection_deactivated";
            analytics = app.metaData == null || !app.metaData.containsKey(key) ? "not declared"
                    : Boolean.toString(app.metaData.getBoolean(key));
        } catch (PackageManager.NameNotFoundException | RuntimeException unavailable) {
            // Preserve the other independently readable fields.
        }
        lines.add("firebase_analytics_collection_deactivated: " + analytics);
        lines.add("delivery: live delivery not proven; local checks do not test server registration or receipt");
        return lines;
    }

    /**
     * Whether Android lets this app show notifications, or null when it didn't say. From Android 13
     * that takes the notification permission as well as the app's own switch.
     */
    @Nullable
    static Boolean notificationsEnabled(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager == null) return null;
        try {
            return manager.areNotificationsEnabled();
        } catch (RuntimeException unavailable) {
            // Keep unknown separate from an actual denial.
            return null;
        }
    }

    /**
     * The Android notification settings row's line for [enabled]. Allowed only means a notification
     * can show, so the line never says a push arrives.
     */
    static String summary(@Nullable Boolean enabled) {
        if (enabled == null) {
            return L10n.t("Android didn't say whether this app can show notifications. Tap to check in Android's settings.");
        }
        return enabled
                ? L10n.t("Android lets this app show notifications. That only means they can show, not that push "
                        + "notifications reach this phone. Tap to change them in Android's settings.")
                : L10n.t("Notifications are off for this app in Android's settings, so none can show. Tap to turn them on there.");
    }

    /**
     * Android's pages for this app's notifications, to try in order: its notification settings, and
     * App info, which leads there, as the fallback. Both name the running package, so a patched app
     * under another package name opens its own page.
     */
    static List<Intent> settingsIntents(Context context) {
        String packageName = context.getPackageName();
        List<Intent> intents = new ArrayList<>(2);
        intents.add(new Intent(android.provider.Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                .putExtra(android.provider.Settings.EXTRA_APP_PACKAGE, packageName));
        intents.add(new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                Uri.fromParts("package", packageName, null)));
        return intents;
    }
}
