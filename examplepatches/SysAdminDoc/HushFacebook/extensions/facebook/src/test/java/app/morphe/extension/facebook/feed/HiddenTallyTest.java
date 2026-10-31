/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Map;

import app.morphe.extension.facebook.feed.HiddenTally.Kind;
import app.morphe.extension.shared.L10nTablesForTests;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/** The tally row at the top of the News feed settings. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HiddenTallyTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void startFromZero() {
        HiddenTally.clearForTests();
    }

    @After
    public void clear() {
        HiddenTally.clearForTests();
        PauseForTests.resume();
    }

    private static void hid(Kind kind, int times) {
        for (int time = 0; time < times; time++) HiddenTally.hid(kind);
    }

    @Test
    public void beforeTheFirstHiddenPostTheRowSaysSo() {
        assertEquals("Nothing hidden yet. Scroll Home and come back.", HiddenTally.summary());
        HiddenTally.hid(null);
        assertEquals("an edge no group claimed counts nowhere",
                "Nothing hidden yet. Scroll Home and come back.", HiddenTally.summary());
    }

    /** Most first, a tie in the order the rules run, and a kind that hid nothing left out. */
    @Test
    public void theLargestKindsComeFirstAndATieKeepsTheRuleOrder() {
        hid(Kind.ADS, 2);
        hid(Kind.REELS, 5);
        hid(Kind.SUGGESTED, 5);
        hid(Kind.CARDS, 1);
        hid(Kind.SEEN, 7);
        assertEquals(Arrays.asList(Kind.SEEN, Kind.REELS, Kind.SUGGESTED, Kind.ADS, Kind.CARDS),
                HiddenTally.largest(HiddenTally.counts()));
        assertEquals("20 posts and cards: posts you've seen (7), reels (5), suggestions (5), and 3 others",
                HiddenTally.summary());
    }

    @Test
    public void oneOfEachIsWordedInTheSingular() {
        HiddenTally.hid(Kind.ADS);
        assertEquals("1 post or card: ads (1)", HiddenTally.summary());

        hid(Kind.AI, 3);
        hid(Kind.STORIES, 2);
        hid(Kind.GROUPS, 2);
        assertEquals("the one left over is one other",
                "8 posts and cards: AI posts (3), posts from groups you're not in (2), rows of Stories (2), and 1 other",
                HiddenTally.summary());
    }

    @Test
    public void threeKindsOrFewerNeedNoRemainder() {
        hid(Kind.YOUR_FILTERS, 4);
        hid(Kind.CARDS, 2);
        assertEquals("6 posts and cards: posts your filters matched (4) and Memories and other cards (2)",
                HiddenTally.summary());
    }

    /** A paused Facebook hid nothing since it started, so the row says why instead of a zero. */
    @Test
    public void whilePausedTheRowSaysPaused() {
        hid(Kind.ADS, 3);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals("Hushfacebook is paused", HiddenTally.summary());
        PauseForTests.resume();
        assertEquals("3 posts and cards: ads (3)", HiddenTally.summary());
    }

    @Test
    @Config(qualifiers = "de")
    public void theRowReadsInThePhonesLanguage() {
        Map<String, String> german = L10nTablesForTests.of("de");
        assertEquals(german.get("Nothing hidden yet. Scroll Home and come back."), HiddenTally.summary());
        hid(Kind.REELS, 2);
        assertEquals(String.format(german.get("%1$d posts and cards: %2$s"), 2,
                        String.format(german.get("%1$s (%2$d)"), german.get("reels"), 2)),
                HiddenTally.summary());
    }
}
