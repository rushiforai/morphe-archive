/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.privacy;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.EnumSet;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * When the launch hooks keep Tumblr's ad SDKs and LiveRamp from starting and Crashlytics collection
 * off, and when they leave Tumblr's own behavior.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SdkStartupTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A provider the way the system hands it over: attached to the application, before its own onCreate. */
    private static final class Provider extends ContentProvider {
        @Override public boolean onCreate() { return true; }
        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
        @Override public String getType(Uri uri) { return null; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    }

    private Context app;
    private ContentProvider provider;

    @Before
    public void everyPatchIsIn() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        HookStatus.clear();
        app = RuntimeEnvironment.getApplication();
        provider = new Provider();
        provider.attachInfo(app, null);
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.HIDE_ADS.resetToDefault();
        Settings.DISABLE_ANALYTICS.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test
    public void everyAdNetworkIsKeptFromStartingWhileHideAdsIsOn() {
        Settings.HIDE_ADS.save(true);
        Settings.DISABLE_ANALYTICS.save(false);
        assertNull(SdkStartup.audienceNetwork(app));
        assertTrue(SdkStartup.vungle(provider));
        assertNull(SdkStartup.mobileAds(app));
        assertNull(SdkStartup.nimbus(app));
        assertFalse("LiveRamp follows Disable analytics, not Hide ads", SdkStartup.liveRamp(provider));
        String report = String.join("\n", HookStatus.report());
        for (String sdk : new String[]{"Audience Network", "Vungle", "Google Mobile Ads", "Nimbus"}) {
            assertTrue(report, report.contains(sdk + " start skipped 1"));
        }
    }

    @Test
    public void liveRampIsKeptFromStartingWhileDisableAnalyticsIsOn() {
        Settings.HIDE_ADS.save(false);
        Settings.DISABLE_ANALYTICS.save(true);
        assertTrue(SdkStartup.liveRamp(provider));
        assertFalse("the ad networks follow Hide ads", SdkStartup.vungle(provider));
        assertSame(app, SdkStartup.mobileAds(app));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("LiveRamp start skipped 1"));
    }

    @Test
    public void crashlyticsCollectionStaysOffWhileDisableAnalyticsIsOn() {
        Settings.HIDE_ADS.save(true);
        Settings.DISABLE_ANALYTICS.save(false);
        assertTrue("Crashlytics follows Disable analytics, not Hide ads", SdkStartup.crashReports(app, true));
        Settings.DISABLE_ANALYTICS.save(true);
        assertFalse(SdkStartup.crashReports(app, true));
        assertFalse("Tumblr's own off stays off", SdkStartup.crashReports(app, false));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("Crashlytics collection kept off 2"));
        // Each capability answers for its own hook: without this one, Tumblr's value goes through.
        PatchFamilyForTests.capabilities(EnumSet.complementOf(EnumSet.of(PatchFamily.Capability.CRASH_REPORTS)));
        assertTrue(SdkStartup.crashReports(app, true));
        assertTrue("LiveRamp keeps its own capability", SdkStartup.liveRamp(provider));
    }

    @Test
    public void offPausedOrNotPatchedEverySdkStartsAsTumblrHasIt() {
        Settings.HIDE_ADS.save(true);
        Settings.DISABLE_ANALYTICS.save(true);
        assertTrue("the control: both switches are on", SdkStartup.vungle(provider) && SdkStartup.liveRamp(provider)
                && !SdkStartup.crashReports(app, true));

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertStartsEverything();
        PauseForTests.resume();

        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertStartsEverything();
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));

        Settings.HIDE_ADS.save(false);
        Settings.DISABLE_ANALYTICS.save(false);
        assertStartsEverything();
    }

    @Test
    public void beforeTheSettingsAreReadyNoProviderOrContextMeansTheSdkStarts() {
        Settings.HIDE_ADS.save(true);
        Settings.DISABLE_ANALYTICS.save(true);
        assertTrue("the control: ready settings need no context", SdkStartup.vungle(null));
        SettingsContextRule.withoutContext(() -> {
            assertFalse(SdkStartup.vungle(null));
            assertFalse(SdkStartup.liveRamp(null));
            assertTrue("Tumblr's value goes through", SdkStartup.crashReports(null, true));
            assertFalse("a provider not yet attached has no context", SdkStartup.vungle(new Provider()));
            assertFalse(Utils.settingsReady());
        });
    }

    @Test
    public void aProviderStartingBeforeTheApplicationReadiesTheSettingsAndAnswers() {
        Settings.HIDE_ADS.save(true);
        Settings.DISABLE_ANALYTICS.save(true);
        SettingsContextRule.withoutContext(() -> {
            assertTrue(SdkStartup.vungle(provider));
            assertTrue("the settings are ready for the rest of the launch", Utils.settingsReady());
        });
        SettingsContextRule.withoutContext(() -> {
            assertNull(SdkStartup.nimbus(app));
            assertTrue(Utils.settingsReady());
        });
        SettingsContextRule.withoutContext(() -> {
            assertFalse("the launch setup's application readies them too", SdkStartup.crashReports(app, true));
            assertTrue(Utils.settingsReady());
        });
    }

    @Test
    public void offTheMainThreadBeforeTheSettingsAreReadyTheSdkStarts() throws Exception {
        Settings.HIDE_ADS.save(true);
        AtomicBoolean skipped = new AtomicBoolean(true);
        AtomicReference<Context> handedBack = new AtomicReference<>();
        AtomicReference<Context> audience = new AtomicReference<>();
        AtomicBoolean ready = new AtomicBoolean(true);
        SettingsContextRule.withoutContext(() -> {
            Thread worker = new Thread(() -> {
                skipped.set(SdkStartup.vungle(provider));
                handedBack.set(SdkStartup.mobileAds(app));
                audience.set(SdkStartup.audienceNetwork(app));
                ready.set(Utils.settingsReady());
            });
            worker.start();
            try {
                worker.join(10_000);
            } catch (InterruptedException failure) {
                throw new AssertionError(failure);
            }
        });
        assertFalse(skipped.get());
        assertSame(app, handedBack.get());
        assertSame(app, audience.get());
        assertFalse("nothing off the main thread readies the settings", ready.get());
    }

    private void assertStartsEverything() {
        assertSame(app, SdkStartup.audienceNetwork(app));
        assertFalse(SdkStartup.vungle(provider));
        assertFalse(SdkStartup.liveRamp(provider));
        assertSame(app, SdkStartup.mobileAds(app));
        assertSame(app, SdkStartup.nimbus(app));
        assertTrue(SdkStartup.crashReports(app, true));
        assertFalse(SdkStartup.crashReports(app, false));
    }
}
