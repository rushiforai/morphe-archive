package semicoloncolonel.mobilestream.extension.truthsocial;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;

/**
 * Truth Social "Fix pictures shown as videos". The app decides to draw a
 * post's media in its video player when the post, the post it replies to,
 * a reshared post, or a quoted post has a video. A post whose own media is a
 * picture can then get the video player, which tries to play the JPEG, shows
 * a play button, and ignores taps. This answers from the post's own media
 * when it has any, and falls back to the app's own check when it has none
 * (a reshare, for example).
 */
@SuppressWarnings("unused")
public final class MediaTypeFix {
    private static volatile Method original;
    private static volatile Field statusField;

    private MediaTypeFix() {
    }

    /** Replaced by the patch with the name of the app's "has video" method. */
    private static String hasVideoMethod() {
        return "";
    }

    public static boolean hasVideo(Object post) {
        try {
            Boolean own = ownMediaHasVideo(post);
            if (own != null) return own;
        } catch (Throwable ignored) {
            // Fall back to the app's own check.
        }
        return appHasVideo(post);
    }

    private static boolean appHasVideo(Object post) {
        try {
            Method m = original;
            if (m == null) {
                m = post.getClass().getMethod(hasVideoMethod());
                original = m;
            }
            return (Boolean) m.invoke(post);
        } catch (Throwable t) {
            return false;
        }
    }

    /** True or false from the post's own media; null when it has none. */
    private static Boolean ownMediaHasVideo(Object post) throws IllegalAccessException {
        Object status = status(post);
        if (status == null) return null;
        for (Field f : status.getClass().getDeclaredFields()) {
            if (!List.class.isAssignableFrom(f.getType()) || Modifier.isStatic(f.getModifiers())) continue;
            f.setAccessible(true);
            Object value = f.get(status);
            if (!(value instanceof List) || ((List<?>) value).isEmpty()) continue;
            Object first = ((List<?>) value).get(0);
            if (first == null || !first.getClass().getName().endsWith(".MediaAttachment")) continue;
            for (Object attachment : (List<?>) value) {
                String type = mediaType(attachment);
                if ("Video".equals(type) || "TV".equals(type)) return true;
            }
            return false;
        }
        return null;
    }

    private static Object status(Object post) throws IllegalAccessException {
        Field f = statusField;
        if (f == null) {
            for (Field candidate : post.getClass().getDeclaredFields()) {
                if (candidate.getType().getName().endsWith(".TruthStatus") && !Modifier.isStatic(candidate.getModifiers())) {
                    candidate.setAccessible(true);
                    f = candidate;
                    break;
                }
            }
            if (f == null) return null;
            statusField = f;
        }
        return f.get(post);
    }

    private static String mediaType(Object attachment) throws IllegalAccessException {
        for (Field f : attachment.getClass().getDeclaredFields()) {
            if (f.getType().isEnum() && f.getType().getName().endsWith(".TruthMediaType")) {
                f.setAccessible(true);
                Object value = f.get(attachment);
                return value == null ? null : ((Enum<?>) value).name();
            }
        }
        return null;
    }
}
