package app.template.extension.firefoxfocus;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import org.mozilla.geckoview.GeckoResult;
import org.mozilla.geckoview.GeckoSession;
import org.mozilla.geckoview.WebExtension;
import org.mozilla.geckoview.WebExtensionController;

import java.io.FileInputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Entry points of the Firefox Focus "Add-on support" patch. Every method the patch calls is
 * public static, runs on the main thread and never throws into Focus.
 *
 * <ul>
 *   <li>{@link #onApplicationCreate}: FocusApplication.onCreate() entry. Tracks the foreground
 *   Activity (main process only), so prompts and dialogs have a window to attach to.</li>
 *   <li>{@link #wrapPromptDelegate}: WebExtensionController.setPromptDelegate() entry. Android
 *   Components' delegate hands every prompt to a store action Focus never reads, so install,
 *   update and optional-permission prompts would wait forever. The wrapper answers them. The same
 *   call hands us the controller: no GeckoRuntime lookup, no race with GeckoRuntime.create.</li>
 *   <li>{@link #addMenuItems}: BrowserMenu.menuGroupsFor() result. Adds the add-on row (browser
 *   actions and the Extensions manager) to Focus's Compose browser menu, see {@link AddonsMenu}.</li>
 *   <li>{@link #onMenuAction}: MenuMiddleware.invoke() entry. Runs the taps on those entries.</li>
 *   <li>{@link #onOpenPopup}: WebExtension$Action.openPopup() entry. Shows browser action popups.</li>
 * </ul>
 *
 * Every Focus tab is private, so add-ons only work when allowed in private browsing: installs
 * started here grant it, and existing add-ons without it get it at startup.
 */
@SuppressWarnings("unused")
public final class FocusAddons {
    static final String TAG = "Morphe-FocusAddons";

    private static final String PREFS = "morphe_focus_addons";
    private static final String KEY_LAST_UPDATE_CHECK = "last_update_check";
    private static final long UPDATE_INTERVAL_MS = 24L * 60 * 60 * 1000;
    // The update check waits until Focus is on screen, so an update that needs new permissions
    // can ask; the delay keeps it off the cold-start path.
    private static final long UPDATE_DELAY_MS = 15_000L;

    static final Handler MAIN = new Handler(Looper.getMainLooper());

    static Application app;
    static WebExtensionController controller;
    private static WeakReference<Activity> foreground = new WeakReference<>(null);
    private static final Map<Activity, List<Runnable>> destroyActions = new WeakHashMap<>();
    private static boolean updateCheckDue;
    private static boolean updateCheckScheduled;

    private FocusAddons() {
    }

    /** Hook: FocusApplication.onCreate() entry. */
    public static void onApplicationCreate(Application application) {
        try {
            if (application == null || app != null || !isMainProcess(application)) return;
            app = application;
            application.registerActivityLifecycleCallbacks(new ForegroundTracker());
        } catch (Throwable t) {
            Log.e(TAG, "onApplicationCreate", t);
        }
    }

    /** Hook: WebExtensionController.setPromptDelegate(delegate) entry; the result replaces delegate. */
    public static WebExtensionController.PromptDelegate wrapPromptDelegate(
            WebExtensionController webExtensionController, WebExtensionController.PromptDelegate delegate) {
        if (delegate == null || delegate instanceof AddonPromptDelegate) return delegate;
        try {
            boolean first = controller == null;
            controller = webExtensionController;
            if (first) {
                MAIN.post(safely("allowExistingAddonsInPrivateBrowsing",
                        FocusAddons::allowExistingAddonsInPrivateBrowsing));
                MAIN.post(safely("requestIcons", AddonsMenu::requestIcons));
            }
            return new AddonPromptDelegate();
        } catch (Throwable t) {
            Log.e(TAG, "wrapPromptDelegate", t);
            return delegate;
        }
    }

    /** Hook: BrowserMenu.menuGroupsFor(state, icon) before it returns [groups]; adds to it in place. */
    public static void addMenuItems(List<Object> groups, Object browserState) {
        try {
            AddonsMenu.addItems(groups, browserState);
        } catch (Throwable t) {
            Log.e(TAG, "addMenuItems", t);
        }
    }

    /** Hook: MenuMiddleware.invoke(store, next, action) entry, with the menu action. */
    public static void onMenuAction(Object action) {
        try {
            AddonsMenu.onMenuAction(action);
        } catch (Throwable t) {
            Log.e(TAG, "onMenuAction", t);
        }
    }

    /** Hook: WebExtension$Action.openPopup(GeckoResult, String) entry, p1 = the popup session. */
    public static void onOpenPopup(GeckoResult<GeckoSession> popupSession) {
        if (popupSession == null) return;
        try {
            // The original body still sets the extension-popup flag and loads the popup URL.
            popupSession.accept(session -> {
                if (session != null) MAIN.post(safely("showPopup", () -> GeckoViewDialog.showPopup(session)));
            }, error -> Log.w(TAG, "popup session failed", error));
        } catch (Throwable t) {
            Log.e(TAG, "onOpenPopup", t);
        }
    }

    // ---------------------------------------------------------------------------------------

    /** The resumed (on screen), usable Activity, or null. */
    static Activity foregroundActivity() {
        Activity activity = foreground.get();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return null;
        return activity;
    }

    /** [task] for MAIN.post: whatever it throws is logged, never thrown into Focus's looper. */
    static Runnable safely(String what, Runnable task) {
        return () -> {
            try {
                task.run();
            } catch (Throwable t) {
                Log.e(TAG, what, t);
            }
        };
    }

    /**
     * Runs [action] on the main thread when [activity] is destroyed, before its windows are torn
     * down (a dialog's own dismiss listener does not fire then). Returns a Runnable that cancels it.
     */
    static Runnable onDestroyed(Activity activity, Runnable action) {
        List<Runnable> actions = destroyActions.get(activity);
        if (actions == null) {
            actions = new ArrayList<>();
            destroyActions.put(activity, actions);
        }
        actions.add(action);
        List<Runnable> registered = actions;
        return () -> registered.remove(action);
    }

    static boolean isNight(Context context) {
        int mode = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    static void toast(String message) {
        Application application = app;
        if (application == null) return;
        MAIN.post(() -> {
            try {
                Toast.makeText(application, message, Toast.LENGTH_SHORT).show();
            } catch (Throwable t) {
                Log.w(TAG, "toast", t);
            }
        });
    }

    static String describe(Throwable error) {
        if (error == null) return "unknown error";
        String message = error.getMessage();
        return message != null && !message.isEmpty() ? message : error.getClass().getSimpleName();
    }

    static String nameOf(WebExtension extension) {
        if (extension == null) return "Add-on";
        WebExtension.MetaData metaData = extension.metaData;
        if (metaData != null && metaData.name != null && !metaData.name.isEmpty()) return metaData.name;
        return extension.id;
    }

    /**
     * Makes Android Components list the installed add-ons again, so its store and the menu see
     * changes made straight on the controller (private browsing, updates). AC's own debugger
     * delegate does exactly that in onExtensionListUpdated(); the controller keeps it in
     * mDebuggerDelegate.
     */
    static void refreshAndroidComponents() {
        WebExtensionController webExtensionController = controller;
        if (webExtensionController == null) return;
        try {
            Field field = WebExtensionController.class.getDeclaredField("mDebuggerDelegate");
            field.setAccessible(true);
            Object delegate = field.get(webExtensionController);
            if (delegate instanceof WebExtensionController.DebuggerDelegate) {
                ((WebExtensionController.DebuggerDelegate) delegate).onExtensionListUpdated();
            }
        } catch (Throwable t) {
            Log.w(TAG, "refreshAndroidComponents", t);
        }
    }

    /** Runs [done] on the main thread once [count] tasks called [one]. */
    static final class Join {
        private int left;
        private boolean changed;
        private final Runnable done;

        Join(int count, Runnable done) {
            this.left = count;
            this.done = done;
            if (count == 0) done.run();
        }

        void one(boolean changedSomething) {
            changed |= changedSomething;
            if (--left == 0) done.run();
        }

        boolean changed() {
            return changed;
        }
    }

    // ---------------------------------------------------------------------------------------

    /** Startup: every installed add-on (not built-in) must be allowed in private browsing. */
    private static void allowExistingAddonsInPrivateBrowsing() {
        WebExtensionController webExtensionController = controller;
        if (webExtensionController == null) return;
        try {
            webExtensionController.list().accept(extensions -> {
                int count = 0;
                if (extensions != null) {
                    for (WebExtension extension : extensions) {
                        if (needsPrivateBrowsing(extension)) count++;
                    }
                }
                Join[] join = new Join[1];
                join[0] = new Join(count, () -> {
                    if (join[0] != null && join[0].changed()) refreshAndroidComponents();
                    updateCheckDue = true;
                    maybeScheduleUpdateCheck();
                });
                if (count == 0) return;
                for (WebExtension extension : extensions) {
                    if (!needsPrivateBrowsing(extension)) continue;
                    Log.i(TAG, "allowing " + extension.id + " in private browsing");
                    webExtensionController.setAllowedInPrivateBrowsing(extension, true).accept(
                            updated -> join[0].one(true),
                            error -> {
                                Log.w(TAG, "setAllowedInPrivateBrowsing " + extension.id, error);
                                join[0].one(false);
                            });
                }
            }, error -> Log.w(TAG, "list", error));
        } catch (Throwable t) {
            Log.e(TAG, "allowExistingAddonsInPrivateBrowsing", t);
        }
    }

    static boolean needsPrivateBrowsing(WebExtension extension) {
        return extension != null && !extension.isBuiltIn && extension.metaData != null
                && !extension.metaData.allowedInPrivateBrowsing;
    }

    private static SharedPreferences prefs() {
        return app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** At most once per 24 h, once Focus is on screen: check every add-on for an update. */
    private static void maybeScheduleUpdateCheck() {
        if (!updateCheckDue || updateCheckScheduled || app == null || controller == null) return;
        if (foregroundActivity() == null) return;
        try {
            long last = prefs().getLong(KEY_LAST_UPDATE_CHECK, 0L);
            long now = System.currentTimeMillis();
            if (now >= last && now - last < UPDATE_INTERVAL_MS) {
                updateCheckDue = false;
                return;
            }
            updateCheckScheduled = true;
            MAIN.postDelayed(safely("checkForUpdates", FocusAddons::checkForUpdates), UPDATE_DELAY_MS);
        } catch (Throwable t) {
            Log.e(TAG, "maybeScheduleUpdateCheck", t);
        }
    }

    private static void checkForUpdates() {
        updateCheckScheduled = false;
        // Focus left the screen during the delay: an update that needs new permissions could not
        // ask. The check stays due and is scheduled again at the next onActivityResumed.
        if (foregroundActivity() == null) return;
        updateCheckDue = false;
        WebExtensionController webExtensionController = controller;
        if (webExtensionController == null) return;
        try {
            prefs().edit().putLong(KEY_LAST_UPDATE_CHECK, System.currentTimeMillis()).apply();
            webExtensionController.list().accept(extensions -> {
                if (extensions == null) return;
                int count = 0;
                for (WebExtension extension : extensions) {
                    if (extension != null && !extension.isBuiltIn) count++;
                }
                Join[] join = new Join[1];
                join[0] = new Join(count, () -> {
                    if (join[0] != null && join[0].changed()) refreshAndroidComponents();
                });
                for (WebExtension extension : extensions) {
                    if (extension == null || extension.isBuiltIn) continue;
                    webExtensionController.update(extension).accept(updated -> {
                        if (updated != null) Log.i(TAG, "updated " + extension.id);
                        join[0].one(updated != null);
                    }, error -> {
                        Log.w(TAG, "update " + extension.id, error);
                        join[0].one(false);
                    });
                }
            }, error -> Log.w(TAG, "list", error));
        } catch (Throwable t) {
            Log.e(TAG, "checkForUpdates", t);
        }
    }

    private static boolean isMainProcess(Application application) {
        String name = null;
        if (Build.VERSION.SDK_INT >= 28) {
            name = Application.getProcessName();
        } else {
            try (FileInputStream in = new FileInputStream("/proc/self/cmdline")) {
                byte[] buffer = new byte[256];
                int length = in.read(buffer);
                int end = 0;
                while (end < length && buffer[end] != 0) end++;
                if (end > 0) name = new String(buffer, 0, end, "UTF-8");
            } catch (Throwable ignored) {
            }
        }
        return name == null || name.equals(application.getPackageName());
    }

    /**
     * Tracks the resumed Activity: foregroundActivity() is only set between onResume and onPause,
     * so it means "on screen". The browser menu and our own dialogs do not pause it.
     */
    private static final class ForegroundTracker implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity activity) {
            foreground = new WeakReference<>(activity);
            maybeScheduleUpdateCheck();
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (foreground.get() == activity) foreground = new WeakReference<>(null);
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            if (foreground.get() == activity) foreground = new WeakReference<>(null);
            List<Runnable> actions = destroyActions.remove(activity);
            if (actions == null) return;
            for (Runnable action : new ArrayList<>(actions)) {
                safely("onActivityDestroyed", action).run();
            }
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }
    }
}
