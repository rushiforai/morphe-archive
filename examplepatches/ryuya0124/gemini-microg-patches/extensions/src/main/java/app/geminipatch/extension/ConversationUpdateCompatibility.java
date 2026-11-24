package app.geminipatch.extension;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Locale;
import java.util.Objects;

/**
 * Google 17.72.17.ve.arm64 only: drop the recognized "Conversation requires an update" punt from
 * history and reply responses. Any other warning, behavior or unexpected schema keeps the original.
 */
public final class ConversationUpdateCompatibility {
    private static final String TITLE = "conversation requires an update";
    private static final String BODY = "this conversation was created with a newer version of gemini";

    private ConversationUpdateCompatibility() {}

    public static Object filter(Object original) {
        if (original == null || !original.getClass().getName().equals("gffq")) return original;
        return filterPunt(original, "d", 1);
    }

    public static Object filterStream(Object original) {
        if (original == null || !original.getClass().getName().equals("gfeh")) return original;
        try {
            Object value = original;
            Class<?> type = original.getClass();
            if ((type.getField("b").getInt(value) & 512) != 0 && type.getField("p").get(value) != null) value = filterPunt(value, "p", 512);
            if ((type.getField("b").getInt(value) & 1024) != 0 && type.getField("q").get(value) != null) value = filterPunt(value, "q", 1024);
            return value;
        } catch (Throwable ignored) {
            return original;
        }
    }

    private static Object filterPunt(Object original, String field, int bit) {
        try {
            ClassLoader loader = original.getClass().getClassLoader();
            Class<?> type = original.getClass();
            Object punt = type.getField(field).get(original);
            int mask = type.getField("b").getInt(original);
            if ((mask & bit) == 0 || punt == null || !punt.getClass().getName().equals("ghto")) return original;
            Class<?> puntType = punt.getClass();
            if (puntType.getField("f").getInt(punt) != 1) return original;
            String title = (String) puntType.getField("b").get(punt);
            String body = (String) puntType.getField("c").get(punt);
            if (title == null || body == null || title.length() > 4096 || body.length() > 4096) return original;
            if (!title.trim().toLowerCase(Locale.ROOT).equals(TITLE) || !body.toLowerCase(Locale.ROOT).contains(BODY)) return original;

            Class<?> lite = loader.loadClass("gtpr");
            Class<?> builderType = loader.loadClass("gtpj");
            Object builder = lite.getMethod("toBuilder").invoke(original);
            builderType.getMethod("copyOnWrite").invoke(builder);
            Field instance = builderType.getDeclaredField("instance");
            instance.setAccessible(true);
            Object mutable = instance.get(builder);
            type.getField("b").setInt(mutable, mask & ~bit);
            type.getField(field).set(mutable, null);
            Object result = builderType.getMethod("build").invoke(builder);

            // Only the warning may change; the received response itself stays untouched.
            if (type.getField("b").getInt(original) != mask || type.getField(field).get(original) != punt
                    || type.getField("b").getInt(result) != (mask & ~bit) || type.getField(field).get(result) != null) return original;
            for (Field f : type.getFields()) {
                if (Modifier.isStatic(f.getModifiers()) || f.getName().equals("b") || f.getName().equals(field)) continue;
                if (!Objects.equals(f.get(original), f.get(result))) return original;
            }
            return result;
        } catch (Throwable ignored) {
            return original;
        }
    }
}
