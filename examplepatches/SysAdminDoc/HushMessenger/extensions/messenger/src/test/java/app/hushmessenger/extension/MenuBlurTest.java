package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Dialog;
import android.os.Build;
import android.os.Looper;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.function.Predicate;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;
import static org.junit.Assume.assumeTrue;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MenuBlurTest {
    private final Predicate<Window> stock = MenuBlur.available;
    private final BiConsumer<View, Float> effect = MenuBlur.screenEffect;
    /** Every blur radius put on each screen, 0 for a cleared one. */
    private final Map<View, List<Float>> effects = new HashMap<>();
    private Activity activity;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        Settings.hookErrors.clear();
        MenuBlur.resetForTests();
        MenuBlur.available = window -> true;
        MenuBlur.screenEffect = (screen, radius) -> effects.computeIfAbsent(screen, v -> new ArrayList<>()).add(radius);
        activity = Robolectric.buildActivity(Activity.class).setup().get();
    }

    @After public void restore() {
        MenuBlur.available = stock;
        MenuBlur.screenEffect = effect;
        MenuBlur.resetForTests();
        Settings.hookErrors.clear();
        Settings.hookErrorLogged.clear();
    }

    /** A dialog as a DialogFragment's onStart leaves it: shown, dimming what's behind it, its window attached. */
    private Dialog shown() {
        Dialog dialog = new Dialog(activity);
        dialog.show();
        shadowOf(Looper.getMainLooper()).idle();
        WindowManager.LayoutParams attributes = dialog.getWindow().getAttributes();
        assertTrue("A plain dialog dims what's behind it", (attributes.flags & WindowManager.LayoutParams.FLAG_DIM_BEHIND) != 0);
        assertTrue(attributes.dimAmount > MenuBlur.DIM);
        return dialog;
    }

    private static boolean blurred(Dialog dialog) {
        return (dialog.getWindow().getAttributes().flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND) != 0;
    }

    @Test public void aDimmedMenuBlursWhatsBehindItWhileTheSwitchIsOn() {
        Dialog off = shown();
        float stockDim = off.getWindow().getAttributes().dimAmount;
        MenuBlur.shown(off);
        assertFalse("Off by default", blurred(off));
        assertEquals(stockDim, off.getWindow().getAttributes().dimAmount, 0f);
        assertEquals(0, Settings.lastActive(MenuBlur.KEY));

        Settings.preferences.edit().putBoolean(MenuBlur.KEY, true).commit();
        Dialog on = shown();
        MenuBlur.shown(on);
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            assertFalse("Window blur needs Android 12", blurred(on));
            assertEquals(stockDim, on.getWindow().getAttributes().dimAmount, 0f);
            return;
        }
        WindowManager.LayoutParams attributes = on.getWindow().getAttributes();
        assertTrue(blurred(on));
        float density = activity.getResources().getDisplayMetrics().density;
        assertEquals(Math.round(MenuBlur.RADIUS_DP * density), attributes.getBlurBehindRadius());
        assertEquals("A light dim stays, so the menu stands out", MenuBlur.DIM, attributes.dimAmount, 0f);
        assertTrue("The dim stays on under the blur", (attributes.flags & WindowManager.LayoutParams.FLAG_DIM_BEHIND) != 0);
        assertTrue(Settings.lastActive(MenuBlur.KEY) > 0);
    }

    @Test public void offPauseSafeModeAndAMissingControlLeaveTheWindowAsItWas() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(MenuBlur.KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            Dialog dialog = shown();
            float stockDim = dialog.getWindow().getAttributes().dimAmount;
            MenuBlur.shown(dialog);
            assertFalse(state, blurred(dialog));
            assertEquals(state, stockDim, dialog.getWindow().getAttributes().dimAmount, 0f);
            assertEquals(state, 0, Settings.lastActive(MenuBlur.KEY));
        }
    }

    @Test public void aPhoneThatCantBlurAcrossWindowsBlursMessengersScreenUntilTheMenuCloses() {
        assumeTrue(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);
        Settings.preferences.edit().putBoolean(MenuBlur.KEY, true).commit();
        MenuBlur.available = window -> false;
        View screen = activity.getWindow().getDecorView();
        float radius = Math.round(MenuBlur.RADIUS_DP * activity.getResources().getDisplayMetrics().density);

        Dialog menu = shown();
        MenuBlur.shown(menu);
        assertFalse("The window itself can't blur here", blurred(menu));
        assertEquals("Messenger's screen under the menu blurs", List.of(radius), effects.get(screen));
        assertEquals("A light dim stays, so the menu stands out", MenuBlur.DIM, menu.getWindow().getAttributes().dimAmount, 0f);
        assertTrue(Settings.lastActive(MenuBlur.KEY) > 0);

        MenuBlur.shown(menu);
        Dialog sheet = shown();
        MenuBlur.shown(sheet);
        assertEquals("The same menu shown again and a second one over it blur the screen once", List.of(radius), effects.get(screen));
        assertEquals(Integer.valueOf(2), MenuBlur.blurredScreens.get(screen));

        sheet.dismiss();
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals("The first menu still holds the blur", List.of(radius), effects.get(screen));
        menu.dismiss();
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals("The last menu to close clears it", List.of(radius, 0f), effects.get(screen));
        assertTrue(MenuBlur.blurredScreens.isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aMenuWithNoMessengerScreenUnderItKeepsMessengersDim() {
        assumeTrue(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);
        Settings.preferences.edit().putBoolean(MenuBlur.KEY, true).commit();
        MenuBlur.available = window -> false;
        Dialog overlay = new Dialog(RuntimeEnvironment.getApplication());
        overlay.getWindow().setType(WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY);
        overlay.show();
        shadowOf(Looper.getMainLooper()).idle();
        float stockDim = overlay.getWindow().getAttributes().dimAmount;
        MenuBlur.shown(overlay);
        assertTrue("Nothing of Messenger's to blur", effects.isEmpty());
        assertEquals(stockDim, overlay.getWindow().getAttributes().dimAmount, 0f);
        overlay.dismiss();
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theRealScreenBlurGoesOnAndComesOff() {
        Settings.preferences.edit().putBoolean(MenuBlur.KEY, true).commit();
        MenuBlur.available = window -> false;
        MenuBlur.screenEffect = effect;
        Dialog menu = shown();
        MenuBlur.shown(menu);
        assertEquals(Integer.valueOf(1), MenuBlur.blurredScreens.get(activity.getWindow().getDecorView()));
        menu.dismiss();
        shadowOf(Looper.getMainLooper()).idle();
        assertTrue(MenuBlur.blurredScreens.isEmpty());
        assertTrue("Neither the blur nor clearing it failed", Settings.hookErrors.isEmpty());
    }

    @Test public void aWindowThatDoesntDimIsLeftAlone() {
        Settings.preferences.edit().putBoolean(MenuBlur.KEY, true).commit();
        Dialog clear = shown();
        clear.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        MenuBlur.shown(clear);
        assertFalse("A dropdown or a toast-like sheet never dimmed the screen", blurred(clear));

        Dialog undimmed = shown();
        undimmed.getWindow().setDimAmount(0f);
        MenuBlur.shown(undimmed);
        assertFalse(blurred(undimmed));

        Dialog dismissed = shown();
        dismissed.dismiss();
        MenuBlur.shown(dismissed);
        assertFalse("A dialog closed before it got here stays as it was", blurred(dismissed));
        MenuBlur.shown(null);
    }

    @Test public void aFailureIsLoggedAndTheMenuStillOpens() {
        Settings.preferences.edit().putBoolean(MenuBlur.KEY, true).commit();
        MenuBlur.available = window -> { throw new IllegalStateException("no window manager"); };
        Dialog dialog = shown();
        MenuBlur.shown(dialog);
        assertTrue(dialog.isShowing());
        assertFalse(blurred(dialog));
        assertEquals("Older Android never asks", Build.VERSION.SDK_INT >= Build.VERSION_CODES.S,
            Settings.hookErrors.containsKey(MenuBlur.KEY));
    }

    @Test public void theSwitchSitsUnderThemeStartsOffAndIsExperimental() {
        assertTrue(Settings.installed.contains(MenuBlur.KEY));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals(MenuBlur.KEY)).findFirst().orElseThrow();
        assertEquals("Blur behind menus", row[1]);
        assertEquals("theme", row[3]);
        assertTrue(SettingsActivity.EXPERIMENTAL.contains(MenuBlur.KEY));
        assertFalse(Settings.preferences.contains(MenuBlur.KEY));
        assertFalse(Settings.wouldUse(MenuBlur.KEY));
    }
}
