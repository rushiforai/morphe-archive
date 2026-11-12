package app.morphe.extension.chmate;

import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.net.URI;
import java.util.Locale;

/** Rewrites only the outgoing copy of an external-board post. */
final class ExternalEmojiPost {
    private ExternalEmojiPost() {
    }

    static Object prepare(Object postData) {
        if (postData == null) return null;
        try {
            Class<?> type = postData.getClass();
            boolean preIo = type.getName().equals("o.setBorderWidth");
            if (!preIo && !type.getName().equals("jp.syoboi.a2chMate.postdata.PostData")) {
                return postData;
            }
            String[] fields = preIo
                    ? new String[]{"n", "f", "b", "a", "h", "e", "l", "g", "c", "j", "i"}
                    : new String[]{"c", "d", "e", "a", "b", "i", "f", "j", "g", "h", "n"};
            // 243 shuffles the obfuscated fields while keeping the same
            // constructor layout. Select the layout from its exact field types.
            if (!preIo && hasField(type, "m")) {
                fields = new String[]{"c", "e", "a", "d", "b", "j", "g", "i", "h", "f", "m"};
            } else if(!preIo && type.getDeclaredField("n").getType()==String.class
                    && type.getDeclaredField("i").getType()==long.class && type.getDeclaredField("j").getType()==long.class){
                // 242: preserve constructor order, including both timestamp longs.
                fields=new String[]{"n","f","a","c","g","d","i","j","b","e","h"};
            }
            Object[] values = new Object[11];
            for (int index = 0; index < fields.length; index++) {
                Field field = type.getDeclaredField(fields[index]);
                field.setAccessible(true);
                values[index] = field.get(postData);
            }
            String body = (String) values[4];
            String converted = prepareBody((String) values[0], body);
            if (java.util.Objects.equals(converted,body)) return postData;
            values[4] = converted;
            Constructor<?> constructor = type.getDeclaredConstructor(
                    String.class, String.class, String.class, String.class,
                    String.class, String.class, long.class, long.class,
                    String.class, String.class, String.class);
            constructor.setAccessible(true);
            return constructor.newInstance(values);
        } catch (Throwable error) {
            Log.w("Haiagaru", "Unable to prepare external-board emoji post", error);
            return postData;
        }
    }

    static String encodeMarkers(String body) {
        if (body == null || body.isEmpty()) return body;
        return body.replace("\ufe0f", "&#65039;").replace("\u200d", "&#8205;");
    }

    static String prepareBody(String url, String body) {
        body=EmojiTextCleanup.apply(OutgoingPostCleanup.apply(body));
        return isExternalUrl(url) ? encodeMarkers(body) : body;
    }

    private static boolean isExternalUrl(String value) {
        if (value == null) return false;
        try {
            String host = new URI(value).getHost();
            if (host == null) return false;
            host = host.toLowerCase(Locale.ROOT);
            return !host.endsWith(".5ch.io") && !host.endsWith(".5ch.net")
                    && !host.endsWith(".2ch.net") && !host.endsWith(".2ch.sc")
                    && !host.equals("talk.jp") && !host.endsWith(".talk.jp");
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static String stringField(Class<?> type, Object object, String name) throws Exception {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return (String) field.get(object);
    }

    private static boolean hasField(Class<?> type, String name) {
        try {
            type.getDeclaredField(name);
            return true;
        } catch (NoSuchFieldException ignored) {
            return false;
        }
    }
}
