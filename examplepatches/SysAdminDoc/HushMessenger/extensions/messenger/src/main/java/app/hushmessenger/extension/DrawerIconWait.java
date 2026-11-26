package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Android closes a screen the moment the drawer icon it was opened through is turned off, and after an update that
 * icon can be back until Messenger next starts. So hiding the icon waits while a settings screen opened through it is
 * still open, and at a process start until the first screen shows whether it came through the icon. Showing the icon
 * never waits.
 */
final class DrawerIconWait implements Application.ActivityLifecycleCallbacks {
    /** A start for a push or a sync shows no screen, so the icon goes after this long without one. */
    static final long FIRST_SCREEN_MS = 10_000;

    private static DrawerIconWait watching;

    private final Application app;
    /** Settings screens opened through the icon. One a theme change replaces counts again when the new one opens. */
    private final Set<Activity> throughIcon = Collections.newSetFromMap(new WeakHashMap<>());
    private boolean beforeFirstScreen;
    private boolean hideWaiting;

    private DrawerIconWait(Application app) {
        this.app = app;
    }

    /** From SettingsProvider, before its sync: no screen of this process exists yet. */
    static synchronized void atProcessStart(Context context) {
        DrawerIconWait wait = watch(context);
        if (wait == null) return;
        wait.beforeFirstScreen = true;
        new Handler(Looper.getMainLooper()).postDelayed(wait::firstScreenLate, FIRST_SCREEN_MS);
    }

    /** From the settings screen's onCreate, before its sync, since the watcher hears of a screen only after that. */
    static synchronized void opened(Activity screen) {
        DrawerIconWait wait = watch(screen);
        if (wait != null) wait.created(screen);
    }

    /** True when hiding the icon has to wait. The icon is synced again once nothing holds it. */
    static synchronized boolean holdHide(Context context) {
        DrawerIconWait wait = watching;
        if (wait == null || wait.app != context.getApplicationContext() || !wait.holding()) return false;
        wait.hideWaiting = true;
        return true;
    }

    static boolean throughIcon(Activity activity) {
        Intent intent = activity.getIntent();
        ComponentName component = intent == null ? null : intent.getComponent();
        return component != null && SettingsActivity.DRAWER_ALIAS.equals(component.getClassName());
    }

    static synchronized void resetForTests() {
        if (watching != null) watching.app.unregisterActivityLifecycleCallbacks(watching);
        watching = null;
    }

    private static DrawerIconWait watch(Context context) {
        Context appContext = context.getApplicationContext();
        if (!(appContext instanceof Application)) return null;
        if (watching != null && watching.app == appContext) return watching;
        resetForTests();
        watching = new DrawerIconWait((Application) appContext);
        watching.app.registerActivityLifecycleCallbacks(watching);
        return watching;
    }

    private boolean holding() {
        if (beforeFirstScreen) return true;
        for (Activity screen : throughIcon) if (!screen.isDestroyed()) return true;
        return false;
    }

    private void created(Activity activity) {
        beforeFirstScreen = false;
        if (throughIcon(activity)) throughIcon.add(activity);
        else release();
    }

    /** A stop alone doesn't count: a file picker or the share sheet stops settings too, and settings come back after. */
    private void closed(Activity activity) {
        if (activity.isChangingConfigurations()) return;
        if (throughIcon.remove(activity)) release();
    }

    private void firstScreenLate() {
        synchronized (DrawerIconWait.class) {
            if (!beforeFirstScreen || watching != this) return;
            beforeFirstScreen = false;
            release();
        }
    }

    private void release() {
        if (!hideWaiting || holding()) return;
        hideWaiting = false;
        SettingsActivity.syncDrawerIcon(app);
    }

    @Override public void onActivityCreated(Activity activity, Bundle state) {
        synchronized (DrawerIconWait.class) {
            created(activity);
        }
    }

    @Override public void onActivityStopped(Activity activity) {
        if (!activity.isFinishing()) return;
        synchronized (DrawerIconWait.class) {
            closed(activity);
        }
    }

    @Override public void onActivityDestroyed(Activity activity) {
        synchronized (DrawerIconWait.class) {
            closed(activity);
        }
    }

    @Override public void onActivityStarted(Activity activity) {}
    @Override public void onActivityResumed(Activity activity) {}
    @Override public void onActivityPaused(Activity activity) {}
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
}
