package app.fbpatches.extension.facebook.coexist;

@SuppressWarnings("unused")
public final class SharedPermissions {
    private static final String FACEBOOK_PREFIX = "com.facebook.";
    /** Keep in sync with RENAMED_PREFIX in SharedPermissions.kt. */
    private static final String RENAMED_PREFIX = "app.justalurker.";

    private SharedPermissions() {
    }

    /**
     * Injection point. Answers the name this patched build declares for one of Facebook's shared
     * permissions. Every other string is returned unchanged.
     */
    public static String name(String name) {
        if (!isShared(name)) return name;
        return RENAMED_PREFIX + name.substring(FACEBOOK_PREFIX.length());
    }

    private static boolean isShared(String name) {
        if (name == null || !name.startsWith(FACEBOOK_PREFIX)) return false;
        return name.equals("com.facebook.permission.prod.FB_APP_COMMUNICATION")
            || name.equals("com.facebook.receiver.permission.ACCESS")
            || name.equals("com.facebook.permission.%s.FB_APP_COMMUNICATION");
    }
}
