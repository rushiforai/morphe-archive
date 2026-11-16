package app.onlynazril.extension.tiktok.feedfilter;

import java.lang.reflect.Method;

/**
 * LIVE videos, rooms and their entry item.
 * <p>
 * The signal is the app's own `AwemeSaaSExtKt.isLive(Aweme)`, a real-named helper. It is resolved
 * once and then invoked reflectively, because the extension is compiled without the app classes.
 * A build that loses the helper simply stops matching instead of removing anything else.
 */
public final class LiveFilter implements IFilter {
    private static Method isLive;
    private static boolean resolved;

    @Override
    public boolean shouldRemove(Object item) {
        if (item == null) return false;
        Method method = method();
        if (method == null) return false;
        try {
            return Boolean.TRUE.equals(method.invoke(null, item));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Method method() {
        if (resolved) return isLive;
        resolved = true;
        try {
            Class<?> type = Class.forName("com.ss.android.ugc.aweme.feed.model.AwemeSaaSExtKt");
            for (Method candidate : type.getDeclaredMethods()) {
                if (!candidate.getName().equals("isLive") || candidate.getParameterCount() != 1) {
                    continue;
                }
                candidate.setAccessible(true);
                isLive = candidate;
                break;
            }
        } catch (Throwable ignored) {
            // No helper on this build: the filter stays inert.
        }
        return isLive;
    }

    @Override
    public String reason(Object item) {
        return "live";
    }
}
