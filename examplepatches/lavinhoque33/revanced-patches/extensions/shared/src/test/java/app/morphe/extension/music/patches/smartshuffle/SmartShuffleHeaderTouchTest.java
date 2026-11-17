/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import android.view.MotionEvent;

import org.junit.Test;

import static org.junit.Assert.*;

public class SmartShuffleHeaderTouchTest {
    @Test
    public void repairsNativeListenerOnDownBeforeLongPressNotOnlyAfterUp() {
        assertTrue(SmartShuffleUi.refreshHeaderOnTouch(MotionEvent.ACTION_DOWN));
        assertTrue(SmartShuffleUi.refreshHeaderOnTouch(MotionEvent.ACTION_UP));
        assertFalse(SmartShuffleUi.refreshHeaderOnTouch(MotionEvent.ACTION_MOVE));
        assertFalse(SmartShuffleUi.refreshHeaderOnTouch(MotionEvent.ACTION_CANCEL));
        assertFalse(SmartShuffleUi.refreshHeaderOnTouch(MotionEvent.ACTION_POINTER_DOWN));
    }
}
