package io.github.jordanwoodson.extension.shared.rumble;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.view.View;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/** Player view settings for Rumble. With a setting off, each hook returns Rumble's own value. */
@SuppressWarnings("unused")
public final class RumblePlayer {
    static final String FILL_SCREEN = "fill_screen";
    static final String KEEP_SCREEN_ON = "keep_screen_on_paused";
    static final String REFRESH = "refresh_stream";
    static final String SEEK = "seek_seconds";

    /** Media3's AspectRatioFrameLayout.RESIZE_MODE_FIT and RESIZE_MODE_ZOOM. */
    private static final int FIT = 0;
    private static final int ZOOM = 4;

    private RumblePlayer() {
    }

    // ---------------------------------------------------------------------------------------------
    // Fill screen

    /**
     * Injection point: the resize mode the video frame measures with, which Rumble always sets to FIT. In
     * landscape, outside picture-in-picture, Fill screen makes it ZOOM: the video fills the screen and the
     * edges are cropped.
     */
    public static int resizeMode(View view, int mode) {
        if (mode != FIT || view == null || !Settings.isEnabled(FILL_SCREEN)) return mode;
        try {
            Configuration configuration = view.getResources().getConfiguration();
            if (configuration.orientation != Configuration.ORIENTATION_LANDSCAPE) return mode;
            Activity activity = activity(view.getContext());
            if (activity != null && activity.isInPictureInPictureMode()) return mode;
            return ZOOM;
        } catch (RuntimeException e) {
            return mode;
        }
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // Keep screen on while paused

    /**
     * Injection point: whether the player keeps the screen on, which Rumble decides from the player state
     * (off while paused or finished), with that state. Keeps it on while paused too.
     */
    public static boolean keepScreenOn(boolean keep, Object state) {
        if (keep || state == null || !Settings.isEnabled(KEEP_SCREEN_ON)) return keep;
        try {
            return state.toString().startsWith("Paused(");
        } catch (RuntimeException e) {
            return keep;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Refresh stream

    /** The player each video was last loaded into. */
    private static final Map<Object, WeakReference<Object>> PLAYERS = Collections.synchronizedMap(new WeakHashMap<>());
    private static volatile WeakReference<Object> lastPlayer = new WeakReference<>(null);
    private static Object noQualityCallback;

    /** Injection point: a player loading a video. */
    public static void onVideoLoaded(Object player, Object video) {
        if (player == null) return;
        lastPlayer = new WeakReference<>(player);
        if (video != null) PLAYERS.put(video, new WeakReference<>(player));
    }

    /** The tap action per video, so the clickable modifier of a panel drawn again compares equal. */
    private static final Map<Object, Object> RELOADS = Collections.synchronizedMap(new WeakHashMap<>());
    private static Object reloadWithoutVideo;
    /** The last panels' (modifier, video, clickable modifier), so a panel drawn again gets the same modifier. */
    private static final int REMEMBERED = 4;
    private static final Object[][] REFRESHABLE = new Object[REMEMBERED][];
    private static int nextRefreshable;

    /**
     * Injection point: the start of the player's error panel, with its modifier and video. While Refresh
     * stream is on, a tap on the panel reloads the video's player. The panel is drawn again on every
     * recomposition: the same modifier and video get the same clickable modifier back, and the same video the
     * same tap action, so Compose can skip what didn't change.
     */
    public static Object refreshable(Object modifier, Object video) {
        if (modifier == null || !Settings.isEnabled(REFRESH)) return modifier;
        synchronized (REFRESHABLE) {
            for (Object[] remembered : REFRESHABLE) {
                if (remembered != null && ((WeakReference<?>) remembered[0]).get() == modifier
                        && ((WeakReference<?>) remembered[1]).get() == video) {
                    Object clickable = ((WeakReference<?>) remembered[2]).get();
                    if (clickable != null) return clickable;
                }
            }
        }
        try {
            Object clickable = clickable(modifier, reloadAction(video));
            if (clickable == null) return modifier;
            synchronized (REFRESHABLE) {
                REFRESHABLE[nextRefreshable] = new Object[]{
                        new WeakReference<>(modifier), new WeakReference<>(video), new WeakReference<>(clickable)};
                nextRefreshable = (nextRefreshable + 1) % REMEMBERED;
            }
            return clickable;
        } catch (RuntimeException e) {
            Logger.d("refresh: " + e);
            return modifier;
        }
    }

    /** The Function0 that reloads {@code video}'s player, made once per video. */
    private static Object reloadAction(Object video) {
        if (video == null) {
            synchronized (RELOADS) {
                if (reloadWithoutVideo == null) {
                    reloadWithoutVideo = function("kotlin.jvm.functions.Function0", () -> reload(null));
                }
                return reloadWithoutVideo;
            }
        }
        synchronized (RELOADS) {
            Object action = RELOADS.get(video);
            if (action == null) {
                WeakReference<Object> target = new WeakReference<>(video);
                action = function("kotlin.jvm.functions.Function0", () -> reload(target.get()));
                RELOADS.put(video, action);
            }
            return action;
        }
    }

    /** Reloads the player of {@code video} at its current position. Main thread. */
    static void reload(Object video) {
        WeakReference<Object> reference = video == null ? null : PLAYERS.get(video);
        Object player = reference == null ? null : reference.get();
        if (player == null) player = lastPlayer.get();
        if (player == null) {
            Logger.d("refresh: no player");
            return;
        }
        try {
            Context context = Settings.appContext();
            if (context != null) Toast.makeText(context, "Reloading", Toast.LENGTH_SHORT).show();
            reloadPlayer(player);
            Logger.d("refresh: reloaded");
        } catch (RuntimeException e) {
            Logger.d("refresh: " + e);
        }
    }

    /** Injection point (the player's reload): a quality callback that does nothing, so a reload saves no pick. */
    public static synchronized Object noQualityCallback() {
        if (noQualityCallback == null) noQualityCallback = function("kotlin.jvm.functions.Function2", () -> { });
        return noQualityCallback;
    }

    /** A Kotlin function object (FunctionN, renamed by R8 but still an interface) that runs {@code body}. */
    private static Object function(String type, Runnable body) {
        try {
            Class<?> function = Class.forName(type, false, RumblePlayer.class.getClassLoader());
            return Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[]{function},
                    (proxy, method, args) -> {
                        switch (method.getName()) {
                            case "equals":
                                return args != null && args.length == 1 && proxy == args[0];
                            case "hashCode":
                                return System.identityHashCode(proxy);
                            case "toString":
                                return "Lurk " + type;
                            default:
                                body.run();
                                return null;
                        }
                    });
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("Lurk: no " + type + " in this app", e);
        }
    }

    /** Replaced at patch time: Compose's Modifier.clickable(onClick) on the given modifier. */
    private static Object clickable(Object modifier, Object onClick) {
        return null;
    }

    /** Replaced at patch time: the player's reload with its current source. */
    private static void reloadPlayer(Object player) {
    }

    // ---------------------------------------------------------------------------------------------
    // Seek interval

    /** Injection point: Rumble's 15 s for the rewind and forward buttons, in milliseconds. */
    public static int seekMillis(int millis) {
        int seconds = Settings.getInt(SEEK);
        return seconds > 0 ? seconds * 1000 : millis;
    }

    /** Injection point: the rewind button's icon. Without its "15s" while another interval is chosen. */
    public static int seekBackIcon(int icon) {
        return seekIcon(icon, "lurk_seek_back");
    }

    /** Injection point: the forward button's icon. Without its "15s" while another interval is chosen. */
    public static int seekForwardIcon(int icon) {
        return seekIcon(icon, "lurk_seek_forward");
    }

    private static int seekIcon(int icon, String name) {
        if (Settings.getInt(SEEK) <= 0) return icon;
        try {
            Context context = Settings.appContext();
            if (context == null) return icon;
            // The resources keep Rumble's package even in a cloned app.
            String resources = context.getResources().getResourcePackageName(icon);
            int id = context.getResources().getIdentifier(name, "drawable", resources);
            return id != 0 ? id : icon;
        } catch (RuntimeException e) {
            return icon;
        }
    }
}
