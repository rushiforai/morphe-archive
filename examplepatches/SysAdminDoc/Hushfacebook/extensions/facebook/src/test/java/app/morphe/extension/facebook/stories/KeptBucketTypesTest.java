/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

import static org.junit.Assert.*;

/** Names describe delivered enum types, without claiming that a music type identifies the prompt. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class KeptBucketTypesTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private static final String PREFIX = "Stories tray kept unclassified types: ";
    private static final String PRIVATE = "PRIVATE_PERSON_112233 https://private.invalid/photo";
    private boolean copyFails;

    private enum Type {
        STORY, MUSIC_MIXTAPE_STORY, MUSIC_STORY_MID_CARD, CONTACT_IMPORTER_STORY,
        TYPE_00, TYPE_01, TYPE_02, TYPE_03, TYPE_04, TYPE_05, TYPE_06, TYPE_07,
        TYPE_08, TYPE_09, TYPE_10, TYPE_11, TYPE_12, TYPE_13, TYPE_14, TYPE_15, TYPE_16, TYPE_17,
        Invalid;
        static int toStringCalls;
        @Override public String toString() { toStringCalls++; return PRIVATE; }
    }

    private static final class Bucket {
        final Object type;
        final String owner = PRIVATE;
        int reads;
        boolean failExtraRead;
        boolean suggested;
        Bucket(Object type) { this.type = type; }
        @Override public String toString() { throw new AssertionError(owner); }
    }

    private final SuggestedStories.Buckets access = new SuggestedStories.Buckets() {
        @Override public boolean isBucket(Object item) { return item instanceof Bucket; }
        @Override public Object type(Object bucket) {
            Bucket row = (Bucket) bucket;
            if (++row.reads > 1 && row.failExtraRead) throw new IllegalStateException(PRIVATE);
            return row.type;
        }
        @Override public Object suggested(Object bucket) { return ((Bucket) bucket).suggested; }
        @Override public Object label(Object bucket) { return null; }
        @Override public Object copy(List<Object> kept) { return copyFails ? null : new ArrayList<>(kept); }
    };

    @Before public void prepare() {
        BaseSettings.DEBUG.save(true);
        Settings.HIDE_CONTACT_IMPORT_CARD.save(true);
        Type.toStringCalls = 0;
        LogBufferManager.clearLogBuffer();
        FeedFilterCounters.clear();
        HookStatus.clear();
        PauseForTests.resume();
    }

    @After public void restore() {
        BaseSettings.DEBUG.resetToDefault();
        Settings.HIDE_CONTACT_IMPORT_CARD.resetToDefault();
        Settings.HIDE_SUGGESTED_STORIES.resetToDefault();
        PauseForTests.resume();
        LogBufferManager.clearLogBuffer();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private String evidence() {
        String logs = LogBufferManager.buildExportText();
        assertFalse("a diagnostic included content or an exception value", logs.contains(PRIVATE));
        assertFalse("already classified cards keep their friendly names", logs.contains("CONTACT_IMPORTER"));
        assertFalse("already classified cards keep their friendly names", logs.contains("PYMK"));
        assertEquals("a diagnostic rendered an enum's arbitrary text", 0, Type.toStringCalls);
        for (String line : logs.split("\\n")) {
            if (line.contains(PREFIX)) return line.substring(line.indexOf(PREFIX));
        }
        fail("no kept bucket type evidence was logged");
        return "";
    }

    @Test public void namesOnlyDescribeKeptTypesWithoutReadingPeopleOrEnumText() {
        List<Bucket> tray = Arrays.asList(new Bucket(Type.STORY), new Bucket(Type.MUSIC_MIXTAPE_STORY),
                new Bucket(Type.MUSIC_STORY_MID_CARD), new Bucket(Type.MUSIC_MIXTAPE_STORY));
        assertSame(tray, SuggestedStories.keptBuckets(tray, access));
        assertEquals(PREFIX + "MUSIC_MIXTAPE_STORY 2, MUSIC_STORY_MID_CARD 1. Complete true, unknown 0, omitted 0.", evidence());
    }

    @Test public void theTypesFollowWhatWasDeliveredIncludingARefusedCopy() {
        List<Bucket> tray = Arrays.asList(new Bucket(Type.STORY), new Bucket(Type.CONTACT_IMPORTER_STORY),
                new Bucket(Type.MUSIC_MIXTAPE_STORY));
        tray.get(2).suggested = true;
        assertEquals(Arrays.asList(tray.get(0)), SuggestedStories.keptBuckets(tray, access));
        assertEquals(PREFIX + "none. Complete true, unknown 0, omitted 0.", evidence());
        copyFails = true;
        LogBufferManager.clearLogBuffer();
        assertSame(tray, SuggestedStories.keptBuckets(tray, access));
        assertTrue(evidence().contains("MUSIC_MIXTAPE_STORY 1"));
    }

    @Test public void debugOffPerformsNoExtraTypeReads() {
        BaseSettings.DEBUG.save(false);
        Bucket music = new Bucket(Type.MUSIC_MIXTAPE_STORY);
        List<Bucket> tray = Arrays.asList(music);
        assertSame(tray, SuggestedStories.keptBuckets(tray, access));
        assertEquals(1, music.reads);
        assertFalse(LogBufferManager.buildExportText().contains(PREFIX));
    }

    @Test public void pauseKeepsEveryBucketAndStillNamesTheDeliveredTypes() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        List<Bucket> tray = Arrays.asList(new Bucket(Type.CONTACT_IMPORTER_STORY), new Bucket(Type.MUSIC_STORY_MID_CARD));
        assertSame(tray, SuggestedStories.keptBuckets(tray, access));
        assertEquals(PREFIX + "MUSIC_STORY_MID_CARD 1. Complete true, unknown 0, omitted 0.", evidence());
    }

    @Test public void anObserverFailureKeepsSuccessfulFilteringAndNeverLogsTheExceptionValue() {
        Bucket music = new Bucket(Type.MUSIC_MIXTAPE_STORY);
        music.failExtraRead = true;
        List<Bucket> tray = Arrays.asList(new Bucket(Type.CONTACT_IMPORTER_STORY), new Bucket(Type.STORY), music);
        assertEquals(Arrays.asList(tray.get(1), music), SuggestedStories.keptBuckets(tray, access));
        assertEquals(PREFIX + "none. Complete false, unknown 1, omitted 0.", evidence());
    }

    @Test public void wrongFieldShapesAndUnrecognizedNamesRecordIncompleteEvidenceWithoutTheirValues() {
        List<Bucket> tray = Arrays.asList(new Bucket(PRIVATE), new Bucket(Type.Invalid),
                new Bucket(SuggestedStories.UNPATCHED));
        assertSame(tray, SuggestedStories.keptBuckets(tray, access));
        assertEquals(PREFIX + "none. Complete false, unknown 3, omitted 0.", evidence());
    }

    @Test public void exceedingTheUniqueTypeBudgetNamesOmissionsAndKeepsCountingAlreadyRetainedTypes() {
        List<Bucket> tray = new ArrayList<>();
        for (Type type : Type.values()) if (type.name().startsWith("TYPE_")) tray.add(new Bucket(type));
        tray.add(new Bucket(Type.TYPE_00));
        assertSame(tray, SuggestedStories.keptBuckets(tray, access));
        String report = evidence();
        assertTrue(report, report.contains("TYPE_00 2"));
        assertTrue(report, report.contains("TYPE_15 1"));
        assertFalse(report, report.contains("TYPE_16"));
        assertFalse(report, report.contains("TYPE_17"));
        assertTrue(report, report.endsWith("Complete false, unknown 0, omitted 2."));
    }

    @Test public void exceedingTheVisitBudgetLimitsOnlyDiagnosticsAndKeepsTheWholeDeliveredTray() {
        List<Bucket> tray = new ArrayList<>();
        for (int i = 0; i < 257; i++) tray.add(new Bucket(Type.MUSIC_MIXTAPE_STORY));
        assertSame(tray, SuggestedStories.keptBuckets(tray, access));
        assertEquals(257, tray.size());
        assertEquals(1, tray.get(256).reads);
        assertEquals(PREFIX + "MUSIC_MIXTAPE_STORY 256. Complete false, unknown 0, omitted 1.", evidence());
    }

    @Test public void nonBucketsDoNotBecomeTypeNames() {
        List<Object> tray = Arrays.asList(null, new Object(), new Bucket(Type.STORY));
        assertSame(tray, SuggestedStories.keptBuckets(tray, access));
        assertEquals(PREFIX + "none. Complete false, unknown 2, omitted 0.", evidence());
    }
}
