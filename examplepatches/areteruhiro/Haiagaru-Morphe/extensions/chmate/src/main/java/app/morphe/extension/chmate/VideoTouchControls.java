package app.morphe.extension.chmate;

import android.media.AudioManager;
import android.provider.Settings;
import android.view.*;

/** Native player gestures only. Never intercept toolbar or MediaController's separate window. */
final class VideoTouchControls {
    private final VideoViewerActivity activity;
    private final GestureDetector taps;
    private final GestureDetector.SimpleOnGestureListener tapListener;
    private final AudioManager audio;
    private boolean tracking, adjusting, left, enabled;
    private float startX, startY, height, startBrightness;
    private int startVolume;

    VideoTouchControls(VideoViewerActivity activity) {
        this.activity = activity;
        audio = (AudioManager) activity.getSystemService(android.content.Context.AUDIO_SERVICE);
        tapListener = new GestureDetector.SimpleOnGestureListener() {
            @Override public boolean onDown(MotionEvent e) { return true; }
            @Override public boolean onSingleTapUp(MotionEvent e) {
                if (!VideoViewerSettings.prefs(activity).getBoolean("videoDoubleTapSeek", false)) {
                    activity.toggleControls(); return true;
                }
                return false;
            }
            @Override public void onLongPress(MotionEvent e) {
                activity.beginHoldSpeed();
            }
            @Override public boolean onSingleTapConfirmed(MotionEvent e) {
                activity.toggleControls(); return true;
            }
            @Override public boolean onDoubleTap(MotionEvent e) {
                if (VideoViewerSettings.prefs(activity).getBoolean("videoDoubleTapSeek", false)) {
                    activity.seekRelative((e.getRawX() < activity.videoMidpoint() ? -1 : 1)
                            * VideoViewerSettings.skipSeconds(activity));
                }
                return true;
            }
        };
        taps = new GestureDetector(activity, tapListener);
    }

    boolean dispatch(MotionEvent event, View surface) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            tracking = adjusting = false;
            int[] p = new int[2]; surface.getLocationOnScreen(p);
            float x = event.getRawX(), y = event.getRawY();
            if (x < p[0] || x >= p[0] + surface.getWidth() || y < p[1] || y >= p[1] + surface.getHeight()
                    || activity.isVideoToolbarTouch(x, y)) { cancelTap(); return false; }
            tracking = true; startX = x; startY = y; height = Math.max(1, surface.getHeight());
            taps.setOnDoubleTapListener(VideoViewerSettings.prefs(activity).getBoolean("videoDoubleTapSeek", false)
                    ? tapListener : null);
            left = x < p[0] + surface.getWidth() / 2f;
            enabled = VideoViewerSettings.prefs(activity).getBoolean(left ? "videoSwipeBrightness" : "videoSwipeVolume", false);
            startBrightness = activity.getWindow().getAttributes().screenBrightness;
            if (startBrightness < 0) startBrightness = Settings.System.getInt(activity.getContentResolver(), Settings.System.SCREEN_BRIGHTNESS, 128) / 255f;
            startVolume = audio == null ? 0 : audio.getStreamVolume(AudioManager.STREAM_MUSIC);
        }
        if (!tracking) return false;
        if (event.getPointerCount() > 1 || action == MotionEvent.ACTION_CANCEL) { cancel(); return false; }
        if (activity.isHoldSpeedActive()) {
            if (action == MotionEvent.ACTION_UP) { cancelTap(); activity.endHoldSpeed(); tracking = false; }
            return true;
        }
        float dx = event.getRawX() - startX, dy = event.getRawY() - startY;
        float slop = Math.max(ViewConfiguration.get(activity).getScaledTouchSlop() * 2,
                24 * activity.getResources().getDisplayMetrics().density);
        if (action == MotionEvent.ACTION_MOVE && enabled && !adjusting && Math.abs(dy) > slop && Math.abs(dy) > Math.abs(dx) * 1.3f) {
            adjusting = true;
            activity.endHoldSpeed();
            cancelTap(); activity.cancelNativeVideoGesture();
            MotionEvent cancel = MotionEvent.obtain(event); cancel.setAction(MotionEvent.ACTION_CANCEL);
            activity.dispatchVideoTouch(cancel); cancel.recycle();
        }
        if (adjusting) {
            if (action == MotionEvent.ACTION_MOVE) adjust(-dy / (height * 0.65f));
            if (action == MotionEvent.ACTION_UP) tracking = false;
            return true;
        }
        taps.onTouchEvent(event);
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) activity.endHoldSpeed();
        if (action == MotionEvent.ACTION_UP) tracking = false;
        return false;
    }
    private void adjust(float delta) {
        if (left) {
            WindowManager.LayoutParams params = activity.getWindow().getAttributes();
            params.screenBrightness = Math.max(0.02f, Math.min(1f, startBrightness + delta));
            activity.getWindow().setAttributes(params);
            activity.gestureStatus("明るさ " + Math.round(params.screenBrightness * 100) + "%");
        } else if (audio != null) {
            int max = audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
            int value = Math.max(0, Math.min(max, Math.round(startVolume + delta * max)));
            try { audio.setStreamVolume(AudioManager.STREAM_MUSIC, value, 0); }
            catch (SecurityException denied) { activity.gestureStatus("音量を変更できません"); return; }
            activity.gestureStatus("音量 " + (max == 0 ? 0 : Math.round(value * 100f / max)) + "%");
        }
    }
    private void cancelTap() {
        MotionEvent cancel = MotionEvent.obtain(0, 0, MotionEvent.ACTION_CANCEL, 0, 0, 0);
        taps.onTouchEvent(cancel); cancel.recycle();
    }
    void cancel() { cancelTap(); activity.endHoldSpeed(); tracking = adjusting = false; }
}
