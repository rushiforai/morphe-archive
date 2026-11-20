package app.morphe.extension.chmate;
// Isolated app_process fixture. Never packaged in the extension.
public final class Haiagaru {
    static android.content.Context context;
    public static android.content.Context applicationContextForExtension() { return context; }
    static boolean enabled;
    static boolean full = false;
    static int warningMode = 1;
    static boolean collapsible;
    static boolean card;
    static boolean actions;
    public static boolean xPostPreviewActions() { return actions; }
    public static boolean xPostPreviewBrowser() { return true; }
    public static boolean xPostPreviewEnabled() { return enabled; }
    public static boolean xPostPreviewFullText() { return full; }
    public static int xPostWarningThresholdMode() { return warningMode; }
    public static int mediaAutoFetchMode() { return 3; }
    public static boolean xPostPreviewCollapsible() { return collapsible; }
    public static boolean xPostPreviewCard() { return card; }
    public static int siteCardMaxPerResponse() { return 2; }
    public static String siteCardExcludedUrls() { return ""; }
}
