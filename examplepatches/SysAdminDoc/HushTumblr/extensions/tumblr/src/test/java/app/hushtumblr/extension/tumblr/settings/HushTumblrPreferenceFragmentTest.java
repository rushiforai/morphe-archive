/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
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
package app.hushtumblr.extension.tumblr.settings;

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

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.settings.BaseSettings;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;

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
 * The settings screen as it draws inside Tumblr: a black page whose rows must be readable, and a
 * row for each patch this build carries and none for the rest.
 *
 * <p>On a phone on 2026-09-24 every row title was near-black on black, because the rows took the
 * host's light activity theme, and the two diagnostics rows had no text at all.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class HushTumblrPreferenceFragmentTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Wording that tells the reader a paused Tumblr is an unpatched one, which it isn't. */
    private static final Pattern UNPATCHED = Pattern.compile("(?i)unpatched|n't patched|not patched|as if it weren");

    /** The row each patch adds, by the title it shows. */
    private static final Map<PatchFamily, String> ROW_TITLES = new LinkedHashMap<>();

    @Before
    public void initializeRowTitlesAfterTheContextIsReady() {
        ROW_TITLES.clear();
        ROW_TITLES.put(PatchFamily.HIDE_ADS, "Hide ads");
        ROW_TITLES.put(PatchFamily.DISABLE_ANALYTICS, "Disable analytics");
        ROW_TITLES.put(PatchFamily.HIDE_ADVERTISING_ID, "Hide advertising ID");
        ROW_TITLES.put(PatchFamily.REMOVE_AD_TRACKING_PERMISSIONS, "Remove ad tracking permissions");
        ROW_TITLES.put(PatchFamily.SPOOF_SIGNATURE, "Spoof signature for Google sign-in");
        ROW_TITLES.put(PatchFamily.HIDE_AD_FREE_BANNER, "Hide the ad-free banner");
        ROW_TITLES.put(PatchFamily.HIDE_TUMBLR_TV, "Hide Tumblr TV");
        ROW_TITLES.put(PatchFamily.HIDE_COMMUNITIES_TAB, "Hide the Communities tab");
        ROW_TITLES.put(PatchFamily.HIDE_BLAZE_PROMPTS, "Hide Blaze prompts");
        ROW_TITLES.put(PatchFamily.SKIP_REVIEW_PROMPTS, "Skip review prompts");
        ROW_TITLES.put(PatchFamily.HIDE_BLOG_NOTIFICATION_REMINDERS, "Hide blog notification reminders");
        ROW_TITLES.put(PatchFamily.HIDE_GIFT_MESSAGE_POPUPS, "Hide gift purchase popups");
        ROW_TITLES.put(PatchFamily.LINE_BETWEEN_POSTS, "Line between posts");
        ROW_TITLES.put(PatchFamily.APP_FONT, "App font");
        ROW_TITLES.put(PatchFamily.TURN_OFF_SCREENSHOT_SHARING, "Turn off screenshot sharing");
        ROW_TITLES.put(PatchFamily.DISABLE_UPDATE_PROMPTS, "Disable update prompts");
        ROW_TITLES.put(PatchFamily.HIDE_SUGGESTED_BLOGS, "Hide suggested blogs");
        ROW_TITLES.put(PatchFamily.HIDE_SUGGESTED_COMMUNITIES, "Hide suggested communities");
        ROW_TITLES.put(PatchFamily.HIDE_SUGGESTED_TAGS, "Hide suggested tags");
        ROW_TITLES.put(PatchFamily.HIDE_WATCH_IT_ROWS, "Hide Watch it rows");
        ROW_TITLES.put(PatchFamily.HIDE_HASHTAGS, "Hide hashtags");
        ROW_TITLES.put(PatchFamily.HIDE_FOLLOW_BUTTON, "Hide the Follow button");
        ROW_TITLES.put(PatchFamily.HIDE_TUMBLRMART, "Hide the diamond and TumblrMart");
        ROW_TITLES.put(PatchFamily.HIDE_NOTE_COUNTS, "Hide note counts");
        ROW_TITLES.put(PatchFamily.HIDE_LIKE_BUTTON, "Hide the like button");
        ROW_TITLES.put(PatchFamily.HIDE_REBLOG_BUTTON, "Hide the reblog button");
        ROW_TITLES.put(PatchFamily.HIDE_COMMENT_BUTTON, "Hide the comment button");
        ROW_TITLES.put(PatchFamily.HIDE_SHARE_BUTTON, "Hide the share button");
        ROW_TITLES.put(PatchFamily.HIDE_SAVE_BUTTON, "Hide the Save button");
        // One row per tab's badge; the first stands for the patch.
        ROW_TITLES.put(PatchFamily.HIDE_UNREAD_DOTS, "Hide the Dashboard count");
        ROW_TITLES.put(PatchFamily.HIDE_REBLOGS, "Hide reblogs");
        ROW_TITLES.put(PatchFamily.HIDE_VIDEO_POSTS, "Hide video posts");
        ROW_TITLES.put(PatchFamily.HIDE_PHOTO_POSTS, "Hide photo posts");
        ROW_TITLES.put(PatchFamily.HIDE_TEXT_POSTS, "Hide text posts");
        ROW_TITLES.put(PatchFamily.HIDE_POSTS_WITH_WORDS, "Hide posts with these words");
        ROW_TITLES.put(PatchFamily.HIDE_FILTERED_POSTS, "Hide filtered posts");
        ROW_TITLES.put(PatchFamily.DARK_BACKGROUND, "Dark background color");
        ROW_TITLES.put(PatchFamily.HIDE_EXPLORE_TAB, "Hide the Explore tab");
        ROW_TITLES.put(PatchFamily.HIDE_NOTIFICATIONS_TAB, "Hide the Notifications tab");
        ROW_TITLES.put(PatchFamily.REORDER_TABS, "Reorder the bottom bar");
        ROW_TITLES.put(PatchFamily.FIX_PUSH_NOTIFICATIONS, "Fix push notifications");
        ROW_TITLES.put(PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS, "Hide likes");
        ROW_TITLES.put(PatchFamily.SHOW_POST_TIMESTAMPS, "Show post timestamps");
        ROW_TITLES.put(PatchFamily.VISIBLE_ALT_TEXT, "Visible image descriptions");
        ROW_TITLES.put(PatchFamily.MUTE_ROOT_POSTS, "Mute posts locally");
        ROW_TITLES.put(PatchFamily.SHOW_MUTUAL_MARKERS, "Show mutual markers");
        ROW_TITLES.put(PatchFamily.REVEAL_ALLOWED_MATURE_CONTENT, "Reveal allowed mature content");
    }

    /** The sections every build has, in the order they're drawn. */
    private static final List<String> EVERY_BUILD = Arrays.asList(
            "Links", "Tumblr's own settings", "Updates", "Pause, backup and diagnostics", "About");

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
    public void withEveryPatchInEveryRowIsReadableAndNoneCallsAPausedTumblrUnpatched() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        // A simulated additional patch-time edit exercises the same row as Firebase's real flag.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADVERTISING_ID,
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
                assertFalse("\"" + text + "\" says a paused Tumblr is unpatched", UNPATCHED.matcher(text).find());
                if (row instanceof SwitchPreference && switchKeys.contains(row.getKey())) shown.add(row.getKey());
                if (HushTumblrPreferenceFragment.STAYS_WHILE_PAUSED.contentEquals(row.getTitle())) stays = row;
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
                    String.valueOf(rows.get(pause).getSummary()).contains("every HushTumblr switch except Debug logging the next time Tumblr starts. What you chose when you patched stays"));
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
        Map<String, PatchFamily> editors = new LinkedHashMap<>();
        editors.put(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW, PatchFamily.HIDE_POSTS_WITH_WORDS);
        editors.put(HushTumblrPreferenceFragment.ALLOWED_WORDS_ROW, PatchFamily.HIDE_POSTS_WITH_WORDS);
        editors.put(HushTumblrPreferenceFragment.TAB_ORDER_ROW, PatchFamily.REORDER_TABS);
        editors.put(HushTumblrPreferenceFragment.FONT_FILE_ROW, PatchFamily.APP_FONT);
        editors.put(HushTumblrPreferenceFragment.PHONE_FONT_ROW, PatchFamily.APP_FONT);
        editors.put("hushtumblr_manage_root_mutes", PatchFamily.MUTE_ROOT_POSTS);

        List<String> wrong = new ArrayList<>();
        for (Set<PatchFamily> build : builds) {
            PatchFamily.inBuildForTests = build;
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                HushTumblrPreferenceFragment page = pageOf(controller);
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
                for (Map.Entry<String, PatchFamily> editor : editors.entrySet()) {
                    boolean drawn = page.findPreference(editor.getKey()) != null;
                    if (drawn != build.contains(editor.getValue())) {
                        wrong.add(build + ": " + editor.getKey() + (drawn ? " is drawn" : " isn't drawn"));
                    }
                }

                List<String> sections = sections(page);
                List<String> expected = new ArrayList<>();
                if (!Collections.disjoint(build, PatchFamily.FEED_PAGE)) expected.add("Feed");
                if (!Collections.disjoint(build, PatchFamily.POSTS_PAGE)) expected.add("Posts");
                if (!Collections.disjoint(build, PatchFamily.INTERFACE_PAGE)) expected.add("Interface");
                if (!Collections.disjoint(build, PatchFamily.PRIVACY_PAGE)) expected.add("Privacy");
                expected.addAll(EVERY_BUILD);
                // Either notification patch needs this section, right after Links.
                if (build.contains(PatchFamily.FIX_PUSH_NOTIFICATIONS)
                        || build.contains(PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS)) {
                    expected.add(expected.indexOf("Links") + 1, "Notifications");
                }
                if (!expected.equals(sections)) wrong.add(build + ": sections " + sections);
            }
        }
        assertEquals(Collections.emptyList(), wrong);
    }

    /** Each patch's row says what it does, in Tumblr's own words. */
    @Test
    public void eachPatchsRowSaysWhatItDoes() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = pageOf(controller);
            assertEquals("Hide advertising ID", String.valueOf(page.findPreference(Settings.HIDE_ADVERTISING_ID.key).getTitle()));
            assertEquals("Tumblr and the ad companies inside it see an empty advertising ID with ad tracking limited, "
                + "as if you deleted your ad ID in Android settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_ADVERTISING_ID.key).getSummary()));
            assertEquals("Fix push notifications", String.valueOf(page.findPreference(Settings.FIX_PUSH_NOTIFICATIONS.key).getTitle()));
            assertEquals("Lets a patched Tumblr sign up for push notifications when Google would turn it away.",
                    String.valueOf(page.findPreference(Settings.FIX_PUSH_NOTIFICATIONS.key).getSummary()));
            // Both are in Manager's default selection and ship on: a patched build gets no push
            // notifications at all without the second one.
            assertTrue(((SwitchPreference) page.findPreference(Settings.HIDE_ADVERTISING_ID.key)).isChecked());
            assertTrue(((SwitchPreference) page.findPreference(Settings.FIX_PUSH_NOTIFICATIONS.key)).isChecked());
            assertEquals("Hide ads", String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getTitle()));
            assertEquals("Takes ads and paid Blaze posts out of your dashboard and other feeds. Ad requests stop "
                + "after Tumblr restarts.", String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getSummary()));
            assertTrue(((SwitchPreference) page.findPreference(Settings.HIDE_ADS.key)).isChecked());
            List<Preference> rows = new ArrayList<>();
            collect(page.getPreferenceScreen(), rows);
            for (Preference row : rows) {
                String text = row.getTitle() + " " + row.getSummary();
                assertFalse("\"" + text + "\" names Facebook, Meta, Instagram, Threads, Telegram or Pinterest",
                        text.contains("Facebook") || text.contains("Meta") || text.contains("Instagram") || text.contains("Threads")
                                || text.contains("Telegram") || text.contains("Pinterest"));
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
                HushTumblrPreferenceFragment page = pageOf(controller);
                String summary = String.valueOf(page.findPreference(missing.family.switches.get(0).key).getSummary());
                if (missing.family.expectedCapabilities().size() == 1) {
                    assertEquals("This build doesn't include the parts that handle " + missing.label + ".", summary);
                } else {
                    assertTrue(summary, summary.startsWith("This build handles "));
                    assertTrue(summary, summary.endsWith("It's missing the parts for " + missing.label + "."));
                    for (PatchFamily.Capability covered : missing.family.expectedCapabilities()) {
                        if (covered != missing) assertTrue(summary, summary.contains(covered.label));
                    }
                }
                assertTrue("a build family's configuration switch was disabled", page.findPreference(missing.family.switches.get(0).key).isEnabled());
            }
        }

        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = pageOf(controller);
            assertEquals("This build doesn't include the parts that handle Hide advertising ID.",
                    String.valueOf(page.findPreference(Settings.HIDE_ADVERTISING_ID.key).getSummary()));
            assertEquals("This build doesn't include the parts that handle Fix push notifications.",
                    String.valueOf(page.findPreference(Settings.FIX_PUSH_NOTIFICATIONS.key).getSummary()));
        }
    }

    @Test
    public void thePausedCardSaysWhatStaysInForEveryReason() {
        for (HushTumblrPause.Reason why : HushTumblrPause.Reason.values()) {
            String summary = HushTumblrPreferenceFragment.pausedSummary(why, "com.tumblr");
            assertFalse(why + ": " + summary, UNPATCHED.matcher(summary).find());
            assertTrue(why + ": " + summary, summary.contains("what was set when you patched stays in"));
            // Debug logging is kept as saved while paused, so the card can't say every switch is off.
            assertTrue(why + ": " + summary, summary.contains("Every switch but Debug logging"));
        }

        // The marker counts only in the app's own files folder, and the card names that folder,
        // not the one above it a person finds first. The folder is isolated, so a right-to-left
        // sentence keeps the path in the order it was written.
        String pkg = RuntimeEnvironment.getApplication().getPackageName();
        assertTrue(HushTumblrPreferenceFragment.pausedSummary(HushTumblrPause.Reason.MARKER_FILE, pkg)
                .contains("in " + L10n.isolate("Android/data/" + pkg + "/files") + " paused HushTumblr"));

        PauseForTests.pause(HushTumblrPause.Reason.CRASH_LOOP);
        // A crash-loop pause comes from safe mode, which stays on for the next start too. The card
        // reads that to say whether the next start still runs paused.
        BaseSettings.SAFE_MODE.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference card = rowsOf(controller).get(0);
            assertEquals("HushTumblr is paused", String.valueOf(card.getTitle()));
            assertEquals(HushTumblrPreferenceFragment.pausedSummary(HushTumblrPause.Reason.CRASH_LOOP, pkg)
                    + " Tap to turn it back on.", String.valueOf(card.getSummary()));
        }
    }

    /**
     * A version is a value set into a sentence, so the row that shows one isolates it: in a
     * right-to-left sentence "46.5.0.109" then keeps the order it was written in. The status
     * card leaves the versions to the About page and says only whether the controls are active.
     */
    @Test
    public void theVersionRowsIsolateTheVersions() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(context.getPackageManager())
                .getInternalMutablePackageInfo(context.getPackageName()).versionName = "46.5.0.109";
        String tumblr = app.hushtumblr.extension.shared.Utils.getAppVersionName();
        assertTrue("no Tumblr version to look for", tumblr != null && !tumblr.isEmpty());

        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rowsOf(controller);
            Preference card = rows.get(0);
            assertEquals("HushTumblr is on", String.valueOf(card.getTitle()));
            assertEquals("Your switches are working.", String.valueOf(card.getSummary()));
            Preference version = null;
            for (Preference row : rows) {
                if ("Version".contentEquals(row.getTitle())) version = row;
            }
            assertNotNull("no Version row", version);
            assertTrue(String.valueOf(version.getSummary()), String.valueOf(version.getSummary()).contains(L10n.isolate(tumblr)));
        }
    }

    /**
     * The page's own dialogs are drawn over its activity's window: the list of sections and
     * Licenses. Open when the page went, on a rotation, Back or Tumblr closing, they outlived that
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
        CharSequence shown = HushTumblrPreferenceFragment.noticeForScreen(LicenseNotice.TEXT, Color.WHITE);
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
                "HushTumblr NOTICE", "Morphe: Project Name Restriction", "Trademarks", "Material Design icons")));
    }

    private static int indexOfKey(List<Preference> rows, String key) {
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rows.get(i).getKey())) return i;
        }
        return -1;
    }

    private static HushTumblrPreferenceFragment pageOf(ActivityController<Activity> controller) {
        HushTumblrPreferenceFragment fragment = new HushTumblrPreferenceFragment();
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
    private static List<String> sections(HushTumblrPreferenceFragment page) {
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
