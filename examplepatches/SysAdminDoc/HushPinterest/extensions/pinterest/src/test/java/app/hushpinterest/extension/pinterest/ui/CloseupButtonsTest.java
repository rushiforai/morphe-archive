/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.SaveButtonColorSetting;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CloseupButtonsTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    @Before public void ids() {
        // Pinterest's ids don't exist here, so the row's buttons wear made-up ones.
        CloseupButtons.likeId = View.generateViewId();
        CloseupButtons.commentsId = View.generateViewId();
        CloseupButtons.shareId = View.generateViewId();
        CloseupButtons.moreId = View.generateViewId();
        CloseupButtons.visitSiteId = View.generateViewId();
        CloseupButtons.saveId = View.generateViewId();
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.HIDE_CLOSEUP_BACK.resetToDefault();
        Settings.HIDE_CLOSEUP_LENS.resetToDefault();
        Settings.HIDE_CLOSEUP_SEARCH_LABEL.resetToDefault();
        Settings.HIDE_CLOSEUP_LIKE.resetToDefault();
        Settings.HIDE_CLOSEUP_COMMENTS.resetToDefault();
        Settings.HIDE_CLOSEUP_SHARE.resetToDefault();
        Settings.HIDE_CLOSEUP_MORE.resetToDefault();
        Settings.HIDE_CLOSEUP_REMIX.resetToDefault();
        Settings.HIDE_CLOSEUP_VISIT_SITE.resetToDefault();
        Settings.SMALLER_SAVE_BUTTON.resetToDefault();
        SaveButtonColorSetting.SAVE_BUTTON_COLOR.resetToDefault();
        CloseupButtons.likeId = -1;
        CloseupButtons.commentsId = -1;
        CloseupButtons.shareId = -1;
        CloseupButtons.moreId = -1;
        CloseupButtons.visitSiteId = -1;
        CloseupButtons.saveId = -1;
        HookStatus.clear();
    }

    private static View button() {
        return new View(RuntimeEnvironment.getApplication());
    }

    /** The row under a pin's picture as 14.42.0 lays it out: like and more sit in holders, comment and share wear their ids. */
    private static final class ActionBar {
        final FrameLayout bar = new FrameLayout(RuntimeEnvironment.getApplication());
        final LinearLayout row = new LinearLayout(RuntimeEnvironment.getApplication());
        final FrameLayout likeHolder = new FrameLayout(RuntimeEnvironment.getApplication());
        final View like = button();
        final View comments = button();
        final View share = button();
        final FrameLayout moreHolder = new FrameLayout(RuntimeEnvironment.getApplication());
        final View more = button();

        ActionBar(boolean moreNamed) {
            like.setId(CloseupButtons.likeId);
            comments.setId(CloseupButtons.commentsId);
            share.setId(CloseupButtons.shareId);
            if (moreNamed) more.setId(CloseupButtons.moreId);
            likeHolder.addView(like);
            moreHolder.addView(more);
            row.addView(likeHolder);
            row.addView(comments);
            row.addView(share);
            row.addView(moreHolder);
            bar.addView(row);
        }
    }

    /** A row that holds the Visit site button once Pinterest fills it in. */
    private static FrameLayout visitRow(boolean filled) {
        FrameLayout bar = new FrameLayout(RuntimeEnvironment.getApplication());
        LinearLayout group = new LinearLayout(RuntimeEnvironment.getApplication());
        bar.addView(group);
        if (filled) {
            View visit = button();
            visit.setId(CloseupButtons.visitSiteId);
            group.addView(visit);
        }
        return bar;
    }

    @Test public void offByDefaultBothButtonsShowAsPinterestAsks() {
        View back = button();
        View lens = button();
        CloseupButtons.backArrow(back);
        CloseupButtons.lens(lens);
        assertEquals(View.VISIBLE, back.getVisibility());
        assertEquals(View.VISIBLE, lens.getVisibility());
        assertEquals(View.VISIBLE, CloseupButtons.visibility(back, View.VISIBLE));
        assertEquals(View.INVISIBLE, CloseupButtons.visibility(lens, View.INVISIBLE));
    }

    @Test public void eachSwitchHidesOnlyItsOwnButtonAndHoldsItThroughPinterestsShowCalls() {
        Settings.HIDE_CLOSEUP_BACK.save(true);
        View back = button();
        View lens = button();
        CloseupButtons.backArrow(back);
        CloseupButtons.lens(lens);
        assertEquals(View.GONE, back.getVisibility());
        assertEquals(View.VISIBLE, lens.getVisibility());
        assertEquals("the arrow shown again as the closeup scrolls", View.GONE, CloseupButtons.visibility(back, View.VISIBLE));
        assertEquals("INVISIBLE would still take room", View.GONE, CloseupButtons.visibility(back, View.INVISIBLE));
        assertEquals(View.VISIBLE, CloseupButtons.visibility(lens, View.VISIBLE));

        Settings.HIDE_CLOSEUP_LENS.save(true);
        View nextLens = button();
        CloseupButtons.lens(nextLens);
        assertEquals(View.GONE, nextLens.getVisibility());
        assertEquals(View.GONE, CloseupButtons.visibility(nextLens, View.VISIBLE));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("back arrow hidden"));
        assertTrue(report, report.contains("visual search hidden"));
    }

    @Test public void iconButtonsThatWerentHandedOverAreLeftAlone() {
        Settings.HIDE_CLOSEUP_BACK.save(true);
        Settings.HIDE_CLOSEUP_LENS.save(true);
        // Held here, so the marked arrow stays in the weak map and the lookup below is really made.
        View marked = button();
        CloseupButtons.backArrow(marked);
        View other = button();
        assertEquals(View.VISIBLE, CloseupButtons.visibility(other, View.VISIBLE));
        assertEquals(View.INVISIBLE, CloseupButtons.visibility(other, View.INVISIBLE));
        assertEquals(View.VISIBLE, CloseupButtons.visibility(null, View.VISIBLE));
        assertEquals(View.GONE, CloseupButtons.visibility(marked, View.VISIBLE));
        CloseupButtons.backArrow(null);
        CloseupButtons.lens(null);
    }

    @Test public void offOrPausedPinterestCanShowTheButtonAndTheNextCloseupKeepsIt() {
        Settings.HIDE_CLOSEUP_BACK.save(true);
        View back = button();
        CloseupButtons.backArrow(back);
        assertEquals(View.GONE, back.getVisibility());

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals(View.VISIBLE, CloseupButtons.visibility(back, View.VISIBLE));
        View next = button();
        CloseupButtons.backArrow(next);
        assertEquals("paused, the next closeup's arrow shows", View.VISIBLE, next.getVisibility());
        PauseForTests.resume();

        Settings.HIDE_CLOSEUP_BACK.save(false);
        assertEquals(View.VISIBLE, CloseupButtons.visibility(back, View.VISIBLE));
        View after = button();
        CloseupButtons.backArrow(after);
        assertEquals("off, the next closeup's arrow shows", View.VISIBLE, after.getVisibility());
    }

    @Test public void pinterestsOwnGoneAlwaysGoesThrough() {
        View back = button();
        CloseupButtons.backArrow(back);
        assertEquals(View.GONE, CloseupButtons.visibility(back, View.GONE));
        Settings.HIDE_CLOSEUP_BACK.save(true);
        assertEquals(View.GONE, CloseupButtons.visibility(back, View.GONE));
        assertFalse("the lens switch stays off", Settings.HIDE_CLOSEUP_LENS.savedValue());
    }

    @Test public void searchLabelKeepsPinterestsFlagUntilItsSwitchIsOn() {
        assertTrue("off, the first pins of a day keep their label", CloseupButtons.searchLabel(true));
        assertFalse(CloseupButtons.searchLabel(false));

        Settings.HIDE_CLOSEUP_SEARCH_LABEL.save(true);
        assertFalse("on, the label is left off", CloseupButtons.searchLabel(true));
        assertFalse("a pin Pinterest wouldn't label stays unlabeled", CloseupButtons.searchLabel(false));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("search image label left off"));
        assertFalse("the lens switch stays off", Settings.HIDE_CLOSEUP_LENS.savedValue());

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertTrue("paused, Pinterest's label shows again", CloseupButtons.searchLabel(true));
    }

    @Test public void eachSwitchUnderThePictureHidesOnlyItsOwnButtonAndHoldsIt() {
        ActionBar shown = new ActionBar(true);
        CloseupButtons.actionBar(shown.bar);
        for (View child : new View[] {shown.likeHolder, shown.comments, shown.share, shown.moreHolder}) {
            assertEquals("off by default", View.VISIBLE, child.getVisibility());
        }

        Settings.HIDE_CLOSEUP_LIKE.save(true);
        Settings.HIDE_CLOSEUP_MORE.save(true);
        ActionBar bar = new ActionBar(true);
        CloseupButtons.actionBar(bar.bar);
        assertEquals("the like's holder goes, so it takes no room", View.GONE, bar.likeHolder.getVisibility());
        assertEquals(View.VISIBLE, bar.comments.getVisibility());
        assertEquals(View.VISIBLE, bar.share.getVisibility());
        assertEquals(View.GONE, bar.moreHolder.getVisibility());
        assertEquals("the row itself stays", View.VISIBLE, bar.row.getVisibility());
        assertEquals(View.VISIBLE, bar.bar.getVisibility());
        assertEquals("Pinterest shows the like again", View.GONE, CloseupButtons.visibility(bar.likeHolder, View.VISIBLE));
        assertEquals(View.VISIBLE, CloseupButtons.visibility(bar.comments, View.VISIBLE));
        assertEquals("the switch read again, so turning it on holds the row handed over earlier",
                View.VISIBLE, CloseupButtons.visibility(shown.comments, View.VISIBLE));

        Settings.HIDE_CLOSEUP_COMMENTS.save(true);
        Settings.HIDE_CLOSEUP_SHARE.save(true);
        assertEquals(View.GONE, CloseupButtons.visibility(shown.comments, View.VISIBLE));
        ActionBar next = new ActionBar(true);
        CloseupButtons.actionBar(next.bar);
        assertEquals(View.GONE, next.comments.getVisibility());
        assertEquals(View.GONE, next.share.getVisibility());
        String report = String.join("\n", HookStatus.report());
        for (String hidden : new String[] {"like hidden", "comments hidden", "share hidden", "more hidden"}) {
            assertTrue(report, report.contains(hidden));
        }
    }

    @Test public void aRowHandedOverBeforeItsButtonsFindsThemAsItsLaidOut() {
        Settings.HIDE_CLOSEUP_LIKE.save(true);
        Settings.HIDE_CLOSEUP_MORE.save(true);
        ActionBar bar = new ActionBar(false);
        // Pinterest hands the row over right after its parent's constructor, before it has buttons.
        bar.bar.removeView(bar.row);
        CloseupButtons.actionBar(bar.bar);
        bar.bar.addView(bar.row);
        bar.bar.layout(0, 0, 100, 40);
        assertEquals(View.GONE, bar.likeHolder.getVisibility());
        assertEquals("more isn't named yet", View.VISIBLE, bar.moreHolder.getVisibility());
        bar.more.setId(CloseupButtons.moreId);
        bar.bar.layout(0, 0, 200, 40);
        assertEquals(View.GONE, bar.moreHolder.getVisibility());
        assertEquals("the comment's switch is off", View.VISIBLE, bar.comments.getVisibility());
    }

    @Test public void aBuildWithoutTheRowsIdsLeavesItAlone() {
        Settings.HIDE_CLOSEUP_LIKE.save(true);
        Settings.HIDE_CLOSEUP_COMMENTS.save(true);
        ActionBar bar = new ActionBar(true);
        CloseupButtons.likeId = -1;
        CloseupButtons.commentsId = -1;
        CloseupButtons.shareId = -1;
        CloseupButtons.moreId = -1;
        CloseupButtons.actionBar(bar.bar);
        assertEquals(View.VISIBLE, bar.likeHolder.getVisibility());
        assertEquals(View.VISIBLE, bar.comments.getVisibility());
        assertEquals("looked up once, then known to be missing", 0, CloseupButtons.commentsId);
        CloseupButtons.actionBar(null);
        CloseupButtons.visitSite(null);
        CloseupButtons.remix(null);
    }

    @Test public void theVisitSiteRowGoesWholeOnlyOnceTheButtonIsInIt() {
        Settings.HIDE_CLOSEUP_VISIT_SITE.save(true);
        FrameLayout empty = visitRow(false);
        CloseupButtons.visitSite(empty);
        assertEquals("a row without the button is some other row", View.VISIBLE, empty.getVisibility());
        assertEquals(View.VISIBLE, CloseupButtons.visibility(empty, View.VISIBLE));

        FrameLayout filled = visitRow(true);
        CloseupButtons.visitSite(filled);
        assertEquals(View.GONE, filled.getVisibility());
        assertEquals(View.GONE, CloseupButtons.visibility(filled, View.VISIBLE));
        assertTrue(String.join("\n", HookStatus.report()).contains("visit site hidden"));

        FrameLayout late = visitRow(false);
        CloseupButtons.visitSite(late);
        late.layout(0, 0, 100, 40);
        assertEquals("not filled in yet", View.VISIBLE, late.getVisibility());
        View visit = button();
        visit.setId(CloseupButtons.visitSiteId);
        ((LinearLayout) late.getChildAt(0)).addView(visit);
        late.layout(0, 0, 200, 40);
        assertEquals("filled in, then laid out", View.GONE, late.getVisibility());

        Settings.HIDE_CLOSEUP_VISIT_SITE.save(false);
        assertEquals(View.VISIBLE, CloseupButtons.visibility(filled, View.VISIBLE));
    }

    @Test public void theRemixButtonHidesWithItsSwitchAndPausedItShows() {
        View off = button();
        CloseupButtons.remix(off);
        assertEquals(View.VISIBLE, off.getVisibility());

        Settings.HIDE_CLOSEUP_REMIX.save(true);
        View remix = button();
        CloseupButtons.remix(remix);
        assertEquals(View.GONE, remix.getVisibility());
        assertEquals(View.GONE, CloseupButtons.visibility(remix, View.VISIBLE));
        assertTrue(String.join("\n", HookStatus.report()).contains("remix hidden"));
        assertFalse("the lens switch stays off", Settings.HIDE_CLOSEUP_LENS.savedValue());

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals(View.VISIBLE, CloseupButtons.visibility(remix, View.VISIBLE));
    }

    private static final int RED = 0xFFE60023, GRAY = 0xFFEFEFEF, WHITE = 0xFFFFFFFF, BLACK = 0xFF111111;

    /** A Gestalt button the way Pinterest builds one: a shape under a ripple, colored by its tint. */
    private static Button gestaltButton(int id) {
        Button button = new Button(RuntimeEnvironment.getApplication());
        button.setId(id);
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(GRAY), new GradientDrawable(), null));
        return button;
    }

    /** What Pinterest does when a button's colors change, then the hook right after. */
    private static void style(Button button, int background, int text) {
        ColorStateList colors = ColorStateList.valueOf(background);
        button.setBackgroundTintList(colors);
        ((RippleDrawable) button.getBackground()).getDrawable(0).mutate().setTintList(colors);
        button.setTextColor(text);
        CloseupButtons.saveButton(button);
    }

    private static int tint(Button button) {
        return button.getBackgroundTintList().getDefaultColor();
    }

    @Test public void untouchedTheSaveButtonIsPinterestsOwn() {
        Button save = gestaltButton(CloseupButtons.saveId);
        style(save, RED, WHITE);
        assertEquals(RED, tint(save));
        assertEquals(1f, save.getScaleX(), 0f);
        assertEquals(WHITE, save.getCurrentTextColor());
    }

    @Test public void aColorPaintsOnlyTheRedSaveButtonAndSavedKeepsPinterestsLook() {
        SaveButtonColorSetting.SAVE_BUTTON_COLOR.save("#3366ff");
        Button save = gestaltButton(CloseupButtons.saveId);
        style(save, RED, WHITE);
        assertEquals(0xFF3366FF, tint(save));
        assertEquals("a dark color keeps Pinterest's white text", WHITE, save.getCurrentTextColor());
        assertTrue(String.join("\n", HookStatus.report()).contains("save button painted"));

        Button other = gestaltButton(View.generateViewId());
        style(other, RED, WHITE);
        assertEquals("another red Gestalt button", RED, tint(other));

        style(save, GRAY, BLACK);
        assertEquals("Saved", GRAY, tint(save));
        style(save, RED, WHITE);
        assertEquals("Save again", 0xFF3366FF, tint(save));
        // A new look that leaves the colors alone, the way Pinterest skips them when they didn't change.
        CloseupButtons.saveButton(save);
        assertEquals(0xFF3366FF, tint(save));
    }

    @Test public void aLightColorGetsDarkTextAndClearingItPutsPinterestsBack() {
        Button save = gestaltButton(CloseupButtons.saveId);
        style(save, RED, WHITE);
        ColorStateList red = save.getBackgroundTintList();
        ColorStateList white = save.getTextColors();

        SaveButtonColorSetting.SAVE_BUTTON_COLOR.save("#FC0");
        CloseupButtons.saveButton(save);
        assertEquals(0xFFFFCC00, tint(save));
        assertEquals(CloseupButtons.DARK_TEXT, save.getCurrentTextColor());

        SaveButtonColorSetting.SAVE_BUTTON_COLOR.save("");
        CloseupButtons.saveButton(save);
        assertTrue("Pinterest's red, the same colors it put on", save.getBackgroundTintList() == red);
        assertTrue("Pinterest's text colors", save.getTextColors() == white);
    }

    @Test public void theSwitchDrawsTheSaveButtonSmallerAtTheEndOfItsRow() {
        Settings.SMALLER_SAVE_BUTTON.save(true);
        Button save = gestaltButton(CloseupButtons.saveId);
        style(save, RED, WHITE);
        assertEquals(CloseupButtons.SMALLER, save.getScaleX(), 0f);
        assertEquals(CloseupButtons.SMALLER, save.getScaleY(), 0f);
        assertEquals("still Pinterest's red", RED, tint(save));
        save.layout(0, 0, 200, 80);
        assertEquals(200f, save.getPivotX(), 0f);
        assertEquals(40f, save.getPivotY(), 0f);
        assertTrue(String.join("\n", HookStatus.report()).contains("save button smaller"));

        Button other = gestaltButton(View.generateViewId());
        style(other, RED, WHITE);
        assertEquals("another Gestalt button", 1f, other.getScaleX(), 0f);

        Settings.SMALLER_SAVE_BUTTON.save(false);
        CloseupButtons.saveButton(save);
        assertEquals(1f, save.getScaleX(), 0f);
        assertEquals(1f, save.getScaleY(), 0f);
    }

    @Test public void pausedTheSaveButtonIsPinterestsAgain() {
        Settings.SMALLER_SAVE_BUTTON.save(true);
        SaveButtonColorSetting.SAVE_BUTTON_COLOR.save("#FFFFFF");
        Button save = gestaltButton(CloseupButtons.saveId);
        style(save, RED, WHITE);
        assertEquals(WHITE, tint(save));
        assertEquals(CloseupButtons.DARK_TEXT, save.getCurrentTextColor());

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        CloseupButtons.saveButton(save);
        assertEquals(1f, save.getScaleX(), 0f);
        assertEquals(RED, tint(save));
        assertEquals(WHITE, save.getCurrentTextColor());
        assertTrue("the saved color stays", "#FFFFFF".equals(SaveButtonColorSetting.SAVE_BUTTON_COLOR.savedValue()));
    }

    @Test public void aBuildWithoutTheSaveButtonsIdLeavesEveryButtonAlone() {
        Settings.SMALLER_SAVE_BUTTON.save(true);
        SaveButtonColorSetting.SAVE_BUTTON_COLOR.save("#3366FF");
        Button save = gestaltButton(View.NO_ID);
        CloseupButtons.saveId = 0;
        style(save, RED, WHITE);
        assertEquals(RED, tint(save));
        assertEquals(1f, save.getScaleX(), 0f);
    }
}
