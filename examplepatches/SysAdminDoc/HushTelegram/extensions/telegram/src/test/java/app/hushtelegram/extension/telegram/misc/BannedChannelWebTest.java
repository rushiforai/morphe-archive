/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Dialog;
import android.content.Context;
import android.net.Uri;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.telegram.tgnet.TLRPC;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Open on the web in the alert for a channel that banned you (#71), with Telegram's side stood in for. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BannedChannelWebTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Telegram's alert button listener: the alert and which button. */
    public interface Listener {
        void onClick(Dialog dialog, int which);
    }

    /** What Telegram keeps about a name it looked up: the chat's ID, then when. */
    static final class Looked {
        private final long peer;
        private final long time = 1_700_000_000_000L;
        private static final long STATIC = -42;

        Looked(long peer) { this.peer = peer; }
    }

    private static final BannedChannelWeb.Telegram TELEGRAM = BannedChannelWeb.telegram;
    private final Object builder = new Object();
    private final Object screen = new Object();
    private final List<Object[]> buttons = new ArrayList<>();
    private final List<Uri> opened = new ArrayList<>();
    private final List<Context> openedFrom = new ArrayList<>();
    private final List<Integer> lookedUpIn = new ArrayList<>();
    private final Map<Object, Object> lookups = new LinkedHashMap<>();
    private TLRPC.Chat chat;
    private boolean opens = true;
    private boolean lookupsFail;

    @Before public void setUp() {
        reset();
        BannedChannelWeb.telegram = new BannedChannelWeb.Telegram() {
            @Override public Object chatOf(Object on) { return on == screen ? chat : null; }
            @Override public int account(Object on) { return 3; }

            @Override public Map<?, ?> lookups(int account) throws ReflectiveOperationException {
                lookedUpIn.add(account);
                if (lookupsFail) throw new NoSuchFieldException("resolvedCache");
                return lookups;
            }

            @Override public void addButton(Object on, String text, Object listener) { buttons.add(new Object[]{on, text, listener}); }
            @Override public Class<?> listenerType() { return Listener.class; }

            @Override public boolean open(Context context, Uri page) {
                openedFrom.add(context);
                opened.add(page);
                return opens;
            }
        };
    }

    @After public void tearDown() {
        BannedChannelWeb.telegram = TELEGRAM;
        reset();
    }

    private static void reset() {
        SettingReadsForTests.mend(Settings.OPEN_RESTRICTED_CHATS);
        Settings.OPEN_RESTRICTED_CHATS.resetToDefault();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static TLRPC.Chat banned(long id) {
        TLRPC.Chat chat = new TLRPC.TL_channelForbidden();
        chat.id = id;
        chat.title = "Some channel";
        chat.broadcast = true;
        return chat;
    }

    private static TLRPC.TL_username name(String username, boolean active) {
        TLRPC.TL_username name = new TLRPC.TL_username();
        name.username = username;
        name.active = active;
        return name;
    }

    /** The one button offered, clicked as Telegram clicks a negative button, and the page it opened. */
    private Uri clickOnly() {
        assertEquals(1, buttons.size());
        assertSame("on the alert being built", builder, buttons.get(0)[0]);
        assertEquals("Open on the web", buttons.get(0)[1]);
        Dialog alert = new Dialog(RuntimeEnvironment.getApplication());
        ((Listener) buttons.get(0)[2]).onClick(alert, -2);
        assertEquals(1, opened.size());
        assertSame("from the alert's own context", alert.getContext(), openedFrom.get(0));
        return opened.get(0);
    }

    private String report() {
        return HookStatus.report().toString();
    }

    @Test public void offLeavesTelegramsAlertAlone() {
        chat = banned(100);
        chat.username = "somechannel";
        assertFalse(Settings.OPEN_RESTRICTED_CHATS.get());
        BannedChannelWeb.offer(builder, screen);
        assertTrue(buttons.isEmpty());
        assertTrue("nothing looked up", lookedUpIn.isEmpty());
    }

    @Test public void aChannelsOwnNameOpensItsPublicPage() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        chat = banned(100);
        chat.username = "somechannel";
        BannedChannelWeb.offer(builder, screen);
        assertEquals(Uri.parse("https://t.me/s/somechannel"), clickOnly());
        assertTrue("its own name is enough", lookedUpIn.isEmpty());
        assertTrue(report(), report().contains("banned channel offered on the web 1"));
        assertTrue(report(), report().contains("banned channel opened on the web 1"));
    }

    @Test public void anActiveNameOfSeveralIsUsed() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        chat = banned(100);
        chat.usernames.add(name("old_name", false));
        chat.usernames.add(name("new_name", true));
        BannedChannelWeb.offer(builder, screen);
        assertEquals(Uri.parse("https://t.me/s/new_name"), clickOnly());
    }

    @Test public void aChannelWithNoNameIsFoundByTheLinkThatLedToIt() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        chat = banned(1234567890L);
        lookups.put("another_one", new Looked(-55L));
        lookups.put("banned_chan", new Looked(-1234567890L));
        BannedChannelWeb.offer(builder, screen);
        assertEquals("the screen's own account", Collections.singletonList(3), lookedUpIn);
        assertEquals(Uri.parse("https://t.me/s/banned_chan"), clickOnly());
    }

    @Test public void noNameMeansNoButton() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        chat = banned(1234567890L);
        lookups.put("another_one", new Looked(-55L));
        lookups.put("positive_id", new Looked(1234567890L));
        lookups.put(-1234567890L, new Looked(-1234567890L));
        BannedChannelWeb.offer(builder, screen);
        assertTrue("an ID alone gives no page to open", buttons.isEmpty());
        assertFalse(report(), report().contains("offered on the web"));

        chat = null;
        BannedChannelWeb.offer(builder, screen);
        assertTrue("an alert with no chat", buttons.isEmpty());
        BannedChannelWeb.offer(null, screen);
        assertTrue(buttons.isEmpty());
    }

    @Test public void onlyANameALinkCanCarryIsOpened() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        for (String unsafe : new String[]{"some/../path", "x?y=1", "ab", "has space", "a#b", ""}) {
            chat = banned(77);
            chat.username = unsafe;
            lookups.clear();
            lookups.put(unsafe, new Looked(-77));
            BannedChannelWeb.offer(builder, screen);
            assertTrue(unsafe, buttons.isEmpty());
        }
        chat = banned(77);
        chat.username = "not ok!";
        lookups.clear();
        lookups.put("fine_name", new Looked(-77));
        BannedChannelWeb.offer(builder, screen);
        assertEquals("a bad own name still leaves the looked-up one", Uri.parse("https://t.me/s/fine_name"), clickOnly());
    }

    @Test public void unreadableLookupsMeanNoButtonAndNoCrash() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        chat = banned(77);
        lookupsFail = true;
        BannedChannelWeb.offer(builder, screen);
        assertTrue(buttons.isEmpty());
        assertTrue(report(), report().contains("looked-up names"));
    }

    @Test public void noBrowserSaysSo() {
        Settings.OPEN_RESTRICTED_CHATS.save(true);
        opens = false;
        chat = banned(100);
        chat.username = "somechannel";
        BannedChannelWeb.offer(builder, screen);
        assertEquals(Uri.parse("https://t.me/s/somechannel"), clickOnly());
        ShadowLooper.idleMainLooper();
        assertEquals("No browser could open https://t.me/s/somechannel.", ShadowToast.getTextOfLatestToast());
        assertFalse(report(), report().contains("opened on the web"));
    }

    @Test public void theListenerIsAnOrdinaryObject() {
        Object listener = BannedChannelWeb.listener(Listener.class, "somechannel");
        assertTrue(listener.equals(listener));
        assertFalse(listener.equals(new Object()));
        assertEquals(System.identityHashCode(listener), listener.hashCode());
        assertTrue(opened.isEmpty());
    }
}
