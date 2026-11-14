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
import java.util.Locale;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.pinterest.ui.UiHooks;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * Filter feed's Hide Home suggestions on the shared list hook and the pin's "See more like this?"
 * getter, against stand-ins shaped like 14.44.0's models, each field named the way Pinterest's
 * renamed Gson annotation names it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HomeSuggestionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    @interface Json {
        String value();
    }

    /** 14.44.0's a2: the "More ideas for your board" card, a board's name and header over a strip of images. */
    static final class BoardIdeas {
        @Json("id") String id = "boardIdeas";
        @Json("board_id") String boardId = "4242";
        @Json("board_name") String boardName = "Kitchen";
        @Json("header_text") String header = "More ideas for your board";
        @Json("image_dominant_color_rgb") List<String> colors = Arrays.asList("#aabbcc");
        @Json("image_urls") List<String> images = Arrays.asList("https://i.pinimg.com/236x/a.jpg");

        @Override public String toString() {
            return id;
        }
    }

    /** A board, which has a name and an id of its own but is no suggestion. */
    static final class Board {
        @Json("id") String id = "board";
        @Json("name") String name = "Kitchen";
        @Json("image_dominant_color_rgb") List<String> colors = Arrays.asList("#aabbcc");

        @Override public String toString() {
            return id;
        }
    }

    /** A story that carries the board's fields too: its story type says what it is. */
    static final class BoardStory {
        @Json("id") String id = "boardStory";
        @Json("story_type") String storyType = "board_more_ideas";
        @Json("board_id") String boardId = "4242";
        @Json("board_name") String boardName = "Kitchen";
        @Json("header_text") String header = "Ideas";
        @Json("image_dominant_color_rgb") List<String> colors = Arrays.asList("#aabbcc");

        @Override public String toString() {
            return id;
        }
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

    static final class Story {
        @Json("id") String id;
        @Json("story_type") String storyType;

        Story(String id, String storyType) {
            this.id = id;
            this.storyType = storyType;
        }

        @Override public String toString() {
            return id;
        }
    }

    /** Pinterest's typed story kinds, as one story model keeps them (an enum, not the JSON text). */
    enum StoryKind { HOMEFEED_MORE_IDEAS_FEED_STORY, IDEAS_FOR_YOU }

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

    private final Pin pin = new Pin("pin");
    private final Story ideas = new Story("ideas", "ideas_for_you");

    @Before
    public void installed() {
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_ADS, PatchFamily.Capability.FEED_HOME_SUGGESTIONS,
                PatchFamily.Capability.FEEDBACK_FLYOUT));
        Settings.HIDE_ADS.save(false);
    }

    @After
    public void restore() {
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Settings.HIDE_ADS.resetToDefault();
        Settings.HIDE_HOME_SUGGESTIONS.resetToDefault();
        ModelFields.clearForTests();
        ModuleItems.clearForTests();
        HookStatus.clear();
    }

    private static String line(String family) {
        for (String line : HookStatus.report()) {
            if (line.startsWith(family + ":")) return line;
        }
        return "";
    }

    private List<Object> page() {
        return new ArrayList<>(Arrays.asList(pin, new BoardIdeas(), new Board(), new BoardStory(), ideas, new Pin("after")));
    }

    @Test
    public void itStartsOffAndLeavesHomeAsItWas() {
        assertFalse(Settings.HIDE_HOME_SUGGESTIONS.get());
        List<Object> page = page();
        assertSame(page, FeedFilter.filter(page));
        assertSame(Boolean.TRUE, UiHooks.feedbackFlyout(Boolean.TRUE));
    }

    /** The board ideas card goes; a board, a story with board fields, other stories and pins keep their order. */
    @Test
    public void theBoardIdeasCardGoesAndTheRestKeepTheirOrder() {
        Settings.HIDE_HOME_SUGGESTIONS.save(true);
        assertEquals("[pin, board, boardStory, ideas, after]", FeedFilter.filter(page()).toString());
        assertTrue(line(FamilyNames.FILTER_FEED), line(FamilyNames.FILTER_FEED).contains("Home suggestion removed 1"));
    }

    /** Each of Home's own idea stories goes, as the JSON text or as the typed enum's constant. */
    @Test
    public void homesIdeaStoriesGoWhetherTypedOrText() {
        Settings.HIDE_HOME_SUGGESTIONS.save(true);
        assertFalse(HomeSuggestions.STORIES.isEmpty());
        for (String type : HomeSuggestions.STORIES) {
            List<Object> page = new ArrayList<>(Arrays.asList(pin, new Story(type, type), new Story("upper", type.toUpperCase(Locale.ROOT))));
            assertEquals(type, "[pin]", FeedFilter.filter(page).toString());
        }
        List<Object> typed = new ArrayList<>(Arrays.asList(pin, new TypedStory("typed", StoryKind.HOMEFEED_MORE_IDEAS_FEED_STORY),
                new TypedStory("kept", StoryKind.IDEAS_FOR_YOU)));
        if (HomeSuggestions.STORIES.contains("homefeed_more_ideas_feed_story")) {
            assertEquals("[pin, kept]", FeedFilter.filter(typed).toString());
        }
    }

    @Test
    public void aBuildWithoutTheCapabilityKeepsEveryRow() {
        Settings.HIDE_HOME_SUGGESTIONS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_ADS));
        List<Object> page = page();
        assertSame(page, FeedFilter.filter(page));
    }

    @Test
    public void pauseKeepsEveryRowAndTheBubble() {
        Settings.HIDE_HOME_SUGGESTIONS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        List<Object> page = page();
        assertSame(page, FeedFilter.filter(page));
        assertSame(Boolean.TRUE, UiHooks.feedbackFlyout(Boolean.TRUE));
    }

    /** The switch answers no for the bubble, and an answer of no or none passes through untouched. */
    @Test
    public void theSwitchTurnsTheBubbleOffAndNothingElse() {
        Settings.HIDE_HOME_SUGGESTIONS.save(true);
        assertSame(Boolean.FALSE, UiHooks.feedbackFlyout(Boolean.TRUE));
        assertSame(Boolean.FALSE, UiHooks.feedbackFlyout(null));
        Settings.HIDE_HOME_SUGGESTIONS.save(false);
        assertSame(Boolean.FALSE, UiHooks.feedbackFlyout(Boolean.FALSE));
        assertEquals(null, UiHooks.feedbackFlyout(null));
    }

    @Test
    public void aBoardIdeasCardIsKnownByAllItsFieldsAndNoStoryType() {
        assertTrue(HomeSuggestions.isBoardIdeasCard(ModelFields.of(BoardIdeas.class)));
        assertFalse(HomeSuggestions.isBoardIdeasCard(ModelFields.of(BoardStory.class)));
        assertFalse(HomeSuggestions.isBoardIdeasCard(ModelFields.of(Board.class)));
        assertFalse(HomeSuggestions.isSuggestion(null));
        assertFalse(HomeSuggestions.isSuggestion("not a model"));
    }
}
