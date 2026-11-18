package io.github.sabopura.morphe.extension.twitch.app;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.view.View;
import android.view.ViewParent;

import java.util.Map;
import java.util.WeakHashMap;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.TwitchRes;

/**
 * Asks for landscape when a native player opens in the theatre, and gives the activity its earlier
 * request back when that player leaves the window. Home's feed previews sit outside the theatre.
 */
public final class ForceLandscape {
    public static final String KEY = "force_landscape";
    private static final int LANDSCAPE = ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE;
    private static final int NONE = Integer.MIN_VALUE;
    private static final Map<View, Watcher> WATCHED = new WeakHashMap<>();
    private static int theatreId = -1;

    private ForceLandscape() {
    }

    static void playerView(View view) {
        if (view == null || !enabled()) return;
        Watcher watcher = WATCHED.get(view);
        if (watcher == null) {
            watcher = new Watcher();
            WATCHED.put(view, watcher);
            view.addOnAttachStateChangeListener(watcher);
        }
        if (view.isAttachedToWindow()) {
            Watcher posted = watcher;
            view.post(() -> posted.enter(view));
        }
    }

    private static boolean enabled() {
        return AppHooks.on(Feature.FORCE_LANDSCAPE, KEY);
    }

    private static final class Watcher implements View.OnAttachStateChangeListener {
        private int previous = NONE;

        @Override
        public void onViewAttachedToWindow(View view) {
            view.post(() -> enter(view));
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
            if (previous == NONE) return;
            int restore = previous;
            previous = NONE;
            try {
                Activity activity = activity(view.getContext());
                // Another request made meanwhile (Twitch's rotate button) stays.
                if (activity != null && !activity.isFinishing() && activity.getRequestedOrientation() == LANDSCAPE)
                    activity.setRequestedOrientation(restore);
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("app.force-landscape-restore", e);
            }
        }

        void enter(View view) {
            try {
                if (previous != NONE || !view.isAttachedToWindow() || !enabled() || !inTheatre(view)) return;
                Activity activity = activity(view.getContext());
                if (activity == null) return;
                int requested = activity.getRequestedOrientation();
                if (requested == LANDSCAPE
                        || activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE)
                    return;
                previous = requested;
                activity.setRequestedOrientation(LANDSCAPE);
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("app.force-landscape", e);
            }
        }
    }

    static boolean inTheatre(View view) {
        if (theatreId == -1) theatreId = TwitchRes.id(view.getContext(), "video_presenter_container", "id");
        if (theatreId == 0) return false;
        for (ViewParent parent = view.getParent(); parent instanceof View; parent = parent.getParent())
            if (((View) parent).getId() == theatreId) return true;
        return false;
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
