package app.jofslash.extension.quora;

/** Test stand-in: the settings page is Android UI, which the page script tests don't build. */
final class SettingsPage {
    static void open(android.app.Activity activity, android.content.SharedPreferences prefs) {
    }

    static void reader(android.content.Context context, String title, String author, String body, String images, boolean preview) {
    }
}
