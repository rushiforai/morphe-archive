/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import android.app.Activity;
import android.content.Intent;

import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowLooper;

/** The opening pause as another package's test sees it. */
public final class OpeningPauseForTests {
    private OpeningPauseForTests() {
    }

    /** What Facebook's icon sends. */
    static Intent fromIcon() {
        return new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER);
    }

    /** Whether a cold start from Facebook's icon covered its first screen. Back to a fresh process after. */
    public static boolean aLaunchCovers() {
        OpeningPause.forgetForTests();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class, fromIcon()).setup()) {
            Activity activity = controller.get();
            OpeningPause.created(activity, null);
            OpeningPause.started(activity);
            OpeningPause.resumed(activity);
            ShadowLooper.idleMainLooper();
            return OpeningPause.covering();
        } finally {
            OpeningPause.forgetForTests();
        }
    }
}
