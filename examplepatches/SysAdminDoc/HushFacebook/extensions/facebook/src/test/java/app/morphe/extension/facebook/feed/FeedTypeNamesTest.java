/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;

import com.facebook.graphql.model.GraphQLStory;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Feed types to hide: a type picked by name hides units of exactly that type, after every
 * built-in rule, and the list offers the types that came past those rules since Facebook started.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FeedTypeNamesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC }

    private static final String PICKED = "SomeNewCardFeedUnit";

    /** A post as Home gets it, answering [type] as its type name. */
    public static final class TypedPost extends GraphQLStory {
        private final String type;

        TypedPost(String type) {
            this.type = type;
        }

        public String getTypeName() {
            return type;
        }
    }

    @Before
    public void startClean() {
        FeedTypeNames.clearForTests();
        HiddenTally.clearForTests();
    }

    @After
    public void restore() {
        Settings.HIDDEN_FEED_TYPES.resetToDefault();
        Settings.HIDE_FRIENDS_LOCATIONS.resetToDefault();
        PauseForTests.resume();
        FeedTypeNames.clearForTests();
        HiddenTally.clearForTests();
        LinkedPost.clearForTests();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static boolean hides(Object unit) {
        return FeedGuardForTests.hidesByWords(Category.ORGANIC, unit, null);
    }

    /**
     * A picked type goes and nothing else does: not a longer name it starts, not another casing,
     * not a build without the word filter's patch. The report names the rule and the type, and the
     * tally counts it under the user's own filters.
     */
    @Test
    public void aPickedTypeHidesExactlyThatType() {
        assertFalse("a type hid before it was picked", hides(new TypedFeedUnit(PICKED)));
        assertEquals(FeedTypeNames.Hidden.SAVED, FeedTypeNames.hide(Collections.singletonList(PICKED)));

        assertTrue(hides(new TypedFeedUnit(PICKED)));
        assertFalse("a longer name went", hides(new TypedFeedUnit(PICKED + "Item")));
        assertFalse("another casing went", hides(new TypedFeedUnit("someNewCardFeedUnit")));
        assertFalse("a unit with no type name went", hides(new Object()));
        assertFalse("without the patch", FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit(PICKED), true, true));

        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains("Last reason: " + FeedTypeNames.REASON + PICKED));
        long[] counts = HiddenTally.counts();
        assertEquals(1, counts[HiddenTally.Kind.YOUR_FILTERS.ordinal()]);
        assertEquals(1, Arrays.stream(counts).sum());
    }

    /** An ordinary post's type can't be picked, offered or matched, from the row or a saved list. */
    @Test
    public void anOrdinaryPostIsNeverHiddenByName() {
        Settings.HIDDEN_FEED_TYPES.save(FeedTypeNames.STORY + "," + PICKED);
        assertFalse(hides(new TypedFeedUnit(FeedTypeNames.STORY)));
        assertTrue(hides(new TypedFeedUnit(PICKED)));
        assertEquals(Collections.singleton(PICKED), FeedTypeNames.hidden());
        assertEquals(Collections.singletonList(PICKED), FeedTypeNames.choices());
        assertEquals(PICKED, FeedTypeNames.clean(FeedTypeNames.STORY + "," + PICKED));
    }

    /**
     * The list holds the types seen, in the order they came and each once, then the ones picked
     * that weren't seen. A type a switch already hides isn't offered, and it stops at its limit.
     */
    @Test
    public void theListOffersTypesSeenThenTypesPicked() {
        Settings.HIDE_FRIENDS_LOCATIONS.save(true);
        hides(new TypedFeedUnit("FirstCardFeedUnit"));
        hides(new TypedFeedUnit(FeedFilter.FRIENDS_LOCATIONS_TYPE));
        hides(new TypedFeedUnit("SecondCardFeedUnit"));
        hides(new TypedFeedUnit("FirstCardFeedUnit"));
        assertEquals(Arrays.asList("FirstCardFeedUnit", "SecondCardFeedUnit"), FeedTypeNames.choices());

        Settings.HIDDEN_FEED_TYPES.save("FromAnotherPhoneFeedUnit,SecondCardFeedUnit");
        assertEquals(Arrays.asList("FirstCardFeedUnit", "SecondCardFeedUnit", "FromAnotherPhoneFeedUnit"),
                FeedTypeNames.choices());

        FeedTypeNames.clearForTests();
        Settings.HIDDEN_FEED_TYPES.resetToDefault();
        for (int i = 0; i < FeedTypeNames.SEEN_LIMIT + 6; i++) hides(new TypedFeedUnit("Card" + i + "FeedUnit"));
        assertEquals(FeedTypeNames.SEEN_LIMIT, FeedTypeNames.choices().size());
    }

    /** The stored form: each type once, in order, nothing that isn't a type, and a pick that doesn't fit saves nothing. */
    @Test
    public void theListIsStoredCleanAndAPickThatDoesntFitSavesNothing() {
        assertEquals("FirstFeedUnit,Second_Unit2", FeedTypeNames.clean(" FirstFeedUnit , FirstFeedUnit,Second_Unit2,1Third,Fourth-Unit,"));
        assertTrue(FeedTypeNames.isClean("FirstFeedUnit,Second_Unit2"));
        assertTrue(FeedTypeNames.isClean(""));
        assertFalse(FeedTypeNames.isClean("FirstFeedUnit, Second_Unit2"));
        assertFalse(FeedTypeNames.isClean(null));
        assertEquals(2, FeedTypeNames.count("FirstFeedUnit,Second_Unit2"));
        assertEquals(0, FeedTypeNames.count(null));

        List<String> many = new ArrayList<>();
        for (int i = 0; i < 40; i++) many.add("AQuiteLongFeedUnitTypeName" + i);
        Settings.HIDDEN_FEED_TYPES.save(PICKED);
        assertEquals(FeedTypeNames.Hidden.NO_ROOM, FeedTypeNames.hide(many));
        assertEquals("a pick that didn't fit changed the list", PICKED, Settings.HIDDEN_FEED_TYPES.savedValue());

        assertEquals(FeedTypeNames.Hidden.SAVED, FeedTypeNames.hide(Arrays.asList("FirstFeedUnit", "Second_Unit2")));
        assertEquals("FirstFeedUnit,Second_Unit2", Settings.HIDDEN_FEED_TYPES.savedValue());
    }

    /** A paused Facebook hides no type by name, and keeps the list for when it resumes. */
    @Test
    public void aPausedFacebookHidesNoTypeByName() {
        Settings.HIDDEN_FEED_TYPES.save(PICKED);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(hides(new TypedFeedUnit(PICKED)));
        assertEquals(Collections.singleton(PICKED), FeedTypeNames.hidden());
        PauseForTests.resume();
        assertTrue(hides(new TypedFeedUnit(PICKED)));
    }

    /** The post a link opens stays when its type is picked (#306), and the post after it goes. */
    @Test
    public void thePostALinkOpensStaysWhenItsTypeIsPicked() {
        Settings.HIDDEN_FEED_TYPES.save(PICKED);
        assertTrue(LinkedPost.screenCreated(LinkedPost.LANDING_SCREEN, SystemClock.uptimeMillis()));
        assertFalse("the post the link opened was hidden", hides(new TypedPost(PICKED)));
        assertTrue("one link kept a second post", hides(new TypedPost(PICKED)));
    }
}
