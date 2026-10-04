package app.threadripper.extension.youtube;

import android.net.Uri;

import org.chromium.net.CronetEngine;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * What the app asked to download, read from its obfuscated media3 objects without relying on
 * obfuscated member names: fields are found by their unique type, and position/length come from
 * {@code DataSpec.toString()}, whose media3 format is
 * {@code DataSpec[METHOD uri, position, length, key, flags]}.
 */
final class MediaRequest {
    final String method;
    final Uri uri;
    final long position;
    final long length;
    final Map<String, String> headers;

    private MediaRequest(String method, Uri uri, long position, long length, Map<String, String> headers) {
        this.method = method;
        this.uri = uri;
        this.position = position;
        this.length = length;
        this.headers = headers;
    }

    /** @return null when the DataSpec cannot be read reliably. */
    static MediaRequest parse(Object dataSpec) {
        Object uri = fieldOfType(dataSpec, Uri.class);
        if (!(uri instanceof Uri)) return null;

        String s = dataSpec.toString();
        if (!s.startsWith("DataSpec[") || !s.endsWith("]")) return null;
        s = s.substring("DataSpec[".length(), s.length() - 1);
        int space = s.indexOf(' ');
        if (space <= 0) return null;
        String method = s.substring(0, space);
        // Split from the right: uri may not contain ", " but key could in theory, so check the uri.
        String[] tail = s.substring(space + 1).split(", ");
        if (tail.length < 5) return null;
        int n = tail.length;
        if (!tail[0].equals(uri.toString())) return null;
        long position;
        long length;
        try {
            position = Long.parseLong(tail[n - 4]);
            length = Long.parseLong(tail[n - 3]);
        } catch (NumberFormatException ex) {
            return null;
        }

        if (fieldOfType(dataSpec, byte[].class) != null) return null; // Has a request body.

        Map<String, String> headers = Collections.emptyMap();
        Object map = fieldOfType(dataSpec, Map.class);
        if (map instanceof Map) {
            headers = new HashMap<>();
            for (Map.Entry<?, ?> e : ((Map<?, ?>) map).entrySet()) {
                headers.put(String.valueOf(e.getKey()), String.valueOf(e.getValue()));
            }
        }
        return new MediaRequest(method, (Uri) uri, position, length, headers);
    }

    /**
     * Finds the CronetEngine the app's media data source uses. The outer UMP data source wraps a
     * media3 CronetDataSource, which holds the engine; search one level of wrapping.
     */
    static CronetEngine findEngine(Object dataSource) {
        for (Class<?> c = dataSource.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (f.getType().isPrimitive() || java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                try {
                    f.setAccessible(true);
                    Object inner = f.get(dataSource);
                    if (inner == null) continue;
                    if (inner instanceof CronetEngine) return (CronetEngine) inner;
                    Object engine = fieldOfType(inner, CronetEngine.class);
                    if (engine instanceof CronetEngine) return (CronetEngine) engine;
                } catch (Exception ignored) {
                }
            }
        }
        return null;
    }

    private static final Map<String, Field> typeFields = new ConcurrentHashMap<>();
    private static final Field NONE;

    static {
        try {
            NONE = MediaRequest.class.getDeclaredField("method");
        } catch (NoSuchFieldException ex) {
            throw new IllegalStateException(ex);
        }
    }

    /** Value of the single instance field assignable to {@code type}, searching superclasses. */
    private static Object fieldOfType(Object obj, Class<?> type) {
        String key = obj.getClass().getName() + '|' + type.getName();
        Field field = typeFields.get(key);
        if (field == null) {
            field = NONE;
            outer:
            for (Class<?> c = obj.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                    if (type.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        field = f;
                        break outer;
                    }
                }
            }
            typeFields.put(key, field);
        }
        if (field == NONE) return null;
        try {
            return field.get(obj);
        } catch (IllegalAccessException ex) {
            return null;
        }
    }
}
