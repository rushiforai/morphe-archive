/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsEntry;

/**
 * The chat list's Ghost mode button (#62). The bar is built the way Telegram builds it: a title,
 * and a menu on the right holding the search field (hidden, stretched over the menu while open)
 * ahead of the buttons, each an icon tinted with the bar's color.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GhostButtonTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int BUTTON = 110;
    private static final PorterDuffColorFilter BAR_COLOR = new PorterDuffColorFilter(0xFF3A6D99, PorterDuff.Mode.MULTIPLY);

    /** Telegram's top bar menu: its class extends LinearLayout itself. */
    static class Menu extends LinearLayout {
        Menu(Context context) {
            super(context);
        }
    }

    /** The selection bar Telegram lays over the menu while chats are picked: it extends the menu. */
    static final class SelectionMenu extends Menu {
        SelectionMenu(Context context) {
            super(context);
        }
    }

    private ActivityController<Activity> chats;
    private FrameLayout search;
    private ImageView searchIcon;

    @Before public void setUp() {
        chats = Robolectric.buildActivity(Activity.class).setup();
        PatchFamilyForTests.installed(PatchFamily.Capability.GHOST_MODE);
        Settings.GHOST_MODE.resetToDefault();
        Settings.GHOST_BUTTON.save(true);
        ShadowToast.reset();
    }

    @After public void tearDown() {
        PatchFamilyForTests.resetCapabilities();
        PauseForTests.resume();
        Settings.GHOST_MODE.resetToDefault();
        Settings.GHOST_BUTTON.resetToDefault();
        chats.pause().stop().destroy();
    }

    /** The chat list's top bar on screen, with [extra] views ahead of its menu. */
    private FrameLayout bar(Menu menu, View... extra) {
        Context context = chats.get();
        FrameLayout bar = new FrameLayout(context);
        bar.addView(new View(context), new FrameLayout.LayoutParams(360, 90));
        for (View view : extra) bar.addView(view, new FrameLayout.LayoutParams(-2, 90, Gravity.RIGHT));
        search = new FrameLayout(context);
        search.setVisibility(View.GONE);
        menu.addView(search, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
        FrameLayout searchButton = new FrameLayout(context);
        searchIcon = new ImageView(context);
        searchIcon.setColorFilter(BAR_COLOR);
        searchButton.addView(searchIcon, new FrameLayout.LayoutParams(60, 60, Gravity.CENTER));
        menu.addView(searchButton, new LinearLayout.LayoutParams(BUTTON, ViewGroup.LayoutParams.MATCH_PARENT));
        bar.addView(menu, new FrameLayout.LayoutParams(-2, 90, Gravity.RIGHT));
        FrameLayout screen = new FrameLayout(context);
        screen.addView(bar, new FrameLayout.LayoutParams(720, 90));
        chats.get().setContentView(screen);
        ShadowLooper.idleMainLooper();
        return bar;
    }

    private Menu shown() {
        Menu menu = new Menu(chats.get());
        SettingsEntry.watchChatListTitle(bar(menu));
        ShadowLooper.idleMainLooper();
        return menu;
    }

    private static GhostButton.Ghost ghost(ViewGroup menu) {
        GhostButton.Ghost found = GhostButton.find(menu);
        assertNotNull("no ghost on the chat list's bar", found);
        return found;
    }

    private static String toast() {
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    @Test public void theGhostGoesFirstAmongTheBarsButtonsAtTheirWidthAndInTheirColor() {
        Menu menu = shown();
        GhostButton.Ghost ghost = ghost(menu);

        assertEquals("the ghost isn't right after the search field", 1, menu.indexOfChild(ghost));
        assertEquals(View.VISIBLE, ghost.getVisibility());
        assertEquals("the ghost isn't as wide as Telegram's buttons", BUTTON, ghost.getWidth());
        assertSame("the ghost isn't drawn in the bar's icon color", BAR_COLOR, ghost.color());
        assertFalse(ghost.ghostMode());
        assertEquals("Ghost mode", String.valueOf(ghost.getContentDescription()));
        // Both looks draw.
        Bitmap frame = Bitmap.createBitmap(BUTTON, 90, Bitmap.Config.ARGB_8888);
        ghost.draw(new Canvas(frame));
        ghost.performClick();
        ghost.draw(new Canvas(frame));
    }

    @Test public void aTapTurnsGhostModeOnThenOffWithAToastAndTheGhostFillsWithIt() {
        GhostButton.Ghost ghost = ghost(shown());

        ghost.performClick();

        assertTrue("a tap didn't turn Ghost mode on", Settings.GHOST_MODE.get());
        assertEquals("Ghost mode on", toast());
        assertTrue("the ghost isn't filled with Ghost mode on", ghost.ghostMode());
        AccessibilityNodeInfo info = AccessibilityNodeInfo.obtain();
        ghost.onInitializeAccessibilityNodeInfo(info);
        assertTrue(info.isCheckable());
        assertTrue(info.isChecked());

        ghost.performClick();

        assertFalse("a second tap didn't turn Ghost mode off", Settings.GHOST_MODE.get());
        assertEquals("Ghost mode off", toast());
        assertFalse(ghost.ghostMode());
    }

    @Test public void theGhostFollowsGhostModeTurnedOnInSettings() {
        GhostButton.Ghost ghost = ghost(shown());

        Settings.GHOST_MODE.save(true);
        ghost.follow();

        assertTrue("the ghost didn't fill when Ghost mode was turned on in settings", ghost.ghostMode());
    }

    @Test public void theGhostFollowsItsSwitchWithoutARestart() {
        Settings.GHOST_BUTTON.save(false);
        GhostButton.Ghost ghost = ghost(shown());
        assertEquals("the ghost shows with its switch off", View.GONE, ghost.getVisibility());

        Settings.GHOST_BUTTON.save(true);
        assertFalse("a frame drew before the ghost was laid out", ghost.follow());

        assertEquals("the ghost didn't come back with its switch", View.VISIBLE, ghost.getVisibility());
        assertTrue("an unchanged ghost held back a frame", ghost.follow());
    }

    @Test public void theGhostHidesWhileHushTelegramIsPaused() {
        GhostButton.Ghost ghost = ghost(shown());

        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        ghost.follow();

        assertEquals("the ghost stayed while HushTelegram was paused", View.GONE, ghost.getVisibility());
    }

    @Test public void theGhostStepsAsideWhileTheBarsSearchIsOpen() {
        GhostButton.Ghost ghost = ghost(shown());

        search.setVisibility(View.VISIBLE);
        ghost.follow();
        assertEquals("the ghost stayed beside the open search field", View.GONE, ghost.getVisibility());

        search.setVisibility(View.GONE);
        ghost.follow();
        assertEquals("the ghost didn't come back after the search closed", View.VISIBLE, ghost.getVisibility());
    }

    @Test public void theGhostFollowsTheBarsColorWhenTheThemeChanges() {
        GhostButton.Ghost ghost = ghost(shown());
        PorterDuffColorFilter night = new PorterDuffColorFilter(0xFFEEEEEE, PorterDuff.Mode.MULTIPLY);

        searchIcon.setColorFilter(night);
        ghost.follow();

        assertSame("the ghost kept the old theme's color", night, ghost.color());
    }

    @Test public void theSelectionBarIsNeverTakenForTheMenu() {
        Menu menu = new Menu(chats.get());
        SelectionMenu selection = new SelectionMenu(chats.get());
        SettingsEntry.watchChatListTitle(bar(menu, selection));
        ShadowLooper.idleMainLooper();

        assertNull("the ghost went into the selection bar", GhostButton.find(selection));
        assertNotNull("the ghost isn't in the menu", GhostButton.find(menu));
    }

    @Test public void theBarGetsOneGhostHoweverOftenItIsWatched() {
        Menu menu = new Menu(chats.get());
        FrameLayout bar = bar(menu);
        SettingsEntry.watchChatListTitle(bar);
        SettingsEntry.watchChatListTitle(bar);
        ShadowLooper.idleMainLooper();

        int ghosts = 0;
        for (int i = 0; i < menu.getChildCount(); i++) {
            if (menu.getChildAt(i) instanceof GhostButton.Ghost) ghosts++;
        }
        assertEquals(1, ghosts);
    }

    @Test public void aBuildWithoutGhostModeLeavesTheBarAsTelegramMadeIt() {
        PatchFamilyForTests.installed();
        Menu menu = new Menu(chats.get());
        SettingsEntry.watchChatListTitle(bar(menu));
        ShadowLooper.idleMainLooper();

        assertNull("a build without Ghost mode got the ghost", GhostButton.find(menu));
        assertEquals(2, menu.getChildCount());
    }

    @Test public void aBarWithNoMenuGetsNoGhost() {
        Context context = chats.get();
        FrameLayout bar = new FrameLayout(context);
        bar.addView(new View(context), new FrameLayout.LayoutParams(360, 90));
        GhostButton.place(bar);

        assertEquals(1, bar.getChildCount());
    }
}
