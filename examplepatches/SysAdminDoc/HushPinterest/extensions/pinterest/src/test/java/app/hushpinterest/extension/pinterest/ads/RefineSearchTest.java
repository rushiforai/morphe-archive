/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * Filter feed's Hide Refine your search on the shared list hook, against stand-ins shaped like the
 * stories a 14.45.0 results page for "living room ideas" logged, each field named the way Pinterest's
 * renamed Gson annotation names it (#48).
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class RefineSearchTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    @interface Json {
        String value();
    }

    static final class Pin {
        @Json("id") String id;
        @Json("grid_title") String gridTitle = "";

        Pin(String id) {
            this.id = id;
        }

        @Override public String toString() {
            return id;
        }
    }

    /** A story on the results page holding its searches, the way the report's page lines showed each module. */
    static final class Story {
        @Json("id") String id;
        @Json("story_type") String storyType;
        @Json("objects") List<Object> objects = new ArrayList<>();

        Story(String id, String storyType) {
            this.id = id;
            this.storyType = storyType;
        }

        @Override public String toString() {
            return id;
        }
    }

    /** The story kinds as a typed model keeps them, an enum constant rather than the JSON text. */
    enum StoryKind { RELATED_SEARCHES_ORGANIC, RELATED_SEARCHES }

    static final class TypedStory {
        @Json("id") String id;
        @Json("story_type") StoryKind storyType;

        TypedStory(String id, StoryKind storyType) {
            this.id = id;
            this.storyType = storyType;
        }

        @Override public String toString() {
            return id;
        }
    }

    @Before
    public void installed() {
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_ADS, PatchFamily.Capability.FEED_HOME_SUGGESTIONS));
        Settings.HIDE_ADS.save(false);
    }

    @After
    public void restore() {
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Settings.HIDE_ADS.resetToDefault();
        Settings.HIDE_HOME_SUGGESTIONS.resetToDefault();
        Settings.HIDE_REFINE_SEARCH.resetToDefault();
        ModelFields.clearForTests();
        ModuleItems.clearForTests();
        HomeSuggestions.clearForTests();
        HookStatus.clear();
    }

    private static String line(String family) {
        for (String line : HookStatus.report()) {
            if (line.startsWith(family + ":")) return line;
        }
        return "";
    }

    /** The page the report logged: boards, Refine your search lists, a Shop similar list and a style story, between pins. */
    private static List<Object> page() {
        return new ArrayList<>(Arrays.asList(new Pin("pin"), new Story("boards", "featured_boards"),
                new Story("refine", "related_searches_organic"), new Pin("middle"), new Story("shop", "related_searches"),
                new Story("refineAgain", "related_searches_organic"), new Story("style", "user_style_story_v2"), new Pin("after")));
    }

    @Test
    public void itStartsOffAndLeavesResultsAsTheyWere() {
        assertFalse(Settings.HIDE_REFINE_SEARCH.get());
        List<Object> page = page();
        assertSame(page, FeedFilter.filter(page));
    }

    /** Every Refine your search list goes and is counted under Filter feed; Shop similar and the rest keep their order. */
    @Test
    public void everyRefineListGoesAndTheRestKeepTheirOrder() {
        Settings.HIDE_REFINE_SEARCH.save(true);
        assertEquals("[pin, boards, middle, shop, style, after]", FeedFilter.filter(page()).toString());
        assertTrue(line(FamilyNames.FILTER_FEED), line(FamilyNames.FILTER_FEED).contains("Refine your search list removed 2"));
    }

    @Test
    public void theTypedStoryKindGoesToo() {
        Settings.HIDE_REFINE_SEARCH.save(true);
        List<Object> page = new ArrayList<>(Arrays.asList(new Pin("pin"),
                new TypedStory("typed", StoryKind.RELATED_SEARCHES_ORGANIC), new TypedStory("shop", StoryKind.RELATED_SEARCHES)));
        assertEquals("[pin, shop]", FeedFilter.filter(page).toString());
    }

    /** Each switch keeps to its own rows: Hide Home suggestions never takes a Refine list, and this switch never takes Home's. */
    @Test
    public void homeSuggestionsAndRefineAreSeparateSwitches() {
        String homeStory = HomeSuggestions.STORIES.iterator().next();
        Settings.HIDE_HOME_SUGGESTIONS.save(true);
        List<Object> page = new ArrayList<>(Arrays.asList(new Pin("pin"), new Story("refine", "related_searches_organic"),
                new Story("home", homeStory)));
        assertEquals("[pin, refine]", FeedFilter.filter(page).toString());
        Settings.HIDE_HOME_SUGGESTIONS.save(false);
        Settings.HIDE_REFINE_SEARCH.save(true);
        page = new ArrayList<>(Arrays.asList(new Pin("pin"), new Story("refine", "related_searches_organic"),
                new Story("home", homeStory)));
        assertEquals("[pin, home]", FeedFilter.filter(page).toString());
    }

    @Test
    public void aBuildWithoutTheCapabilityKeepsEveryList() {
        Settings.HIDE_REFINE_SEARCH.save(true);
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_ADS));
        List<Object> page = page();
        assertSame(page, FeedFilter.filter(page));
    }

    @Test
    public void pauseKeepsEveryList() {
        Settings.HIDE_REFINE_SEARCH.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        List<Object> page = page();
        assertSame(page, FeedFilter.filter(page));
    }
}
