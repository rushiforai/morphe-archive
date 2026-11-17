/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.TransitionDrawable;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AmoledBlackTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    /** Pinterest's sema_color_background_elevation at night, the bar's warm gray. */
    private static final int ELEVATION = 0xFF33332E;
    /** A pin page's own dark gray, which the strip behind the gesture handle takes there. */
    private static final int PAGE = 0xFF18181B;
    /** Pinterest's sema_color_background_secondary at night, the See more and See less cards' gray. */
    private static final int SECONDARY = 0xFF494943;
    /** The same color at night in 14.42.0's deniminkhc theme, a 40% gray the sheet shows through. */
    private static final int SEE_THROUGH_SECONDARY = 0x66A1A1AF;
    /** The reactions header's gray on a video pin's comments in 14.42.0. */
    private static final int REACTIONS = 0xFF222226;
    /** navigation_bar_background's id in 14.39.0. A sheet's fills use 1 to 3. */
    private static final int STRIP = 0x7f0a0dae;

    @After public void restore() {
        PauseForTests.resume();
        Settings.BLACK_BOTTOM_BAR.resetToDefault();
        Settings.BLACK_COMMENTS.resetToDefault();
        Settings.BLACK_PIN_MENU.resetToDefault();
        Settings.BLACK_SAVE_SHEET.resetToDefault();
        Settings.BLACK_SHEETS.resetToDefault();
        Settings.BLACK_BOARDS.resetToDefault();
        HookStatus.clear();
        AmoledBlack.tabRoot = -1;
        AmoledBlack.searchText = -1;
        AmoledBlack.searchContainer = -1;
        AmoledBlack.gestureStrip = -1;
        AmoledBlack.headerImage = -1;
        AmoledBlack.headerBlur = -1;
    }

    @Test public void separateTabsTintedGrayTurnBlackAndOffGivesTheTintBack() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.tabRoot = View.generateViewId();
        LinearLayout bar = bar(true);
        LinearLayout row = (LinearLayout) bar.getChildAt(0);
        row.setBackground(null);
        View pill = tab(row, ELEVATION);
        View glass = tab(row, 0x8033332E);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, pill.getBackgroundTintList().getDefaultColor());
        assertEquals("the rounded shape under the tint stays", Color.WHITE,
                ((GradientDrawable) pill.getBackground()).getColor().getDefaultColor());
        assertEquals("a see-through tab keeps its look", 0x8033332E, glass.getBackgroundTintList().getDefaultColor());
        Settings.BLACK_BOTTOM_BAR.save(false);
        AmoledBlack.bottomBar(bar);
        assertEquals(ELEVATION, pill.getBackgroundTintList().getDefaultColor());
    }

    @Test public void aTabBuiltAfterTheBarsLastDrawTurnsBlackOnTheNextLayout() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.tabRoot = View.generateViewId();
        LinearLayout bar = bar(true);
        LinearLayout row = (LinearLayout) bar.getChildAt(0);
        AmoledBlack.bottomBar(bar);
        // Pinterest builds a tab on a navigation change. Only the row redraws, so the bar's draw hook doesn't run.
        View late = tab(row, ELEVATION);
        bar.layout(0, 0, 320, 64);
        assertEquals(Color.BLACK, late.getBackgroundTintList().getDefaultColor());
        Settings.BLACK_BOTTOM_BAR.save(false);
        bar.layout(0, 0, 320, 72);
        assertEquals("a layout pass with the switch off gives the tint back", ELEVATION, late.getBackgroundTintList().getDefaultColor());
    }

    @Test public void glassUnderTheBarWashesBlackAndOtherGlassKeepsItsColor() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        int wash = 0x80242421;
        LinearLayout bar = bar(true);
        FrameLayout tab = new FrameLayout(bar.getContext());
        View glass = new View(bar.getContext());
        tab.addView(glass);
        ((LinearLayout) bar.getChildAt(0)).addView(tab);
        assertEquals("a bar that hasn't drawn yet isn't known", wash, AmoledBlack.blurFill(glass, wash));
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, AmoledBlack.blurFill(glass, wash));
        assertEquals("glass anywhere else keeps Pinterest's wash", wash, AmoledBlack.blurFill(new View(bar.getContext()), wash));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals("Pause gives the wash back on the next frame", wash, AmoledBlack.blurFill(glass, wash));
        PauseForTests.resume();
        LinearLayout light = bar(false);
        View lightGlass = new View(light.getContext());
        light.addView(lightGlass);
        AmoledBlack.bottomBar(light);
        assertEquals("light mode is left alone", wash, AmoledBlack.blurFill(lightGlass, wash));
        Settings.BLACK_BOTTOM_BAR.save(false);
        assertEquals("off gives the wash back on the next frame", wash, AmoledBlack.blurFill(glass, wash));
    }

    @Test public void aSearchTabsPillTurnsBlackWhereverItKeepsItsFill() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.tabRoot = View.generateViewId();
        AmoledBlack.searchText = View.generateViewId();
        AmoledBlack.searchContainer = View.generateViewId();
        LinearLayout bar = bar(true);
        LinearLayout row = (LinearLayout) bar.getChildAt(0);
        GradientDrawable onPill = searchTab(row, false);
        GradientDrawable onContainer = searchTab(row, true);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, onPill.getColor().getDefaultColor());
        assertEquals(Color.BLACK, onContainer.getColor().getDefaultColor());
        Settings.BLACK_BOTTOM_BAR.save(false);
        AmoledBlack.bottomBar(bar);
        assertEquals(ELEVATION, onPill.getColor().getDefaultColor());
        assertEquals(ELEVATION, onContainer.getColor().getDefaultColor());
    }

    /**
     * Where the bar floats over the page and the phone doesn't blur, the pill is Pinterest's
     * searchfield_bg_transparent, a shape filled with its half see-through wash. On an API 36
     * emulator it stayed gray over the page beside a black Home and Saved.
     */
    @Test public void aSearchTabsSeeThroughPillTurnsBlackAndOffGivesItsWashBack() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.tabRoot = View.generateViewId();
        AmoledBlack.searchText = View.generateViewId();
        AmoledBlack.searchContainer = View.generateViewId();
        int wash = 0x80242421;
        LinearLayout bar = bar(true);
        LinearLayout row = (LinearLayout) bar.getChildAt(0);
        GradientDrawable onPill = searchTab(row, false);
        onPill.setColor(wash);
        GradientDrawable onContainer = searchTab(row, true);
        onContainer.setColor(wash);
        GradientDrawable underGlass = searchTab(row, false);
        underGlass.setColor(Color.TRANSPARENT);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, onPill.getColor().getDefaultColor());
        assertEquals(Color.BLACK, onContainer.getColor().getDefaultColor());
        assertEquals("a pill with no fill of its own was given one", Color.TRANSPARENT, underGlass.getColor().getDefaultColor());
        Settings.BLACK_BOTTOM_BAR.save(false);
        AmoledBlack.bottomBar(bar);
        assertEquals(wash, onPill.getColor().getDefaultColor());
        assertEquals(wash, onContainer.getColor().getDefaultColor());
    }

    @Test public void theStripUnderTheBarTurnsBlackAndOffGivesItsColorBack() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.gestureStrip = View.generateViewId();
        LinearLayout bar = bar(true);
        FrameLayout window = new FrameLayout(bar.getContext());
        window.addView(bar);
        View strip = new View(bar.getContext());
        strip.setId(AmoledBlack.gestureStrip);
        strip.setBackgroundColor(0xFF222226);
        window.addView(strip);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, ((ColorDrawable) strip.getBackground()).getColor());
        Settings.BLACK_BOTTOM_BAR.save(false);
        AmoledBlack.bottomBar(bar);
        assertEquals(0xFF222226, ((ColorDrawable) strip.getBackground()).getColor());
    }

    @Test public void aStripAddedAfterTheBarsFirstDrawStillTurnsBlack() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.gestureStrip = View.generateViewId();
        LinearLayout bar = bar(true);
        FrameLayout window = new FrameLayout(bar.getContext());
        window.addView(bar);
        AmoledBlack.bottomBar(bar);
        View strip = new View(bar.getContext());
        strip.setId(AmoledBlack.gestureStrip);
        strip.setBackgroundColor(0xFF222226);
        window.addView(strip);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, ((ColorDrawable) strip.getBackground()).getColor());
    }

    @Test public void offByDefaultTheBarKeepsPinterestsGray() {
        LinearLayout bar = bar(true);
        GradientDrawable row = rowFill(bar);
        AmoledBlack.bottomBar(bar);
        assertEquals(ELEVATION, row.getColor().getDefaultColor());
    }

    @Test public void onInDarkModeTheTabRowTurnsBlackAndOffGivesTheGrayBack() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        LinearLayout bar = bar(true);
        GradientDrawable row = rowFill(bar);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, row.getColor().getDefaultColor());
        assertSame("the row keeps its own drawable, so its rounded shape stays", row, bar.getChildAt(0).getBackground());
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, row.getColor().getDefaultColor());
        Settings.BLACK_BOTTOM_BAR.save(false);
        AmoledBlack.bottomBar(bar);
        assertEquals(ELEVATION, row.getColor().getDefaultColor());
    }

    @Test public void pauseBringsTheGrayBackOnTheNextFrame() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        LinearLayout bar = bar(true);
        GradientDrawable row = rowFill(bar);
        AmoledBlack.bottomBar(bar);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        AmoledBlack.bottomBar(bar);
        assertEquals(ELEVATION, row.getColor().getDefaultColor());
    }

    @Test public void lightModeIsLeftAlone() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        LinearLayout bar = bar(false);
        GradientDrawable row = rowFill(bar);
        row.setColor(Color.WHITE);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.WHITE, row.getColor().getDefaultColor());
    }

    @Test public void theBarsOwnSolidFillTurnsBlackToo() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        LinearLayout bar = bar(true);
        bar.setBackgroundColor(ELEVATION);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, ((ColorDrawable) bar.getBackground()).getColor());
        Settings.BLACK_BOTTOM_BAR.save(false);
        AmoledBlack.bottomBar(bar);
        assertEquals(ELEVATION, ((ColorDrawable) bar.getBackground()).getColor());
    }

    @Test public void gradientsTranslucentFillsAndOtherViewsKeepTheirLook() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        LinearLayout bar = bar(true);
        // The scrim behind a floating bar and the shadow strip above an anchored one are gradients.
        GradientDrawable scrim = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[] {0x0A000000, 0});
        bar.setBackground(scrim);
        View shadow = new View(bar.getContext());
        GradientDrawable strip = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[] {0x0A000000, 0});
        shadow.setBackground(strip);
        bar.addView(shadow);
        FrameLayout upload = new FrameLayout(bar.getContext());
        upload.setBackgroundColor(ELEVATION);
        bar.addView(upload);
        LinearLayout veil = new LinearLayout(bar.getContext());
        veil.setBackgroundColor(0x8033332E);
        bar.addView(veil);
        AmoledBlack.bottomBar(bar);
        assertSame(scrim, bar.getBackground());
        assertEquals(null, scrim.getColor());
        assertEquals(null, strip.getColor());
        assertEquals(ELEVATION, ((ColorDrawable) upload.getBackground()).getColor());
        assertEquals(0x8033332E, ((ColorDrawable) veil.getBackground()).getColor());
    }

    @Test public void anotherDrawableFromTheSameResourceKeepsItsGray() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        LinearLayout bar = bar(true);
        GradientDrawable row = rowFill(bar);
        Drawable menu = row.getConstantState().newDrawable();
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, row.getColor().getDefaultColor());
        assertEquals(ELEVATION, ((GradientDrawable) menu).getColor().getDefaultColor());
    }

    @Test public void aPinsMenuTurnsBlackAndTheNextMenuPinterestBuildsStartsGray() {
        Settings.BLACK_PIN_MENU.save(true);
        FrameLayout menu = sheet(true, "modal_header", "modal_container");
        View header = fill(menu, 1, card());
        View list = fill(menu, 2, new ColorDrawable(ELEVATION));
        // Android keeps the first card it loads and builds each later one from it.
        Drawable.ConstantState loaded = header.getBackground().getConstantState();
        AmoledBlack.pinMenu(menu);
        assertEquals(Color.BLACK, cardColor(header.getBackground()));
        assertEquals(Color.BLACK, ((ColorDrawable) list.getBackground()).getColor());
        assertEquals("the next menu's card comes out of Android's copy gray", ELEVATION, cardColor(loaded.newDrawable()));
        Settings.BLACK_PIN_MENU.save(false);
        menu.layout(0, 0, 320, 480);
        assertEquals("a layout pass with the switch off gives the gray back", ELEVATION, cardColor(header.getBackground()));
        assertEquals(ELEVATION, ((ColorDrawable) list.getBackground()).getColor());
    }

    /**
     * Seen on Pinterest 14.42.0 (#21): a pin's menu shows See more and See less on rounded cards its
     * builder makes apart from the sheet, so the sheet's own fills never reached them.
     */
    @Test public void aPinMenusSeeMoreCardTurnsBlackAndOffOrLightModeKeepsItsGray() {
        Settings.BLACK_PIN_MENU.save(true);
        LinearLayout card = seeMoreCard(true);
        Drawable.ConstantState loaded = card.getBackground().getConstantState();
        AmoledBlack.pinMenuCard(card);
        assertEquals(Color.BLACK, rippleColor(card.getBackground()));
        assertEquals("a card built from the same resource keeps its own gray", SECONDARY, rippleColor(loaded.newDrawable()));
        Settings.BLACK_PIN_MENU.save(false);
        card.layout(0, 0, 160, 96);
        assertEquals("a layout pass with the switch off gives the gray back", SECONDARY, rippleColor(card.getBackground()));
        Settings.BLACK_PIN_MENU.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        LinearLayout paused = seeMoreCard(true);
        AmoledBlack.pinMenuCard(paused);
        assertEquals("Pause keeps the gray", SECONDARY, rippleColor(paused.getBackground()));
        PauseForTests.resume();
        LinearLayout light = seeMoreCard(false);
        AmoledBlack.pinMenuCard(light);
        assertEquals("light mode is left alone", SECONDARY, rippleColor(light.getBackground()));
        Settings.BLACK_COMMENTS.save(true);
        Settings.BLACK_PIN_MENU.save(false);
        LinearLayout other = seeMoreCard(true);
        AmoledBlack.pinMenuCard(other);
        assertEquals("the comments switch leaves the cards alone", SECONDARY, rippleColor(other.getBackground()));
    }

    /**
     * Seen on Pinterest 14.42.0 on a phone (#21): the cards came out #3a3a41 over the black sheet,
     * since the theme there gives them a see-through gray that only an opaque fill check passed over.
     */
    @Test public void aSeeMoreCardsSeeThroughGrayTurnsBlackAndOffGivesItBack() {
        Settings.BLACK_PIN_MENU.save(true);
        LinearLayout card = seeMoreCard(true, SEE_THROUGH_SECONDARY);
        AmoledBlack.pinMenuCard(card);
        assertEquals(Color.BLACK, rippleColor(card.getBackground()));
        Settings.BLACK_PIN_MENU.save(false);
        card.layout(0, 0, 160, 96);
        assertEquals(SEE_THROUGH_SECONDARY, rippleColor(card.getBackground()));
        Settings.BLACK_PIN_MENU.save(true);
        LinearLayout clear = seeMoreCard(true, Color.TRANSPARENT);
        AmoledBlack.pinMenuCard(clear);
        assertEquals("a card with no fill at all stays clear", Color.TRANSPARENT, rippleColor(clear.getBackground()));
    }

    @Test public void theCommentsScreenTurnsBlackAndAFillPinterestSwapsInLaterFollowsOnTheNextLayout() {
        Settings.BLACK_COMMENTS.save(true);
        FrameLayout screen = sheet(true, "comments_feed", "comment_bottom_bar", "floating_comment_view");
        View feed = fill(screen, 1, card());
        GradientDrawable replyBar = solid();
        fill(screen, 2, replyBar);
        View floating = fill(screen, 3, new ColorDrawable(ELEVATION));
        View photo = fill(screen, View.NO_ID, new ColorDrawable(ELEVATION));
        AmoledBlack.comments(screen);
        assertEquals(Color.BLACK, cardColor(feed.getBackground()));
        assertEquals(Color.BLACK, replyBar.getColor().getDefaultColor());
        assertEquals(Color.BLACK, ((ColorDrawable) floating.getBackground()).getColor());
        assertEquals("a view the screen isn't painted by keeps its color", ELEVATION, ((ColorDrawable) photo.getBackground()).getColor());
        // A full-height sheet gets a plain shape after the screen was handed over.
        GradientDrawable fullHeight = solid();
        feed.setBackground(fullHeight);
        screen.layout(0, 0, 320, 480);
        assertEquals(Color.BLACK, fullHeight.getColor().getDefaultColor());
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        screen.layout(0, 0, 320, 520);
        assertEquals("Pause gives the gray back on the next layout", ELEVATION, fullHeight.getColor().getDefaultColor());
        assertEquals(ELEVATION, replyBar.getColor().getDefaultColor());
        assertEquals(ELEVATION, ((ColorDrawable) floating.getBackground()).getColor());
    }

    /**
     * Seen on Pinterest 14.42.0 on a phone (#12): opening a video pin's comments showed a gray band
     * across the top of the black list for about a quarter of a second. Pinterest shows a reactions
     * header there in its own gray while the comments load, then hides it. The screen has two of
     * them, one above the list and one laid over its top, and the second one is the band.
     */
    @Test public void theReactionsHeadersShownWhileTheCommentsLoadTurnBlackAndOffGivesTheirGrayBack() {
        Settings.BLACK_COMMENTS.save(true);
        FrameLayout screen = sheet(true, "comments_feed", "comment_bottom_bar", "floating_comment_view",
                "comment_reaction_header", "community_insight_comment_header");
        View reactions = fill(screen, 4, new ColorDrawable(REACTIONS));
        View overList = fill(screen, 5, new ColorDrawable(REACTIONS));
        AmoledBlack.comments(screen);
        assertEquals(Color.BLACK, ((ColorDrawable) reactions.getBackground()).getColor());
        assertEquals("the header over the list", Color.BLACK, ((ColorDrawable) overList.getBackground()).getColor());
        Settings.BLACK_COMMENTS.save(false);
        screen.layout(0, 0, 320, 480);
        assertEquals(REACTIONS, ((ColorDrawable) reactions.getBackground()).getColor());
        assertEquals(REACTIONS, ((ColorDrawable) overList.getBackground()).getColor());
        Settings.BLACK_PIN_MENU.save(true);
        FrameLayout menu = sheet(true, "modal_header", "modal_container", "unused", "comment_reaction_header");
        View inMenu = fill(menu, 4, new ColorDrawable(REACTIONS));
        AmoledBlack.pinMenu(menu);
        assertEquals("a pin's menu doesn't paint the header", REACTIONS, ((ColorDrawable) inMenu.getBackground()).getColor());
    }

    /**
     * The Save to sheet (#31) is handed over before it has a background. Pinterest then gives it a
     * transition between a rounded gray card, while it's part way up, and a square one all the way up.
     * Both turn black on the next layout pass, and the red Create new board button stays red while
     * the gray footer row under it turns black. Painting mutates the transition, which rebuilds its
     * layers, so they're read back from the view.
     */
    @Test public void theSaveToSheetTurnsBlackOnceItHasItsBackgroundAndOffGivesTheGrayBack() {
        Settings.BLACK_SAVE_SHEET.save(true);
        FrameLayout root = sheet(true, "draggable_sheet", "gestalt_sheet_header", "footer_container");
        View draggable = fill(root, 1, null);
        View header = fill(root, 2, null);
        View footer = fill(root, 3, new ColorDrawable(REACTIONS));
        View button = fill(root, View.NO_ID, new ColorDrawable(0xFFE60023));
        AmoledBlack.saveSheet(root);
        GradientDrawable partWay = solid();
        partWay.setCornerRadius(32f);
        GradientDrawable allTheWay = solid();
        draggable.setBackground(new TransitionDrawable(new Drawable[] {partWay, allTheWay}));
        header.setBackground(new ColorDrawable(ELEVATION));
        root.layout(0, 0, 320, 480);
        assertEquals(Color.BLACK, layer(draggable, 0));
        assertEquals("all the way up too", Color.BLACK, layer(draggable, 1));
        assertEquals("still rounded part way up", 32f, ((GradientDrawable) ((LayerDrawable) draggable.getBackground()).getDrawable(0)).getCornerRadius(), 0f);
        assertEquals(Color.BLACK, ((ColorDrawable) header.getBackground()).getColor());
        assertEquals("the row under the button", Color.BLACK, ((ColorDrawable) footer.getBackground()).getColor());
        assertEquals("the Create new board button keeps its red", 0xFFE60023, ((ColorDrawable) button.getBackground()).getColor());
        Settings.BLACK_SAVE_SHEET.save(false);
        root.layout(0, 0, 320, 520);
        assertEquals(ELEVATION, layer(draggable, 0));
        assertEquals(ELEVATION, layer(draggable, 1));
        assertEquals(ELEVATION, ((ColorDrawable) header.getBackground()).getColor());
        assertEquals(REACTIONS, ((ColorDrawable) footer.getBackground()).getColor());
        Settings.BLACK_SAVE_SHEET.save(true);
        FrameLayout light = sheet(false, "draggable_sheet");
        View lightSheet = fill(light, 1, new TransitionDrawable(new Drawable[] {solid(), solid()}));
        AmoledBlack.saveSheet(light);
        light.layout(0, 0, 320, 480);
        assertEquals("light mode stays as it is", ELEVATION, layer(lightSheet, 0));
    }

    /** The color of [view]'s background layer [index], a solid shape. */
    private static int layer(View view, int index) {
        return ((GradientDrawable) ((LayerDrawable) view.getBackground()).getDrawable(index)).getColor().getDefaultColor();
    }

    /** The views of a Gestalt sheet as 14.44.0 builds them, in the order gestaltSheet reads them. */
    private static FrameLayout gestalt(boolean night) {
        return sheet(night, "draggable_sheet", "gestalt_sheet_header", "gestalt_sheet_container", "sheet_overlay_container",
                "sheet_scroll_view", "sheet_scroll_inner_layout", "gestalt_sheet_footer", "footer_container");
    }

    /** The views of a lego menu as 14.44.0 builds them, in the order legoModal reads them. */
    private static FrameLayout lego(boolean night) {
        return sheet(night, "modal_header", "modal_container", "lego_modal_scroll_view", "lego_modal_container",
                "lego_modal_content_container", "lego_close_container", "lego_close_container_sticky");
    }

    /** A sheet inside [outer] that finds the same ids. */
    private static FrameLayout inside(FrameLayout outer) {
        Resources resources = outer.getResources();
        FrameLayout inner = new FrameLayout(outer.getContext()) {
            @Override public Resources getResources() { return resources; }
        };
        outer.addView(inner);
        return inner;
    }

    /** Pinterest's #3a3a41 buttons and Create's tiles, which keep their gray. */
    private static final int BUTTON = 0xFF3A3A41;

    @Test public void theOtherSheetsTurnBlackOnTheirOwnSwitchAndKeepTheirButtonsGray() {
        Settings.BLACK_SHEETS.save(true);
        FrameLayout create = gestalt(true);
        View card = fill(create, 1, card());
        View footer = fill(create, 7, new ColorDrawable(REACTIONS));
        View tile = fill(create, View.NO_ID, new ColorDrawable(BUTTON));
        AmoledBlack.gestaltSheet(create);
        assertEquals(Color.BLACK, cardColor(card.getBackground()));
        assertEquals("the row holding its buttons", Color.BLACK, color(footer));
        assertEquals("Create's tiles keep their gray", BUTTON, color(tile));
        Settings.BLACK_SHEETS.save(false);
        create.layout(0, 0, 320, 480);
        assertEquals(ELEVATION, cardColor(card.getBackground()));
        assertEquals(REACTIONS, color(footer));
        Settings.BLACK_SHEETS.save(true);
        FrameLayout light = gestalt(false);
        View lightCard = fill(light, 1, card());
        AmoledBlack.gestaltSheet(light);
        light.layout(0, 0, 320, 480);
        assertEquals("light mode stays as it is", ELEVATION, cardColor(lightCard.getBackground()));
    }

    /**
     * Seen on a Galaxy S25 (14.44.0): Add collaborators showed its board as a #222226 card on the
     * black sheet. The card is Pinterest's see-through secondary gray, set as a plain color once the
     * board is in, and it read as the sheet's own gray before.
     */
    @Test public void addCollaboratorsBoardCardTurnsBlackWithItsSheetAndOffGivesItsGrayBack() {
        Settings.BLACK_SHEETS.save(true);
        FrameLayout collaborators = sheet(true, "draggable_sheet", "gestalt_sheet_header", "gestalt_sheet_container",
                "sheet_overlay_container", "sheet_scroll_view", "sheet_scroll_inner_layout", "gestalt_sheet_footer",
                "footer_container", "collab_board_rep");
        AmoledBlack.gestaltSheet(collaborators);
        View board = fill(collaborators, 9, new ColorDrawable(0x4D72727E));
        View other = fill(collaborators, View.NO_ID, new ColorDrawable(0x4D72727E));
        collaborators.layout(0, 0, 320, 480);
        assertEquals(Color.BLACK, color(board));
        assertEquals("other see-through grays keep theirs", 0x4D72727E, color(other));
        Settings.BLACK_SHEETS.save(false);
        collaborators.layout(0, 0, 320, 490);
        assertEquals(0x4D72727E, color(board));
    }

    @Test public void aSheetWithASwitchOfItsOwnKeepsItWhicheverIsHandedOverFirst() {
        Settings.BLACK_SHEETS.save(true);
        FrameLayout save = gestalt(true);
        View saveCard = fill(save, 1, card());
        AmoledBlack.saveSheet(save);
        AmoledBlack.gestaltSheet(save);
        save.layout(0, 0, 320, 480);
        assertEquals("Black Save to sheet is off", ELEVATION, cardColor(saveCard.getBackground()));
        Settings.BLACK_SHEETS.save(false);
        Settings.BLACK_SAVE_SHEET.save(true);
        save.layout(0, 0, 320, 520);
        assertEquals(Color.BLACK, cardColor(saveCard.getBackground()));

        Settings.BLACK_SAVE_SHEET.save(false);
        Settings.BLACK_SHEETS.save(true);
        FrameLayout menu = lego(true);
        GradientDrawable rounded = new GradientDrawable();
        rounded.setColor(REACTIONS);
        menu.setBackground(rounded);
        AmoledBlack.legoModal(menu);
        assertEquals(Color.BLACK, rounded.getColor().getDefaultColor());
        FrameLayout pin = inside(menu);
        View list = fill(pin, 2, new ColorDrawable(ELEVATION));
        AmoledBlack.pinMenu(pin);
        menu.layout(0, 0, 320, 480);
        assertEquals("Black pin menu is off, so the menu around it is gray again", REACTIONS, rounded.getColor().getDefaultColor());
        assertEquals(ELEVATION, color(list));
        Settings.BLACK_SHEETS.save(false);
        Settings.BLACK_PIN_MENU.save(true);
        menu.layout(0, 0, 320, 520);
        assertEquals(Color.BLACK, rounded.getColor().getDefaultColor());
        assertEquals(Color.BLACK, color(list));
    }

    @Test public void aLegoMenuTurnsBlackWithItsOwnCardOnceItsViewsAreInAndKeepsCloseGray() {
        Settings.BLACK_SHEETS.save(true);
        FrameLayout menu = lego(true);
        GradientDrawable rounded = new GradientDrawable();
        rounded.setColor(REACTIONS);
        rounded.setCornerRadius(32f);
        menu.setBackground(rounded);
        AmoledBlack.legoModal(menu);
        View sticky = fill(menu, 7, new ColorDrawable(REACTIONS));
        View scroll = fill(menu, 3, new ColorDrawable(REACTIONS));
        View close = fill(menu, View.NO_ID, new ColorDrawable(BUTTON));
        menu.layout(0, 0, 320, 480);
        assertEquals(Color.BLACK, rounded.getColor().getDefaultColor());
        assertEquals("still rounded", 32f, rounded.getCornerRadius(), 0f);
        assertEquals(Color.BLACK, color(sticky));
        assertEquals(Color.BLACK, color(scroll));
        assertEquals("Close keeps its gray", BUTTON, color(close));
        Settings.BLACK_SHEETS.save(false);
        menu.layout(0, 0, 320, 520);
        assertEquals(REACTIONS, rounded.getColor().getDefaultColor());
        assertEquals(REACTIONS, color(sticky));
        assertEquals(REACTIONS, color(scroll));
    }

    @Test public void theBarOverABoardTurnsBlackThroughItsTintAndOffGivesBackTheTintItHad() {
        Settings.BLACK_BOARDS.save(true);
        View bar = fill(sheet(true), View.NO_ID, solid());
        AmoledBlack.boardToolBar(bar);
        assertEquals(Color.BLACK, bar.getBackgroundTintList().getDefaultColor());
        Settings.BLACK_BOARDS.save(false);
        bar.layout(0, 0, 320, 64);
        assertNull("it had none", bar.getBackgroundTintList());
        Settings.BLACK_BOARDS.save(true);
        View light = fill(sheet(false), View.NO_ID, solid());
        AmoledBlack.boardToolBar(light);
        assertNull("light mode stays as it is", light.getBackgroundTintList());
    }

    /**
     * Seen on a Galaxy S22 (14.44.0): a hardware layer with a color filter on the row left the
     * buttons gray, so each button's own tint is what changes. The row is handed over before
     * Compose puts its buttons in, and Pinterest tints a button again when it's picked.
     */
    @Test public void theProfileFilterButtonsTurnBlackThroughTheirTintAndThePickedOneStaysWhite() {
        Settings.BLACK_BOARDS.save(true);
        FrameLayout row = sheet(true);
        AmoledBlack.profileFilters(row);
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        activity.setContentView(row);
        ColorStateList gray = toggleTint();
        View button = filterButton(row, gray);
        row.layout(0, 0, 320, 48);
        ColorStateList tint = button.getBackgroundTintList();
        assertEquals("the buttons' gray", Color.BLACK, tint.getDefaultColor());
        assertEquals("a picked button", Color.WHITE, tint.getColorForState(PICKED, Color.TRANSPARENT));
        // Picking a button: Pinterest hands it its tint again.
        button.setBackgroundTintList(gray);
        row.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals("black again by the next frame", Color.BLACK, button.getBackgroundTintList().getDefaultColor());
        Settings.BLACK_BOARDS.save(false);
        row.getViewTreeObserver().dispatchOnPreDraw();
        assertSame("off gives back Pinterest's tint", gray, button.getBackgroundTintList());
        Settings.BLACK_BOARDS.save(true);
        FrameLayout light = sheet(false);
        AmoledBlack.profileFilters(light);
        View lightButton = filterButton(light, gray);
        light.layout(0, 0, 320, 48);
        assertSame("light mode stays as it is", gray, lightButton.getBackgroundTintList());
    }

    private static final int[] PICKED = {android.R.attr.state_selected};

    /**
     * A filter button's tint the way Pinterest's default button toggle gives it at night (14.44.0):
     * white when picked, otherwise base_color_grayscale_translucent_400, a light gray at 30% that
     * reads #333339 over the page.
     */
    private static ColorStateList toggleTint() {
        return new ColorStateList(new int[][] {PICKED, new int[0]}, new int[] {Color.WHITE, 0x4D72727E});
    }

    /** One of the row's buttons, a rounded fill under a tint, added after the row was handed over. */
    private static View filterButton(FrameLayout row, ColorStateList tint) {
        View button = fill(row, View.NO_ID, solid());
        button.setBackgroundTintList(tint);
        return button;
    }

    /**
     * Seen on a Galaxy S25 (14.44.0): the empty header on Edit board stayed #333339. Its gray is
     * sema_color_background_secondary, a light gray at 30% at night that reads #333339 over the page,
     * and Pinterest's rounded image view keeps it as a small bitmap, not as a color.
     */
    @Test public void theEmptyBoardHeaderTurnsBlackOnceItsViewsAreInAndOffGivesTheGrayBack() {
        Bitmap gray = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        gray.eraseColor(0x4D72727E);
        Drawable rounded = new BitmapDrawable(null, gray);
        Drawable roundedBlur = new BitmapDrawable(null, gray);
        // Another test class in this sandbox may have read the ids from resources of its own.
        AmoledBlack.headerImage = -1;
        AmoledBlack.headerBlur = -1;
        Settings.BLACK_BOARDS.save(true);
        FrameLayout header = sheet(true, "board_header_image", "board_header_image_blur");
        AmoledBlack.boardHeader(header);
        View image = fill(header, 1, rounded);
        View blur = fill(header, 2, roundedBlur);
        header.layout(0, 0, 320, 180);
        assertEquals(Color.BLACK, color(image));
        assertEquals("its blurred copy", Color.BLACK, color(blur));
        header.layout(0, 0, 320, 190);
        assertEquals("a second pass keeps it black", Color.BLACK, color(image));
        Settings.BLACK_BOARDS.save(false);
        header.layout(0, 0, 320, 200);
        assertSame(rounded, image.getBackground());
        assertSame(roundedBlur, blur.getBackground());
    }

    @Test public void eachSheetFollowsItsOwnSwitchAndLightModeIsLeftAlone() {
        Settings.BLACK_COMMENTS.save(true);
        FrameLayout menu = sheet(true, "modal_header", "modal_container");
        View list = fill(menu, 2, new ColorDrawable(ELEVATION));
        AmoledBlack.pinMenu(menu);
        menu.layout(0, 0, 320, 480);
        assertEquals("the comments switch leaves a pin's menu alone", ELEVATION, ((ColorDrawable) list.getBackground()).getColor());
        FrameLayout light = sheet(false, "comments_feed", "comment_bottom_bar", "floating_comment_view");
        View floating = fill(light, 3, new ColorDrawable(ELEVATION));
        AmoledBlack.comments(light);
        light.layout(0, 0, 320, 480);
        assertEquals(ELEVATION, ((ColorDrawable) floating.getBackground()).getColor());
    }

    /**
     * Seen on Pinterest 14.43.0 (#21): the quick replies above the reply box (the emoji and "Love
     * it!" buttons) stayed #222226 on the black comments sheet. Each is a small Gestalt button whose
     * gray is a background tint (set on the button and again on the ripple's shape), so the shape's
     * own color never shows, and Pinterest adds them to their row after the screen is built.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theQuickRepliesAddedAfterTheCommentsAreBuiltTurnBlackAndOffGivesTheirGrayBack() {
        Settings.BLACK_COMMENTS.save(true);
        FrameLayout screen = sheet(true, "comments_feed", "comment_bottom_bar", "floating_comment_view",
                "comment_reaction_header", "community_insight_comment_header", "comment_starters");
        LinearLayout row = new LinearLayout(screen.getContext());
        row.setId(6);
        screen.addView(row);
        View early = quickReply(true);
        row.addView(early);
        AmoledBlack.comments(screen);
        assertEquals("a quick reply already in the row turns black with the sheet", Color.BLACK, shownTint(early));
        View later = quickReply(true);
        row.addView(later);
        screen.layout(0, 0, 320, 480);
        assertEquals("one added after the build turns black on the next layout", Color.BLACK, shownTint(later));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        screen.layout(0, 0, 320, 520);
        assertEquals("Pause gives the gray back", REACTIONS, shownTint(later));
        PauseForTests.resume();
        screen.layout(0, 0, 320, 480);
        assertEquals(Color.BLACK, shownTint(later));
        Settings.BLACK_COMMENTS.save(false);
        screen.layout(0, 0, 320, 520);
        assertEquals("the switch off gives the gray back", REACTIONS, shownTint(early));
        assertEquals(REACTIONS, shownTint(later));

        Settings.BLACK_COMMENTS.save(true);
        Settings.BLACK_PIN_MENU.save(true);
        FrameLayout menu = sheet(true, "modal_header", "modal_container", "comment_starters");
        LinearLayout menuRow = new LinearLayout(menu.getContext());
        menuRow.setId(3);
        menu.addView(menuRow);
        View inMenu = quickReply(true);
        menuRow.addView(inMenu);
        AmoledBlack.pinMenu(menu);
        menu.layout(0, 0, 320, 480);
        assertEquals("a pin's menu doesn't paint a row of buttons", REACTIONS, shownTint(inMenu));
        FrameLayout light = sheet(false, "comments_feed", "comment_bottom_bar", "floating_comment_view",
                "comment_reaction_header", "community_insight_comment_header", "comment_starters");
        LinearLayout lightRow = new LinearLayout(light.getContext());
        lightRow.setId(6);
        light.addView(lightRow);
        View day = quickReply(false);
        lightRow.addView(day);
        AmoledBlack.comments(light);
        light.layout(0, 0, 320, 480);
        assertEquals("light mode is left alone", REACTIONS, shownTint(day));
    }

    /** A quick reply the way 14.43.0's GestaltButton colors one: a ripple over a shape, tinted on the button and on the shape. */
    private static View quickReply(boolean night) {
        LinearLayout chip = seeMoreCard(night, Color.WHITE);
        ColorStateList gray = ColorStateList.valueOf(REACTIONS);
        chip.setBackgroundTintList(gray);
        ((LayerDrawable) chip.getBackground()).getDrawable(0).mutate().setTintList(gray);
        return chip;
    }

    /** The color the chip's background draws in its middle, which is what a viewer sees. */
    private static int shownTint(View chip) {
        Drawable background = chip.getBackground();
        background.setBounds(0, 0, 40, 40);
        Bitmap drawn = Bitmap.createBitmap(40, 40, Bitmap.Config.ARGB_8888);
        background.draw(new Canvas(drawn));
        return drawn.getPixel(20, 20);
    }

    /**
     * Seen on Pinterest 14.41.0 (#12): the comments screen fills the window, keeps the status bar's
     * height as its top padding and draws nothing there, so the window's #18181B stayed a gray band
     * above the black list.
     */
    @Test public void theBandUnderTheStatusBarGoesBlackWithTheCommentsAndOnlyWhileTheyAre() {
        Settings.BLACK_COMMENTS.save(true);
        Settings.BLACK_PIN_MENU.save(true);
        FrameLayout screen = sheet(true, "comments_feed", "comment_bottom_bar", "floating_comment_view");
        screen.setPadding(0, 136, 0, 0);
        AmoledBlack.comments(screen);
        screen.layout(0, 0, 320, 480);
        assertEquals(Arrays.asList(new Rect(0, 0, 320, 136)), blackDrawn(screen));
        screen.setPadding(0, 96, 0, 0);
        screen.layout(0, 0, 360, 480);
        assertEquals("the band follows the padding on the next layout", Arrays.asList(new Rect(0, 0, 360, 96)), blackDrawn(screen));
        AmoledBlack.comments(screen);
        assertEquals("handing the same screen over again adds no second band", 1, blackDrawn(screen).size());
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        screen.layout(0, 0, 320, 480);
        assertEquals("Pause takes the band away", 0, blackDrawn(screen).size());
        PauseForTests.resume();
        screen.layout(0, 0, 320, 520);
        assertEquals(1, blackDrawn(screen).size());
        Settings.BLACK_COMMENTS.save(false);
        screen.layout(0, 0, 320, 480);
        assertEquals("the switch off takes the band away", 0, blackDrawn(screen).size());
        Settings.BLACK_COMMENTS.save(true);
        screen.setBackground(new ColorDrawable(PAGE));
        screen.layout(0, 0, 320, 520);
        assertEquals("a screen with its own background keeps it", 0, blackDrawn(screen).size());

        FrameLayout light = sheet(false, "comments_feed", "comment_bottom_bar", "floating_comment_view");
        light.setPadding(0, 136, 0, 0);
        AmoledBlack.comments(light);
        light.layout(0, 0, 320, 480);
        assertEquals("light mode is left alone", 0, blackDrawn(light).size());
        FrameLayout menu = sheet(true, "modal_header", "modal_container");
        menu.setPadding(0, 136, 0, 0);
        AmoledBlack.pinMenu(menu);
        menu.layout(0, 0, 320, 480);
        assertEquals("a pin's menu gets no band", 0, blackDrawn(menu).size());
    }

    /**
     * Seen on an API 36 emulator: under a black pin menu and a black comments sheet the strip behind
     * the gesture handle stayed the pin page's #18181B, a gray band across the sheet's last rows.
     */
    @Test public void theStripUnderABlackSheetTurnsBlackAndGetsItsColorBackWhenTheSheetLeaves() {
        Settings.BLACK_PIN_MENU.save(true);
        AmoledBlack.gestureStrip = STRIP;
        FrameLayout menu = sheet(true, "modal_header", "modal_container");
        fill(menu, 2, new ColorDrawable(ELEVATION));
        LinearLayout bar = bar(true);
        FrameLayout window = window(bar);
        View strip = window.findViewById(STRIP);
        AmoledBlack.pinMenu(menu);
        assertEquals("a menu that isn't open yet painted the strip", PAGE, color(strip));
        window.addView(menu);
        menu.layout(0, 0, 320, 480);
        assertEquals(Color.BLACK, color(strip));
        AmoledBlack.bottomBar(bar);
        assertEquals("a bar that isn't black took the strip from the open menu", Color.BLACK, color(strip));
        window.removeView(menu);
        assertEquals("the menu left and the strip kept its black", PAGE, color(strip));
    }

    @Test public void aSheetLeavingABlackBarsWindowLeavesTheStripBlackUnlessTheBarIsHidden() {
        Settings.BLACK_PIN_MENU.save(true);
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.gestureStrip = STRIP;
        LinearLayout bar = bar(true);
        FrameLayout window = window(bar);
        View strip = window.findViewById(STRIP);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, color(strip));
        FrameLayout menu = sheet(true, "modal_header", "modal_container");
        AmoledBlack.pinMenu(menu);
        window.addView(menu);
        menu.layout(0, 0, 320, 480);
        window.removeView(menu);
        assertEquals("the bar is still black and on show", Color.BLACK, color(strip));
        // A pin's page: Pinterest hides the bar and gives the strip that page's color.
        bar.setVisibility(View.GONE);
        strip.setBackgroundColor(PAGE);
        window.addView(menu);
        menu.layout(0, 0, 320, 520);
        assertEquals(Color.BLACK, color(strip));
        window.removeView(menu);
        assertEquals("a hidden bar kept the strip black on a pin's page", PAGE, color(strip));
    }

    /** Pinterest gives the strip each page's own color, and the bar's gray isn't that page's. */
    @Test public void aStripPinterestRecoloredSinceItWasPaintedKeepsPinterestsColor() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.gestureStrip = STRIP;
        LinearLayout bar = bar(true);
        View strip = window(bar).findViewById(STRIP);
        strip.setBackgroundColor(0xFF222226);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, color(strip));
        strip.setBackgroundColor(PAGE);
        Settings.BLACK_BOTTOM_BAR.save(false);
        AmoledBlack.bottomBar(bar);
        assertEquals("the color the strip had under the bar was put on another page", PAGE, color(strip));
    }

    /**
     * Seen on a Galaxy S25: Pinterest colored the strip again after the bar painted it, and the
     * bar's gray band stayed until something else asked the bar to draw.
     */
    @Test public void aStripPinterestColorsAgainUnderABlackBarIsBlackByItsNextFrame() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.gestureStrip = STRIP;
        LinearLayout bar = bar(true);
        View strip = window(bar).findViewById(STRIP);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, color(strip));
        strip.setBackgroundColor(0xFF222226);
        strip.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals(Color.BLACK, color(strip));
        Settings.BLACK_BOTTOM_BAR.save(false);
        AmoledBlack.bottomBar(bar);
        assertEquals("off gave the strip a color Pinterest had replaced", 0xFF222226, color(strip));
        strip.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals("the switch is off and the strip turned black anyway", 0xFF222226, color(strip));
    }

    @Test public void aStripPinterestColorsAgainAfterABlackSheetLeftKeepsPinterestsColor() {
        Settings.BLACK_PIN_MENU.save(true);
        AmoledBlack.gestureStrip = STRIP;
        LinearLayout bar = bar(true);
        FrameLayout window = window(bar);
        View strip = window.findViewById(STRIP);
        FrameLayout menu = sheet(true, "modal_header", "modal_container");
        AmoledBlack.pinMenu(menu);
        window.addView(menu);
        menu.layout(0, 0, 320, 480);
        strip.setBackgroundColor(0xFF222226);
        strip.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals("the open menu lost its black strip", Color.BLACK, color(strip));
        window.removeView(menu);
        strip.setBackgroundColor(0xFF2B2B2F);
        strip.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals(0xFF2B2B2F, color(strip));
    }

    /**
     * Seen on a Galaxy S25 with three-button navigation: the window draws its own navigation bar
     * band over the strip, in the gray Pinterest gives the window for each page and sheet.
     */
    @Test public void theWindowsOwnNavigationBarBandGoesBlackWithTheStrip() {
        Settings.BLACK_BOTTOM_BAR.save(true);
        AmoledBlack.gestureStrip = STRIP;
        LinearLayout bar = bar(true);
        FrameLayout window = window(bar);
        View band = new View(bar.getContext());
        band.setId(android.R.id.navigationBarBackground);
        band.setBackgroundColor(0xFF222226);
        window.addView(band);
        AmoledBlack.bottomBar(bar);
        assertEquals(Color.BLACK, color(band));
        // A sheet opening: Pinterest gives the window the sheet's page gray.
        band.setBackgroundColor(PAGE);
        band.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals(Color.BLACK, color(band));
        Settings.BLACK_BOTTOM_BAR.save(false);
        AmoledBlack.bottomBar(bar);
        assertEquals(PAGE, color(band));
        band.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals("the switch is off and the band turned black anyway", PAGE, color(band));
    }

    /** A window on show holding the bar and the strip behind the gesture handle, in a pin page's gray. */
    private static FrameLayout window(LinearLayout bar) {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        FrameLayout window = new FrameLayout(bar.getContext());
        window.addView(bar);
        View strip = new View(bar.getContext());
        strip.setId(STRIP);
        strip.setBackgroundColor(PAGE);
        window.addView(strip);
        activity.setContentView(window);
        return window;
    }

    private static int color(View strip) {
        return ((ColorDrawable) strip.getBackground()).getColor();
    }

    /** The black rectangles the view draws, in its own coordinates, overlay included. */
    private static List<Rect> blackDrawn(View view) {
        List<Rect> drawn = new ArrayList<>();
        view.draw(new Canvas(Bitmap.createBitmap(400, 600, Bitmap.Config.ARGB_8888)) {
            @Override public void drawRect(Rect rect, Paint paint) {
                if (paint.getColor() == Color.BLACK) drawn.add(new Rect(rect));
            }
        });
        return drawn;
    }

    /**
     * A sheet like the ones Pinterest hands over, in dark mode or light. Its resources know the ids
     * its fills are found by, numbered from 1 in the order given.
     */
    private static FrameLayout sheet(boolean night, String... names) {
        Context base = RuntimeEnvironment.getApplication();
        Configuration configuration = new Configuration(base.getResources().getConfiguration());
        configuration.uiMode = (night ? Configuration.UI_MODE_NIGHT_YES : Configuration.UI_MODE_NIGHT_NO)
                | (configuration.uiMode & ~Configuration.UI_MODE_NIGHT_MASK);
        Context themed = base.createConfigurationContext(configuration);
        Resources original = themed.getResources();
        List<String> known = Arrays.asList(names);
        Resources resources = new Resources(themed.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
            @Override public int getIdentifier(String name, String type, String owner) {
                return known.indexOf(name) + 1;
            }
        };
        return new FrameLayout(themed) {
            @Override public Resources getResources() { return resources; }
        };
    }

    /** A view in the sheet with one of its ids and a background. */
    private static View fill(FrameLayout sheet, int id, Drawable background) {
        View view = new View(sheet.getContext());
        view.setId(id);
        view.setBackground(background);
        sheet.addView(view);
        return view;
    }

    /** A sheet's rounded card the way Pinterest's layer list builds it: a clear layer under the gray shape. */
    private static LayerDrawable card() {
        GradientDrawable clear = new GradientDrawable();
        clear.setColor(Color.TRANSPARENT);
        return new LayerDrawable(new Drawable[] {clear, solid()});
    }

    private static GradientDrawable solid() {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(ELEVATION);
        return shape;
    }

    private static int cardColor(Drawable card) {
        return ((GradientDrawable) ((LayerDrawable) card).getDrawable(1)).getColor().getDefaultColor();
    }

    /** A See more card the way 14.42.0's bento_card_background builds it: a rounded shape in the secondary gray under a ripple. */
    private static LinearLayout seeMoreCard(boolean night) {
        return seeMoreCard(night, SECONDARY);
    }

    private static LinearLayout seeMoreCard(boolean night, int fill) {
        LinearLayout card = new LinearLayout(sheet(night).getContext());
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(16f);
        shape.setColor(fill);
        card.setBackground(new RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), shape, null));
        return card;
    }

    private static int rippleColor(Drawable ripple) {
        return ((GradientDrawable) ((LayerDrawable) ripple).getDrawable(0)).getColor().getDefaultColor();
    }

    /** A bar like Pinterest's, holding a plain tab row with the gray rounded shape. */
    private static LinearLayout bar(boolean night) {
        Context base = RuntimeEnvironment.getApplication();
        Configuration configuration = new Configuration(base.getResources().getConfiguration());
        configuration.uiMode = (night ? Configuration.UI_MODE_NIGHT_YES : Configuration.UI_MODE_NIGHT_NO)
                | (configuration.uiMode & ~Configuration.UI_MODE_NIGHT_MASK);
        LinearLayout bar = new LinearLayout(base.createConfigurationContext(configuration));
        LinearLayout tabs = new LinearLayout(bar.getContext());
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(48f);
        shape.setColor(ELEVATION);
        tabs.setBackground(shape);
        bar.addView(tabs);
        return bar;
    }

    private static GradientDrawable rowFill(LinearLayout bar) {
        return (GradientDrawable) bar.getChildAt(0).getBackground();
    }

    /**
     * A search tab like Pinterest's: a plain frame around the search pill, whose gray sits on the
     * pill itself or on the container inside it. Answers the shape that carries it.
     */
    private static GradientDrawable searchTab(LinearLayout row, boolean inContainer) {
        FrameLayout tab = new FrameLayout(row.getContext());
        FrameLayout pill = new FrameLayout(row.getContext());
        FrameLayout container = new FrameLayout(row.getContext());
        container.setId(AmoledBlack.searchContainer);
        View text = new View(row.getContext());
        text.setId(AmoledBlack.searchText);
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(24f);
        shape.setColor(ELEVATION);
        (inContainer ? container : pill).setBackground(shape);
        container.addView(text);
        pill.addView(container);
        tab.addView(pill);
        row.addView(tab);
        return shape;
    }

    /** A tab like those of the bar that shows them apart: a white rounded shape under a tint. */
    private static View tab(LinearLayout row, int tint) {
        FrameLayout tab = new FrameLayout(row.getContext());
        FrameLayout root = new FrameLayout(row.getContext());
        root.setId(AmoledBlack.tabRoot);
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(24f);
        shape.setColor(Color.WHITE);
        root.setBackground(shape);
        root.setBackgroundTintList(ColorStateList.valueOf(tint));
        tab.addView(root);
        row.addView(tab);
        return root;
    }
}
