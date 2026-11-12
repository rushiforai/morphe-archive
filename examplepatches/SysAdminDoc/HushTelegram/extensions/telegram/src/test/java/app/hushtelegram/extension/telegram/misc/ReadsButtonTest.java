/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
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
import org.telegram.tgnet.TLRPC;

import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.L10nTablesForTests;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsEntry;

/** The chat list's read receipts button (#69), on a bar built the way GhostButtonTest builds Telegram's. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReadsButtonTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int BUTTON = 110;
    private static final PorterDuffColorFilter BAR_COLOR = new PorterDuffColorFilter(0xFF3A6D99, PorterDuff.Mode.MULTIPLY);
    private static final GhostMode.Requests REQUESTS = GhostMode.requests;

    private static final String SENT = "Read receipts sent";
    private static final String NONE_WAITING = "No read receipts waiting";
    private static final String NOT_SENT = "Couldn't send read receipts";

    private ActivityController<Activity> chats;
    private FrameLayout search;
    private boolean sends = true;
    private final List<Object> sent = new ArrayList<>();

    @Before public void setUp() {
        chats = Robolectric.buildActivity(Activity.class).setup();
        PatchFamilyForTests.installed(PatchFamily.Capability.GHOST_MODE);
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READS.resetToDefault();
        Settings.GHOST_READS_BUTTON.save(true);
        GhostMode.forgetHeld();
        GhostMode.requests = new GhostMode.Requests() {
            @Override public int account() {
                return 0;
            }

            @Override public boolean send(int account, Object request, Object callback) {
                if (!sends) return false;
                sent.add(request);
                return !GhostMode.drop(request, null);
            }

            @Override public List<Integer> signedIn() {
                return new ArrayList<>();
            }
        };
        ShadowToast.reset();
    }

    @After public void tearDown() {
        PatchFamilyForTests.resetCapabilities();
        PauseForTests.resume();
        GhostMode.requests = REQUESTS;
        GhostMode.forgetHeld();
        Settings.GHOST_MODE.resetToDefault();
        Settings.GHOST_READS.resetToDefault();
        Settings.GHOST_READS_BUTTON.resetToDefault();
        chats.pause().stop().destroy();
    }

    /** The chat list's top bar on screen: a title, and a menu holding the search field and one button. */
    private GhostButtonTest.Menu shown() {
        Context context = chats.get();
        GhostButtonTest.Menu menu = new GhostButtonTest.Menu(context);
        FrameLayout bar = new FrameLayout(context);
        bar.addView(new View(context), new FrameLayout.LayoutParams(360, 90));
        search = new FrameLayout(context);
        search.setVisibility(View.GONE);
        menu.addView(search, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
        ImageView searchButton = new ImageView(context);
        searchButton.setColorFilter(BAR_COLOR);
        menu.addView(searchButton, new LinearLayout.LayoutParams(BUTTON, ViewGroup.LayoutParams.MATCH_PARENT));
        bar.addView(menu, new FrameLayout.LayoutParams(-2, 90, Gravity.RIGHT));
        FrameLayout screen = new FrameLayout(context);
        screen.addView(bar, new FrameLayout.LayoutParams(720, 90));
        chats.get().setContentView(screen);
        ShadowLooper.idleMainLooper();
        SettingsEntry.watchChatListTitle(bar);
        ShadowLooper.idleMainLooper();
        return menu;
    }

    private static ReadsButton.Checks checks(ViewGroup menu) {
        ReadsButton.Checks found = ReadsButton.find(menu);
        assertNotNull("no read receipts button on the chat list's bar", found);
        return found;
    }

    private static String toast() {
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    private static TLRPC.TL_messages_readHistory read(long user) {
        TLRPC.TL_messages_readHistory request = new TLRPC.TL_messages_readHistory();
        request.peer = new TLRPC.TL_inputPeerUser();
        request.peer.user_id = user;
        return request;
    }

    @Test public void theChecksSitRightAfterTheGhostAtTheBarsWidthAndInItsColor() {
        GhostButtonTest.Menu menu = shown();
        ReadsButton.Checks checks = checks(menu);

        assertEquals("the checks aren't right after the ghost", menu.indexOfChild(GhostButton.find(menu)) + 1,
                menu.indexOfChild(checks));
        assertEquals(View.VISIBLE, checks.getVisibility());
        assertEquals("the checks aren't as wide as Telegram's buttons", BUTTON, checks.getWidth());
        assertSame("the checks aren't drawn in the bar's icon color", BAR_COLOR, checks.color());
        assertEquals("Send read receipts", String.valueOf(checks.getContentDescription()));
        checks.draw(new Canvas(Bitmap.createBitmap(BUTTON, 90, Bitmap.Config.ARGB_8888)));
    }

    @Test public void aTapSendsTheHeldReadsAndSaysHowItWent() {
        ReadsButton.Checks checks = checks(shown());

        checks.performClick();
        assertEquals(NONE_WAITING, toast());

        TLRPC.TL_messages_readHistory first = read(5);
        TLRPC.TL_messages_readHistory second = read(6);
        assertTrue(GhostMode.drop(first, null));
        assertTrue(GhostMode.drop(second, null));
        sends = false;
        checks.performClick();
        assertEquals(NOT_SENT, toast());
        assertTrue(sent.isEmpty());

        sends = true;
        checks.performClick();
        assertEquals(SENT, toast());
        assertEquals(2, sent.size());
        assertTrue(sent.contains(first) && sent.contains(second));
    }

    @Test public void theChecksFollowTheirSwitchesWithoutARestart() {
        ReadsButton.Checks checks = checks(shown());

        for (Runnable off : new Runnable[]{
                () -> Settings.GHOST_READS_BUTTON.save(false),
                () -> Settings.GHOST_MODE.save(false),
                () -> Settings.GHOST_READS.save(false),
                () -> PauseForTests.pause(HushTelegramPause.Reason.SWITCH)}) {
            off.run();
            checks.follow();
            assertEquals("the checks stayed with a switch off", View.GONE, checks.getVisibility());
            PauseForTests.resume();
            Settings.GHOST_READS_BUTTON.save(true);
            Settings.GHOST_MODE.save(true);
            Settings.GHOST_READS.save(true);
            checks.follow();
            assertEquals("the checks didn't come back", View.VISIBLE, checks.getVisibility());
        }
    }

    @Test public void theChecksStepAsideWhileTheBarsSearchIsOpen() {
        ReadsButton.Checks checks = checks(shown());

        search.setVisibility(View.VISIBLE);
        checks.follow();
        assertEquals(View.GONE, checks.getVisibility());
        search.setVisibility(View.GONE);
        checks.follow();
        assertEquals(View.VISIBLE, checks.getVisibility());
    }

    @Test public void theBarGetsOneButtonAndABuildWithoutGhostModeGetsNone() {
        GhostButtonTest.Menu menu = shown();
        ReadsButton.place((ViewGroup) menu.getParent());
        int found = 0;
        for (int i = 0; i < menu.getChildCount(); i++) {
            if (menu.getChildAt(i) instanceof ReadsButton.Checks) found++;
        }
        assertEquals(1, found);

        PatchFamilyForTests.installed();
        GhostButtonTest.Menu without = shown();
        assertNull("a build without Ghost mode got the button", ReadsButton.find(without));
    }

    @Test public void theToastsFitTwoLinesInEveryLanguage() {
        for (String toast : new String[]{SENT, NONE_WAITING, NOT_SENT}) {
            assertFitsATwoLineToast("en", toast);
            for (String language : new String[]{"bg", "de", "es", "in", "pt-rbr", "tr"}) {
                String row = L10nTablesForTests.of(language).get(toast);
                assertNotNull(language + ": " + toast, row);
                assertFitsATwoLineToast(language, row);
            }
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }
}
