package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.widget.Toast;

import java.util.concurrent.atomic.AtomicBoolean;

/** Starts the userscript runtime and binds MonkeyScript into Chrome's native app menu. */
final class ChromeUserscriptController implements Application.ActivityLifecycleCallbacks {
    private static final AtomicBoolean INSTALLED = new AtomicBoolean();

    static void install(Application application) {
        if (INSTALLED.compareAndSet(false, true)) {
            ChromeUserscriptShortcut.install(application);
            application.registerActivityLifecycleCallbacks(new ChromeUserscriptController());
        }
    }

    @Override public void onActivityResumed(Activity activity) {
        if (activity instanceof UserscriptManagerActivity
                || activity instanceof UserscriptEditorActivity
                || activity instanceof UserscriptInstallActivity) return;
        ChromeUserscriptShortcut.install(activity);
        MonkeyRuntime.start(activity);
        ChromeAppMenuIntegrator.start(activity);
        NativeInstallAction.start(activity);
    }

    @Override public void onActivityPaused(Activity activity) {
        MonkeyRuntime.stop(activity);
        ChromeAppMenuIntegrator.stop(activity);
        NativeInstallAction.stop(activity);
    }

    @Override public void onActivityDestroyed(Activity activity) {
        MonkeyRuntime.stop(activity);
        ChromeAppMenuIntegrator.stop(activity);
        NativeInstallAction.stop(activity);
    }

    static void toast(Activity activity, String message) {
        Toast.makeText(activity, message == null ? "Unknown error" : message, Toast.LENGTH_LONG).show();
    }

    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
}
