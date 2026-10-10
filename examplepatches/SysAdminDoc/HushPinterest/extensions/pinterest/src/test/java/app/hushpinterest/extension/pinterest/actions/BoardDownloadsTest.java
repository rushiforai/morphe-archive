/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;
import android.app.Activity;
import android.os.Looper;
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
import org.robolectric.shadows.ShadowToast;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = BoardDownloadsTest.Stubs.class,
        instrumentedPackages = "app.hushpinterest.extension.pinterest.actions")
public class BoardDownloadsTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();
    private Activity activity;

    /** Pinterest's option group as the stubs see it: its rows and the handler they're chosen through. */
    static final class Group {
        final List<?> items;
        final Object handler;

        Group(List<?> items, Object handler) {
            this.items = items;
            this.handler = handler;
        }
    }

    /** The board screen, counting the sheets it was asked to close. */
    static final class Screen {
        int dismissed;
    }

    /** What the patch writes into the stubs, for the classes above. */
    @Implements(value = BoardDownloads.class, isInAndroidSdk = false)
    public static class Stubs {
        @Implementation protected static List<?> menuItems(Object menu) { return ((Group) menu).items; }
        @Implementation protected static Object menuHandler(Object menu) { return ((Group) menu).handler; }
        @Implementation protected static Object menuCopy(Object menu, List<?> items, Object handler) { return new Group(items, handler); }
        @Implementation protected static Object menuRow(int title, int index, String text) { return Arrays.asList(title, index, text); }
        @Implementation protected static int title() { return 7; }
        @Implementation protected static String boardId(Object screen) { return "4242"; }
        @Implementation protected static void dismissMenu(Object screen) { ((Screen) screen).dismissed++; }
    }

    @Before public void prepare() {
        activity = Robolectric.buildActivity(Activity.class).setup().visible().get();
        Utils.setActivity(activity);
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS,
                PatchFamily.Capability.BOARD_MENU, PatchFamily.Capability.BOARD_PINS));
        Settings.DOWNLOAD_PINS.save(true);
        Settings.DOWNLOAD_BOARD.save(true);
        BoardDownloads.forget();
    }

    @After public void reset() {
        BoardDownloads.forget();
        Settings.DOWNLOAD_BOARD.save(false);
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Utils.setActivity(null);
    }

    private static Map<String, Object> pin(String id, String board) {
        return Map.of("id", id, "images", Map.of("orig", Map.of("url", "https://i.pinimg.com/originals/" + id + ".jpg")),
                "board", Map.of("id", board));
    }

    private static List<Object> page(String board, int first, int count) {
        List<Object> pins = new ArrayList<>();
        for (int n = first; n < first + count; n++) pins.add(pin(String.valueOf(n), board));
        return pins;
    }

    private static List<Object> ids(List<Object> pins) {
        List<Object> ids = new ArrayList<>();
        for (Object pin : pins) ids.add(PinMedia.id(pin));
        return ids;
    }

    @Test public void aPageOfOneBoardIsKeptAndAFeedOfManyBoardsIsNot() {
        assertTrue(BoardDownloads.record(page("77", 100, 10)));
        assertEquals(10, BoardDownloads.loaded("77").size());

        List<Object> feed = new ArrayList<>();
        for (int n = 0; n < 10; n++) feed.add(pin(String.valueOf(500 + n), String.valueOf(10 + n % 5)));
        assertFalse("a home feed names no one board", BoardDownloads.record(feed));
        for (int board = 10; board < 15; board++) assertTrue(BoardDownloads.loaded(String.valueOf(board)).isEmpty());

        // Nine of ten naming board 77 is a page of it. Only those nine are kept.
        List<Object> mostly = page("77", 200, 9);
        mostly.add(pin("900", "88"));
        mostly.add("a story, not a pin");
        assertTrue(BoardDownloads.record(mostly));
        assertEquals(19, BoardDownloads.loaded("77").size());
        assertFalse(ids(BoardDownloads.loaded("77")).contains("900"));
        assertTrue(BoardDownloads.loaded("88").isEmpty());

        // A pin Pinterest loads again keeps its place.
        assertTrue(BoardDownloads.record(page("77", 100, 1)));
        assertEquals("100", PinMedia.id(BoardDownloads.loaded("77").get(0)));
        assertEquals(19, BoardDownloads.loaded("77").size());
    }

    @Test public void aBoardKeepsUpToItsLimitAndOnlyTheLastFewBoardsStay() {
        BoardDownloads.record(page("1", 0, BoardDownloads.PINS + 20));
        assertEquals(BoardDownloads.PINS, BoardDownloads.loaded("1").size());
        for (int board = 2; board <= BoardDownloads.BOARDS + 1; board++) BoardDownloads.record(page(String.valueOf(board), 10_000 * board, 3));
        assertTrue("the least recently used board goes first", BoardDownloads.loaded("1").isEmpty());
        for (int board = 2; board <= BoardDownloads.BOARDS + 1; board++) assertEquals(3, BoardDownloads.loaded(String.valueOf(board)).size());
    }

    @Test public void switchedOffOrPausedItKeepsNothingAndForgetsWhatItHad() {
        BoardDownloads.record(page("77", 100, 5));
        Settings.DOWNLOAD_BOARD.save(false);
        assertFalse(BoardDownloads.record(page("77", 200, 5)));
        assertTrue(BoardDownloads.loaded("77").isEmpty());

        Settings.DOWNLOAD_BOARD.save(true);
        BoardDownloads.record(page("77", 100, 5));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(BoardDownloads.record(page("77", 200, 5)));
        assertTrue(BoardDownloads.loaded("77").isEmpty());

        // Download pins off doesn't stop the keeping: its switch is this one.
        PauseForTests.resume();
        Settings.DOWNLOAD_PINS.save(false);
        assertTrue(BoardDownloads.record(page("77", 100, 5)));
    }

    @Test public void theMenuGainsOneRowAtAnIndexPinterestDoesNotUse() throws Exception {
        List<Object> chosen = new ArrayList<>();
        Group menu = new Group(Arrays.asList("edit", "share"), function(chosen));
        Screen screen = new Screen();
        Object answered = BoardDownloads.menu(menu, screen);
        assertNotSame(menu, answered);
        Group copy = (Group) answered;
        assertEquals(Arrays.asList("edit", "share", Arrays.asList(7, 2, "Download board")), copy.items);

        // Pinterest's rows still reach Pinterest's handler, with what it answers.
        assertEquals("pinterest answered 1", invoke(copy.handler, 1));
        assertEquals(Arrays.asList(1), chosen);

        // The new row closes the sheet and doesn't reach Pinterest. Nothing loaded yet, so it says so.
        invoke(copy.handler, 2);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(Arrays.asList(1), chosen);
        assertEquals(1, screen.dismissed);
        assertEquals("No pins from this board have loaded yet. Scroll through the board, then try again.",
                ShadowToast.getTextOfLatestToast());
    }

    @Test public void theMenuStaysPinterestsWhenOffPausedOrWithoutDownloadPins() throws Exception {
        Group menu = new Group(Arrays.asList("edit"), function(new ArrayList<>()));
        Screen screen = new Screen();
        Settings.DOWNLOAD_BOARD.save(false);
        assertSame(menu, BoardDownloads.menu(menu, screen));
        Settings.DOWNLOAD_BOARD.save(true);
        Settings.DOWNLOAD_PINS.save(false);
        assertSame("every pin goes through Download pins", menu, BoardDownloads.menu(menu, screen));
        Settings.DOWNLOAD_PINS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertSame(menu, BoardDownloads.menu(menu, screen));
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.BOARD_PINS));
        assertSame("a build without the menu hook", menu, BoardDownloads.menu(menu, screen));
        assertEquals(0, screen.dismissed);
    }

    /** A Kotlin Function1 like Pinterest's row handler: it notes the index and answers. */
    private static Object function(List<Object> chosen) throws Exception {
        Class<?> face = Class.forName("kotlin.jvm.functions.Function1");
        return Proxy.newProxyInstance(face.getClassLoader(), new Class<?>[]{face}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) {
                chosen.add(args[0]);
                return "pinterest answered " + args[0];
            }
            if (method.getName().equals("equals")) return proxy == args[0];
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            return "handler";
        });
    }

    private static Object invoke(Object handler, int index) throws Exception {
        Method invoke = Class.forName("kotlin.jvm.functions.Function1").getMethod("invoke", Object.class);
        return invoke.invoke(handler, index);
    }
}
