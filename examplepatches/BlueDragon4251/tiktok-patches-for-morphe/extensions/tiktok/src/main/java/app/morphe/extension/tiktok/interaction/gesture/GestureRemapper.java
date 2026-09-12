package app.morphe.extension.tiktok.interaction.gesture;

import android.content.res.Resources;
import android.view.MotionEvent;

import java.lang.reflect.Method;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.cleardisplay.AutomaticClearDisplayController;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

/** Runtime policy and exact TikTok 46.4.3 native bridge for feed gesture remapping. */
@SuppressWarnings("unused")
public final class GestureRemapper {
    private static final int ACTION_DEFAULT = 0;
    private static final int ACTION_NONE = 1;

    private static final int SINGLE_PLAY_PAUSE = 2;
    private static final int SINGLE_CLEAR_DISPLAY = 3;

    private static final int DOUBLE_LIKE = 2;
    private static final int DOUBLE_PLAY_PAUSE = 3;
    private static final int DOUBLE_CLEAR_DISPLAY = 4;
    private static final int DOUBLE_SEEK_BACK_5 = 5;
    private static final int DOUBLE_SEEK_BACK_10 = 6;
    private static final int DOUBLE_SEEK_BACK_15 = 7;
    private static final int DOUBLE_SEEK_FORWARD_5 = 8;
    private static final int DOUBLE_SEEK_FORWARD_10 = 9;
    private static final int DOUBLE_SEEK_FORWARD_15 = 10;

    private static final int LONG_PRESS_SPEED_2X = 2;
    private static final int LONG_PRESS_CLEAR_DISPLAY = 3;

    private static final String BASE_LIST_FRAGMENT_PANEL =
            "com.ss.android.ugc.aweme.feed.panel.BaseListFragmentPanel";
    private static final String PLAYER_GETTER = "getPlayerManager";
    private static final String PLAYER_POSITION = "getCurrentPosition";
    private static final String PLAYER_DURATION = "getDuration";
    private static final String PLAYER_SEEK = "seek";

    private GestureRemapper() {
    }

    public static int singleTapAction() {
        String value = Settings.GESTURE_SINGLE_TAP_ACTION.get();
        if ("none".equals(value)) return ACTION_NONE;
        if ("play_pause".equals(value)) return SINGLE_PLAY_PAUSE;
        if ("clear_display".equals(value)) return SINGLE_CLEAR_DISPLAY;
        return ACTION_DEFAULT;
    }

    public static int doubleTapAction(MotionEvent event) {
        String side = isLeftHalf(event)
                ? Settings.GESTURE_DOUBLE_TAP_LEFT_ACTION.get()
                : Settings.GESTURE_DOUBLE_TAP_RIGHT_ACTION.get();
        int sideAction = parseSeekAction(side);
        if (sideAction != ACTION_DEFAULT) return sideAction;

        String value = Settings.GESTURE_DOUBLE_TAP_ACTION.get();
        if ("none".equals(value)) return ACTION_NONE;
        if ("like".equals(value)) return DOUBLE_LIKE;
        if ("play_pause".equals(value)) return DOUBLE_PLAY_PAUSE;
        if ("clear_display".equals(value)) return DOUBLE_CLEAR_DISPLAY;
        return ACTION_DEFAULT;
    }

    public static int longPressAction() {
        String value = Settings.GESTURE_LONG_PRESS_ACTION.get();
        if ("none".equals(value)) return ACTION_NONE;
        if ("speed_2x".equals(value)) return LONG_PRESS_SPEED_2X;
        if ("clear_display".equals(value)) return LONG_PRESS_CLEAR_DISPLAY;
        return ACTION_DEFAULT;
    }

    public static boolean isLongPressSpeedAction() {
        return SettingsStatus.gestureRemapperEnabled
                && "speed_2x".equals(Settings.GESTURE_LONG_PRESS_ACTION.get());
    }

    public static boolean shouldSuppressLongPressQuickShare() {
        return SettingsStatus.gestureRemapperEnabled
                && !"default".equals(Settings.GESTURE_LONG_PRESS_ACTION.get());
    }

    public static boolean showClearDisplay() {
        return AutomaticClearDisplayController.postNow();
    }

    /** Seek via TikTok's exact 46.4.3 BaseListFragmentPanel -> player manager bridge. */
    public static boolean handleConfiguredSeek(Object panel, MotionEvent event) {
        int deltaMs = seekDeltaMs(doubleTapAction(event));
        if (deltaMs == 0 || panel == null) return false;

        try {
            Class<?> panelClass = panel.getClass();
            if (!BASE_LIST_FRAGMENT_PANEL.equals(panelClass.getName())
                    && !isSubclassOf(panelClass, BASE_LIST_FRAGMENT_PANEL)) {
                return false;
            }

            Object player = invokeNoArg(panel, PLAYER_GETTER);
            if (player == null) return false;

            Object currentValue = invokeNoArg(player, PLAYER_POSITION);
            Object durationValue = invokeNoArg(player, PLAYER_DURATION);
            if (!(currentValue instanceof Number) || !(durationValue instanceof Number)) return false;

            long current = ((Number) currentValue).longValue();
            long duration = ((Number) durationValue).longValue();
            if (duration <= 0L) return false;

            long target = current + deltaMs;
            if (target < 0L) target = 0L;
            if (target > duration) target = duration;

            float progress = Math.max(0f, Math.min(1f, (float) target / (float) duration));
            Method seek = findMethod(player.getClass(), PLAYER_SEEK, float.class);
            if (seek == null) return false;
            seek.invoke(player, progress);

            if (BaseSettings.DEBUG.get()) {
                final long from = current;
                final long to = target;
                final float selectedProgress = progress;
                Logger.printInfo(() -> "[BlueIT Gesture] seek " + from + " -> " + to
                        + " progress=" + selectedProgress);
            }
            return true;
        } catch (Throwable throwable) {
            if (BaseSettings.DEBUG.get()) {
                Logger.printException(() -> "[BlueIT Gesture] native seek failed", throwable);
            }
            return false;
        }
    }

    private static boolean isLeftHalf(MotionEvent event) {
        if (event == null) return true;
        int width = Resources.getSystem().getDisplayMetrics().widthPixels;
        if (width <= 0) return event.getX() < 0f;
        return event.getRawX() < width / 2f;
    }

    private static int parseSeekAction(String value) {
        if ("seek_back_5".equals(value)) return DOUBLE_SEEK_BACK_5;
        if ("seek_back_10".equals(value)) return DOUBLE_SEEK_BACK_10;
        if ("seek_back_15".equals(value)) return DOUBLE_SEEK_BACK_15;
        if ("seek_forward_5".equals(value)) return DOUBLE_SEEK_FORWARD_5;
        if ("seek_forward_10".equals(value)) return DOUBLE_SEEK_FORWARD_10;
        if ("seek_forward_15".equals(value)) return DOUBLE_SEEK_FORWARD_15;
        return ACTION_DEFAULT;
    }

    private static int seekDeltaMs(int action) {
        switch (action) {
            case DOUBLE_SEEK_BACK_5: return -5_000;
            case DOUBLE_SEEK_BACK_10: return -10_000;
            case DOUBLE_SEEK_BACK_15: return -15_000;
            case DOUBLE_SEEK_FORWARD_5: return 5_000;
            case DOUBLE_SEEK_FORWARD_10: return 10_000;
            case DOUBLE_SEEK_FORWARD_15: return 15_000;
            default: return 0;
        }
    }

    private static boolean isSubclassOf(Class<?> type, String expectedName) {
        Class<?> current = type.getSuperclass();
        while (current != null) {
            if (expectedName.equals(current.getName())) return true;
            current = current.getSuperclass();
        }
        return false;
    }

    private static Object invokeNoArg(Object target, String methodName) throws Exception {
        Method method = findMethod(target.getClass(), methodName);
        if (method == null) return null;
        return method.invoke(target);
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... parameterTypes) {
        Class<?> current = type;
        while (current != null) {
            try {
                Method method = current.getDeclaredMethod(name, parameterTypes);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
                current = current.getSuperclass();
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }
}
