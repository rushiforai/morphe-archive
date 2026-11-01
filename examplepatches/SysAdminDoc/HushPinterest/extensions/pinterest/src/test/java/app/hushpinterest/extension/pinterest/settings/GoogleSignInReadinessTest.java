/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.ComponentName;
import android.content.Context;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowPackageManager;
import org.robolectric.shadows.ShadowToast;

import java.util.EnumSet;

import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33)
public class GoogleSignInReadinessTest {
    private static final String MICRO_G = "app.revanced.android.gms";
    private static final String SERVICE = MICRO_G + ".auth.api.identity.service.signin.START";
    private static final String SPOOF = MICRO_G + ".SPOOFED_PACKAGE_SIGNATURE";
    private static final String MISSING_TOAST = "Install microG-RE to use Google sign-in.";
    private static final String DISABLED_TOAST = "Turn on microG-RE to use Google sign-in.";
    private static final String SILENT_TOAST = "microG-RE didn't answer. Open it, then try again.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private Context context;
    private ShadowPackageManager pm;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        pm = Shadows.shadowOf(context.getPackageManager());
        PushReadiness.gmsCoreForTests = true;
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.GMS_CORE_SUPPORT, PatchFamily.SPOOF_SIGNATURE);
    }

    @After public void restore() {
        PushReadiness.gmsCoreForTests = null;
        PatchFamily.inBuildForTests = null;
        GoogleSignInReadiness.lastRequest = "none this launch";
        ShadowToast.reset();
    }

    private void installMicroG(boolean enabled) {
        PackageInfo info = new PackageInfo();
        info.packageName = MICRO_G;
        info.versionName = "7.3.0";
        info.applicationInfo = new ApplicationInfo();
        info.applicationInfo.packageName = MICRO_G;
        info.applicationInfo.enabled = enabled;
        pm.installPackage(info);
    }

    private void addSignInService(String owner) {
        ComponentName service = new ComponentName(owner, owner + ".SignIn");
        pm.addServiceIfNotPresent(service).enabled = true;
        pm.addIntentFilterForService(service, new IntentFilter(SERVICE));
    }

    private String report() {
        return String.join("\n", GoogleSignInReadiness.REPORT.lines());
    }

    private static String toast() {
        ShadowLooper.shadowMainLooper().idle();
        return ShadowToast.getTextOfLatestToast();
    }

    @Test public void microGMissingSaysToInstallItAndNothingRetries() {
        GoogleSignInReadiness.requestFailed(new Exception("17: API: Identity not available on this device"));
        assertEquals(MISSING_TOAST, toast());
        assertEquals("One failure, one message", 1, ShadowToast.shownToastCount());
        String report = report();
        assertTrue(report, report.contains("last_request: failed api_unavailable"));
        assertTrue(report, report.contains("microg_re: missing"));
        assertTrue(report, report.contains("signin_service: none"));
    }

    @Test public void microGDisabledSaysToTurnItOn() {
        installMicroG(false);
        GoogleSignInReadiness.requestFailed(new Exception("3: disabled"));
        assertEquals(DISABLED_TOAST, toast());
        String report = report();
        assertTrue(report, report.contains("microg_re: installed, version 7.3.0, disabled"));
        assertTrue(report, report.contains("last_request: failed service_disabled"));
    }

    @Test public void aRefusalWithMicroGOnSaysItDidntAnswer() {
        installMicroG(true);
        addSignInService(MICRO_G);
        GoogleSignInReadiness.requestFailed(new Exception("8: refused"));
        assertEquals(SILENT_TOAST, toast());
        String report = report();
        assertTrue(report, report.contains("microg_re: installed, version 7.3.0, enabled"));
        assertTrue(report, report.contains("signin_service: microg-re"));
        assertTrue(report, report.contains("last_request: failed internal"));
    }

    @Test public void cancelingIsNotedAndShowsNothing() {
        installMicroG(true);
        GoogleSignInReadiness.requestFailed(new Exception("16: Cancelled by the user"));
        assertNull(toast());
        String report = report();
        assertTrue(report, report.contains("last_request: failed canceled"));
    }

    @Test public void anotherPackageAnsweringIsReportedWithoutItsName() {
        installMicroG(true);
        addSignInService("private.account123.other");
        String report = report();
        assertTrue(report, report.contains("signin_service: other package (redacted)"));
        assertFalse(report, report.contains("account123"));
    }

    @Test public void noExceptionTextOrUnknownStatusReachesTheReport() {
        for (String text : new String[]{"person@example.com: token=abc", "99999: person@example.com", "999: person@example.com", null, ""}) {
            ShadowToast.reset();
            GoogleSignInReadiness.requestFailed(new Exception(text));
            String report = report();
            assertTrue(report, report.contains("last_request: failed other"));
            assertFalse(report, report.contains("person@example.com"));
            assertFalse(report, report.contains("token"));
        }
    }

    @Test public void statusReadsOnlyLeadingDigits() {
        assertEquals(17, GoogleSignInReadiness.statusOf(new Exception("17: API not available")));
        assertEquals(8, GoogleSignInReadiness.statusOf(new Exception("8: ")));
        assertEquals(-1, GoogleSignInReadiness.statusOf(new Exception(": no digits")));
        assertEquals(-1, GoogleSignInReadiness.statusOf(new Exception("a1: letters")));
        assertEquals(-1, GoogleSignInReadiness.statusOf(new Exception("no colon")));
        assertEquals(-1, GoogleSignInReadiness.statusOf(null));
    }

    @Test public void aStockBuildDoesNothingAndReportsThePlayServicesPath() {
        PushReadiness.gmsCoreForTests = false;
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        GoogleSignInReadiness.requestFailed(new Exception("17: nope"));
        assertNull(toast());
        String report = report();
        assertTrue(report, report.contains("gmscore_support: not in build"));
        assertTrue(report, report.contains("spoof_signature: not in build"));
        assertTrue(report, report.contains("provider_path: play services"));
        assertFalse(report, report.contains("microg_re"));
        assertFalse(report, report.contains("last_request"));
    }

    @Test public void reportNamesWhatWasPatchedAndNeverClaimsASignIn() throws Exception {
        String report = report();
        assertTrue(report, report.contains("gmscore_support: in build"));
        assertTrue(report, report.contains("spoof_signature: in build"));
        assertTrue(report, report.contains("provider_path: microg-re"));
        assertTrue(report, report.contains("spoof_metadata: missing"));
        assertTrue(report, report.contains("last_request: none this launch"));
        assertTrue(report, report.contains("local checks don't prove a sign-in finishes"));

        ApplicationInfo own = context.getPackageManager().getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA);
        own.metaData = new Bundle();
        own.metaData.putString(SPOOF, "abc");
        PackageInfo installed = context.getPackageManager().getPackageInfo(context.getPackageName(), PackageManager.GET_META_DATA);
        installed.applicationInfo.metaData = own.metaData;
        pm.installPackage(installed);
        report = report();
        assertTrue(report, report.contains("spoof_metadata: present"));
        assertFalse("the value stays out", report.contains("abc"));
    }

    @Test public void theSectionIsInTheExportAndAFailureCounts() {
        PatchFamily.registerDiagnostics();
        GoogleSignInReadiness.requestFailed(new Exception("17: person@example.com"));
        ShadowLooper.shadowMainLooper().idle();
        String export = LogBufferManager.buildExportText();
        assertTrue(export, export.contains("[GOOGLE SIGN-IN READINESS]"));
        assertTrue(export, export.contains("last_request: failed api_unavailable"));
        assertFalse(export, export.contains("person@example.com"));
        assertTrue(export, export.contains("Google sign-in request failed"));
    }
}
