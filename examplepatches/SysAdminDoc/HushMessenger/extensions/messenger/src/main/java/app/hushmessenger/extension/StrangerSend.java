package app.hushmessenger.extension;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Ask before messaging people you don't know (#207). A tap on Send in a one-to-one chat with a person you aren't
 * friends with, who hasn't written to you in that chat, is held once and a toast asks for another tap. A second Send in
 * the same chat within five seconds goes through, and the one after that asks again. Group chats, pages and businesses
 * never ask, and neither does a chat whose other person Messenger hasn't sized up yet.
 *
 * The compose fragment's send hands over what its chat view holds: the thread key, the other person and the messages
 * loaded so far. Their fields are obfuscated, so they're read by type, and the person's friendship and kind by the
 * names of their enums' values, the way Messenger itself compares them with ARE_FRIENDS and PAGE.
 */
public final class StrangerSend {
    static final String KEY = "confirm_strangers";
    static final String HELD = "confirm_strangers_held";
    /** How long after a held tap the next Send in that chat goes through. */
    static final long AGAIN_MS = 5_000L;

    private static final String THREAD_KEY = "com.facebook.messaging.model.threadkey.ThreadKey";
    private static final String USER = "com.facebook.user.model.User";
    private static final String USER_KEY = "com.facebook.user.model.UserKey";
    private static final String MESSAGES = "com.facebook.messaging.model.messages.MessagesCollection";
    private static final String PARTICIPANT = "com.facebook.messaging.model.messages.ParticipantInfo";

    /** The friendship values that aren't friends. UNKNOWN isn't one, since Messenger hasn't found out yet. */
    private static final String[] NOT_FRIENDS = {"CAN_REQUEST", "CANNOT_REQUEST", "INCOMING_REQUEST", "OUTGOING_REQUEST"};
    /** The kinds of user that are a person, not a page, a group or a bot. */
    private static final String[] PEOPLE = {"FACEBOOK", "INSTAGRAM"};

    private static final Map<Class<?>, List<Field>> FIELDS = new ConcurrentHashMap<>();

    /** The thread key of the chat whose Send was held last, and when. Messenger's keys are equal for the same chat. */
    private static Object heldChat;
    private static long heldAt;

    private StrangerSend() { }

    /**
     * From the top of the compose fragment's send, with the chat view's parameters. True holds this send: Messenger's
     * send returns before it reads the composer, so the words stay in the box. Never throws.
     */
    public static boolean holdStrangerSend(Object thread) {
        try {
            if (thread == null || !Settings.enabled(KEY)) return false;
            Object key = held(thread, THREAD_KEY);
            if (key == null || !oneToOne(key)) return false;
            Object person = held(thread, USER);
            if (person == null || !stranger(person)) return false;
            String them = userId(held(person, USER_KEY));
            if (them == null || wroteHere(held(thread, MESSAGES), them)) return false;
            if (!firstTap(key, SystemClock.elapsedRealtime())) return false;
            say(HELD);
            return true;
        } catch (Throwable error) {
            // A check that can't read the chat mustn't cost the message.
            Settings.hookFailedPrivately(KEY, "Can't check who a message goes to", error);
            return false;
        }
    }

    /** Whether this tap is held: false for a second tap in the same chat inside the window, which also clears it. */
    private static synchronized boolean firstTap(Object chat, long now) {
        if (chat.equals(heldChat) && now >= heldAt && now - heldAt <= AGAIN_MS) {
            heldChat = null;
            return false;
        }
        heldChat = chat;
        heldAt = now;
        return true;
    }

    /** A thread key of a one-to-one chat: plain, end-to-end encrypted or across apps. Groups and the rest aren't. */
    private static boolean oneToOne(Object key) throws IllegalAccessException {
        for (Field field : fields(key.getClass())) {
            Object value = field.get(key);
            if (!(value instanceof Enum)) continue;
            String name = ((Enum<?>) value).name();
            if (name.equals("ONE_TO_ONE") || name.endsWith("_ONE_TO_ONE")) return true;
        }
        return false;
    }

    /** A person, not a page, who isn't a friend. {@link RemoveContact} asks the same about a contact menu's person. */
    static boolean stranger(Object person) throws IllegalAccessException {
        boolean notFriends = false, isPerson = false;
        for (Field field : fields(person.getClass())) {
            Object value = field.get(person);
            // Messenger counts a user whose type the server sent as "page" as a page, whatever its kind says.
            if ("page".equals(value)) return false;
            if (!(value instanceof Enum)) continue;
            Enum<?> state = (Enum<?>) value;
            if (hasValue(state, "ARE_FRIENDS")) notFriends = contains(NOT_FRIENDS, state.name());
            else if (hasValue(state, "PAGE") && hasValue(state, "FACEBOOK")) isPerson = contains(PEOPLE, state.name());
        }
        return notFriends && isPerson;
    }

    /** Whether any loaded message in the chat came from [them]. */
    private static boolean wroteHere(Object messages, String them) throws IllegalAccessException {
        if (messages == null) return false;
        for (Field field : fields(messages.getClass())) {
            Object value = field.get(messages);
            if (!(value instanceof List)) continue;
            for (Object message : (List<?>) value) {
                if (message != null && from(message, them)) return true;
            }
        }
        return false;
    }

    /** A message holds who sent it, and who it was sent for, as participants: either one being [them] counts. */
    private static boolean from(Object message, String them) throws IllegalAccessException {
        for (Field field : fields(message.getClass())) {
            if (!PARTICIPANT.equals(field.getType().getName())) continue;
            Object participant = field.get(message);
            if (participant != null && them.equals(userId(held(participant, USER_KEY)))) return true;
        }
        return false;
    }

    /** The id a user key holds. */
    static String userId(Object userKey) throws IllegalAccessException {
        if (userKey == null) return null;
        for (Field field : fields(userKey.getClass())) {
            if (field.getName().equals("id") && field.getType() == String.class) return (String) field.get(userKey);
        }
        return null;
    }

    /**
     * Whether the enum has a value called [name]. Read from its static fields, since Redex can drop the values() method
     * Class.getEnumConstants calls.
     */
    private static boolean hasValue(Enum<?> state, String name) throws IllegalAccessException {
        Class<?> kinds = state.getDeclaringClass();
        for (Field constant : kinds.getDeclaredFields()) {
            if (!Modifier.isStatic(constant.getModifiers()) || constant.getType() != kinds) continue;
            constant.setAccessible(true);
            Object value = constant.get(null);
            if (value != null && ((Enum<?>) value).name().equals(name)) return true;
        }
        return false;
    }

    private static boolean contains(String[] names, String name) {
        for (String known : names) if (known.equals(name)) return true;
        return false;
    }

    /** What [owner] holds in a field of the class named [type], or null. */
    static Object held(Object owner, String type) throws IllegalAccessException {
        if (owner == null) return null;
        for (Field field : fields(owner.getClass())) {
            if (!type.equals(field.getType().getName())) continue;
            Object value = field.get(owner);
            if (value != null) return value;
        }
        return null;
    }

    private static List<Field> fields(Class<?> type) {
        List<Field> known = FIELDS.get(type);
        if (known != null) return known;
        List<Field> found = new ArrayList<>();
        for (Class<?> at = type; at != null && at != Object.class; at = at.getSuperclass()) {
            for (Field field : at.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    found.add(field);
                } catch (RuntimeException refused) {
                    // A field this process can't open just isn't read.
                }
            }
        }
        List<Field> fixed = Collections.unmodifiableList(found);
        FIELDS.put(type, fixed);
        return fixed;
    }

    static synchronized void resetForTests() {
        heldChat = null;
        heldAt = 0;
        FIELDS.clear();
    }

    private static void say(String message) {
        Context context = Settings.appContext;
        if (context == null) return;
        new Handler(Looper.getMainLooper()).post(() ->
            Toast.makeText(context, new SettingsText(context).get(message), Toast.LENGTH_SHORT).show());
    }
}
