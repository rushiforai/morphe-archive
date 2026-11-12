/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 * Modified by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.youtube.patches.general;

import org.junit.Test;

import static org.junit.Assert.*;

public class NavigationBarRoomTest {
    @Test public void onlyVisibleNonOpaqueGlassIsEnabled() {
        for (boolean glass : new boolean[]{false, true}) {
            for (boolean opaque : new boolean[]{false, true}) {
                for (boolean hidden : new boolean[]{false, true}) {
                    assertEquals(glass && !opaque && !hidden,
                            NavigationBarRoom.isEnabled(glass, opaque, hidden));
                }
            }
        }
    }

    @Test public void disabledGlassPreservesInsetsIncludingKeyboard() {
        assertEquals(900, NavigationBarRoom.keyboardRoom(false, true, 900, 48));
        assertEquals(900, NavigationBarRoom.keyboardRoom(false, false, 900, 48));
    }

    @Test public void keyboardCannotExpandSystemButtonRoom() {
        assertEquals(48, NavigationBarRoom.keyboardRoom(true, true, 900, 48));
        assertEquals(0, NavigationBarRoom.keyboardRoom(true, true, 0, 48));
        assertEquals(900, NavigationBarRoom.keyboardRoom(true, false, 900, 48));
    }

    @Test public void blurIsOnlyDrawnFromAndroid14() {
        // Android 12 (31) and 13 (33) crash while the player moves, also with the plain translucent style.
        assertFalse(NavigationBarRoom.useBlur(31, true, false));
        assertFalse(NavigationBarRoom.useBlur(33, true, false));
        assertTrue(NavigationBarRoom.useBlur(34, true, false));
        assertTrue(NavigationBarRoom.useBlur(36, true, false));
    }

    @Test public void blurNeedsAHardwareCanvasAndAStyleThatKeepsIt() {
        assertFalse(NavigationBarRoom.useBlur(34, false, false));
        assertFalse(NavigationBarRoom.useBlur(34, true, true));
        assertFalse(NavigationBarRoom.useBlur(34, false, true));
    }
}
