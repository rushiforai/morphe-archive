package app.morphe.extension.tiktok.settings.preference;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

/**
 * What add-on bundles patched in beside Hushfeed rely on, as README's "Add-on bundles" section
 * lists it. BDCrusher's tiktok-interaction-addons wraps the settings fragment's createMasterMenu
 * and onResume, puts its row after one of the Your feed page keys, and builds its own page from
 * the public settings members below. Its patch refuses to apply when one of them is gone or no
 * longer public, so a rename here breaks those bundles without a single Hushfeed test noticing.
 *
 * <p>Every name is a string on purpose: an IDE rename updates direct references in tests too,
 * and this test has to fail on exactly that.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "w480dp-h960dp-night-mdpi")
@SuppressWarnings("deprecation")
public class AddonContractTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String PREFERENCE = "app.morphe.extension.tiktok.settings.preference.";
    /** The keys an add-on places its row after, in the order it tries them. */
    private static final String[] FEED_PAGE_KEYS = {"section_interface", "section_feed_filter",
            "section_feed_navigation", "section_playback", "section_screen_time"};
    private final Map<Field, Boolean> statuses = new LinkedHashMap<>();

    public static class PageActivity extends Activity {
        @Override public void onCreate(Bundle state) {
            setTheme(android.R.style.Theme_Material_NoActionBar);
            super.onCreate(state);
        }
    }

    @Before public void offerEveryPage() throws Exception {
        for (Field field : SettingsStatus.class.getDeclaredFields()) {
            if (field.getType() == boolean.class && Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                statuses.put(field, field.getBoolean(null));
                field.setBoolean(null, true);
            }
        }
    }

    @After public void restoreStatuses() throws Exception {
        for (var entry : statuses.entrySet()) entry.getKey().setBoolean(null, entry.getValue());
    }

    @Test public void theSettingsMembersAddOnsCallStayPublic() throws Exception {
        Class<?> menu = publicClass(PREFERENCE + "SettingsMenuPreference");
        Class<?> icon = publicClass(PREFERENCE + "SettingsMenuPreference$Icon");
        assertPublic(menu.getConstructor(Context.class, String.class, String.class, icon,
                Preference.OnPreferenceClickListener.class));
        assertNotNull(Enum.valueOf(icon.asSubclass(Enum.class), "LAYOUT"));
        method(menu, false, void.class, "setCompact", boolean.class);

        Class<?> heading = publicClass(PREFERENCE + "SectionHeadingPreference");
        assertPublic(heading.getConstructor(Context.class, String.class, boolean.class));
        method(heading, true, heading, "compact", Context.class, String.class);

        Class<?> header = publicClass(PREFERENCE + "SettingsHeaderPreference");
        method(header, true, android.widget.LinearLayout.class, "createHeader",
                Context.class, String.class, Runnable.class);

        method(publicClass("app.morphe.extension.tiktok.settings.L10n"), true, String.class, "t",
                Context.class, String.class);
        method(publicClass("app.morphe.extension.shared.settings.HushfeedPause"), true, boolean.class,
                "isPaused");

        Class<?> ui = publicClass(PREFERENCE + "SettingsUi");
        method(ui, true, void.class, "syncDarkMode", Context.class);
        method(ui, true, void.class, "styleStandardAlertDialog", android.app.AlertDialog.class);
        method(ui, true, int.class, "dp", Context.class, int.class);
        method(ui, true, int.class, "background");
        method(ui, true, int.class, "textPrimary");
        method(ui, true, int.class, "textSecondary");
        method(ui, true, void.class, "styleSwitch", android.widget.Switch.class);
        method(ui, true, void.class, "styleEditText", android.widget.EditText.class);
        method(ui, true, android.graphics.drawable.Drawable.class, "groupedRow",
                Context.class, boolean.class, boolean.class);
        method(ui, true, android.widget.TextView.class, "sectionTitle", Context.class, String.class);
        method(ui, true, android.widget.TextView.class, "text",
                Context.class, String.class, float.class, int.class, int.class);
    }

    @Test public void theFragmentKeepsBothMethodsAnAddOnWraps() throws Exception {
        Class<?> fragment = Class.forName(PREFERENCE + "TikTokPreferenceFragment");
        assertTrue("an add-on refreshes its row only on a PreferenceFragment",
                android.preference.PreferenceFragment.class.isAssignableFrom(fragment));
        // The add-on swaps each for a wrapper that calls the original and then itself, which it
        // can only do on an instance method with a body that returns void.
        for (Method wrapped : new Method[]{
                fragment.getDeclaredMethod("createMasterMenu", Context.class, PreferenceScreen.class),
                fragment.getDeclaredMethod("onResume")}) {
            assertEquals(wrapped.getName(), void.class, wrapped.getReturnType());
            int flags = wrapped.getModifiers();
            assertFalse(wrapped.getName() + " is static", Modifier.isStatic(flags));
            assertFalse(wrapped.getName() + " has no body", Modifier.isAbstract(flags) || Modifier.isNative(flags));
        }
    }

    @Test public void theHomePageStillHasTheRowsAnAddOnPlacesItselfBy() throws Exception {
        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            TikTokPreferenceFragment home = new TikTokPreferenceFragment();
            activity.getFragmentManager().beginTransaction()
                    .replace(android.R.id.content, home).commit();
            activity.getFragmentManager().executePendingTransactions();
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            PreferenceScreen screen = home.getPreferenceScreen();
            List<String> keys = new ArrayList<>();
            int hushfeedHeading = -1;
            for (int index = 0; index < screen.getPreferenceCount(); index++) {
                Preference row = screen.getPreference(index);
                keys.add(row.getKey());
                if (row instanceof SectionHeadingPreference && row.getTitle() != null
                        && L10n.t(activity, "Hushfeed").contentEquals(row.getTitle())) {
                    hushfeedHeading = index;
                }
            }
            assertTrue("no Hushfeed heading for an add-on to fall back to", hushfeedHeading >= 0);
            for (String key : FEED_PAGE_KEYS) {
                assertTrue(key + " is gone from the home page: " + keys, keys.contains(key));
                assertTrue(key + " moved under the Hushfeed heading", keys.indexOf(key) < hushfeedHeading);
            }
        }
    }

    private static Class<?> publicClass(String name) throws ClassNotFoundException {
        Class<?> type = Class.forName(name);
        assertTrue(name + " is no longer public", Modifier.isPublic(type.getModifiers()));
        return type;
    }

    private static void method(Class<?> owner, boolean isStatic, Class<?> returns, String name,
                               Class<?>... parameters) throws NoSuchMethodException {
        // getMethod finds public members only, so a narrowed one fails here as missing.
        Method method = owner.getMethod(name, parameters);
        assertEquals(owner.getSimpleName() + "." + name + " return type", returns, method.getReturnType());
        assertEquals(owner.getSimpleName() + "." + name + " static", isStatic, Modifier.isStatic(method.getModifiers()));
        assertEquals(owner.getSimpleName() + "." + name + " is declared elsewhere", owner, method.getDeclaringClass());
    }

    private static void assertPublic(Constructor<?> constructor) {
        assertTrue(constructor + " is no longer public", Modifier.isPublic(constructor.getModifiers()));
    }
}
