package dev.jason.gboardpatches.extension.shiftdelete;

import static dev.jason.gboardpatches.extension.shiftdelete.ShiftDeleteSession.DELETE;
import static dev.jason.gboardpatches.extension.shiftdelete.ShiftDeleteSession.FORWARD_DELETE;
import static dev.jason.gboardpatches.extension.shiftdelete.ShiftDeleteSession.SHIFT_DOWN;
import static dev.jason.gboardpatches.extension.shiftdelete.ShiftDeleteSession.SHIFT_UP;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.KeyEvent;
import android.view.MotionEvent;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, manifest = Config.NONE)
public class GboardShiftDeleteRuntimeTest {
    private Context context;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        GboardPatchesSettings.preferences(context).edit().clear().commit();
        ShiftDeleteEnabledCache cache = ReflectionHelpers.getStaticField(
                GboardShiftDeleteRuntime.class, "ENABLED");
        ReflectionHelpers.setField(cache, "value", null);
        ReflectionHelpers.setField(cache, "attempted", false);
        ReflectionHelpers.setStaticField(GboardShiftDeleteRuntime.class, "binding", null);
        ReflectionHelpers.setStaticField(GboardShiftDeleteRuntime.class, "failed", false);
        ShiftDeleteSession session = ReflectionHelpers.getStaticField(
                GboardShiftDeleteRuntime.class, "SESSION");
        session.cancel();
    }

    @Test public void chordCopiesKeyDataAndRepeatsUntilShiftIsReleased() {
        enable();
        Event shift = new Event(Action.DOWN, SHIFT_DOWN, null);
        assertSame(shift, remap(shift));
        Event delete = new Event(Action.PRESS, DELETE, null);
        Event mapped = (Event) remap(delete);

        assertNotSame(delete, mapped);
        assertNotSame(delete.b, mapped.b);
        assertEquals(DELETE, delete.b[0].d);
        assertEquals(FORWARD_DELETE, mapped.b[0].d);
        assertEquals(Integer.MAX_VALUE, mapped.b[0].g);
        assertSame(delete.b[0].e, mapped.b[0].e);
        assertSame(delete.c, mapped.c);
        assertEquals(delete.timestamp, mapped.timestamp);

        assertEquals(FORWARD_DELETE, ((Event) remap(delete)).b[0].d);

        remap(new Event(Action.UP, SHIFT_UP, null));
        assertSame(delete, remap(delete));
    }

    @Test public void hardwareAndPayloadEventsStayNativeAndCancelClearsShift() {
        enable();
        Event delete = new Event(Action.PRESS, DELETE, null);
        remap(new Event(Action.DOWN, SHIFT_DOWN, "other feature"));
        assertSame(delete, remap(delete));

        Event hardwareShift = new Event(Action.DOWN, SHIFT_DOWN, null);
        hardwareShift.u = new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_SHIFT_LEFT);
        remap(hardwareShift);
        assertSame(delete, remap(delete));

        Event metadataFreeShift = new Event(Action.DOWN, SHIFT_DOWN, null);
        metadataFreeShift.c = null;
        remap(metadataFreeShift);
        assertSame(delete, remap(delete));

        remap(new Event(Action.DOWN, SHIFT_DOWN, null));
        Event hardwareDelete = new Event(Action.PRESS, DELETE, null);
        hardwareDelete.u = new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DEL);
        assertSame(hardwareDelete, remap(hardwareDelete));
        assertSame(delete, remapAfterTouch(delete, MotionEvent.ACTION_CANCEL));

        remap(new Event(Action.DOWN, SHIFT_DOWN, null));
        assertSame(delete, remapAfterTouch(delete, MotionEvent.ACTION_DOWN));
    }

    @Test public void disabledEventsPassThrough() {
        remap(new Event(Action.DOWN, SHIFT_DOWN, null));
        Event delete = new Event(Action.PRESS, DELETE, null);
        assertSame(delete, remap(delete));
    }

    @Test public void unknownInputShapeFailsClosed() {
        enable();
        Object unknown = new Object();
        assertSame(unknown, GboardShiftDeleteRuntime.remapInput(context, unknown));
        remap(new Event(Action.DOWN, SHIFT_DOWN, null));

        Event delete = new Event(Action.PRESS, DELETE, null);
        assertSame(delete, remap(delete));
    }

    private void enable() {
        assertTrue(GboardPatchesSettings.preferences(context).edit()
                .putBoolean(GboardShiftDeleteSettings.ENABLED, true).commit());
    }

    private Object remap(Event event) {
        return GboardShiftDeleteRuntime.remapInput(context, event);
    }

    private Object remapAfterTouch(Event event, int action) {
        MotionEvent touch = MotionEvent.obtain(0L, 1L, action, 0F, 0F, 0);
        try {
            GboardShiftDeleteRuntime.onTouchEvent(touch);
        } finally {
            touch.recycle();
        }
        return remap(event);
    }

    private enum Action { PRESS, DOWN, UP }
    private enum Intention { KEY }

    private static final class Entry {
        final int d;
        final Intention e;
        final Object f;
        final int g;

        Entry(int code, Intention intention, Object data, int hash) {
            d = code;
            e = intention;
            f = data;
            g = hash;
        }
    }

    private static final class Event {
        Action a;
        Entry[] b;
        Object c = new Object();
        KeyEvent u;
        long timestamp = 1234L;

        Event(Action action, int code, Object data) {
            a = action;
            b = new Entry[] {new Entry(code, Intention.KEY, data, 7)};
        }

        private static Event c(Event source) {
            Event copy = new Event(source.a, 0, null);
            copy.b = source.b.clone();
            copy.c = source.c;
            copy.u = source.u;
            copy.timestamp = source.timestamp;
            return copy;
        }
    }
}
