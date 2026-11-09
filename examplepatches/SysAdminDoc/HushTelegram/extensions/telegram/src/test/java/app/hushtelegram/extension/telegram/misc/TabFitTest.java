/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import org.robolectric.RuntimeEnvironment;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TabFitTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static class Fake implements TabFit.Telegram {
        View strip;
        int range = 600;
        boolean broken;

        @Override public Object strip(Object list) {
            if (broken) throw new IllegalStateException("Telegram changed");
            return strip;
        }

        @Override public int range(Object list) { return range; }
    }

    private static final int SCREEN = 1000;

    private Fake telegram;
    private TabFit.Telegram original;
    private FrameLayout parent;
    private View strip;
    private final Object list = new Object();

    @Before public void setUp() {
        original = TabFit.telegram;
        telegram = new Fake();
        TabFit.telegram = telegram;
        Context context = RuntimeEnvironment.getApplication();
        parent = new FrameLayout(context);
        strip = new View(context);
        parent.addView(strip, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 100));
        parent.layout(0, 0, SCREEN, 100);
        telegram.strip = strip;
        PatchFamilyForTests.inBuild(PatchFamily.HIDE_FOLDER_COUNTERS);
        PatchFamilyForTests.installed(PatchFamily.Capability.FIT_TABS);
        Settings.FIT_ALL_TABS.save(true);
        HookStatus.clear();
    }

    @After public void tearDown() {
        TabFit.telegram = original;
        PatchFamilyForTests.reset();
        PatchFamilyForTests.resetCapabilities();
        Settings.FIT_ALL_TABS.resetToDefault();
    }

    private int width() { return strip.getLayoutParams().width; }

    @Test public void tabsThatFitLeaveTheStripAlone() {
        telegram.range = SCREEN;
        TabFit.update(list);
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, width());
        assertEquals(1f, strip.getScaleX(), 0f);
    }

    @Test public void tabsWiderThanTheScreenAreScaledToIt() {
        telegram.range = 1600;
        TabFit.update(list);
        assertEquals(0.625f, strip.getScaleX(), 0.001f);
        assertEquals("the height shrinks with the width", 0.625f, strip.getScaleY(), 0.001f);
        assertEquals("laid out as wide as the tabs need", 1600, width());
        assertEquals(0f, strip.getPivotX(), 0f);
        assertTrue(String.join("\n", HookStatus.report()).contains("shrunk to fit"));
    }

    @Test public void veryManyTabsStopAtTheSmallestSize() {
        telegram.range = 5000;
        TabFit.update(list);
        assertEquals(TabFit.SMALLEST, strip.getScaleX(), 0.001f);
        assertEquals(Math.round(SCREEN / TabFit.SMALLEST), width());
    }

    @Test public void theStripFollowsTheTabsAsTheyChange() {
        telegram.range = 1600;
        TabFit.update(list);
        telegram.range = 800;
        strip.layout(0, 0, 1600, 100);
        strip.layout(0, 0, 1590, 100);
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, width());
        assertEquals("fewer tabs put it back", 1f, strip.getScaleX(), 0f);
    }

    @Test public void turningTheSwitchOffPutsTheStripBack() {
        telegram.range = 1600;
        TabFit.update(list);
        Settings.FIT_ALL_TABS.save(false);
        TabFit.refreshAll();
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, width());
        assertEquals(1f, strip.getScaleX(), 0f);
        Settings.FIT_ALL_TABS.save(true);
        TabFit.refreshAll();
        assertEquals(1600, width());
    }

    @Test public void aBuildWithoutTheHookLeavesTheStripAlone() {
        PatchFamilyForTests.resetCapabilities();
        PatchFamilyForTests.installed(PatchFamily.Capability.LAUNCH_FOLDER);
        telegram.range = 1600;
        TabFit.update(list);
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, width());
        assertEquals(1f, strip.getScaleX(), 0f);
    }

    @Test public void aMissingStripOrATelegramThatThrowsChangesNothing() {
        telegram.strip = null;
        TabFit.update(list);
        telegram.strip = strip;
        telegram.broken = true;
        TabFit.update(list);
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, width());
        assertTrue(String.join("\n", HookStatus.report()).contains("fit all tabs"));
    }

    @Test public void theScaleAndWidthRules() {
        assertEquals(1f, TabFit.scaleFor(900, 1000), 0f);
        assertEquals(1f, TabFit.scaleFor(1000, 1000), 0f);
        assertEquals(TabFit.SMALLEST, TabFit.scaleFor(2000, 1000), 0.0001f);
        assertEquals(1f, TabFit.scaleFor(5000, 0), 0f);
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, TabFit.widthFor(1f, 1000));
        assertEquals(2000, TabFit.widthFor(0.5f, 1000));
    }
}
