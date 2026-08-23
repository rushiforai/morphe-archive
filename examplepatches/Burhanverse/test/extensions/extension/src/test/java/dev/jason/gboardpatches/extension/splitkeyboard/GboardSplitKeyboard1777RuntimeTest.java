package dev.jason.gboardpatches.extension.splitkeyboard;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

@RunWith(RobolectricTestRunner.class)
public final class GboardSplitKeyboard1777RuntimeTest {
    private SharedPreferences preferences;

    @Before
    public void setUp() {
        Context context = RuntimeEnvironment.getApplication();
        preferences = context.getSharedPreferences(
                GboardPatchesSettings.PREF_FILE,
                Context.MODE_PRIVATE);
        preferences.edit().clear().commit();
        GboardSplitKeyboardSettings.ensureDefault(preferences);
    }

    @Test
    public void lifecycleUsesStockEligibilityAndNonPersistingModeSwitch() {
        FakeModeController controller = new FakeModeController();
        controller.stockEligible = true;
        controller.currentMode = 1;
        GboardSplitKeyboardSettings.writeAutoSplitEnabled(preferences, true);

        GboardSplitKeyboard1777Runtime.afterModeEnvironmentChanged(controller);

        Assert.assertEquals(1, controller.switchCalls);
        Assert.assertEquals(GboardSplitKeyboard1777Policy.SPLIT_KEYBOARD_MODE,
                controller.requestedMode);
        Assert.assertFalse(controller.persistRequested);
    }

    @Test
    public void lifecycleDoesNothingWhenAutoSplitIsOffOrModeIsAlreadySplit() {
        FakeModeController controller = new FakeModeController();
        controller.stockEligible = true;
        controller.currentMode = 1;

        GboardSplitKeyboard1777Runtime.afterModeEnvironmentChanged(controller);
        Assert.assertEquals(0, controller.switchCalls);

        GboardSplitKeyboardSettings.writeAutoSplitEnabled(preferences, true);
        controller.currentMode = GboardSplitKeyboard1777Policy.SPLIT_KEYBOARD_MODE;
        GboardSplitKeyboard1777Runtime.afterModeEnvironmentChanged(controller);
        Assert.assertEquals(0, controller.switchCalls);
    }

    @Test
    public void splitActionUsesStockRestoreOnlyWhenMasterIsOnAndAlreadySplit() {
        FakeModeController controller = new FakeModeController();
        controller.currentMode = GboardSplitKeyboard1777Policy.SPLIT_KEYBOARD_MODE;

        Assert.assertTrue(GboardSplitKeyboard1777Runtime.interceptSplitAction(controller));
        Assert.assertEquals(1, controller.restoreCalls);

        GboardSplitKeyboardSettings.writeEnabled(preferences, false);
        Assert.assertFalse(GboardSplitKeyboard1777Runtime.interceptSplitAction(controller));
        Assert.assertEquals(1, controller.restoreCalls);
    }

    private static final class FakeModeController {
        boolean stockEligible;
        int currentMode;
        int switchCalls;
        int restoreCalls;
        int requestedMode = -1;
        boolean persistRequested = true;

        @SuppressWarnings("unused")
        private boolean at() {
            return stockEligible;
        }

        @SuppressWarnings("unused")
        public int F() {
            return currentMode;
        }

        @SuppressWarnings("unused")
        public boolean ad(int mode, boolean persist) {
            switchCalls++;
            requestedMode = mode;
            persistRequested = persist;
            currentMode = mode;
            return true;
        }

        @SuppressWarnings("unused")
        public void N() {
            restoreCalls++;
            currentMode = 1;
        }
    }
}
