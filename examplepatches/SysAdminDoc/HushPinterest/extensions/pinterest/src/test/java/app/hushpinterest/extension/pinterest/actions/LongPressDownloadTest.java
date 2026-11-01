/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.DownloadManager;
import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowDownloadManager;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * Drives the long-press hook against a stand-in for Pinterest's circular menu that lays its
 * buttons out the way the real one does: an origin marker of its own first, then each button.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = LongPressDownloadTest.NativeMenu.class)
public class LongPressDownloadTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    /**
     * The hide switches, in the order of the buttons they take out: Save, Send, Search image. A
     * method, not a field, so Settings loads after the rule has given it a context.
     */
    private static BooleanSetting[] hides() {
        return new BooleanSetting[] {Settings.LONG_PRESS_HIDE_SAVE, Settings.LONG_PRESS_HIDE_SEND, Settings.LONG_PRESS_HIDE_SEARCH};
    }
    private Activity activity;

    @Before public void prepare() {
        NativeMenu.reattached.clear();
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        Utils.setActivity(activity);
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.LONG_PRESS_MENU,
                PatchFamily.Capability.LONG_PRESS_CHOICES));
        Settings.DOWNLOAD_PINS.save(true);
        Settings.LONG_PRESS_DOWNLOAD.save(true);
    }

    @After public void reset() {
        for (BooleanSetting hide : hides()) hide.save(false);
        Settings.LONG_PRESS_DOWNLOAD.save(false);
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Utils.setActivity(null);
    }

    @Test public void aLongPressedPinGetsDownloadAfterPinterestsOwnButtonsAndReleasingOnItSavesThePin() throws Exception {
        Menu menu = menu(3);
        List<Object> pinterest = new ArrayList<>(menu.items.subList(1, 4));
        menu.show(new Event(pin("7")));
        assertEquals(5, menu.items.size());
        assertEquals(5, menu.getChildCount());
        assertEquals(pinterest, menu.items.subList(1, 4));
        View download = (View) menu.items.get(4);
        assertEquals(LongPressDownload.ITEM_TAG, download.getTag());
        assertEquals(2, menu.layouts);
        for (Object item : menu.items) assertSame(menu, ((View) item).getParent());

        assertTrue(download.performClick());
        settle();
        ShadowDownloadManager downloads = Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE));
        assertEquals(1, downloads.getRequestCount());
        assertEquals("https://i.pinimg.com/originals/7.jpg",
                Shadow.<ShadowDownloadManager.ShadowRequest>extract(downloads.getRequest(0)).getUri().toString());
        List<DownloadLedger.Job> history = new DownloadLedger(activity).reconcile();
        assertEquals(1, history.size());
        assertEquals("7", history.get(0).pinId);
    }

    /**
     * Taking Pinterest's buttons out to lay them out again marks their springs detached for good,
     * as the real buttons' detach handler does, so each one put back gets the mark cleared. Without
     * that they stayed at zero size on a phone and only Download showed.
     */
    @Test public void pinterestsButtonsPutBackCanStillSpringIn() {
        Menu menu = menu(3);
        List<Object> pinterest = new ArrayList<>(menu.items.subList(1, 4));
        for (Object button : pinterest) assertTrue(((View) button).isAttachedToWindow());
        menu.show(new Event(pin("7")));
        for (Object button : pinterest) {
            assertTrue(((View) button).isAttachedToWindow());
            assertFalse(((Button) button).springsDetached);
        }
        assertEquals(pinterest, NativeMenu.reattached);
    }

    @Test public void showingTheSameButtonsAgainAddsOneDownloadButtonOnly() {
        Menu menu = menu(2);
        menu.show(new Event(pin("7")));
        menu.show(new Event(pin("7")));
        assertEquals(4, menu.items.size());
        assertEquals(4, menu.getChildCount());
        assertEquals(2, menu.layouts);
    }

    @Test public void aBoardOrAnyOtherLongPressKeepsPinterestsMenu() {
        for (Object model : new Object[]{new Board(), null}) {
            Menu menu = menu(3);
            List<Object> before = new ArrayList<>(menu.items);
            menu.show(new Event(model));
            assertUntouched(menu, before);
        }
        Menu menu = menu(3);
        List<Object> before = new ArrayList<>(menu.items);
        LongPressDownload.show(menu, null);
        assertUntouched(menu, before);
    }

    @Test public void withASwitchOffOrPausedThePinKeepsPinterestsMenu() {
        Runnable[] offs = {
                () -> Settings.LONG_PRESS_DOWNLOAD.save(false),
                () -> Settings.DOWNLOAD_PINS.save(false),
                () -> PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS)),
                () -> PauseForTests.pause(HushPinterestPause.Reason.SWITCH),
        };
        for (Runnable off : offs) {
            off.run();
            Menu menu = menu(3);
            List<Object> before = new ArrayList<>(menu.items);
            menu.show(new Event(pin("7")));
            assertUntouched(menu, before);
            prepare();
        }
    }

    /** Each hide switch takes out its own button only, and the buttons that stay get their springs back. */
    @Test public void eachHideSwitchTakesOutOnlyItsOwnButton() {
        for (int hidden = 0; hidden < hides().length; hidden++) {
            hides()[hidden].save(true);
            Menu menu = menu(3);
            List<Object> pinterest = new ArrayList<>(menu.items.subList(1, 4));
            List<Object> kept = new ArrayList<>(pinterest);
            kept.remove(hidden);
            menu.show(new Event(pin("7")));
            assertEquals(hides()[hidden].key, 4, menu.items.size());
            assertEquals(kept, menu.items.subList(1, 3));
            assertEquals(LongPressDownload.ITEM_TAG, ((View) menu.items.get(3)).getTag());
            assertNull(((View) pinterest.get(hidden)).getParent());
            assertEquals(kept, NativeMenu.reattached);
            reset();
            prepare();
        }
    }

    /** The hide switches don't need Download: with it off, the menu is Pinterest's minus what's hidden. */
    @Test public void withDownloadOffTheHideSwitchesStillWork() {
        Settings.LONG_PRESS_DOWNLOAD.save(false);
        Settings.LONG_PRESS_HIDE_SEND.save(true);
        Menu menu = menu(3);
        List<Object> pinterest = new ArrayList<>(menu.items.subList(1, 4));
        menu.show(new Event(pin("7")));
        assertEquals(List.of(pinterest.get(0), pinterest.get(2)), menu.items.subList(1, 3));
        assertEquals(3, menu.items.size());
        assertEquals(2, menu.layouts);
    }

    /** With every button hidden, Download alone fills the menu, and with Download off too, nothing changes. */
    @Test public void aMenuIsNeverLeftEmpty() {
        for (BooleanSetting hide : hides()) hide.save(true);
        Menu menu = menu(3);
        menu.show(new Event(pin("7")));
        assertEquals(2, menu.items.size());
        assertEquals(LongPressDownload.ITEM_TAG, ((View) menu.items.get(1)).getTag());

        Settings.LONG_PRESS_DOWNLOAD.save(false);
        menu = menu(3);
        List<Object> before = new ArrayList<>(menu.items);
        menu.show(new Event(pin("7")));
        assertUntouched(menu, before);
    }

    /** Buttons that aren't Save, Send or Search image stay whatever is switched on. */
    @Test public void otherButtonsAreNeverHidden() {
        Settings.LONG_PRESS_DOWNLOAD.save(false);
        for (BooleanSetting hide : hides()) hide.save(true);
        Menu menu = new Menu(activity);
        activity.setContentView(menu);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Button save = new Button(activity, LongPressDownload.SAVE), other = new Button(activity, LongPressDownload.OTHER);
        menu.layout(List.of(save, other));
        menu.show(new Event(pin("7")));
        assertEquals(List.of(other), menu.items.subList(1, menu.items.size()));
    }

    /** Off, paused, or on a build whose button ids weren't found, the hide switches leave the menu alone. */
    @Test public void withoutTheirHookOrPausedTheHideSwitchesHideNothing() {
        Runnable[] offs = {
                () -> PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.LONG_PRESS_MENU)),
                () -> PauseForTests.pause(HushPinterestPause.Reason.SWITCH),
        };
        for (Runnable off : offs) {
            Settings.LONG_PRESS_DOWNLOAD.save(false);
            for (BooleanSetting hide : hides()) hide.save(true);
            off.run();
            Menu menu = menu(3);
            List<Object> before = new ArrayList<>(menu.items);
            menu.show(new Event(pin("7")));
            assertUntouched(menu, before);
            reset();
            prepare();
        }
    }

    @Test public void aReleaseAfterTheMenuMovedOnOrClosedSavesNothing() throws Exception {
        Menu menu = menu(2);
        menu.show(new Event(pin("7")));
        View download = (View) menu.items.get(3);
        menu.shown = null;
        assertTrue(download.performClick());
        menu.shown = "8";
        assertTrue(download.performClick());
        menu.shown = "7";
        Settings.LONG_PRESS_DOWNLOAD.save(false);
        assertTrue(download.performClick());
        settle();
        assertEquals(0, Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE)).getRequestCount());
        assertTrue(new DownloadLedger(activity).reconcile().isEmpty());
    }

    /** The list accounts in android_longpress_menu_v2 get in place of the round menu (#16, #18). */
    @Test public void theNewerListGetsDownloadAfterPinterestsOptionsAndTappingItSavesThePin() throws Exception {
        ArrayList<Object> pinterest = options();
        ArrayList<Object> shown = LongPressDownload.composeItems(pinterest, new Event(pin("7")));
        assertEquals(4, shown.size());
        assertEquals(pinterest, shown.subList(0, 3));
        ComposeOption download = (ComposeOption) shown.get(3);
        assertSame(NativeMenu.ICON, download.iconAndLabel());
        assertEquals("download", download.getAnalyticsName());
        assertEquals(download, shown.get(3));
        assertNotEquals(download, shown.get(0));

        assertTrue(LongPressDownload.composeClick(download, pin("7")));
        settle();
        ShadowDownloadManager downloads = Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE));
        assertEquals(1, downloads.getRequestCount());
        assertEquals("https://i.pinimg.com/originals/7.jpg",
                Shadow.<ShadowDownloadManager.ShadowRequest>extract(downloads.getRequest(0)).getUri().toString());
        assertEquals("7", new DownloadLedger(activity).reconcile().get(0).pinId);
    }

    @Test public void pinterestsOwnOptionsInTheNewerListStayWithPinterest() throws Exception {
        for (Object option : LongPressDownload.composeItems(options(), new Event(pin("7")))) {
            if (option instanceof NativeOption) assertFalse(LongPressDownload.composeClick(option, pin("7")));
        }
        settle();
        assertEquals(0, Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE)).getRequestCount());
    }

    /** Another pin, no pin or a switch turned off in between: the tap is ours and nothing saves. */
    @Test public void aStaleTapInTheNewerListSavesNothing() throws Exception {
        Object otherPin = LongPressDownload.composeItems(options(), new Event(pin("7"))).get(3);
        assertTrue(LongPressDownload.composeClick(otherPin, pin("8")));
        Object noPin = LongPressDownload.composeItems(options(), new Event(pin("7"))).get(3);
        assertTrue(LongPressDownload.composeClick(noPin, null));
        Object off = LongPressDownload.composeItems(options(), new Event(pin("7"))).get(3);
        Settings.LONG_PRESS_DOWNLOAD.save(false);
        assertTrue(LongPressDownload.composeClick(off, pin("7")));
        settle();
        assertEquals(0, Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE)).getRequestCount());
        assertTrue(new DownloadLedger(activity).reconcile().isEmpty());
    }

    @Test public void oneDownloadOptionSavesOnceHoweverOftenItIsTapped() throws Exception {
        Object download = LongPressDownload.composeItems(options(), new Event(pin("7"))).get(3);
        assertTrue(LongPressDownload.composeClick(download, pin("7")));
        assertTrue(LongPressDownload.composeClick(download, pin("7")));
        settle();
        assertEquals(1, Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE)).getRequestCount());
    }

    @Test public void eachHideSwitchTakesItsOwnOptionOutOfTheNewerList() {
        for (int hidden = 0; hidden < hides().length; hidden++) {
            hides()[hidden].save(true);
            ArrayList<Object> pinterest = options();
            ArrayList<Object> shown = LongPressDownload.composeItems(pinterest, new Event(pin("7")));
            assertEquals(hides()[hidden].key, 3, shown.size());
            assertFalse(hides()[hidden].key, shown.contains(pinterest.get(hidden)));
            assertTrue(hides()[hidden].key, shown.get(2) instanceof ComposeOption && !(shown.get(2) instanceof NativeOption));
            reset();
            prepare();
        }
    }

    /** With Download off the hide switches still work, and a list they'd empty keeps Pinterest's options. */
    @Test public void theNewerListHidesWithDownloadOffAndIsNeverLeftEmpty() {
        Settings.LONG_PRESS_DOWNLOAD.save(false);
        Settings.LONG_PRESS_HIDE_SEND.save(true);
        ArrayList<Object> pinterest = options();
        assertEquals(List.of(pinterest.get(0), pinterest.get(2)), LongPressDownload.composeItems(pinterest, new Event(pin("7"))));

        for (BooleanSetting hide : hides()) hide.save(true);
        pinterest = options();
        assertSame(pinterest, LongPressDownload.composeItems(pinterest, new Event(pin("7"))));

        Settings.LONG_PRESS_DOWNLOAD.save(true);
        ArrayList<Object> alone = LongPressDownload.composeItems(options(), new Event(pin("7")));
        assertEquals(1, alone.size());
        assertFalse(alone.get(0) instanceof NativeOption);
    }

    /** A board, nothing at all, a list that already has ours, a switch off or a pause: the list as it came. */
    @Test public void anythingElseKeepsTheNewerListAsItCame() {
        for (Object event : new Object[]{new Event(new Board()), new Event(null), null}) {
            ArrayList<Object> pinterest = options();
            assertSame(pinterest, LongPressDownload.composeItems(pinterest, event));
        }
        ArrayList<Object> already = LongPressDownload.composeItems(options(), new Event(pin("7")));
        assertSame(already, LongPressDownload.composeItems(already, new Event(pin("7"))));
        assertNull(LongPressDownload.composeItems(null, new Event(pin("7"))));

        Runnable[] offs = {
                () -> Settings.LONG_PRESS_DOWNLOAD.save(false),
                () -> Settings.DOWNLOAD_PINS.save(false),
                () -> PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS)),
                () -> PauseForTests.pause(HushPinterestPause.Reason.SWITCH),
        };
        for (Runnable off : offs) {
            off.run();
            ArrayList<Object> pinterest = options();
            assertSame(pinterest, LongPressDownload.composeItems(pinterest, new Event(pin("7"))));
            reset();
            prepare();
        }
    }

    /** Pinterest's own options in the newer list, in the order its builder adds them. */
    private static ArrayList<Object> options() {
        return new ArrayList<>(List.of(NativeOption.SAVE, NativeOption.SEND, NativeOption.SEARCH));
    }

    /** The newer menu's two-method option interface. */
    interface ComposeOption {
        Object iconAndLabel();
        String getAnalyticsName();
    }

    /** The enum of Pinterest's options that interface comes with. */
    enum NativeOption implements ComposeOption {
        SAVE, SEND, SEARCH;
        @Override public Object iconAndLabel() { return this; }
        @Override public String getAnalyticsName() { return name(); }
    }

    private static void assertUntouched(Menu menu, List<Object> before) {
        assertEquals(before, menu.items);
        assertEquals(before.size(), menu.getChildCount());
        assertEquals(1, menu.layouts);
        assertTrue(NativeMenu.reattached.isEmpty());
    }

    /**
     * A menu on screen, so its buttons attach and detach the way the real ones do. Its buttons are
     * Save, Send and Search image in that order, the way Pinterest lays out a pin's, then others.
     */
    private Menu menu(int buttons) {
        Menu menu = new Menu(activity);
        activity.setContentView(menu);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        List<Object> pinterest = new ArrayList<>();
        for (int i = 0; i < buttons; i++) pinterest.add(new Button(activity, i < 3 ? LongPressDownload.SAVE + i : LongPressDownload.OTHER));
        menu.layout(pinterest);
        return menu;
    }

    /**
     * One of Pinterest's buttons, with the kind its builder's id makes it: leaving the window marks
     * its springs detached, and nothing clears it.
     */
    static final class Button extends View {
        final int kind;
        boolean springsDetached;

        Button(Context context) { this(context, LongPressDownload.OTHER); }

        Button(Context context, int kind) {
            super(context);
            this.kind = kind;
        }

        @Override protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            springsDetached = true;
        }
    }

    private static Object pin(String id) {
        return Map.of("id", id, "title", "Picture " + id, "images",
                Map.of("orig", Map.of("url", "https://i.pinimg.com/originals/" + id + ".jpg")));
    }

    private void settle() throws Exception {
        java.lang.reflect.Method await = Utils.class.getDeclaredMethod("awaitBackgroundTasksForTests");
        await.setAccessible(true);
        for (int i = 0; i < 5; i++) {
            await.invoke(null);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    /** What the long-press carries: a pin, a board, or nothing Pinterest could name. */
    static final class Event {
        final Object model;
        Event(Object model) { this.model = model; }
    }

    static final class Board {}

    /** Pinterest's menu: lays out an origin marker and the buttons, and keeps the shown model's id. */
    static final class Menu extends FrameLayout {
        final ArrayList<Object> items = new ArrayList<>();
        String shown;
        int layouts;

        Menu(Context context) { super(context); }

        void layout(List<Object> buttons) {
            for (Object item : items) removeView((View) item);
            items.clear();
            View origin = new View(getContext());
            addView(origin);
            items.add(origin);
            for (Object button : buttons) {
                addView((View) button);
                items.add(button);
            }
            layouts++;
        }

        /** The show call: the hook at its head, then Pinterest names the model it's showing. */
        void show(Event event) {
            LongPressDownload.show(this, event);
            if (event.model instanceof Map) shown = (String) ((Map<?, ?>) event.model).get("id");
        }
    }

    @Implements(value = LongPressDownload.class, isInAndroidSdk = false)
    public static final class NativeMenu {
        @Implementation protected static Object eventPin(Object event) {
            Object model = event == null ? null : ((Event) event).model;
            return model instanceof Map ? model : null;
        }
        @Implementation protected static String menuModel(Object menu) { return ((Menu) menu).shown; }
        @Implementation protected static String modelId(Object model) { return (String) ((Map<?, ?>) model).get("id"); }
        @Implementation protected static ArrayList<Object> menuItems(Object menu) { return ((Menu) menu).items; }
        @Implementation protected static void layoutItems(Object menu, List<Object> buttons) { ((Menu) menu).layout(buttons); }
        static final List<Object> reattached = new ArrayList<>();
        @Implementation protected static void springsReattached(Object button) {
            ((Button) button).springsDetached = false;
            reattached.add(button);
        }
        @Implementation protected static View downloadItem(Context context) { return new View(context); }
        @Implementation protected static int buttonKind(Object button) {
            return button instanceof Button ? ((Button) button).kind : LongPressDownload.OTHER;
        }
        static final Object ICON = new Object();
        @Implementation protected static Class<?> composeOptionType() { return ComposeOption.class; }
        @Implementation protected static Object composeIconAndLabel() { return ICON; }
        @Implementation protected static int composeKind(Object option) {
            return option instanceof NativeOption ? LongPressDownload.SAVE + ((NativeOption) option).ordinal() : LongPressDownload.OTHER;
        }
    }
}
