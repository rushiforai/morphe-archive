package app.hushmessenger.extension;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
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
public class LogOutTest {
    private static final String OWNER = "Lapp/hushmessenger/extension/LogOutTest$Launcher;->";
    private static final String CALL = "(Landroid/content/Context;)V";

    /** Stands in for Messenger's account switcher Log out and the shapes the route must not accept. */
    public static final class Launcher {
        static Context started;
        static void open(Context context) { started = context; }
        static void broken(Context context) { throw new IllegalStateException("Messenger refused"); }
        void instance(Context context) { started = context; }
        static boolean answers(Context context) { started = context; return true; }
    }

    @Before public void reset() {
        Launcher.started = null;
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
    }

    @Test public void theRouteStartsMessengersOwnLogOutFromTheGivenScreen() {
        Context context = RuntimeEnvironment.getApplication();
        assertNotNull(LogOut.route(OWNER + "open" + CALL, LogOut.class.getClassLoader()));
        assertTrue(LogOut.start(context, OWNER + "open" + CALL));
        assertSame(context, Launcher.started);
    }

    @Test public void aRouteThatDoesntNameAStaticLauncherStartsNothing() {
        Context context = RuntimeEnvironment.getApplication();
        for (String route : new String[] {null, "", OWNER + "open()V", OWNER + "missing" + CALL, OWNER + "instance" + CALL,
                "Lapp/hushmessenger/extension/Gone;->open" + CALL, OWNER + CALL, "app/hushmessenger/extension/LogOutTest$Launcher;->open" + CALL,
                OWNER.replace(";->", ";") + "open" + CALL}) {
            assertNull(route, LogOut.route(route, LogOut.class.getClassLoader()));
            assertFalse(route, LogOut.start(context, route));
        }
        assertNull(LogOut.route(OWNER + "answers(Landroid/content/Context;)Z", LogOut.class.getClassLoader()));
        assertNull(Launcher.started);
        // Messenger throwing is a failed start, not a crash in settings.
        assertFalse(LogOut.start(context, OWNER + "broken" + CALL));
    }

    @Test public void anUnpatchedInstallShowsLogOutAsUnavailable() {
        assertEquals("", HostScreens.logoutRoute());
        assertFalse(LogOut.available());
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            View row = root.findViewWithTag("log_out");
            assertFalse(row.isEnabled());
            assertFalse(row.isClickable());
            assertEquals("Log out. Messenger's Log out wasn't found in this build, so use the one in Messenger's menu.",
                row.getContentDescription().toString());
            row.performClick();
            assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
            assertFalse(screen.get().isFinishing());
            // Below how the controls work and above Source and licenses, away from Restart at the top.
            ViewGroup page = (ViewGroup) row.getParent();
            assertSame(page, root.findViewWithTag("source_licenses").getParent());
            assertEquals(page.indexOfChild(root.findViewWithTag("source_licenses")) - 1, page.indexOfChild(row));
        }
    }
}
