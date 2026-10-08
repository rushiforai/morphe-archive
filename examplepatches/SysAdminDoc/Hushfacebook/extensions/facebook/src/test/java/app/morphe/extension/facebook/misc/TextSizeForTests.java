/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import android.app.Activity;

import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;

/** Text size as another package's test sees it. */
public final class TextSizeForTests {
    private TextSizeForTests() {
    }

    /**
     * A Facebook activity starting: true when the font scale its resources report changed. The
     * settings entry's callback runs this on every activity, before the context is set too.
     */
    public static boolean aStartScales() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).create()) {
            Activity activity = controller.get();
            float before = activity.getResources().getConfiguration().fontScale;
            TextSize.activity(activity);
            return Math.abs(activity.getResources().getConfiguration().fontScale - before) > 0.0005f;
        }
    }
}
