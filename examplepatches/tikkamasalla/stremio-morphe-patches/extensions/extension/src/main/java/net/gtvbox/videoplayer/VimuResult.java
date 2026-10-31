package net.gtvbox.videoplayer;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.ref.WeakReference;

/**
 * External player contract for Vimu: accepts the common start position keys and returns the
 * MX Player style result (position, duration in ms, end_by). Called from two smali hooks in
 * PlayerFragment (w1 and j1). j1 only runs on some exits (Back, Stop, Home), so track() also keeps
 * the latest position on the activity result once a second: any other finish() carries it too.
 */
public final class VimuResult {
    private static final String TAG = "VimuResult";
    private static final int RESULT_OK = -1;
    private static final long TRACK_MS = 1000L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile WeakReference<PlayerFragment> tracked;
    private static boolean ticking;
    private static boolean logged;
    /** When Vimu itself last opened one of its own screens from the player (its preferences). */
    private static volatile long ownScreenAt;
    private static final long OWN_SCREEN_MS = 3000L;
    private static final java.util.WeakHashMap<Object, Boolean> EXITED_FRAGMENTS =
            new java.util.WeakHashMap<>();

    private VimuResult() {
    }

    private static void stopVimuPlayer(PlayerFragment f) {
        try {
            if (f == null) return;
            e player = PlayerFragment.G0(f);
            if (player == null) return;
            try {
                player.getClass().getMethod("pause").invoke(player);
            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Hook in PlayerFragment.w1 (every launch). Keeps the activity result up to date with the
     * latest position and duration, so an exit that bypasses j1 still returns them.
     */
    public static void track(Object fragment) {
        try {
            PlayerFragment next = (PlayerFragment) fragment;
            PlayerFragment prev = tracked == null ? null : tracked.get();
            if (prev != null && prev != next) {
                stopVimuPlayer(prev);
                Activity prevAct = prev.getActivity();
                if (prevAct != null && !prevAct.isFinishing()) {
                    prevAct.finish();
                }
            }
            tracked = new WeakReference<>(next);
            logged = false;
            if (!ticking) {
                ticking = true;
                MAIN.postDelayed(TICK, TRACK_MS);
            }
        } catch (Throwable error) {
            Log.w(TAG, "track", error);
        }
    }

    /** Hook at the start of PlayerFragment.j (opens Vimu's own preferences from the player). */
    public static void ownScreen() {
        ownScreenAt = SystemClock.uptimeMillis();
    }

    /**
     * Hook in PlayerActivity.onUserLeaveHint (Home, recents). Returns the result to the caller
     * right away instead of at onStop: by then a caller that was stopped behind the player has
     * already dropped its player screen, so the progress would be lost. Does nothing when the
     * player was not started for a result, when Vimu opened its own screen, or when the activity
     * is already going away.
     */
    public static void userLeave(Object owner) {
        try {
            if (!(owner instanceof Activity)) return;
            Activity activity = (Activity) owner;
            if (activity.isFinishing() || activity.isChangingConfigurations()) return;
            if (activity.getCallingActivity() == null) return;
            if (SystemClock.uptimeMillis() - ownScreenAt < OWN_SCREEN_MS) return;
            if (Build.VERSION.SDK_INT >= 24 && activity.isInPictureInPictureMode()) return;
            PlayerFragment f = tracked == null ? null : tracked.get();
            if (f == null || f.getActivity() != activity) return;
            Log.i(TAG, "user left Vimu: returning the result now");
            f.j1(0);
        } catch (Throwable error) {
            Log.w(TAG, "userLeave", error);
        }
    }

    private static final Runnable TICK = new Runnable() {
        @Override
        public void run() {
            boolean again = false;
            try {
                PlayerFragment f = tracked == null ? null : tracked.get();
                Activity activity = f == null ? null : f.getActivity();
                if (activity != null && !activity.isFinishing()
                        && !(Build.VERSION.SDK_INT >= 17 && activity.isDestroyed())) {
                    again = true;
                    e player = PlayerFragment.G0(f);
                    int duration = player == null ? 0 : player.getDuration();
                    if (duration > 0) {
                        Intent out = new Intent(activity.getPackageName() + ".result");
                        out.putExtra("position", Math.max(player.getCurrentPosition(), 0));
                        out.putExtra("duration", duration);
                        out.putExtra("end_by", "user");
                        activity.setResult(RESULT_OK, out);
                        if (!logged) {
                            logged = true;
                            Log.i(TAG, "tracking result position=" + out.getIntExtra("position", 0)
                                    + " duration=" + duration);
                        }
                    }
                }
            } catch (Throwable error) {
                Log.w(TAG, "tick", error);
            }
            if (again) {
                MAIN.postDelayed(this, TRACK_MS);
            } else {
                ticking = false;
            }
        }
    };

    /** Hook in PlayerFragment.w1: turns "position" / "extra_position" (int or long, ms) into "startfrom". */
    public static void normalize(Bundle extras) {
        try {
            if (extras == null || extras.containsKey("startfrom")) {
                return;
            }
            String[] keys = {"position", "extra_position"};
            for (String key : keys) {
                Object value = extras.get(key);
                if (value instanceof Number) {
                    long ms = ((Number) value).longValue();
                    if (ms > 0L && ms < Integer.MAX_VALUE) {
                        extras.putInt("startfrom", (int) ms);
                        Log.i(TAG, "start position " + ms + " ms from '" + key + "'");
                        return;
                    }
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "normalize", error);
        }
    }

    /**
     * Hook in PlayerFragment.j1, right before setResult. Puts position, duration and end_by on the
     * result and returns the result code to use: a plain user exit (0) becomes RESULT_OK so that
     * MX style callers read the extras; every other code is kept.
     */
    public static int fill(Object fragment, int code, Intent out) {
        try {
            boolean dupExit;
            synchronized (EXITED_FRAGMENTS) {
                dupExit = EXITED_FRAGMENTS.put(fragment, Boolean.TRUE) != null;
            }
            if (fragment instanceof PlayerFragment) {
                stopVimuPlayer((PlayerFragment) fragment);
            }
            int position = readInt(fragment, "J0");
            int duration = readInt(fragment, "K0");
            if (duration > 0) {
                if (position < 0) {
                    position = 0;
                }
                out.putExtra("position", position);
                out.putExtra("duration", duration);
            }
            String endBy = code == 1 ? "playback_completion" : "user";
            out.putExtra("end_by", endBy);
            Log.i("BingeDbg", "vimuExit frag=" + System.identityHashCode(fragment)
                    + " code=" + code + " endBy=" + endBy + " pos=" + position
                    + "/" + duration + " dupExit=" + dupExit);
            Log.i(TAG, "result code=" + code + " position=" + position + " duration=" + duration);
            return code == 0 ? RESULT_OK : code;
        } catch (Throwable error) {
            Log.w(TAG, "fill", error);
            return code;
        }
    }

    private static int readInt(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getInt(owner);
    }
}
