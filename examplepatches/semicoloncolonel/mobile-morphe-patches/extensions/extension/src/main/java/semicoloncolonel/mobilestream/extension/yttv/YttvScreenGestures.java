package semicoloncolonel.mobilestream.extension.yttv;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.media.AudioManager;
import android.provider.Settings;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.WindowManager;

/**
 * Volume and brightness swipe sliders for the YouTube TV player.
 *
 * Called for every touch on the watch screen's root layout (WatchLayout), which
 * sits above the whole player, through YttvPlayerTouch. A vertical drag
 * on the right half changes the media volume; on the left half, the screen
 * brightness of the app's own window. All the way down is mute for volume and
 * automatic (follow the system) for brightness.
 *
 * It only acts while the player fills the watch screen (fullscreen), and not in
 * the top and bottom edge bands, so the system bars and the mini player drag are
 * left alone. Taps, double taps, and horizontal drags go through untouched.
 */
public final class YttvScreenGestures {

    private static final float EDGE_BAND = 0.08f; // fraction of height ignored at top and bottom

    private static boolean tracking;
    private static boolean engaged;
    private static boolean leftSide;
    private static float downX, downY, lastY;
    private static float level; // 0..1

    private static Activity activity;
    private static AudioManager audioManager;
    private static int maxVolume;

    private YttvScreenGestures() {}

    /**
     * Every touch event on the watch screen. Returns YttvPlayerTouch.PASS,
     * CONSUME, or CANCEL_CHILDREN (once, when a vertical drag is taken over).
     */
    public static int handle(View view, MotionEvent event) {
        try {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                begin(view, event);
                return YttvPlayerTouch.PASS;
            }
            if (action == MotionEvent.ACTION_POINTER_DOWN) {
                if (!engaged) tracking = false; // second finger: pinch, not ours
                return engaged ? YttvPlayerTouch.CONSUME : YttvPlayerTouch.PASS;
            }
            if (action == MotionEvent.ACTION_MOVE) {
                if (engaged) {
                    adjust(view, event);
                    return YttvPlayerTouch.CONSUME;
                }
                if (tracking && tryEngage(view, event)) return YttvPlayerTouch.CANCEL_CHILDREN;
                return YttvPlayerTouch.PASS;
            }
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                boolean was = engaged;
                reset();
                return was ? YttvPlayerTouch.CONSUME : YttvPlayerTouch.PASS;
            }
            return engaged ? YttvPlayerTouch.CONSUME : YttvPlayerTouch.PASS;
        } catch (Throwable t) {
            reset();
            return YttvPlayerTouch.PASS;
        }
    }

    private static void begin(View view, MotionEvent event) {
        engaged = false;
        downX = event.getX();
        downY = event.getY();
        lastY = downY;
        int height = view.getHeight();
        boolean inBand = downY < height * EDGE_BAND || downY > height * (1f - EDGE_BAND);
        boolean full = YttvPlayerTouch.playerFillsScreen(view);
        tracking = full && !inBand;
    }

    private static boolean tryEngage(View view, MotionEvent event) {
        float dx = Math.abs(event.getX() - downX);
        float dy = Math.abs(event.getY() - downY);
        float slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop() * 2f;
        if (dy > slop && dy > dx * 1.5f) {
            leftSide = downX < view.getWidth() / 2f;
            Context context = view.getContext();
            if (leftSide) {
                activity = findActivity(context);
                if (activity == null) {
                    tracking = false;
                    return false;
                }
                level = currentBrightness(activity);
            } else {
                audioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
                if (audioManager == null) {
                    tracking = false;
                    return false;
                }
                maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
                level = maxVolume > 0
                    ? audioManager.getStreamVolume(AudioManager.STREAM_MUSIC) / (float) maxVolume
                    : 0f;
            }
            engaged = true;
            lastY = event.getY();
            return true;
        }
        if (dx > slop && dx >= dy) {
            tracking = false; // horizontal: leave it for the player
        }
        return false;
    }

    private static void adjust(View view, MotionEvent event) {
        int height = view.getHeight();
        if (height <= 0) return;
        float y = event.getY();
        // Moving the finger up raises the level.
        level += (lastY - y) / (height * 0.8f);
        lastY = y;
        if (level < 0f) level = 0f;
        if (level > 1f) level = 1f;

        if (leftSide) {
            WindowManager.LayoutParams lp = activity.getWindow().getAttributes();
            lp.screenBrightness = level <= 0f
                ? WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE
                : level;
            activity.getWindow().setAttributes(lp);
        } else {
            audioManager.setStreamVolume(AudioManager.STREAM_MUSIC,
                Math.round(level * maxVolume), AudioManager.FLAG_SHOW_UI);
        }
    }

    private static void reset() {
        tracking = false;
        engaged = false;
    }

    private static float currentBrightness(Activity activity) {
        float b = activity.getWindow().getAttributes().screenBrightness;
        if (b >= 0f) return b;
        // Following the system: start from the system brightness.
        try {
            int system = Settings.System.getInt(activity.getContentResolver(), Settings.System.SCREEN_BRIGHTNESS);
            return Math.max(0.01f, system / 255f);
        } catch (Throwable t) {
            return 0.5f;
        }
    }

    private static Activity findActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
