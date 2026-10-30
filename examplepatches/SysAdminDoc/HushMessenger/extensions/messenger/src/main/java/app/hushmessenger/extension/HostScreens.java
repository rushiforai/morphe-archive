package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.os.Bundle;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;

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
    static final String CONTROLS_SHORTCUT = "hushmessenger_dynamic_controls";
    static final String RESTART_SHORTCUT = "hushmessenger_dynamic_restart";

    private static volatile Application application;
    /** Settings and CrashGuard have started in this process, from SettingsProvider, a settings screen or a hook. */
    static volatile boolean started;
    /** Starting threw, so safe mode is unknown. Every control stays stock until Messenger restarts, with no retries. */
    static volatile boolean failed;

    private HostScreens() {}

    /** The patched factory hands over Messenger's Application here, just before Android attaches it. */
    public static void applicationCreated(Application app) {
        application = app;
        try {
            if (Settings.bundled(bundledControls()).contains(ChatAnimation.KEY)) ChatAnimation.register(app);
        } catch (RuntimeException error) {
            Log.e("HushMessenger", "Can't watch for chats opening", error);
        }
        try {
            if (app != null) SettingsReopen.watch(app);
        } catch (RuntimeException error) {
            Log.e("HushMessenger", "Can't watch for the first screen after a restart", error);
        }
        try {
            if (app != null) app.registerActivityLifecycleCallbacks(new LeavingMessenger());
        } catch (RuntimeException error) {
            Log.e("HushMessenger", "Can't watch for Messenger leaving the screen", error);
        }
    }

    /**
     * Messenger's conversation shortcuts push Patch controls and Restart Messenger down the icon's long-press menu while
     * it runs, and the launcher shows only the top four. Leaving Messenger is when someone can reach that menu, so the
     * pair goes back on top then. A rotation comes straight back, so it doesn't count.
     */
    static final class LeavingMessenger implements Application.ActivityLifecycleCallbacks {
        private int shown;

        @Override public void onActivityStarted(Activity activity) { shown++; }

        @Override public void onActivityStopped(Activity activity) {
            shown = Math.max(0, shown - 1);
            if (shown == 0 && started && !failed && !activity.isChangingConfigurations()) refreshShortcuts(activity);
        }

        @Override public void onActivityCreated(Activity activity, Bundle state) {}
        @Override public void onActivityResumed(Activity activity) {}
        @Override public void onActivityPaused(Activity activity) {}
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        @Override public void onActivityDestroyed(Activity activity) {}
    }

    /** Restart, remembering [page] so settings come back on it once Messenger is up again. */
    static void restartInto(Context context, String page) {
        context.startActivity(intentFor(context, RESTART).putExtra(SettingsReopen.EXTRA, SettingsReopen.page(page)));
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
     * The Messenger build the patch started from, "585.0.0.53.94|347015062|base": version name, version code and the
     * mapping its hooks came from. The patch rewrites this, so it holds on Root Mount installs and under Spoof package
     * version, where Android's version code says something else. The extension alone has none.
     */
    static String originalBuild() {
        return "";
    }

    /** Rewritten only when the native notification, shortcut and activity routes have been validated together. */
    static boolean nativeBubbleRoutes() { return false; }

    /** Rewritten together after the Main inbox, native folder and subscribed-channel routes are proved. */
    static boolean isJoinedCommunityRow(Object row) { return false; }
    static boolean isMainInboxScope(Object callback, Object filter) { return false; }

    /** Rewritten with the chat list supplier's subscribe call and listed count once the patch proves both. */
    static String inboxRefreshRoute() {
        return "";
    }

    /** Rewritten with Messenger's own Log out, "Lowner;->name(Landroid/content/Context;)V", once the patch proves it (#88). */
    static String logoutRoute() {
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
        long began = android.os.SystemClock.elapsedRealtime();
        start(app);
        if (lateStart == null) lateStart = (android.os.SystemClock.elapsedRealtime() - began) + " ms on " + Thread.currentThread().getName();
        // SettingsProvider does this on every other install. The first hook to ask runs this, often on the UI thread, so
        // the shortcut calls go to their own thread.
        if (started) refreshShortcuts(app);
    }

    /**
     * How long the late start held up the hook that asked first, and on which thread, for Copy setup. Null when
     * SettingsProvider started settings, which is every install but Root Mount.
     */
    static volatile String lateStart;

    /**
     * Where the launcher shortcuts get published: one refresh at a time, so turning Hide the icon shortcuts on and
     * straight off again lands in that order. The thread ends once it's idle. Tests run it in place.
     */
    static java.util.concurrent.Executor shortcutWork = new java.util.concurrent.ThreadPoolExecutor(0, 1, 10,
        java.util.concurrent.TimeUnit.SECONDS, new java.util.concurrent.LinkedBlockingQueue<>(), work -> {
            Thread thread = new Thread(work, "HushShortcuts");
            thread.setDaemon(true);
            return thread;
        });

    /**
     * Brings the launcher shortcuts in line with Hide the icon shortcuts, off the calling thread. Each process start
     * and each time Messenger leaves the screen runs it, since Android keeps them between runs and Messenger's own can
     * push them out.
     */
    static void refreshShortcuts(Context context) {
        refreshShortcuts(context, null);
    }

    /** The same, and {@code done} runs on that thread once the shortcuts are in line. */
    static void refreshShortcuts(Context context, Runnable done) {
        Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        shortcutWork.execute(() -> {
            publishShortcuts(app);
            if (done != null) done.run();
        });
    }

    /**
     * Patch controls and Restart Messenger are dynamic shortcuts on every install, so Hide the icon shortcuts can take
     * them off the icon's long-press menu: Android never lets an app hide the static ones in its manifest, and never
     * reads those on a Root Mount install at all. Messenger's conversation shortcuts can push them out or down, so each
     * start puts back what's missing or has slipped behind. Off, they leave, and a copy pinned to the home screen turns
     * gray until they're back.
     */
    static void publishShortcuts(Context context) {
        boolean changed = false;
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            List<String> ours = java.util.Arrays.asList(CONTROLS_SHORTCUT, RESTART_SHORTCUT);
            java.util.Map<String, ShortcutInfo> published = published(manager, ours);
            List<String> pinnedOn = new ArrayList<>(), pinnedOff = new ArrayList<>();
            for (ShortcutInfo shortcut : manager.getPinnedShortcuts())
                if (ours.contains(shortcut.getId())) (shortcut.isEnabled() ? pinnedOn : pinnedOff).add(shortcut.getId());
            if (!Settings.iconShortcutsShown(context)) {
                changed = !published.isEmpty() || !pinnedOn.isEmpty();
                if (!published.isEmpty()) manager.removeDynamicShortcuts(new ArrayList<>(published.keySet()));
                if (!pinnedOn.isEmpty()) manager.disableShortcuts(pinnedOn, new SettingsText(context).get("shortcut_turned_off"));
                return;
            }
            changed = !pinnedOff.isEmpty();
            if (!pinnedOff.isEmpty()) manager.enableShortcuts(pinnedOff);
            android.content.ComponentName launcher = messengerLauncher(context);
            if (!inPlace(published, ours, launcher)) {
                // Android numbers an icon's shortcuts again after every change, and among equal ranks it puts the ones just
                // added first, in the order they came. Rank 1 would tie with Messenger's own second shortcut and land third,
                // so both go in at rank 0, together, and come out as the top two.
                changed = true;
                // Removing isn't held back while Android turns adds down for a while, so room is made only for an add
                // it will take.
                if (launcher != null && !manager.isRateLimitingActive()) makeRoom(manager, launcher, ours);
                manager.addDynamicShortcuts(List.of(
                    shortcut(context, CONTROLS_SHORTCUT, "Patch controls", SETTINGS, android.R.drawable.ic_menu_preferences, launcher),
                    shortcut(context, RESTART_SHORTCUT, "Restart Messenger", RESTART, android.R.drawable.ic_popup_sync, launcher)));
            }
        } catch (RuntimeException error) {
            // A rate limit or launcher refusal leaves the Menu tab and side menu rows as the way in.
            Log.w("HushMessenger", "Can't add HushMessenger's launcher shortcuts", error);
        } finally {
            // The Menu row asks whether Patch controls is there, so a change has to be read again.
            if (changed) controlsShortcut = null;
        }
    }

    /** Which of [ours] are published, by id. */
    private static java.util.Map<String, ShortcutInfo> published(ShortcutManager manager, List<String> ours) {
        java.util.Map<String, ShortcutInfo> published = new java.util.HashMap<>();
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts())
            if (ours.contains(shortcut.getId())) published.put(shortcut.getId(), shortcut);
        return published;
    }

    /** Each of [ours] sits at its own place from the top of Messenger's icon. */
    private static boolean inPlace(java.util.Map<String, ShortcutInfo> published, List<String> ours,
            android.content.ComponentName launcher) {
        for (int rank = 0; rank < ours.size(); rank++) {
            ShortcutInfo shortcut = published.get(ours.get(rank));
            if (shortcut == null || shortcut.getRank() != rank || (launcher != null && !launcher.equals(shortcut.getActivity()))) return false;
        }
        return true;
    }

    /**
     * Messenger's own shortcut writes come here. It pushes a conversation shortcut on top of its icon for each message
     * that arrives, in the background too, so a few chats moved Restart Messenger and then Patch controls past the four
     * rows the launcher shows until Messenger next left the screen. Each write runs exactly as Messenger made it, then
     * the pair goes back on top.
     */
    public static void messengerPushed(ShortcutManager manager, ShortcutInfo shortcut) {
        Api30.push(manager, shortcut);
        keepOnTop();
    }

    /**
     * Android 11's push lives here, so Android 9 and 10 verify HostScreens without a method they don't have. Messenger
     * pushes only on Android 11 and up, where this is its own call.
     */
    static final class Api30 {
        private Api30() {}

        static void push(ShortcutManager manager, ShortcutInfo shortcut) {
            if (android.os.Build.VERSION.SDK_INT >= 30) manager.pushDynamicShortcut(shortcut);
        }
    }

    /** The same after Messenger adds shortcuts. Messenger gets its own answer back. */
    public static boolean messengerAdded(ShortcutManager manager, List<ShortcutInfo> shortcuts) {
        boolean added = manager.addDynamicShortcuts(shortcuts);
        keepOnTop();
        return added;
    }

    /** The same after Messenger replaces its shortcuts, which takes the pair off. */
    public static boolean messengerSet(ShortcutManager manager, List<ShortcutInfo> shortcuts) {
        boolean set = manager.setDynamicShortcuts(shortcuts);
        keepOnTop();
        return set;
    }

    private static void keepOnTop() {
        Application app = application;
        // Android 9 and 10 have no push, so the pair waits for the next start or leave there.
        if (app == null || android.os.Build.VERSION.SDK_INT < 30) return;
        try {
            shortcutWork.execute(() -> putBackOnTop(app));
        } catch (RuntimeException error) {
            Log.w("HushMessenger", "Can't put HushMessenger's launcher shortcuts back on top", error);
        }
    }

    /**
     * Pushes rather than adds: Android takes a push at any time, while each add from an app in the background counts
     * against an allowance Messenger's own share targets need. A push lands on top, so Restart Messenger goes first.
     * A full icon drops its lowest shortcut for one that's missing, as it does for Messenger's.
     */
    static void putBackOnTop(Context context) {
        if (!started || failed) return;
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null || !Settings.iconShortcutsShown(context)) return;
            List<String> ours = java.util.Arrays.asList(CONTROLS_SHORTCUT, RESTART_SHORTCUT);
            android.content.ComponentName launcher = messengerLauncher(context);
            if (inPlace(published(manager, ours), ours, launcher)) return;
            Api30.push(manager, shortcut(context, RESTART_SHORTCUT, "Restart Messenger", RESTART, android.R.drawable.ic_popup_sync, launcher));
            Api30.push(manager, shortcut(context, CONTROLS_SHORTCUT, "Patch controls", SETTINGS, android.R.drawable.ic_menu_preferences, launcher));
            controlsShortcut = null;
        } catch (RuntimeException error) {
            Log.w("HushMessenger", "Can't put HushMessenger's launcher shortcuts back on top", error);
        }
    }

    /**
     * Android turns down the whole add when it would put more than its limit on one icon, counting the manifest's
     * shortcuts and the published ones, and Messenger's conversation shortcuts can fill that. Its lowest-ranked ones on
     * the icon make room, the same ones Android drops when Messenger pushes one past the limit itself.
     */
    private static void makeRoom(ShortcutManager manager, android.content.ComponentName launcher, List<String> ours) {
        int count = ours.size();
        for (ShortcutInfo shortcut : manager.getManifestShortcuts())
            if (launcher.equals(shortcut.getActivity())) count++;
        List<ShortcutInfo> theirs = new ArrayList<>();
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts())
            if (launcher.equals(shortcut.getActivity()) && !ours.contains(shortcut.getId())) theirs.add(shortcut);
        int over = count + theirs.size() - manager.getMaxShortcutCountPerActivity();
        if (over <= 0) return;
        theirs.sort((a, b) -> Integer.compare(b.getRank(), a.getRank()));
        List<String> dropped = new ArrayList<>();
        for (int i = 0; i < over && i < theirs.size(); i++) dropped.add(theirs.get(i).getId());
        manager.removeDynamicShortcuts(dropped);
    }

    /**
     * Messenger's own icon in the launcher, so the shortcuts show on it and not on the HushMessenger settings icon in
     * the app drawer, which Android could otherwise pick. Null leaves the choice to Android. The query names only
     * Messenger's own package, which Android 11+ never hides from it.
     */
    @android.annotation.SuppressLint("QueryPermissionsNeeded")
    private static android.content.ComponentName messengerLauncher(Context context) {
        Intent launcher = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(context.getPackageName());
        for (android.content.pm.ResolveInfo entry : context.getPackageManager().queryIntentActivities(launcher, 0)) {
            if (entry.activityInfo == null || SettingsActivity.DRAWER_ALIAS.equals(entry.activityInfo.name)) continue;
            return new android.content.ComponentName(entry.activityInfo.packageName, entry.activityInfo.name);
        }
        return null;
    }

    /** Whether Patch controls is on the launcher's long-press menu, and when that was read. Null until asked. */
    static volatile Boolean controlsShortcut;
    static volatile long controlsShortcutAt;
    /**
     * Messenger's conversation shortcuts can push Patch controls out while Messenger runs, so an answer holds only this
     * long. The Menu row then comes back on the next build of the Menu tab or side menu.
     */
    static final long SHORTCUT_ANSWER_MS = 30_000;

    /** The dynamic Patch controls shortcut. A failed read counts as missing. */
    static boolean controlsShortcutPresent(Context context) {
        Boolean known = controlsShortcut;
        if (known != null && android.os.SystemClock.elapsedRealtime() - controlsShortcutAt < SHORTCUT_ANSWER_MS) return known;
        if (context == null) return false;
        boolean present = false;
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager != null) {
                for (ShortcutInfo shortcut : manager.getDynamicShortcuts())
                    if (CONTROLS_SHORTCUT.equals(shortcut.getId()) && shortcut.isEnabled()) present = true;
            }
        } catch (RuntimeException error) {
            Log.w("HushMessenger", "Can't read HushMessenger's launcher shortcuts", error);
        }
        controlsShortcutAt = android.os.SystemClock.elapsedRealtime();
        controlsShortcut = present;
        return present;
    }

    /**
     * Tells the launcher a shortcut was used, so it ranks it and doesn't drop it first when Messenger's conversation
     * shortcuts crowd the long-press menu. A launch from a shortcut that's no longer published reports nothing.
     */
    static void reportShortcutUsed(Context context, String screen) {
        String id = SETTINGS.equals(screen) ? CONTROLS_SHORTCUT : RESTART.equals(screen) ? RESTART_SHORTCUT : null;
        if (id == null) return;
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
                if (id.equals(shortcut.getId())) {
                    manager.reportShortcutUsed(id);
                    return;
                }
            }
        } catch (RuntimeException error) {
            Log.w("HushMessenger", "Can't tell the launcher a shortcut was used", error);
        }
    }

    /** Starts the see-through stock host, so ShortcutTrampoline opens the screen the right way for this install. */
    private static ShortcutInfo shortcut(Context context, String id, String label, String screen, int icon,
            android.content.ComponentName launcher) {
        Intent intent = new Intent(Intent.ACTION_VIEW).setClassName(context.getPackageName(), SHORTCUT_HOST).putExtra(EXTRA, screen);
        ShortcutInfo.Builder builder = new ShortcutInfo.Builder(context, id).setShortLabel(label).setLongLabel(label)
            .setIcon(picture(context, icon)).setIntent(intent).setRank(0);
        if (launcher != null) builder.setActivity(launcher);
        return builder.build();
    }

    /**
     * Android's own [icon] drawn into a picture. A dynamic shortcut whose icon is a resource from another package is
     * turned down with "Icon resource must reside in shortcut owner package", and Messenger has no gear of its own.
     */
    static Icon picture(Context context, int icon) {
        android.graphics.drawable.Drawable drawable = context.getDrawable(icon);
        int width = drawable != null && drawable.getIntrinsicWidth() > 0 ? drawable.getIntrinsicWidth() : 96;
        int height = drawable != null && drawable.getIntrinsicHeight() > 0 ? drawable.getIntrinsicHeight() : 96;
        android.graphics.Bitmap bitmap = android.graphics.Bitmap.createBitmap(width, height, android.graphics.Bitmap.Config.ARGB_8888);
        if (drawable != null) {
            drawable.setBounds(0, 0, width, height);
            drawable.draw(new android.graphics.Canvas(bitmap));
        }
        return Icon.createWithBitmap(bitmap);
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
        // Colour hooks can initialize this process while their class initializer is running. Bind after releasing
        // the startup lock so a second startup thread cannot wait on that initializer while it waits on this lock.
        if (started && !failed && Settings.installed.contains("material_you")) MaterialYouTheme.bind();
        // After CrashGuard, so safe mode can keep a picked font file that crashes the font loader from loading again.
        // A native crash in the loader only counts from Android 11, where the exit history records it.
        if (started && !failed && Settings.installed.contains(OwnFont.KEY)
                && context.getPackageName().equals(Application.getProcessName())) OwnFont.warmUp();
        // After CrashGuard too: Bold and Italic sit in every text field's menu, so safe mode has to take them out.
        if (started && !failed && Settings.installed.contains(TextStyleActivity.KEY)
                && context.getPackageName().equals(Application.getProcessName())) TextStyleActivity.watch();
        // Converted copies of picked videos go a day after their last use, switch on or off, without another pick.
        if (started && !failed && Settings.installed.contains(XheAudio.KEY)
                && context.getPackageName().equals(Application.getProcessName())) XheAudio.pruneLater(context);
        // A failed start can't follow the switch, so entries an earlier run left on come out. Settings.installed may
        // never have loaded here, and TextStyleActivity checks the manifest itself.
        if (failed && context.getPackageName().equals(Application.getProcessName())) TextStyleActivity.turnOff(context);
    }

    /** The settings provider's authority is the package name plus this, on a clone install too. */
    static final String SETTINGS_AUTHORITY_SUFFIX = ".hush.settings";

    /** True when Android knows this app's own settings provider under the package name it runs as. */
    static boolean settingsProviderFound(Context context) {
        try {
            String own = context.getPackageName();
            android.content.pm.ProviderInfo provider =
                context.getPackageManager().resolveContentProvider(own + SETTINGS_AUTHORITY_SUFFIX, 0);
            return provider != null && own.equals(provider.packageName) && SettingsProvider.class.getName().equals(provider.name);
        } catch (RuntimeException error) {
            return false;
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
            // The host shares Messenger's task affinity; a document task keeps settings apart like the real one, and the
            // flag keeps that task out of Recents as the real activity's manifest entry does.
            if (settings) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT | Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS);
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
                String screen = getIntent().getStringExtra(EXTRA);
                if (SETTINGS.equals(screen)) start(this);
                // Before opening, since Restart Messenger ends the process.
                reportShortcutUsed(this, screen);
                open(this, screen);
                // Proven only once settings actually opened from it.
                if (SETTINGS.equals(screen)) Settings.noteShortcutUsed();
            } catch (RuntimeException error) {
                Log.e("HushMessenger", "Can't open a HushMessenger screen", error);
            }
            finish();
            overridePendingTransition(0, 0);
        }
    }
}
