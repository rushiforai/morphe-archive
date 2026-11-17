/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.graphics.RectF;
import android.view.View;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ChatListAvatarTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final ChatListAvatar.Telegram STOCK = ChatListAvatar.telegram;
    /** Telegram's round avatar on a 3x phone: 28 dp of radius. */
    private static final int ROUND = 84;

    private final Object cell = new Object();
    private final Object avatar = new Object();
    private final Map<Object, int[]> radii = new HashMap<>();
    private final List<Integer> set = new ArrayList<>();

    @Before public void setUp() {
        restore();
        radii.put(avatar, new int[] {ROUND, ROUND, ROUND, ROUND});
        ChatListAvatar.telegram = new ChatListAvatar.Telegram() {
            @Override public Object avatarOf(Object row) { return row == cell ? avatar : null; }
            @Override public int[] radii(Object image) { return radii.get(image); }
            @Override public void setRadius(Object image, int radius) {
                set.add(radius);
                radii.put(image, new int[] {radius, radius, radius, radius});
            }
        };
        PatchFamilyForTests.installed(PatchFamily.Capability.CHAT_LIST_AVATAR);
    }

    @After public void restore() {
        ChatListAvatar.telegram = STOCK;
        ChatListAvatar.forget();
        PatchFamilyForTests.resetCapabilities();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.CHAT_LIST_AVATAR);
        Settings.CHAT_LIST_AVATAR.resetToDefault();
        Settings.CHAT_LIST_AVATAR_SIZE.resetToDefault();
        HookStatus.clear();
    }

    /** Telegram's two-line row on a 3x phone: a 52 dp square, 11 dp in and 9 dp down. */
    private static RectF square() {
        return new RectF(33, 27, 189, 183);
    }

    private static void assertSquare(float left, float top, float right, float bottom, RectF rect) {
        assertSquare("", left, top, right, bottom, rect);
    }

    private static void assertSquare(String why, float left, float top, float right, float bottom, RectF rect) {
        String what = why + " " + rect;
        assertEquals(what, left, rect.left, 0.001f);
        assertEquals(what, top, rect.top, 0.001f);
        assertEquals(what, right, rect.right, 0.001f);
        assertEquals(what, bottom, rect.bottom, 0.001f);
    }

    private int radius() {
        return radii.get(avatar)[0];
    }

    @Test public void offByDefaultEveryAvatarKeepsTelegramsSize() {
        assertFalse(Settings.CHAT_LIST_AVATAR.get());
        assertEquals(ChatListAvatar.DEFAULT, (int) Settings.CHAT_LIST_AVATAR_SIZE.get());
        RectF rect = square();
        ChatListAvatar.resize(rect, cell);
        assertSquare(33, 27, 189, 183, rect);
        assertEquals(ROUND, radius());
        assertTrue(set.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_FOLDER_COUNTERS));
    }

    @Test public void onTheSquareShrinksAroundItsCenterAndTheCornersFollow() {
        Settings.CHAT_LIST_AVATAR.save(true);
        RectF rect = square();
        ChatListAvatar.resize(rect, cell);
        // 80% of 156 pixels is 124.8, around the center at (111, 105).
        assertSquare(48.6f, 42.6f, 173.4f, 167.4f, rect);
        assertEquals("67.2 rounds down", 67, radius());

        Settings.CHAT_LIST_AVATAR_SIZE.save(120);
        rect = square();
        ChatListAvatar.resize(rect, cell);
        assertSquare(17.4f, 11.4f, 204.6f, 198.6f, rect);
        assertEquals("from Telegram's radius, not the 80% one", 101, radius());
    }

    @Test public void anotherLayoutDoesntShrinkTheCornersTwice() {
        Settings.CHAT_LIST_AVATAR.save(true);
        for (int layout = 0; layout < 3; layout++) {
            RectF rect = square();
            ChatListAvatar.resize(rect, cell);
            assertSquare(48.6f, 42.6f, 173.4f, 167.4f, rect);
            assertEquals(67, radius());
        }
        assertEquals("set once, then left alone", List.of(67), set);
        // A forum's avatar: Telegram sets 16 dp itself before the next layout, and that becomes the base.
        radii.put(avatar, new int[] {48, 48, 48, 48});
        ChatListAvatar.resize(square(), cell);
        assertEquals(38, radius());
    }

    @Test public void turningItOffPutsTelegramsCornersBackOnce() {
        Settings.CHAT_LIST_AVATAR.save(true);
        ChatListAvatar.resize(square(), cell);
        assertEquals(67, radius());
        Settings.CHAT_LIST_AVATAR.save(false);
        RectF rect = square();
        ChatListAvatar.resize(rect, cell);
        assertSquare(33, 27, 189, 183, rect);
        assertEquals(ROUND, radius());
        ChatListAvatar.resize(square(), cell);
        assertEquals("nothing left to put back", List.of(67, ROUND), set);
    }

    @Test public void cornersThatDifferAreLeftAsTheyAre() {
        Settings.CHAT_LIST_AVATAR.save(true);
        radii.put(avatar, new int[] {84, 84, 0, 0});
        RectF rect = square();
        ChatListAvatar.resize(rect, cell);
        assertSquare(48.6f, 42.6f, 173.4f, 167.4f, rect);
        assertArrayEquals(new int[] {84, 84, 0, 0}, radii.get(avatar));
        // A row without an avatar still gets the smaller square.
        rect = square();
        ChatListAvatar.resize(rect, new Object());
        assertSquare(48.6f, 42.6f, 173.4f, 167.4f, rect);
        ChatListAvatar.resize(null, cell);
    }

    @Test public void radiusPlanKeepsTelegramsBase() {
        assertArrayEquals(new int[] {84, 67}, ChatListAvatar.radiusPlan(84, null, 80));
        assertArrayEquals("still ours", new int[] {84, 67}, ChatListAvatar.radiusPlan(67, new int[] {84, 67}, 80));
        assertArrayEquals("Telegram's new one", new int[] {48, 38}, ChatListAvatar.radiusPlan(48, new int[] {84, 67}, 80));
        assertArrayEquals("back to Telegram's", new int[] {84, 84}, ChatListAvatar.radiusPlan(67, new int[] {84, 67}, 100));
        assertArrayEquals("a square avatar", new int[] {0, 0}, ChatListAvatar.radiusPlan(0, null, 120));
    }

    @Test public void aSavedSizeThatIsntOneOfTheChoicesReadsAsTheDefault() {
        for (int choice : ChatListAvatar.CHOICES) assertEquals(choice, ChatListAvatar.percent(choice));
        for (int other : new int[] {0, 100, -80, 71, 119, Integer.MAX_VALUE}) {
            assertEquals(String.valueOf(other), ChatListAvatar.DEFAULT, ChatListAvatar.percent(other));
        }
        Settings.CHAT_LIST_AVATAR.save(true);
        Settings.CHAT_LIST_AVATAR_SIZE.save(100);
        RectF rect = square();
        ChatListAvatar.resize(rect, cell);
        assertSquare(48.6f, 42.6f, 173.4f, 167.4f, rect);
        Settings.CHAT_LIST_AVATAR_SIZE.save(1000);
        assertEquals("kept within its range when saved", 120, (int) Settings.CHAT_LIST_AVATAR_SIZE.get());
    }

    @Test public void withoutTheHookPausedOrUnreadableTheAvatarKeepsTelegramsSize() {
        Settings.CHAT_LIST_AVATAR.save(true);
        PatchFamilyForTests.installed();
        assertFalse(ChatListAvatar.on());
        PatchFamilyForTests.installed(PatchFamily.Capability.CHAT_LIST_AVATAR);
        assertTrue(ChatListAvatar.on());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ChatListAvatar.on());
            RectF rect = square();
            ChatListAvatar.resize(rect, cell);
            assertSquare(33, 27, 189, 183, rect);
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ChatListAvatar.on()));
        SettingReadsForTests.breakReads(Settings.CHAT_LIST_AVATAR);
        assertFalse(ChatListAvatar.on());
        assertEquals(ROUND, radius());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_FOLDER_COUNTERS).isEmpty());
    }

    @Test public void aFailingStubKeepsTelegramsSquare() {
        Settings.CHAT_LIST_AVATAR.save(true);
        ChatListAvatar.telegram = new ChatListAvatar.Telegram() {
            @Override public Object avatarOf(Object row) { throw new IllegalStateException("changed"); }
            @Override public int[] radii(Object image) { return null; }
            @Override public void setRadius(Object image, int radius) {}
        };
        RectF rect = square();
        ChatListAvatar.resize(rect, cell);
        assertSquare(33, 27, 189, 183, rect);
        assertTrue(String.join("\n", HookStatus.report()), String.join("\n", HookStatus.report()).contains("chat list avatar"));
    }

    @Test public void aChangeResizesTheRowsAlreadyOnScreen() {
        // #89: Telegram skips the layout of a row whose chat hasn't changed, so the rows on screen
        // kept the old size until a restart. Each square here is the row's own, as the hook gets it.
        View row = new View(RuntimeEnvironment.getApplication());
        RectF cellSquare = square();
        RectF rowSquare = square();
        ChatListAvatar.resize(cellSquare, cell);
        ChatListAvatar.resize(rowSquare, row);
        assertSquare(33, 27, 189, 183, cellSquare);

        Settings.CHAT_LIST_AVATAR.save(true);
        ChatListAvatar.resizeAll();
        assertSquare(48.6f, 42.6f, 173.4f, 167.4f, cellSquare);
        assertSquare(48.6f, 42.6f, 173.4f, 167.4f, rowSquare);
        assertEquals(67, radius());
        assertTrue("the row is drawn again", Shadows.shadowOf(row).wasInvalidated());

        Settings.CHAT_LIST_AVATAR_SIZE.save(120);
        ChatListAvatar.resizeAll();
        assertSquare("from Telegram's square, not the 80% one", 17.4f, 11.4f, 204.6f, 198.6f, cellSquare);
        assertEquals(101, radius());

        // A layout in between sets Telegram's square again, and the next change starts from that.
        cellSquare.set(square());
        ChatListAvatar.resize(cellSquare, cell);
        ChatListAvatar.resizeAll();
        assertSquare("not grown twice", 17.4f, 11.4f, 204.6f, 198.6f, cellSquare);
        // A three-line row's square is 56 dp somewhere else, and that is what it goes back to.
        cellSquare.set(30, 30, 198, 198);
        ChatListAvatar.resize(cellSquare, cell);
        Settings.CHAT_LIST_AVATAR.save(false);
        ChatListAvatar.resizeAll();
        assertSquare(30, 30, 198, 198, cellSquare);
        assertSquare(33, 27, 189, 183, rowSquare);
        assertEquals("Telegram's corners are back", ROUND, radius());
    }

    @Test public void aRowWhoseAvatarFailsKeepsTelegramsSquareAndTheOthersStillChange() {
        Object broken = new Object();
        ChatListAvatar.Telegram fake = ChatListAvatar.telegram;
        ChatListAvatar.telegram = new ChatListAvatar.Telegram() {
            @Override public Object avatarOf(Object row) {
                if (row == broken) throw new IllegalStateException("changed");
                return fake.avatarOf(row);
            }
            @Override public int[] radii(Object image) { return fake.radii(image); }
            @Override public void setRadius(Object image, int radius) { fake.setRadius(image, radius); }
        };
        RectF brokenSquare = square();
        RectF cellSquare = square();
        ChatListAvatar.resize(brokenSquare, broken);
        ChatListAvatar.resize(cellSquare, cell);
        Settings.CHAT_LIST_AVATAR.save(true);
        ChatListAvatar.resizeAll();
        assertSquare(33, 27, 189, 183, brokenSquare);
        assertSquare(48.6f, 42.6f, 173.4f, 167.4f, cellSquare);
        assertTrue(String.join("\n", HookStatus.report()).contains("chat list avatar"));
    }
}
