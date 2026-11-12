/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class PageGenerationTest {
    @Test public void aPageThatWasNeverBuiltIsNeverStale() {
        PageGeneration generation = new PageGeneration();

        generation.changed();

        assertFalse(generation.isStale());
    }

    @Test public void aPageBuiltBeforeAChangeIsStale() {
        PageGeneration generation = new PageGeneration();
        generation.built();

        generation.changed();

        assertTrue(generation.isStale());
    }

    @Test public void aRefreshOrABuildAfterTheChangeMakesItCurrent() {
        PageGeneration generation = new PageGeneration();
        generation.built();
        generation.changed();

        generation.built();

        assertFalse(generation.isStale());
    }

    @Test public void aPageBuiltWithTheCurrentCopiesIsNotStale() {
        PageGeneration generation = new PageGeneration();
        generation.changed();
        generation.changed();

        generation.built();

        assertFalse(generation.isStale());
    }
}
