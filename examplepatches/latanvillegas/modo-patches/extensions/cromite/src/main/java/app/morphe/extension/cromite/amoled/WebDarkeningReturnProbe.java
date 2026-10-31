package app.morphe.extension.cromite.amoled;

import android.util.Log;

/**
 * Read-only probe of Chromium's actual force-dark decision return.
 * Enabled only by installing the separate, default-disabled Morphe patch.
 * No URLs, origins, browsing history or WebContents identifiers are logged.
 */
public final class WebDarkeningReturnProbe {
    private static final String TAG = "CromiteDarkReturn";
    private static final int MAX_EVENTS = 64;
    private static int events;

    private WebDarkeningReturnProbe() {}

    public static void observe(boolean enabled) {
        synchronized (WebDarkeningReturnProbe.class) {
            if (events >= MAX_EVENTS) return;
            events++;
            Log.i(TAG, "isForceDarkWebContentEnabled=" + enabled
                    + " sample=" + events + "/" + MAX_EVENTS);
        }
    }
}
