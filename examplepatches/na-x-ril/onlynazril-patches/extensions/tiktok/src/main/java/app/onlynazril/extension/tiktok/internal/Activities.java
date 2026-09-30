package app.onlynazril.extension.tiktok.internal;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;

/** The Activity behind a view's context, when the chain leads to one. */
public final class Activities {
    private Activities() {}

    public static Activity of(Context context) {
        Context current = context;
        for (int i = 0; i < 10 && current instanceof ContextWrapper; i++) {
            if (current instanceof Activity) return (Activity) current;
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == null || base == current) break;
            current = base;
        }
        return current instanceof Activity ? (Activity) current : null;
    }
}
