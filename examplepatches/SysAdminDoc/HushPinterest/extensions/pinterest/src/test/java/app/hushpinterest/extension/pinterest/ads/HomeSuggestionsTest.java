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
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

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
        HomeSuggestions.clearForTests();
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
        HomeSuggestions.clearForTests();
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

    private static int occurrences(String text, String part) {
        int count = 0;
        for (int at = text.indexOf(part); at >= 0; at = text.indexOf(part, at + part.length())) count++;
        return count;
    }

    /** The lines of the report's [title] section, without the blank lines after them, or "" when it's left out. */
    private static String section(String export, String title) {
        String head = "\n[" + title + "]\n";
        int at = export.indexOf(head);
        if (at < 0) return "";
        int from = at + head.length();
        int end = export.indexOf("\n[", from);
        String lines = end < 0 ? export.substring(from) : export.substring(from, end);
        while (lines.endsWith("\n")) lines = lines.substring(0, lines.length() - 1);
        return lines;
    }

    /** A kind with more JSON names than a shape line lists. */
    static final class Wide {
        @Json("a01") int a01; @Json("a02") int a02; @Json("a03") int a03; @Json("a04") int a04; @Json("a05") int a05;
        @Json("a06") int a06; @Json("a07") int a07; @Json("a08") int a08; @Json("a09") int a09; @Json("a10") int a10;
        @Json("a11") int a11; @Json("a12") int a12; @Json("a13") int a13; @Json("a14") int a14; @Json("a15") int a15;
        @Json("a16") int a16; @Json("a17") int a17; @Json("a18") int a18; @Json("a19") int a19; @Json("a20") int a20;
        @Json("a21") int a21; @Json("a22") int a22; @Json("a23") int a23; @Json("a24") int a24; @Json("a25") int a25;
        @Json("a26") int a26; @Json("a27") int a27; @Json("a28") int a28; @Json("a29") int a29; @Json("a30") int a30;
        @Json("a31") int a31; @Json("a32") int a32; @Json("a33") int a33; @Json("a34") int a34; @Json("a35") int a35;
        @Json("a36") int a36; @Json("a37") int a37; @Json("a38") int a38; @Json("a39") int a39; @Json("a40") int a40;
        @Json("a41") int a41;
    }

    /**
     * Debug logging with the switch on names what a page kept: each kind in order by its full name, a
     * module's story type and a run of one kind counted once. Each kind that isn't a module gets one
     * line of JSON names in the report's own section, which Clear diagnostic data leaves in place (#30).
     * Never a title, a header, or a story type that carries text.
     */
    @Test
    public void debugLoggingSaysWhatAHomePageKeptWithoutItsText() {
        Settings.HIDE_HOME_SUGGESTIONS.save(true);
        BaseSettings.DEBUG.save(true);
        try {
            Pin titled = new Pin("titled");
            titled.gridTitle = "Grandma's lemon bars 7731";
            Board board = new Board();
            board.name = "Lakehouse attic 7731";
            BoardIdeas card = new BoardIdeas();
            card.header = "More ideas for Lakehouse 7731";
            String pinKind = HomeSuggestions.name(Pin.class);
            String boardKind = HomeSuggestions.name(Board.class);
            String storyKind = HomeSuggestions.name(Story.class);
            List<Object> page = new ArrayList<>(Arrays.asList(new Pin("a"), titled, card,
                    new Story("interest", "homefeed_interest_based"), new Story("worded", "Fresh ideas 7731 to explore"),
                    new TypedStory("typed", StoryKind.IDEAS_FOR_YOU), board, new Pin("c")));
            assertEquals("[a, titled, interest, worded, typed, board, c]", FeedFilter.filter(page).toString());
            FeedFilter.filter(new ArrayList<>(Arrays.asList(new Pin("again"))));
            String export = LogBufferManager.buildExportText();
            assertTrue(export, export.contains("Kept page: 7 items: " + pinKind + " x2, " + storyKind + "[homefeed_interest_based], "
                    + storyKind + "[text], " + HomeSuggestions.name(TypedStory.class) + "[IDEAS_FOR_YOU], " + boardKind + ", " + pinKind));
            assertTrue(export, export.contains("Kept page: 1 item: " + pinKind));
            String shapes = boardKind + ": id, image_dominant_color_rgb, name\n" + pinKind + ": grid_title, id";
            assertEquals("each kind once, in name order, and no module: a module's names come from its Module line",
                    shapes, section(export, "HOME ITEM SHAPES"));
            assertTrue("the module's own line names it too: " + export, export.contains("Module text"));
            assertFalse("a pin's title, a board's name, the card's header and a story type that carries text stay out",
                    export.contains("7731"));

            LogBufferManager.clearLogBuffer();
            String cleared = LogBufferManager.buildExportText();
            assertFalse(cleared, cleared.contains("Kept page: 7 items"));
            assertEquals("the shapes outlast a clear, so the next page line still maps", shapes, section(cleared, "HOME ITEM SHAPES"));
        } finally {
            BaseSettings.DEBUG.resetToDefault();
        }
    }

    /**
     * Nothing is logged or noted with Debug logging off, or with the switch off while another filter
     * runs: no page line, and no kind in the shapes section, so nothing is built for a page nobody logs.
     */
    @Test
    public void theKeptPageLineNeedsDebugLoggingAndTheSwitch() {
        Settings.HIDE_HOME_SUGGESTIONS.save(true);
        FeedFilter.filter(new ArrayList<>(Arrays.asList(pin, new Story("quiet", "quiet_debug_off"))));
        Settings.HIDE_HOME_SUGGESTIONS.save(false);
        Settings.HIDE_ADS.save(true);
        BaseSettings.DEBUG.save(true);
        try {
            FeedFilter.filter(new ArrayList<>(Arrays.asList(pin, new Story("ads", "quiet_switch_off"))));
        } finally {
            BaseSettings.DEBUG.resetToDefault();
        }
        String export = LogBufferManager.buildExportText();
        assertFalse(export, export.contains("quiet_debug_off"));
        assertFalse(export, export.contains("Story[quiet_switch_off]"));
        assertEquals("no kind was noted for a page that wasn't logged", "", section(export, "HOME ITEM SHAPES"));
    }

    /** A page past its runs cap counts the rest, a page left empty still says so, and a wide kind counts its names. */
    @Test
    public void aLongPageAndAWideKindAreCountedNotListed() {
        String pinKind = HomeSuggestions.name(Pin.class);
        String boardKind = HomeSuggestions.name(Board.class);
        List<Object> page = new ArrayList<>();
        for (int i = 0; i < HomeSuggestions.PAGE_RUNS_MAX + 3; i++) page.add(i % 2 == 0 ? new Pin("p" + i) : new Board());
        String line = HomeSuggestions.page(page);
        assertTrue(line, line.startsWith((HomeSuggestions.PAGE_RUNS_MAX + 3) + " items: " + pinKind + ", " + boardKind + ", "));
        assertTrue(line, line.endsWith(", 3 more runs"));
        assertEquals(line, HomeSuggestions.PAGE_RUNS_MAX, occurrences(line, pinKind) + occurrences(line, boardKind));
        assertEquals("0 items", HomeSuggestions.page(new ArrayList<>()));
        assertEquals(HomeSuggestions.name(Wide.class) + ": 41 JSON names", HomeSuggestions.shape(Wide.class));
        assertEquals("a kind outside Pinterest's model package keeps its whole name", Wide.class.getName(),
                HomeSuggestions.name(Wide.class));
    }

    /** A story type is logged as its constant or a name-shaped String, and as what it is otherwise. */
    @Test
    public void aStoryTypeIsLoggedOnlyWhenItReadsLikeAName() {
        assertEquals("homefeed_tabs", HomeSuggestions.storyName("homefeed_tabs"));
        assertEquals("IDEAS_FOR_YOU", HomeSuggestions.storyName(StoryKind.IDEAS_FOR_YOU));
        assertEquals("none", HomeSuggestions.storyName(null));
        assertEquals("?", HomeSuggestions.storyName(7));
        assertEquals("text", HomeSuggestions.storyName("Inspired by your interests"));
        assertEquals("text", HomeSuggestions.storyName(""));
        String longest = new String(new char[64]).replace('\0', 'a');
        assertEquals(longest, HomeSuggestions.storyName(longest));
        assertEquals("text", HomeSuggestions.storyName(longest + "a"));
        assertEquals(String.class.getName() + ": no JSON names", HomeSuggestions.shape(String.class));
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
