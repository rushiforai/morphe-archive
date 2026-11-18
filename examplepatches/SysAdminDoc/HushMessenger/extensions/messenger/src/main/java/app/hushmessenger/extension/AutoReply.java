package app.hushmessenger.extension;

import android.app.PendingIntent;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.LongSupplier;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Answers a message that matches one of your replies, through the Reply action on the notification Messenger shows for
 * it, so it goes out the same way as a reply typed into the notification shade, encrypted chats included. A message
 * that never raised a notification (its chat was open, say) gets no answer, and one whose notification is slow to
 * arrive is looked at again on a short beat until it does, so the reply goes out as soon as it can. Each chat gets at
 * most one automatic reply
 * every five minutes, and a message that repeats one of your own replies is never answered, so two phones running
 * auto replies can't keep answering each other.
 */
public final class AutoReply {
    private AutoReply() {}

    static final String KEY = "auto_reply";
    static final String RULES = "auto_reply_rules";
    static final String GROUPS = "auto_reply_groups";
    /**
     * The reply goes out through the chat's notification, which Messenger posts a moment after the hook sees the
     * message. Rather than sit out a fixed wait, the answer looks for that notification almost at once and then keeps
     * looking, so it lands as soon as there's something to reply through (#182).
     */
    static final long FIRST_MS = 150;
    /** How long between looks while the chat's notification still isn't up. */
    static final long RECHECK_MS = 250;
    /** How long a message waits for its notification before it's dropped. */
    static final long GIVE_UP_MS = 4_500;
    static final long COOLDOWN_MS = 5L * 60 * 1000;
    /** A reply's picture follows its text after this long, so the text shows first in the chat. */
    static final long PICTURE_DELAY_MS = 2_000;
    static final int MAX_RULES = 20;
    static final int MAX_WHEN_CHARS = 200;
    static final int MAX_REPLY_CHARS = 1_000;
    /** At most this many messages wait for an answer at once. A burst past it is skipped, not queued. */
    static final int MAX_PENDING = 20;
    /** How much of a message the queue keeps for matching. */
    static final int MAX_TEXT_CHARS = MessageLog.MAX_TEXT_CHARS;
    /** Message ids remembered for coalescing, so the push and the sync copy of one message queue once. */
    private static final int MAX_SEEN = 200;

    /** One reply: [when] holds words or phrases split by commas, and an empty one answers any message. */
    static final class Rule {
        final String when;
        final String reply;
        /** A picture AutoReplyPicture saved, sent after the text, or null. Any other name is dropped. */
        final String picture;
        /** One whole-word pattern per phrase in [when], compiled on first use. */
        private volatile List<Pattern> terms;
        Rule(String when, String reply) {
            this(when, reply, null);
        }

        Rule(String when, String reply, String picture) {
            this.when = when == null ? "" : when.trim();
            this.reply = reply == null ? "" : reply.trim();
            this.picture = AutoReplyPicture.validName(picture) ? picture : null;
        }

        List<Pattern> terms() {
            List<Pattern> compiled = terms;
            if (compiled != null) return compiled;
            compiled = new ArrayList<>();
            for (String term : when.split(",")) {
                String word = term.trim();
                if (word.isEmpty()) continue;
                compiled.add(Pattern.compile("(?<![\\p{L}\\p{N}])" + Pattern.quote(word) + "(?![\\p{L}\\p{N}])",
                    Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE));
            }
            return terms = compiled;
        }
    }

    /** The saved replies text and what it parsed to, so each message doesn't parse and compile them again. */
    private static final class Parsed {
        final String saved;
        final List<Rule> rules;
        Parsed(String saved, List<Rule> rules) {
            this.saved = saved;
            this.rules = rules;
        }
    }

    private static volatile Parsed parsed;

    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(runnable -> {
        Thread thread = new Thread(runnable, "HushAutoReply");
        thread.setDaemon(true);
        return thread;
    });

    /** Runs [task] after [delayMs] off the caller's thread. Tests swap in one they run by hand. */
    interface Scheduler {
        void schedule(Runnable task, long delayMs);
    }

    static volatile Scheduler scheduler = (task, delayMs) -> WORKER.schedule(task, delayMs, TimeUnit.MILLISECONDS);
    /** When each chat last got an automatic reply, for the cooldown. Per process, so a restart starts fresh. */
    static final ConcurrentHashMap<String, Long> lastReply = new ConcurrentHashMap<>();
    /** Time since boot, so a wall clock set back can't hold a chat's cooldown. */
    static volatile LongSupplier clock = SystemClock::elapsedRealtime;
    /**
     * Bumped whenever the switch, Pause, safe mode, the replies or the group choice change. Work queued before that is
     * dropped when it runs, so turning the switch off and on, or editing a reply, can't answer an older message.
     */
    private static final AtomicLong GENERATION = new AtomicLong();
    private static final AtomicInteger PENDING = new AtomicInteger();
    /** Chat and message id of recent captures, oldest first. Guarded by itself. */
    private static final LinkedHashMap<String, Long> SEEN = new LinkedHashMap<>();
    private static volatile SharedPreferences watched;
    private static final SharedPreferences.OnSharedPreferenceChangeListener CHANGES = (prefs, key) -> {
        if (key == null || KEY.equals(key) || RULES.equals(key) || GROUPS.equals(key) || "paused".equals(key) ||
            "safe_mode".equals(key)) GENERATION.incrementAndGet();
    };

    /** The notification hook asks this before it reads a message: on, not paused, and at least one reply written. */
    static boolean wanted() {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && Settings.wouldUse(KEY) && !rules(prefs).isEmpty();
    }

    /**
     * The hook hands each incoming message here and returns at once; the answer runs on its own thread. A message whose
     * id was already seen is the same message again, a message that could never be answered isn't queued, and past
     * MAX_PENDING waiting messages a new one is skipped. It runs inside Messenger's notification code, so nothing it
     * throws gets out.
     */
    static void received(String text, String thread, String id) {
        try {
            if (text == null || thread == null || thread.isEmpty()) return;
            SharedPreferences prefs = Settings.preferences;
            if (prefs != null && watched != prefs) {
                prefs.registerOnSharedPreferenceChangeListener(CHANGES);
                watched = prefs;
            }
            if (prefs == null || !Settings.wouldUse(KEY)) return;
            if (!oneToOne(thread) && !prefs.getBoolean(GROUPS, false)) return;
            long now = clock.getAsLong();
            String kept = MessageLog.clip(text, MAX_TEXT_CHARS);
            // Seen before the reply check, so the second copy of a message nothing answered can't get an answer from a
            // reply saved in between.
            if (seen(thread, id, now) || !answerable(prefs, kept, thread, now)) return;
            if (PENDING.incrementAndGet() > MAX_PENDING) {
                PENDING.decrementAndGet();
                android.util.Log.w("HushMessenger", "auto_reply: too many messages waiting, one was skipped");
                return;
            }
            long generation = GENERATION.get();
            try {
                long deadline = now + GIVE_UP_MS;
                scheduler.schedule(() -> run(kept, thread, id, generation, deadline), FIRST_MS);
            } catch (RuntimeException rejected) {
                PENDING.decrementAndGet();
                Settings.hookFailedPrivately(KEY, "Can't queue the auto reply", rejected);
            }
        } catch (Throwable failure) {
            Settings.hookFailedPrivately(KEY, "Can't read the message for an auto reply", failure);
        }
    }

    /**
     * The cheap half of [attempt], checked before a message takes a place in the queue: not cooling down, and a reply
     * that matches. A burst of messages that fail here can't crowd out one that passes. The queued run checks all of it
     * again.
     */
    private static boolean answerable(SharedPreferences prefs, String text, String thread, long now) {
        Long last = lastReply.get(thread);
        if (last != null && now - last < COOLDOWN_MS && last <= now) return false;
        List<Rule> rules = rules(prefs);
        return !echoesAReply(rules, text) && match(rules, text) != null;
    }

    /**
     * One queued message, looked at again every [RECHECK_MS] until its notification is up or [deadline] passes.
     * Dropped when anything changed since it was queued, and its slot is freed once it's done.
     */
    private static void run(String text, String thread, String id, long generation, long deadline) {
        boolean waiting = false;
        try {
            if (generation != GENERATION.get()) return;
            if (attempt(text, thread, id, generation) == Outcome.NO_NOTIFICATION && clock.getAsLong() < deadline) {
                scheduler.schedule(() -> run(text, thread, id, generation, deadline), RECHECK_MS);
                waiting = true;
            }
        } catch (RuntimeException rejected) {
            Settings.hookFailedPrivately(KEY, "Can't queue the auto reply", rejected);
        } finally {
            if (!waiting) PENDING.decrementAndGet();
        }
    }

    /**
     * Whether this chat's message id was queued within the last minute. A message without an id can't be matched, so it
     * always counts as new.
     */
    private static boolean seen(String thread, String id, long now) {
        if (id == null || id.isEmpty()) return false;
        synchronized (SEEN) {
            SEEN.values().removeIf(at -> now - at > MessageLog.DUPLICATE_WINDOW_MS || at > now);
            String key = thread + ' ' + id;
            if (SEEN.containsKey(key)) return true;
            SEEN.put(key, now);
            while (SEEN.size() > MAX_SEEN) {
                Iterator<String> oldest = SEEN.keySet().iterator();
                oldest.next();
                oldest.remove();
            }
            return false;
        }
    }

    /** Messages waiting for an answer right now. */
    static int pending() {
        return PENDING.get();
    }

    /** Forgets queued ids, cooldowns and waiting counts. Tests start each case from a clean queue with it. */
    static void forgetQueued() {
        synchronized (SEEN) {
            SEEN.clear();
        }
        lastReply.clear();
        PENDING.set(0);
        GENERATION.incrementAndGet();
    }

    enum Outcome { SENT, SKIPPED, NO_NOTIFICATION }

    /** Matches, checks the cooldown and sends. Returns whether a reply went out. Tests call it directly. */
    static boolean answer(String text, String thread, String id) {
        return attempt(text, thread, id, GENERATION.get()) == Outcome.SENT;
    }

    private static Outcome attempt(String text, String thread, String id, long generation) {
        try {
            SharedPreferences prefs = Settings.preferences;
            Context context = Settings.appContext;
            if (prefs == null || context == null || !Settings.wouldUse(KEY)) return Outcome.SKIPPED;
            if (!oneToOne(thread) && !prefs.getBoolean(GROUPS, false)) return Outcome.SKIPPED;
            List<Rule> rules = rules(prefs);
            if (echoesAReply(rules, text)) return Outcome.SKIPPED;
            Rule rule = match(rules, text);
            if (rule == null) return Outcome.SKIPPED;
            long now = clock.getAsLong();
            // A time from the future can't be a cooldown, so it doesn't hold the chat back.
            lastReply.values().removeIf(at -> now - at >= COOLDOWN_MS || at > now);
            if (lastReply.containsKey(thread)) return Outcome.SKIPPED;
            StatusBarNotification shown = ChatNotifications.find(context, thread);
            if (shown == null) return Outcome.NO_NOTIFICATION;
            // A change while the rules were being read (an edited reply, the switch, Pause) drops this message too.
            if (generation != GENERATION.get()) return Outcome.SKIPPED;
            // Taken before the send, so a second message in the same moment can't get its own reply.
            lastReply.put(thread, now);
            // The reply takes the notification down, so the message log gets its names now.
            MessageLog.noteNames(thread, id, text, shown.getNotification());
            boolean sent;
            try {
                sent = ChatNotifications.reply(context, shown.getNotification(), rule.reply);
            } catch (PendingIntent.CanceledException replaced) {
                // Nothing went out: Messenger canceled the token, usually by replacing the notification. Only this
                // attempt's own reservation is released, and the one retry can answer through the new notification.
                lastReply.remove(thread, now);
                android.util.Log.w("HushMessenger", "auto_reply: the chat's Reply action was canceled before it was sent");
                return Outcome.NO_NOTIFICATION;
            }
            if (!sent) {
                lastReply.remove(thread, now);
                android.util.Log.w("HushMessenger", "auto_reply: the chat's notification has no Reply action");
                return Outcome.SKIPPED;
            }
            Settings.enabled(KEY);
            if (rule.picture != null) queuePicture(context, thread, rule.picture, generation);
            return Outcome.SENT;
        } catch (Throwable failure) {
            Settings.hookFailedPrivately(KEY, "Can't send the auto reply", failure);
            return Outcome.SKIPPED;
        }
    }

    /** The text already went, so a picture that can't be queued only costs the picture. */
    private static void queuePicture(Context context, String thread, String picture, long generation) {
        try {
            scheduler.schedule(() -> sendPicture(context, thread, picture, generation), PICTURE_DELAY_MS);
        } catch (RuntimeException rejected) {
            Settings.hookFailedPrivately(KEY, "Can't queue the auto reply picture", rejected);
        }
    }

    /** Sends a reply's picture once, after its text. Dropped when the switch, Pause or the replies changed since. */
    private static void sendPicture(Context context, String thread, String picture, long generation) {
        try {
            java.util.function.BooleanSupplier wanted = () -> generation == GENERATION.get() && Settings.wouldUse(KEY);
            if (!wanted.getAsBoolean()) return;
            String why = AutoReplyPicture.send(context, thread, picture, wanted);
            if (why != null) android.util.Log.w("HushMessenger", "auto_reply: sent the text without the picture, " + why);
        } catch (Throwable failure) {
            Settings.hookFailedPrivately(KEY, "Can't send the auto reply picture", failure);
        }
    }

    /** One-to-one chats only, unless group chats are allowed. */
    static boolean oneToOne(String thread) {
        return ChatNotifications.oneToOne(thread);
    }

    /** The first reply whose words appear in [text] as whole words, ignoring case, or that answers anything. */
    static Rule match(List<Rule> rules, String text) {
        for (Rule rule : rules) {
            if (rule.reply.isEmpty()) continue;
            if (rule.when.isEmpty()) return rule;
            for (Pattern pattern : rule.terms()) if (pattern.matcher(text).find()) return rule;
        }
        return null;
    }

    /** A message that is one of our own replies came from another auto reply, so answering it would start a loop. */
    static boolean echoesAReply(List<Rule> rules, String text) {
        String said = text.trim().toLowerCase(Locale.ROOT);
        for (Rule rule : rules) if (!rule.reply.isEmpty() && rule.reply.toLowerCase(Locale.ROOT).equals(said)) return true;
        return false;
    }

    /** The saved replies, in order. A damaged value reads as none. */
    static List<Rule> rules(SharedPreferences prefs) {
        String saved = prefs.getString(RULES, null);
        if (saved == null || saved.isEmpty()) return Collections.emptyList();
        Parsed last = parsed;
        if (last != null && last.saved.equals(saved)) return last.rules;
        List<Rule> rules = parse(saved);
        if (rules == null) return Collections.emptyList();
        List<Rule> kept = Collections.unmodifiableList(rules);
        parsed = new Parsed(saved, kept);
        return kept;
    }

    /** The replies in [saved], at most [MAX_RULES] with text, or null when it isn't a list of replies. */
    private static List<Rule> parse(String saved) {
        List<Rule> rules = new ArrayList<>();
        try {
            JSONArray array = new JSONArray(saved);
            for (int i = 0; i < array.length() && rules.size() < MAX_RULES; i++) {
                JSONObject item = array.optJSONObject(i);
                if (item == null) continue;
                Rule rule = new Rule(item.optString("when", ""), item.optString("reply", ""), item.optString("picture", null));
                if (!rule.reply.isEmpty()) rules.add(rule);
            }
        } catch (JSONException damaged) {
            return null;
        }
        return rules;
    }

    /**
     * [saved] as this version saves it: the same replies, cut to size like the sheet cuts them, or null when it isn't a
     * list of replies. A backup's replies go through here before they're restored.
     */
    static String clean(String saved) {
        List<Rule> rules = saved == null ? null : parse(saved);
        return rules == null ? null : encode(rules).toString();
    }

    /** Whether [saved] holds at least one reply with text. */
    static boolean hasReplies(String saved) {
        List<Rule> rules = saved == null ? null : parse(saved);
        return rules != null && !rules.isEmpty();
    }

    /** Keeps replies with text, trimmed and cut to size, at most [MAX_RULES]. Returns how many were kept. */
    static int save(SharedPreferences prefs, List<Rule> rules, boolean groups) {
        JSONArray array = encode(rules);
        prefs.edit().putString(RULES, array.toString()).putBoolean(GROUPS, groups).apply();
        return array.length();
    }

    private static JSONArray encode(List<Rule> rules) {
        JSONArray array = new JSONArray();
        try {
            for (Rule rule : rules) {
                if (rule.reply.isEmpty()) continue;
                if (array.length() >= MAX_RULES) break;
                JSONObject entry = new JSONObject().put("when", MessageLog.clip(rule.when, MAX_WHEN_CHARS))
                    .put("reply", MessageLog.clip(rule.reply, MAX_REPLY_CHARS));
                if (rule.picture != null) entry.put("picture", rule.picture);
                array.put(entry);
            }
        } catch (JSONException impossible) {
            throw new IllegalStateException(impossible);
        }
        return array;
    }
}
