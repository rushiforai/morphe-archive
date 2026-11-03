/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.download.AdvancedDownloadsTest;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.pinedrama.settings.preference.categories.InterfacePreferenceCategory;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Every row on the Feed screen page, with the windows it reaches: the main feed (For You,
 * Following and the other top tabs), the detail pager a video opens in from a profile, a hashtag,
 * a sound or search, and a LIVE room.
 *
 * <p>#47 and #50 were the same gap twice: a switch written for the main feed, and a user finding
 * it missing on videos opened from a profile. Coverage was decided one switch at a time and
 * written down nowhere. Now a new row fails here until it says where it works, and a switch that
 * leaves out a window where PineDrama draws the thing it changes says so on its own row.
 *
 * <p>The entries come from reading each switch's hook, 2026-10-10. A hook on a model getter, a
 * gate or a parser that every window goes through counts as reaching every window that shows the
 * thing. The ones the code can't settle are {@link Reach#UNCHECKED}, and only the rows in
 * {@link #WAITING_FOR_A_DEVICE} may say that, so the list can only shrink.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33)
public class FeedScreenCoverageTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Reach {
        /** The switch works there. */
        YES,
        /** PineDrama draws the thing there and the switch leaves it be: the row has to say so. */
        NO,
        /** PineDrama doesn't draw the thing there, so there is nothing to reach. */
        NONE,
        /** The code can't say; a phone has to. */
        UNCHECKED
    }

    static final class Coverage {
        final Reach main, detail, live;
        /** For a row with a NO, the words on the row that say which window it leaves out. */
        final String saysSo;

        Coverage(Reach main, Reach detail, Reach live, String saysSo) {
            this.main = main;
            this.detail = detail;
            this.live = live;
            this.saysSo = saysSo;
        }

        boolean any(Reach reach) {
            return main == reach || detail == reach || live == reach;
        }
    }

    private static final Reach YES = Reach.YES, NONE = Reach.NONE, UNCHECKED = Reach.UNCHECKED;

    /**
     * The rows whose reach in one window only a phone can settle. Each needs a look with the
     * switch on, in a video opened from a profile or search (or a LIVE room for the LIVE ones),
     * after which its entry says YES, NO or NONE and it comes off this list.
     */
    static final Set<String> WAITING_FOR_A_DEVICE = Set.of(
            "hide_feed_search_button", "hide_playlist_bar", "hide_event_badge",
            "hide_inserted_cards");

    static final Map<String, Coverage> TABLE = new LinkedHashMap<>();

    private static void put(String key, Reach main, Reach detail, Reach live) {
        put(key, main, detail, live, null);
    }

    private static void put(String key, Reach main, Reach detail, Reach live, String saysSo) {
        if (TABLE.put(key, new Coverage(main, detail, live, saysSo)) != null) {
            throw new IllegalStateException("two entries for " + key);
        }
    }

    static {
        put("hide_feed_follow_button", YES, YES, NONE);
        put("hide_feed_save_button", YES, YES, NONE);

        put("always_show_publish_date", YES, YES, NONE);
        put("publish_date_exact_time", YES, YES, NONE);
        // Both only shape the exact time, so they reach where it does.
        put("publish_date_time_zone", YES, YES, NONE);
        put("publish_date_short_date", YES, YES, NONE);
        // Profile grids only.
        put("publish_date_on_grid", NONE, NONE, NONE);
        put("video_length_on_grid", NONE, NONE, NONE);
        // The order of the profile and Liked grids, which neither window draws (#180).
        put("profile_grid_sort", NONE, NONE, NONE);
        put("liked_grid_sort", NONE, NONE, NONE);

        // Whether an opened video shows a search button of its own is the open part.
        put("hide_feed_search_button", YES, UNCHECKED, NONE);
        put("hide_bottom_search_bar", YES, YES, NONE);
        put("hide_playlist_bar", YES, UNCHECKED, NONE);
        put("hide_event_badge", YES, UNCHECKED, NONE);
        put("hide_inserted_cards", YES, UNCHECKED, NONE);

        // Popups. The promotion and popup hooks sit where PineDrama parses or raises them, which
        // every window goes through.
        put("hide_homepage_coin", YES, YES, NONE);
        put("hide_sensitive_warnings", YES, YES, NONE);
        put("hide_unverified_notices", YES, YES, NONE);
        // A feed cell slot both pagers build, and a prompt every video share package goes through.
        put("hide_check_your_sources", YES, YES, NONE);

        // Clear display follows TikTok's own mode in either window (#84).
        put("automatic_clear_display", YES, YES, NONE);
        put("automatic_clear_display_delay", YES, YES, NONE);
        put("remember_clear_display_on_scroll", YES, YES, NONE);

        put("enable_long_press_speed_lock", YES, YES, NONE);
        put("disable_long_press_quick_share", YES, YES, NONE);
        put("disable_long_press_repost", YES, YES, NONE);
    }

    private final Map<Field, Boolean> statuses = new LinkedHashMap<>();

    @Before public void turnEveryPatchOn() throws Exception {
        for (Field field : SettingsStatus.class.getDeclaredFields()) {
            if (field.getType() == boolean.class && Modifier.isStatic(field.getModifiers())
                    && !Modifier.isFinal(field.getModifiers())) {
                field.setAccessible(true);
                statuses.put(field, field.getBoolean(null));
                field.setBoolean(null, true);
            }
        }
    }

    @After public void putThePatchesBack() throws Exception {
        for (Map.Entry<Field, Boolean> status : statuses.entrySet()) {
            status.getKey().setBoolean(null, status.getValue());
        }
    }

    /** The Feed screen page as a phone with every patch builds it, by key. */
    private static Map<String, Preference> page() {
        try (var controller = Robolectric.buildActivity(AdvancedDownloadsTest.TestActivity.class).setup()) {
            Activity activity = controller.get();
            Utils.setContext(activity);
            PreferenceScreen screen = ((android.preference.PreferenceActivity) activity)
                    .getPreferenceManager().createPreferenceScreen(activity);
            new InterfacePreferenceCategory(activity, screen);
            Map<String, Preference> rows = new LinkedHashMap<>();
            collect(screen, rows);
            return rows;
        }
    }

    private static void collect(Preference preference, Map<String, Preference> into) {
        if (preference.getKey() != null) {
            into.put(preference.getKey(), preference);
        }
        if (preference instanceof PreferenceGroup) {
            PreferenceGroup group = (PreferenceGroup) preference;
            for (int i = 0; i < group.getPreferenceCount(); i++) collect(group.getPreference(i), into);
        }
    }

    /** What's wrong between the page's rows and the table, in words a failure can print. */
    static List<String> problems(Map<String, CharSequence> summaries, Map<String, Coverage> table,
                                 Set<String> waiting) {
        List<String> problems = new ArrayList<>();
        for (String key : summaries.keySet()) {
            if (!table.containsKey(key)) {
                problems.add(key + " is on the Feed screen page with no entry saying which windows it reaches");
            }
        }
        for (String key : table.keySet()) {
            if (!summaries.containsKey(key)) problems.add(key + " has an entry but no row any more");
        }
        for (Map.Entry<String, Coverage> entry : table.entrySet()) {
            String key = entry.getKey();
            Coverage coverage = entry.getValue();
            CharSequence summary = summaries.get(key);
            String text = summary == null ? "" : summary.toString();
            if (coverage.any(Reach.NO)) {
                if (coverage.saysSo == null || coverage.saysSo.isEmpty()) {
                    problems.add(key + " leaves a window out and its entry doesn't say what the row tells the reader");
                } else if (summary != null && !text.contains(coverage.saysSo)) {
                    problems.add(key + " leaves a window out and its row doesn't say \"" + coverage.saysSo + "\"");
                }
            }
            // A home-feed control, absent from opened videos, is placed on the feed by its row.
            if (coverage.main == Reach.YES && coverage.detail == Reach.NONE && summary != null
                    && !text.contains("feed")) {
                problems.add(key + " is the main feed's alone and its row doesn't say it's on the feed");
            }
            if (coverage.any(Reach.UNCHECKED) && !waiting.contains(key)) {
                problems.add(key + " is unchecked but not on the list waiting for a phone");
            }
            if (!coverage.any(Reach.UNCHECKED) && waiting.contains(key)) {
                problems.add(key + " is settled, so it comes off the list waiting for a phone");
            }
        }
        for (String key : waiting) {
            if (!table.containsKey(key)) problems.add(key + " is waiting for a phone but has no entry");
        }
        return problems;
    }

    private static Map<String, CharSequence> summaries(Map<String, Preference> rows) {
        Map<String, CharSequence> summaries = new LinkedHashMap<>();
        for (Map.Entry<String, Preference> row : rows.entrySet()) {
            summaries.put(row.getKey(), row.getValue().getSummary());
        }
        return summaries;
    }

    @Test public void everyFeedScreenRowSaysWhichWindowsItReaches() {
        Map<String, Preference> rows = page();
        assertTrue("the page came out nearly empty, so the patch flags didn't take: " + rows.keySet(),
                rows.size() > 20);
        List<String> problems = problems(summaries(rows), TABLE, WAITING_FOR_A_DEVICE);
        assertEquals("Feed screen coverage:\n" + String.join("\n", problems), 0, problems.size());
    }

    /** Each rule above reports what it's for, so a green run means the table was read. */
    @Test public void theCoverageCheckCanActuallyFail() {
        Map<String, CharSequence> summaries = new LinkedHashMap<>();
        summaries.put("new_switch", "Hide a thing.");
        summaries.put("gap", "Hide a thing on videos.");
        summaries.put("toolbar", "Hide the top button.");
        summaries.put("guess", "Hide another thing.");
        Map<String, Coverage> table = new LinkedHashMap<>();
        table.put("gap", new Coverage(YES, Reach.NO, NONE, "Opened videos keep it."));
        table.put("toolbar", new Coverage(YES, NONE, NONE, null));
        table.put("guess", new Coverage(YES, UNCHECKED, NONE, null));
        table.put("gone", new Coverage(YES, YES, NONE, null));
        summaries.put("settled", "Hide one more thing.");
        table.put("settled", new Coverage(YES, YES, NONE, null));
        summaries.put("fine", "Hide the button at the top of the feed.");
        table.put("fine", new Coverage(YES, NONE, NONE, null));

        Set<String> found = new TreeSet<>();
        for (String problem : problems(summaries, table, Set.of("settled_long_ago", "settled"))) {
            found.add(problem.substring(0, problem.indexOf(' ')));
        }
        assertEquals(new TreeSet<>(Arrays.asList("gap", "gone", "guess", "new_switch", "settled",
                "settled_long_ago", "toolbar")), found);
    }

}
