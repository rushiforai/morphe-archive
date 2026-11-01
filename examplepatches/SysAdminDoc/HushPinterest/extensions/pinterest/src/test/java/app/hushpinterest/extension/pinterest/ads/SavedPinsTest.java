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
import java.util.Collections;
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
 * Hide pins you've already saved, against stand-ins shaped like the pins the S22's Home and board
 * logged on 14.41.0: a Home pin someone else repinned has is_repin and nothing else, and a pin on your
 * own board has is_owned_by_viewer and pinned_to_board set as well.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SavedPinsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    @interface Json {
        String value();
    }

    static final class Board {
        @Json("id") String id = "board";
    }

    static final class Pin {
        @Json("id") String id;
        @Json("grid_title") String gridTitle = "";
        @Json("is_repin") Boolean repin;
        @Json("is_owned_by_viewer") Boolean owned;
        @Json("pinned_to_board") Board board;

        Pin(String id) {
            this.id = id;
        }

        @Override public String toString() {
            return id;
        }
    }

    /** No pin fields at all: a module's intro or anything else a page can carry. */
    static final class Intro {
        @Json("pinned_to_board") Board board = new Board();

        @Override public String toString() {
            return "intro";
        }
    }

    private final Pin fresh = new Pin("fresh");
    private final Pin repinned = new Pin("repinned");
    private final Pin saved = new Pin("saved");
    private final Pin owned = new Pin("owned");

    @Before
    public void shapes() {
        repinned.repin = true;
        repinned.owned = false;
        saved.board = new Board();
        owned.owned = true;
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_SAVED_PINS, PatchFamily.Capability.SAVE_AND_DOWNLOAD));
    }

    @After
    public void restore() {
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Settings.HIDE_SAVED_PINS.resetToDefault();
        Settings.SAVE_DOWNLOADED_PINS.resetToDefault();
        ModelFields.clearForTests();
        ModuleItems.clearForTests();
        HookStatus.clear();
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    @Test
    public void itStartsOffAndAsksHomeForNothingExtra() {
        assertFalse(Settings.HIDE_SAVED_PINS.get());
        String fields = "pin.{id,title},board.{id}";
        assertSame(fields, SavedPins.homeFields(fields));
        assertFalse(SavedPins.active());
    }

    @Test
    public void theFieldGoesAmongThePinsOwnWhereverTheyAre() {
        assertEquals("pin.{pinned_to_board,id,title},board.{id}", SavedPins.askingSaved("pin.{id,title},board.{id}"));
        assertEquals("board.{id},pin.{pinned_to_board,id},user.{id}", SavedPins.askingSaved("board.{id},pin.{id},user.{id}"));
    }

    /** A set with no pin fields of its own isn't touched, nor is a word that only ends in "pin". */
    @Test
    public void aListWithoutThePinsOwnFieldsStaysAsItWas() {
        for (String fields : Arrays.asList("", "board.{id}", "storypin.{id}", "board.{id},storypin.{id}", "pin.{id")) {
            assertSame(fields, SavedPins.askingSaved(fields));
        }
    }

    @Test
    public void aListThatAlreadyNamesItStaysAsItWas() {
        String fields = "pin.{id,pinned_to_board,title},board.{id}";
        assertSame(fields, SavedPins.askingSaved(fields));
        String other = "pin.{pinned_to_board_id},board.{id}";
        assertEquals("pin.{pinned_to_board,pinned_to_board_id},board.{id}", SavedPins.askingSaved(other));
    }

    @Test
    public void eitherSwitchAsksAndPauseStopsBoth() {
        String fields = "pin.{id}";
        Settings.HIDE_SAVED_PINS.save(true);
        assertEquals("pin.{pinned_to_board,id}", SavedPins.homeFields(fields));
        Settings.HIDE_SAVED_PINS.save(false);
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        assertEquals("pin.{pinned_to_board,id}", SavedPins.homeFields(fields));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertSame(fields, SavedPins.homeFields(fields));
    }

    /** A build where only the other patch went in has nothing that reads the answer, so it never asks. */
    @Test
    public void aSwitchWhosePatchIsOutAsksNothing() {
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_SAVED_PINS));
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        String fields = "pin.{id}";
        assertSame(fields, SavedPins.homeFields(fields));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.SAVE_AND_DOWNLOAD));
        Settings.SAVE_DOWNLOADED_PINS.resetToDefault();
        Settings.HIDE_SAVED_PINS.save(true);
        assertSame(fields, SavedPins.homeFields(fields));
    }

    @Test
    public void nullHandsBackNull() {
        Settings.HIDE_SAVED_PINS.save(true);
        assertEquals(null, SavedPins.homeFields(null));
        SavedPins.homePage(null);
        SavedPins.prune(null);
    }

    /**
     * A pin on your board and one you own go, in place, and the rest keep their order. A repin of
     * someone else's stays, since that only says it was saved from somewhere, and so does what isn't a pin.
     */
    @Test
    public void savedAndOwnedPinsLeaveAndTheRestKeepTheirOrder() {
        Intro intro = new Intro();
        List<Object> page = new ArrayList<>(Arrays.asList(fresh, saved, repinned, owned, intro));
        SavedPins.prune(page);
        assertEquals(Arrays.asList(fresh, repinned, intro), page);
        assertTrue(report(), report().contains(FamilyNames.FILTER_FEED) && report().contains("saved pin removed 2"));
    }

    @Test
    public void anEmptyPageIsLeftAlone() {
        SavedPins.prune(Collections.emptyList());
        assertFalse(report(), report().contains("saved pin removed"));
    }

    /** The switch reads off while paused, so a page that arrives then keeps every pin. */
    @Test
    public void pauseTurnsThePageHookOff() {
        Settings.HIDE_SAVED_PINS.save(true);
        assertTrue(SavedPins.active());
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(SavedPins.active());
    }
}
