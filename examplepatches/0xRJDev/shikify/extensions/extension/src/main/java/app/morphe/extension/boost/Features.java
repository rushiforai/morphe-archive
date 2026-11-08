package app.morphe.extension.boost;

/** Each returns true only when its patch was selected, so Settings shows only what is present. */
public final class Features {
    private Features() { }
    public static boolean parallelLoading() { return false; }
    public static boolean requestQueue() { return false; }
    public static boolean instantLogin() { return false; }
    public static boolean firstPage() { return false; }
    public static boolean onlineCheck() { return false; }
    public static boolean notices() { return false; }
    public static boolean dialogs() { return false; }
    public static boolean flairs() { return false; }
    public static boolean search() { return false; }
}
