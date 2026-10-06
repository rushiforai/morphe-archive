/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.pm.PackageManager;
import android.os.Build;

import org.robolectric.Robolectric;
import org.robolectric.RuntimeEnvironment;

/** Runs the picture-in-picture hooks the way a phone on Android 12 with the feature would. */
public final class PictureInPictureForTests {
    private PictureInPictureForTests() {
    }

    /** Whether the check says yes for an activity on Android 12 with the phone's feature on. */
    public static boolean allowsWithTheFeature() {
        return allows(Build.VERSION_CODES.S, true);
    }

    /** Whether the Reels viewer's gate says yes on Android 12. */
    public static boolean surfaceAllows() {
        return surfaceAllows(Build.VERSION_CODES.S);
    }

    static boolean allows(int apiLevel, boolean feature) {
        shadowOf(RuntimeEnvironment.getApplication().getPackageManager())
                .setSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE, feature);
        int was = PictureInPicture.apiLevel;
        PictureInPicture.apiLevel = apiLevel;
        try {
            Activity activity = Robolectric.buildActivity(Activity.class).get();
            return PictureInPicture.allowed(activity);
        } finally {
            PictureInPicture.apiLevel = was;
        }
    }

    static boolean surfaceAllows(int apiLevel) {
        int was = PictureInPicture.apiLevel;
        PictureInPicture.apiLevel = apiLevel;
        try {
            return PictureInPicture.surfaceAllowed();
        } finally {
            PictureInPicture.apiLevel = was;
        }
    }
}
