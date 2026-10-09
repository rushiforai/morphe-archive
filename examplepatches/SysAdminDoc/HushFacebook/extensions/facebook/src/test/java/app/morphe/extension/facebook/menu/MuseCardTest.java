/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.graphservice.tree.TreeJNI;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The hook after the Menu bookmark component reads whether its card was dismissed: the bookmark
 * named Muse reads as dismissed while the switch is on, and every other bookmark, every bookmark
 * while the switch is off or paused or before the settings are ready, and anything that isn't a
 * live bookmark model keeps Facebook's answer.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MuseCardTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static TreeJNI bookmark(String name) {
        return new TreeJNI().with("name", name);
    }

    private static String line(List<String> report, String prefix) {
        for (String line : report) {
            if (line.startsWith(prefix + ":")) return line;
        }
        return null;
    }

    @Before
    public void startClean() {
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_MENU_MUSE.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @Test
    public void theSwitchStartsOnAndTheMuseCardReadsDismissed() {
        assertTrue("the Muse card switch starts off", Settings.HIDE_MENU_MUSE.get());
        assertTrue(MuseCard.dismissed(false, bookmark("Muse")));
    }

    /** Your groups, Pages and the rest of the Menu's bookmarks keep whatever Facebook read. */
    @Test
    public void everyOtherBookmarkKeepsFacebooksAnswer() {
        assertFalse(MuseCard.dismissed(false, bookmark("Marketplace")));
        assertFalse(MuseCard.dismissed(false, bookmark("Muse fans of Ohio")));
        assertFalse(MuseCard.dismissed(false, new TreeJNI()));
        assertTrue("a card Facebook dismissed came back", MuseCard.dismissed(true, bookmark("Marketplace")));
    }

    @Test
    public void theNameIsMatchedWholeWhateverItsCase() {
        assertTrue(MuseCard.isMuse("Muse"));
        assertTrue(MuseCard.isMuse(" muse "));
        assertTrue(MuseCard.isMuse("MUSE"));
        assertFalse(MuseCard.isMuse("Muse Studio"));
        assertFalse(MuseCard.isMuse("Amuse"));
        assertFalse(MuseCard.isMuse(""));
        assertFalse(MuseCard.isMuse(null));
    }

    @Test
    public void offOrPausedTheCardIsFacebooks() {
        Settings.HIDE_MENU_MUSE.save(false);
        assertFalse(MuseCard.dismissed(false, bookmark("Muse")));
        assertTrue("Facebook's own Dismiss was undone", MuseCard.dismissed(true, bookmark("Muse")));
        Settings.HIDE_MENU_MUSE.save(true);

        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(MuseCard.dismissed(false, bookmark("Muse")));
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertFalse(MuseCard.dismissed(false, bookmark("Muse")));
        PauseForTests.resume();
        assertTrue(MuseCard.dismissed(false, bookmark("Muse")));
    }

    @Test
    public void untilTheSettingsAreReadyTheCardIsFacebooks() {
        boolean[] dismissed = {true, true};
        SettingsContextRule.withoutContext(() -> dismissed[0] = MuseCard.dismissed(false, bookmark("Muse")));
        SettingsContextRule.beforeThePauseIsDecided(() -> dismissed[1] = MuseCard.dismissed(false, bookmark("Muse")));
        assertFalse(dismissed[0]);
        assertFalse(dismissed[1]);
    }

    /**
     * A released model is never read, since that read goes to native code with nothing behind it,
     * and anything that isn't a model means the anchor took the wrong call, which the report names.
     */
    @Test
    public void anythingButALiveBookmarkIsLeftAndReported() {
        TreeJNI released = bookmark("Muse").releasedTree();
        assertFalse(MuseCard.dismissed(false, released));
        assertFalse("a released model was read", released.readAfterRelease);
        assertFalse(MuseCard.dismissed(false, "Muse"));
        assertFalse(MuseCard.dismissed(false, null));
        List<String> missing = HookStatus.missing(FamilyNames.MENU_PROMOTIONS);
        assertEquals(missing.toString(), 3, missing.size());
        assertTrue(missing.toString(), missing.get(1).contains("Menu bookmark model " + MuseCard.HOOK + "#java.lang.String"));
        assertTrue(missing.toString(), missing.get(2).contains("Menu bookmark model " + MuseCard.HOOK + "#null"));
        assertNull("a non-bookmark was counted", line(FeedFilterCounters.report(), MuseCard.ROUTE));
    }

    @Test
    public void theReportCountsTheCardsAskedAboutAndTheMuseCardHidden() {
        MuseCard.dismissed(false, bookmark("Marketplace"));
        MuseCard.dismissed(false, bookmark("Muse"));
        MuseCard.dismissed(false, bookmark("Groups"));
        String counters = line(FeedFilterCounters.report(), MuseCard.ROUTE);
        assertNotNull(FeedFilterCounters.report().toString(), counters);
        assertTrue(counters, counters.startsWith(MuseCard.ROUTE + ": 3 lists, 3 items, 1 removed."));
        assertTrue(counters, counters.contains("Removed: " + MuseCard.HIDDEN + " 1"));
        assertEquals(FamilyNames.MENU_PROMOTIONS + ": invoked 3, 1 found, 0 missing",
                line(HookStatus.report(), FamilyNames.MENU_PROMOTIONS));
    }
}
