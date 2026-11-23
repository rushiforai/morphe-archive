/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.youtube.patches.shorts;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class ShortsDownloadTargetTest {
    private static final String FIRST_SHORT = "firstShort_";
    private static final String NEXT_SHORT = "nextShort_B";
    private static final String WATCH_VIDEO = "watchVideo1";

    @Test
    public void firstTapAndSwipeBackUseTheCurrentReelNotPrefetchOrWatchMetadata() {
        ShortsDownloadTarget target = new ShortsDownloadTarget();
        Fragment fragment = new Fragment(FIRST_SHORT);
        target.bind(fragment);
        List<String> launched = new ArrayList<>();
        Runnable unavailable = () -> fail("The visible reel must be downloadable on the first tap");

        target.launch(true, true, () -> "", () -> fragment.currentReel = NEXT_SHORT,
                launched::add, unavailable);
        assertEquals(List.of(FIRST_SHORT), launched);

        target.launch(true, true, () -> FIRST_SHORT, null, launched::add, unavailable);
        fragment.currentReel = FIRST_SHORT;
        target.launch(true, true, () -> NEXT_SHORT, null, launched::add, unavailable);
        target.launch(true, true, () -> WATCH_VIDEO, null, launched::add, unavailable);

        assertEquals(List.of(FIRST_SHORT, NEXT_SHORT, FIRST_SHORT, FIRST_SHORT), launched);
        assertEquals(4, fragment.reads);
    }

    @Test
    public void cannotLaunchWithoutAnActiveBoundReelEvenIfOldMetadataLooksValid() {
        ShortsDownloadTarget target = new ShortsDownloadTarget();
        AtomicInteger unavailable = new AtomicInteger();
        List<String> launched = new ArrayList<>();
        target.launch(true, true, () -> WATCH_VIDEO, null, launched::add, unavailable::incrementAndGet);

        Fragment paused = new Fragment(FIRST_SHORT);
        paused.resumed = false;
        target.bind(paused);
        target.launch(true, true, () -> NEXT_SHORT, null, launched::add, unavailable::incrementAndGet);

        Fragment current = new Fragment(null);
        target.bind(current);
        target.launch(true, true, () -> NEXT_SHORT, null, launched::add, unavailable::incrementAndGet);

        current.currentReel = FIRST_SHORT;
        target.launch(false, true, () -> WATCH_VIDEO, null, launched::add, unavailable::incrementAndGet);

        current.currentReel = "not/a/video";
        target.launch(true, true, () -> WATCH_VIDEO, null, launched::add, unavailable::incrementAndGet);

        assertEquals(List.of(), launched);
        assertEquals(5, unavailable.get());
        assertEquals(1, paused.reads);
        assertEquals(2, current.reads);
    }

    @Test
    public void legacyAppKeepsItsExistingShortsSource() {
        ShortsDownloadTarget target = new ShortsDownloadTarget();
        List<String> launched = new ArrayList<>();

        target.launch(true, false, () -> FIRST_SHORT, null, launched::add,
                () -> fail("A valid legacy ID should still launch"));

        assertEquals(List.of(FIRST_SHORT), launched);
    }

    private static final class Fragment implements ShortsDownloadTarget.Source {
        String currentReel;
        boolean resumed = true;
        int reads;

        Fragment(String currentReel) {
            this.currentReel = currentReel;
        }

        @Override
        public String patch_getActiveShortDownloadId() {
            reads++;
            return resumed ? currentReel : null;
        }
    }
}
