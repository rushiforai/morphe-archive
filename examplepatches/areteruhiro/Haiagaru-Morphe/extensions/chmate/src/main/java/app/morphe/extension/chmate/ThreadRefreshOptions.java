package app.morphe.extension.chmate;

import android.content.Context;

/** Runtime choice for restoring ChMate's normal conditional DAT refresh requests. */
public final class ThreadRefreshOptions {
    public static final String KEY = "skipConditionalThreadRefreshValidators";

    /** Keep ChMate's normal conditional/Range refresh as the default. */
    public static boolean skipConditionalHeaders() {
        Context context = Haiagaru.applicationContextForExtension();
        return context != null && context.getSharedPreferences(WacchoiSearchOptions.PREFS,
                Context.MODE_PRIVATE).getBoolean(KEY, false);
    }

    private ThreadRefreshOptions() { }
}
