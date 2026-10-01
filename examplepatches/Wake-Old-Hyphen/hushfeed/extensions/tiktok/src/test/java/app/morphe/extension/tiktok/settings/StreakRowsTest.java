package app.morphe.extension.tiktok.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.SettingsRegistryRule;
import app.morphe.extension.tiktok.settings.preference.ClockTimePreference;
import app.morphe.extension.tiktok.settings.preference.InputTextPreference;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** The Streak rows' summaries, which the phone showed with a line too many and a line too few. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class StreakRowsTest {
    private static final String OFF_NOTE = "\nTurn on Keep a streak going first.";

    @Rule public final SettingsRegistryRule settingsRegistry = new SettingsRegistryRule();

    private Context context;

    @Before
    public void installContext() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
    }

    @After
    public void restoreContext() {
        Utils.setContext(RuntimeEnvironment.getApplication());
    }

    @Test
    public void theTimeRowLeavesOutTheRangeItsPickerCannotLeave() {
        ClockTimePreference row = new ClockTimePreference(context, "When to send",
                "The time of day the message goes out.", Settings.AUTO_STREAK_MINUTE);
        String[] lines = row.getSummary().toString().split("\n");
        assertEquals(2, lines.length);
        assertEquals("The time of day the message goes out.", lines[0]);
        assertTrue(lines[1], lines[1].startsWith("Current: "));
    }

    @Test
    public void aRowWithANoteKeepsTheLineThePageAddedWhenItRebuilds() {
        InputTextPreference row = new InputTextPreference(context, "Who to message",
                "Their username, like @name.", Settings.AUTO_STREAK_RECIPIENT)
                .withNote(value -> value.isEmpty() ? null : "Found Matt in your chats.");
        // The page adds its line after the row's own, as it does while the switch is off.
        row.setSummary(row.getSummary() + OFF_NOTE);

        // A rebuild, the same one a draw makes for a row with a note.
        row.setText("@someone");
        String summary = row.getSummary().toString();
        assertTrue(summary, summary.endsWith("Current: @someone\nFound Matt in your chats." + OFF_NOTE));

        // Once the page takes its line back off, a rebuild doesn't bring it back.
        row.setSummary(summary.substring(0, summary.length() - OFF_NOTE.length()));
        row.setText("@other");
        assertFalse(row.getSummary().toString().contains("Turn on"));
    }
}
