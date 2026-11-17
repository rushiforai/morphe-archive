package app.hushmessenger.extension;

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/**
 * #181 and #5: a view-once photo closes or gets unsent before you can screenshot it, so the viewer gets a Save button
 * of its own. The button only shows where it can write, it steps out of its own picture, and a copy that fails leaves
 * the button usable.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {29, 36})
public class ViewOnceSaveTest {
    private static final int SECURE = WindowManager.LayoutParams.FLAG_SECURE;
    private ActivityController<Activity> controller;
    private Activity activity;
    private final List<String> written = new ArrayList<>();
    /** Whether the Save button was out of the picture each time the window was copied. */
    private final List<Boolean> hidden = new ArrayList<>();
    private Bitmap taken;

    @Before public void open() {
        taken = Bitmap.createBitmap(4, 4, Bitmap.Config.ARGB_8888);
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        written.clear();
        hidden.clear();
        ViewOnceSave.writes = Runnable::run;
        ViewOnceSave.gallery = (context, name, picture) -> written.add(name);
        ViewOnceSave.shot = (window, got) -> {
            View pill = pill(window);
            hidden.add(pill == null || pill.getVisibility() != View.VISIBLE);
            got.shot(taken);
        };
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
    }

    @After public void close() {
        ViewOnceSave.shot = ViewOnceSave::capture;
        ViewOnceSave.gallery = new ViewOnceSave.SharedPictures();
        controller.close();
    }

    private static View pill(Window window) {
        View decor = window.peekDecorView();
        return decor instanceof ViewGroup ? ((ViewGroup) decor).findViewWithTag(ViewOnceSave.TAG) : null;
    }

    private void on(boolean parent, boolean save) {
        Settings.preferences.edit().putBoolean("allow_screenshot", parent).putBoolean(ViewOnceSave.KEY, save).commit();
    }

    /** The viewer locks its window through the helper Hush already hooks, which is where the button is offered. */
    private View viewerOpens() {
        Window window = activity.getWindow();
        Settings.addScreenshotFlags(window, SECURE);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        return pill(window);
    }

    @Test public void theButtonShowsOnlyWhenBothSwitchesAreOnAndNeverTwice() {
        on(false, false);
        assertNull("no switches, no button", viewerOpens());
        on(true, false);
        assertNull("Allow screenshots alone doesn't add a button", viewerOpens());
        on(false, true);
        assertNull("the button needs Allow screenshots to have anything to save", viewerOpens());

        on(true, true);
        View pill = viewerOpens();
        assertNotNull("both switches on puts the button up", pill);
        assertSame("a second viewer lock doesn't stack a second button", pill, viewerOpens());
    }

    /** A switch left out of SUB_SWITCHES is written to no backup and comes back off on the next phone. */
    @Test public void theSaveSwitchIsBackedUpUnderAllowScreenshots() {
        assertEquals("allow_screenshot", Settings.SUB_SWITCHES.get(ViewOnceSave.KEY));
    }

    /** Android 9 lets no app write to shared pictures without the storage permission, so there's nothing to offer. */
    @Test @Config(sdk = 28) public void android9GetsNoButton() {
        on(true, true);
        assertNull(viewerOpens());
    }

    /** Paused and safe mode hand the viewer back to Messenger, button included. */
    @Test public void pausedAndSafeModeTakeTheButtonAway() {
        on(true, true);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertNull("paused", viewerOpens());

        Settings.preferences.edit().putBoolean("paused", false).putBoolean("safe_mode", true).commit();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertNull("safe mode", viewerOpens());
    }

    @Test public void oneTapWritesWhatIsOnScreenWithTheButtonOutOfThePicture() {
        on(true, true);
        View pill = viewerOpens();
        pill.performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        assertEquals(1, written.size());
        assertTrue("the saved picture is a PNG", written.get(0).endsWith(".png"));
        assertEquals("the button steps out of its own picture", List.of(true), hidden);
        assertEquals("and comes back after", View.VISIBLE, pill.getVisibility());
        assertTrue(pill.isEnabled());
        assertTrue("a saved picture is no hook failure", Settings.hookErrors.isEmpty());
    }

    @Test public void aCopyThatFailsLeavesTheButtonUsableAndWritesNothing() {
        on(true, true);
        ViewOnceSave.shot = (window, got) -> got.shot(null);
        View pill = viewerOpens();
        pill.performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        assertTrue("nothing is written when there's nothing to write", written.isEmpty());
        assertEquals(View.VISIBLE, pill.getVisibility());
        assertTrue("the next tap can try again", pill.isEnabled());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** A gallery that refuses is reported on the switch, not thrown at the viewer. */
    @Test public void aGalleryThatRefusesIsRecordedAgainstTheSwitch() {
        on(true, true);
        ViewOnceSave.gallery = (context, name, picture) -> { throw new java.io.IOException("no room"); };
        View pill = viewerOpens();
        pill.performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        assertTrue(written.isEmpty());
        assertTrue(Settings.hookErrors.containsKey(ViewOnceSave.KEY));
        assertEquals(View.VISIBLE, pill.getVisibility());
    }

    /** The name has to sort by when it was saved and tell two pictures apart. */
    @Test public void theNameCarriesTheDateAndAShortHashOfThePicture() throws Exception {
        Bitmap other = Bitmap.createBitmap(4, 4, Bitmap.Config.ARGB_8888);
        other.eraseColor(0xFF112233);
        String one = ViewOnceSave.hash(taken), two = ViewOnceSave.hash(other);
        assertEquals(ViewOnceSave.HASH_CHARS, one.length());
        assertNotEquals("two pictures don't share a name", one, two);
        assertEquals(one, ViewOnceSave.hash(taken));

        String name = ViewOnceSave.name(one, new Date(1763300000000L));
        assertTrue(name, name.startsWith("View once 20"));
        assertTrue(name, name.endsWith(" " + one + ".png"));
    }
}
