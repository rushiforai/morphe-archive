package software.santodan.extension.nuviomerged;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/** Resolve provenance by the card's exact content identity, never its display title. */
public final class NuvioProviderBadge {
    private static final Map<String, Field> FIELDS = new ConcurrentHashMap<>();
    private static final Map<String, Method> METHODS = new ConcurrentHashMap<>();
    private NuvioProviderBadge() {}

    private static Object field(Object value, String name) throws ReflectiveOperationException {
        String key = value.getClass().getName() + "|" + name;
        Field member = FIELDS.get(key);
        if (member == null) {
            member = value.getClass().getDeclaredField(name);
            member.setAccessible(true);
            FIELDS.put(key, member);
        }
        return member.get(value);
    }

    private static Object get(Object value, String name) throws ReflectiveOperationException {
        String key = value.getClass().getName() + "|" + name;
        Method member = METHODS.get(key);
        if (member == null) {
            member = value.getClass().getMethod(name);
            member.setAccessible(true);
            METHODS.put(key, member);
        }
        return member.invoke(value);
    }

    public static String source(Object card, Map<String, String> origins) throws ReflectiveOperationException {
        if (card == null) return null;
        Object progress = field(card, "x");
        Object id;
        Object type;
        if (progress != null) {
            id = get(progress, "getContentId");
            type = get(progress, "getContentType");
        } else {
            Object nextUp = field(card, "y");
            if (nextUp == null) return null;
            Object info = field(nextUp, "a");
            if (info == null) return null;
            id = field(info, "a");
            type = field(info, "b");
        }
        return id == null || type == null ? null : origins.get(type + "|" + id);
    }

    public static String resource(String source) {
        if (source == null) return null;
        switch (source) {
            case "Trakt": return "raw/trakt_tv_favicon";
            case "Simkl": return "raw/simkl_tv_glyph";
            case "MDBList": return "raw/mdblist_logo";
            case "Nuvio Sync": return "drawable/ic_launcher";
            default: return null;
        }
    }
}
