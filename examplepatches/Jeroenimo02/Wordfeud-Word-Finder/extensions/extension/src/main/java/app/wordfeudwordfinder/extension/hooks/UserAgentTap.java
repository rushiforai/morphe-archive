package app.wordfeudwordfinder.extension.hooks;

/** Remembers the User-Agent the app sets on its Cronet engine. */
public final class UserAgentTap {
    private static volatile String userAgent;

    private UserAgentTap() {
    }

    public static void set(String ua) {
        try {
            if (ua != null) userAgent = ua;
        } catch (Throwable ignored) {
            // hooks never change app behaviour
        }
    }

    public static String get() {
        return userAgent;
    }
}
