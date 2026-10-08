/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.KeyguardManager;

import org.robolectric.Robolectric;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowLooper;

/** Lock Facebook as another package's test sees it. */
public final class AppLockForTests {
    private AppLockForTests() {
    }

    /**
     * A cold start on a phone with a screen lock, with Android's prompt stood in for: true when it
     * covered the screen or asked for the screen lock. Back to a fresh process after.
     */
    public static boolean aStartLocks() {
        AppLock.forgetForTests();
        int[] asked = {0};
        AppLock.prompter = (activity, answer) -> asked[0]++;
        KeyguardManager keyguard = RuntimeEnvironment.getApplication().getSystemService(KeyguardManager.class);
        shadowOf(keyguard).setIsDeviceSecure(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            AppLock.started(activity);
            AppLock.resumed(activity);
            ShadowLooper.idleMainLooper();
            return AppLock.covered(activity) || asked[0] > 0;
        } finally {
            AppLock.forgetForTests();
        }
    }

    private static AppLock.Answer lastAnswer;

    /** A phone with a screen lock and a fresh process, with Android's prompt stood in for. */
    public static void arm() {
        AppLock.forgetForTests();
        lastAnswer = null;
        AppLock.prompter = (activity, answer) -> lastAnswer = answer;
        KeyguardManager keyguard = RuntimeEnvironment.getApplication().getSystemService(KeyguardManager.class);
        shadowOf(keyguard).setIsDeviceSecure(true);
    }

    /** The lock hears a Facebook screen start. */
    public static void started(Activity activity) {
        AppLock.started(activity);
    }

    /** The lock hears a Facebook screen resume, and the main thread runs. */
    public static void resumed(Activity activity) {
        AppLock.resumed(activity);
        ShadowLooper.idleMainLooper();
    }

    /** The person passes the check the lock asked for. */
    public static void unlock() {
        lastAnswer.unlocked();
        ShadowLooper.idleMainLooper();
    }

    /** Back to a fresh process. */
    public static void disarm() {
        AppLock.forgetForTests();
        lastAnswer = null;
    }
}
