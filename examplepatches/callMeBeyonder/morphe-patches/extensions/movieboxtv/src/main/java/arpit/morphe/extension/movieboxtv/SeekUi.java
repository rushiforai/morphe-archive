package arpit.morphe.extension.movieboxtv;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Drives the "Seek step" entry in the SPEED tab.
 *
 * <p>The TV panel only has four quick-setting types (Quality/Speed/Aspect/Language). Adding a
 * fifth enum/quick button would require enum and layout surgery. Instead the SPEED option list
 * carries one extra "Seek step" entry; selecting it swaps the option row to the five seek presets.
 * Selecting a preset stores the step and restores the normal speed multipliers.
 */
public final class SeekUi {

    private static final String TAG = "MB_SeekUi";

    private static final String SETTING_TYPE =
        "com.transsion.tvplayer.TvPlayerSettingsPanel$SettingType";

    private SeekUi() {
    }

    /** Called at the top of FullScreenFragment.w1(type, option). */
    public static boolean handle(Object fragment, Object type, Object option) {
        if (fragment == null || option == null || !"SPEED".equals(String.valueOf(type))) {
            return false;
        }
        String label = stringValue(option, "getLabel", "d");
        if (label == null) {
            return false;
        }
        Log.i(TAG, "handle type=" + type + " label=" + label);
        if ("Seek step".equals(label)) {
            openSeek(fragment);
            return true;
        }
        if (!label.startsWith("Seek ")) {
            return false;
        }
        String value = stringValue(option, "getValue", "e");
        try {
            PlayInfo.storeSeekStep(Integer.parseInt(value));
        } catch (Throwable ex) {
            Log.w(TAG, "seek step parse failed: " + value);
        }
        restoreSpeeds(fragment);
        return true;
    }

    private static void openSeek(Object fragment) {
        Object panel = panel(fragment);
        Object speed = speedType();
        if (panel == null || speed == null) {
            Log.w(TAG, "openSeek unavailable: panel=" + (panel != null) + " type=" + (speed != null));
            return;
        }
        List<Object> presets = PlayInfo.seekChips();
        Log.i(TAG, "openSeek presets=" + presets.size());
        setOptions(panel, speed, presets);
        switchType(panel, speed);
        enterOptions(panel);
    }

    private static void restoreSpeeds(Object fragment) {
        Object panel = panel(fragment);
        Object speed = speedType();
        if (panel == null || speed == null) {
            return;
        }
        List<Object> stock = PlayInfo.withSeekEntry(stockSpeeds(fragment));
        setOptions(panel, speed, stock);
        switchType(panel, speed);
        enterOptions(panel);
    }

    private static void enterOptions(Object panel) {
        try {
            panel.getClass().getMethod("d0").invoke(panel);
            Log.i(TAG, "entered SPEED options");
            return;
        } catch (Throwable ignored) {
            // Fall through to the decompiled name for other builds.
        }
        try {
            panel.getClass().getMethod("m46072d0").invoke(panel);
            Log.i(TAG, "entered SPEED options");
        } catch (Throwable ex) {
            Log.w(TAG, "enterOptions failed: " + ex.getMessage());
        }
    }

    private static List<Object> stockSpeeds(Object fragment) {
        try {
            Method method = fragment.getClass().getDeclaredMethod("h1");
            method.setAccessible(true);
            Object value = method.invoke(fragment);
            if (value instanceof List) {
                List<Object> result = new ArrayList<>();
                result.addAll((List<?>) value);
                return result;
            }
        } catch (Throwable ex) {
            Log.w(TAG, "stock speed list unavailable: " + ex.getMessage());
        }
        return Collections.emptyList();
    }

    private static Object findPlayerView(View view) {
        if (view.getClass().getName().equals("com.transsion.tvplayer.TvPlayerView")) {
            return view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Object found = findPlayerView(group.getChildAt(i));
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    private static Object panel(Object fragment) {
        try {
            Object root = fragment.getClass().getMethod("getView").invoke(fragment);
            if (root instanceof View) {
                Object playerView = findPlayerView((View) root);
                if (playerView != null) {
                    return playerView.getClass().getMethod("getSettingsPanel").invoke(playerView);
                }
            }
        } catch (Throwable ex) {
            Log.w(TAG, "view-tree panel unavailable: " + ex.getMessage());
        }
        try {
            for (Method method : fragment.getClass().getDeclaredMethods()) {
                if (method.getParameterTypes().length != 0 || method.getReturnType() == void.class) {
                    continue;
                }
                Class<?> returnType = method.getReturnType();
                Field playerViewField = null;
                for (Field field : returnType.getDeclaredFields()) {
                    if (field.getType().getName().endsWith("TvPlayerView")) {
                        playerViewField = field;
                        break;
                    }
                }
                if (playerViewField == null) {
                    continue;
                }
                method.setAccessible(true);
                Object binding = method.invoke(fragment);
                if (binding == null) {
                    continue;
                }
                playerViewField.setAccessible(true);
                Object playerView = playerViewField.get(binding);
                if (playerView == null) {
                    continue;
                }
                return playerView.getClass().getMethod("getSettingsPanel").invoke(playerView);
            }
        } catch (Throwable ex) {
            Log.w(TAG, "settings panel unavailable: " + ex.getMessage());
        }
        return null;
    }

    private static Object speedType() {
        try {
            Class<?> type = Class.forName(SETTING_TYPE);
            @SuppressWarnings({ "rawtypes", "unchecked" })
            Object value = Enum.valueOf((Class<? extends Enum>) type, "SPEED");
            return value;
        } catch (Throwable ex) {
            Log.w(TAG, "SPEED type unavailable: " + ex.getMessage());
            return null;
        }
    }

    private static void setOptions(Object panel, Object type, List<Object> options) {
        try {
            Class<?> typeClass = Class.forName(SETTING_TYPE);
            panel.getClass().getMethod("setOptions", typeClass, List.class)
                .invoke(panel, type, options);
        } catch (Throwable ex) {
            Log.w(TAG, "setOptions failed: " + ex.getMessage());
        }
    }

    private static void switchType(Object panel, Object type) {
        try {
            Class<?> typeClass = Class.forName(SETTING_TYPE);
            panel.getClass().getMethod("switchSettingType", typeClass).invoke(panel, type);
        } catch (Throwable ex) {
            Log.w(TAG, "switchSettingType failed: " + ex.getMessage());
        }
    }

    private static String stringValue(Object target, String... methods) {
        for (String methodName : methods) {
            try {
                Object value = target.getClass().getMethod(methodName).invoke(target);
                if (value instanceof String) {
                    return (String) value;
                }
            } catch (Throwable ignored) {
                // Try the next name.
            }
        }
        return null;
    }
}
