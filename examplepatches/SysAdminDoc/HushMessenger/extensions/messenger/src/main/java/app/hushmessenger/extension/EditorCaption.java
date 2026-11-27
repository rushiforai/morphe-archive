package app.hushmessenger.extension;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Put your words above the photo, for a photo or video Messenger's editor sends by itself (#236). A chat in a bubble
 * opens the editor in a task of its own, so the editor's Send goes straight to the chat and the chat's composer never
 * hears about it: the words stayed in the box. The chat hands itself over as it opens the editor, and right before the
 * editor's own send the words go out first through the compose fragment's editor helper, the one the composer's own
 * editor send calls. That helper checks the composer is still there, leaves stickers alone and reads the switch. The
 * editor a chat opens from the attachment chip hands its photo back to the compose fragment as a result instead, and
 * {@link #resultKind} tells the same helper what kind of media that result's message holds. In the msys composer the
 * phone runs, that result goes out through the composer's batch send, which never reads the box: {@link #chipOpening}
 * keeps the composer whose chip opened the editor, and {@link #chipSending} tells the patch's helper in the batch send
 * whether that composer's words go first.
 */
public final class EditorCaption {
    static final String KEY = "media_caption";
    /** The static helper the patch adds to the compose fragment: (the fragment, the kind of media). */
    static final String HELPER = "hushCaptionForEditor";
    private static final WeakReference<Object> NONE = new WeakReference<>(null);
    private static volatile WeakReference<Object> opener = NONE;
    /** Each chat fragment class's field holding its compose fragment. */
    private static final Map<Class<?>, Field> composerFields = new ConcurrentHashMap<>();
    /** Each compose fragment class's editor helper. */
    private static final Map<Class<?>, Method> helpers = new ConcurrentHashMap<>();
    /** Each media class's field holding its kind of media. */
    private static final Map<Class<?>, Field> kindFields = new ConcurrentHashMap<>();
    /** The media Messenger's editor hands back in its result's message. */
    static final String MEDIA_RESOURCE = "com.facebook.ui.media.attachments.model.MediaResource";
    /** Each message class's list fields, one of which holds its media. */
    private static final Map<Class<?>, List<Field>> listFields = new ConcurrentHashMap<>();
    /** The composer whose attachment chip opened the editor last, until the editor's result goes out. */
    private static volatile ChipOpener chip;
    /** Each text holder class's getText(). */
    private static final Map<Class<?>, Method> textGetters = new ConcurrentHashMap<>();

    /** The bus of the composer whose chip opened the editor, and the holder of the words typed in it. */
    private static final class ChipOpener {
        final WeakReference<Object> bus;
        final WeakReference<Object> text;

        ChipOpener(Object bus, Object text) {
            this.bus = new WeakReference<>(bus);
            this.text = new WeakReference<>(text);
        }
    }

    private EditorCaption() {}

    /**
     * The attachment chip opening Messenger's editor (#236), with the composer's event bus and the holder of its typed
     * text. Only the last one is kept, and only until the editor's result goes out. Reads nothing.
     */
    public static void chipOpening(Object bus, Object text) {
        chip = bus != null && text != null ? new ChipOpener(bus, text) : null;
    }

    /**
     * Right before the composer's batch send hands over the editor's result, with that send's bus and media. True when
     * the words go first: the chip on this same bus opened the editor, the switch is on, the media is a photo or video and
     * the box holds more than spaces. The patch's helper then posts the composer's own text send, which sends the words
     * and clears the box. A send on another bus, a sticker, an empty box, off, Pause and safe mode answer false and the
     * send goes on as Messenger wrote it. Never throws.
     */
    public static boolean chipSending(Object bus, List<?> media) {
        try {
            ChipOpener opened = chip;
            if (bus == null || opened == null || opened.bus.get() != bus) return false;
            chip = null;
            if (!Settings.enabled(KEY) || kind(media) == null) return false;
            Object holder = opened.text.get();
            CharSequence typed = holder != null ? typed(holder) : null;
            return typed != null && !typed.toString().trim().isEmpty();
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't send the words before the chip's photo", error);
            return false;
        }
    }

    /** What the composer's text holder holds now, through its getText(). */
    private static CharSequence typed(Object holder) throws ReflectiveOperationException {
        Method getter = textGetters.get(holder.getClass());
        if (getter == null) {
            getter = holder.getClass().getMethod("getText");
            if (!CharSequence.class.isAssignableFrom(getter.getReturnType())) throw new IllegalStateException("no typed text");
            getter.setAccessible(true);
            textGetters.put(holder.getClass(), getter);
        }
        return (CharSequence) getter.invoke(holder);
    }

    /** The chat fragment opening Messenger's editor. Only the last one is kept, and only until the editor sends. */
    public static void editorOpening(Object chat) {
        opener = chat != null ? new WeakReference<>(chat) : NONE;
    }

    /**
     * Right before the editor sends the message by itself, with the message's media. With the switch on and the chat
     * that opened the editor still there, its words go first. Off, Pause, safe mode, a chat that's gone or a kind of
     * media the composer wouldn't caption leaves the send to Messenger.
     */
    public static void editorSending(List<?> media) {
        try {
            Object chat = opener.get();
            opener = NONE;
            if (chat == null || !Settings.wouldUse(KEY) || !added(chat)) return;
            String kind = kind(media);
            if (kind == null) return;
            Field field = composerField(chat.getClass());
            Object composer = field.get(chat);
            if (composer == null) return;
            helper(field.getType()).invoke(null, composer, kind);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't send the words before the editor's photo", error);
        }
    }

    /**
     * The kind of media the editor's result hands back to the compose fragment, for the editor helper the patch calls
     * right before the fragment sends that message (#236, the editor opened from the attachment chip): "sticker" for a
     * sticker made in the camera, "video" for a video, and "image" for anything else, the way the composer's own editor
     * send names them. Never throws. A message it can't read answers "image", so the words still go first, which is what
     * the switch promises for a photo; off, Pause and safe mode answer it without reading anything, and the helper then
     * leaves the words where they are.
     */
    public static String resultKind(Object message) {
        try {
            if (message == null || !Settings.wouldUse(KEY)) return "image";
            Object media = firstMedia(message);
            if (media == null) return "image";
            Object kind = kindField(media.getClass()).get(media);
            if (kind == null) return "image";
            switch (((Enum<?>) kind).name()) {
                case "SELFIE_STICKER":
                    return "sticker";
                case "VIDEO":
                case "ENT_VIDEO":
                    return "video";
                default:
                    return "image";
            }
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't read the editor's photo before the words", error);
            return "image";
        }
    }

    /** The first MediaResource in any of the message's list fields, or null. Message's field names say nothing. */
    private static Object firstMedia(Object message) throws IllegalAccessException {
        for (Field field : listFields(message.getClass())) {
            Object value = field.get(message);
            if (!(value instanceof List)) continue;
            for (Object item : (List<?>) value)
                if (item != null && MEDIA_RESOURCE.equals(item.getClass().getName())) return item;
        }
        return null;
    }

    /** Each instance field of the class and its superclasses whose type is a List. */
    private static List<Field> listFields(Class<?> type) {
        List<Field> known = listFields.get(type);
        if (known != null) return known;
        List<Field> found = new ArrayList<>();
        for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !List.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                found.add(field);
            }
        }
        List<Field> fixed = Collections.unmodifiableList(found);
        listFields.put(type, fixed);
        return fixed;
    }

    /** Whether the chat fragment is still added to its screen. */
    private static boolean added(Object chat) throws ReflectiveOperationException {
        return Boolean.TRUE.equals(chat.getClass().getMethod("isAdded").invoke(chat));
    }

    /**
     * What the composer's own editor send calls this kind of media: "image" or "video". Anything else, a sticker made in
     * the camera included, is null, so the words stay put.
     */
    static String kind(List<?> media) throws ReflectiveOperationException {
        if (media == null || media.isEmpty() || media.get(0) == null) return null;
        Object first = media.get(0);
        Object kind = kindField(first.getClass()).get(first);
        if (kind == null) return null;
        switch (((Enum<?>) kind).name()) {
            case "PHOTO":
            case "ENT_PHOTO":
            case "ANIMATED_PHOTO":
                return "image";
            case "VIDEO":
            case "ENT_VIDEO":
                return "video";
            default:
                return null;
        }
    }

    /** The one field of the media whose type is an enum with both PHOTO and VIDEO in it. */
    private static Field kindField(Class<?> type) throws IllegalAccessException {
        Field known = kindFields.get(type);
        if (known != null) return known;
        Field found = null;
        for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !Enum.class.isAssignableFrom(field.getType()) || !photoAndVideo(field.getType())) continue;
                if (found != null) throw new IllegalStateException("two kinds of media");
                found = field;
            }
        }
        if (found == null) throw new IllegalStateException("no kind of media");
        found.setAccessible(true);
        kindFields.put(type, found);
        return found;
    }

    /**
     * Whether the enum's constants include PHOTO and VIDEO. Read from its static fields, since Redex can drop the
     * values() method Class.getEnumConstants calls.
     */
    private static boolean photoAndVideo(Class<?> kinds) throws IllegalAccessException {
        boolean photo = false, video = false;
        for (Field constant : kinds.getDeclaredFields()) {
            if (!Modifier.isStatic(constant.getModifiers()) || constant.getType() != kinds) continue;
            constant.setAccessible(true);
            Object kind = constant.get(null);
            if (kind == null) continue;
            String name = ((Enum<?>) kind).name();
            photo |= name.equals("PHOTO");
            video |= name.equals("VIDEO");
        }
        return photo && video;
    }

    /** The chat fragment's one field whose type is a compose fragment the patch gave the editor helper. */
    private static Field composerField(Class<?> type) {
        Field known = composerFields.get(type);
        if (known != null) return known;
        Field found = null;
        for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || helperOf(field.getType()) == null) continue;
                if (found != null) throw new IllegalStateException("two compose fragments");
                found = field;
            }
        }
        if (found == null) throw new IllegalStateException("no compose fragment");
        found.setAccessible(true);
        composerFields.put(type, found);
        return found;
    }

    private static Method helper(Class<?> composer) {
        Method helper = helperOf(composer);
        if (helper == null) throw new IllegalStateException("no editor helper");
        return helper;
    }

    /** The compose fragment class's static helper(itself, String), or null when it has none. */
    private static Method helperOf(Class<?> composer) {
        if (composer.isPrimitive() || composer.isArray()) return null;
        Method known = helpers.get(composer);
        if (known != null) return known;
        try {
            Method helper = composer.getDeclaredMethod(HELPER, composer, String.class);
            if (!Modifier.isStatic(helper.getModifiers())) return null;
            helper.setAccessible(true);
            helpers.put(composer, helper);
            return helper;
        } catch (NoSuchMethodException | LinkageError absent) {
            return null;
        }
    }
}
