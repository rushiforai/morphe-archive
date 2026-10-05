/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.Manifest;
import android.app.NotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.PackageInfo;
import android.os.Bundle;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowPackageManager;

import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33)
public class PushReadinessTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private Context context;
    private ComponentName service;
    private ComponentName receiver;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        service = new ComponentName(context, "private.account123.Messaging");
        receiver = new ComponentName(context, "private.account123.Receiver");
        PatchFamily.registerDiagnostics();
    }

    private void installComponents() throws Exception {
        ShadowPackageManager pm = Shadows.shadowOf(context.getPackageManager());
        pm.addServiceIfNotPresent(service).enabled = true;
        pm.addIntentFilterForService(service, new IntentFilter("com.google.firebase.MESSAGING_EVENT"));
        pm.addReceiverIfNotPresent(receiver).enabled = true;
        pm.addIntentFilterForReceiver(receiver, new IntentFilter("com.google.android.c2dm.intent.RECEIVE"));
        context.getPackageManager().getApplicationInfo(context.getPackageName(), 0).enabled = true;
    }

    @Test public void allPresentStillDoesNotClaimDeliveryOrExposeComponentNames() throws Exception {
        installComponents();
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).grantPermissions(Manifest.permission.POST_NOTIFICATIONS);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        manager.setNotificationDelegate("com.google.android.gms");
        Bundle metadata = new Bundle();
        metadata.putBoolean("firebase_analytics_collection_deactivated", true);
        PackageInfo installed = context.getPackageManager().getPackageInfo(
                context.getPackageName(), PackageManager.GET_META_DATA
                        | PackageManager.GET_SERVICES | PackageManager.GET_RECEIVERS);
        installed.applicationInfo.metaData = metadata;
        Shadows.shadowOf(context.getPackageManager()).installPackage(installed);
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("[PUSH READINESS]"));
        assertTrue(report, report.contains("notification_permission: granted"));
        assertTrue(report, report.contains("notification_delegate: com.google.android.gms"));
        assertTrue(report, report.contains("messaging_services: present, enabled=1, disabled=0"));
        assertTrue(report, report.contains("messaging_receivers: present, enabled=1, disabled=0"));
        assertTrue(report, report.contains("firebase_analytics_collection_deactivated: true"));
        assertTrue(report, report.contains("live delivery not proven"));
        assertFalse(report, report.contains("private.account123"));
    }

    @Test public void missingComponentsAndDelegateAreExplicit() {
        String report = String.join("\n", PushReadiness.REPORT.lines());
        assertTrue(report, report.contains("messaging_services: missing"));
        assertTrue(report, report.contains("messaging_receivers: missing"));
        assertTrue(report, report.contains("notification_delegate: none (delegation is optional)"));
        assertTrue(report, report.contains("firebase_analytics_collection_deactivated: not declared"));
    }

    @Test public void deniedPermissionAndBlockedNotificationsStayDistinct() {
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).denyPermissions(Manifest.permission.POST_NOTIFICATIONS);
        Shadows.shadowOf(context.getSystemService(NotificationManager.class)).setNotificationsEnabled(false);
        String report = String.join("\n", PushReadiness.REPORT.lines());
        assertTrue(report, report.contains("notification_permission: denied"));
        assertTrue(report, report.contains("notifications: disabled"));
    }

    @Test public void disabledComponentsArePresentInsteadOfMissing() throws Exception {
        installComponents();
        context.getPackageManager().setComponentEnabledSetting(service,
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
        context.getPackageManager().setComponentEnabledSetting(receiver,
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
        String report = String.join("\n", PushReadiness.REPORT.lines());
        assertTrue(report, report.contains("messaging_services: present, enabled=0, disabled=1"));
        assertTrue(report, report.contains("messaging_receivers: present, enabled=0, disabled=1"));
    }

    @Test public void unrecognizedDelegateIsRedacted() {
        context.getSystemService(NotificationManager.class).setNotificationDelegate("private.account123.delegate");
        String report = String.join("\n", PushReadiness.REPORT.lines());
        assertTrue(report, report.contains("notification_delegate: other package (redacted)"));
        assertFalse(report, report.contains("account123"));
    }

    @Test @Config(sdk = 28) public void android9DoesNotCallNewerApis() {
        String report = String.join("\n", PushReadiness.REPORT.lines());
        assertTrue(report, report.contains("notification_permission: not required before Android 13"));
        assertTrue(report, report.contains("notification_delegate: not available before Android 10"));
        assertTrue(report, report.contains("live delivery not proven"));
    }
}
