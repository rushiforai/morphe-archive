package io.github.jordanwoodson.extension.shared.rumble;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.format.DateFormat;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.net.URLConnection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import io.github.jordanwoodson.extension.shared.ChatFilter;
import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Live chat for Rumble: hiding notices and blocked messages before Rumble builds its messages, keyword
 * highlights, deleted message text and message times. With every setting off, each hook returns Rumble's
 * own value.
 */
@SuppressWarnings("unused")
public final class RumbleChat {
    static final String HIDE_RAIDS = "chat_hide_raid_notices";
    static final String HIDE_GIFTS = "chat_hide_gift_notices";
    static final String SHOW_DELETED = "show_deleted_messages";
    static final String TIMESTAMPS = "chat_timestamps";
    static final String ANONYMOUS = "chat_anonymous";

    /** Rumble green at 30%, as a Compose color: readable over both chat backgrounds. */
    private static final int HIGHLIGHT_ARGB = 0x4D85C742;

    /** The signed-in user's chat ID ("_u" and the ID in base 36), from the chat mapper; null signed out. */
    private static volatile String currentUserId;
    /** The signed-in user's name, lowercase, once a chat's users list had it; "" until then. */
    private static volatile String self = "";

    /** The last lists handed out, so a getter called again on the same DTO returns the same list. */
    private static final int REMEMBERED = 8;
    private static final Filtered[] FILTERED = new Filtered[REMEMBERED];
    private static int nextFiltered;

    private static final Map<String, Field> FIELDS = new ConcurrentHashMap<>();
    private static final Field MISSING;
    private static boolean loggedFailure;

    private static boolean timeFormat24;
    private static DateTimeFormatter timeFormatter;

    static {
        Field missing = null;
        try {
            missing = RumbleChat.class.getDeclaredField("loggedFailure");
        } catch (NoSuchFieldException ignored) {
            // Never: the field above exists.
        }
        MISSING = missing;
    }

    private RumbleChat() {
    }

    private static final class Filtered {
        final WeakReference<Object> dto;
        final List<?> source;
        final String settings;
        final List<?> result;

        Filtered(Object dto, List<?> source, String settings, List<?> result) {
            this.dto = new WeakReference<>(dto);
            this.source = source;
            this.settings = settings;
            this.result = result;
        }
    }

    /** Whether a switch of an included patch is on. Keys of patches left out count as off here. */
    static boolean on(String key) {
        return Settings.isRegistered(key) && Settings.isEnabled(key);
    }

    // ---------------------------------------------------------------------------------------------
    // Live chat messages (Hide chat clutter)

    /**
     * Injection point: the messages getter of a live chat DTO (live messages, or the history sent on joining),
     * with the list it read. Returns it without the messages a switch hides, before Rumble turns them into
     * chat rows. The same list instance while nothing is hidden.
     */
    public static List<?> messages(List<?> messages, Object dto) {
        if (dto == null) return messages;
        boolean raids = on(HIDE_RAIDS);
        boolean gifts = on(HIDE_GIFTS);
        boolean keywords = on(ChatFilter.KEY);
        // Nothing to hide or match: no reflection at all on Rumble's chat DTOs.
        if (!raids && !gifts && !keywords) return messages;
        try {
            // Joining can carry users with no history. While keywords are on, learn the account from it even
            // then, so a later mention can use it without another users update.
            Map<Long, String> names = keywords ? userNames(dto) : Collections.emptyMap();
            if (messages == null || messages.isEmpty()) return messages;
            ChatFilter.Lists lists = keywords ? ChatFilter.lists(self, "") : null;
            String settings = raids + "," + gifts + "," + System.identityHashCode(lists);
            synchronized (FILTERED) {
                for (Filtered filtered : FILTERED) {
                    if (filtered != null && filtered.dto.get() == dto && filtered.source == messages
                            && filtered.settings.equals(settings)) {
                        return filtered.result;
                    }
                }
            }
            // Only messages arriving live vibrate, not the history sent on joining.
            boolean live = keywords && "LiveChatMessageData".equals(dto.getClass().getSimpleName())
                    && Settings.isEnabled(ChatFilter.VIBRATE);
            List<Object> kept = null;
            for (int i = 0; i < messages.size(); i++) {
                Object message = messages.get(i);
                boolean hide = message != null
                        && ((raids && read(message, "raidNotification") != null)
                        || (gifts && read(message, "giftPurchaseNotification") != null));
                if (!hide && keywords && message != null) {
                    Object userId = read(message, "userId");
                    String name = userId instanceof Long ? names.get(userId) : null;
                    Object text = read(message, "text");
                    int verdict = ChatFilter.classify(name, text instanceof String ? (String) text : "", lists);
                    hide = verdict == ChatFilter.HIDE;
                    if (verdict == ChatFilter.HIGHLIGHT && live && (name == null || !name.equalsIgnoreCase(self))) {
                        ChatFilter.vibrate(Settings.appContext(), "rumble:" + read(message, "id"));
                    }
                }
                if (hide && kept == null) {
                    kept = new ArrayList<>(messages.size());
                    for (int j = 0; j < i; j++) kept.add(messages.get(j));
                } else if (!hide && kept != null) {
                    kept.add(message);
                }
            }
            List<?> result = kept == null ? messages : kept;
            synchronized (FILTERED) {
                FILTERED[nextFiltered] = new Filtered(dto, messages, settings, result);
                nextFiltered = (nextFiltered + 1) % REMEMBERED;
            }
            return result;
        } catch (ReflectiveOperationException | RuntimeException e) {
            fail(e);
            return messages;
        }
    }

    /**
     * The senders' names of a DTO's messages by user ID, from its users list. Learns the signed-in user's name
     * when the list has it.
     */
    private static synchronized Map<Long, String> userNames(Object dto) throws ReflectiveOperationException {
        Map<Long, String> names = new HashMap<>();
        Object users = read(dto, "users");
        if (!(users instanceof List)) return names;
        String current = currentUserId;
        for (Object user : (List<?>) users) {
            if (user == null) continue;
            Object id = read(user, "id");
            Object name = read(user, "userName");
            if (!(id instanceof Long) || !(name instanceof String)) continue;
            names.put((Long) id, (String) name);
            if (current != null && current.equals(currentUserId)
                    && current.equals("_u" + Long.toString((Long) id, 36))) {
                self = ((String) name).trim().toLowerCase(Locale.ROOT);
            }
        }
        return names;
    }

    // ---------------------------------------------------------------------------------------------
    // Anonymous chat

    /**
     * Injection point: instead of the chat stream's setRequestProperty("Cookie", the session's cookies). While
     * Anonymous chat is on the header is left out, so the chat server opens the stream for a guest: it doesn't
     * list the account among the chat's users and reports that it can't write. Read when a chat is opened.
     */
    public static void streamCookie(URLConnection connection, String name, String value) {
        if (connection == null) return;
        if (on(ANONYMOUS)) {
            Logger.d("anonymous chat: chat stream opened without the session cookie");
            return;
        }
        connection.setRequestProperty(name, value);
    }

    /**
     * Injection point: the start of the chat data source's send (messages and Rants). True while Anonymous chat
     * is on: the send then fails without a request, and a toast says why.
     */
    public static boolean sendBlocked() {
        if (!on(ANONYMOUS)) return false;
        Logger.d("anonymous chat: send refused");
        Context context = Settings.appContext();
        if (context != null) {
            new Handler(Looper.getMainLooper()).post(() ->
                    Toast.makeText(context, "Anonymous chat is on: sending is disabled", Toast.LENGTH_SHORT).show());
        }
        return true;
    }

    // ---------------------------------------------------------------------------------------------
    // Chat keywords

    /** Injection point: the start of the live chat event mapper, with the signed-in user's chat ID. */
    public static synchronized void currentUserId(String id) {
        String previous = currentUserId;
        String current = id == null || id.isEmpty() ? null : id;
        if (current == null ? previous != null : !current.equals(previous)) {
            currentUserId = current;
            self = "";
        }
    }

    /**
     * Injection point: the start of a live chat message row, with its modifier and message entity. A message
     * that mentions you or has a highlight word gets a tinted background; any other keeps Rumble's modifier.
     */
    public static Object highlight(Object modifier, Object entity) {
        if (modifier == null || entity == null || !on(ChatFilter.KEY)) return modifier;
        try {
            int verdict = ChatFilter.classify(userName(entity), messageText(entity), ChatFilter.lists(self, ""));
            if (verdict != ChatFilter.HIGHLIGHT) return modifier;
            Object tinted = background(modifier, ((long) HIGHLIGHT_ARGB) << 32);
            return tinted == null ? modifier : tinted;
        } catch (RuntimeException e) {
            fail(e);
            return modifier;
        }
    }

    /** Replaced at patch time: Compose's Modifier.background with an sRGB color, on the given modifier. */
    private static Object background(Object modifier, long color) {
        return null;
    }

    /** Replaced at patch time: a chat message entity's sender. */
    private static String userName(Object entity) {
        return null;
    }

    /** A field of one of Rumble's Gson DTOs, which keep their field names; null when it has none. */
    static Object read(Object dto, String name) throws ReflectiveOperationException {
        Class<?> type = dto.getClass();
        String key = type.getName() + '.' + name;
        Field field = FIELDS.get(key);
        if (field == null) {
            try {
                field = type.getDeclaredField(name);
                field.setAccessible(true);
            } catch (NoSuchFieldException e) {
                field = MISSING;
            }
            FIELDS.put(key, field);
        }
        return field == MISSING ? null : field.get(dto);
    }

    // ---------------------------------------------------------------------------------------------
    // Show deleted messages

    /**
     * Injection point: the "removed by moderator" label a deleted (or muted sender's) message shows, with the
     * message's entity. Adds the original text after the label while Show deleted messages is on.
     */
    public static String deletedLabel(String label, Object entity) {
        if (entity == null || !on(SHOW_DELETED)) return label;
        try {
            String text = messageText(entity);
            if (text == null || text.trim().isEmpty()) return label;
            return label + ": " + text;
        } catch (RuntimeException e) {
            fail(e);
            return label;
        }
    }

    /** Replaced at patch time: a chat message entity's text. */
    private static String messageText(Object entity) {
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // Chat timestamps

    /** Injection point: the sender's name a chat row shows, with the message's entity. Puts the time first. */
    public static String nameWithTime(String name, Object entity) {
        if (name == null || entity == null || !on(TIMESTAMPS)) return name;
        try {
            Object time = timeReceived(entity);
            if (!(time instanceof LocalDateTime)) return name;
            return formatter().format((LocalDateTime) time) + "  " + name;
        } catch (RuntimeException e) {
            fail(e);
            return name;
        }
    }

    /** H:mm or h:mm, following the device's 24-hour setting. */
    private static synchronized DateTimeFormatter formatter() {
        Context context = Settings.appContext();
        boolean is24 = context != null && DateFormat.is24HourFormat(context);
        if (timeFormatter == null || is24 != timeFormat24) {
            timeFormatter = DateTimeFormatter.ofPattern(is24 ? "H:mm" : "h:mm");
            timeFormat24 = is24;
        }
        return timeFormatter;
    }

    /** Replaced at patch time: when a chat message entity was sent, as a local date-time. */
    private static Object timeReceived(Object entity) {
        return null;
    }

    private static void fail(Exception e) {
        if (loggedFailure) return;
        loggedFailure = true;
        Logger.d("rumble chat: failed: " + e);
    }
}
