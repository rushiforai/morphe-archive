package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.media.AudioManager;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.SwitchPreference;
import android.view.HapticFeedbackConstants;
import android.view.View;

import java.lang.reflect.Field;

/** Optional haptic and system click feedback for Helakuru Lite key presses. */
public final class HelakuruLiteKeypressExtension {
    private static final String PAGE = "morphe_keypress_feedback_page";
    private static final String VIBRATE = "vibrate";
    private static final String SOUND = "sound";

    private HelakuruLiteKeypressExtension() { }

    public static void bindSettings(Object activityObject) {
        if (!(activityObject instanceof PreferenceActivity)) return;
        PreferenceActivity activity = (PreferenceActivity) activityObject;
        try {
            Preference pagePreference = activity.findPreference(PAGE);
            if (!(pagePreference instanceof android.preference.PreferenceScreen)) return;
            android.preference.PreferenceScreen page = (android.preference.PreferenceScreen) pagePreference;
            SharedPreferences lite = activity.getSharedPreferences("generalPreferences", Context.MODE_PRIVATE);
            bindSwitch(page, "morphe_keypress_vibrate", VIBRATE, lite);
            bindSwitch(page, "morphe_keypress_sound", SOUND, lite);
            HelakuruLiteSettingsExtension.applySettingsWindow(activity);
        } catch (Throwable ignored) {
            // Leave Lite's normal settings available if this build changes its preference hierarchy.
        }
    }

    private static void bindSwitch(android.preference.PreferenceScreen page,
                                   String key, String liteKey, SharedPreferences litePreferences) {
        Preference preference = page.findPreference(key);
        if (!(preference instanceof SwitchPreference)) return;
        SwitchPreference toggle = (SwitchPreference) preference;
        toggle.setPersistent(false);
        toggle.setChecked(litePreferences.getBoolean(liteKey, false));
        toggle.setOnPreferenceChangeListener((changed, value) -> {
            litePreferences.edit().putBoolean(liteKey, Boolean.TRUE.equals(value)).apply();
            return true;
        });
    }

    public static void onKeyPress(Object serviceObject, int keyCode) {
        if (!(serviceObject instanceof Context)) return;
        Context context = (Context) serviceObject;
        SharedPreferences preferences = context.getSharedPreferences("generalPreferences", Context.MODE_PRIVATE);
        if (preferences.getBoolean(VIBRATE, false)) {
            try {
                View keyboard = findKeyboardView(serviceObject);
                if (keyboard != null) keyboard.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            } catch (Throwable ignored) { }
        }
        if (preferences.getBoolean(SOUND, false)) {
            try {
                AudioManager audio = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
                if (audio != null) audio.playSoundEffect(soundEffectForKey(keyCode));
            } catch (Throwable ignored) { }
        }
    }

    private static int soundEffectForKey(int keyCode) {
        switch (keyCode) {
            case 32: // Space
                return AudioManager.FX_KEYPRESS_SPACEBAR;
            case -5: // Backspace / delete
                return AudioManager.FX_KEYPRESS_DELETE;
            case 10: // Enter / return
            case 84: // Search action key
                return AudioManager.FX_KEYPRESS_RETURN;
            default:
                return AudioManager.FX_KEYPRESS_STANDARD;
        }
    }

    private static View findKeyboardView(Object serviceObject) {
        Class<?> type = serviceObject.getClass();
        while (type != null) {
            try {
                Field field = type.getDeclaredField("keyboardView");
                field.setAccessible(true);
                Object value = field.get(serviceObject);
                return value instanceof View ? (View) value : null;
            } catch (NoSuchFieldException ignored) {
                type = type.getSuperclass();
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }
}
