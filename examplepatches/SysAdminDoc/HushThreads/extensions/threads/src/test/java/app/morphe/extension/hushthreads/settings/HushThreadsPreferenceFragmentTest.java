/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * The settings screen as it draws inside Threads: a black page whose rows must be readable, and a
 * row for each patch this build carries and none for the rest.
 *
 * <p>On a phone on 2026-09-24 every row title was near-black on black, because the rows took the
 * host's light activity theme, and the two diagnostics rows had no text at all.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class HushThreadsPreferenceFragmentTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Wording that tells the reader a paused Threads is an unpatched one, which it isn't. */
    private static final Pattern UNPATCHED = Pattern.compile("(?i)unpatched|n't patched|not patched|as if it weren");

    /** The row each patch adds, by the title it shows. */
    private final Map<PatchFamily, String> ROW_TITLES = new LinkedHashMap<>();

    @Before
    public void initializeRowTitlesAfterContext() {
        ROW_TITLES.put(PatchFamily.HIDE_ADS, "Hide ads");
        ROW_TITLES.put(PatchFamily.HIDE_SUGGESTED_USERS, "Hide suggested users");
        ROW_TITLES.put(PatchFamily.RETURN_REFRESH, "Keep feed position on return");
        ROW_TITLES.put(PatchFamily.VIDEO_AUTOPLAY, "Tap to play videos");
        ROW_TITLES.put(PatchFamily.SANITIZE_SHARING_LINKS, "Remove tracking from shared links");
        ROW_TITLES.put(PatchFamily.EXTERNAL_BROWSER, "Open links in your browser");
        ROW_TITLES.put(PatchFamily.DISABLE_ANALYTICS, "Stop analytics uploads");
        ROW_TITLES.put(PatchFamily.PURE_BLACK, "Pure black dark mode");
        ROW_TITLES.put(PatchFamily.REMOVE_AD_ID, "Advertising ID removed");
        ROW_TITLES.put(PatchFamily.RESTORE_TRUST, "Re-signed build fix");
    }

    /** The sections every build has, in the order they're drawn. */
    private static final List<String> EVERY_BUILD = Arrays.asList(
            "Links", "Updates", "Pause, backup and diagnostics", "About");

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        PauseForTests.resume();
        BaseSettings.SAFE_MODE.resetToDefault();
    }

    @Test
    public void everyRowHasATitleAndLightText() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertReadable(rowsOf(controller));
        }
    }

    /**
     * A test JVM has no patched status flags, so the test above sees only the rows every build
     * has. This one draws the screen with every patch in.
     */
    @Test
    public void withEveryPatchInEveryRowIsReadableAndNoneCallsAPausedThreadsUnpatched() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rowsOf(controller);
            assertReadable(rows);

            Set<String> switchKeys = new HashSet<>();
            for (PatchFamily family : PatchFamily.values()) {
                for (BooleanSetting setting : family.switches) switchKeys.add(setting.key);
            }
            // The settings entry's own switches are Pause's to turn off too.
            for (BooleanSetting setting : PatchFamily.ENTRY_SWITCHES) switchKeys.add(setting.key);
            Set<String> shown = new HashSet<>();
            Preference stays = null;
            for (Preference row : rows) {
                String text = row.getTitle() + " " + row.getSummary();
                assertFalse("\"" + text + "\" says a paused Threads is unpatched", UNPATCHED.matcher(text).find());
                if (row instanceof SwitchPreference && switchKeys.contains(row.getKey())) shown.add(row.getKey());
                if (HushThreadsPreferenceFragment.STAYS_WHILE_PAUSED.contentEquals(row.getTitle())) stays = row;
            }
            assertEquals("a switch Pause turns off is missing from the screen", switchKeys, shown);
            assertNotNull("nothing on the screen says what Pause can't reach", stays);
            assertEquals(PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class)),
                    String.valueOf(stays.getSummary()));

            // Pause covers runtime features and explicitly keeps debugging available.
            int pause = indexOfKey(rows, BaseSettings.PAUSED.key);
            assertTrue("the Pause row is missing", pause >= 0);
            for (String key : switchKeys) {
                assertTrue(key + " is drawn below the Pause row", indexOfKey(rows, key) < pause);
            }
            assertTrue("Debug logging is drawn above the Pause row", indexOfKey(rows, BaseSettings.DEBUG.key) > pause);
            assertTrue(String.valueOf(rows.get(pause).getSummary()),
                    String.valueOf(rows.get(pause).getSummary()).contains("every switch but Debug logging acts as if it were off. Changes made when you patched stay in"));
        }
    }

    /**
     * Each patch's row is on the screen only when the patch is in the build: alone, with every
     * other patch, and not at all. A section with nothing of its build to show isn't drawn, and the
     * sections every build needs always are.
     */
    @Test
    public void theFeatureRowsAreThePatchesInThisBuild() {
        List<Set<PatchFamily>> builds = new ArrayList<>();
        builds.add(EnumSet.noneOf(PatchFamily.class));
        for (PatchFamily family : PatchFamily.values()) builds.add(EnumSet.of(family));
        builds.add(EnumSet.allOf(PatchFamily.class));
        assertEquals("every patch needs its row here", EnumSet.allOf(PatchFamily.class), ROW_TITLES.keySet());

        List<String> wrong = new ArrayList<>();
        for (Set<PatchFamily> build : builds) {
            PatchFamily.inBuildForTests = build;
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                HushThreadsPreferenceFragment page = pageOf(controller);
                List<Preference> rows = new ArrayList<>();
                collect(page.getPreferenceScreen(), rows);
                Set<String> titles = new HashSet<>();
                for (Preference row : rows) titles.add(String.valueOf(row.getTitle()));
                for (Map.Entry<PatchFamily, String> row : ROW_TITLES.entrySet()) {
                    if (build.contains(row.getKey()) != titles.contains(row.getValue())) {
                        wrong.add(build + ": " + row.getValue() + (build.contains(row.getKey()) ? " is missing" : " is shown"));
                    }
                }
                for (PatchFamily family : PatchFamily.values()) {
                    for (BooleanSetting setting : family.switches) {
                        boolean drawn = page.findPreference(setting.key) != null;
                        if (drawn != build.contains(family)) wrong.add(build + ": " + setting.key + (drawn ? " is drawn" : " isn't drawn"));
                    }
                }

                List<String> sections = sections(page);
                List<String> expected = new ArrayList<>();
                if (build.contains(PatchFamily.HIDE_ADS) || build.contains(PatchFamily.HIDE_SUGGESTED_USERS)
                        || build.contains(PatchFamily.RETURN_REFRESH) || build.contains(PatchFamily.VIDEO_AUTOPLAY)) {
                    expected.add("Feed");
                }
                if (build.contains(PatchFamily.SANITIZE_SHARING_LINKS) || build.contains(PatchFamily.EXTERNAL_BROWSER)
                        || build.contains(PatchFamily.DISABLE_ANALYTICS)) {
                    expected.add("Privacy");
                }
                if (build.contains(PatchFamily.PURE_BLACK)) expected.add("Appearance");
                expected.addAll(EVERY_BUILD.subList(0, 2));
                if (build.contains(PatchFamily.REMOVE_AD_ID) || build.contains(PatchFamily.RESTORE_TRUST)) {
                    expected.add("Set when you patched");
                }
                expected.addAll(EVERY_BUILD.subList(2, EVERY_BUILD.size()));
                if (!expected.equals(sections)) wrong.add(build + ": sections " + sections);
            }
        }
        assertEquals(Collections.emptyList(), wrong);
    }

    /** Each selected patch's row says what it does, in Threads' own words. */
    @Test
    public void eachPatchsRowSaysWhatItDoes() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = pageOf(controller);
            assertEquals("Hide ads", String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getTitle()));
            assertEquals("Sponsored posts come out of For you and Following before Threads shows them, so no gap is left.",
                    String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getSummary()));
            assertEquals("Hide suggested users", String.valueOf(page.findPreference(Settings.HIDE_SUGGESTED_USERS.key).getTitle()));
            assertEquals("Removes verified cards suggesting accounts to follow. Ordinary posts and reposts stay.",
                    String.valueOf(page.findPreference(Settings.HIDE_SUGGESTED_USERS.key).getSummary()));
            assertEquals("Keep feed position on return", String.valueOf(page.findPreference(Settings.BLOCK_RETURN_REFRESH.key).getTitle()));
            assertEquals("Returning to Threads within ten minutes keeps your place. Pull to refresh still works.",
                    String.valueOf(page.findPreference(Settings.BLOCK_RETURN_REFRESH.key).getSummary()));
            assertEquals("No time limit", String.valueOf(page.findPreference(Settings.RETURN_REFRESH_NO_LIMIT.key).getTitle()));
            assertEquals("With the switch above on, your place stays however long you're away. Pull to refresh and a fresh "
                    + "start still load new posts.", String.valueOf(page.findPreference(Settings.RETURN_REFRESH_NO_LIMIT.key).getSummary()));
            assertEquals("Tap to play videos", String.valueOf(page.findPreference(Settings.DISABLE_VIDEO_AUTOPLAY.key).getTitle()));
            assertEquals("Videos in your feed wait for a tap instead of playing as you scroll.",
                    String.valueOf(page.findPreference(Settings.DISABLE_VIDEO_AUTOPLAY.key).getSummary()));
            assertEquals("Takes tracking tags such as xmt and slof off the post links you copy or share. A short share "
                    + "link becomes the post's own link.", String.valueOf(page.findPreference(Settings.SANITIZE_SHARING_LINKS.key).getSummary()));
            assertEquals("Open links in your browser", String.valueOf(page.findPreference(Settings.OPEN_LINKS_EXTERNALLY.key).getTitle()));
            assertEquals("Web links you tap open in your default browser, or the app for that site, without Threads' click "
                    + "tracker. Threads, Instagram and other Meta pages still open in Threads.",
                    String.valueOf(page.findPreference(Settings.OPEN_LINKS_EXTERNALLY.key).getSummary()));
            assertEquals("Matched analytics addresses go to an address that doesn't answer. Other telemetry may remain. "
                    + "Turn this off to use the original addresses.",
                    String.valueOf(page.findPreference(Settings.DISABLE_ANALYTICS.key).getSummary()));
            assertEquals("Pure black dark mode", String.valueOf(page.findPreference(Settings.PURE_BLACK.key).getTitle()));
            assertEquals("Dark mode draws black instead of dark gray. Turn on dark mode in Threads to see it.",
                    String.valueOf(page.findPreference(Settings.PURE_BLACK.key).getSummary()));
            // Every selected feed, privacy and appearance switch ships on.
            for (BooleanSetting setting : Arrays.asList(Settings.HIDE_ADS, Settings.HIDE_SUGGESTED_USERS, Settings.BLOCK_RETURN_REFRESH,
                    Settings.DISABLE_VIDEO_AUTOPLAY, Settings.SANITIZE_SHARING_LINKS, Settings.OPEN_LINKS_EXTERNALLY, Settings.DISABLE_ANALYTICS,
                    Settings.PURE_BLACK)) {
                assertTrue(setting.key, ((SwitchPreference) page.findPreference(setting.key)).isChecked());
            }
            // The time limit holds until someone lifts it.
            assertFalse(((SwitchPreference) page.findPreference(Settings.RETURN_REFRESH_NO_LIMIT.key)).isChecked());
            List<Preference> rows = new ArrayList<>();
            collect(page.getPreferenceScreen(), rows);
            for (Preference row : rows) {
                String text = row.getTitle() + " " + row.getSummary();
                assertFalse("\"" + text + "\" names Facebook", text.contains("Facebook"));
            }
        }
    }

    @Test
    public void thePausedCardSaysWhatStaysInForEveryReason() {
        for (HushThreadsPause.Reason why : HushThreadsPause.Reason.values()) {
            String summary = HushThreadsPreferenceFragment.pausedSummary(why, "com.instagram.barcelona");
            assertFalse(why + ": " + summary, UNPATCHED.matcher(summary).find());
            assertTrue(why + ": " + summary, summary.contains("what was set when you patched stays in"));
            // Debug logging is kept as saved while paused, so the card can't say every switch is off.
            assertTrue(why + ": " + summary, summary.contains("Every switch but Debug logging"));
        }

        // The marker counts only in the app's own files folder, and the card names that folder,
        // not the one above it a person finds first. The folder is isolated, so a right-to-left
        // sentence keeps the path in the order it was written.
        String pkg = RuntimeEnvironment.getApplication().getPackageName();
        assertTrue(HushThreadsPreferenceFragment.pausedSummary(HushThreadsPause.Reason.MARKER_FILE, pkg)
                .contains("in " + L10n.isolate("Android/data/" + pkg + "/files") + " paused HushThreads"));

        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        // A crash-loop pause comes from safe mode, which stays on for the next start too. The card
        // reads that to say whether the next start still runs paused.
        BaseSettings.SAFE_MODE.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference card = rowsOf(controller).get(0);
            assertEquals("HushThreads is paused", String.valueOf(card.getTitle()));
            assertEquals(HushThreadsPreferenceFragment.pausedSummary(HushThreadsPause.Reason.CRASH_LOOP, pkg)
                    + " Tap to turn it back on.\n" + L10n.f("Build %1$s", L10n.isolate("unknown")), String.valueOf(card.getSummary()));
        }
    }

    /**
     * A version is a value set into a sentence, so both rows that show one isolate it: in a
     * right-to-left sentence "449.0.0.54.82" then keeps the order it was written in.
     */
    @Test
    public void theVersionRowsIsolateTheVersions() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(context.getPackageManager())
                .getInternalMutablePackageInfo(context.getPackageName()).versionName = "449.0.0.54.82";
        String threads = app.morphe.extension.shared.Utils.getAppVersionName();
        assertTrue("no Threads version to look for", threads != null && !threads.isEmpty());

        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rowsOf(controller);
            Preference card = rows.get(0);
            assertEquals("HushThreads is on", String.valueOf(card.getTitle()));
            assertTrue(String.valueOf(card.getSummary()), String.valueOf(card.getSummary()).contains(L10n.isolate(threads)));
            assertTrue(String.valueOf(card.getSummary()), String.valueOf(card.getSummary()).contains(L10n.isolate("unknown")));
            Preference version = null;
            for (Preference row : rows) {
                if ("Version".contentEquals(row.getTitle())) version = row;
            }
            assertNotNull("no Version row", version);
            assertTrue(String.valueOf(version.getSummary()), String.valueOf(version.getSummary()).contains(L10n.isolate(threads)));
            assertTrue(String.valueOf(version.getSummary()), String.valueOf(version.getSummary()).contains(L10n.isolate("unknown")));
        }
    }

    /**
     * The page's own dialogs are drawn over its activity's window: the list of sections and
     * Licenses. Open when the page went, on a rotation, Back or Threads closing, they outlived that
     * window, which Android reports as a leaked window.
     */
    @Test
    public void thePagesDialogsCloseWhenItsViewGoes() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rowsOf(controller);
            List<AlertDialog> open = new ArrayList<>();
            Preference jump = rows.get(indexOfKey(rows, "action_jump_to_section"));
            jump.getOnPreferenceClickListener().onPreferenceClick(jump);
            open.add(ShadowAlertDialog.getLatestAlertDialog());
            Preference licenses = null;
            for (Preference row : rows) if ("Licenses".contentEquals(row.getTitle())) licenses = row;
            assertNotNull("no Licenses row", licenses);
            licenses.getOnPreferenceClickListener().onPreferenceClick(licenses);
            open.add(ShadowAlertDialog.getLatestAlertDialog());

            List<String> titles = new ArrayList<>();
            for (AlertDialog dialog : open) {
                assertTrue(dialog.isShowing());
                titles.add(String.valueOf(Shadows.shadowOf(dialog).getTitle()));
            }
            assertEquals(Arrays.asList("Jump to a section", "Licenses"), titles);

            controller.recreate();
            ShadowLooper.idleMainLooper();

            for (AlertDialog dialog : open) {
                assertFalse(Shadows.shadowOf(dialog).getTitle() + " outlived the page", dialog.isShowing());
            }
        }
    }

    private static int indexOfKey(List<Preference> rows, String key) {
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rows.get(i).getKey())) return i;
        }
        return -1;
    }

    private static HushThreadsPreferenceFragment pageOf(ActivityController<Activity> controller) {
        HushThreadsPreferenceFragment fragment = new HushThreadsPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction()
                .add(android.R.id.content, fragment)
                .commitNow();
        return fragment;
    }

    private static List<Preference> rowsOf(ActivityController<Activity> controller) {
        List<Preference> rows = new ArrayList<>();
        collect(pageOf(controller).getPreferenceScreen(), rows);
        assertFalse("the screen has no rows", rows.isEmpty());
        return rows;
    }

    /** The titles of the page's sections, in the order they're drawn. */
    private static List<String> sections(HushThreadsPreferenceFragment page) {
        List<String> titles = new ArrayList<>();
        PreferenceGroup screen = page.getPreferenceScreen();
        for (int i = 0; i < screen.getPreferenceCount(); i++) {
            if (screen.getPreference(i) instanceof PreferenceCategory) {
                titles.add(String.valueOf(screen.getPreference(i).getTitle()));
            }
        }
        return titles;
    }

    private static void assertReadable(List<Preference> rows) {
        for (Preference row : rows) {
            CharSequence title = row.getTitle();
            assertTrue("a row has no title: " + row.getClass().getSimpleName() + " " + row.getKey(),
                    title != null && title.toString().trim().length() > 0);

            TypedArray styled = row.getContext().obtainStyledAttributes(
                    new int[]{android.R.attr.textColorPrimary});
            try {
                ColorStateList primary = styled.getColorStateList(0);
                assertTrue("no primary text color for " + title, primary != null);
                assertTrue("\"" + title + "\" is drawn dark on the black page",
                        Color.luminance(primary.getDefaultColor()) > 0.5f);
            } finally {
                styled.recycle();
            }
        }
    }

    private static void collect(PreferenceGroup group, List<Preference> rows) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference preference = group.getPreference(i);
            if (preference instanceof PreferenceGroup) {
                collect((PreferenceGroup) preference, rows);
            } else {
                rows.add(preference);
            }
        }
    }
}
