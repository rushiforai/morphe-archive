package app.morphe.extension.youtube.patches.swipe;

import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewConfiguration;

import java.util.List;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider.SwipeZoneAction;

@SuppressWarnings({"unused", "deprecation"})
public class SwipeControlsPatch {
    private static boolean isActionAssigned(SwipeZoneAction action) {
        return Settings.SWIPE_LEFT_ZONE.get() == action
                || Settings.SWIPE_RIGHT_ZONE.get() == action
                || Settings.SWIPE_TOP_ZONE.get() == action
                || Settings.SWIPE_BOTTOM_ZONE.get() == action;
    }

    /**
     * Injection point.
     */
    public static boolean disableHDRAutoBrightness() {
        return Settings.DISABLE_HDR_AUTO_BRIGHTNESS.get();
    }

    /**
     * Injection point.
     */
    public static boolean disableSwipeToEnterFullscreenModeBelowThePlayer() {
        return !Settings.DISABLE_SWIPE_TO_ENTER_FULLSCREEN_MODE_BELOW_THE_PLAYER.get();
    }

    /**
     * Injection point.
     */
    public static boolean disableSwipeToEnterFullscreenModeBelowThePlayer(String nextGestureType) {
        Logger.printDebug(() -> "The next player gesture will be: " + nextGestureType);
        return ("MAXIMIZED_TO_FULLSCREEN_SLIDING".equals(nextGestureType) &&
                Settings.DISABLE_SWIPE_TO_ENTER_FULLSCREEN_MODE_BELOW_THE_PLAYER.get()) ||
                ("MAXIMIZED_PULLED_UP".equals(nextGestureType) &&
                Settings.DISABLE_SWIPE_TO_ENTER_FULLSCREEN_MODE_IN_THE_PLAYER.get()) ||
                ("FULLSCREEN_DRAGGED_DOWN".equals(nextGestureType) &&
                Settings.DISABLE_SWIPE_TO_EXIT_FULLSCREEN_MODE.get());
    }

    /**
     * Injection point.
     */
    public static boolean disableSwipeToEnterFullscreenModeInThePlayer(boolean original) {
        return !Settings.DISABLE_SWIPE_TO_ENTER_FULLSCREEN_MODE_IN_THE_PLAYER.get() && original;
    }

    /**
     * Injection point.
     */
    public static boolean disableSwipeToExitFullscreenMode(boolean original) {
        return !Settings.DISABLE_SWIPE_TO_EXIT_FULLSCREEN_MODE.get() && original;
    }

    private static boolean disableZoomGesture() {
        return Settings.DISABLE_FULLSCREEN_ZOOM_GESTURE.get();
    }

    private static float zoomTouchDownX, zoomTouchDownY;
    private static boolean zoomFirstPointerMoved;
    private static long zoomSecondPointerDownTime;

    /**
     * Injection point. Track whether the player's touch can still be a two-finger tap.
     */
    public static void onZoomTouchEvent(View view, MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                zoomTouchDownX = event.getRawX();
                zoomTouchDownY = event.getRawY();
                zoomFirstPointerMoved = false;
                zoomSecondPointerDownTime = 0;
                break;
            case MotionEvent.ACTION_POINTER_DOWN:
                if (event.getPointerCount() == 2) {
                    zoomSecondPointerDownTime = event.getEventTime();
                }
                break;
            case MotionEvent.ACTION_MOVE:
                if (!zoomFirstPointerMoved) {
                    final float touchSlop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                    zoomFirstPointerMoved = Math.abs(event.getRawX() - zoomTouchDownX) > touchSlop
                            || Math.abs(event.getRawY() - zoomTouchDownY) > touchSlop;
                }
                break;
        }
    }

    /**
     * Injection point. Do not let a small finger separation steal a two-finger chapter-skip tap.
     * A later move can begin zooming once the touch can no longer be a tap.
     */
    public static boolean disableZoomGestureBegin(ScaleGestureDetector detector) {
        if (disableZoomGesture()) {
            return true;
        }

        return !zoomFirstPointerMoved && zoomSecondPointerDownTime != 0
                && detector.getEventTime() - zoomSecondPointerDownTime < ViewConfiguration.getDoubleTapTimeout();
    }

    /**
     * Injection point.
     */
    public static boolean enableSwipeToSwitchVideo() {
        return Settings.ENABLE_SWIPE_TO_SWITCH_VIDEO.get();
    }

    public static final class SwipeOverlayBrightnessColorAvailability implements Setting.Availability {
        @Override
        public boolean isAvailable() {
            return isActionAssigned(SwipeZoneAction.BRIGHTNESS) &&
                    !Settings.SWIPE_OVERLAY_STYLE.get().isLegacy();
        }

        @Override
        public List<Setting<?>> getParentSettings() {
            return List.of(
                    Settings.SWIPE_LEFT_ZONE,
                    Settings.SWIPE_RIGHT_ZONE,
                    Settings.SWIPE_TOP_ZONE,
                    Settings.SWIPE_BOTTOM_ZONE,
                    Settings.SWIPE_OVERLAY_STYLE
            );
        }
    }

    public static final class SwipeOverlayVolumeColorAvailability implements Setting.Availability {
        @Override
        public boolean isAvailable() {
            return isActionAssigned(SwipeZoneAction.VOLUME) &&
                    !Settings.SWIPE_OVERLAY_STYLE.get().isLegacy();
        }

        @Override
        public List<Setting<?>> getParentSettings() {
            return List.of(
                    Settings.SWIPE_LEFT_ZONE,
                    Settings.SWIPE_RIGHT_ZONE,
                    Settings.SWIPE_TOP_ZONE,
                    Settings.SWIPE_BOTTOM_ZONE,
                    Settings.SWIPE_OVERLAY_STYLE
            );
        }
    }

    public static final class SwipeOverlaySpeedColorAvailability implements Setting.Availability {
        @Override
        public boolean isAvailable() {
            return isActionAssigned(SwipeZoneAction.SPEED) &&
                    !Settings.SWIPE_OVERLAY_STYLE.get().isLegacy();
        }

        @Override
        public List<Setting<?>> getParentSettings() {
            return List.of(
                    Settings.SWIPE_LEFT_ZONE,
                    Settings.SWIPE_RIGHT_ZONE,
                    Settings.SWIPE_TOP_ZONE,
                    Settings.SWIPE_BOTTOM_ZONE,
                    Settings.SWIPE_OVERLAY_STYLE
            );
        }
    }

    public static final class SwipeOverlaySeekColorAvailability implements Setting.Availability {
        @Override
        public boolean isAvailable() {
            return isActionAssigned(SwipeZoneAction.SEEK) &&
                    !Settings.SWIPE_OVERLAY_STYLE.get().isLegacy();
        }

        @Override
        public List<Setting<?>> getParentSettings() {
            return List.of(
                    Settings.SWIPE_LEFT_ZONE,
                    Settings.SWIPE_RIGHT_ZONE,
                    Settings.SWIPE_TOP_ZONE,
                    Settings.SWIPE_BOTTOM_ZONE,
                    Settings.SWIPE_OVERLAY_STYLE
            );
        }
    }
}
