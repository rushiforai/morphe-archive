package samsungcompat;

import android.content.Context;
import android.util.Log;

/**
 * Firebase in Notes only carries Samsung Cloud sync pushes. It used to start at every launch; now it starts only
 * once sync has used it or a Samsung account is signed in, and right before sync sets up its pushes.
 * Adapted from bearinmindcat/morphe-patches (GPLv3).
 */
public final class GoogleServices {
    private GoogleServices() {}

    /** Notes' start-up: Firebase only if Samsung sync already uses it. */
    public static void firebaseAtStart(Context context) {
        if (context == null) return;
        boolean used = context.getSharedPreferences("com.google.firebase.messaging", Context.MODE_PRIVATE)
                .contains("auto_init")
            || context.getSharedPreferences("LoginInfo", Context.MODE_PRIVATE).getBoolean("ISLOGIN", false);
        if (used) firebase(context);
    }

    /** Samsung sync setting up its pushes: Firebase (once). */
    public static void firebase(Context context) {
        if (context == null) return;
        try {
            Class.forName("com.google.firebase.FirebaseApp").getMethod("initializeApp", Context.class)
                .invoke(null, context);
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.w("NotesCompat", "Firebase not started: " + e);
        }
    }
}
