package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

/**
 * Opens settings and restart on installs whose manifest changes never reached PackageManager, such as
 * Morphe's Root Mount. There the patched app component factory creates HushMessenger's screens in place of
 * two stock activities, and settings start from Messenger's Application instead of SettingsProvider.
 */
public final class HostScreens {
    static final String EXTRA = "app.hushmessenger.screen";
    static final String SETTINGS = "settings";
    static final String RESTART = "restart";
    /** Plain stock activity the screens run in: not exported, with no theme, task affinity or launch mode of its own. */
    static final String SCREEN_HOST = "com.facebook.messaging.about.preference.NeueAboutPreferenceActivity";
    /**
     * Launcher shortcuts start here. Android clears the task a static shortcut starts in, and this see-through
     * stock activity has no task affinity, so Messenger's own task is left alone.
     */
    static final String SHORTCUT_HOST = "com.facebook.zero.upsell.activity.ZeroUpsellBuyConfirmInterstitialActivity";

    private static volatile Application application;
    /** Settings and CrashGuard have started in this process, from SettingsProvider, a settings screen or a hook. */
    static volatile boolean started;
    /** Starting threw, so safe mode is unknown. Every control stays stock until Messenger restarts, with no retries. */
    static volatile boolean failed;

    private HostScreens() {}

    /** The patched factory hands over Messenger's Application here, just before Android attaches it. */
    public static void applicationCreated(Application app) {
        application = app;
    }

    /** The patched factory asks this first; a result replaces the stock activity it was about to create. */
    public static Activity activityFor(String className, Intent intent) {
        if (intent == null || !(SCREEN_HOST.equals(className) || SHORTCUT_HOST.equals(className))) return null;
        try {
            // Android sets this right after the factory returns. Reading extras without it would drop a stock launch's
            // own Parcelables on Android 12 and older.
            intent.setExtrasClassLoader(HostScreens.class.getClassLoader());
            String screen = intent.getStringExtra(EXTRA);
            if (!SETTINGS.equals(screen) && !RESTART.equals(screen)) return null;
            if (SHORTCUT_HOST.equals(className)) return new ShortcutTrampoline();
            return SETTINGS.equals(screen) ? new SettingsActivity() : new RestartActivity();
        } catch (RuntimeException error) {
            Log.e("HushMessenger", "Can't open a HushMessenger screen", error);
            return null;
        }
    }

    /** Controls the patch recorded in the app itself. The patch rewrites this; the extension alone has none. */
    static String bundledControls() {
        return "";
    }

    /**
     * Starts settings when SettingsProvider never ran, as on a Root Mount install. Only in Messenger's main process,
     * the one SettingsProvider runs in, so the other processes stay stock the way they are on a normal install.
     */
    static void initializeLate() {
        if (started || failed) return;
        Application app = application;
        if (app == null || app.getBaseContext() == null || !app.getPackageName().equals(Application.getProcessName())) return;
        start(app);
    }

    /**
     * Settings, then CrashGuard, once per process. Hooks on other threads wait here until safe mode is known, and a
     * settings screen that starts the process runs CrashGuard the same way SettingsProvider does.
     */
    static void start(Context context) {
        synchronized (HostScreens.class) {
            if (started || failed) return;
            try {
                if (Settings.preferences == null) Settings.initialize(context);
                CrashGuard.onProcessStart(context);
                started = true;
            } catch (RuntimeException error) {
                failed = true;
                Log.e("HushMessenger", "Can't start settings", error);
            }
        }
    }

    /** True when PackageManager doesn't know HushMessenger's own activities, as on a Root Mount install. */
    static boolean hosted(Context context) {
        Intent settings = new Intent().setClassName(context.getPackageName(), SettingsActivity.class.getName());
        return context.getPackageManager().resolveActivity(settings, 0) == null;
    }

    /** The installed screen when PackageManager knows it, otherwise the same screen inside the stock host. */
    static Intent intentFor(Context context, String screen) {
        boolean settings = SETTINGS.equals(screen);
        Intent intent = new Intent().setClassName(context.getPackageName(),
            (settings ? SettingsActivity.class : RestartActivity.class).getName());
        if (hosted(context)) {
            intent = new Intent().setClassName(context.getPackageName(), SCREEN_HOST).putExtra(EXTRA, screen);
            // The host shares Messenger's task affinity; a document task keeps settings apart like the real one.
            if (settings) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT);
        }
        // Settings always get their own task, as the real activity's task affinity gives them.
        if (settings || !(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return intent;
    }

    static void open(Context context, String screen) {
        context.startActivity(intentFor(context, screen));
    }

    /** Runs for a launcher shortcut: opens the screen the right way for this install and closes without drawing. */
    static final class ShortcutTrampoline extends Activity {
        @Override @SuppressWarnings("deprecation") protected void onCreate(Bundle state) {
            super.onCreate(state);
            try {
                open(this, getIntent().getStringExtra(EXTRA));
            } catch (RuntimeException error) {
                Log.e("HushMessenger", "Can't open a HushMessenger screen", error);
            }
            finish();
            overridePendingTransition(0, 0);
        }
    }
}
