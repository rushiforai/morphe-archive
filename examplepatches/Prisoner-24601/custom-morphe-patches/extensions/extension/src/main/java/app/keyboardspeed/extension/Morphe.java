package app.keyboardspeed.extension;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.Map;

/**
 * Access to the code of the official Morphe YouTube patches, which this bundle is applied together with.
 * <p>
 * The classes are looked up by reflection, so if a class is missing or renamed in another Morphe version,
 * only the feature that needs it stops working, and the app does not crash.
 */
final class Morphe {
    private static final String TAG = "KeyboardShortcuts";

    private static final String PACKAGE = "app.morphe.extension.youtube.";

    private Morphe() {
    }

    /**
     * A method of a Morphe class, looked up once.
     */
    private static final class Lookup {
        private final String className;
        private final String methodName;
        private final Class<?>[] parameterTypes;
        private boolean looked;
        private Method method;

        Lookup(String className, String methodName, Class<?>... parameterTypes) {
            this.className = className;
            this.methodName = methodName;
            this.parameterTypes = parameterTypes;
        }

        synchronized Method get() {
            if (!looked) {
                looked = true;
                try {
                    Class<?> type = Class.forName(PACKAGE + className, true, Morphe.class.getClassLoader());
                    method = type.getMethod(methodName, parameterTypes);
                } catch (Exception ex) {
                    Log.w(TAG, "Morphe method not found: " + className + "." + methodName, ex);
                }
            }
            return method;
        }
    }

    private static final Lookup GET_PLAYER_TYPE = new Lookup("shared.PlayerType", "getCurrent");
    private static final Lookup EXECUTE_COMMAND = new Lookup("patches.CommandRouterPatch",
            "executeCommand", byte[].class, Map.class);
    private static final Lookup PANELS_OPEN = new Lookup("shared.EngagementPanel", "checkIdsInQueue", List.class);
    private static final Lookup LAST_OPENED_PANEL = new Lookup("shared.EngagementPanel", "getLastOpenedPanelId");
    private static final Lookup GET_VIDEO_TIME = new Lookup("patches.VideoInformation", "getVideoTime");
    private static final Lookup GET_VIDEO_ID = new Lookup("patches.VideoInformation", "getVideoId");

    /**
     * @return The id of the video of the player, or null if not available.
     */
    static String getVideoId() {
        Method method = GET_VIDEO_ID.get();
        if (method == null) {
            return null;
        }
        try {
            String videoId = (String) method.invoke(null);
            return videoId == null || videoId.isEmpty() ? null : videoId;
        } catch (Exception ex) {
            Log.e(TAG, "getVideoId failure", ex);
            return null;
        }
    }
    private static final Lookup GET_PLAYBACK_SPEED = new Lookup("patches.VideoInformation", "getPlaybackSpeed");
    private static final Lookup CHANGE_PLAYBACK_SPEED = new Lookup("patches.VideoInformation",
            "changePlaybackSpeed", float.class);

    /**
     * @return The playback speed, or NaN if not available.
     */
    static float getPlaybackSpeed() {
        try {
            Method method = GET_PLAYBACK_SPEED.get();
            return method == null ? Float.NaN : (float) method.invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "getPlaybackSpeed failure", ex);
            return Float.NaN;
        }
    }

    /**
     * @return If the playback speed was changed.
     */
    static boolean changePlaybackSpeed(float speed) {
        try {
            Method method = CHANGE_PLAYBACK_SPEED.get();
            if (method == null) {
                return false;
            }
            method.invoke(null, speed);
            return true;
        } catch (Exception ex) {
            Log.e(TAG, "changePlaybackSpeed failure", ex);
            return false;
        }
    }
    private static final Lookup SEEK_TO = new Lookup("patches.VideoInformation", "seekTo", long.class);
    private static final Lookup GET_VIDEO_STATE = new Lookup("shared.VideoState", "getCurrent");
    private static final Lookup GET_CURRENT_QUALITY = new Lookup("patches.VideoInformation", "getCurrentQuality");
    private static final Lookup GET_QUALITY_NAME = new Lookup("patches.VideoInformation$VideoQualityInterface",
            "patch_getQualityName");

    /**
     * @return The playback time of the video in milliseconds, or -1 if not available.
     */
    static long getVideoTime() {
        try {
            Method method = GET_VIDEO_TIME.get();
            return method == null ? -1 : (long) method.invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "getVideoTime failure", ex);
            return -1;
        }
    }

    /**
     * Seeks the video. Must be called on the main thread.
     *
     * @return If the seek was done.
     */
    static boolean seekTo(long videoTime) {
        try {
            Method method = SEEK_TO.get();
            return method != null && Boolean.TRUE.equals(method.invoke(null, videoTime));
        } catch (Exception ex) {
            Log.e(TAG, "seekTo failure", ex);
            return false;
        }
    }

    /**
     * @return The name of the playback state, such as PLAYING or PAUSED, or null if not known.
     */
    static String getVideoState() {
        try {
            Method method = GET_VIDEO_STATE.get();
            Object state = method == null ? null : method.invoke(null);
            return state instanceof Enum<?> e ? e.name() : null;
        } catch (Exception ex) {
            Log.e(TAG, "getVideoState failure", ex);
            return null;
        }
    }

    /**
     * @return The name of the current video quality, such as "1080p60", or null if not known.
     */
    static String getQualityName() {
        try {
            Method current = GET_CURRENT_QUALITY.get();
            Method name = GET_QUALITY_NAME.get();
            Object quality = current == null ? null : current.invoke(null);
            return quality == null || name == null ? null : (String) name.invoke(quality);
        } catch (Exception ex) {
            Log.e(TAG, "getQualityName failure", ex);
            return null;
        }
    }

    /**
     * @return The name of the current player type, such as WATCH_WHILE_MAXIMIZED, or null if not known.
     */
    static String getPlayerType() {
        try {
            Method method = GET_PLAYER_TYPE.get();
            Object type = method == null ? null : method.invoke(null);
            return type instanceof Enum<?> e ? e.name() : null;
        } catch (Exception ex) {
            Log.e(TAG, "getPlayerType failure", ex);
            return null;
        }
    }

    static boolean isPlayerFullscreen() {
        return "WATCH_WHILE_FULLSCREEN".equals(getPlayerType());
    }

    /**
     * @return If a video is open in the full size player or fullscreen.
     *         True if the player type is not known, so the shortcuts still work.
     */
    static boolean isPlayerOpen() {
        String type = getPlayerType();
        return type == null || type.equals("WATCH_WHILE_MAXIMIZED") || type.equals("WATCH_WHILE_FULLSCREEN");
    }

    /**
     * Runs a YouTube command, the same as a command of a server response. Must be called on the main thread.
     *
     * @return If the command was run, or false if the Morphe command router is not available.
     */
    static boolean executeCommand(byte[] command) {
        try {
            Method method = EXECUTE_COMMAND.get();
            return method != null && Boolean.TRUE.equals(method.invoke(null, command, new java.util.HashMap<>()));
        } catch (Exception ex) {
            Log.e(TAG, "executeCommand failure", ex);
            return false;
        }
    }

    /**
     * @return If any of the engagement panels is open, or null if Morphe does not track the panels.
     */
    static Boolean isPanelOpen(List<String> panelIds) {
        try {
            Method method = PANELS_OPEN.get();
            return method == null ? null : (Boolean) method.invoke(null, panelIds);
        } catch (Exception ex) {
            Log.e(TAG, "isPanelOpen failure", ex);
            return null;
        }
    }

    /**
     * @return The id of the engagement panel opened last, or null if none or not tracked.
     */
    static String getLastOpenedPanelId() {
        try {
            Method method = LAST_OPENED_PANEL.get();
            return method == null ? null : (String) method.invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "getLastOpenedPanelId failure", ex);
            return null;
        }
    }

    /**
     * Enters or exits fullscreen with the fullscreen controller that Morphe hooks for its
     * 'Exit fullscreen mode' and 'Open videos fullscreen' patches.
     *
     * @return If the controller is available and the method was called.
     */
    static boolean setFullscreen(boolean enter) {
        try {
            Class<?> type = Class.forName(PACKAGE + "patches.OpenVideosFullscreenHookPatch",
                    true, Morphe.class.getClassLoader());
            Field field = type.getDeclaredField("fullscreenInterfaceRef");
            field.setAccessible(true);
            Object reference = field.get(null);
            Object controller = reference instanceof WeakReference<?> weak ? weak.get() : null;
            if (controller == null) {
                return false;
            }
            Class<?> controllerInterface = Class.forName(PACKAGE + "patches.OpenVideosFullscreenHookPatch$FullscreenInterface",
                    true, Morphe.class.getClassLoader());
            controllerInterface.getMethod(enter ? "patch_enterFullscreen" : "patch_exitFullscreen").invoke(controller);
            return true;
        } catch (Exception ex) {
            Log.w(TAG, "Morphe fullscreen controller not available", ex);
            return false;
        }
    }
}
