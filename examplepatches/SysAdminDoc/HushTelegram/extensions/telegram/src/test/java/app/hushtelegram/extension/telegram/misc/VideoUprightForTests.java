/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;

/** Asks {@link VideoUpright} about a video on screen from tests outside this package. */
public final class VideoUprightForTests {
    private VideoUprightForTests() {}

    /** Whether a video that starts to play now would hold the screen in portrait. */
    public static boolean holdsPortrait() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            try {
                VideoUpright.shown(activity);
                return activity.getRequestedOrientation() == ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
            } finally {
                VideoUpright.reset();
            }
        }
    }
}
