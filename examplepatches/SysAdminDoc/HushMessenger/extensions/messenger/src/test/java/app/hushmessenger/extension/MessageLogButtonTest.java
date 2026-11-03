package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MessageLogButtonTest {
    private static final Object OURS = "clock";
    private static final Object FACEBOOK = "facebook";
    private static final Object COMPOSE = "compose";
    /** Stands in for the reader the patch writes: only Messenger's new message button has its id here. */
    private static final Function<Object, String> IDS = button -> button == COMPOSE ? MessageLogButton.COMPOSER : null;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
    }

    private static List<Object> placed(Object... held) {
        List<Object> buttons = new ArrayList<>(Arrays.asList(held));
        MessageLogButton.place(buttons, OURS, IDS);
        return buttons;
    }

    @Test public void theClockGoesRightInFrontOfTheNewMessageButtonOrItsPadding() {
        assertEquals(Arrays.asList(FACEBOOK, OURS, COMPOSE, null), placed(FACEBOOK, COMPOSE, null));
        // With the new message button off, the bar pads its end with nulls, and the clock takes the first one's place.
        assertEquals(Arrays.asList(FACEBOOK, OURS, null, null), placed(FACEBOOK, null, null));
        assertEquals(Arrays.asList(FACEBOOK, OURS), placed(FACEBOOK));
        assertEquals(Arrays.asList(OURS, COMPOSE), placed(COMPOSE));
    }

    @Test public void itShowsOnlyWhileTheLogAndItsButtonAreBothOn() {
        assertFalse(MessageLogButton.shown());
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
        assertFalse("the log alone keeps the bar as Messenger has it", MessageLogButton.shown());
        Settings.preferences.edit().putBoolean(MessageLogButton.KEY, true).commit();
        assertTrue(MessageLogButton.shown());
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(MessageLogButton.shown());
        Settings.preferences.edit().putBoolean("paused", false).putBoolean(MessageLog.KEY, false).commit();
        assertFalse(MessageLogButton.shown());

        // Off, the bar's list goes back untouched.
        List<Object> buttons = new ArrayList<>(Arrays.asList(FACEBOOK, COMPOSE));
        MessageLogButton.add(buttons, RuntimeEnvironment.getApplication(), new Object());
        assertEquals(Arrays.asList(FACEBOOK, COMPOSE), buttons);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aTapOnTheClockOpensTheLogAndMessengersOwnButtonsStayItsOwn() {
        Activity inbox = Robolectric.buildActivity(Activity.class).setup().get();
        View view = new View(inbox);
        assertFalse(MessageLogButton.clicked(view, MessageLogButton.COMPOSER));
        assertFalse(MessageLogButton.clicked(view, null));
        assertNull(Shadows.shadowOf(inbox).getNextStartedActivity());

        assertTrue(MessageLogButton.clicked(view, MessageLogButton.ID));
        Intent started = Shadows.shadowOf(inbox).getNextStartedActivity();
        assertNotNull(started);
        assertEquals(HostScreens.intentFor(inbox, HostScreens.SETTINGS).getComponent(), started.getComponent());
        assertTrue(started.getBooleanExtra(MessageLogSheet.OPEN_EXTRA, false));
    }
}
