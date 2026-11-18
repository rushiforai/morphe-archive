package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.util.Locale;

import org.junit.After;
import org.junit.Test;

/** A category's reset row says how many of its items it would put back. */
public class ResetSummaryTest {
    private final Locale before = Locale.getDefault();

    @After
    public void restore() {
        Locale.setDefault(before);
    }

    @Test
    public void countsTheChangedItems() {
        Locale.setDefault(Locale.JAPANESE);
        assertEquals("初期値と違う項目が 3 件あります", SettingsScreen.changedSummary(3));
        Locale.setDefault(Locale.ENGLISH);
        assertEquals("3 settings differ from their defaults", SettingsScreen.changedSummary(3));
        assertEquals("1 setting differs from its default", SettingsScreen.changedSummary(1));
    }

    @Test
    public void saysNothingRightAfterAReset() {
        assertNull(SettingsScreen.changedSummary(0));
    }
}
