/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;

import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.Utils;

/** The HushGram settings row on Instagram's Settings and activity screen. */
@RunWith(RobolectricTestRunner.class)
public class SettingsScreenRowTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Instagram 449's settings screens, by the names its enum keeps; the constants are renamed. */
    enum Screen { MAIN_SETTINGS_SCREEN, NOTIFICATIONS }

    @After
    public void tearDown() throws Exception {
        SettingsEntry.onClosedByUser();
        Utils.awaitBackgroundTasksForTests();
    }

    @Test
    public void theTopScreenGetsTheRowAboveIt() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        View screen = new FrameLayout(activity);

        View shown = SettingsEntry.withSettingsRow(arguments(Screen.MAIN_SETTINGS_SCREEN), screen);

        assertTrue("no column around the screen", shown instanceof LinearLayout);
        ViewGroup column = (ViewGroup) shown;
        assertEquals(3, column.getChildCount());
        View row = column.getChildAt(0);
        assertEquals(SettingsScreenRow.TAG, row.getTag());
        assertTrue("the row doesn't take taps", row.isClickable());
        assertEquals("HushGram settings", ((TextView) ((ViewGroup) row).getChildAt(1)).getText().toString());
        assertSame("Instagram's screen isn't last", screen, column.getChildAt(2));
        assertEquals("Instagram's screen doesn't fill what's left", 1f,
                ((LinearLayout.LayoutParams) screen.getLayoutParams()).weight, 0f);
    }

    @Test
    public void everyOtherScreenStaysAsItCame() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        View screen = new FrameLayout(activity);

        assertSame(screen, SettingsEntry.withSettingsRow(arguments(Screen.NOTIFICATIONS), screen));
        assertSame(screen, SettingsEntry.withSettingsRow(new Bundle(), screen));
        assertSame(screen, SettingsEntry.withSettingsRow(null, screen));
        Bundle named = new Bundle();
        named.putString(SettingsScreenRow.SCREEN_ID, "MAIN_SETTINGS_SCREEN");
        assertSame("a string isn't the screen's enum", screen, SettingsEntry.withSettingsRow(named, screen));
        FrameLayout parent = new FrameLayout(activity);
        parent.addView(screen);
        assertSame("a view in a layout was moved", screen,
                SettingsEntry.withSettingsRow(arguments(Screen.MAIN_SETTINGS_SCREEN), screen));
    }

    @Test
    @SuppressWarnings("deprecation") // Framework fragments, as the entry uses.
    public void aTapOpensHushGramSettings() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        ViewGroup column = (ViewGroup) SettingsEntry.withSettingsRow(
                arguments(Screen.MAIN_SETTINGS_SCREEN), new FrameLayout(activity));

        column.getChildAt(0).performClick();
        shadowOf(Looper.getMainLooper()).idle();
        activity.getFragmentManager().executePendingTransactions();

        assertNotNull("the tap opened nothing", activity.getFragmentManager().findFragmentByTag(SettingsEntry.DIALOG_TAG));
    }

    private static Bundle arguments(Screen screen) {
        Bundle arguments = new Bundle();
        arguments.putSerializable(SettingsScreenRow.SCREEN_ID, screen);
        arguments.putSerializable("new_settings_session", Boolean.TRUE);
        return arguments;
    }
}
