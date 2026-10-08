/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.reels.ReelMidCardsForTests.MidCard;
import app.morphe.extension.facebook.reels.ReelMidCardsForTests.MidCardType;
import app.morphe.extension.facebook.reels.ReelMidCardsForTests.Section;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The Threads card filter of Clean up Reels: on, the Threads card comes off its section and the
 * report counts it, while a reel and every other mid-card stay. Off, paused, unpatched or failing,
 * the page goes on as Facebook sent it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelMidCardsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_REEL_THREADS_CARDS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String line() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(ReelMidCards.SECTIONS_ROUTE + ": ")) return line;
        }
        return null;
    }

    private static Section section(Object... items) {
        return new Section(new ArrayList<>(Arrays.asList(items)));
    }

    /** Nobody has seen the card go on a signed-in Reels feed yet, so the switch waits to be turned on. */
    @Test
    public void theSwitchStartsOffAndOffTheCardStays() {
        assertFalse(Settings.HIDE_REEL_THREADS_CARDS.defaultValue);
        MidCard card = new MidCard(MidCardType.THREADS_MIDCARD);
        Section section = section(new Object(), card);
        List<Section> page = Collections.singletonList(section);

        assertSame(page, ReelMidCardsForTests.withoutThreadsCards(page));
        assertTrue(section.items.contains(card));
    }

    /** On, the Threads card goes, its neighbours keep their order, and the report names what it read. */
    @Test
    public void onTheThreadsCardComesOffAndIsCounted() {
        Settings.HIDE_REEL_THREADS_CARDS.save(true);
        Object reel = new Object();
        MidCard threads = new MidCard(MidCardType.THREADS_MIDCARD);
        MidCard people = new MidCard(MidCardType.PYML_MIDCARD);
        Section section = section(reel, threads, people);
        List<Section> page = Collections.singletonList(section);

        assertSame("a section that still holds items stays", page, ReelMidCardsForTests.withoutThreadsCards(page));
        assertEquals(Arrays.asList(reel, people), section.items);

        String line = line();
        assertNotNull(FeedFilterCounters.report().toString(), line);
        assertTrue(line, line.contains("1 removed"));
        assertTrue(line, line.contains("Removed: mid-card THREADS_MIDCARD 1"));
        assertTrue(line, line.contains("Kinds: "));
        assertTrue(line, line.contains("mid-card THREADS_MIDCARD 1"));
        assertTrue(line, line.contains("mid-card PYML_MIDCARD 1"));
        assertTrue(line, line.contains(ReelMidCards.NOT_A_MID_CARD + " 1"));
    }

    /** A section that held only the card goes off the page, so the screen doesn't show an empty one. */
    @Test
    public void aSectionHoldingOnlyTheCardGoesOffThePage() {
        Settings.HIDE_REEL_THREADS_CARDS.save(true);
        Section reels = section(new Object());
        Section card = section(new MidCard(MidCardType.THREADS_MIDCARD));

        assertEquals(Collections.singletonList(reels),
                ReelMidCardsForTests.withoutThreadsCards(Arrays.asList(reels, card)));
    }

    /** Paused, the page is Facebook's own whatever is saved. */
    @Test
    public void pausedTheCardStays() {
        Settings.HIDE_REEL_THREADS_CARDS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        MidCard card = new MidCard(MidCardType.THREADS_MIDCARD);
        Section section = section(new Object(), card);

        ReelMidCardsForTests.withoutThreadsCards(Collections.singletonList(section));
        assertTrue(section.items.contains(card));
    }

    /** Until the patch fills the stub in, no card's type can be read, and every card stays. */
    @Test
    public void anUnpatchedTypeReaderKeepsTheCard() {
        Settings.HIDE_REEL_THREADS_CARDS.save(true);
        MidCard card = new MidCard(MidCardType.THREADS_MIDCARD);
        Section section = section(card);

        ReelMidCards.withoutThreadsCards(Collections.singletonList(section), ReelMidCardsForTests.MID_CARD);
        assertTrue(section.items.contains(card));
        assertTrue(line(), line().contains(ReelMidCards.NOT_PATCHED + " 1"));
    }

    /** A read that throws keeps the card, and the page goes on. */
    @Test
    public void aReadThatThrowsKeepsTheCard() {
        Settings.HIDE_REEL_THREADS_CARDS.save(true);
        MidCard card = new MidCard(MidCardType.THREADS_MIDCARD);
        Section section = section(card);

        ReelMidCards.withoutThreadsCards(Collections.singletonList(section), ReelMidCardsForTests.MID_CARD, item -> {
            throw new IllegalStateException("released tree");
        });
        assertTrue(section.items.contains(card));
        assertTrue(line(), line().contains(ReelMidCards.READ_FAILED + " 1"));
    }

    /** A card with no type, or one that isn't an enum constant, isn't taken for the Threads card. */
    @Test
    public void aCardWithoutATypeStays() {
        Settings.HIDE_REEL_THREADS_CARDS.save(true);
        MidCard card = new MidCard(null);
        Section section = section(card);

        ReelMidCardsForTests.withoutThreadsCards(Collections.singletonList(section));
        assertTrue(section.items.contains(card));
        assertTrue(line(), line().contains(ReelMidCards.NO_TYPE + " 1"));
    }
}
