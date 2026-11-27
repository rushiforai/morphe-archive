package app.jimaku.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import app.jimaku.extension.menu.Version;

public class LookTest {
    @Test
    public void startsAtTheExtensionsDefaults() {
        Look look = new Look(new MemoryPrefs());
        assertFalse(look.on());
        assertEquals(100, look.translation());
        assertEquals(100, look.original());
        assertEquals(75, look.background());
        assertFalse(look.moved());
        assertEquals(0, look.timing("a"));
        assertTrue(look.atDefaults("a"));
    }

    @Test
    public void keepsTheModeOnceTheSwitchIsFlipped() {
        MemoryPrefs prefs = new MemoryPrefs();
        Look look = new Look(prefs);
        assertNull(look.mode());
        int[] told = {0};
        look.setOnChange(() -> told[0]++);
        look.setMode(Version.STANDARD);
        look.setMode(Version.STANDARD);
        assertEquals(1, told[0]);
        assertEquals(Version.STANDARD, new Look(prefs).mode());
        look.setMode(Version.PREMIUM);
        assertEquals(Version.PREMIUM, new Look(prefs).mode());
        assertThrows(IllegalArgumentException.class, () -> look.setMode(Version.UPLOADED));
    }

    @Test
    public void stepsStopAtTheEndsOfTheirRanges() {
        Look look = new Look(new MemoryPrefs());
        look.stepTranslation(20);
        assertEquals(200, look.translation());
        look.stepTranslation(-30);
        assertEquals(50, look.translation());
        look.stepBackground(5);
        assertEquals(100, look.background());
        look.stepBackground(-20);
        assertEquals(0, look.background());
        look.stepTiming("a", 80);
        assertEquals(50, look.timing("a"));
        look.stepTiming("a", -120);
        assertEquals(-50, look.timing("a"));
    }

    @Test
    public void timingIsPerVideoAndKeptForThe200SetLast() {
        MemoryPrefs prefs = new MemoryPrefs();
        Look look = new Look(prefs);
        for (int i = 0; i <= 200; i++) look.stepTiming("v" + i, 3);
        assertEquals(0, look.timing("v0"));
        assertEquals(3, look.timing("v1"));
        assertEquals(3, look.timing("v200"));

        // Setting one again makes it the last set, so the next to go is the one after it.
        look.stepTiming("v1", 1);
        look.stepTiming("v201", 1);
        assertEquals(4, look.timing("v1"));
        assertEquals(0, look.timing("v2"));
        assertEquals(3, look.timing("v3"));

        Look reopened = new Look(prefs);
        assertEquals(4, reopened.timing("v1"));
        assertEquals(0, reopened.timing("v2"));
        assertEquals(1, reopened.timing("v201"));
    }

    @Test
    public void resetAllPutsBackThisVideoAndLeavesOriginalCaptionAndOtherVideos() {
        Look look = new Look(new MemoryPrefs());
        look.setDual(true);
        look.stepTranslation(3);
        look.stepOriginal(-2);
        look.stepBackground(-1);
        look.setPosition(0.1f, 0.2f);
        look.stepTiming("a", 4);
        look.stepTiming("b", 2);
        assertFalse(look.atDefaults("a"));

        look.resetAll("a");
        assertTrue(look.atDefaults("a"));
        assertTrue(look.dual());
        assertEquals(2, look.timing("b"));
        assertFalse(look.atDefaults("b"));
    }

    @Test
    public void whatWasSetIsReadBackByTheNextLook() {
        MemoryPrefs prefs = new MemoryPrefs();
        Look look = new Look(prefs);
        look.setOn(true);
        look.setDual(true);
        look.stepTranslation(1);
        look.setPosition(-0.25f, 0.5f);

        Look reopened = new Look(prefs);
        assertTrue(reopened.on());
        assertTrue(reopened.dual());
        assertEquals(110, reopened.translation());
        assertTrue(reopened.moved());
        assertEquals(-0.25f, reopened.positionX(), 0f);
        assertEquals(0.5f, reopened.positionY(), 0f);

        reopened.resetPosition();
        assertFalse(new Look(prefs).moved());
    }

    @Test
    public void aFreshInstallHasTheHintUntilItIsSeen() {
        MemoryPrefs prefs = new MemoryPrefs();
        assertTrue(new Look(prefs).hintPending());
        // Not seen yet: the next start still has it.
        Look again = new Look(prefs);
        assertTrue(again.hintPending());
        again.hintSeen();
        assertFalse(again.hintPending());
        assertFalse(new Look(prefs).hintPending());
    }

    @Test
    public void anUpdateHasNoHint() {
        // A release before the hint kept settings, but no "started".
        MemoryPrefs prefs = new MemoryPrefs();
        prefs.values.put("on", true);
        assertFalse(new Look(prefs).hintPending());
        assertTrue(prefs.values.containsKey("started"));
        assertFalse(new Look(prefs).hintPending());
    }

    @Test
    public void aSeenHintStaysGoneThoughNothingElseWasKept() {
        MemoryPrefs prefs = new MemoryPrefs();
        new Look(prefs).hintSeen();
        assertFalse(new Look(prefs).hintPending());
    }
}
