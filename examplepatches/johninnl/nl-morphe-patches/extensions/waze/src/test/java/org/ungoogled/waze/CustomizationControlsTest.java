package org.ungoogled.waze;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE)
public class CustomizationControlsTest {
    private static final String ZOOM = "CONFIG_VALUE_ROUTING_AUTO_ZOOM";
    private static final String DISTANCE = "CONFIG_VALUE_ALERTS_SPEED_LIMIT_DECREASE_ALERT_DISTANCE_METERS";
    private Activity activity;
    private SharedPreferences prefs;

    @Before public void setup() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        prefs = app.getSharedPreferences("ungoogled_waze", Context.MODE_PRIVATE);
        prefs.edit().clear().commit();
        Field appField = Customization.class.getDeclaredField("app");
        appField.setAccessible(true);
        appField.set(null, app);
        for (String name : new String[]{"declared", "values"}) {
            Field f = Customization.class.getDeclaredField(name);
            f.setAccessible(true);
            Object value = f.get(null);
            if (value instanceof Set) ((Set<?>) value).clear();
            else ((Map<?, ?>) value).clear();
        }
        activity = Robolectric.buildActivity(Activity.class).setup().get();
    }

    private <T extends View> T find(View view, Class<T> type, String text) {
        if (type.isInstance(view) && (text == null || view instanceof TextView
                && text.contentEquals(((TextView) view).getText()))) return type.cast(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                T found = find(group.getChildAt(i), type, text);
                if (found != null) return found;
            }
        }
        return null;
    }

    private void clickValue(Dialog panel, String title) {
        TextView label = find(panel.getWindow().getDecorView(), TextView.class, title);
        assertNotNull("Missing editable control: " + title, label);
        ((View) label.getParent().getParent()).performClick();
    }

    private void press(AlertDialog editor, int button) {
        editor.getButton(button).performClick();
        shadowOf(Looper.getMainLooper()).idle();
    }

    @Test public void autoZoomChoicePersistsAndResetRestoresPatchDefault() {
        Customization.feature("autoZoom");
        Customization.valueString("autoZoom", ZOOM, "speed");
        Customization.show(activity);
        Dialog panel = ShadowDialog.getLatestDialog();
        clickValue(panel, "Auto-zoom mode");
        AlertDialog editor = (AlertDialog) ShadowDialog.getLatestDialog();
        assertEquals(3, editor.getListView().getCount());
        editor.getListView().performItemClick(null, 0, 0);
        assertEquals("no", prefs.getString("value:" + ZOOM, null));
        clickValue(panel, "Auto-zoom mode");
        editor = (AlertDialog) ShadowDialog.getLatestDialog();
        press(editor, AlertDialog.BUTTON_NEUTRAL);
        assertFalse(prefs.contains("value:" + ZOOM));
        assertNotNull(find(panel.getWindow().getDecorView(), TextView.class, "By speed"));
    }

    @Test public void compassAndTollSwitchesRemainIndependentAcrossReopening() {
        Customization.feature("alwaysCompass");
        Customization.feature("tollPrices");
        Customization.show(activity);
        Dialog panel = ShadowDialog.getLatestDialog();
        TextView compass = find(panel.getWindow().getDecorView(), TextView.class, "Always show compass");
        assertNotNull(compass);
        ((View) compass.getParent().getParent()).performClick();
        assertFalse(Customization.on("alwaysCompass"));
        assertTrue(Customization.on("tollPrices"));
        panel.dismiss();
        Customization.show(activity);
        panel = ShadowDialog.getLatestDialog();
        compass = find(panel.getWindow().getDecorView(), TextView.class, "Always show compass");
        assertFalse(find((View) compass.getParent().getParent(), Switch.class, null).isChecked());
        TextView tolls = find(panel.getWindow().getDecorView(), TextView.class, "Toll prices");
        assertTrue(find((View) tolls.getParent().getParent(), Switch.class, null).isChecked());
    }

    @Test public void alwaysCompassOverridesOnlyCompassVisibilityAndOffPreservesStockDecision() {
        // The stock decision is false when Waze's controls are configured to appear on tap.
        assertEquals(Boolean.TRUE, Customization.compassVisibility(Boolean.FALSE));
        assertEquals(Boolean.TRUE, Customization.compassVisibility(Boolean.TRUE));
        prefs.edit().putBoolean("alwaysCompass", false).commit();
        assertEquals(Boolean.FALSE, Customization.compassVisibility(Boolean.FALSE));
        assertEquals(Boolean.TRUE, Customization.compassVisibility(Boolean.TRUE));
    }

    @Test public void limitDropDistanceCanBeEditedAndResetWithoutChangingSignVisibility() {
        Customization.feature("alwaysSpeedLimit");
        Customization.feature("speedLimitDrop");
        Customization.valueInt("speedLimitDrop", DISTANCE, 1000);
        Customization.show(activity);
        Dialog panel = ShadowDialog.getLatestDialog();
        clickValue(panel, "Limit-drop warning distance");
        AlertDialog editor = (AlertDialog) ShadowDialog.getLatestDialog();
        find(editor.getWindow().getDecorView(), EditText.class, null).setText("350");
        press(editor, AlertDialog.BUTTON_POSITIVE);
        assertEquals(350, Customization.number(DISTANCE, -1));
        assertTrue(Customization.on("alwaysSpeedLimit"));
        clickValue(panel, "Limit-drop warning distance");
        editor = (AlertDialog) ShadowDialog.getLatestDialog();
        press(editor, AlertDialog.BUTTON_NEUTRAL);
        assertFalse(prefs.contains("value:" + DISTANCE));
        assertEquals(1000, Customization.number(DISTANCE, -1));
    }

    @Test public void limitDropEditorRejectsDistancesOutsideTheSupportedRange() {
        Customization.feature("speedLimitDrop");
        Customization.valueInt("speedLimitDrop", DISTANCE, 1000);
        Customization.show(activity);
        Dialog panel = ShadowDialog.getLatestDialog();
        for (String invalid : new String[]{"-1", "20001", "999999999999999999999"}) {
            clickValue(panel, "Limit-drop warning distance");
            AlertDialog editor = (AlertDialog) ShadowDialog.getLatestDialog();
            find(editor.getWindow().getDecorView(), EditText.class, null).setText(invalid);
            press(editor, AlertDialog.BUTTON_POSITIVE);
            assertFalse("Accepted " + invalid, prefs.contains("value:" + DISTANCE));
        }
    }

    @Test public void speedBumpMapAndWarningSuppressionSwitchesAreIndependent() {
        Customization.feature("speedBumpMap");
        Customization.feature("silenceSpeedBumps");
        Customization.show(activity);
        Dialog panel = ShadowDialog.getLatestDialog();
        TextView silence = find(panel.getWindow().getDecorView(), TextView.class, "Silence speed-bump warnings");
        assertNotNull(silence);
        ((View) silence.getParent().getParent()).performClick();
        assertFalse(Customization.on("silenceSpeedBumps"));
        assertTrue(Customization.on("speedBumpMap"));
        TextView map = find(panel.getWindow().getDecorView(), TextView.class, "Show speed bumps on map");
        assertTrue(find((View) map.getParent().getParent(), Switch.class, null).isChecked());
    }

    @Test public void reconnectMinutesUseNativeMillisecondsWithoutChangingPhoneTimeout() {
        String delay = "CONFIG_VALUE_AAP_SHUTDOWN_DELAY_ON_MAIN_SERVICE_DESTROY_MS";
        String phone = "CONFIG_VALUE_POWER_BACKGROUND_TIMEOUT_MS";
        Customization.feature("carReconnect");
        Customization.valueInt("carReconnect", delay, 120000);
        Customization.valueInt("stayAwake", phone, 10800000);
        Customization.show(activity);
        Dialog panel = ShadowDialog.getLatestDialog();
        clickValue(panel, "Reconnect delay");
        AlertDialog editor = (AlertDialog) ShadowDialog.getLatestDialog();
        find(editor.getWindow().getDecorView(), EditText.class, null).setText("3");
        press(editor, AlertDialog.BUTTON_POSITIVE);
        assertEquals(180000, Customization.number(delay, -1));
        assertEquals(10800000, Customization.number(phone, -1));
        for (String invalid : new String[]{"0", "11"}) {
            clickValue(panel, "Reconnect delay");
            editor = (AlertDialog) ShadowDialog.getLatestDialog();
            find(editor.getWindow().getDecorView(), EditText.class, null).setText(invalid);
            press(editor, AlertDialog.BUTTON_POSITIVE);
            assertEquals(180000, Customization.number(delay, -1));
        }
    }

    @Test public void refreshCeilingHasBoundsAndOffRestoresStockWithoutLosingChoice() {
        String rate = "DISPLAY_REFRESH_RATE";
        Customization.feature("highRefreshRate");
        Customization.valueInt("highRefreshRate", rate, 90);
        assertEquals(90.0, Customization.refreshRateCeiling(), 0);
        Customization.show(activity);
        Dialog panel = ShadowDialog.getLatestDialog();
        clickValue(panel, "Refresh rate ceiling");
        AlertDialog editor = (AlertDialog) ShadowDialog.getLatestDialog();
        find(editor.getWindow().getDecorView(), EditText.class, null).setText("120");
        press(editor, AlertDialog.BUTTON_POSITIVE);
        assertEquals(120.0, Customization.refreshRateCeiling(), 0);
        for (String invalid : new String[]{"59", "121"}) {
            clickValue(panel, "Refresh rate ceiling");
            editor = (AlertDialog) ShadowDialog.getLatestDialog();
            find(editor.getWindow().getDecorView(), EditText.class, null).setText(invalid);
            press(editor, AlertDialog.BUTTON_POSITIVE);
            assertEquals(120.0, Customization.refreshRateCeiling(), 0);
        }
        prefs.edit().putBoolean("highRefreshRate", false).commit();
        assertEquals(60.0, Customization.refreshRateCeiling(), 0);
        prefs.edit().putBoolean("highRefreshRate", true).commit();
        assertEquals(120.0, Customization.refreshRateCeiling(), 0);
        clickValue(panel, "Refresh rate ceiling");
        editor = (AlertDialog) ShadowDialog.getLatestDialog();
        press(editor, AlertDialog.BUTTON_NEUTRAL);
        assertEquals(90.0, Customization.refreshRateCeiling(), 0);
    }
}
