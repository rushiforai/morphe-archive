package app.nogoogle.gboard;

import android.content.Context;

/** Resolves the application context lazily (patched code paths often only have a resolver). */
final class ContextHolder {
    static volatile Context context;

    private ContextHolder() {
    }

    static Context get() {
        Context c = context;
        if (c != null) return c;
        try {
            c = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            context = c;
        } catch (Throwable ignored) {
        }
        return c;
    }
}
