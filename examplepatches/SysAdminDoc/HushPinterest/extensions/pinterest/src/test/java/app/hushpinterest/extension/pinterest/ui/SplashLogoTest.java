/*
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/** When Custom splash logo tells Android which launch screen to show, and what it tells it (#41). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33)
public class SplashLogoTest {
    private static final int THEME = 0x7f150a21;

    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    /** Android's side: the theme this build has, and every theme it's told to use. */
    private static final class FakeSplash implements SplashLogo.Splash {
        int theme = THEME;
        RuntimeException failure;
        /** Runs while Android is being told, as the activity going away at that moment would. */
        Runnable whileTelling;
        final List<Integer> told = new ArrayList<>();

        @Override public int theme(Activity activity) {
            return theme;
        }

        @Override public void use(Activity activity, int theme) {
            if (failure != null) throw failure;
            told.add(theme);
            if (whileTelling != null) whileTelling.run();
        }
    }

    private final FakeSplash splash = new FakeSplash();
    private ActivityController<Activity> controller;
    private Activity activity;

    @Before
    public void prepare() {
        reset();
        SplashLogo.splash = splash;
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
    }

    @After
    public void restore() throws Exception {
        if (controller != null) controller.close();
        Utils.awaitBackgroundTasksForTests();
        reset();
        SplashLogo.splash = new SplashLogo.AndroidSplash();
    }

    private void reset() {
        Settings.CUSTOM_SPLASH_LOGO.resetToDefault();
        BaseSettings.PAUSED.save(false);
        BaseSettings.SAFE_MODE.save(false);
        PauseForTests.resume();
        File marker = HushPinterestPause.markerFile(Utils.getContext());
        if (marker != null) marker.delete();
        Utils.getContext().getSharedPreferences(SplashLogo.STORE, Context.MODE_PRIVATE).edit().clear().commit();
        SplashLogo.forgetForTests();
        HookStatus.clear();
    }

    private static String counted(String what) {
        return FamilyNames.CUSTOM_SPLASH_LOGO + ": invoked 1, 0 found, 0 missing. Counted: " + what + " 1";
    }

    private boolean kept() {
        return Utils.getContext().getSharedPreferences(SplashLogo.STORE, Context.MODE_PRIVATE)
                .contains(SplashLogo.APPLIED);
    }

    /** Off to start, the way a patched Pinterest first opens, with the restart row on a flip. */
    @Test
    public void offToStart() {
        assertEquals(Boolean.FALSE, Settings.CUSTOM_SPLASH_LOGO.defaultValue);
        assertTrue("Android shows the change at the next start", Settings.CUSTOM_SPLASH_LOGO.rebootApp);
        assertFalse(SplashLogo.wanted(activity));
    }

    /**
     * Switched on, the picked logo's theme is handed to Android once, counted and kept, and the
     * next resume in the same process asks Android for nothing.
     */
    @Test
    public void switchedOnThePickedLogoIsHandedOverOnce() {
        Settings.CUSTOM_SPLASH_LOGO.save(true);

        assertTrue(SplashLogo.follow(activity));
        assertEquals(Collections.singletonList(THEME), splash.told);
        assertEquals(Collections.singletonList(counted(SplashLogo.SET)), HookStatus.report());
        assertTrue(Utils.getContext().getSharedPreferences(SplashLogo.STORE, Context.MODE_PRIVATE)
                .getBoolean(SplashLogo.APPLIED, false));

        assertFalse(SplashLogo.follow(activity));
        assertFalse(SplashLogo.follow(activity));
        assertEquals(Collections.singletonList(THEME), splash.told);
    }

    /** A new process with the switch still on tells Android again, in case it lost the answer. */
    @Test
    public void eachProcessHandsThePickedLogoOverOnce() {
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        assertTrue(SplashLogo.follow(activity));

        SplashLogo.forgetForTests();

        assertTrue(SplashLogo.follow(activity));
        assertFalse(SplashLogo.follow(activity));
        assertEquals(List.of(THEME, THEME), splash.told);
    }

    /** Switched off again, Pinterest's own screen is handed back once, and stays back in later processes. */
    @Test
    public void switchedOffPinterestsScreenIsHandedBackOnce() {
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        assertTrue(SplashLogo.follow(activity));
        HookStatus.clear();

        Settings.CUSTOM_SPLASH_LOGO.save(false);
        assertTrue(SplashLogo.follow(activity));
        assertEquals(List.of(THEME, 0), splash.told);
        assertEquals(Collections.singletonList(counted(SplashLogo.CLEARED)), HookStatus.report());

        assertFalse(SplashLogo.follow(activity));
        SplashLogo.forgetForTests();
        assertFalse("a later process has nothing to hand back", SplashLogo.follow(activity));
        assertEquals(List.of(THEME, 0), splash.told);
    }

    /**
     * With nothing kept, as on a first start, Pinterest's screen is handed back once, so a theme
     * Android kept from an earlier install doesn't linger. After that, nothing.
     */
    @Test
    public void withNothingKeptPinterestsScreenIsHandedBackOnce() {
        assertTrue(SplashLogo.follow(activity));
        assertEquals(Collections.singletonList(0), splash.told);
        SplashLogo.forgetForTests();
        assertFalse(SplashLogo.follow(activity));
        assertEquals(Collections.singletonList(0), splash.told);
    }

    /** A start that will run paused shows Pinterest's screen, whichever way it's paused, and the switch is kept. */
    @Test
    public void aPausedNextStartGetsPinterestsScreen() throws Exception {
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        assertTrue(SplashLogo.follow(activity));

        BaseSettings.PAUSED.save(true);
        assertFalse(SplashLogo.wanted(activity));
        assertTrue(SplashLogo.follow(activity));
        assertEquals(List.of(THEME, 0), splash.told);
        BaseSettings.PAUSED.save(false);
        assertTrue(SplashLogo.follow(activity));

        BaseSettings.SAFE_MODE.save(true);
        assertFalse(SplashLogo.wanted(activity));
        BaseSettings.SAFE_MODE.save(false);

        File marker = HushPinterestPause.markerFile(activity);
        assertTrue(marker.getParentFile().isDirectory() || marker.getParentFile().mkdirs());
        assertTrue(marker.createNewFile());
        assertFalse(SplashLogo.wanted(activity));
        assertTrue(SplashLogo.follow(activity));
        assertEquals(List.of(THEME, 0, THEME, 0), splash.told);
        assertTrue("the switch itself stays on", Settings.CUSTOM_SPLASH_LOGO.savedValue());
    }

    /**
     * A process that's running paused hands Android Pinterest's screen too, so Pause turned off
     * shows the logo again only once a start has run unpaused.
     */
    @Test
    public void aPausedProcessGetsPinterestsScreen() {
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        assertTrue(SplashLogo.follow(activity));

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(SplashLogo.wanted(activity));
        assertTrue(SplashLogo.follow(activity));
        assertEquals(List.of(THEME, 0), splash.told);

        PauseForTests.resume();
        assertTrue(SplashLogo.wanted(activity));
        assertTrue(SplashLogo.follow(activity));
        assertEquals(List.of(THEME, 0, THEME), splash.told);
    }

    /** A build without the theme names the miss and leaves Pinterest's screen. */
    @Test
    public void aBuildWithoutTheThemeNamesTheMiss() {
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        splash.theme = 0;

        assertTrue(SplashLogo.follow(activity));

        assertEquals(Collections.singletonList(0), splash.told);
        assertEquals(1, HookStatus.missing(FamilyNames.CUSTOM_SPLASH_LOGO).size());
        assertTrue(HookStatus.missing(FamilyNames.CUSTOM_SPLASH_LOGO).get(0).contains(SplashLogo.THEME));
    }

    /** The test app has no such theme, so Android's own lookup answers 0 rather than another theme. */
    @Test
    public void androidsLookupFindsNoThemeInABuildWithout() {
        assertEquals(0, new SplashLogo.AndroidSplash().theme(activity));
    }

    /** Android refusing is recorded and nothing is kept, so a later resume tries again. */
    @Test
    public void aRefusalIsRecordedAndTriedAgain() {
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        splash.failure = new IllegalStateException("refused");

        assertFalse(SplashLogo.follow(activity));
        assertEquals(1, HookStatus.missing(FamilyNames.CUSTOM_SPLASH_LOGO).size());
        assertFalse(kept());

        splash.failure = null;
        assertTrue(SplashLogo.follow(activity));
        assertEquals(Collections.singletonList(THEME), splash.told);
    }

    /**
     * Android ignores the call for an activity that's gone, so an activity destroyed while Android
     * is told keeps nothing and counts nothing, and the next activity to resume tells it again. One
     * already destroyed isn't used at all.
     */
    @Test
    public void anActivityGoneByTheEndOfTheCallIsToldAgain() {
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        splash.whileTelling = () -> controller.pause().stop().destroy();

        assertFalse(SplashLogo.follow(activity));
        assertEquals(Collections.singletonList(THEME), splash.told);
        assertFalse(kept());
        assertFalse(HookStatus.report().toString().contains(SplashLogo.SET));

        splash.whileTelling = null;
        assertFalse("a destroyed activity isn't used", SplashLogo.follow(activity));
        assertEquals(Collections.singletonList(THEME), splash.told);

        controller = Robolectric.buildActivity(Activity.class).setup();
        assertTrue(SplashLogo.follow(controller.get()));
        assertEquals(List.of(THEME, THEME), splash.told);
        assertFalse(SplashLogo.follow(controller.get()));
    }

    /** Before settings can be read, nothing is asked or counted. */
    @Test
    public void nothingBeforeSettingsCanBeRead() {
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        SettingsContextRule.beforeThePauseIsDecided(() -> assertFalse(SplashLogo.follow(activity)));
        assertTrue(splash.told.isEmpty());
        assertTrue(HookStatus.report().isEmpty());
    }

    /** The watcher follows on a background thread when an activity resumes or pauses, not when it finishes. */
    @Test
    public void theWatcherFollowsOnResumeAndPause() throws Exception {
        SplashLogo.Watcher watcher = new SplashLogo.Watcher();
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        watcher.onActivityResumed(activity);
        Utils.awaitBackgroundTasksForTests();
        assertEquals(Collections.singletonList(THEME), splash.told);

        Settings.CUSTOM_SPLASH_LOGO.save(false);
        watcher.onActivityPaused(activity);
        Utils.awaitBackgroundTasksForTests();
        assertEquals(List.of(THEME, 0), splash.told);

        Settings.CUSTOM_SPLASH_LOGO.save(true);
        activity.finish();
        watcher.onActivityPaused(activity);
        Utils.awaitBackgroundTasksForTests();
        assertEquals("a finishing activity is left alone", List.of(THEME, 0), splash.told);
    }

    /**
     * Flipping the switch, Pause or safe mode tells Android at once through the activity resumed
     * last, so the restart row's start already shows the change. Other settings tell it nothing.
     */
    @Test
    public void aChangedSwitchIsFollowedRightAway() throws Exception {
        new SplashLogo.Watcher().onActivityResumed(activity);
        Utils.awaitBackgroundTasksForTests();
        assertEquals("nothing kept yet, so Pinterest's is handed back", Collections.singletonList(0), splash.told);

        Settings.CUSTOM_SPLASH_LOGO.save(true);
        SplashLogo.changesForTests().onSharedPreferenceChanged(null, Settings.CUSTOM_SPLASH_LOGO.key);
        Utils.awaitBackgroundTasksForTests();
        assertEquals(List.of(0, THEME), splash.told);

        BaseSettings.PAUSED.save(true);
        SplashLogo.changesForTests().onSharedPreferenceChanged(null, BaseSettings.PAUSED.key);
        Utils.awaitBackgroundTasksForTests();
        assertEquals(List.of(0, THEME, 0), splash.told);
        BaseSettings.PAUSED.save(false);

        SplashLogo.changesForTests().onSharedPreferenceChanged(null, Settings.CUSTOM_SAVE_SOUND.key);
        Utils.awaitBackgroundTasksForTests();
        assertEquals("another setting changes nothing", List.of(0, THEME, 0), splash.told);
    }

    /**
     * Android 12 and older have no way to name a launch theme at run time, so nothing is asked and
     * nothing is watched.
     */
    @Test
    @Config(sdk = 30)
    public void androidTwelveAndOlderAreLeftAlone() {
        Settings.CUSTOM_SPLASH_LOGO.save(true);
        assertFalse(SplashLogo.follow(activity));
        SplashLogo.followLater(activity);
        assertTrue(splash.told.isEmpty());
        assertTrue(HookStatus.report().isEmpty());
    }
}
