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
import android.os.Build;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/** Read-only local plumbing checks. No registration tokens, account data or network probes. */
final class PushReadiness implements LogBufferManager.ReportSection {
    static final PushReadiness REPORT = new PushReadiness();
    private static final String MESSAGING = "com.google.firebase.MESSAGING_EVENT";
    private static final String RECEIVE = "com.google.android.c2dm.intent.RECEIVE";

    private PushReadiness() { }

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
        String notifications = "unknown";
        String delegate = Build.VERSION.SDK_INT < 29 ? "not available before Android 10" : "unknown";
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager != null) {
            try {
                notifications = manager.areNotificationsEnabled() ? "enabled" : "disabled";
            } catch (RuntimeException unavailable) {
                // Keep unknown separate from an actual denial.
            }
            if (Build.VERSION.SDK_INT >= 29) {
                try {
                    String name = manager.getNotificationDelegate();
                    delegate = name == null ? "none (delegation is optional)"
                            : "com.google.android.gms".equals(name) ? name : "other package (redacted)";
                } catch (RuntimeException unavailable) {
                    // Do not include exception messages, which can contain private context.
                }
            }
        }
        lines.add("notifications: " + notifications);
        lines.add("notification_delegate: " + delegate);
        for (String action : new String[]{MESSAGING, RECEIVE}) {
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

}
