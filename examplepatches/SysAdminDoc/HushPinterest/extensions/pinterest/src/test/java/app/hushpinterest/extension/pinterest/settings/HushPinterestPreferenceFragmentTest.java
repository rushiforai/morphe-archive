/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Typeface;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;
import android.text.Spanned;
import android.text.style.StyleSpan;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

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
 * The settings screen as it draws inside Pinterest: a black page whose rows must be readable, and a
 * row for each patch this build carries and none for the rest.
 *
 * <p>On a phone on 2026-09-24 every row title was near-black on black, because the rows took the
 * host's light activity theme, and the two diagnostics rows had no text at all.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class HushPinterestPreferenceFragmentTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Wording that tells the reader a paused Pinterest is an unpatched one, which it isn't. */
    private static final Pattern UNPATCHED = Pattern.compile("(?i)unpatched|n't patched|not patched|as if it weren");

    /** The row each patch adds, by the title it shows. */
    private static final Map<PatchFamily, String> ROW_TITLES = new LinkedHashMap<>();

    @Before
    public void initializeRowTitlesAfterTheContextIsReady() {
        ROW_TITLES.clear();
        ROW_TITLES.put(PatchFamily.HIDE_ADS, "Hide ads");
        ROW_TITLES.put(PatchFamily.HIDE_AI_PINS, "Hide AI-labeled pins");
        ROW_TITLES.put(PatchFamily.HIDE_SHOPPING, "Hide shopping and product pins");
        ROW_TITLES.put(PatchFamily.DISABLE_ANALYTICS, "Disable analytics");
        ROW_TITLES.put(PatchFamily.STRIP_LINK_TRACKING, "Strip link tracking");
        ROW_TITLES.put(PatchFamily.HIDE_ADVERTISING_ID, "Hide advertising ID");
        ROW_TITLES.put(PatchFamily.DOWNLOAD_PINS, "Download pins");
        ROW_TITLES.put(PatchFamily.EXTERNAL_BROWSER, "Open links in your browser");
        ROW_TITLES.put(PatchFamily.SYSTEM_SHARE, "System share sheet");
        ROW_TITLES.put(PatchFamily.HIDE_SCREENSHOT_SHARE, "No screenshot share menu");
        ROW_TITLES.put(PatchFamily.HIDE_SEARCH_HISTORY, "Hide search history");
        ROW_TITLES.put(PatchFamily.HIDE_NAVIGATION_BUTTONS, "Hide Create button");
        ROW_TITLES.put(PatchFamily.HIDE_HEADER_BUTTONS, "Hide header buttons");
        ROW_TITLES.put(PatchFamily.HIDE_PIN_MENU_ITEMS, "Hide collage menu items");
        ROW_TITLES.put(PatchFamily.HIDE_COMMENTS, "Hide comments");
        ROW_TITLES.put(PatchFamily.QUIET_EMAIL_REMINDER, "Quiet email reminders");
        ROW_TITLES.put(PatchFamily.HIDE_SAVE_TOASTS, "Hide save toasts");
        ROW_TITLES.put(PatchFamily.ORIGINAL_IMAGES, "Original-quality images");
        ROW_TITLES.put(PatchFamily.DISABLE_UPDATE_NAG, "Disable update nag");
    }

    /** The sections every build has, in the order they're drawn. */
    private static final List<String> EVERY_BUILD = Arrays.asList(
            "Links", "Updates", "Pause, backup and diagnostics", "About");

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        PatchFamily.staysWhilePausedForTests = null;
        PatchFamily.capabilitiesForTests = null;
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
    public void withEveryPatchInEveryRowIsReadableAndNoneCallsAPausedPinterestUnpatched() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        // A simulated additional patch-time edit exercises the same row as Firebase's real flag.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADS,
                "the sponsored message cache cleared when you patched");
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
                assertFalse("\"" + text + "\" says a paused Pinterest is unpatched", UNPATCHED.matcher(text).find());
                if (row instanceof SwitchPreference && switchKeys.contains(row.getKey())) shown.add(row.getKey());
                if (HushPinterestPreferenceFragment.STAYS_WHILE_PAUSED.contentEquals(row.getTitle())) stays = row;
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
                HushPinterestPreferenceFragment page = pageOf(controller);
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
                if (!Collections.disjoint(build, PatchFamily.FEED_PAGE)) expected.add("Feed");
                if (!Collections.disjoint(build, PatchFamily.PRIVACY_PAGE)) expected.add("Privacy");
                if (!Collections.disjoint(build, PatchFamily.ACTIONS_PAGE)) expected.add("Pin actions");
                if (!Collections.disjoint(build, PatchFamily.INTERFACE_PAGE)) expected.add("Interface");
                expected.addAll(EVERY_BUILD);
                if (!expected.equals(sections)) wrong.add(build + ": sections " + sections);
            }
        }
        assertEquals(Collections.emptyList(), wrong);
    }

    /** Each patch's row says what it does, in Pinterest's own words. */
    @Test
    public void eachPatchsRowSaysWhatItDoes() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushPinterestPreferenceFragment page = pageOf(controller);
            assertEquals("Hide ads", String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getTitle()));
            assertEquals("Promoted pins leave the home feed, search, related pins and boards before they're shown, "
                            + "and ad-only panels stay folded away.",
                    String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getSummary()));
            assertEquals("Hide AI-labeled pins", String.valueOf(page.findPreference(Settings.HIDE_AI_PINS.key).getTitle()));
            assertEquals("Pins that Pinterest labels as made or changed with AI leave the same lists. "
                            + "AI images without Pinterest's label still show.",
                    String.valueOf(page.findPreference(Settings.HIDE_AI_PINS.key).getSummary()));
            // Both switches ship on: picking the patch in Morphe Manager is the choice to use it.
            for (BooleanSetting setting : Arrays.asList(Settings.HIDE_ADS, Settings.HIDE_AI_PINS)) {
                assertTrue(setting.key, ((SwitchPreference) page.findPreference(setting.key)).isChecked());
            }
            List<Preference> rows = new ArrayList<>();
            collect(page.getPreferenceScreen(), rows);
            for (Preference row : rows) {
                String text = row.getTitle() + " " + row.getSummary();
                assertFalse("\"" + text + "\" names Facebook, Meta, Instagram, Threads or Telegram",
                        text.contains("Facebook") || text.contains("Meta") || text.contains("Instagram") || text.contains("Threads")
                                || text.contains("Telegram"));
            }
        }
    }

    /** Partial target matches used to show the complete-build promise beside the family switch. */
    @Test
    public void partialBuildRowsNameTheirSurvivingAndMissingCoverage() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        for (PatchFamily.Capability missing : PatchFamily.Capability.values()) {
            Set<PatchFamily.Capability> installed = EnumSet.allOf(PatchFamily.Capability.class);
            installed.remove(missing);
            PatchFamily.capabilitiesForTests = installed;
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                HushPinterestPreferenceFragment page = pageOf(controller);
                String summary = String.valueOf(page.findPreference(missing.family.switches.get(0).key).getSummary());
                if (missing.family.expectedCapabilities().size() == 1) {
                    assertEquals("This build has no coverage for " + missing.label + ".", summary);
                } else {
                    assertTrue(summary, summary.startsWith("This build covers "));
                    assertTrue(summary, summary.endsWith("Missing coverage: " + missing.label + "."));
                    for (PatchFamily.Capability covered : missing.family.expectedCapabilities()) {
                        if (covered != missing) assertTrue(summary, summary.contains(covered.label));
                    }
                }
                assertTrue("a build family's configuration switch was disabled", page.findPreference(missing.family.switches.get(0).key).isEnabled());
            }
        }

        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushPinterestPreferenceFragment page = pageOf(controller);
            assertEquals("This build has no coverage for "
                            + L10n.join(Arrays.asList("promoted pins in lists", "ad-only views", "Google ad SDK start")) + ".",
                    String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getSummary()));
            assertEquals("This build has no coverage for AI-labeled pins in lists.",
                    String.valueOf(page.findPreference(Settings.HIDE_AI_PINS.key).getSummary()));
        }
    }

    @Test
    public void thePausedCardSaysWhatStaysInForEveryReason() {
        for (HushPinterestPause.Reason why : HushPinterestPause.Reason.values()) {
            String summary = HushPinterestPreferenceFragment.pausedSummary(why, "com.pinterest");
            assertFalse(why + ": " + summary, UNPATCHED.matcher(summary).find());
            assertTrue(why + ": " + summary, summary.contains("what was set when you patched stays in"));
            // Debug logging is kept as saved while paused, so the card can't say every switch is off.
            assertTrue(why + ": " + summary, summary.contains("Every switch but Debug logging"));
        }

        // The marker counts only in the app's own files folder, and the card names that folder,
        // not the one above it a person finds first. The folder is isolated, so a right-to-left
        // sentence keeps the path in the order it was written.
        String pkg = RuntimeEnvironment.getApplication().getPackageName();
        assertTrue(HushPinterestPreferenceFragment.pausedSummary(HushPinterestPause.Reason.MARKER_FILE, pkg)
                .contains("in " + L10n.isolate("Android/data/" + pkg + "/files") + " paused HushPinterest"));

        PauseForTests.pause(HushPinterestPause.Reason.CRASH_LOOP);
        // A crash-loop pause comes from safe mode, which stays on for the next start too. The card
        // reads that to say whether the next start still runs paused.
        BaseSettings.SAFE_MODE.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference card = rowsOf(controller).get(0);
            assertEquals("HushPinterest is paused", String.valueOf(card.getTitle()));
            assertEquals(HushPinterestPreferenceFragment.pausedSummary(HushPinterestPause.Reason.CRASH_LOOP, pkg)
                    + " Tap to turn it back on.", String.valueOf(card.getSummary()));
        }
    }

    /**
     * A version is a value set into a sentence, so the row that shows one isolates it: in a
     * right-to-left sentence "449.0.0.54.82" then keeps the order it was written in. The status
     * card leaves the versions to the About page and says only whether the controls are active.
     */
    @Test
    public void theVersionRowsIsolateTheVersions() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(context.getPackageManager())
                .getInternalMutablePackageInfo(context.getPackageName()).versionName = "449.0.0.54.82";
        String threads = app.hushpinterest.extension.shared.Utils.getAppVersionName();
        assertTrue("no Pinterest version to look for", threads != null && !threads.isEmpty());

        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rowsOf(controller);
            Preference card = rows.get(0);
            assertEquals("HushPinterest is on", String.valueOf(card.getTitle()));
            assertEquals("Your controls are active.", String.valueOf(card.getSummary()));
            Preference version = null;
            for (Preference row : rows) {
                if ("Version".contentEquals(row.getTitle())) version = row;
            }
            assertNotNull("no Version row", version);
            assertTrue(String.valueOf(version.getSummary()), String.valueOf(version.getSummary()).contains(L10n.isolate(threads)));
        }
    }

    /**
     * The page's own dialogs are drawn over its activity's window: the list of sections and
     * Licenses. Open when the page went, on a rotation, Back or Pinterest closing, they outlived that
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

    /**
     * NOTICE's underlined headings read as rows of = and - on a phone. On screen each heading is
     * bold and the rules are gone, and every word of the notice is still there.
     */
    @Test
    public void theLicensesDialogShowsHeadingsInsteadOfRules() {
        CharSequence shown = HushPinterestPreferenceFragment.noticeForScreen(LicenseNotice.TEXT, Color.WHITE);
        String text = shown.toString();
        assertFalse("a rule line is still on screen", Pattern.compile("(?m)^[=-]{3,}$").matcher(text).find());
        assertFalse("removing the rules left a gap wider than NOTICE's own", text.contains("\n\n\n\n"));
        assertEquals("words went missing", LicenseNotice.TEXT.replaceAll("(?m)^[=-]{3,}$", "").replaceAll("\\s+", " ").trim(),
                text.replaceAll("\\s+", " ").trim());

        Spanned spans = (Spanned) shown;
        List<String> bold = new ArrayList<>();
        for (StyleSpan span : spans.getSpans(0, spans.length(), StyleSpan.class)) {
            if (span.getStyle() == Typeface.BOLD) bold.add(text.substring(spans.getSpanStart(span), spans.getSpanEnd(span)));
        }
        assertTrue(bold.toString(), bold.containsAll(Arrays.asList(
                "HushPinterest NOTICE", "Morphe: Project Name Restriction", "Trademarks", "Material Design icons")));
    }

    private static int indexOfKey(List<Preference> rows, String key) {
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rows.get(i).getKey())) return i;
        }
        return -1;
    }

    private static HushPinterestPreferenceFragment pageOf(ActivityController<Activity> controller) {
        HushPinterestPreferenceFragment fragment = new HushPinterestPreferenceFragment();
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
    private static List<String> sections(HushPinterestPreferenceFragment page) {
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
