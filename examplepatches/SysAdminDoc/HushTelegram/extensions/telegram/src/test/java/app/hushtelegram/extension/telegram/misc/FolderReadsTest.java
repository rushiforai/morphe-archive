/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.telegram.tgnet.TLRPC;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Send read receipts in a folder tab's long-press menu (#65), with the menu and Telegram's send stood in for. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = FolderReadsTest.Host.class)
public class FolderReadsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final GhostMode.Requests REQUESTS = GhostMode.requests;
    private final List<Object> sent = new ArrayList<>();
    private boolean sends = true;

    @Before public void setUp() {
        reset();
        GhostMode.requests = new GhostMode.Requests() {
            @Override public int account() { return 0; }
            @Override public List<Integer> signedIn() { return Collections.singletonList(0); }
            @Override public boolean send(int account, Object request, Object callback) {
                if (!sends) return false;
                sent.add(request);
                return true;
            }
        };
    }

    @After public void tearDown() {
        GhostMode.requests = REQUESTS;
        reset();
    }

    private static void reset() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.GHOST_READS_BUTTON);
        Settings.GHOST_MODE.resetToDefault();
        Settings.GHOST_READS.resetToDefault();
        Settings.GHOST_READS_BUTTON.resetToDefault();
        GhostMode.forgetHeld();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static void on() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READS.save(true);
        Settings.GHOST_READS_BUTTON.save(true);
    }

    /** A read Telegram sends for [user]'s chat, which Ghost mode keeps back while it's on. */
    private static TLRPC.TL_messages_readHistory heldRead(long user) {
        TLRPC.TL_messages_readHistory read = new TLRPC.TL_messages_readHistory();
        TLRPC.InputPeer peer = new TLRPC.TL_inputPeerUser();
        peer.user_id = user;
        read.peer = peer;
        read.max_id = 1;
        assertTrue("Ghost mode keeps the read back", GhostMode.drop(read, null));
        return read;
    }

    private static String toast() {
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    @Test public void offByDefaultAddsNothing() {
        Menu menu = new Menu();
        FolderReads.tabMenu(menu);
        assertTrue(menu.items.isEmpty());
    }

    @Test public void theMenuGetsTheItemWhileTheButtonIsOn() {
        on();
        Menu menu = new Menu();
        FolderReads.tabMenu(menu);
        assertEquals(1, menu.items.size());
        assertEquals("Send read receipts", menu.items.get(0).text);
        FolderReads.tabMenu(null);
        assertTrue(String.join("\n", HookStatus.report()).contains("read receipts item added to a folder tab menu"));
        for (Runnable off : Arrays.<Runnable>asList(() -> Settings.GHOST_MODE.save(false),
                () -> Settings.GHOST_READS.save(false), () -> Settings.GHOST_READS_BUTTON.save(false))) {
            on();
            off.run();
            Menu later = new Menu();
            FolderReads.tabMenu(later);
            assertTrue("it shows with the chat list's button", later.items.isEmpty());
        }
    }

    @Test public void tappingTheItemSendsEveryHeldRead() {
        on();
        TLRPC.TL_messages_readHistory one = heldRead(5);
        TLRPC.TL_messages_readHistory two = heldRead(6);
        Menu menu = new Menu();
        FolderReads.tabMenu(menu);
        menu.items.get(0).tap.run();
        assertEquals(Arrays.asList((Object) one, two), sent);
        assertEquals("Read receipts sent", toast());
        menu.items.get(0).tap.run();
        assertEquals("No read receipts waiting", toast());
    }

    @Test public void aReadThatCouldntGoSaysSoAndWaits() {
        on();
        TLRPC.TL_messages_readHistory held = heldRead(5);
        Menu menu = new Menu();
        FolderReads.tabMenu(menu);
        sends = false;
        menu.items.get(0).tap.run();
        assertEquals("Couldn't send read receipts", toast());
        sends = true;
        menu.items.get(0).tap.run();
        assertEquals(Collections.singletonList((Object) held), sent);
    }

    @Test public void aMenuThatWontTakeTheItemIsCountedAndLeftAlone() {
        on();
        Menu menu = new Menu();
        menu.fails = true;
        FolderReads.tabMenu(menu);
        assertTrue(menu.items.isEmpty());
        assertFalse(HookStatus.missing(FamilyNames.DISABLE_ANALYTICS).isEmpty());
    }

    @Test public void pausedOrUnreadableAddsNothing() {
        on();
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            Menu menu = new Menu();
            FolderReads.tabMenu(menu);
            assertTrue(reason.name(), menu.items.isEmpty());
            PauseForTests.resume();
        }
        SettingReadsForTests.breakReads(Settings.GHOST_READS_BUTTON);
        Menu menu = new Menu();
        FolderReads.tabMenu(menu);
        assertTrue(menu.items.isEmpty());
    }

    static final class Menu {
        boolean fails;
        final List<Item> items = new ArrayList<>();
    }

    static final class Item {
        final String text;
        final Runnable tap;
        Item(String text, Runnable tap) { this.text = text; this.tap = tap; }
    }

    @Implements(value = FolderReads.class, isInAndroidSdk = false)
    public static class Host {
        @Implementation protected static void addItem(Object options, int icon, String text, Runnable tap) {
            Menu menu = (Menu) options;
            if (menu.fails) throw new IllegalStateException("menu dismissed");
            menu.items.add(new Item(text, tap));
        }
    }
}
