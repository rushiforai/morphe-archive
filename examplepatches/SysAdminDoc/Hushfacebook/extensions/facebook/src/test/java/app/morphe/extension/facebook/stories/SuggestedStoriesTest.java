/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.stories.SuggestedStoriesForTests.Bucket;
import app.morphe.extension.facebook.stories.SuggestedStoriesForTests.Copy;
import app.morphe.extension.facebook.stories.SuggestedStoriesForTests.Label;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The filter first in the tray data's constructor: a bucket Facebook marks as suggested, by its
 * flag or by its first label, doesn't make it into the tray; every other bucket does, in order; and
 * the switch off, a pause, anything it can't read or any failure leaves the tray as Facebook sent it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SuggestedStoriesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void startClean() {
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_SUGGESTED_STORIES.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(SuggestedStories.ROUTE + ":")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SUGGESTED_STORIES + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOnAndASuggestedBucketLeavesTheTray() {
        assertTrue("the switch starts off", Settings.HIDE_SUGGESTED_STORIES.get());
        Bucket own = new Bucket(false, null);
        Bucket suggested = new Bucket(true, null);
        Bucket friend = new Bucket(false, Label.NEWFRIEND);
        Object tray = SuggestedStoriesForTests.keptBuckets(Arrays.asList(own, suggested, friend));
        assertEquals(Arrays.asList(own, friend), tray);
        assertEquals(SuggestedStories.ROUTE + ": 1 lists, 3 items, 1 removed. Last reason: suggested. Removed: "
                + "suggested 1. Kinds: not suggested 2, suggested 1", counterLine());
        assertEquals(FamilyNames.SUGGESTED_STORIES + ": invoked 1, 2 found, 0 missing", statusLine());
        assertEquals("Hide suggested stories", FamilyNames.SUGGESTED_STORIES);
    }

    /** The label the tray's card also says "Suggested" for takes a bucket out on its own. */
    @Test
    public void aBucketLabelledSuggestedGoesToo() {
        Bucket labelled = new Bucket(false, Label.SUGGESTED);
        Bucket both = new Bucket(true, Label.SUGGESTED);
        Bucket friend = new Bucket(false, Label.FAMILY);
        Object tray = SuggestedStoriesForTests.keptBuckets(Arrays.asList(labelled, friend, both));
        assertEquals(Collections.singletonList(friend), tray);
        assertTrue(counterLine(), counterLine().contains("Removed: labelled suggested 1, suggested 1."));
    }

    /**
     * What comes back in place of Facebook's list is the copy the patch makes, an ImmutableList,
     * with the buckets that stay in their order.
     */
    @Test
    public void whatComesBackIsTheCopyInTheSameOrder() {
        List<Object> tray = new ArrayList<>();
        List<Object> followed = new ArrayList<>();
        for (Label label : Label.values()) {
            Bucket bucket = new Bucket(false, label == Label.SUGGESTED ? null : label);
            tray.add(bucket);
            followed.add(bucket);
            tray.add(new Bucket(true, label));
        }
        Object kept = SuggestedStoriesForTests.keptBuckets(tray);
        assertEquals(followed, kept);
        assertTrue("the answer isn't the copy the stub made", kept instanceof List && !(kept instanceof Copy)
                && kept.getClass().getName().startsWith("java.util.Collections$Unmodifiable"));
        assertTrue(counterLine(), counterLine().contains(" " + Label.values().length + " removed"));
    }

    /**
     * Negative control: a tray with no suggestion keeps the very list Facebook built, so the
     * constructor stores what it was handed. Labels other than SUGGESTED, NEWFRIEND and TRENDING
     * among them, don't count.
     */
    @Test
    public void aTrayWithNoSuggestionIsFacebooks() {
        List<Bucket> tray = new ArrayList<>();
        for (Label label : Label.values()) {
            if (label != Label.SUGGESTED) tray.add(new Bucket(false, label));
        }
        tray.add(new Bucket(false, null));
        assertSame(tray, SuggestedStoriesForTests.keptBuckets(tray));
        assertTrue(counterLine(), counterLine().contains(" 0 removed"));
    }

    @Test
    public void offTheTrayIsFacebooks() {
        Settings.HIDE_SUGGESTED_STORIES.save(false);
        List<Bucket> tray = Arrays.asList(new Bucket(true, null), new Bucket(false, Label.SUGGESTED), new Bucket(false, null));
        assertSame(tray, SuggestedStoriesForTests.keptBuckets(tray));
        // Still counted, so a report says the hook is reached and what the tray held.
        assertEquals(SuggestedStories.ROUTE + ": 1 lists, 3 items, 0 removed. Kinds: labelled suggested 1, "
                + "not suggested 1, suggested 1", counterLine());
    }

    @Test
    public void pausedTheTrayIsFacebooks() {
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            List<Bucket> tray = Arrays.asList(new Bucket(true, null), new Bucket(false, null));
            assertSame(why + " filtered the tray", tray, SuggestedStoriesForTests.keptBuckets(tray));
        }
        PauseForTests.resume();
        assertTrue("the filter didn't come back after the pause", SuggestedStoriesForTests.hidesSuggestions());
    }

    /** Until the settings are ready, the tray is Facebook's: a tray fetched at start-up keeps every bucket. */
    @Test
    public void untilTheSettingsAreReadyTheTrayIsFacebooks() {
        boolean[] hid = {true, true};
        SettingsContextRule.withoutContext(() -> hid[0] = SuggestedStoriesForTests.hidesSuggestions());
        SettingsContextRule.beforeThePauseIsDecided(() -> hid[1] = SuggestedStoriesForTests.hidesSuggestions());
        assertFalse(hid[0]);
        assertFalse(hid[1]);
        assertTrue(SuggestedStoriesForTests.hidesSuggestions());
    }

    /** Items that aren't buckets, the Create story tile or a loading placeholder, pass through and are counted by shape. */
    @Test
    public void whatIsntABucketStays() {
        Object tile = new Object();
        Bucket suggested = new Bucket(true, null);
        Object tray = SuggestedStoriesForTests.keptBuckets(Arrays.asList(tile, suggested, null, "loading"));
        assertEquals(Arrays.asList(tile, null, "loading"), tray);
        assertTrue(counterLine(), counterLine().contains("Kinds: not a bucket 3, suggested 1"));
    }

    /** A label that isn't an enum constant isn't SUGGESTED, even when it reads the same. */
    @Test
    public void aLabelThatIsntAnEnumStays() {
        List<Bucket> tray = Collections.singletonList(new Bucket(false, "SUGGESTED"));
        assertSame(tray, SuggestedStoriesForTests.keptBuckets(tray));
        assertTrue(counterLine(), counterLine().contains(SuggestedStories.READ_FAILED + " 1"));
    }

    /** Before the patch fills the stubs in, every item reads as no bucket and the tray stays. */
    @Test
    public void theUnpatchedStubsLeaveTheTray() {
        List<Bucket> tray = Collections.singletonList(new Bucket(true, Label.SUGGESTED));
        assertSame(tray, SuggestedStories.keptBuckets(tray));
        assertTrue(counterLine(), counterLine().contains("Kinds: " + SuggestedStories.NOT_A_BUCKET + " 1"));
        assertFalse(SuggestedStories.isBucket(new Object()));
        assertSame(SuggestedStories.UNPATCHED, SuggestedStories.suggested(new Object()));
        assertSame(SuggestedStories.UNPATCHED, SuggestedStories.label(new Object()));
        assertNull(SuggestedStories.immutableCopy(Collections.emptyList()));
    }

    /** A flag or label stub the patch didn't fill is reported in Hook status, and the bucket stays. */
    @Test
    public void anUnfilledStubIsReported() {
        SuggestedStories.Buckets noFlag = standIn(true, false, true);
        List<Bucket> tray = Collections.singletonList(new Bucket(true, null));
        assertSame(tray, SuggestedStories.keptBuckets(tray, noFlag));
        assertTrue(statusLine(), statusLine().contains("1 missing"));
        assertTrue(statusLine(), statusLine().contains("tray bucket#" + SuggestedStories.SUGGESTED_FLAG));

        HookStatus.clear();
        SuggestedStories.Buckets noLabel = standIn(true, true, false);
        List<Bucket> labelled = Collections.singletonList(new Bucket(false, Label.SUGGESTED));
        assertSame(labelled, SuggestedStories.keptBuckets(labelled, noLabel));
        assertTrue(statusLine(), statusLine().contains("tray bucket#first label"));
        assertTrue(counterLine(), counterLine().contains(SuggestedStories.NOT_PATCHED + " 2"));
    }

    /**
     * A copy stub the patch didn't fill leaves Facebook's list, every bucket in it, and nothing is
     * counted as removed.
     */
    @Test
    public void noCopyLeavesTheTrayWhole() {
        SuggestedStories.Buckets noCopy = standIn(true, true, true);
        List<Bucket> tray = Arrays.asList(new Bucket(true, null), new Bucket(false, null));
        assertSame(tray, SuggestedStories.keptBuckets(tray, noCopy));
        assertTrue(counterLine(), counterLine().contains(" 0 removed"));
        assertTrue(statusLine(), statusLine().contains("ImmutableList#copyOf(Collection)"));
    }

    /** A read that throws is recorded, the rest of the tray is still judged, and nothing crashes. */
    @Test
    public void aThrowingReadKeepsThatBucket() {
        SuggestedStories.Buckets throwing = new SuggestedStories.Buckets() {
            @Override
            public boolean isBucket(Object item) {
                return item instanceof Bucket || item instanceof String;
            }

            @Override
            public Object suggested(Object bucket) {
                if (bucket instanceof String) throw new IllegalStateException("released tree");
                return SuggestedStoriesForTests.STAND_IN.suggested(bucket);
            }

            @Override
            public Object label(Object bucket) {
                return SuggestedStoriesForTests.STAND_IN.label(bucket);
            }

            @Override
            public Object copy(List<Object> kept) {
                return SuggestedStoriesForTests.STAND_IN.copy(kept);
            }
        };
        Bucket suggested = new Bucket(true, null);
        Object tray = SuggestedStories.keptBuckets(Arrays.asList("broken", suggested, new Bucket(false, null)), throwing);
        assertEquals(2, ((List<?>) tray).size());
        assertFalse(((List<?>) tray).contains(suggested));
        assertTrue(counterLine(), counterLine().contains(SuggestedStories.READ_FAILED + " 1"));
        assertTrue(statusLine(), statusLine().contains("IllegalStateException"));
    }

    /** A list that fails as it's walked hands Facebook back its own list: the filter fails open. */
    @Test
    public void aFailureMidTrayFailsOpen() {
        List<Object> broken = new ArrayList<Object>(Arrays.asList(new Bucket(true, null), new Bucket(false, null))) {
            @Override
            public Object get(int index) {
                if (index == 1) throw new IndexOutOfBoundsException("changed under the filter");
                return super.get(index);
            }
        };
        assertSame(broken, SuggestedStoriesForTests.keptBuckets(broken));
        assertTrue(statusLine(), statusLine().contains("IndexOutOfBoundsException"));
    }

    @Test
    public void anEmptyOrMissingTrayIsHandedBack() {
        List<Bucket> empty = Collections.emptyList();
        assertSame(empty, SuggestedStoriesForTests.keptBuckets(empty));
        assertNull(SuggestedStoriesForTests.keptBuckets(null));
    }

    /**
     * With debug logging on, each tray says how many buckets it held and kept and of which kinds,
     * never whose stories they are.
     */
    @Test
    public void theDebugLineNamesKindsOnly() {
        LogBufferManager.clearLogBuffer();
        try {
            BaseSettings.DEBUG.save(true);
            SuggestedStoriesForTests.keptBuckets(Arrays.asList(new Bucket(true, null), new Bucket(false, Label.NEWFRIEND),
                    new Bucket(false, null)));
            Settings.HIDE_SUGGESTED_STORIES.save(false);
            SuggestedStoriesForTests.keptBuckets(Collections.singletonList(new Bucket(true, null)));
            String log = LogBufferManager.buildExportText();
            assertTrue(log, log.contains("Stories tray: 3 buckets, 2 kept. Kinds: suggested 1, not suggested 2"));
            assertTrue(log, log.contains("Stories tray: 1 buckets, 1 kept. Kinds: suggested 1 (switch off)"));
            assertFalse(log, log.contains("NEWFRIEND"));
        } finally {
            BaseSettings.DEBUG.resetToDefault();
            LogBufferManager.clearLogBuffer();
        }
    }

    @Test
    public void theDebugSummaryNamesKindsInTheOrderTheyCame() {
        assertEquals("not suggested 2, suggested 1, not a bucket 1",
                SuggestedStories.summary(Arrays.asList("not suggested", "suggested", "not suggested", "not a bucket")));
        assertEquals("", SuggestedStories.summary(Collections.emptyList()));
    }

    @Test
    public void theProbeHidesBothKindsOfSuggestion() {
        assertTrue(SuggestedStoriesForTests.hidesSuggestions());
    }

    /**
     * The stand-in stubs with one or more of them left as the extension ships them: [bucket] false
     * leaves isBucket unpatched, [flag] and [label] false leave those, and the copy is always the
     * unpatched one here.
     */
    private static SuggestedStories.Buckets standIn(boolean bucket, boolean flag, boolean label) {
        return new SuggestedStories.Buckets() {
            @Override
            public boolean isBucket(Object item) {
                return bucket ? SuggestedStoriesForTests.STAND_IN.isBucket(item) : SuggestedStories.isBucket(item);
            }

            @Override
            public Object suggested(Object item) {
                return flag ? SuggestedStoriesForTests.STAND_IN.suggested(item) : SuggestedStories.suggested(item);
            }

            @Override
            public Object label(Object item) {
                return label ? SuggestedStoriesForTests.STAND_IN.label(item) : SuggestedStories.label(item);
            }

            @Override
            public Object copy(List<Object> kept) {
                return SuggestedStories.immutableCopy(kept);
            }
        };
    }
}
