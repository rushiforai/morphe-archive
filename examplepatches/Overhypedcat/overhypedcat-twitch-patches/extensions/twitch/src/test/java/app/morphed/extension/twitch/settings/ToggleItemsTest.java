package app.morphed.extension.twitch.settings;

import android.text.SpannableString;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

public class ToggleItemsTest {
    enum Key { PopOut }

    /** Shaped like Twitch's obfuscated on/off row. */
    static final class FakeToggle {
        final String title;
        final String description;
        final boolean checked;
        final Key key;

        FakeToggle(String title, String description, SpannableString extra, boolean checked, boolean enabled, Key key, int mask) {
            this.title = title;
            this.description = description;
            this.checked = checked;
            this.key = key;
        }
    }

    static final class FakeDropdown {
        FakeDropdown(String title) {
        }
    }

    static class FakeScreenBase {
        final List<Object> rows = new ArrayList<>();
    }

    static final class FakeScreen extends FakeScreenBase {
        final List<Object> empty = new ArrayList<>();
        final StringBuilder context = new StringBuilder("activity");
    }

    @Test
    public void findsRowsInSuperclassField() {
        FakeScreen screen = new FakeScreen();
        screen.rows.add(new FakeDropdown("Theme"));
        screen.rows.add(new FakeToggle("Popout", null, null, false, true, Key.PopOut, 0));

        assertSame(screen.rows, ToggleItems.rowsOf(screen));
    }

    @Test
    public void addsToggleOfTheSameClassWithoutKey() {
        List<Object> rows = new ArrayList<>();
        rows.add(new FakeDropdown("Theme"));
        rows.add(new FakeToggle("Popout", null, null, false, true, Key.PopOut, 0));

        Object added = ToggleItems.addToggle(rows, "Detailed log", "Saved to Downloads", true);

        assertEquals(3, rows.size());
        assertSame(added, rows.get(2));
        FakeToggle toggle = (FakeToggle) added;
        assertEquals("Detailed log", toggle.title);
        assertEquals("Saved to Downloads", toggle.description);
        assertTrue(toggle.checked);
        assertNull(toggle.key);
    }

    @Test
    public void noToggleClassMeansNothingIsAdded() {
        List<Object> rows = new ArrayList<>();
        rows.add(new FakeDropdown("Theme"));

        assertNull(ToggleItems.addToggle(rows, "Detailed log", "", false));
        assertEquals(1, rows.size());
        assertNull(ToggleItems.rowsOf(new Object()));
    }

    @Test
    public void findsFieldByType() {
        FakeScreen screen = new FakeScreen();
        assertSame(screen.context, ToggleItems.fieldOfType(screen, StringBuilder.class));
    }
}
