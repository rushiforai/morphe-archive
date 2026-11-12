/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.shared.settings.preference;

import org.junit.Test;

import java.util.Collection;
import java.util.List;
import java.util.TreeSet;
import java.util.function.BiConsumer;

import static app.morphe.extension.shared.settings.preference.FeatureFlagsBisect.Result.*;
import static org.junit.Assert.*;

public class FeatureFlagsBisectTest {
    private static final class Saved implements BiConsumer<Collection<Long>, FeatureFlagsBisect> {
        TreeSet<Long> blocked;
        FeatureFlagsBisect search;

        @Override
        public void accept(Collection<Long> flags, FeatureFlagsBisect state) {
            blocked = new TreeSet<>(flags);
            search = state;
        }
    }

    @Test
    public void splitSortsDeduplicatesRoundsUpAndExcludesAlreadyBlockedFlags() {
        Saved saved = new Saved();
        FeatureFlagsBisect bisect = FeatureFlagsBisect.start(
                List.of(5L, 3L, 1L, 4L, 2L, 2L, 99L), List.of(99L), saved);

        assertEquals(1, bisect.getStep());
        assertEquals(5, bisect.getRemainingCount());
        assertEquals(3, bisect.getTestingCount());
        assertEquals(new TreeSet<>(List.of(1L, 2L, 3L, 99L)), saved.blocked);
        assertSame(bisect, saved.search);
    }

    @Test
    public void behaviorPresentDiscardsBlockedHalfAndTestsTheRest() {
        Saved saved = new Saved();
        FeatureFlagsBisect bisect = FeatureFlagsBisect.start(List.of(1L, 2L, 3L, 4L), List.of(99L), saved);

        assertEquals(CONTINUE, bisect.answer(true));
        assertEquals(2, bisect.getStep());
        assertEquals(2, bisect.getRemainingCount());
        assertEquals(1, bisect.getTestingCount());
        assertEquals(new TreeSet<>(List.of(3L, 99L)), saved.blocked);
        assertFalse(bisect.behaviorEverAbsent());
    }

    @Test
    public void behaviorAbsentKeepsBlockedHalfThenFindsAndKeepsTheCulpritBlocked() {
        Saved saved = new Saved();
        FeatureFlagsBisect bisect = FeatureFlagsBisect.start(List.of(1L, 2L, 3L, 4L), List.of(99L), saved);

        assertEquals(CONTINUE, bisect.answer(false));
        assertTrue(bisect.behaviorEverAbsent());
        assertEquals(2, bisect.getRemainingCount());
        assertEquals(new TreeSet<>(List.of(1L, 99L)), saved.blocked);
        assertEquals(CONTINUE, bisect.answer(true));
        assertEquals(new TreeSet<>(List.of(2L, 99L)), saved.blocked);
        assertEquals(FOUND, bisect.answer(false));
        assertEquals(2L, bisect.getFoundFlag());
        assertEquals(new TreeSet<>(List.of(2L, 99L)), saved.blocked);
        assertNull(saved.search);
    }

    @Test
    public void singleRemainingFlagMustBeTestedBeforeItIsFound() {
        Saved saved = new Saved();
        FeatureFlagsBisect bisect = FeatureFlagsBisect.start(List.of(1L, 2L), List.of(), saved);

        assertEquals(CONTINUE, bisect.answer(true));
        assertEquals(1, bisect.getRemainingCount());
        assertEquals(1, bisect.getTestingCount());
        assertEquals(FOUND, bisect.answer(false));
        assertEquals(2L, bisect.getFoundFlag());
        assertNull(saved.search);
    }

    @Test
    public void exhaustedSearchRestoresUserFlagsWithoutClaimingAResult() {
        Saved saved = new Saved();
        FeatureFlagsBisect bisect = FeatureFlagsBisect.start(List.of(1L, 2L), List.of(99L), saved);

        assertEquals(CONTINUE, bisect.answer(true));
        assertEquals(EXHAUSTED, bisect.answer(true));
        assertFalse(bisect.behaviorEverAbsent());
        assertEquals(new TreeSet<>(List.of(99L)), saved.blocked);
        assertNull(saved.search);
    }

    @Test
    public void exhaustedSearchRemembersThatMultipleFlagsMayBeInvolved() {
        Saved saved = new Saved();
        FeatureFlagsBisect bisect = FeatureFlagsBisect.start(List.of(1L, 2L, 3L, 4L), List.of(), saved);

        assertEquals(CONTINUE, bisect.answer(false));
        assertEquals(CONTINUE, bisect.answer(true));
        assertEquals(EXHAUSTED, bisect.answer(true));
        assertTrue(bisect.behaviorEverAbsent());
        assertTrue(saved.blocked.isEmpty());
        assertNull(saved.search);
    }

    @Test
    public void cancelRestoresOnlyTheOriginalBlockedFlags() {
        Saved saved = new Saved();
        FeatureFlagsBisect bisect = FeatureFlagsBisect.start(List.of(1L, 2L, 3L), List.of(99L), saved);
        bisect.answer(true);
        bisect.cancel();

        assertEquals(new TreeSet<>(List.of(99L)), saved.blocked);
        assertNull(saved.search);
    }

    @Test
    public void oneCandidateIsSplitAndIdentified() {
        Saved saved = new Saved();
        FeatureFlagsBisect bisect = FeatureFlagsBisect.start(List.of(7L), List.of(), saved);

        assertEquals(1, bisect.getTestingCount());
        assertEquals(FOUND, bisect.answer(false));
        assertEquals(7L, bisect.getFoundFlag());
        assertEquals(new TreeSet<>(List.of(7L)), saved.blocked);
        assertNull(saved.search);
    }
}
