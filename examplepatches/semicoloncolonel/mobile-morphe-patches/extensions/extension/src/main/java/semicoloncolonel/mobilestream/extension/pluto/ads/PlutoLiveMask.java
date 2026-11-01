/*
 * Ported from ajstrick81's PlutoLiveSlateHelper (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/extensions/extension/src/main/java/ajstrick81/morphe/extension/pluto/ads
 * ALL CREDIT FOR THE ID3-TICK DETECTION AND MASK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.extension.pluto.ads;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.content.Context;
import android.graphics.Color;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import java.io.File;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;

/**
 * Pluto TV phone: masks live ad breaks with a black screen and muted audio.
 *
 * Live breaks are broadcast time in the linear feed, so they cannot be cut
 * out the way VOD ads are. Pluto's stitcher tracker receives an ID3 ad tag
 * for every ad segment, and only while an ad is playing. Each tag is a tick:
 * the first one raises the mask, later ones keep it up, and the mask lifts
 * when the ticks stop (the show is back). This is the TV patch's design.
 *
 * Phone differences: the cover goes over whichever activity hosts the
 * player. On-demand plays in VideoPlayerActivity, but live TV plays inline
 * in MainActivity, so both register on onResume, and the helper also tracks
 * the resumed activity through ActivityLifecycleCallbacks. Muting uses Avia's
 * own mute(boolean), since the phone's ExoPlayer is renamed. As on TV, the
 * media stream is muted too.
 *
 * Runtime switches, as on TV: a file named "slate_off" in the app's external
 * files dir disables the mask; "pluto_slate_mode" containing "black" or
 * "mute" picks cover-only or mute-only.
 */
@SuppressWarnings("unused")
public final class PlutoLiveMask {
    private static final String TAG = "MSP-PLUTO-LIVE";
    private static final String DISABLE_MARKER = "slate_off";
    private static final String MODE_MARKER = "pluto_slate_mode";
    private static final long HIDE_DELAY_MS = 6_500L;
    // Ticks arrive only at quartiles, often more than HIDE_DELAY_MS apart, so a
    // tick keeps the mask up for the rest of its ad (from the tag's own
    // currentIndexSec / maximumIndexSec) plus this grace for the next ad's tag.
    private static final long AD_END_GRACE_MS = 2_500L;
    private static final java.util.regex.Pattern TAG_FIELDS = java.util.regex.Pattern.compile(
            "creativeId=([^,]*), currentIndexSec=(\\d+), maximumIndexSec=(\\d+), typeFlags=\\[([^\\]]*)\\]");
    private static final long FAILSAFE_MS = 15L * 60L * 1000L;

    private enum Mode { BOTH, BLACK, MUTE }

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static boolean callbacksRegistered;
    private static volatile Object aviaPlayer;

    private static FrameLayout cover;
    private static boolean shown;
    private static boolean aviaMuted;   // true only if WE muted Avia
    private static boolean streamMuted;
    private static int savedStreamVolume = -1;

    // Named classes, not lambdas: see the -repackageclasses note in
    // proguard-rules.pro.
    private static final class Lift implements Runnable {
        private final String reason;

        Lift(String reason) {
            this.reason = reason;
        }

        @Override
        public void run() {
            lift(reason);
        }
    }

    private static final class Show implements Runnable {
        private final long hideAfterMs;

        Show(long hideAfterMs) {
            this.hideAfterMs = hideAfterMs;
        }

        @Override
        public void run() {
            showOrKeep(hideAfterMs);
        }
    }

    private static final Runnable HIDE = new Lift("no ad ticks, break ended");
    private static final Runnable FAILSAFE = new Lift("failsafe");

    private PlutoLiveMask() {
    }

    /** VideoPlayerActivity / MainActivity onResume: the activity the cover goes over. */
    public static void registerActivity(Activity activity) {
        if (activity == null) return;
        activityRef = new WeakReference<>(activity);
        if (!callbacksRegistered) {
            try {
                activity.getApplication().registerActivityLifecycleCallbacks(new Tracker());
                callbacksRegistered = true;
            } catch (Throwable t) {
                Log.w(TAG, "could not track activities: " + t);
            }
        }
    }

    /** Follows the resumed activity, so a host the hooks do not cover still works. */
    private static final class Tracker implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity activity) {
            activityRef = new WeakReference<>(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (activityRef.get() == activity) MAIN.post(new Lift("activity paused"));
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            if (activityRef.get() == activity) activityRef = new WeakReference<>(null);
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }
    }

    /** VideoPlayerActivity / MainActivity onPause: lift at once, so the user's media volume
     *  is never left at zero while they are in another app. */
    public static void onPlayerPause(Activity activity) {
        MAIN.post(new Lift("player paused"));
    }

    /** VideoPlayerActivity / MainActivity onDestroy. */
    public static void unregisterActivity(Activity activity) {
        if (activityRef.get() == activity) {
            MAIN.post(new Lift("player closed"));
            activityRef = new WeakReference<>(null);
        }
    }

    /** AviaPlayer.startExoplayer: the player to mute. */
    public static void setAviaPlayer(Object player) {
        aviaPlayer = player;
    }

    /**
     * Called from the end of the ID3Tag constructor: Pluto parsed an ad tag, so
     * an ad is on screen. The class's own empty default instance (built at
     * class init, with no creative) is ignored.
     */
    public static void onAdTick(Object id3Tag) {
        long keepMs = HIDE_DELAY_MS;
        try {
            java.util.regex.Matcher m = TAG_FIELDS.matcher(String.valueOf(id3Tag));
            if (!m.find() || m.group(1).trim().isEmpty() || "null".equals(m.group(1).trim())) return;
            long current = Long.parseLong(m.group(2));
            long maximum = Long.parseLong(m.group(3));
            String flags = m.group(4);
            if (flags.contains("QUARTILE_END") || flags.contains("END_OF_MEDIA")) {
                keepMs = AD_END_GRACE_MS; // last tick of this ad; the next ad re-arms
            } else if (maximum > current) {
                keepMs = Math.max(HIDE_DELAY_MS, (maximum - current) * 1000 + AD_END_GRACE_MS);
            }
        } catch (Throwable t) {
            // Unknown tag shape: fall back to the fixed delay.
            Log.w(TAG, "could not read ad tag timing: " + t);
        }
        MAIN.post(new Show(keepMs));
    }

    private static void showOrKeep(long hideAfterMs) {
        Mode mode = readMode();
        if (mode == null) {
            if (shown) lift("disabled by marker file");
            return;
        }
        MAIN.removeCallbacks(HIDE);
        MAIN.postDelayed(HIDE, hideAfterMs);
        if (!shown) {
            MAIN.removeCallbacks(FAILSAFE);
            MAIN.postDelayed(FAILSAFE, FAILSAFE_MS);
        }
        if (mode != Mode.BLACK) mute();
        if (mode != Mode.MUTE) showCover();
        if (!shown) Log.i(TAG, "live ad break: mask on (" + mode + ")");
        Log.d(TAG, "ad tick: holding the mask for " + hideAfterMs + "ms");
        shown = true;
    }

    private static void lift(String reason) {
        MAIN.removeCallbacks(HIDE);
        MAIN.removeCallbacks(FAILSAFE);
        if (!shown) return;
        removeCover();
        unmute();
        shown = false;
        Log.i(TAG, "live ad break: mask off (" + reason + ")");
    }

    private static void showCover() {
        if (cover != null) return;
        Activity activity = activityRef.get();
        if (activity == null) {
            Log.w(TAG, "no player activity for the cover");
            return;
        }
        try {
            ViewGroup root = activity.findViewById(android.R.id.content);
            if (root == null) return;
            FrameLayout view = new FrameLayout(activity);
            view.setBackgroundColor(Color.BLACK);
            view.setClickable(false); // let taps reach the player controls
            view.setFocusable(false);
            view.setElevation(1_000_000f);
            view.setTranslationZ(1_000_000f);
            root.addView(view, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            view.bringToFront();
            cover = view;
        } catch (Throwable t) {
            Log.w(TAG, "cover failed: " + t);
        }
    }

    private static void removeCover() {
        if (cover != null && cover.getParent() instanceof ViewGroup) {
            ((ViewGroup) cover.getParent()).removeView(cover);
        }
        cover = null;
    }

    private static void mute() {
        if (!streamMuted) {
            AudioManager am = audioManager();
            if (am != null) {
                try {
                    savedStreamVolume = am.getStreamVolume(AudioManager.STREAM_MUSIC);
                    am.setStreamVolume(AudioManager.STREAM_MUSIC, 0, 0);
                    streamMuted = true;
                } catch (Throwable t) {
                    Log.w(TAG, "stream mute failed: " + t);
                }
            }
        }
        // Leave Avia alone if the user had already muted it.
        if (!aviaMuted && !isAviaMuted() && setAviaMute(true)) aviaMuted = true;
    }

    private static void unmute() {
        if (aviaMuted) {
            setAviaMute(false);
            aviaMuted = false;
        }
        if (streamMuted) {
            AudioManager am = audioManager();
            if (am != null && savedStreamVolume >= 0) {
                try {
                    // Only restore if it is still where we left it: if the
                    // user changed the volume during the break, keep theirs.
                    if (am.getStreamVolume(AudioManager.STREAM_MUSIC) == 0) {
                        am.setStreamVolume(AudioManager.STREAM_MUSIC, savedStreamVolume, 0);
                    }
                } catch (Throwable ignored) {
                }
            }
            streamMuted = false;
            savedStreamVolume = -1;
        }
    }

    private static boolean isAviaMuted() {
        Object player = aviaPlayer;
        if (player == null) return false;
        try {
            Object muted = player.getClass().getMethod("isMuted").invoke(player);
            return Boolean.TRUE.equals(muted);
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean setAviaMute(boolean mute) {
        Object player = aviaPlayer;
        if (player == null) return false;
        try {
            Method m = player.getClass().getMethod("mute", boolean.class);
            m.invoke(player, mute);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Avia mute(" + mute + ") failed: " + t);
            return false;
        }
    }

    private static AudioManager audioManager() {
        Activity activity = activityRef.get();
        if (activity == null) return null;
        try {
            return (AudioManager) activity.getApplicationContext().getSystemService(Context.AUDIO_SERVICE);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Null means the mask is disabled. */
    private static Mode readMode() {
        Activity activity = activityRef.get();
        File dir = null;
        try {
            if (activity != null) dir = activity.getExternalFilesDir(null);
        } catch (Throwable ignored) {
        }
        if (dir == null) return Mode.BOTH;
        try {
            if (new File(dir, DISABLE_MARKER).exists()) return null;
            File modeFile = new File(dir, MODE_MARKER);
            if (modeFile.exists()) {
                byte[] bytes = new byte[16];
                int n;
                try (java.io.FileInputStream in = new java.io.FileInputStream(modeFile)) {
                    n = in.read(bytes);
                }
                String token = n > 0 ? new String(bytes, 0, n).trim().toLowerCase() : "";
                if ("black".equals(token)) return Mode.BLACK;
                if ("mute".equals(token)) return Mode.MUTE;
            }
        } catch (Throwable ignored) {
        }
        return Mode.BOTH;
    }
}
