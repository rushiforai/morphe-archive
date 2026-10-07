package app.anghamiplus.extension;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class LyricsUrlHook {
    private static final String LYRICS_SID = "i7%3Adjffifhle%3Ap34o585p4qn3nqon%3Aeceidcchdhdjei%3ART%3Alkc%3Ara%3An8.0.28%3A4%3A%3An8.0.28%3A0%3Ann%3A22435q6326";

    public static Object getUrl(Object request) {
        if (request == null) {
            return null;
        }
        try {
            Field urlField = request.getClass().getDeclaredField("url");
            urlField.setAccessible(true);
            Object url = urlField.get(request);
            if (url == null) {
                return null;
            }

            String urlStr = url.toString().toLowerCase();
            if (urlStr.contains("getlyrics.view")) {
                Method newBuilderMethod = url.getClass().getMethod("newBuilder");
                Object builder = newBuilderMethod.invoke(url);
                Method setParamMethod = builder.getClass().getMethod("setEncodedQueryParameter", String.class, String.class);
                setParamMethod.invoke(builder, "sid", LYRICS_SID);
                Method buildMethod = builder.getClass().getMethod("build");
                return buildMethod.invoke(builder);
            }
            return url;
        } catch (Throwable t) {
            try {
                Field urlField = request.getClass().getDeclaredField("url");
                urlField.setAccessible(true);
                return urlField.get(request);
            } catch (Throwable ignored) {
                return null;
            }
        }
    }
}
