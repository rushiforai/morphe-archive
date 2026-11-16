package app.morphed.extension.twitch.ui;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import app.morphed.extension.twitch.patches.DebugLog;

/**
 * The app's windows: the activity's, and the ones a sheet or dialog opens on top of it (the player's Options in
 * full screen is one). Read from WindowManagerGlobal; if Android blocks that, only the activity's window is there.
 */
public final class Windows {
    private static Object manager;
    private static Field views;
    private static volatile String problem; // why the other windows can't be read, or null

    private Windows() {
    }

    /** Root views of all the app's windows, the activity's first (main thread only). */
    public static List<View> roots(Activity activity) {
        List<View> roots = new ArrayList<>();
        if (activity != null) roots.add(activity.getWindow().getDecorView());
        try {
            if (views == null) {
                Class<?> global = Class.forName("android.view.WindowManagerGlobal");
                manager = global.getMethod("getInstance").invoke(null);
                Field field = global.getDeclaredField("mViews");
                field.setAccessible(true);
                views = field;
            }
            for (Object view : new ArrayList<>((List<?>) views.get(manager))) {
                if (view instanceof View && !roots.contains(view)) roots.add((View) view);
            }
        } catch (Throwable t) {
            if (problem == null) DebugLog.log("PROBLEM Windows: only the activity's window can be searched (" + t + ")");
            problem = app.morphed.extension.twitch.Messages.of(t);
        }
        return roots;
    }

    /** Why the app's other windows can't be read (Android blocked it), or null when they can. */
    public static String problem() {
        return problem;
    }

    /** The activity a window's view belongs to (a dialog's context wraps its activity), or null. */
    public static Activity owner(View root) {
        Context context = root.getContext();
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return null;
    }
}
