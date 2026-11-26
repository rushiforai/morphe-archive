package app.pomee4.extension.commentswipe;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Reads Reddit's {@code com.reddit.domain.model.Comment}. Its getters are not obfuscated, and
 * calling them by reflection keeps this extension free of compile-time stubs of Reddit classes.
 */
final class CommentAccess {
    private static final Map<String, Method> getters = new ConcurrentHashMap<>();

    private CommentAccess() {
    }

    static String getId(Object comment) {
        return (String) call(comment, "getId");
    }

    static String getKindWithId(Object comment) {
        return (String) call(comment, "getKindWithId");
    }

    static String getAuthor(Object comment) {
        return (String) call(comment, "getAuthor");
    }

    static boolean getSaved(Object comment) {
        return Boolean.TRUE.equals(call(comment, "getSaved"));
    }

    private static Object call(Object comment, String name) {
        try {
            Method method = getters.get(name);
            if (method == null) {
                method = comment.getClass().getMethod(name);
                getters.put(name, method);
            }
            return method.invoke(comment);
        } catch (ReflectiveOperationException ex) {
            Logger.printException(() -> "Comment." + name + " failure", ex);
            return null;
        }
    }
}
