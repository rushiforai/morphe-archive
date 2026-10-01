package app.spicetify.extension.spotify.settings;

import android.app.Dialog;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import app.spicetify.extension.spotify.home.HomePins;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE, shadows = HomePinsSettingsTest.Capabilities.class)
public class HomePinsSettingsTest {
    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class Capabilities {
        @Implementation public static boolean homePins() { return true; }
    }

    @Test public void emptyPickerExplainsHowToLoadShortcuts() {
        HomePins.initialize(RuntimeEnvironment.getApplication());
        SpicetifySettingsActivity activity = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), SpicetifySettingsActivity.PAGE_HOME)).setup().get();
        choose(activity.getWindow().getDecorView()).performClick();
        assertTrue(hasText(ShadowDialog.getLatestDialog().getWindow().getDecorView(), "No Home shortcuts loaded"));
    }

    @Test public void excessSelectionKeepsPickerOpenAndLeavesSavedPinsUntouched() throws Exception {
        JSONArray saved = new JSONArray();
        for (int i = 0; i < 64; i++) saved.put(new JSONObject().put("id", "spotify:playlist:" + i).put("label", "Playlist " + i));
        RuntimeEnvironment.getApplication().getSharedPreferences("spicetify_home_pins", 0)
                .edit().putString("pins", saved.toString()).commit();
        HomePins.initialize(RuntimeEnvironment.getApplication());
        java.lang.reflect.Method capture = HomePins.class.getDeclaredMethod("captureAndOrder", String[].class, String[].class);
        capture.setAccessible(true);
        capture.invoke(null, new String[]{"spotify:playlist:new"}, new String[]{"New playlist"});
        SpicetifySettingsActivity activity = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), SpicetifySettingsActivity.PAGE_HOME)).setup().get();
        choose(activity.getWindow().getDecorView()).performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Dialog picker = ShadowDialog.getLatestDialog();
        List<CheckBox> boxes = new ArrayList<>();
        collect(picker.getWindow().getDecorView(), CheckBox.class, boxes);
        assertEquals(65, boxes.size());
        boxes.get(64).performClick();
        button(picker, "Save").performClick();
        assertTrue(picker.isShowing());
        assertEquals("Too many Home pins.", ShadowToast.getTextOfLatestToast());
        assertEquals(64, HomePins.choices().stream().filter(choice -> choice.pinned).count());
        boxes.get(64).performClick();
        button(picker, "Save").performClick();
        assertFalse(picker.isShowing());
    }

    private Button button(Dialog dialog, String label) {
        List<Button> buttons = new ArrayList<>();
        collect(dialog.getWindow().getDecorView(), Button.class, buttons);
        for (Button button : buttons) if (label.contentEquals(button.getText())) return button;
        throw new AssertionError("Missing button: " + label);
    }

    private <T extends View> void collect(View view, Class<T> kind, List<T> out) {
        if (kind.isInstance(view) && !(kind == Button.class && view instanceof CheckBox)) out.add(kind.cast(view));
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), kind, out);
        }
    }

    private boolean hasText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (hasText(group.getChildAt(i), text)) return true;
        }
        return false;
    }

    private View choose(View view) {
        if (view.isClickable() && "Pinned Home shortcuts".contentEquals(view.getContentDescription())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View result = choose(group.getChildAt(i));
                if (result != null) return result;
            }
        }
        return null;
    }
}
