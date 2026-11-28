package app.yydarlinker.aicaptions.host;

import androidx.annotation.Nullable;

import android.app.Activity;
import android.content.Context;

import java.lang.ref.WeakReference;

/** Activity entry shared by native settings and the optional AI host. */
public final class CaptionAddonSupport {
    private static volatile Context context;
    private static WeakReference<Activity> activity = new WeakReference<>(null);

    public static void initialize(@Nullable Activity value) {
        if (value == null) return;
        context = value.getApplicationContext();
        activity = new WeakReference<>(value);
        AiCaptionHook.setMainActivity(value);
    }

    @Nullable public static Context context() {
        return context;
    }

    @Nullable public static Activity activity() {
        return activity.get();
    }

    public static boolean aiInstalled() {
        return false;
    } // Bound to the selected patch at patch time.
}
