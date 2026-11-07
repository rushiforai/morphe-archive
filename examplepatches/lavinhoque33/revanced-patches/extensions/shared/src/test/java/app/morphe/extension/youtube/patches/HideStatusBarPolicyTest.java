/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 */

package app.morphe.extension.youtube.patches;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class HideStatusBarPolicyTest {

    @Test
    public void focusedFullScreenWindowIsHiddenAgain() {
        assertTrue(HideStatusBarPolicy.shouldRehideOnFocus(true, false, false, false));
    }

    @Test
    public void windowThatLostTheFocusAgainBeforeTheRequestRanIsLeftAlone() {
        assertFalse(HideStatusBarPolicy.shouldRehideOnFocus(false, false, false, false));
    }

    @Test
    public void pictureInPictureIsLeftAlone() {
        assertFalse(HideStatusBarPolicy.shouldRehideOnFocus(true, true, false, false));
    }

    @Test
    public void multiWindowIsLeftAlone() {
        assertFalse(HideStatusBarPolicy.shouldRehideOnFocus(true, false, true, false));
    }

    @Test
    public void finishingActivityIsLeftAlone() {
        assertFalse(HideStatusBarPolicy.shouldRehideOnFocus(true, false, false, true));
    }
}
