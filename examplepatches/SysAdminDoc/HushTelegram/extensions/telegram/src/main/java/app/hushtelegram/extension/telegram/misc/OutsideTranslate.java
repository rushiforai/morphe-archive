/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.function.LongSupplier;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * A translator that sits beside Telegram's own, which is Premium for a whole chat and whose
 * Premium checks stay exactly as they are. Nothing here asks Telegram to translate: the text
 * goes to Google's web translate, or to an AI service with the person's own key once one is set
 * ({@link AiTranslate}), and the answer is shown by giving the message the same translated-text
 * fields and layout Telegram's own translation fills in.
 *
 * <p>A chat is translated from its header menu, and one message from its long-press menu. Text
 * leaves the phone for the service only for those, one message at a time, and only while the
 * switch is on. Telegram's message class asks here whenever it works out what to show: a message
 * with a translation in the cache shows it, one without gets a background request and shows its
 * original until the answer lands. A message that's yours, a service message, code, a message
 * Telegram's own translation already changed or text already in the app's language is left
 * alone. Switch off, paused or any failure gives Telegram's own path back.
 *
 * <p>Which chats are on is kept on the phone and stays out of the settings file, and so does the AI
 * service, its key included. Translations are
 * kept in memory only, never in Telegram's database.
 *
 * <p>Every choice belongs to the Telegram account it was made in, by that account's user ID rather
 * than its slot in the app, and so does each translation and request. A chat turned on in one
 * account sends nothing from another account's chat with the same ID, and an account signed in
 * later in the same slot starts with nothing on. A message or chat whose account can't be read
 * is left alone.
 *
 * <p>A request waits in a queue, so whether its text may leave the phone is asked again on the
 * worker just before it's sent: the switch is on and HushTelegram isn't paused, the service is the
 * one it was queued under, and a message waiting on it is still in a chat or message turned on, in
 * an account still signed in as the one that chose it. A request that fails that is dropped
 * unsent. A change that lands after the check, while the connection is opening, can't stop that
 * one request, and text already sent can't be called back. Its answer stays hidden while the chat
 * is off or HushTelegram is paused, and a new service or a switch-off throws it away.
 */
public final class OutsideTranslate {
    private OutsideTranslate() {}

    /** Option numbers past Telegram's own, and past the message menu family's. */
    static final int MENU_OPTION = 0x48545405;
    static final int HEADER_ITEM = 0x48545406;
    /** Telegram's own Translate in the message menu, which ours goes after. */
    static final int TELEGRAM_TRANSLATE = 29;

    private static final int CACHE_SIZE = 400;
    private static final long RETRY_MS = 60_000L;
    /**
     * Texts asked for at once, sent or waiting for one of the three workers. Past it a message isn't
     * asked for yet: it's held, see {@link #MAX_HELD}, and nothing is noted against it.
     */
    static final int MAX_PENDING = 24;
    /** Messages waiting on one text. The same message drawn again takes its own place, not a new one. */
    static final int MAX_WAITERS = 32;
    /**
     * Messages held back, newest kept. Where a fast scroll stops, the messages on screen are drawn
     * last, so they're the ones drawn again as places free up. Older ones ask when they're next drawn.
     */
    static final int MAX_HELD = 32;
    /** Texts held back after a failure. Past it the oldest is let go before its minute is up. */
    static final int MAX_FAILED = 200;
    private static final String PREFS = "hushtelegram_outside_translate";
    /** The chats that are on, each as "owner:chat". */
    private static final String CHATS = "owner_chats";
    /**
     * The chats that were on before choices belonged to an account. Nothing says which account
     * chose them, so they're cleared rather than guessed, and the person is told once.
     */
    private static final String UNSCOPED_CHATS = "chats";
    private static final String AI_ADDRESS = "ai_address";
    private static final String AI_MODEL = "ai_model";
    private static final String AI_KEY = "ai_key";
    private static final String AI_STYLE = "ai_style";
    /** Plain text and the kinds of message that carry a caption. */
    private static final int[] TYPES = {0, 1, 3, 9, 14};

    /** What the extension needs to know about a message, and to do to it. Telegram's own class stands behind it. */
    interface Message {
        /** The user ID of the account the message is in, or 0 when it can't be read. */
        long owner();

        long dialog();

        int id();

        boolean eligible();

        String original();

        boolean translated();

        /** The language Telegram's translate bar shows for the message's chat, in Telegram's code, or null. */
        String telegramTarget();

        void apply(String text, String language);

        void refresh();
    }

    /**
     * A message waiting on a request, with the account, chat and message it was asked for in. It's
     * held only until the answer lands or fails.
     */
    private static final class Waiter {
        final Message message;
        final long owner;
        final long dialog;
        final int id;

        Waiter(Message message, long owner, long dialog, int id) {
            this.message = message;
            this.owner = owner;
            this.dialog = dialog;
            this.id = id;
        }

        /** Whether the message's account still reads as the one that asked. A signed-out or reused slot doesn't. */
        boolean sameAccount() {
            try {
                return message.owner() == owner;
            } catch (Throwable unreadable) {
                return false;
            }
        }
    }

    /** A message held back, and the request whose text it wants. */
    private static final class Held {
        final Waiter waiter;
        final String key;

        Held(Waiter waiter, String key) {
            this.waiter = waiter;
            this.key = key;
        }
    }

    private static Message of(Object message) {
        return new Message() {
            @Override public long owner() { return OutsideTranslate.owner(message); }
            @Override public long dialog() { return OutsideTranslate.dialog(message); }
            @Override public int id() { return OutsideTranslate.id(message); }
            @Override public boolean eligible() { return OutsideTranslate.eligible(message); }
            @Override public String original() { return OutsideTranslate.original(message); }
            @Override public boolean translated() { return isTranslated(message); }
            @Override public String telegramTarget() { return dialogTarget(message); }
            @Override public void apply(String text, String language) { applyTranslated(message, text, language); }
            @Override public void refresh() { notifyTranslated(message); }
        };
    }

    interface Fetcher {
        /** Sends the text to [service], the one the request was queued under, never whichever is saved by then. */
        GoogleTranslate.Result fetch(AiTranslate.Service service, String target, String text) throws Exception;
    }

    private static final Object LOCK = new Object();
    /** Held across one save of the service, its write included. Taken before LOCK, never inside it. */
    private static final Object SERVICE_SAVE = new Object();
    private static final Map<String, GoogleTranslate.Result> CACHE = new LinkedHashMap<String, GoogleTranslate.Result>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, GoogleTranslate.Result> eldest) {
            return size() > CACHE_SIZE;
        }
    };
    private static final Map<String, List<Waiter>> PENDING = new HashMap<>();
    private static final Map<String, Long> FAILED = new HashMap<>();
    /** Messages held back, by {@link #key}, oldest first. */
    private static final LinkedHashMap<String, Held> HELD = new LinkedHashMap<>();
    private static final Set<String> MESSAGES_ON = new HashSet<>();
    private static final Set<String> MESSAGES_OFF = new HashSet<>();
    /** The chats, as "owner:chat", already told a request failed. */
    private static final Set<String> TOASTED = new HashSet<>();
    private static final Map<Object, String> APPLIED = Collections.synchronizedMap(new WeakHashMap<>());
    // A native item can refer back to its chat. Neither side should keep that screen alive here.
    private static final Map<Object, WeakReference<Object>> HEADERS = Collections.synchronizedMap(new WeakHashMap<>());
    /** The chats that are on, as "owner:chat". */
    private static Set<String> chats;
    private static AiTranslate.Service service;
    /** Goes up when the service changes, so an answer from the old one isn't kept. */
    private static int generation;
    /** When the person was last told some messages weren't asked for, on {@link #clock}. */
    private static long busySaid = Long.MIN_VALUE;
    private static ExecutorService pool;

    static Fetcher fetcher = OutsideTranslate::fetchWith;
    static LongSupplier clock = System::currentTimeMillis;
    static Executor executor = task -> {
        synchronized (LOCK) {
            if (pool == null) pool = Executors.newFixedThreadPool(3, runnable -> {
                Thread thread = new Thread(runnable, "hushtelegram-translate");
                thread.setDaemon(true);
                return thread;
            });
        }
        pool.execute(task);
    };

    // The message class asks.

    /**
     * Asked first whenever a message works out what to show.
     *
     * @param message the message
     * @return true when the message now shows a translation, so Telegram's own check is skipped
     */
    public static boolean show(Object message) {
        try {
            return message != null && showMessage(message, of(message));
        } catch (Throwable failure) {
            APPLIED.remove(message);
            HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "translated message", failure);
            return false;
        }
    }

    /** [show] for any message the extension can read, keyed by Telegram's own object. */
    static boolean showMessage(Object key, Message message) {
        try {
            if (!active()) {
                APPLIED.remove(key);
                return false;
            }
            long owner = message.owner();
            long dialog = message.dialog();
            int id = message.id();
            if (!wanted(owner, dialog, id)) {
                APPLIED.remove(key);
                return false;
            }
            // Telegram's own translation is showing, so it stays.
            if (message.translated() && !APPLIED.containsKey(key)) return false;
            if (!message.eligible()) return false;
            String original = message.original();
            // A Translate into pick wins, then the language picked in Telegram's own translate bar, then Telegram's language.
            String picked = TranslateTarget.chosen() == null ? telegramPick(message) : null;
            String target = picked != null ? picked : target();
            GoogleTranslate.Result result = cached(owner, target, original);
            if (result == null) {
                request(new Waiter(message, owner, dialog, id), target, original);
                APPLIED.remove(key);
                return false;
            }
            if (result.sameLanguageAs(target, picked != null || target.equals(TranslateTarget.chosen()))) {
                APPLIED.remove(key);
                return false;
            }
            String shown = result.text + "\n\n" + L10n.t("(Translated. Open the message menu for the original.)");
            if (shown.equals(APPLIED.get(key)) && message.translated()) return true;
            message.apply(shown, target);
            APPLIED.put(key, shown);
            HookStatus.counted(FamilyNames.OUTSIDE_TRANSLATE, "message translated");
            return true;
        } catch (Throwable failure) {
            APPLIED.remove(key);
            HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "translated message", failure);
            return false;
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean active() {
        HookStatus.invoked(FamilyNames.OUTSIDE_TRANSLATE);
        try {
            if (!Utils.settingsReady()) return false;
            if (Settings.OUTSIDE_TRANSLATE.get()) return true;
            // Switched off, not just paused: a later switch-on starts with nothing chosen.
            if (!Settings.OUTSIDE_TRANSLATE.savedValue()) forgetChats();
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "switch", failure);
            return false;
        }
    }

    /**
     * Whether this message is one the person asked to see translated in [owner]'s account, by chat
     * or by itself. A message whose account can't be read never is.
     */
    static boolean wanted(long owner, long dialog, int id) {
        if (!known(owner)) return false;
        String key = key(owner, dialog, id);
        synchronized (LOCK) {
            if (MESSAGES_OFF.contains(key)) return false;
            return MESSAGES_ON.contains(key) || chatSet().contains(chatKey(owner, dialog));
        }
    }

    /** Telegram's user IDs start at 1; 0 is a signed-out slot or a value the bridge couldn't read. */
    static boolean known(long owner) {
        return owner > 0;
    }

    /** Whether the message is one Telegram itself would translate, and plain enough for this. */
    static boolean eligible(Object message) {
        if (!translatable(message)) return false;
        int type = messageType(message);
        boolean known = false;
        for (int allowed : TYPES) known |= allowed == type;
        if (!known) return false;
        String text = original(message);
        if (text == null || text.trim().isEmpty()) return false;
        return !hasCode(entities(message));
    }

    /** A code block or a run of code stays as written. */
    static boolean hasCode(List<?> entities) {
        if (entities == null) return false;
        for (Object entity : entities) {
            if (entity == null) continue;
            String name = entity.getClass().getName();
            if (name.endsWith("TL_messageEntityPre") || name.endsWith("TL_messageEntityCode")) return true;
        }
        return false;
    }

    // Requests and the cache.

    static String key(long owner, long dialog, int id) {
        return owner + ":" + dialog + ":" + id;
    }

    static String chatKey(long owner, long dialog) {
        return owner + ":" + dialog;
    }

    /** A translation, and the request for it, belong to one account as well as to a language and a text. */
    static String cacheKey(long owner, String target, String text) {
        return owner + "\u0000" + target + "\u0000" + text;
    }

    static GoogleTranslate.Result cached(long owner, String target, String text) {
        synchronized (LOCK) {
            return CACHE.get(cacheKey(owner, target, text));
        }
    }

    /**
     * Asks the service for the text in the background, once however many of the waiter's account's
     * messages want it. The request keeps the service saved now.
     */
    static void request(Waiter waiter, String target, String text) {
        String key = cacheKey(waiter.owner, target, text);
        int asked;
        AiTranslate.Service provider;
        List<Waiter> waiters;
        boolean sayBusy = false;
        synchronized (LOCK) {
            asked = generation;
            Long failed = FAILED.get(key);
            if (failed != null && clock.getAsLong() - failed < RETRY_MS) return;
            waiters = PENDING.get(key);
            if (waiters != null) {
                if (join(waiters, waiter)) {
                    HELD.remove(key(waiter.owner, waiter.dialog, waiter.id));
                } else {
                    hold(waiter, key);
                }
                return;
            }
            if (PENDING.size() >= MAX_PENDING) {
                // Scrolling faster than the service answers: held until a place frees up.
                hold(waiter, key);
                long now = clock.getAsLong();
                if (busySaid == Long.MIN_VALUE || now - busySaid >= RETRY_MS) {
                    busySaid = now;
                    sayBusy = true;
                }
                waiters = null;
                provider = null;
            } else {
                waiters = new ArrayList<>();
                waiters.add(waiter);
                PENDING.put(key, waiters);
                HELD.remove(key(waiter.owner, waiter.dialog, waiter.id));
                provider = service();
            }
        }
        if (waiters == null) {
            HookStatus.counted(FamilyNames.OUTSIDE_TRANSLATE, "translate request held back, too many waiting");
            if (sayBusy) {
                Utils.runOnMainThread(() -> Utils.showToastShort(L10n.t("Lots to translate at once. The rest will follow.")));
            }
            return;
        }
        try {
            executor.execute(() -> {
                if (!sendable(key, asked)) {
                    HookStatus.counted(FamilyNames.OUTSIDE_TRANSLATE, "translate request dropped before sending");
                    return;
                }
                GoogleTranslate.Result result = null;
                Throwable failure = null;
                try {
                    result = fetcher.fetch(provider, target, text);
                } catch (Throwable thrown) {
                    failure = thrown;
                }
                finish(key, asked, result, failure);
            });
        } catch (Throwable refused) {
            // Nothing will run it, so the text isn't left waiting forever: a later look asks again,
            // and the place it held goes to the messages held back, as an answer would.
            List<Waiter> released = Collections.emptyList();
            synchronized (LOCK) {
                if (PENDING.get(key) == waiters) {
                    PENDING.remove(key);
                    released = release(key);
                }
            }
            HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "translate request", refused);
            redraw(released);
        }
    }

    /**
     * Adds [waiter] to a request already out, or puts it in place of the same message drawn
     * earlier, so a message redrawn while it waits doesn't pile up. Past {@link #MAX_WAITERS} it
     * isn't added and the caller holds it, so it's drawn again once the answer is in. The list only
     * grows, since {@link #sendable} reads the ones that joined by position. Run under {@link #LOCK}.
     *
     * @return whether the message is waiting on the request now
     */
    private static boolean join(List<Waiter> waiters, Waiter waiter) {
        for (int i = 0; i < waiters.size(); i++) {
            Waiter other = waiters.get(i);
            if (other.owner == waiter.owner && other.dialog == waiter.dialog && other.id == waiter.id) {
                waiters.set(i, waiter);
                return true;
            }
        }
        if (waiters.size() >= MAX_WAITERS) return false;
        waiters.add(waiter);
        return true;
    }

    /** Holds a message that couldn't wait on [key] yet, as the newest. Past {@link #MAX_HELD} the oldest goes. Run under {@link #LOCK}. */
    private static void hold(Waiter waiter, String key) {
        String message = key(waiter.owner, waiter.dialog, waiter.id);
        HELD.remove(message);
        HELD.put(message, new Held(waiter, key));
        if (HELD.size() > MAX_HELD) {
            Iterator<String> oldest = HELD.keySet().iterator();
            oldest.next();
            oldest.remove();
        }
    }

    /**
     * The held messages to draw again now that [key]'s place is free: every one that wanted the
     * same text, whose answer is in, and the newest of the rest, which takes the place. Run under {@link #LOCK}.
     */
    private static List<Waiter> release(String key) {
        List<Waiter> released = new ArrayList<>();
        boolean placeTaken = false;
        List<Map.Entry<String, Held>> newestFirst = new ArrayList<>(HELD.entrySet());
        Collections.reverse(newestFirst);
        for (Map.Entry<String, Held> entry : newestFirst) {
            boolean sameText = entry.getValue().key.equals(key);
            if (!sameText) {
                if (placeTaken) continue;
                placeTaken = true;
            }
            HELD.remove(entry.getKey());
            released.add(entry.getValue().waiter);
        }
        return released;
    }

    /** Draws held messages again, so each asks for its text now there's room. */
    private static void redraw(List<Waiter> released) {
        if (released.isEmpty()) return;
        Utils.runOnMainThread(() -> {
            try {
                if (!active()) return;
                for (Waiter waiter : released) {
                    if (wanted(waiter.owner, waiter.dialog, waiter.id) && waiter.sameAccount()) waiter.message.refresh();
                }
            } catch (Throwable thrown) {
                HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "held message refresh", thrown);
            }
        });
    }

    /**
     * Asked on the worker just before a request's text is sent. A request nobody may still send
     * is forgotten, so a later look asks again under whatever is chosen then.
     */
    static boolean sendable(String key, int asked) {
        List<Waiter> mine;
        List<Waiter> waiters;
        synchronized (LOCK) {
            if (asked != generation) return false;
            mine = PENDING.get(key);
            if (mine == null) return false;
            waiters = new ArrayList<>(mine);
        }
        boolean on = active();
        // Each account is read again outside the lock, since that's Telegram's own code.
        List<Waiter> signedIn = new ArrayList<>();
        for (Waiter waiter : waiters) {
            if (waiter.sameAccount()) signedIn.add(waiter);
        }
        List<Waiter> released;
        synchronized (LOCK) {
            // Read again here, so a pause while the accounts were read stops this one too.
            boolean stillOn = on && active();
            // Switched off or a new service while the accounts were read.
            if (asked != generation || PENDING.get(key) != mine) return false;
            if (stillOn) {
                for (Waiter waiter : signedIn) {
                    if (wanted(waiter.owner, waiter.dialog, waiter.id)) return true;
                }
                // A message that joined after the copy read its account as it was drawn just now.
                for (Waiter waiter : mine.subList(waiters.size(), mine.size())) {
                    if (wanted(waiter.owner, waiter.dialog, waiter.id)) return true;
                }
            }
            PENDING.remove(key);
            released = stillOn ? release(key) : Collections.emptyList();
        }
        redraw(released);
        return false;
    }

    /**
     * Drops every request not yet sent, and keeps the answer to any already out from being kept or
     * shown. The choices themselves stay. Run under {@link #LOCK}.
     */
    private static void dropQueued() {
        generation++;
        PENDING.clear();
        HELD.clear();
        // What's still waiting for a worker can't be sent now, so it leaves the queue instead of waiting its turn.
        if (pool instanceof ThreadPoolExecutor) ((ThreadPoolExecutor) pool).getQueue().clear();
    }

    private static void finish(String key, int asked, GoogleTranslate.Result result, Throwable failure) {
        List<Waiter> waiters;
        List<Waiter> released;
        synchronized (LOCK) {
            // The service changed while this was out: its answer isn't the one the person chose.
            if (asked != generation) return;
            waiters = PENDING.remove(key);
            released = waiters == null ? Collections.emptyList() : release(key);
            if (result != null) {
                CACHE.put(key, result);
                FAILED.remove(key);
            } else {
                long now = clock.getAsLong();
                // A failure past the retry wait holds nothing back, so an offline hour doesn't pile them up.
                FAILED.values().removeIf(at -> now - at >= RETRY_MS);
                // Offline while scrolling a long chat, the oldest goes early rather than the list growing.
                while (FAILED.size() >= MAX_FAILED) {
                    FAILED.remove(Collections.min(FAILED.entrySet(), Map.Entry.<String, Long>comparingByValue()).getKey());
                }
                FAILED.put(key, now);
            }
        }
        redraw(released);
        if (waiters == null) return;
        final List<Waiter> done = waiters;
        final boolean failed = result == null;
        final boolean keyRefused = failure instanceof AiTranslate.KeyRefused;
        if (failed) {
            // A refused key or a service out of reach is the service's answer, not a broken hook.
            if (failure instanceof java.io.IOException) {
                HookStatus.counted(FamilyNames.OUTSIDE_TRANSLATE, keyRefused ? "translate key refused" : "translate request failed");
            } else {
                HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "translate request", failure);
            }
        }
        Utils.runOnMainThread(() -> {
            try {
                // Switched off or paused while the request was out: nothing to show or say.
                if (!active()) return;
                for (Waiter waiter : done) {
                    // A chat turned off while the request was out hears nothing back, a failure included.
                    if (!wanted(waiter.owner, waiter.dialog, waiter.id)) continue;
                    String chat = chatKey(waiter.owner, waiter.dialog);
                    if (failed) {
                        toastOnce(chat, keyRefused);
                        continue;
                    }
                    synchronized (LOCK) {
                        TOASTED.remove(chat);
                    }
                    waiter.message.refresh();
                }
            } catch (Throwable thrown) {
                HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "translated message refresh", thrown);
            }
        });
    }

    private static void toastOnce(String chat, boolean keyRefused) {
        synchronized (LOCK) {
            if (!TOASTED.add(chat)) return;
        }
        Utils.showToastShort(keyRefused ? L10n.t("Your AI service didn't accept the key")
                : L10n.t("Translation isn't available right now"));
    }

    // The service: Google's web translate, or an AI service with the person's own key.

    /** The saved service. Read once, then kept until it's saved again. */
    public static AiTranslate.Service service() {
        synchronized (LOCK) {
            if (service == null) {
                try {
                    SharedPreferences saved = prefs();
                    service = new AiTranslate.Service(saved.getString(AI_ADDRESS, AiTranslate.DEFAULT_ADDRESS),
                            saved.getString(AI_MODEL, AiTranslate.DEFAULT_MODEL), saved.getString(AI_KEY, ""),
                            saved.getString(AI_STYLE, ""));
                } catch (Throwable unreadable) {
                    return AiTranslate.Service.GOOGLE;
                }
            }
            return service;
        }
    }

    static GoogleTranslate.Result fetchWith(AiTranslate.Service service, String target, String text) throws Exception {
        return service.enabled() ? AiTranslate.fetch(service, target, text) : GoogleTranslate.fetch(target, text);
    }

    /**
     * Saves the service. An empty key goes back to Google's web translate and forgets the key.
     * Translations already fetched are dropped, so what shows next comes from the service chosen.
     *
     * @return whether it was saved
     */
    public static boolean saveService(String address, String model, String key) {
        return saveService(address, model, key, null);
    }

    /**
     * As above, with the person's own instructions on how to translate. Null keeps the ones saved.
     * Going back to Google leaves them saved, for the next time an AI service is set.
     */
    public static boolean saveService(String address, String model, String key, String style) {
        // The write waits on the disk, and LOCK is the one every message takes as it draws. So
        // saves wait on each other here, and LOCK is taken only to read the saved instructions and
        // to show the one that landed.
        synchronized (SERVICE_SAVE) {
            String kept = style == null ? service().style : style.trim();
            AiTranslate.Service next = new AiTranslate.Service(address.trim(), model.trim(), key.trim(), kept);
            try {
                SharedPreferences.Editor edit = prefs().edit();
                if (next.enabled()) {
                    edit.putString(AI_ADDRESS, next.address).putString(AI_MODEL, next.model).putString(AI_KEY, next.key);
                    if (next.style.isEmpty()) edit.remove(AI_STYLE);
                    else edit.putString(AI_STYLE, next.style);
                } else {
                    edit.remove(AI_KEY);
                }
                if (!edit.commit()) return false;
            } catch (Throwable unsaved) {
                HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "translation service", unsaved);
                return false;
            }
            synchronized (LOCK) {
                service = next.enabled() ? next : null;
                // A queued request would otherwise go to the service it wasn't queued for.
                dropQueued();
                CACHE.clear();
                FAILED.clear();
                TOASTED.clear();
            }
        }
        return true;
    }

    // The language the translation is written in.

    static String target() {
        String chosen = TranslateTarget.chosen();
        if (chosen != null) return chosen;
        Locale locale = null;
        try {
            locale = appLocale();
        } catch (Throwable ignored) {
            // Telegram's own language isn't readable, so the phone's is used.
        }
        return tagOf(locale != null ? locale : Locale.getDefault());
    }

    /** Google's code for the language picked in the message's chat in Telegram's translate bar, or null for none. */
    private static String telegramPick(Message message) {
        String raw;
        Locale app = null;
        try {
            raw = message.telegramTarget();
            app = appLocale();
        } catch (Throwable unreadable) {
            return null;
        }
        return telegramPick(raw, app != null ? app : Locale.getDefault());
    }

    /**
     * Google's code for Telegram's [raw] code, or null when it's unknown or only Telegram's fallback: with nothing
     * picked, Telegram answers its own language as a bare code, which [target] already writes, Chinese script included.
     */
    static String telegramPick(String raw, Locale app) {
        if (raw == null) return null;
        String code = raw.trim().toLowerCase(Locale.ROOT).replace('_', '-');
        if (code.isEmpty()) return null;
        if (code.indexOf('-') < 0 && app != null && googleAlias(code).equals(googleAlias(app.getLanguage().toLowerCase(Locale.ROOT)))) {
            return null;
        }
        String alias = googleAlias(code);
        for (String known : TranslateTarget.LANGUAGES.keySet()) {
            if (known.equalsIgnoreCase(alias)) return known;
        }
        return null;
    }

    /** Telegram's and Java's names for the codes Google's list spells another way. */
    private static String googleAlias(String code) {
        switch (code) {
            case "he": return "iw";
            case "in": return "id";
            case "jv": return "jw";
            case "nb": return "no";
            case "fil": return "tl";
            case "zh":
            case "zh-hans": return "zh-cn";
            case "zh-hant": return "zh-tw";
            case "pt-br": return "pt";
            default: return code;
        }
    }

    /** Google's code for a locale: Java still says "in" and "iw", and Chinese needs its script. */
    static String tagOf(Locale locale) {
        if (locale == null || locale.getLanguage().isEmpty()) return "en";
        String language = locale.getLanguage();
        if (language.equals("in")) return "id";
        if (language.equals("iw")) return "he";
        if (language.equals("zh")) {
            String country = locale.getCountry();
            return country.equals("TW") || country.equals("HK") || country.equals("MO") ? "zh-TW" : "zh-CN";
        }
        return language;
    }

    // The chats that are on.

    private static Set<String> chatSet() {
        synchronized (LOCK) {
            if (chats == null) {
                chats = new HashSet<>();
                boolean cleared = false;
                try {
                    SharedPreferences saved = prefs();
                    for (String chat : saved.getStringSet(CHATS, Collections.emptySet())) {
                        if (ownedChat(chat)) chats.add(chat);
                    }
                    Set<String> unscoped = saved.getStringSet(UNSCOPED_CHATS, null);
                    if (unscoped != null) {
                        cleared = !unscoped.isEmpty();
                        saved.edit().remove(UNSCOPED_CHATS).apply();
                    }
                } catch (Throwable unreadable) {
                    chats.clear();
                }
                if (cleared) {
                    HookStatus.counted(FamilyNames.OUTSIDE_TRANSLATE, "chats without an account cleared");
                    // Posted, so the toast isn't drawn while the lock is held.
                    Utils.runOnMainThread(() -> Utils.showToastLong(
                            L10n.t("Turn chat translation on again. It's now set per account.")));
                }
            }
            return chats;
        }
    }

    /** "owner:chat" with a user ID that's known and a chat ID that reads as one. */
    static boolean ownedChat(String chat) {
        int split = chat == null ? -1 : chat.indexOf(':');
        if (split <= 0) return false;
        try {
            long owner = Long.parseLong(chat.substring(0, split));
            Long.parseLong(chat.substring(split + 1));
            return known(owner);
        } catch (NumberFormatException unreadable) {
            return false;
        }
    }

    private static SharedPreferences prefs() {
        Context context = Utils.getContext();
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /**
     * Turns a chat on or off in [owner]'s account and remembers it. Returns whether it's on now. A
     * chat whose account can't be read stays off.
     */
    static boolean toggleChat(long owner, long dialog) {
        if (!known(owner)) return false;
        boolean on;
        synchronized (LOCK) {
            Set<String> set = chatSet();
            String chat = chatKey(owner, dialog);
            on = set.add(chat);
            if (!on) set.remove(chat);
            String prefix = chat + ":";
            // A new choice for the whole chat replaces the ones made message by message.
            MESSAGES_ON.removeIf(key -> key.startsWith(prefix));
            MESSAGES_OFF.removeIf(key -> key.startsWith(prefix));
            TOASTED.remove(chat);
            try {
                prefs().edit().putStringSet(CHATS, new HashSet<>(set)).apply();
            } catch (Throwable unsaved) {
                HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "chat list", unsaved);
            }
        }
        return on;
    }

    /**
     * Forgets every chat and message turned on, saved list included, and drops the requests not yet
     * sent, so nothing is sent again until the person chooses again. Run when the switch goes off,
     * from its row or from a settings file. Pause doesn't run this: its choices come back on
     * Resume, and each queued request checks for Pause itself before it's sent.
     */
    public static void forgetChats() {
        synchronized (LOCK) {
            boolean saved = chats == null || !chats.isEmpty();
            if (!saved && MESSAGES_ON.isEmpty() && MESSAGES_OFF.isEmpty() && TOASTED.isEmpty() && PENDING.isEmpty()
                    && HELD.isEmpty()) return;
            dropQueued();
            chats = new HashSet<>();
            MESSAGES_ON.clear();
            MESSAGES_OFF.clear();
            TOASTED.clear();
            if (!saved) return;
            try {
                prefs().edit().remove(CHATS).remove(UNSCOPED_CHATS).apply();
            } catch (Throwable unsaved) {
                HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "chat list", unsaved);
            }
        }
    }

    static boolean chatOn(long owner, long dialog) {
        if (!known(owner)) return false;
        synchronized (LOCK) {
            return chatSet().contains(chatKey(owner, dialog));
        }
    }

    // The message menu.

    /**
     * Asked as Telegram finishes the menu's lists. Translate here goes right after Telegram's own
     * Translate, or last when it has none.
     *
     * @param chat the chat screen
     * @param primary the message the menu opened on, unused: the chat's selected message is what a choice acts on
     */
    public static void fill(Object chat, Object primary, ArrayList<Object> icons, ArrayList<Object> items, ArrayList<Object> options) {
        if (icons == null || items == null || options == null) return;
        if (!active()) return;
        try {
            Object message = selected(chat);
            if (message == null || !known(owner(message)) || !eligible(message)) return;
            offer(icons, items, options, APPLIED.containsKey(message));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "message menu", failure);
        }
    }

    /** The three lists stay in step, so a menu whose lists already differ is left alone. */
    static void offer(List<Object> icons, List<Object> items, List<Object> options, boolean showing) {
        if (options.isEmpty() || icons.size() != items.size() || items.size() != options.size()) return;
        int at = options.indexOf(TELEGRAM_TRANSLATE);
        at = at >= 0 ? at + 1 : options.size();
        int icon = translateIcon();
        String label = showing ? L10n.t("Show original") : L10n.t("Translate here");
        icons.add(at, icon);
        items.add(at, label);
        options.add(at, MENU_OPTION);
    }

    /** Asked first when an option is chosen. Telegram's own numbers pass by untouched. */
    public static void chosen(Object chat, int option) {
        if (option != MENU_OPTION) return;
        try {
            if (!active()) return;
            Object message = selected(chat);
            if (message == null) return;
            long owner = owner(message);
            if (!known(owner)) {
                HookStatus.counted(FamilyNames.OUTSIDE_TRANSLATE, "message account unknown");
                return;
            }
            boolean translate = !APPLIED.containsKey(message);
            String key = key(owner, dialog(message), id(message));
            synchronized (LOCK) {
                if (translate) {
                    MESSAGES_OFF.remove(key);
                    MESSAGES_ON.add(key);
                    FAILED.clear();
                } else {
                    MESSAGES_ON.remove(key);
                    MESSAGES_OFF.add(key);
                }
            }
            // After the menu has closed, the way Telegram's own choices finish.
            Utils.runOnMainThread(() -> {
                try {
                    notifyTranslated(message);
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "message refresh", failure);
                }
            });
            HookStatus.counted(FamilyNames.OUTSIDE_TRANSLATE, translate ? "message translate chosen" : "message original chosen");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "message menu choice", failure);
        }
    }

    // The chat's header menu.

    /** Asked whenever the chat updates its own Translate item, which exists when the chat has a header menu. */
    public static void headerMenu(Object chat) {
        try {
            if (chat == null || !active() || !hasTranslateItem(chat)) return;
            long owner = chatOwner(chat);
            // An item for a chat whose account can't be read couldn't turn anything on.
            if (!known(owner)) return;
            long dialog = chatDialog(chat);
            synchronized (HEADERS) {
                if (!HEADERS.containsKey(chat)) {
                    Object item = addHeaderItem(chat, HEADER_ITEM, translateIcon(), headerText(owner, dialog));
                    HEADERS.put(chat, new WeakReference<>(item));
                } else {
                    updateHeaderText(chat, owner, dialog);
                }
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "header menu", failure);
        }
    }

    private static String headerText(long owner, long dialog) {
        return L10n.t(chatOn(owner, dialog) ? "Stop translating this chat" : "Translate this chat");
    }

    private static void updateHeaderText(Object chat, long owner, long dialog) {
        try {
            WeakReference<Object> remembered = HEADERS.get(chat);
            Object item = remembered == null ? null : remembered.get();
            if (item != null) setHeaderText(item, headerText(owner, dialog));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "header label", failure);
        }
    }

    /**
     * Asked first when a header item is chosen.
     *
     * @return true when the choice was ours, so Telegram's own handling is skipped
     */
    public static boolean headerClick(Object delegate, int id) {
        if (id != HEADER_ITEM) return false;
        try {
            // An item left in an open menu after the switch went off is still ours, and does nothing.
            if (!active()) return true;
            Object chat = chatOf(delegate);
            if (chat == null) return false;
            long owner = chatOwner(chat);
            if (!known(owner)) {
                HookStatus.counted(FamilyNames.OUTSIDE_TRANSLATE, "chat account unknown");
                return true;
            }
            long dialog = chatDialog(chat);
            boolean on = toggleChat(owner, dialog);
            updateHeaderText(chat, owner, dialog);
            Utils.showToastShort(on ? L10n.t("This chat will be translated") : L10n.t("This chat shows the original messages"));
            notifyDialog(dialog);
            HookStatus.counted(FamilyNames.OUTSIDE_TRANSLATE, on ? "chat translate on" : "chat translate off");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.OUTSIDE_TRANSLATE, "header menu choice", failure);
            return false;
        }
    }

    // Replaced when patching.

    /** The chat's selected message. */
    public static Object selected(Object chat) { return null; }

    /** The message's text as sent. */
    public static String original(Object message) { return null; }

    /** Telegram's own check that a message has translatable content. */
    public static boolean translatable(Object message) { return false; }

    /** The message's Telegram type. */
    public static int messageType(Object message) { return -1; }

    public static long dialog(Object message) { return 0L; }

    public static int id(Object message) { return 0; }

    /** The user ID of the account the message is in, or 0 when that account is signed out. */
    public static long owner(Object message) { return 0L; }

    /** The message's entities. */
    public static ArrayList<?> entities(Object message) { return null; }

    /** Whether the message is showing a translation, ours or Telegram's. */
    public static boolean isTranslated(Object message) { return false; }

    /** Shows the text as the message's translation into the language. */
    public static void applyTranslated(Object message, String text, String language) {}

    /** Tells the chat on screen the message's translation changed, so it draws the message again. */
    public static void notifyTranslated(Object message) {}

    /** Tells the chat on screen to look at every message's translation again. */
    public static void notifyDialog(long dialog) {}

    /** Telegram's icon for Translate. */
    public static int translateIcon() { return 0; }

    /** The app's language. */
    public static Locale appLocale() { return null; }

    /** The language Telegram's translate bar shows for the message's chat. */
    public static String dialogTarget(Object message) { return null; }

    /** Whether the chat built its own Translate item. */
    public static boolean hasTranslateItem(Object chat) { return false; }

    /** Adds an item to the chat's header menu. */
    public static Object addHeaderItem(Object chat, int id, int icon, String text) { return null; }

    /** Updates the native item's label without adding another item. */
    public static void setHeaderText(Object item, String text) {}

    /** The chat screen a header menu delegate belongs to. */
    public static Object chatOf(Object delegate) { return null; }

    /** The chat's ID. */
    public static long chatDialog(Object chat) { return 0L; }

    /** The user ID of the account the chat screen is in, or 0 when that account is signed out. */
    public static long chatOwner(Object chat) { return 0L; }

    /** How many texts are waiting out a failure, for tests. */
    static int failuresForTests() {
        synchronized (LOCK) {
            return FAILED.size();
        }
    }

    /** How many texts are asked for, sent or waiting, for tests. */
    static int pendingForTests() {
        synchronized (LOCK) {
            return PENDING.size();
        }
    }

    /** How many messages are held back, for tests. */
    static int heldForTests() {
        synchronized (LOCK) {
            return HELD.size();
        }
    }

    /** How many messages in [owner]'s account wait on [text], for tests. */
    static int waitersForTests(long owner, String text) {
        String key = cacheKey(owner, target(), text);
        synchronized (LOCK) {
            List<Waiter> waiters = PENDING.get(key);
            return waiters == null ? 0 : waiters.size();
        }
    }

    /** The workers once they've started, for tests. */
    static ThreadPoolExecutor poolForTests() {
        synchronized (LOCK) {
            return (ThreadPoolExecutor) pool;
        }
    }

    /** Clears what's remembered, for tests. */
    static void resetForTests() {
        synchronized (LOCK) {
            CACHE.clear();
            PENDING.clear();
            HELD.clear();
            FAILED.clear();
            MESSAGES_ON.clear();
            MESSAGES_OFF.clear();
            TOASTED.clear();
            chats = null;
            service = null;
            generation++;
            busySaid = Long.MIN_VALUE;
        }
        APPLIED.clear();
        HEADERS.clear();
    }
}
