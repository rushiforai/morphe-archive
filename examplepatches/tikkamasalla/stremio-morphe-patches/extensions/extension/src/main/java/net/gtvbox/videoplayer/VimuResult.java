package net.gtvbox.videoplayer;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import app.tikkamasalla.stremio.diag.PlaybackDiary;

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
    private static final int EARLY_MS = 30000;
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
                Activity nextAct = next == null ? null : next.getActivity();
                // Never finish the activity we are launching into: on fragment
                // replacement inside one PlayerActivity both are the same.
                if (prevAct != null && prevAct != nextAct && !prevAct.isFinishing()) {
                    prevAct.finish();
                }
            }
            tracked = new WeakReference<>(next);
            logged = false;
            try {
                Activity act = next == null ? null : next.getActivity();
                Intent launch = act == null ? null : act.getIntent();
                ProgressJournal.attach(act, launch == null ? "" : launch.getDataString());
            } catch (Throwable error) {
                Log.w(TAG, "journal attach", error);
            }
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
     * is already going away. Deliberately NOT narrowed further (audit F28): Android only calls
     * onUserLeaveHint for a user choice (Home, recents), not for system overlays such as the
     * Assistant, and a narrower rule would bring back the lost-progress case described above.
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
            PlaybackDiary.ev(activity, "vimu.leave", "why", "home or recents");
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
                // After j1 ran the result is final: a tick must not overwrite a code-1 completion with end_by=user.
                Activity activity = f == null || hasExited(f) ? null : f.getActivity();
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
                        VimuTracks.tick(f, player, player.isPlaying(), out.getIntExtra("position", 0));
                        VimuTracks.fillResult(out);
                        // Audit F27: checked again, under the lock fill() takes, right before the write.
                        // The calls above run plugin code, and the result of an exited fragment must
                        // stay as j1 left it (fill() marks the fragment before j1's own setResult).
                        boolean written = false;
                        synchronized (EXITED_FRAGMENTS) {
                            if (!EXITED_FRAGMENTS.containsKey(f)) {
                                activity.setResult(RESULT_OK, out);
                                written = true;
                            }
                        }
                        again = written;
                        if (written) {
                            try {
                                ProgressJournal.tick(player.isPlaying(), out.getIntExtra("position", 0), duration);
                            } catch (Throwable error) {
                                Log.w(TAG, "journal tick", error);
                            }
                        }
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
            if (!again) {
                // A fragment tracked while this tick ran found ticking=true and did not schedule itself.
                PlayerFragment now = tracked == null ? null : tracked.get();
                again = now != null && !hasExited(now);
            }
            if (again) {
                MAIN.postDelayed(this, TRACK_MS);
            } else {
                ticking = false;
            }
        }
    };

    private static boolean hasExited(Object fragment) {
        synchronized (EXITED_FRAGMENTS) {
            return fragment != null && EXITED_FRAGMENTS.containsKey(fragment);
        }
    }

    /**
     * Final position (audit F26). The live player position is what the 1 s tracker reports, so it
     * wins whenever it is known (a plain max(J0, live) would report a stale higher J0 after the
     * user seeks back and leaves within one J0 update). Vimu's saved position (field J0) is used
     * when the live one is unknown or reset (0 after completion or release), and in the first
     * EARLY_MS of a session, where it is the resume point and an early Back must not turn it into
     * 0:05 (20:00 rule; Stremio's early-Back guard uses the same 30 s). A completed playback
     * takes the later of the two. Never past the duration.
     */
    static int resultPosition(int saved, int live, int duration, boolean completed) {
        int position = completed ? Math.max(Math.max(saved, live), 0)
                : live > 0 && !(live < EARLY_MS && saved > live) ? live : Math.max(saved, 0);
        return duration > 0 && position > duration ? duration : position;
    }

    /** Hook in PlayerFragment.w1: turns "position" / "extra_position" (int or long, ms) into "startfrom". */
    public static void normalize(Bundle extras) {
        try {
            VimuTracks.begin(extras);
        } catch (Throwable error) {
            Log.w(TAG, "tracks begin", error);
        }
        try {
            ProgressJournal.begin(extras == null ? null : extras.getString("tikka.launch_id"),
                    extras == null ? null : extras.getString("stremio_video_id"));
        } catch (Throwable error) {
            Log.w(TAG, "journal begin", error);
        }
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
                        PlaybackDiary.ev("vimu.start", "from", ms, "key", key);
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
            e live = null;
            if (fragment instanceof PlayerFragment) {
                try {
                    live = PlayerFragment.G0((PlayerFragment) fragment);
                } catch (Throwable ignored) {
                }
                stopVimuPlayer((PlayerFragment) fragment);
            }
            int position = readIntOr(fragment, "J0", -1);
            int duration = readIntOr(fragment, "K0", 0);
            if (live != null) {
                try {
                    if (duration <= 0) duration = live.getDuration();
                    position = resultPosition(position, live.getCurrentPosition(), duration, code == 1);
                } catch (Throwable error) {
                    Log.w(TAG, "live position", error);
                }
            }
            if (duration > 0) {
                position = resultPosition(position, -1, duration, false);
                out.putExtra("position", position);
                out.putExtra("duration", duration);
            }
            String endBy = code == 1 ? "playback_completion" : "user";
            out.putExtra("end_by", endBy);
            VimuTracks.fillResult(out);
            if (!dupExit) {
                try {
                    ProgressJournal.moment(code == 1 ? "ended" : code == 4 ? "error" : "exited",
                            endBy, position, duration);
                } catch (Throwable error) {
                    Log.w(TAG, "journal fill", error);
                }
            }
            Log.i("BingeDbg", "vimuExit frag=" + System.identityHashCode(fragment)
                    + " code=" + code + " endBy=" + endBy + " pos=" + position
                    + "/" + duration + " dupExit=" + dupExit);
            Log.i(TAG, "result code=" + code + " position=" + position + " duration=" + duration);
            PlaybackDiary.ev("vimu.exit", "code", code, "end_by", endBy, "pos", position, "dur", duration, "dup", dupExit);
            return code == 0 ? RESULT_OK : code;
        } catch (Throwable error) {
            Log.w(TAG, "fill", error);
            return code;
        }
    }

    /** Hook in PlayerFragment.onPause: journal moment "paused". */
    public static void pause(Object fragment) {
        journal(fragment, "paused", "");
    }

    /** Hook in PlayerFragment.onDestroy: journal moment "exited" (a no-op after a normal exit). */
    public static void destroy(Object fragment) {
        journal(fragment, "exited", "");
    }

    /** Hook at the start of PlayerFragment.t (playback error dialog): journal moment "error". */
    public static void error(Object fragment) {
        journal(fragment, "error", "user");
    }

    /** Reads the live position and duration (0 when the player is gone: the journal uses its cache). */
    private static void journal(Object fragment, String state, String endBy) {
        try {
            if (!(fragment instanceof PlayerFragment)) return;
            synchronized (EXITED_FRAGMENTS) {
                if (EXITED_FRAGMENTS.containsKey(fragment)) return;
            }
            int position = 0;
            int duration = 0;
            try {
                e player = PlayerFragment.G0((PlayerFragment) fragment);
                if (player != null) {
                    duration = player.getDuration();
                    position = Math.max(player.getCurrentPosition(), 0);
                }
            } catch (Throwable ignored) {
                position = 0;
                duration = 0;
            }
            ProgressJournal.moment(state, endBy, position, duration);
        } catch (Throwable error) {
            Log.w(TAG, "journal " + state, error);
        }
    }

    private static int readIntOr(Object owner, String name, int fallback) {
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.getInt(owner);
        } catch (Throwable error) {
            Log.w(TAG, "field " + name, error);
            return fallback;
        }
    }
}
