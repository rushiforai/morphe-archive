/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.net.Uri;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

/**
 * The chat list banner (#86): which choice paints what, that the colors keep the bar's title and
 * icons readable in a light and a dark theme, and that the chat list's bar shows the banner in
 * place of its own fill and blur while every other bar, a pause and no choice leave it as it was.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = ChatListBannerTest.BarAnswers.class,
        instrumentedPackages = {"app.hushtelegram.extension.telegram.misc"})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class ChatListBannerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int WIDTH = 200, HEIGHT = 40;
    /** What the stand-in bar paints where Telegram paints the list blurred under it. */
    private static final int BLUR = 0xFF123456;
    /** Telegram's title colors in a light theme and a dark one. */
    private static final int DARK_TITLE = 0xFF222222, LIGHT_TITLE = 0xFFFFFFFF;

    /** Stands in for what the patch writes into holiday and titleColor. */
    @Implements(value = ChatListBanner.class, isInAndroidSdk = false)
    public static class BarAnswers {
        static boolean chatList = true;
        static int title = DARK_TITLE;
        static boolean titleThrows;

        @Implementation protected static int holiday(View bar) {
            return chatList && bar instanceof Bar ? 1 : 0;
        }

        @Implementation protected static int titleColor(View bar) {
            if (titleThrows) throw new IllegalStateException("no title");
            return title;
        }
    }

    /** A top bar drawing the way the patched one does: the banner first, then the blur Telegram asks for. */
    static final class Bar extends FrameLayout {
        int blur = 1;

        Bar(Context context) {
            super(context);
            setWillNotDraw(false);
        }

        @Override protected void dispatchDraw(Canvas canvas) {
            ChatListBanner.draw(this, canvas);
            if (ChatListBanner.blur(this, blur) != 0) canvas.drawColor(BLUR);
            super.dispatchDraw(canvas);
        }
    }

    private Context context;
    private Bar bar;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        HookStatus.clear();
        bar = new Bar(context);
        bar.measure(View.MeasureSpec.makeMeasureSpec(WIDTH, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(HEIGHT, View.MeasureSpec.EXACTLY));
        bar.layout(0, 0, WIDTH, HEIGHT);
    }

    @After public void tearDown() {
        PauseForTests.resume();
        BarAnswers.chatList = true;
        BarAnswers.title = DARK_TITLE;
        BarAnswers.titleThrows = false;
        Settings.CHAT_LIST_BANNER.resetToDefault();
        SavedPicture.remove(context, SavedPicture.CHAT_LIST_BANNER);
        ChatListBanner.changed();
        // One plain draw, so the next test starts from a bar that shows nothing.
        drawn();
        HookStatus.clear();
    }

    private Bitmap drawn() {
        Bitmap bitmap = Bitmap.createBitmap(WIDTH, HEIGHT, Bitmap.Config.ARGB_8888);
        bar.draw(new Canvas(bitmap));
        return bitmap;
    }

    private static void assertNear(String what, int expected, int actual) {
        for (int shift = 0; shift <= 24; shift += 8) {
            int want = expected >>> shift & 0xFF, got = actual >>> shift & 0xFF;
            assertTrue(what + ": expected " + Integer.toHexString(expected) + " got " + Integer.toHexString(actual),
                    Math.abs(want - got) <= 6);
        }
    }

    private void assertStock(String why) {
        Bitmap bitmap = drawn();
        assertEquals(why, BLUR, bitmap.getPixel(WIDTH / 2, HEIGHT / 2));
        assertEquals(why + ": the blur is Telegram's to ask for", 1, ChatListBanner.blur(bar, 1));
    }

    private static void settle() throws Exception {
        for (int i = 0; i < 3; i++) {
            Utils.awaitBackgroundTasksForTests();
            shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private void savePicture(int color) {
        Bitmap made = Bitmap.createBitmap(30, 30, Bitmap.Config.ARGB_8888);
        made.eraseColor(color);
        ByteArrayOutputStream png = new ByteArrayOutputStream();
        made.compress(Bitmap.CompressFormat.PNG, 100, png);
        Uri uri = Uri.parse("content://media.test/picture/banner" + Integer.toHexString(color));
        shadowOf(context.getContentResolver()).registerInputStream(uri, new ByteArrayInputStream(png.toByteArray()));
        assertEquals(SavedPicture.Saved.SAVED, SavedPicture.save(context, uri, SavedPicture.CHAT_LIST_BANNER));
        Settings.CHAT_LIST_BANNER.save(ChatListBanner.PICTURE);
        ChatListBanner.changed();
    }

    @Test public void eachChoicePaintsItsKindAndAMissingPictureNothing() {
        assertEquals(ChatListBanner.Kind.NONE, ChatListBanner.kind(null, true));
        assertEquals(ChatListBanner.Kind.NONE, ChatListBanner.kind("", true));
        for (String gradient : ChatListBanner.GRADIENTS) {
            assertEquals(gradient, ChatListBanner.Kind.GRADIENT, ChatListBanner.kind(gradient, false));
            assertTrue(gradient, ChatListBanner.allowed(gradient));
        }
        assertEquals(ChatListBanner.Kind.PICTURE, ChatListBanner.kind(ChatListBanner.PICTURE, true));
        assertEquals("a picture that's gone paints nothing", ChatListBanner.Kind.NONE, ChatListBanner.kind(ChatListBanner.PICTURE, false));
        for (String unknown : new String[]{"sunset", "Ocean", " ocean", "picture2"}) {
            assertEquals(unknown, ChatListBanner.Kind.NONE, ChatListBanner.kind(unknown, true));
            assertFalse(unknown, ChatListBanner.allowed(unknown));
            assertEquals(unknown, ChatListBanner.NONE, ChatListBanner.gradientName(unknown));
        }
        assertTrue(ChatListBanner.allowed(ChatListBanner.NONE));
        assertTrue(ChatListBanner.allowed(ChatListBanner.PICTURE));
        assertFalse(ChatListBanner.allowed(null));
        assertEquals("off by default", ChatListBanner.NONE, Settings.CHAT_LIST_BANNER.get());
    }

    @Test public void theTitleStaysReadableOnEveryGradientAndVeil() {
        for (int i = 0; i < ChatListBanner.GRADIENTS.length; i++) {
            for (int color : ChatListBanner.colors(i, false)) {
                assertTrue(ChatListBanner.GRADIENTS[i] + " under a dark title",
                        ChatListBanner.contrast(color, DARK_TITLE) >= 4.5);
                assertTrue(ChatListBanner.GRADIENTS[i] + " under black",
                        ChatListBanner.contrast(color, Color.BLACK) >= 4.5);
            }
            for (int color : ChatListBanner.colors(i, true)) {
                assertTrue(ChatListBanner.GRADIENTS[i] + " under a light title",
                        ChatListBanner.contrast(color, LIGHT_TITLE) >= 4.5);
            }
        }
        // The worst picture for each veil: black under the white one, white under the black one.
        assertTrue(ChatListBanner.contrast(ChatListBanner.blend(ChatListBanner.veil(false), Color.BLACK), DARK_TITLE) >= 4.5);
        assertTrue(ChatListBanner.contrast(ChatListBanner.blend(ChatListBanner.veil(true), Color.WHITE), LIGHT_TITLE) >= 4.5);
        assertTrue(ChatListBanner.lightTitle(LIGHT_TITLE));
        assertFalse(ChatListBanner.lightTitle(DARK_TITLE));
        assertFalse("a title not known reads as dark", ChatListBanner.lightTitle(0));
    }

    @Test public void withNoChoiceTheBarStaysTelegrams() {
        assertStock("nothing chosen");
        assertFalse(String.join("\n", HookStatus.report()).contains("chat list banner shown"));
    }

    @Test public void aGradientCoversTheBarInPlaceOfItsBlurAndFollowsTheTheme() {
        Settings.CHAT_LIST_BANNER.save("ocean");
        Bitmap bitmap = drawn();
        int[] light = ChatListBanner.colors(1, false);
        assertNear("left end", light[0], bitmap.getPixel(0, HEIGHT / 2));
        assertNear("right end", light[1], bitmap.getPixel(WIDTH - 1, HEIGHT / 2));
        assertEquals("the blur would cover it", 0, ChatListBanner.blur(bar, 1));
        assertEquals("a bar that wasn't blurring stays so", 0, ChatListBanner.blur(bar, 0));
        assertTrue(String.join("\n", HookStatus.report()).contains("chat list banner shown"));

        // A dark theme's light title gets the deep pair on the next draw.
        BarAnswers.title = LIGHT_TITLE;
        bitmap = drawn();
        int[] deep = ChatListBanner.colors(1, true);
        assertNear("left end, dark theme", deep[0], bitmap.getPixel(0, HEIGHT / 2));
        assertNear("right end, dark theme", deep[1], bitmap.getPixel(WIDTH - 1, HEIGHT / 2));

        // Cleared, the next draw is Telegram's again.
        Settings.CHAT_LIST_BANNER.save(ChatListBanner.NONE);
        ChatListBanner.changed();
        assertStock("cleared");
        assertTrue(String.join("\n", HookStatus.report()).contains("chat list banner cleared"));
    }

    @Test public void onlyTheChatListsBarGetsIt() {
        Settings.CHAT_LIST_BANNER.save("dusk");
        BarAnswers.chatList = false;
        assertStock("another screen's bar");
        assertEquals("a view the patch never reaches stays as it was", 1, ChatListBanner.blur(new View(context), 1));
    }

    @Test public void aPauseLeavesTheBarAsTelegramPaintsIt() {
        Settings.CHAT_LIST_BANNER.save("ember");
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertStock("paused");
        PauseForTests.resume();
        assertNear("resumed", ChatListBanner.colors(3, false)[0], drawn().getPixel(0, HEIGHT / 2));
    }

    /** Telegram can draw before HushTelegram has its context, or before the pause is decided: the bar stays its own. */
    @Test public void untilTheSettingsAreReadyTheBarStaysTelegrams() {
        Settings.CHAT_LIST_BANNER.save("forest");
        SettingsContextRule.withoutContext(() -> assertStock("before the context is set"));
        BaseSettings.SAFE_MODE.save(true);
        try {
            SettingsContextRule.beforeThePauseIsDecided(() -> assertStock("before the pause is decided"));
        } finally {
            BaseSettings.SAFE_MODE.resetToDefault();
        }
        assertNear("once they're ready", ChatListBanner.colors(2, false)[0], drawn().getPixel(0, HEIGHT / 2));
    }

    @Test public void aPictureShowsUnderAVeilOnceDecodedAndStays() throws Exception {
        Settings.CHAT_LIST_BANNER.save(ChatListBanner.PICTURE);
        assertStock("picture chosen but none saved");

        savePicture(Color.RED);
        assertStock("until the copy at the bar's size lands, Telegram's look shows");
        settle();
        int veiled = ChatListBanner.blend(ChatListBanner.veil(false), Color.RED);
        assertNear("picture under a white veil", veiled, drawn().getPixel(WIDTH / 2, HEIGHT / 2));
        assertEquals(0, ChatListBanner.blur(bar, 1));
        // The landed copy is kept: later frames draw it without decoding again.
        settle();
        assertNear("still there", veiled, drawn().getPixel(WIDTH / 2, HEIGHT / 2));
        assertNear("and the next frame too", veiled, drawn().getPixel(WIDTH / 2, HEIGHT / 2));

        BarAnswers.title = LIGHT_TITLE;
        assertNear("a black veil under a light title", ChatListBanner.blend(ChatListBanner.veil(true), Color.RED),
                drawn().getPixel(WIDTH / 2, HEIGHT / 2));

        // Removed, the bar is Telegram's at once.
        SavedPicture.remove(context, SavedPicture.CHAT_LIST_BANNER);
        ChatListBanner.changed();
        assertStock("picture removed");
    }

    @Test public void aFailingDrawIsReportedAndLeavesTheBarToTelegram() {
        Settings.CHAT_LIST_BANNER.save("slate");
        BarAnswers.titleThrows = true;
        assertStock("the title couldn't be read");
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("'chat list banner' hook"));
        ChatListBanner.draw(null, null);
        assertEquals(1, ChatListBanner.blur(null, 1));
    }
}
