/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import org.junit.Test;

import java.util.HashSet;
import java.util.Set;
import java.util.function.Supplier;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.fail;

public class SmartShuffleAutoSubtitleTest {
    private static final Supplier<String> LABEL = () -> "Suggested";

    @Test
    public void unmarkedSubtitleKeepsItsIdentityAndDoesNotResolveTheLabel() {
        CharSequence original = new StringBuilder("Artist · Album");

        assertSame(original, SmartShuffleAutoSubtitle.project(original, 41, occurrence -> false, () -> {
            fail("Unmarked occurrences must not load or allocate a label");
            return "";
        }));
    }

    @Test
    public void duplicateVideosAreMarkedByOccurrenceRatherThanSharedSubtitleOrMediaIdentity() {
        CharSequence sharedSubtitle = new StringBuilder("Same artist · Same song");
        Set<Long> suggestions = Set.of(42L);

        assertSame(sharedSubtitle, SmartShuffleAutoSubtitle.project(
                sharedSubtitle, 41, suggestions::contains, LABEL));
        assertEquals("Same artist · Same song · Suggested", SmartShuffleAutoSubtitle.project(
                sharedSubtitle, 42, suggestions::contains, LABEL));
    }

    @Test
    public void unknownOccurrenceCannotBeMarkedAndDoesNotQueryTheManager() {
        CharSequence original = new StringBuilder("Artist");

        assertSame(original, SmartShuffleAutoSubtitle.project(original, Long.MIN_VALUE, occurrence -> {
            fail("Unknown native occurrence must not be looked up");
            return true;
        }, LABEL));
    }

    @Test
    public void markerFollowsAnOccurrenceWhenItsPositionChanges() {
        long[] reordered = {43, 42, 41};
        Set<Long> suggestions = Set.of(42L);
        CharSequence original = new StringBuilder("Artist");

        assertSame(original, SmartShuffleAutoSubtitle.project(original, reordered[0], suggestions::contains, LABEL));
        assertEquals("Artist · Suggested", SmartShuffleAutoSubtitle.project(
                original, reordered[1], suggestions::contains, LABEL));
        assertSame(original, SmartShuffleAutoSubtitle.project(original, reordered[2], suggestions::contains, LABEL));
    }

    @Test
    public void confirmedKeepAndDismissClearProjectionFromTheOriginalSubtitle() {
        Set<Long> suggestions = new HashSet<>(Set.of(42L, 43L));
        CharSequence original = new StringBuilder("Artist");

        assertEquals("Artist · Suggested", SmartShuffleAutoSubtitle.project(
                original, 42, suggestions::contains, LABEL));
        suggestions.remove(42L);
        assertSame(original, SmartShuffleAutoSubtitle.project(original, 42, suggestions::contains, LABEL));
        assertEquals("Artist · Suggested", SmartShuffleAutoSubtitle.project(
                original, 43, suggestions::contains, LABEL));
        suggestions.remove(43L);
        assertSame(original, SmartShuffleAutoSubtitle.project(original, 43, suggestions::contains, LABEL));
    }

    @Test
    public void absentNativeSubtitleDoesNotAddASeparator() {
        assertEquals("Suggested", SmartShuffleAutoSubtitle.project(null, 42, occurrence -> true, LABEL));
        assertEquals("Suggested", SmartShuffleAutoSubtitle.project("", 42, occurrence -> true, LABEL));
        assertNull(SmartShuffleAutoSubtitle.project(null, 41, occurrence -> false, LABEL));
    }

    @Test
    public void localizedLabelDoesNotInterpretOrStripTheNativeSubtitle() {
        String original = "Suggested artists";
        Supplier<String> translatedLabel = () -> "Sugerida";

        assertEquals("Suggested artists · Sugerida", SmartShuffleAutoSubtitle.project(
                original, 42, occurrence -> true, translatedLabel));
        assertSame(original, SmartShuffleAutoSubtitle.project(original, 42, occurrence -> false, translatedLabel));
    }
}
