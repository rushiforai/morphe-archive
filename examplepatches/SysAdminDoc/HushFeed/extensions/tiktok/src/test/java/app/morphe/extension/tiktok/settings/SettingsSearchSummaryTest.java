package app.morphe.extension.tiktok.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.os.Bundle;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceScreen;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.preference.LicensesPreference;
import app.morphe.extension.tiktok.settings.preference.SettingsMenuPreference;
import app.morphe.extension.tiktok.settings.preference.SettingsSearchInputPreference;
import app.morphe.extension.tiktok.settings.preference.SettingsSearchEntryPreference;
import app.morphe.extension.tiktok.settings.preference.TikTokPreferenceFragment;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

/**
 * A result copies its setting's value into its second line. WHEN a list setting is changed on the
 * page its result opened and the reader comes Back, the result SHALL show the new value. WHEN the
 * search only pauses (the screen going off), or a result only opens a dialog, its results SHALL
 * stay as they were, unrebuilt.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
@SuppressWarnings("deprecation")
public class SettingsSearchSummaryTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String QUERY = "caption background";
    private static final String TITLE = "Caption background";

    private final Map<Field, Boolean> statuses = new LinkedHashMap<>();

    @Before public void setUp() throws Exception {
        Utils.setContext(RuntimeEnvironment.getApplication());
        for (Field field : SettingsStatus.class.getDeclaredFields()) {
            if (field.getType() == boolean.class && Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                statuses.put(field, field.getBoolean(null));
                field.setBoolean(null, true);
            }
        }
    }

    @After public void tearDown() throws Exception {
        for (Map.Entry<Field, Boolean> entry : statuses.entrySet()) {
            entry.getKey().setBoolean(null, entry.getValue());
        }
        Settings.CAPTION_BACKGROUND.resetToDefault();
    }

    @Test public void aListSettingChangedInlineShowsItsNewValueWhenSearchReopens() throws Exception {
        Settings.CAPTION_BACKGROUND.save("dark");
        TikTokPreferenceFragment search = searchFor(attachSearch());
        assertEquals("Dark", value(row(search, TITLE)));

        // Locate the original row, change its value, and search again on the same main list.
        Preference result = row(search, TITLE);
        assertTrue(result.getOnPreferenceClickListener().onPreferenceClick(result));
        search.getFragmentManager().executePendingTransactions();
        idle();
        assertSame(search, search.getActivity().getFragmentManager().findFragmentById(android.R.id.content));
        assertTrue(search.findPreference("action_search_settings") instanceof SettingsSearchEntryPreference);
        assertEquals(0, search.getFragmentManager().getBackStackEntryCount());
        Settings.CAPTION_BACKGROUND.save("default");
        searchFor(search);

        assertEquals("the result kept the value from before its page changed it",
                "TikTok default", value(row(search, TITLE)));
    }

    @Test public void aPlainPauseLeavesTheResultsAsTheyWere() throws Exception {
        TikTokPreferenceFragment search = searchFor(attachSearch());
        Object index = searchIndex(search);
        Preference before = row(search, TITLE);

        search.onPause();
        search.onResume();
        idle();

        assertTrue("the index was rebuilt after a pause that opened nothing", index == searchIndex(search));
        assertSame("the results were redrawn after a pause that opened nothing", before, row(search, TITLE));

        // Closing search to locate a result still requires fresh values when search opens again.
        assertTrue(before.getOnPreferenceClickListener().onPreferenceClick(before));
        search.getFragmentManager().executePendingTransactions();
        idle();
        searchFor(search);
        assertTrue("the index wasn't rebuilt after locating its result", index != searchIndex(search));
    }

    @Test public void aResultThatOnlyOpensADialogLeavesTheResultsAsTheyWere() throws Exception {
        TikTokPreferenceFragment search = searchFor(attachSearch(), "licenses");
        Object index = searchIndex(search);
        Preference licenses = row(search, LicensesPreference.title(search.getActivity()));

        assertTrue(licenses.getOnPreferenceClickListener().onPreferenceClick(licenses));
        idle();
        search.onPause();
        search.onResume();
        idle();

        assertTrue("the index was rebuilt after the licenses notice", index == searchIndex(search));
    }

    @Test public void retainedDependentSummaryClearsWhenSearchTurnsItsParentBackOn() throws Exception {
        boolean saved = Settings.AUTO_ADVANCE.savedValue();
        Settings.AUTO_ADVANCE.save(true);
        try (var owner = Robolectric.buildActivity(Activity.class).setup().visible()) {
            TikTokPreferenceFragment page = attachSection(owner.get(), "PLAYBACK");
            SettingsMenuPreference playback = (SettingsMenuPreference) page.findPreference("section_playback");
            Preference original = page.findPreference(Settings.AUTO_ADVANCE.key);
            Preference dependent = page.findPreference(Settings.AUTO_ADVANCE_SEARCH.key);
            String summary = String.valueOf(dependent.getSummary());
            String reason = "Turn on Auto-advance videos first.";
            assertTrue(playback.isExpanded());
            assertTrue(dependent.isEnabled());
            assertFalse(summary.contains(reason));

            searchFor(page, "auto-advance");
            Preference proxy = row(page, "Auto-advance videos");
            assertTrue(proxy instanceof android.preference.SwitchPreference);
            assertNotSame(original, proxy);
            assertSame(dependent, playback.findPreference(Settings.AUTO_ADVANCE_SEARCH.key));
            assertFalse(playback.isExpanded());
            click(proxy);
            assertFalse(Settings.AUTO_ADVANCE.savedValue());
            assertFalse(dependent.isEnabled());
            assertTrue(String.valueOf(dependent.getSummary()).contains(reason));

            click(proxy);
            assertTrue(Settings.AUTO_ADVANCE.savedValue());
            assertTrue(page.closeInlineSearch());
            idle();
            assertTrue(playback.isExpanded());
            assertSame(dependent, page.findPreference(Settings.AUTO_ADVANCE_SEARCH.key));
            assertTrue(dependent.isEnabled());
            assertFalse("the retained row still says its enabled parent is off",
                    String.valueOf(dependent.getSummary()).contains(reason));
            assertEquals(summary, String.valueOf(dependent.getSummary()));
        } finally {
            Settings.AUTO_ADVANCE.save(saved);
        }
    }

    @Test public void searchAndRetainedRowsShowAndClearTheirOwnRestartSummaries() throws Exception {
        boolean saved = Settings.FOLDABLE_SPLIT_VIEW.savedValue();
        java.util.Set<String> debt = AbstractPreferenceFragment.restartPending;
        java.util.Set<String> previousDebt = new java.util.HashSet<>(debt);
        debt.clear();
        Settings.FOLDABLE_SPLIT_VIEW.save(false);
        try (var owner = Robolectric.buildActivity(Activity.class).setup().visible()) {
            TikTokPreferenceFragment page = attachSection(owner.get(), "BEHAVIOR");
            SettingsMenuPreference app = (SettingsMenuPreference) page.findPreference("section_behavior");
            Preference original = page.findPreference(Settings.FOLDABLE_SPLIT_VIEW.key);
            String originalSummary = String.valueOf(original.getSummary());
            searchFor(page, "comments beside the video");
            Preference proxy = row(page, "Comments beside the video");
            String searchSummary = String.valueOf(proxy.getSummary());
            assertTrue(proxy instanceof android.preference.SwitchPreference);
            assertNotSame(original, proxy);
            assertSame(original, app.findPreference(Settings.FOLDABLE_SPLIT_VIEW.key));
            assertFalse(app.isExpanded());
            assertFalse(originalSummary.contains("Restart pending."));
            assertFalse(searchSummary.contains("Restart pending."));

            click(proxy);
            assertTrue(Settings.FOLDABLE_SPLIT_VIEW.savedValue());
            assertTrue(debt.contains(Settings.FOLDABLE_SPLIT_VIEW.key));
            for (Preference displayed : new Preference[]{proxy, original}) {
                String pending = String.valueOf(displayed.getSummary());
                assertTrue("a retained copy lost its restart note", pending.contains("Restart pending."));
                assertFalse("the restart note was appended to the old instruction",
                        pending.contains("Restart TikTok to apply this."));
            }

            click(proxy);
            assertFalse(Settings.FOLDABLE_SPLIT_VIEW.savedValue());
            assertFalse(debt.contains(Settings.FOLDABLE_SPLIT_VIEW.key));
            assertEquals("the original row kept the search row's summary", originalSummary,
                    String.valueOf(original.getSummary()));
            assertEquals("the search row kept the original row's summary", searchSummary,
                    String.valueOf(proxy.getSummary()));
            assertTrue(page.closeInlineSearch());
            idle();
            assertSame(original, page.findPreference(Settings.FOLDABLE_SPLIT_VIEW.key));
            assertEquals(originalSummary, String.valueOf(original.getSummary()));
        } finally {
            Settings.FOLDABLE_SPLIT_VIEW.save(saved);
            debt.clear();
            debt.addAll(previousDebt);
        }
    }

    private static void click(Preference preference) throws Exception {
        Method click = Preference.class.getDeclaredMethod("onClick");
        click.setAccessible(true);
        click.invoke(preference);
        idle();
    }

    private static TikTokPreferenceFragment searchFor(TikTokPreferenceFragment search) throws Exception {
        return searchFor(search, QUERY);
    }

    private static TikTokPreferenceFragment searchFor(TikTokPreferenceFragment search, String query) throws Exception {
        Preference entry = search.findPreference("action_search_settings");
        if (entry instanceof SettingsSearchEntryPreference) {
            assertTrue(entry.getOnPreferenceClickListener().onPreferenceClick(entry));
            idle();
        }
        Field input = TikTokPreferenceFragment.class.getDeclaredField("searchInput");
        input.setAccessible(true);
        ((SettingsSearchInputPreference) input.get(search)).setQuery(query);
        Method update = TikTokPreferenceFragment.class.getDeclaredMethod("updateSearchResults", String.class);
        update.setAccessible(true);
        update.invoke(search, query);
        idle();
        return search;
    }

    private static Object searchIndex(TikTokPreferenceFragment search) throws Exception {
        Field index = TikTokPreferenceFragment.class.getDeclaredField("searchIndex");
        index.setAccessible(true);
        return index.get(search);
    }

    /** The setting's value, the last part of a result's second line. */
    private static String value(Preference row) {
        String summary = String.valueOf(row.getSummary());
        return summary.substring(summary.lastIndexOf(" · ") + 3);
    }

    private static Preference row(TikTokPreferenceFragment fragment, String title) {
        PreferenceScreen screen = fragment.getPreferenceScreen();
        for (int index = 0; index < screen.getPreferenceCount(); index++) {
            Preference row = screen.getPreference(index);
            if (row.getTitle() != null && title.contentEquals(row.getTitle())) return row;
        }
        assertNotNull("the results lost " + title, null);
        return null;
    }

    private static void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    private static TikTokPreferenceFragment attachSearch() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        Bundle arguments = new Bundle();
        arguments.putBoolean("morphe_settings_search", true);
        return attach(activity, arguments);
    }

    private static TikTokPreferenceFragment attachSection(Activity activity, String section) {
        Bundle arguments = new Bundle();
        arguments.putString("morphe_settings_section", section);
        return attach(activity, arguments);
    }

    private static TikTokPreferenceFragment attach(Activity activity, Bundle arguments) {
        TikTokPreferenceFragment fragment = new TikTokPreferenceFragment();
        fragment.setArguments(arguments);
        activity.getFragmentManager().beginTransaction().replace(android.R.id.content, fragment).commit();
        activity.getFragmentManager().executePendingTransactions();
        idle();
        return fragment;
    }
}
