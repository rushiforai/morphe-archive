package app.afterglow.extension.navigation;

/** Test-local preferences: the installed app's settings are never read or modified. */
final class Gate {
    static final String TAB_BAR = "tabBar";
    static boolean installed = true, removeLabels;
    static boolean installed(String patch) { return installed; }
    static boolean on(String patch, String key) {
        return installed && key.equals("removeLabels") && removeLabels;
    }
}
