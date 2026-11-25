package app.hushmessenger.extension;

import android.text.InputFilter;
import android.text.Spanned;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class NoteLimitTest {
    private static final String KEY = "longer_notes";
    private static final int STOCK = 60;

    /** Shaped like Messenger's note filter: one int among fields of other types. */
    private static class NoteFilter implements InputFilter {
        static int shared = 9;
        final List<Object> pieces = new ArrayList<>();
        final Pattern lines = Pattern.compile("\n");
        int max;

        NoteFilter(int max) {
            this.max = max;
        }

        @Override public CharSequence filter(CharSequence source, int start, int end, Spanned dest, int dstart, int dend) {
            return null;
        }
    }

    private static final class TwoNumbers extends NoteFilter {
        int first = STOCK;
        int second = STOCK;

        TwoNumbers() {
            super(STOCK);
        }
    }

    private static void turnOn() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
    }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        Settings.hookErrorLogged.clear();
        CrashGuard.resetForTests();
    }

    @Test public void withTheSwitchOffTheNoteKeepsMessengersLimit() {
        NoteFilter filter = new NoteFilter(STOCK);
        assertEquals(STOCK, NoteLimit.raise(filter, STOCK));
        assertEquals(STOCK, filter.max);
        assertEquals(0, Settings.lastActive(KEY));
    }

    @Test public void withTheSwitchOnTheComposerAndTheFilterRiseTogether() {
        turnOn();
        NoteFilter filter = new NoteFilter(STOCK);
        assertEquals(NoteLimit.LIMIT, NoteLimit.raise(filter, STOCK));
        assertEquals(NoteLimit.LIMIT, filter.max);
        assertEquals("The static int is not the limit", 9, NoteFilter.shared);
        assertTrue(Settings.lastActive(KEY) > 0);
    }

    @Test public void theScreenUpdatingAgainChangesNothing() {
        turnOn();
        NoteFilter filter = new NoteFilter(STOCK);
        NoteLimit.raise(filter, STOCK);
        assertEquals(NoteLimit.LIMIT, NoteLimit.raise(filter, STOCK));
        assertEquals(NoteLimit.LIMIT, filter.max);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aHigherLimitFromMessengerIsKept() {
        turnOn();
        int higher = NoteLimit.LIMIT + 100;
        NoteFilter filter = new NoteFilter(higher);
        assertEquals(higher, NoteLimit.raise(filter, higher));
        assertEquals(higher, filter.max);
    }

    @Test public void switchingOffPutsAnOpenNoteBackToMessengersLimit() {
        turnOn();
        NoteFilter filter = new NoteFilter(STOCK);
        NoteLimit.raise(filter, STOCK);
        Settings.preferences.edit().putBoolean(KEY, false).commit();
        assertEquals(STOCK, NoteLimit.raise(filter, STOCK));
        assertEquals(STOCK, filter.max);
    }

    @Test public void aFilterWithoutOneClearLimitKeepsBothNumbers() {
        turnOn();
        TwoNumbers filter = new TwoNumbers();
        assertEquals(STOCK, NoteLimit.raise(filter, STOCK));
        assertEquals(STOCK, filter.first);
        assertEquals(STOCK, filter.second);
        assertTrue(Settings.hookErrors.containsKey(KEY));
    }

    @Test public void aNumberThatIsNotTheLimitIsLeftAlone() {
        turnOn();
        NoteFilter filter = new NoteFilter(7);
        assertEquals(STOCK, NoteLimit.raise(filter, STOCK));
        assertEquals(7, filter.max);
        assertTrue(Settings.hookErrors.containsKey(KEY));
    }

    @Test public void aMissingFilterFallsBackToMessengersLimit() {
        turnOn();
        assertEquals(STOCK, NoteLimit.raise(null, STOCK));
        assertTrue(Settings.hookErrors.containsKey(KEY));
    }

    @Test public void pauseSafeModeAndAMissingControlKeepMessengersLimit() {
        for (String state : new String[] {"paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(KEY, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            NoteFilter filter = new NoteFilter(STOCK);
            assertEquals(state, STOCK, NoteLimit.raise(filter, STOCK));
            assertEquals(state, STOCK, filter.max);
            assertEquals(state, 0, Settings.lastActive(KEY));
        }
    }
}
