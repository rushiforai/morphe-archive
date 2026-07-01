package app.morphe.extension.aliexpress.patches;

@SuppressWarnings("unused")
public final class SecurityBypass {

    public static boolean shouldAllowLogin() {
        return true;
    }

    public static boolean isPackageValid() {
        return true;
    }
}
