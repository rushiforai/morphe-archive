package app.template.extension.extension;

import java.lang.reflect.Field;

/**
 * Blocks "Pendragon" popup ads (fullscreen promotions shown when opening the
 * app).
 *
 * The message requests are RxJava {@code Single}s ending with
 * {@code onErrorReturn(fallback)}. The request is replaced with a
 * {@code Single} that directly emits the fallback, so no message is fetched at
 * all. Chains without a fallback field are returned unchanged.
 */
@SuppressWarnings("unused")
public final class SpotifyPopupAdFilter {
    private static final String RX_FUNCTION = "io.reactivex.rxjava3.functions.Function";
    private static final String RX_SINGLE = "io.reactivex.rxjava3.core.Single";

    private SpotifyPopupAdFilter() {
    }

    /**
     * Injection point: return value of the Pendragon fetch message (list)
     * request methods.
     */
    public static Object replaceRequest(Object single) {
        if (single == null || !single.getClass().getName().endsWith("SingleOnErrorReturn")) return single;

        try {
            ClassLoader classLoader = single.getClass().getClassLoader();
            Class<?> functionClass = Class.forName(RX_FUNCTION, false, classLoader);
            Field fallbackField = SpotifyReflection.findFirstFieldByType(single.getClass(), functionClass);
            Class<?> singleClass = Class.forName(RX_SINGLE, false, classLoader);

            return SpotifyReflection.findMethod(singleClass, "just", "java.lang.Object")
                    .invoke(null, fallbackField.get(single));
        } catch (Throwable ignored) {
            // Unrecognized chain shape: keep the stock request.
            return single;
        }
    }
}
