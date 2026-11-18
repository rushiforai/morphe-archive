package app.hushmessenger.extension;

import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** Everything a person can tap on either settings page has a name TalkBack reads and room for a finger. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36, qualifiers = "w411dp-h891dp-mdpi")
public class SettingsAccessibilityTest {
    private static final int FINGER_DP = 48;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    @Test public void everyTapTargetOnBothPagesHasANameAndRoomForAFinger() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            float density = root.getResources().getDisplayMetrics().density;
            List<String> problems = new ArrayList<>();
            int checked = 0;
            for (String page : new String[] {"controls", "app"}) {
                root.findViewWithTag("tab_" + page).performClick();
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                List<View> targets = new ArrayList<>();
                collect(root, targets);
                assertTrue(page + " has tap targets", targets.size() > 5);
                for (View target : targets) {
                    checked++;
                    String where = page + " " + describe(target);
                    if (name(target).isEmpty()) problems.add(where + " has no name");
                    int width = Math.round(target.getWidth() / density), height = Math.round(target.getHeight() / density);
                    if (width < FINGER_DP || height < FINGER_DP) problems.add(where + " is " + width + "x" + height + " dp");
                }
            }
            assertTrue("checked " + checked, checked > 40);
            assertTrue(String.join("\n", problems), problems.isEmpty());
        }
    }

    /** What a person can tap: shown, clickable or long-clickable, and not hidden from TalkBack. */
    private static void collect(View view, List<View> into) {
        if (!view.isShown() || view.getWidth() == 0 || view.getHeight() == 0) return;
        if (view.getImportantForAccessibility() == View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS) return;
        if ((view.isClickable() || view.isLongClickable()) && view.isEnabled()
            && view.getImportantForAccessibility() != View.IMPORTANT_FOR_ACCESSIBILITY_NO) into.add(view);
        if (view instanceof ViewGroup group) for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), into);
    }

    /** The view's own description, text or hint, its label, or failing those the words inside it TalkBack reads out. */
    private static String name(View view) {
        AccessibilityNodeInfo info = view.createAccessibilityNodeInfo();
        for (CharSequence words : new CharSequence[] {info.getContentDescription(), info.getText(), info.getHintText()}) {
            if (words != null && words.toString().trim().length() > 0) return words.toString();
        }
        AccessibilityNodeInfo label = info.getLabeledBy();
        if (label != null && label.getText() != null) return label.getText().toString();
        StringBuilder inside = new StringBuilder();
        if (view instanceof ViewGroup group) spoken(group, inside);
        return inside.toString().trim();
    }

    private static void spoken(ViewGroup group, StringBuilder into) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (!child.isShown() || child.getImportantForAccessibility() == View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS) continue;
            boolean read = child.getImportantForAccessibility() != View.IMPORTANT_FOR_ACCESSIBILITY_NO;
            if (read && child.getContentDescription() != null) into.append(child.getContentDescription()).append(' ');
            else if (read && child instanceof TextView words) into.append(words.getText()).append(' ');
            if (child instanceof ViewGroup inner) spoken(inner, into);
        }
    }

    private static String describe(View view) {
        Object tag = view.getTag();
        String words = view instanceof TextView text ? " \"" + text.getText() + "\"" : "";
        return view.getClass().getSimpleName() + (tag == null ? "" : " [" + tag + "]") + words;
    }
}
