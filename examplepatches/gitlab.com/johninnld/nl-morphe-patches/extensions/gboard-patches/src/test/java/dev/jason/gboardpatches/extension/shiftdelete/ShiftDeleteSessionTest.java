package dev.jason.gboardpatches.extension.shiftdelete;

import static dev.jason.gboardpatches.extension.shiftdelete.ShiftDeleteSession.DELETE;
import static dev.jason.gboardpatches.extension.shiftdelete.ShiftDeleteSession.FORWARD_DELETE;
import static dev.jason.gboardpatches.extension.shiftdelete.ShiftDeleteSession.SHIFT_DOWN;
import static dev.jason.gboardpatches.extension.shiftdelete.ShiftDeleteSession.SHIFT_UP;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ShiftDeleteSessionTest {
    @Test public void nativeRepeatsFollowHeldShiftAndReverseImmediatelyOnRelease() {
        ShiftDeleteSession session = new ShiftDeleteSession();
        assertEquals(DELETE, session.key("PRESS", DELETE));
        assertEquals(SHIFT_DOWN, session.key("DOWN", SHIFT_DOWN));
        assertTrue(session.isShiftHeld());
        for (int i = 0; i < 20; i++) {
            assertEquals(FORWARD_DELETE, session.key("PRESS", DELETE));
        }
        assertEquals(SHIFT_UP, session.key("UP", SHIFT_UP));
        assertFalse(session.isShiftHeld());
        for (int i = 0; i < 20; i++) {
            assertEquals(DELETE, session.key("PRESS", DELETE));
        }
    }

    @Test public void capsLockAndShiftPressAloneNeverArm() {
        ShiftDeleteSession session = new ShiftDeleteSession();
        session.key("PRESS", 59);
        session.key("LONG_PRESS", 115);
        assertEquals(DELETE, session.key("PRESS", DELETE));
        session.key("PRESS", SHIFT_DOWN);
        assertEquals(DELETE, session.key("PRESS", DELETE));
        assertFalse(session.isShiftHeld());
    }

    @Test public void cancelClearsHeldStateWhenShiftUpNeverArrives() {
        ShiftDeleteSession session = new ShiftDeleteSession();
        session.key("DOWN", SHIFT_DOWN);
        session.cancel();
        assertFalse(session.isShiftHeld());
        assertEquals(DELETE, session.key("PRESS", DELETE));
        session.key("DOWN", SHIFT_DOWN);
        assertEquals(FORWARD_DELETE, session.key("PRESS", DELETE));
    }
}
