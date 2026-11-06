package suchi.morphe.extension.duchinese;

import java.lang.reflect.Field;
import java.net.MalformedURLException;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.regex.Pattern;

public final class DownloadDiagnostics {
    private static final Object UNAVAILABLE = new Object();
    private static final ThreadLocal<String> FAILURE = new ThreadLocal<>();
    private static final Map<Object, String> LESSONS = new WeakHashMap<>();
    private static final Map<Object, String> CANDIDATES = new WeakHashMap<>();
    private static final Map<Object, String[]> ACCEPTED = new WeakHashMap<>();
    private static final Pattern MIME_TYPE =
            Pattern.compile("[a-zA-Z0-9!#$&^_.+-]+/[a-zA-Z0-9!#$&^_.+-]+");
    private static final Pattern CLASS_NAME =
            Pattern.compile("[a-zA-Z_$][a-zA-Z0-9_$]*(\\.[a-zA-Z_$][a-zA-Z0-9_$]*)*");
    private static final Pattern METHOD_NAME =
            Pattern.compile("[a-zA-Z_$][a-zA-Z0-9_$]*|<init>|<clinit>");

    private DownloadDiagnostics() {}

    public static synchronized void recordLesson(Object model, String url) {
        if (model != null) LESSONS.put(model, presence(url));
    }

    public static synchronized void recordCandidate(Object model, Object fragment) {
        if (fragment != null) CANDIDATES.put(fragment, LESSONS.get(model));
    }

    public static synchronized void acceptCandidate(Object fragment, String url) {
        if (fragment != null) {
            ACCEPTED.put(fragment, new String[] {CANDIDATES.get(fragment), presence(url)});
        }
    }

    public static synchronized void appendLessonState(Object fragment) {
        String details = FAILURE.get();
        if (details == null) return;
        String[] accepted = ACCEPTED.get(fragment);
        FAILURE.set(details
                + "\nObserved lesson URL: " + available(accepted == null ? null : accepted[0])
                + "\nReader URL: " + available(accepted == null ? null : accepted[1])
                + "\nLatest observed lesson URL: " + available(CANDIDATES.get(fragment)));
    }

    private static String presence(String url) {
        return url == null ? "null" : url.isEmpty() ? "empty" : "nonempty";
    }

    private static String available(String state) {
        return state == null ? "unavailable" : state;
    }

    public static void capture(Object error) {
        clear();
        StringBuilder details = new StringBuilder("Volley: ");
        details.append(error == null ? "unavailable" : error.getClass().getName());
        Object response = readField(error, "x");
        if (response == null) {
            details.append("\nHTTP: unavailable (no attached response)");
        } else if (response == UNAVAILABLE) {
            details.append("\nHTTP: unavailable");
        } else {
            Object status = readField(response, "a");
            details.append("\nHTTP: ").append(status instanceof Integer ? status : "unavailable");
            Object body = readField(response, "b");
            if (body instanceof byte[]) {
                details.append("\nResponse bytes: ").append(((byte[]) body).length);
            }
            String contentType = contentType(readField(response, "c"));
            if (contentType != null) {
                details.append("\nContent-Type: ").append(contentType);
            }
        }
        if (error instanceof Throwable) {
            appendCauses(details, (Throwable) error);
        }
        FAILURE.set(details.toString());
    }

    private static void appendCauses(StringBuilder details, Throwable error) {
        appendFrames(details, error, "Volley at: ");
        IdentityHashMap<Throwable, Boolean> seen = new IdentityHashMap<>();
        seen.put(error, Boolean.TRUE);
        Throwable cause = causeOf(error);
        for (int depth = 1; cause != null; depth++) {
            if (seen.put(cause, Boolean.TRUE) != null) {
                details.append("\nCause chain: cycle omitted");
                return;
            }
            if (depth > 4) {
                details.append("\nCause chain: additional causes omitted");
                return;
            }
            details.append(depth == 1 ? "\nCause: " : "\nCause " + depth + ": ")
                    .append(cause.getClass().getName());
            appendRequestUrlState(details, cause);
            appendFrames(details, cause, "At: ");
            cause = causeOf(cause);
        }
    }

    private static void appendRequestUrlState(StringBuilder details, Throwable error) {
        if (error.getClass() != RuntimeException.class ||
                !(causeOf(error) instanceof MalformedURLException)) return;
        String message = error.getMessage();
        if (message != null && message.startsWith("Bad URL ")) {
            details.append("\nRequest URL: ")
                    .append(message.length() == 8 ? "empty" : "nonempty");
        }
    }

    private static Throwable causeOf(Throwable error) {
        try {
            return error.getCause();
        } catch (RuntimeException ignored) {
            return null;
        }
    }

    private static void appendFrames(StringBuilder details, Throwable error, String label) {
        StackTraceElement[] frames;
        try {
            frames = error.getStackTrace();
        } catch (RuntimeException ignored) {
            return;
        }
        if (frames == null) return;
        int displayed = 0;
        for (int i = 0; i < Math.min(frames.length, 16) && displayed < 3; i++) {
            StackTraceElement frame = frames[i];
            if (frame == null) continue;
            String className = frame.getClassName();
            String methodName = frame.getMethodName();
            if (className.length() > 200 || methodName.length() > 100 ||
                    !CLASS_NAME.matcher(className).matches() ||
                    !METHOD_NAME.matcher(methodName).matches()) continue;
            details.append('\n').append(label).append(className).append('.').append(methodName);
            if (frame.getLineNumber() > 0) details.append(':').append(frame.getLineNumber());
            displayed++;
        }
    }

    public static CharSequence appendToMessage(CharSequence message, int resourceId) {
        String details = FAILURE.get();
        clear();
        return details == null || resourceId != 0x7f13020b ? message : message + "\n\n" + details;
    }

    public static void clear() {
        FAILURE.remove();
    }

    private static Object readField(Object object, String name) {
        if (object == null) return UNAVAILABLE;
        try {
            Field field = object.getClass().getField(name);
            field.setAccessible(true);
            return field.get(object);
        } catch (ReflectiveOperationException | SecurityException ignored) {
            return UNAVAILABLE;
        }
    }

    private static String contentType(Object headers) {
        if (!(headers instanceof Map)) return null;
        for (Map.Entry<?, ?> entry : ((Map<?, ?>) headers).entrySet()) {
            if (!(entry.getKey() instanceof String) ||
                    !"Content-Type".equalsIgnoreCase((String) entry.getKey()) ||
                    !(entry.getValue() instanceof String)) continue;
            String value = ((String) entry.getValue()).split(";", 2)[0].trim();
            return value.length() <= 100 && MIME_TYPE.matcher(value).matches() ? value : null;
        }
        return null;
    }
}
