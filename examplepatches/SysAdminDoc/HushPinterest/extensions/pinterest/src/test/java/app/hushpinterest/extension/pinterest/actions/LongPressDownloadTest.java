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
    private Activity activity;

    @Before public void prepare() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        Utils.setActivity(activity);
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.LONG_PRESS_MENU));
        Settings.DOWNLOAD_PINS.save(true);
        Settings.LONG_PRESS_DOWNLOAD.save(true);
    }

    @After public void reset() {
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

    private static void assertUntouched(Menu menu, List<Object> before) {
        assertEquals(before, menu.items);
        assertEquals(before.size(), menu.getChildCount());
        assertEquals(1, menu.layouts);
    }

    private Menu menu(int buttons) {
        Menu menu = new Menu(activity);
        List<Object> pinterest = new ArrayList<>();
        for (int i = 0; i < buttons; i++) pinterest.add(new View(activity));
        menu.layout(pinterest);
        return menu;
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
        @Implementation protected static View downloadItem(Context context) { return new View(context); }
    }
}
