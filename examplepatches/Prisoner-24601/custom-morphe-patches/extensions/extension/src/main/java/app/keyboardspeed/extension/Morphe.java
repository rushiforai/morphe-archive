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
