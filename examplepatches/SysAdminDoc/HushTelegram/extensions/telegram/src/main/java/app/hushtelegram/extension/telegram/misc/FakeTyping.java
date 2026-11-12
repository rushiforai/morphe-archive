/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Fake typing (#71): chats picked with Fake typing in the more menu of a long press show you typing
 * there, from the account that picked them, until they're picked again or ten minutes pass. The
 * status goes out every few seconds, the way Telegram repeats its own, and gets past Ghost mode's
 * typing part since it was asked for. Secret chats and archive folders are left out.
 */
public final class FakeTyping {
    private FakeTyping() {}

    /** The long press menu's Fake typing item, after Ghost mode exception's id. */
    static final int MENU_ID = 0x48544803;

    /** How often the status goes out; the other side shows each one for about six seconds. */
    static final long EVERY_MS = 4_500;

    /** How long a chat keeps typing before it stops by itself. */
    static final long FOR_MS = 10 * 60_000L;

    private static final String SET_TYPING = "org.telegram.tgnet.TLRPC$TL_messages_setTyping";
    private static final String TYPING_ACTION = "org.telegram.tgnet.TLRPC$TL_sendMessageTypingAction";

    /** Telegram's marks on a secret chat's and a folder's dialog ID, which can't take a typing status. */
    private static final long SECRET_CHAT = 0x4000000000000000L;
    private static final long FOLDER = 0x2000000000000000L;

    /** When each typing chat stops, by account and then chat. Main thread only. */
    private static final Map<Integer, Map<Long, Long>> TYPING = new HashMap<>();

    /** Whether a round of sends is waiting to run. Main thread only. */
    private static boolean ticking;

    /** Each chat list's Fake typing item, so it can follow the switch. Main thread only. */
    private static final Map<Object, WeakReference<View>> MENU_ITEMS = new WeakHashMap<>();

    /** Telegram's side of a typing status; a test swaps it. */
    interface Telegram {
        /** A typing status for [chat] the way MessagesController.sendTyping builds one, null when it has no peer. */
        @Nullable
        Object request(int account, long chat) throws ReflectiveOperationException;

        /** Milliseconds on a clock that only moves forward. */
        long now();

        /** Runs [task] on the main thread after [delay] milliseconds. */
        void later(Runnable task, long delay);
    }

    static volatile Telegram telegram = new Telegram() {
        private final Handler main = new Handler(Looper.getMainLooper());

        @Override public Object request(int account, long chat) throws ReflectiveOperationException {
            Class<?> controller = Class.forName("org.telegram.messenger.MessagesController");
            Object instance = HostNames.method(controller, "getInstance", int.class).invoke(null, account);
            Object peer = instance == null ? null : HostNames.method(controller, "getInputPeer", long.class).invoke(instance, chat);
            if (peer == null) return null;
            Object request = Class.forName(SET_TYPING).getConstructor().newInstance();
            HostNames.field(request.getClass(), "peer").set(request, peer);
            HostNames.field(request.getClass(), "action").set(request, Class.forName(TYPING_ACTION).getConstructor().newInstance());
            return request;
        }

        @Override public long now() {
            return SystemClock.elapsedRealtime();
        }

        @Override public void later(Runnable task, long delay) {
            main.postDelayed(task, delay);
        }
    };

    /** Whether [chat] can show a typing status: a person, group or channel, not a secret chat or a folder. */
    static boolean typable(long chat) {
        return chat != 0 && (chat < 0 || (chat & (SECRET_CHAT | FOLDER)) == 0);
    }

    /** Whether [chat] is typing on [account] now. Main thread only. */
    static boolean typing(int account, long chat) {
        Map<Long, Long> chats = TYPING.get(account);
        Long until = chats == null ? null : chats.get(chat);
        return until != null && until > telegram.now();
    }

    /**
     * Starts [chats] typing on [account], or stops them when they all were: true when it started.
     * Main thread only.
     */
    static boolean toggle(int account, Set<Long> chats) {
        Map<Long, Long> typing = TYPING.get(account);
        boolean stopping = true;
        for (long chat : chats) stopping &= typing(account, chat);
        if (stopping) {
            for (long chat : chats) typing.remove(chat);
            if (typing.isEmpty()) TYPING.remove(account);
            return false;
        }
        if (typing == null) TYPING.put(account, typing = new HashMap<>());
        long until = telegram.now() + FOR_MS;
        for (long chat : chats) {
            typing.put(chat, until);
            send(account, chat);
        }
        comeBack();
        return true;
    }

    /** Waits for the next round while any chat is typing, unless one is waiting already. */
    private static void comeBack() {
        if (TYPING.isEmpty() || ticking) return;
        ticking = true;
        telegram.later(FakeTyping::tick, EVERY_MS);
    }

    /** Sends a typing status to every chat still typing, drops the ones whose time is up, and comes back while any are left. */
    static void tick() {
        ticking = false;
        long now = telegram.now();
        List<Object[]> sends = new ArrayList<>();
        for (Iterator<Map.Entry<Integer, Map<Long, Long>>> accounts = TYPING.entrySet().iterator(); accounts.hasNext(); ) {
            Map.Entry<Integer, Map<Long, Long>> account = accounts.next();
            for (Iterator<Map.Entry<Long, Long>> chats = account.getValue().entrySet().iterator(); chats.hasNext(); ) {
                Map.Entry<Long, Long> chat = chats.next();
                if (chat.getValue() <= now) chats.remove();
                else sends.add(new Object[] {account.getKey(), chat.getKey()});
            }
            if (account.getValue().isEmpty()) accounts.remove();
        }
        for (Object[] send : sends) send((Integer) send[0], (Long) send[1]);
        comeBack();
    }

    private static void send(int account, long chat) {
        try {
            Object request = telegram.request(account, chat);
            if (request != null && GhostMode.sendOwn(account, request)) {
                HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "fake typing statuses sent");
            }
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "fake typing", unreadable);
        }
    }

    /** Stops every chat typing, for a test. */
    static void forget() {
        TYPING.clear();
        ticking = false;
    }

    /** Called by {@link HiddenChats#menuItem} once Ghost mode exception is in: adds Fake typing under it. */
    static void menuItem(Object list, Object more) {
        try {
            Context context = Utils.getContext();
            int icon = context == null ? 0 : context.getResources().getIdentifier("msg_edit", "drawable", context.getPackageName());
            Object item = HiddenChats.telegram.addMenuItem(more, MENU_ID, icon, L10n.t("Fake typing"));
            if (item instanceof View) {
                MENU_ITEMS.put(list, new WeakReference<>((View) item));
                menuShown(list);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "fake typing item", failure);
        }
    }

    /** Called by {@link HiddenChats#menuShown}: the item shows while Fake typing is on. */
    static void menuShown(Object list) {
        try {
            WeakReference<View> held = MENU_ITEMS.get(list);
            View item = held == null ? null : held.get();
            if (item == null) return;
            item.setVisibility(Utils.settingsReady() && Settings.FAKE_TYPING.get() ? View.VISIBLE : View.GONE);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "fake typing item", failure);
        }
    }

    /**
     * Called by {@link HiddenChats#menuChoice} for a tap on the item: the selected chats start
     * typing on the account on screen, or stop when they all were, and the selection closes.
     */
    static int menuChoice(Object listener) {
        try {
            Set<Long> picked = new LinkedHashSet<>();
            List<?> selected = HiddenChats.telegram.selectedChats(listener);
            for (int i = 0; selected != null && i < selected.size(); i++) {
                Object chat = selected.get(i);
                if (chat instanceof Long && typable((Long) chat)) picked.add((Long) chat);
            }
            if (picked.isEmpty()) {
                Utils.showToastShort(L10n.t("Secret chats can't show typing."));
                return HiddenChats.CLOSE_SELECTION;
            }
            boolean started = toggle(HiddenChats.telegram.selectedAccount(), picked);
            Utils.showToastShort(started ? L10n.t("Typing in these chats for 10 minutes.") : L10n.t("Stopped typing in these chats."));
            return HiddenChats.CLOSE_SELECTION;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "fake typing", failure);
            return MENU_ID;
        }
    }
}
