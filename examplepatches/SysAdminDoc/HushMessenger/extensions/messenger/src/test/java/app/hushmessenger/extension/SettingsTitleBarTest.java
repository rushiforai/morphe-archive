package app.hushmessenger.extension;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** HushGram's header and bar: the page opens on the icon, name and version, and the bar names the page only when they don't. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, qualifiers = "w400dp-h900dp-mdpi")
public class SettingsTitleBarTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    @Test public void headerCentresTheIconNameAndVersionAtTheTopOfTheMainPage() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 400, 900);
            LinearLayout header = root.findViewWithTag(SettingsHeader.HEADER);
            ImageView icon = header.findViewWithTag(SettingsHeader.ICON);
            TextView name = header.findViewWithTag(SettingsHeader.NAME);
            TextView version = header.findViewWithTag(SettingsHeader.VERSION);
            assertSame("The header comes first on the page", header, ((ViewGroup) header.getParent()).getChildAt(0));
            assertSame(root.findViewWithTag("find_control"), ((ViewGroup) header.getParent()).findViewWithTag("find_control"));
            assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, header.getLayoutParams().width);
            assertEquals(24, header.getPaddingStart());
            assertEquals(28, header.getPaddingTop());
            assertEquals(24, header.getPaddingEnd());
            assertEquals(20, header.getPaddingBottom());

            int middle = centre(header);
            assertEquals(64, icon.getWidth());
            assertEquals(64, icon.getHeight());
            assertEquals(ImageView.ScaleType.FIT_CENTER, icon.getScaleType());
            assertEquals(middle, centre(icon), 1);
            assertEquals(Gravity.CENTER_HORIZONTAL, name.getGravity() & Gravity.HORIZONTAL_GRAVITY_MASK);
            assertEquals(middle, centre(name), 1);
            assertEquals(middle, centre(version), 1);
            assertEquals(Gravity.CENTER_HORIZONTAL, version.getGravity() & Gravity.HORIZONTAL_GRAVITY_MASK);

            assertEquals(12, name.getTop() - icon.getBottom());
            assertEquals(4, version.getTop() - name.getBottom());
            assertEquals(32f, name.getTextSize(), 0.01f);
            assertEquals(13f, version.getTextSize(), 0.01f);
            assertEquals("HushMessenger", name.getText().toString());
            assertTrue(ShimmerTitle.wears(name));

            // The icon is decoration and the name is the page's heading.
            assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_NO, icon.getImportantForAccessibility());
            assertTrue(name.createAccessibilityNodeInfo().isHeading());
            for (View part : new View[] {header, icon, name, version}) {
                assertFalse("Nothing on the header can be tapped: " + part.getTag(), part.isClickable());
                assertFalse(part.hasOnClickListeners());
            }

            String messenger = screen.get().getPackageManager().getPackageInfo(screen.get().getPackageName(), 0).versionName;
            assertEquals(SettingsHeader.versionLine(new SettingsText(screen.get()), messenger), version.getText().toString());
        }
    }

    @Test public void versionLineIsolatesBothVersionsAndCopesWithoutMessengers() {
        SettingsText text = new SettingsText(RuntimeEnvironment.getApplication());
        String patches = (char) 0x2068 + BuildConfig.VERSION_NAME + (char) 0x2069;
        String messenger = (char) 0x2068 + "548.0.0.42.75" + (char) 0x2069;
        assertEquals(text.get("header_version", patches, messenger), SettingsHeader.versionLine(text, " 548.0.0.42.75 "));
        assertTrue(SettingsHeader.versionLine(text, "548.0.0.42.75").contains(messenger));
        assertEquals(text.get("header_version_alone", patches), SettingsHeader.versionLine(text, null));
        assertEquals(text.get("header_version_alone", patches), SettingsHeader.versionLine(text, "  "));
        assertFalse(SettingsHeader.versionLine(text, null).contains("Messenger"));
    }

    @Test public void barLeavesTheNameOffWhileTheHeaderShowsItAndNamesThePageOnceItScrollsAway() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 400, 900);
            TextView wordmark = root.findViewWithTag("wordmark");
            View bar = (View) wordmark.getParent().getParent();
            int barHeight = bar.getHeight();
            assertEquals("The header names the page, so the bar doesn't", View.INVISIBLE, wordmark.getVisibility());

            View name = root.findViewWithTag(SettingsHeader.NAME);
            ScrollView controls = scroll(root.findViewWithTag("controls_page"));
            controls.scrollTo(0, ((View) name.getParent()).getTop() + name.getBottom() + 1);
            layout(screen.get(), 400, 900);
            assertTrue(controls.getScrollY() > 0);
            assertEquals(View.VISIBLE, wordmark.getVisibility());
            assertEquals("HushMessenger", wordmark.getText().toString());
            assertEquals("The bar keeps its height either way", barHeight, bar.getHeight());

            // Part of the name back on screen is enough for the bar to leave it off again.
            controls.scrollTo(0, ((View) name.getParent()).getTop() + name.getBottom() - 4);
            layout(screen.get(), 400, 900);
            assertEquals(View.INVISIBLE, wordmark.getVisibility());
            controls.scrollTo(0, 0);
            layout(screen.get(), 400, 900);
            assertEquals(View.INVISIBLE, wordmark.getVisibility());
        }
    }

    @Test public void barSaysSearchSettingsWhileASearchIsTyped() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 400, 900);
            TextView wordmark = root.findViewWithTag("wordmark");
            EditText search = root.findViewWithTag("find_control");
            search.setText("People");
            layout(screen.get(), 400, 900);
            assertEquals(View.VISIBLE, wordmark.getVisibility());
            assertEquals(new SettingsText(screen.get()).get("search_settings"), wordmark.getText().toString());
            // The header stays on screen while searching.
            assertTrue(root.findViewWithTag(SettingsHeader.HEADER).isShown());
            search.setText("   ");
            layout(screen.get(), 400, 900);
            assertEquals("HushMessenger", wordmark.getText().toString());
            assertEquals(View.INVISIBLE, wordmark.getVisibility());
            search.setText("");
            layout(screen.get(), 400, 900);
            assertEquals(View.INVISIBLE, wordmark.getVisibility());
        }
    }

    @Test public void appTabHasNoHeaderSoTheBarNamesThePage() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 400, 900);
            TextView wordmark = root.findViewWithTag("wordmark");
            root.findViewWithTag("tab_app").performClick();
            layout(screen.get(), 400, 900);
            assertFalse(root.findViewWithTag(SettingsHeader.HEADER).isShown());
            assertEquals(View.VISIBLE, wordmark.getVisibility());
            assertEquals("HushMessenger", wordmark.getText().toString());
            root.findViewWithTag("tab_controls").performClick();
            layout(screen.get(), 400, 900);
            assertEquals(View.INVISIBLE, wordmark.getVisibility());
        }
    }

    @Test public void aSearchLeftTypedOnControlsDoesntRenameTheAppTab() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 400, 900);
            TextView wordmark = root.findViewWithTag("wordmark");
            root.<EditText>findViewWithTag("find_control").setText("People");
            root.findViewWithTag("tab_app").performClick();
            layout(screen.get(), 400, 900);
            assertEquals("HushMessenger", wordmark.getText().toString());
            root.findViewWithTag("tab_controls").performClick();
            layout(screen.get(), 400, 900);
            assertEquals("and the search is still there when Controls comes back",
                new SettingsText(screen.get()).get("search_settings"), wordmark.getText().toString());
        }
    }

    @Test public void backIsANamedFortyEightDpTargetAtTheStart() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 400, 900);
            ImageButton back = root.findViewWithTag("back");
            assertEquals(48, back.getWidth());
            assertEquals(48, back.getHeight());
            assertEquals(new SettingsText(screen.get()).get("back"), back.getContentDescription().toString());
            assertTrue(back.isClickable());
            assertTrue(back.hasOnClickListeners());
            assertTrue("The arrow turns around for right-to-left languages", back.getDrawable().isAutoMirrored());
            Rect place = new Rect();
            assertTrue(back.getGlobalVisibleRect(place));
            // The touch area reaches into the bar's padding, so the arrow itself sits 16 dp in.
            assertEquals(4, place.left);
            TextView wordmark = root.findViewWithTag("wordmark");
            int[] spot = new int[2];
            wordmark.getLocationInWindow(spot);
            assertTrue("The title follows Back", spot[0] >= place.right);
        }
    }

    @Test public void backSitsAtTheRightInRightToLeftLanguages() {
        // The pseudo right-to-left locale, which the settings lay out mirrored.
        RuntimeEnvironment.setQualifiers("ar-rXB-ldrtl-w400dp-h900dp-mdpi");
        RuntimeEnvironment.getApplication().getApplicationInfo().flags |= android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 400, 900);
            ImageButton back = root.findViewWithTag("back");
            Rect place = new Rect();
            assertTrue(back.getGlobalVisibleRect(place));
            assertEquals(396, place.right);
            assertEquals(View.LAYOUT_DIRECTION_RTL, back.getLayoutDirection());
        }
    }

    @Test @Config(qualifiers = "w320dp-h360dp-mdpi") public void shortWindowDropsTheHeaderAndTheBarNamesThePage() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 320, 360);
            assertEquals(View.GONE, root.findViewWithTag(SettingsHeader.HEADER).getVisibility());
            assertEquals(View.VISIBLE, root.<TextView>findViewWithTag("wordmark").getVisibility());
        }
    }

    @Test public void lightLookWearsTheLightGradientOnTheName() {
        Settings.preferences.edit().putBoolean("light", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 400, 900);
            TextView name = root.findViewWithTag(SettingsHeader.NAME);
            assertTrue(ShimmerTitle.wears(name));
            assertEquals(View.INVISIBLE, root.<TextView>findViewWithTag("wordmark").getVisibility());
        }
    }

    private static int centre(View view) {
        int[] spot = new int[2];
        view.getLocationInWindow(spot);
        return spot[0] + view.getWidth() / 2;
    }

    private static View layout(Activity activity, int width, int height) {
        View root = activity.getWindow().getDecorView();
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, width, height);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
        return root;
    }

    private static ScrollView scroll(View view) {
        if (view instanceof ScrollView) return (ScrollView) view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            ScrollView found = scroll(((ViewGroup) view).getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }
}
