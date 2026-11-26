/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;
import java.util.concurrent.TimeUnit;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/**
 * Hide pins you've already seen (#52), against stand-ins with a pin's id and grid title. A stand-in
 * is handed to {@link SeenPins#shown} as its own cell, the way the unpatched stub reads it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SeenPinsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    @interface Json {
        String value();
    }

    static final class Pin {
        @Json("id") String id;
        @Json("grid_title") String gridTitle = "";

        Pin(String id) {
            this.id = id;
        }

        @Override public String toString() {
            return id;
        }
    }

    /** A story or anything else a page carries that isn't a pin. */
    static final class Story {
        @Json("id") String id = "777";
        @Json("story_type") String storyType = "ideas_for_you";

        @Override public String toString() {
            return "story";
        }
    }

    private static final long START = TimeUnit.DAYS.toMillis(20_000);
    private final Pin first = new Pin("100");
    private final Pin second = new Pin("200");
    private final Pin third = new Pin("300");

    @Before
    public void installed() {
        SeenPins.clearForTests();
        SeenPins.nowForTests = START;
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_SEEN_PINS, PatchFamily.Capability.FEED_SAVED_SEARCH));
    }

    @After
    public void restore() {
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Settings.HIDE_SEEN_PINS.resetToDefault();
        Settings.HIDE_SEEN_PINS_SEARCH.resetToDefault();
        Settings.HIDE_SAVED_PINS_ELSEWHERE.resetToDefault();
        SeenPins.FOR.resetToDefault();
        SeenPins.clearForTests();
        ModelFields.clearForTests();
        ModuleItems.clearForTests();
        HookStatus.clear();
    }

    private static List<Object> page(Object... items) {
        return new ArrayList<>(Arrays.asList(items));
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    /** Starts the app over: what's in memory goes, and the file is read again. */
    private static void restart() {
        SeenPinStore.write();
        SeenPinStore.resetForTests();
    }

    private static void later(long millis) {
        SeenPins.nowForTests += millis;
    }

    @Test
    public void itStartsOffAndNotesNothing() {
        assertFalse(Settings.HIDE_SEEN_PINS.get());
        assertFalse(Settings.HIDE_SEEN_PINS_SEARCH.get());
        assertEquals(SeenPins.FOREVER, SeenPins.FOR.get());
        List<Object> home = page(first, second);
        SeenPins.homePage(home);
        SeenPins.shown(first);
        SeenPins.homePage(home);
        assertEquals(Arrays.asList(first, second), home);
        assertEquals(0, SeenPins.remembered());
    }

    /** What Home brought and came on screen leaves Home's next pages; what never came on screen stays. */
    @Test
    public void aPinHomeBroughtLeavesOnceItsCellCameOnScreen() {
        Settings.HIDE_SEEN_PINS.save(true);
        List<Object> home = page(first, second);
        SeenPins.homePage(home);
        assertEquals(Arrays.asList(first, second), home);
        SeenPins.shown(first);
        assertEquals(1, SeenPins.remembered());
        List<Object> next = page(third, first, second);
        SeenPins.homePage(next);
        assertEquals(Arrays.asList(third, second), next);
        assertTrue(report(), report().contains(FamilyNames.FILTER_FEED) && report().contains("seen pin removed 1"));
    }

    /** Boards, More to explore and search show pins in the same cells, and none of those count on their own. */
    @Test
    public void aPinNoHomePageBroughtIsNeverNoted() {
        Settings.HIDE_SEEN_PINS.save(true);
        SeenPins.shown(first);
        assertEquals(0, SeenPins.remembered());
        // A search page notes nothing while only the Home switch is on.
        List<?> results = Arrays.asList(second);
        assertSame(results, SavedPins.searchPage(results));
        SeenPins.shown(second);
        assertEquals(0, SeenPins.remembered());
    }

    @Test
    public void whatIsntAPinStays() {
        Settings.HIDE_SEEN_PINS.save(true);
        Story story = new Story();
        Pin noId = new Pin(null);
        Pin oddId = new Pin("not a number");
        List<Object> home = page(story, noId, oddId);
        SeenPins.homePage(home);
        SeenPins.shown(story);
        SeenPins.shown(noId);
        SeenPins.shown(oddId);
        SeenPins.shown(null);
        SeenPins.homePage(home);
        assertEquals(Arrays.asList(story, noId, oddId), home);
        assertEquals(0, SeenPins.remembered());
    }

    /** With the search switch on, search notes what it brings and leaves out what's been seen anywhere it counts. */
    @Test
    public void searchWorksTheSameWayOnItsOwnSwitch() {
        Settings.HIDE_SEEN_PINS.save(true);
        List<Object> home = page(first);
        SeenPins.homePage(home);
        SeenPins.shown(first);
        // Off: search keeps a pin seen on Home, and its own pins don't count.
        List<?> results = Arrays.asList(first, second);
        assertSame(results, SavedPins.searchPage(results));
        SeenPins.shown(second);
        assertEquals(1, SeenPins.remembered());
        // On: the pin seen on Home leaves search, and a pin seen in search counts too.
        Settings.HIDE_SEEN_PINS_SEARCH.save(true);
        assertEquals(Arrays.asList(second), SavedPins.searchPage(results));
        SeenPins.shown(second);
        assertEquals(2, SeenPins.remembered());
        List<?> more = Arrays.asList(second, third);
        assertEquals(Arrays.asList(third), SavedPins.searchPage(more));
        List<Object> nextHome = page(second, third);
        SeenPins.homePage(nextHome);
        assertEquals(Arrays.asList(third), nextHome);
    }

    /** Search alone, with the Home switch off: Home is left as it was. */
    @Test
    public void theSearchSwitchAloneLeavesHomeAlone() {
        Settings.HIDE_SEEN_PINS_SEARCH.save(true);
        List<?> results = Arrays.asList(first, second);
        assertSame(results, SavedPins.searchPage(results));
        SeenPins.shown(first);
        assertEquals(Arrays.asList(second), SavedPins.searchPage(results));
        List<Object> home = page(first, second);
        SeenPins.homePage(home);
        assertEquals(Arrays.asList(first, second), home);
    }

    /** A build without search's page hook has no search switch to read. */
    @Test
    public void searchNeedsItsHook() {
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_SEEN_PINS));
        Settings.HIDE_SEEN_PINS_SEARCH.save(true);
        assertFalse(SeenPins.searchActive());
        List<?> results = Arrays.asList(first);
        assertSame(results, SeenPins.searchPage(results));
    }

    /** A build where the cell hook didn't go in notes and drops nothing. */
    @Test
    public void nothingWithoutItsHook() {
        Settings.HIDE_SEEN_PINS.save(true);
        SeenPins.homePage(page(first));
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        SeenPins.shown(first);
        assertEquals(0, SeenPins.remembered());
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_SEEN_PINS));
        SeenPins.shown(first);
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        List<Object> home = page(first);
        SeenPins.homePage(home);
        assertEquals(Arrays.asList(first), home);
    }

    @Test
    public void pauseStopsNotingAndHiding() {
        Settings.HIDE_SEEN_PINS.save(true);
        SeenPins.homePage(page(first, second));
        SeenPins.shown(first);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        SeenPins.shown(second);
        List<Object> home = page(first, second);
        SeenPins.homePage(home);
        assertEquals(Arrays.asList(first, second), home);
        PauseForTests.resume();
        SeenPins.homePage(home);
        assertEquals(Arrays.asList(second), home);
    }

    /** A day, a week and a month each let a seen pin back after that long; forever doesn't. */
    @Test
    public void eachLengthLetsAPinBackAfterItsTime() {
        Settings.HIDE_SEEN_PINS.save(true);
        SeenPins.homePage(page(first));
        SeenPins.shown(first);
        long[] lengths = {TimeUnit.DAYS.toMillis(1), TimeUnit.DAYS.toMillis(7), TimeUnit.DAYS.toMillis(30)};
        String[] names = {SeenPins.DAY, SeenPins.WEEK, SeenPins.MONTH};
        for (int at = 0; at < names.length; at++) {
            SeenPins.FOR.save(names[at]);
            SeenPins.nowForTests = START + lengths[at] - TimeUnit.MINUTES.toMillis(1);
            List<Object> inside = page(first);
            SeenPins.homePage(inside);
            assertEquals(names[at], 0, inside.size());
            SeenPins.nowForTests = START + lengths[at] + TimeUnit.MINUTES.toMillis(1);
            List<Object> after = page(first);
            SeenPins.homePage(after);
            assertEquals(names[at], 1, after.size());
        }
        SeenPins.FOR.save(SeenPins.FOREVER);
        SeenPins.nowForTests = START + TimeUnit.DAYS.toMillis(3650);
        List<Object> years = page(first);
        SeenPins.homePage(years);
        assertEquals(0, years.size());
    }

    /** A pin that came back after its time and is seen again stays out for a new stretch. */
    @Test
    public void seenAgainStartsItsTimeOver() {
        Settings.HIDE_SEEN_PINS.save(true);
        SeenPins.FOR.save(SeenPins.DAY);
        SeenPins.homePage(page(first));
        SeenPins.shown(first);
        later(TimeUnit.DAYS.toMillis(2));
        List<Object> back = page(first);
        SeenPins.homePage(back);
        assertEquals(1, back.size());
        SeenPins.shown(first);
        later(TimeUnit.HOURS.toMillis(12));
        List<Object> again = page(first);
        SeenPins.homePage(again);
        assertEquals(0, again.size());
    }

    @Test
    public void whatsSeenOutlastsARestart() {
        Settings.HIDE_SEEN_PINS.save(true);
        SeenPins.homePage(page(first, second));
        SeenPins.shown(first);
        SeenPins.shown(second);
        restart();
        assertEquals(2, SeenPins.remembered());
        List<Object> home = page(first, second, third);
        SeenPins.homePage(home);
        assertEquals(Arrays.asList(third), home);
    }

    /** Scrolling up and down shows a cell again and again; it adds no line until an hour on. */
    @Test
    public void aPinSeenAgainSoonAddsNothing() {
        Settings.HIDE_SEEN_PINS.save(true);
        SeenPins.homePage(page(first));
        SeenPins.shown(first);
        int lines = SeenPinStore.linesForTests();
        later(TimeUnit.MINUTES.toMillis(59));
        SeenPins.shown(first);
        assertEquals(lines, SeenPinStore.linesForTests());
        later(TimeUnit.MINUTES.toMillis(2));
        SeenPins.shown(first);
        assertEquals(lines + 1, SeenPinStore.linesForTests());
    }

    /** Forget lets every seen pin show again, and a second tap brings them back with what was seen since. */
    @Test
    public void forgetAndBringBack() {
        Settings.HIDE_SEEN_PINS.save(true);
        SeenPins.homePage(page(first, second, third));
        SeenPins.shown(first);
        SeenPins.shown(second);
        assertEquals(0, SeenPins.forgotten());
        assertEquals(2, SeenPins.forget());
        assertEquals(0, SeenPins.remembered());
        assertEquals(2, SeenPins.forgotten());
        List<Object> fresh = page(first, second, third);
        SeenPins.homePage(fresh);
        assertEquals(3, fresh.size());
        SeenPins.shown(third);
        assertEquals(2, SeenPins.bringBack());
        assertEquals(0, SeenPins.forgotten());
        assertEquals(3, SeenPins.remembered());
        restart();
        assertEquals(3, SeenPins.remembered());
        assertEquals(3, SeenPins.forget());
        restart();
        assertEquals(0, SeenPins.remembered());
        assertEquals(0, SeenPins.forget());
    }

    /** Past the limit the oldest go first, and the file is written over before it grows far past it. */
    @Test
    public void theOldestGoPastTheLimit() {
        int minute = SeenPins.minute();
        for (long id = 1; id <= SeenPinStore.LIMIT + 10; id++) SeenPinStore.record(id, minute);
        assertEquals(SeenPinStore.LIMIT, SeenPinStore.size());
        assertFalse(SeenPinStore.seenSince(10, Integer.MIN_VALUE));
        assertTrue(SeenPinStore.seenSince(11, Integer.MIN_VALUE));
        SeenPinStore.write();
        File file = new File(RuntimeEnvironment.getApplication().getFilesDir(), SeenPinStore.FILE);
        assertEquals(4 + (long) SeenPinStore.LINE * (SeenPinStore.LIMIT + 10), file.length());
        // Many more lines than pins: the next write puts down only the pins.
        for (int again = 1; again <= SeenPinStore.LIMIT / 2 + 1; again++) {
            SeenPinStore.record(SeenPinStore.LIMIT + 10, minute + again * SeenPinStore.REFRESH_MINUTES);
        }
        SeenPinStore.write();
        assertEquals(4 + (long) SeenPinStore.LINE * SeenPinStore.LIMIT, file.length());
        restart();
        assertEquals(SeenPinStore.LIMIT, SeenPinStore.size());
    }

    /** A file of another shape, or one a write cut off partway, never reads as pins it doesn't hold. */
    @Test
    public void aFileItCantReadIsWrittenOver() throws Exception {
        File file = new File(RuntimeEnvironment.getApplication().getFilesDir(), SeenPinStore.FILE);
        try (DataOutputStream out = new DataOutputStream(new FileOutputStream(file))) {
            out.writeInt(0x12345678);
            out.writeLong(100);
            out.writeInt(SeenPins.minute());
        }
        assertEquals(0, SeenPinStore.size());
        SeenPinStore.write();
        assertEquals(4, file.length());
        SeenPinStore.resetForTests();
        try (DataOutputStream out = new DataOutputStream(new FileOutputStream(file))) {
            out.writeInt(SeenPinStore.MAGIC);
            out.writeLong(100);
            out.writeInt(SeenPins.minute());
            out.writeLong(200);
        }
        assertEquals(1, SeenPinStore.size());
        assertTrue(SeenPinStore.seenSince(100, Integer.MIN_VALUE));
        SeenPinStore.write();
        assertEquals(4 + SeenPinStore.LINE, file.length());
    }

    /** A pin with an ad's fields, which the list filter takes out after Home's page hook has run. */
    static final class AdPin {
        @Json("id") String id = "400";
        @Json("grid_title") String gridTitle = "";
        @Json("is_downstream_promotion") Boolean downstream = true;
        @Json("campaign_id_reformatted") String campaign = "C400";

        @Override public String toString() {
            return id;
        }
    }

    /**
     * Home's page hook runs before the list filter, so an ad still on the page here is that filter's to
     * take out. With Debug logging on, the seen pass says only what it left out: a "Kept" line for an ad
     * it passed along read on the S22 as an ad that got through, the line #6's reports are read for.
     */
    @Test
    public void debugLoggingNeverCallsWhatTheSeenPassLeftInKept() {
        Settings.HIDE_SEEN_PINS.save(true);
        Settings.HIDE_SEEN_PINS_SEARCH.save(true);
        BaseSettings.DEBUG.save(true);
        try {
            LogBufferManager.clearLogBuffer();
            AdPin ad = new AdPin();
            List<Object> home = page(ad, first);
            SeenPins.homePage(home);
            assertEquals(Arrays.asList(ad, first), home);
            List<?> results = Arrays.asList(ad, second);
            assertSame(results, SavedPins.searchPage(results));
            String export = LogBufferManager.buildExportText();
            assertTrue(export, export.contains("Seen pins: 0 left out of a Home page, 2 pins on it noted"));
            assertTrue(export, export.contains("Seen pins: 0 left out of a search page, 2 pins on it noted"));
            assertFalse(export, export.contains("Kept "));
        } finally {
            BaseSettings.DEBUG.resetToDefault();
            LogBufferManager.clearLogBuffer();
        }
    }
}
