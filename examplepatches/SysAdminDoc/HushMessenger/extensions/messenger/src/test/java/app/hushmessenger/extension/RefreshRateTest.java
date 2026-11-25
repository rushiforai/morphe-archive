package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.view.Display;
import java.lang.reflect.Constructor;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDisplay;
import org.robolectric.shadows.ShadowDisplayManager;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class RefreshRateTest {
    private Activity activity;

    @Before public void setUp() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        // The screen's own mode at 60 Hz, its size at 90 and 120 Hz too, and a smaller size at 144 Hz that's never asked for.
        Display.Mode base = ShadowDisplay.getDefaultDisplay().getMode();
        // A phone numbers its modes from 1, since 0 asks for no mode at all. Robolectric's own screen mode is 0.
        int id = base.getModeId() + 1, width = base.getPhysicalWidth(), height = base.getPhysicalHeight();
        Display.Mode[] modes = {mode(id, width, height, 60f), mode(id + 1, width, height, 90f), mode(id + 2, width, height, 120f),
            mode(id + 3, width / 2, height / 2, 144f)};
        // The screen goes onto the 60 Hz mode with them, since Android refuses a current mode it can't find in the list.
        java.util.function.Consumer<org.robolectric.android.internal.DisplayConfig> onSixty = config -> {
            config.supportedModes = modes;
            config.modeId = id;
            config.defaultModeId = id;
        };
        org.robolectric.util.ReflectionHelpers.callStaticMethod(ShadowDisplayManager.class, "changeDisplay",
            org.robolectric.util.ReflectionHelpers.ClassParameter.from(int.class, Display.DEFAULT_DISPLAY),
            org.robolectric.util.ReflectionHelpers.ClassParameter.from(java.util.function.Consumer.class, onSixty));
        // Android 15 and 16 hand apps a list of their own, which only this fills there (older ones get the same list again).
        ShadowDisplayManager.setSupportedModes(Display.DEFAULT_DISPLAY, modes);
        activity = Robolectric.buildActivity(Activity.class).setup().get();
    }

    @After public void tidy() {
        Settings.preferences.edit().clear().commit();
    }

    /** Display.Mode's constructor is hidden, so the test builds the modes the way the platform does. */
    private static Display.Mode mode(int id, int width, int height, float rate) throws Exception {
        Constructor<Display.Mode> make = Display.Mode.class.getDeclaredConstructor(int.class, int.class, int.class, float.class);
        make.setAccessible(true);
        return make.newInstance(id, width, height, rate);
    }

    private int asked() {
        return activity.getWindow().getAttributes().preferredDisplayModeId;
    }

    private Display display() {
        return RefreshRate.display(activity);
    }

    @Test public void offLeavesTheRateToAndroid() {
        RefreshRate.resumed(activity);
        assertEquals(0, asked());
    }

    @Test public void onAsksForTheFastestUntilARateIsPicked() {
        Settings.preferences.edit().putBoolean(RefreshRate.KEY, true).commit();
        RefreshRate.resumed(activity);
        int fastest = RefreshRate.modeFor(display().getMode(), display().getSupportedModes(), 0).getModeId();
        assertEquals(fastest, asked());
        assertEquals(120f, modeById(fastest).getRefreshRate(), 0.01f);
    }

    @Test public void aPickedRateIsAskedForAsTheScreenComesBack() {
        Settings.preferences.edit().putBoolean(RefreshRate.KEY, true).putInt(RefreshRate.RATE, 60).commit();
        RefreshRate.resumed(activity);
        assertEquals(60f, modeById(asked()).getRefreshRate(), 0.01f);
        Settings.preferences.edit().putInt(RefreshRate.RATE, 90).commit();
        RefreshRate.resumed(activity);
        assertEquals(90f, modeById(asked()).getRefreshRate(), 0.01f);
    }

    @Test public void turningItOffGivesBackOnlyTheModeItAskedFor() {
        Settings.preferences.edit().putBoolean(RefreshRate.KEY, true).putInt(RefreshRate.RATE, 60).commit();
        RefreshRate.resumed(activity);
        assertNotEquals(0, asked());
        Settings.preferences.edit().putBoolean(RefreshRate.KEY, false).commit();
        RefreshRate.resumed(activity);
        assertEquals(0, asked());
        // A mode Messenger set itself stays.
        android.view.WindowManager.LayoutParams attributes = activity.getWindow().getAttributes();
        attributes.preferredDisplayModeId = 2;
        activity.getWindow().setAttributes(attributes);
        RefreshRate.resumed(activity);
        assertEquals(2, asked());
    }

    @Test public void pausingHushGivesTheRateBack() {
        Settings.preferences.edit().putBoolean(RefreshRate.KEY, true).putInt(RefreshRate.RATE, 60).commit();
        RefreshRate.resumed(activity);
        assertNotEquals(0, asked());
        Settings.preferences.edit().putBoolean("paused", true).commit();
        RefreshRate.resumed(activity);
        assertEquals(0, asked());
    }

    @Test public void onlyRatesAtTheScreensOwnSizeAreOffered() {
        assertEquals(List.of(60, 90, 120), RefreshRate.rates(display()));
        Display.Mode current = display().getMode();
        Display.Mode[] modes = display().getSupportedModes();
        // A rate this screen doesn't do, carried over from another phone, gets the nearest one; a tie goes faster.
        assertEquals(120f, RefreshRate.modeFor(current, modes, 144).getRefreshRate(), 0.01f);
        assertEquals(90f, RefreshRate.modeFor(current, modes, 75).getRefreshRate(), 0.01f);
        assertEquals(60f, RefreshRate.modeFor(current, modes, 30).getRefreshRate(), 0.01f);
        assertNull(RefreshRate.modeFor(current, new Display.Mode[0], 60));
    }

    private Display.Mode modeById(int id) {
        for (Display.Mode mode : display().getSupportedModes()) if (mode.getModeId() == id) return mode;
        throw new AssertionError("no mode " + id);
    }
}
