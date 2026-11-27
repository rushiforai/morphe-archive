package app.hushmessenger.extension;

import android.net.Uri;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * The address a message shared, for the message log. A shared reel, post or page arrives with no words of its own, so
 * the log kept only what the notification said about it ("Shared a reel."), and once the sender unsent it there was
 * nothing left to open. With {@link MessageLog#KEY} on, the address is read off the message object the notification hook
 * hands over, and the entry keeps it in place of that line, or on a line under the words when the message had some.
 *
 * Two shapes carry it. An older share is a Share in one of the message's lists, whose String fields hold its address
 * among its title, caption and ids, so it's told apart by value: the first whole http or https address that isn't one of
 * Meta's picture servers. A newer one is a GraphQL tree: the message holds an extensible attachment whose
 * story_attachment tree carries a url string, the one Messenger itself opens when the card is tapped. A tree's data lives
 * in native code, so it's read through TreeJNI's own public methods, which keep their names in every build, with each
 * field named by its hash, which is the String hash of the field's name and so is the same in every build too. Each
 * field's type is asked before anything is read from it, so a string is only ever read from a field that holds one.
 *
 * Only the class names Share and TreeJNI are relied on, never an obfuscated field or method name. Anything unexpected
 * means no address, and the message is logged the way it always was.
 */
final class MessageLogLink {
    private MessageLogLink() {}

    private static final String SHARE = "com.facebook.messaging.model.share.Share";
    private static final String TREE = "com.facebook.graphservice.tree.TreeJNI";
    /** The extensible attachment's field for the card it shows, and its hash, which Messenger's own getter reads. */
    static final String STORY_ATTACHMENT_FIELD = "story_attachment";
    static final int STORY_ATTACHMENT = 0xa042faad;
    /** The card's address, which Messenger reads as a string and opens when the card is tapped, and its hash. */
    static final String URL_FIELD = "url";
    static final int URL = 0x1c56f;
    /** Meta's picture and file servers. An address there is a preview's, never what was shared. */
    private static final String[] PICTURE_HOSTS = {"fbcdn.net", "cdninstagram.com", "fbsbx.com"};
    /** A longer address isn't kept, so the words beside it always keep at least half the room. */
    static final int MAX_LINK_CHARS = MessageLog.MAX_TEXT_CHARS / 2;

    /**
     * The fields of each message class that could hold a tree, and the String fields of each Share class, so each walk
     * runs once per build. Weak on the class, since a key held strongly would pin Messenger's class loader.
     */
    private static final Map<Class<?>, Field[]> OBJECTS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Class<?>, Field[]> STRINGS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Field[] NONE = new Field[0];

    /**
     * The address [message] shared, or null when it shared none, the log is off, or the message isn't shaped the way
     * this build's was. Runs on Messenger's own thread, so it only reads what the message already holds.
     */
    static String shared(Object message) {
        if (message == null || !Settings.wouldUse(MessageLog.KEY)) return null;
        String link = null;
        try {
            link = fromShare(message);
        } catch (Throwable unreadable) {
            Settings.hookFailedPrivately(MessageLog.KEY, "Can't read the address a message shared", unreadable);
        }
        return link != null ? link : fromTree(message);
    }

    /** The first Share in [message]'s lists that holds an address, by value, since its fields aren't named here. */
    private static String fromShare(Object message) throws IllegalAccessException {
        for (Field field : MessageLogAttachment.fields(message.getClass())) {
            Object items = field.get(message);
            if (!(items instanceof List)) continue;
            for (Object item : (List<?>) items) {
                if (item == null || !SHARE.equals(item.getClass().getName())) continue;
                for (Field text : strings(item.getClass())) {
                    String link = link((String) text.get(item));
                    if (link != null) return link;
                }
            }
        }
        return null;
    }

    /**
     * The card's address on the first of [message]'s trees that has one. A tree that fails is passed over for the next,
     * and the first failure is noted when none of them gave an address.
     */
    private static String fromTree(Object message) {
        Throwable failure = null;
        try {
            for (Field field : objects(message.getClass())) {
                Object value = field.get(message);
                if (value == null || tree(value.getClass()) == null) continue;
                try {
                    String link = storyLink(value);
                    if (link != null) return link;
                } catch (Throwable unreadable) {
                    if (failure == null) failure = unreadable;
                }
            }
        } catch (Throwable unreadable) {
            if (failure == null) failure = unreadable;
        }
        if (failure != null) Settings.hookFailedPrivately(MessageLog.KEY, "Can't read the address a message's card links to", failure);
        return null;
    }

    /** The url of [attachment]'s story_attachment, each asked for its type before it's read. */
    private static String storyLink(Object attachment) throws Exception {
        if (!holds(attachment, STORY_ATTACHMENT_FIELD, "TREE")) return null;
        Object story = tree(attachment.getClass()).getMethod("getTree", int.class).invoke(attachment, STORY_ATTACHMENT);
        if (story == null || tree(story.getClass()) == null || !holds(story, URL_FIELD, "STRING")) return null;
        Object url = tree(story.getClass()).getMethod("getString", int.class).invoke(story, URL);
        return url instanceof String ? link((String) url) : null;
    }

    /** Whether [tree]'s field [name] is set and holds a [kind], the name of one of the tree's own field types. */
    private static boolean holds(Object tree, String name, String kind) throws Exception {
        Class<?> type = tree(tree.getClass());
        Object held = type.getMethod("getFieldType", String.class).invoke(tree, name);
        if (!(held instanceof Enum) || !kind.equals(((Enum<?>) held).name())) return false;
        return Boolean.FALSE.equals(type.getMethod("isFieldUnset", String.class).invoke(tree, name));
    }

    /** TreeJNI itself when [type] is one of its kinds, else null. */
    private static Class<?> tree(Class<?> type) {
        for (Class<?> at = type; at != null && at != Object.class; at = at.getSuperclass()) {
            if (TREE.equals(at.getName())) return at;
        }
        return null;
    }

    /**
     * The fields of [type] that could hold a tree: any object that isn't a string, a list or one of the platform's own
     * types. The attachment's field is typed by one of Messenger's interfaces, whose name differs per build.
     */
    private static Field[] objects(Class<?> type) {
        Field[] known = OBJECTS.get(type);
        if (known != null) return known;
        List<Field> found = new ArrayList<>();
        for (Field field : type.getDeclaredFields()) {
            Class<?> kind = field.getType();
            if (Modifier.isStatic(field.getModifiers()) || kind.isPrimitive() || kind.isArray() || platform(kind.getName())) continue;
            try {
                field.setAccessible(true);
            } catch (RuntimeException sealed) {
                continue;
            }
            found.add(field);
        }
        Field[] fixed = found.isEmpty() ? NONE : found.toArray(NONE);
        OBJECTS.put(type, fixed);
        return fixed;
    }

    private static boolean platform(String name) {
        return name.startsWith("java.") || name.startsWith("javax.") || name.startsWith("android.") || name.startsWith("androidx.")
            || name.startsWith("kotlin.") || name.startsWith("com.google.");
    }

    /** The String fields of a Share, which hold its address among its title, caption and ids. */
    private static Field[] strings(Class<?> type) {
        Field[] known = STRINGS.get(type);
        if (known != null) return known;
        List<Field> found = new ArrayList<>();
        for (Field field : type.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
            try {
                field.setAccessible(true);
            } catch (RuntimeException sealed) {
                continue;
            }
            found.add(field);
        }
        Field[] fixed = found.isEmpty() ? NONE : found.toArray(NONE);
        STRINGS.put(type, fixed);
        return fixed;
    }

    /**
     * [value] when it's one whole http or https address on a named host that isn't a picture server's, else null. An
     * app's own address (fb://), a script or anything with spaces in it is never kept.
     */
    static String link(String value) {
        if (value == null) return null;
        String link = value.trim();
        if (link.isEmpty() || link.length() > MAX_LINK_CHARS) return null;
        for (int i = 0; i < link.length(); i++) {
            char c = link.charAt(i);
            if (Character.isWhitespace(c) || Character.isSpaceChar(c) || Character.isISOControl(c)) return null;
        }
        Uri uri = Uri.parse(link);
        String scheme = uri.getScheme();
        String host = uri.getHost();
        if (scheme == null || host == null || host.isEmpty()) return null;
        scheme = scheme.toLowerCase(Locale.ROOT);
        if (!scheme.equals("http") && !scheme.equals("https")) return null;
        host = host.toLowerCase(Locale.ROOT);
        for (String pictures : PICTURE_HOSTS) {
            if (host.equals(pictures) || host.endsWith("." + pictures)) return null;
        }
        return link;
    }

    /**
     * What an entry says for a message that shared [link]: the link alone when the message had no [words] of its own,
     * the words with the link on a line under them otherwise, clipped so both fit the log's limit. Words that already
     * hold an address are left as they are, since that's what Messenger built the card from.
     */
    static String joined(String words, String link) {
        if (link == null || link.isEmpty()) return words;
        if (words == null || words.isEmpty()) return link;
        String lower = words.toLowerCase(Locale.ROOT);
        if (lower.contains("http://") || lower.contains("https://")) return words;
        return MessageLog.clip(words, MessageLog.MAX_TEXT_CHARS - link.length() - 1) + "\n" + link;
    }
}
