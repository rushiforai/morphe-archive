package app.keyboardspeed.extension;

import android.app.Activity;
import android.content.Context;
import android.media.AudioManager;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Steps the video one frame back or forward with the , and . keys of a hardware keyboard,
 * like on the YouTube website. Holding a key repeats the step. The video is paused first.
 */
@SuppressWarnings("unused")
public final class KeyboardFrameStepPatch {
    private static final String TAG = "KeyboardFrameStep";

    /**
     * Frame rate used if the frame rate of the video is not known, such as for a quality named "1080p".
     */
    private static final int DEFAULT_FRAME_RATE = 30;

    /**
     * Frame rate in the name of a video quality, such as the 60 of "1080p60".
     */
    private static final Pattern QUALITY_FRAME_RATE = Pattern.compile("\\d{3,4}p(\\d{2,3})");

    /**
     * Steps less than this apart continue from the time of the previous step, instead of the time
     * the player reports, which can lag behind the seeks while a key is held.
     */
    private static final long CONTINUE_STEPS_MS = 1000;

    /**
     * Time between the steps of a held , key. Each step seeks back, which decodes the video from
     * the previous keyframe, and faster steps cancel each other before the frame is shown.
     */
    private static final long BACKWARD_REPEAT_MS = 250;

    /**
     * Holding . plays the video slowly instead of stepping, as seeking forward keeps reaching video
     * that is not yet loaded while the video is paused, and the frame then freezes.
     */
    private static final float FORWARD_HOLD_SPEED = 0.25f;

    private static double targetTime = -1;
    private static long lastStepTime;

    /**
     * Playback speed before holding . started slow playback, or NaN if not playing slowly.
     */
    private static float speedBeforeHold = Float.NaN;

    private KeyboardFrameStepPatch() {
    }

    /**
     * Frame rate chosen in the patch options, or 0 for the frame rate of the video quality.
     * The body is replaced at patch time.
     */
    private static int getFrameRate() {
        return 0;
    }

    /**
     * @return Whether the event was consumed.
     */
    static boolean handleKey(Activity activity, KeyEvent event) {
        final int direction;
        switch (event.getKeyCode()) {
            case KeyEvent.KEYCODE_COMMA:
                direction = -1;
                break;
            case KeyEvent.KEYCODE_PERIOD:
                direction = 1;
                break;
            default:
                return false;
        }

        // Shift gives < and >, which keep their default action.
        if (event.isShiftPressed() || !Morphe.isPlayerOpen()) {
            return false;
        }

        final long now = SystemClock.uptimeMillis();
        if (event.getAction() == KeyEvent.ACTION_UP) {
            stopSlowPlayback(activity);
        } else if (event.getAction() == KeyEvent.ACTION_DOWN) {
            if (event.getRepeatCount() == 0) {
                stopSlowPlayback(activity);
                step(activity, direction, now);
            } else if (direction > 0) {
                startSlowPlayback(activity);
            } else if (now - lastStepTime >= BACKWARD_REPEAT_MS) {
                step(activity, direction, now);
            }
        }
        return true;
    }

    /**
     * Plays the video slowly while . is held, after the first frame step.
     */
    private static void startSlowPlayback(Activity activity) {
        if (!Float.isNaN(speedBeforeHold)) {
            return; // Already playing slowly.
        }
        final float speed = Morphe.getPlaybackSpeed();
        if (Float.isNaN(speed) || !Morphe.changePlaybackSpeed(FORWARD_HOLD_SPEED)) {
            return;
        }
        speedBeforeHold = speed;
        sendMediaKey(activity, KeyEvent.KEYCODE_MEDIA_PLAY);
        log("slow playback from speed " + speed);
    }

    /**
     * Pauses the slow playback of a held . and restores the playback speed.
     */
    private static void stopSlowPlayback(Activity activity) {
        if (Float.isNaN(speedBeforeHold)) {
            return;
        }
        sendMediaKey(activity, KeyEvent.KEYCODE_MEDIA_PAUSE);
        Morphe.changePlaybackSpeed(speedBeforeHold);
        speedBeforeHold = Float.NaN;
        // The video moved while playing, so the next step starts from the time of the player.
        targetTime = -1;
        log("slow playback stopped at " + Morphe.getVideoTime());
    }

    private static void log(String message) {
        if (Log.isLoggable(TAG, Log.DEBUG)) {
            Log.d(TAG, message);
        }
    }

    private static void step(Activity activity, int direction, long now) {
        if (!"PAUSED".equals(Morphe.getVideoState())) {
            sendMediaKey(activity, KeyEvent.KEYCODE_MEDIA_PAUSE);
        }

        if (targetTime < 0 || now - lastStepTime > CONTINUE_STEPS_MS) {
            final long videoTime = Morphe.getVideoTime();
            if (videoTime < 0) {
                return;
            }
            targetTime = videoTime;
        }

        targetTime = Math.max(0, targetTime + direction * 1000.0 / frameRate());
        lastStepTime = now;
        log("step " + direction + " to " + Math.round(targetTime)
                + " player time " + Morphe.getVideoTime() + " state " + Morphe.getVideoState());
        if (!Morphe.seekTo(Math.round(targetTime))) {
            // Such as at the end of the video, or while the video is loading.
            targetTime = -1;
        }
    }

    private static int frameRate() {
        final int chosen = getFrameRate();
        if (chosen > 0) {
            return chosen;
        }

        String quality = Morphe.getQualityName();
        if (quality != null) {
            Matcher matcher = QUALITY_FRAME_RATE.matcher(quality);
            if (matcher.find()) {
                return Integer.parseInt(matcher.group(1));
            }
        }
        return DEFAULT_FRAME_RATE;
    }

    /**
     * Pauses or plays the video the same as the media keys of a keyboard or headset.
     * Pause does nothing if already paused, and play does nothing if already playing.
     */
    private static void sendMediaKey(Activity activity, int keyCode) {
        try {
            AudioManager audioManager = (AudioManager) activity.getSystemService(Context.AUDIO_SERVICE);
            audioManager.dispatchMediaKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, keyCode));
            audioManager.dispatchMediaKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, keyCode));
        } catch (Exception ex) {
            Log.e(TAG, "sendMediaKey failure", ex);
        }
    }
}
