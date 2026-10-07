package nl.nlziet.pip;

import android.app.Activity;
import android.app.PictureInPictureParams;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Build;
import android.util.Log;
import android.util.Rational;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

/** Runtime uses only public SDK methods verified by the patch before application. */
@SuppressWarnings("unused")
public final class NativePip {
    private static final String TAG = "NLZIET-PiP";
    private static final String VIEW = "com.bitmovin.player.PlayerView";
    private static final String PLAYER = "com.bitmovin.player.api.Player";
    private static State state;

    private NativePip() {}

    private static final class Saved {
        final int visibility;
        final int width;
        final int height;
        Saved(View view) {
            visibility = view.getVisibility();
            ViewGroup.LayoutParams params = view.getLayoutParams();
            width = params == null ? 0 : params.width;
            height = params == null ? 0 : params.height;
        }
    }

    private static final class State {
        final WeakReference<Activity> activity;
        final WeakReference<View> surface;
        final WeakHashMap<View, Saved> saved = new WeakHashMap<>();
        boolean mode;
        View.OnLayoutChangeListener listener;
        State(Activity owner, View view) {
            activity = new WeakReference<>(owner);
            surface = new WeakReference<>(view);
        }
    }

    private static Object call(Object object, String owner, String name) throws ReflectiveOperationException {
        return Class.forName(owner).getMethod(name).invoke(object);
    }

    private static void collect(View view, ArrayList<View> found) {
        if (!view.isShown()) return;
        if (view.getClass().getName().equals(VIEW)) {
            if (view.isAttachedToWindow()) found.add(view);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), found);
        }
    }

    public static void onUserLeaveHint(Activity activity) {
        if (Build.VERSION.SDK_INT < 26 || activity.isFinishing() || activity.isDestroyed()
                || activity.isInPictureInPictureMode()
                || !activity.getPackageManager().hasSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE)) return;
        try {
            // Main activity also hosts login/settings. Never enter PiP outside the playback destination.
            Object fragment = activity.getClass().getMethod("getCurrentFragment").invoke(activity);
            if (fragment == null || !fragment.getClass().getName().equals(
                    "nl.nlziet.mobile.presentation.ui.player.PlayerFragment")) return;
            ArrayList<View> views = new ArrayList<>();
            collect(activity.getWindow().getDecorView(), views);
            if (views.size() != 1) return;
            View view = views.get(0);
            Object player = call(view, VIEW, "getPlayer");
            if (player == null || Boolean.TRUE.equals(call(player, PLAYER, "isDestroyed"))
                    || Boolean.TRUE.equals(call(player, "com.bitmovin.player.api.casting.RemoteControlApi", "isCasting"))
                    || !Boolean.TRUE.equals(call(player, PLAYER, "isPlaying"))
                    || call(player, PLAYER, "getSource") == null) return;
            Rect bounds = new Rect();
            if (!view.getGlobalVisibleRect(bounds) || bounds.isEmpty()) return;
            // This SDK has no default handler installed by NLZIET. Enable its PiP callbacks.
            Class<?> playerApi = Class.forName(PLAYER);
            Object handler = Class.forName("com.bitmovin.player.ui.DefaultPictureInPictureHandler")
                    .getConstructor(Activity.class, playerApi).newInstance(activity, player);
            Class.forName(VIEW).getMethod("setPictureInPictureHandler",
                    Class.forName("com.bitmovin.player.api.ui.PictureInPictureHandler")).invoke(view, handler);
            PictureInPictureParams params = new PictureInPictureParams.Builder()
                    .setAspectRatio(new Rational(16, 9)).setSourceRectHint(bounds).build();
            // Do not auto-enter on Android 12+: eligibility must be evaluated on every departure.
            State next = new State(activity, view);
            state = next;
            if (!activity.enterPictureInPictureMode(params) && state == next) state = null;
        } catch (ReflectiveOperationException | RuntimeException error) {
            clear(activity);
            Log.w(TAG, "PiP entry unavailable; retaining normal lifecycle", error);
        }
    }

    public static void onPlayerPause(Object view) {
        State current = state;
        Activity activity = current == null ? null : current.activity.get();
        // Actual platform mode, not an entry-attempt flag. All non-PiP pause behavior is retained.
        if (Build.VERSION.SDK_INT >= 26 && activity != null && !activity.isFinishing()
                && !activity.isDestroyed() && activity.isInPictureInPictureMode()
                && current.surface.get() == view) return;
        try {
            call(view, VIEW, "onPause");
        } catch (InvocationTargetException error) {
            Throwable cause = error.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new IllegalStateException("Bitmovin onPause failed", cause);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Inspected Bitmovin onPause API missing", error);
        }
    }

    public static void onModeChanged(Activity activity, boolean inPip, Configuration configuration) {
        State current = state;
        if (current == null || current.activity.get() != activity) return;
        View view = current.surface.get();
        if (view != null) {
            try {
                Class.forName(VIEW).getMethod("onPictureInPictureModeChanged", boolean.class, Configuration.class)
                        .invoke(view, inPip, configuration);
            } catch (ReflectiveOperationException | RuntimeException error) {
                Log.w(TAG, "SDK PiP callback failed", error);
            }
        }
        current.mode = inPip;
        if (inPip && view != null) {
            hideChrome(current);
            View decor = activity.getWindow().getDecorView();
            if (current.listener == null) {
                current.listener = (v, l, t, r, b, ol, ot, or, ob) -> {
                    if (current.mode) hideChrome(current);
                };
                decor.addOnLayoutChangeListener(current.listener);
            }
        } else clear(activity);
    }

    private static void hideChrome(State current) {
        View child = current.surface.get();
        Activity activity = current.activity.get();
        if (child == null || activity == null) return;
        View decor = activity.getWindow().getDecorView();
        // Keep the original video/surface hierarchy: no new player, source, DRM session or reparenting.
        while (child != decor) {
            ViewParent parent = child.getParent();
            if (!(parent instanceof ViewGroup)) break;
            ViewGroup group = (ViewGroup) parent;
            current.saved.putIfAbsent(child, new Saved(child));
            ViewGroup.LayoutParams params = child.getLayoutParams();
            if (params != null && (params.width != -1 || params.height != -1)) {
                params.width = ViewGroup.LayoutParams.MATCH_PARENT;
                params.height = ViewGroup.LayoutParams.MATCH_PARENT;
                child.setLayoutParams(params);
            }
            for (int i = 0; i < group.getChildCount(); i++) {
                View sibling = group.getChildAt(i);
                if (sibling == child || sibling.getClass().getName().equals("com.bitmovin.player.SubtitleView")) continue;
                current.saved.putIfAbsent(sibling, new Saved(sibling));
                // INVISIBLE retains constraints/anchors used by the inspected layouts.
                if (sibling.getVisibility() == View.VISIBLE) sibling.setVisibility(View.INVISIBLE);
            }
            child = group;
        }
    }

    public static void onResume(Activity activity) {
        if (Build.VERSION.SDK_INT < 26 || !activity.isInPictureInPictureMode()) {
            State current = state;
            if (current != null && current.activity.get() == activity && current.mode) {
                onModeChanged(activity, false, activity.getResources().getConfiguration());
            } else clear(activity);
        }
    }

    private static void clear(Activity activity) {
        State current = state;
        if (current == null || current.activity.get() != activity) return;
        current.mode = false;
        if (current.listener != null) activity.getWindow().getDecorView().removeOnLayoutChangeListener(current.listener);
        for (Map.Entry<View, Saved> entry : current.saved.entrySet()) {
            View view = entry.getKey();
            Saved saved = entry.getValue();
            view.setVisibility(saved.visibility);
            ViewGroup.LayoutParams params = view.getLayoutParams();
            if (params != null) {
                params.width = saved.width;
                params.height = saved.height;
                view.setLayoutParams(params);
            }
        }
        current.saved.clear();
        state = null;
    }
}
