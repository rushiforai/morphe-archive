package app.kirklandpickles.gboardofflinevoice;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.provider.Settings;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Toast;

/** Routes Gboard's launcher to Android's keyboard setup without its network-dependent setup flow. */
public final class LauncherSetup {
    private LauncherSetup() {}

    public static void open(Activity activity) {
        InputMethodManager manager = activity.getSystemService(InputMethodManager.class);
        InputMethodInfo gboard = findGboard(activity, manager);
        if (gboard == null) {
            openSystemSettings(activity);
            return;
        }

        boolean enabled = false;
        for (InputMethodInfo inputMethod : manager.getEnabledInputMethodList()) {
            if (gboard.getId().equals(inputMethod.getId())) {
                enabled = true;
                break;
            }
        }

        String selected = Settings.Secure.getString(
                activity.getContentResolver(), Settings.Secure.DEFAULT_INPUT_METHOD);
        if (!enabled || !gboard.getId().equals(selected)) {
            openSystemSettings(activity);
            return;
        }

        String settingsActivity = gboard.getSettingsActivity();
        if (settingsActivity == null) {
            openSystemSettings(activity);
            return;
        }

        try {
            String packageName = activity.getPackageName();
            if (settingsActivity.startsWith(".")) settingsActivity = packageName + settingsActivity;
            activity.startActivity(new Intent().setClassName(packageName, settingsActivity));
            activity.finish();
        } catch (ActivityNotFoundException | SecurityException exception) {
            openSystemSettings(activity);
        }
    }

    private static InputMethodInfo findGboard(Activity activity, InputMethodManager manager) {
        if (manager == null) return null;
        for (InputMethodInfo inputMethod : manager.getInputMethodList()) {
            if (activity.getPackageName().equals(inputMethod.getPackageName())) return inputMethod;
        }
        return null;
    }

    private static void openSystemSettings(Activity activity) {
        try {
            activity.startActivity(new Intent(Settings.ACTION_INPUT_METHOD_SETTINGS));
        } catch (ActivityNotFoundException | SecurityException exception) {
            Toast.makeText(activity, "Open Android keyboard settings to set up Gboard", Toast.LENGTH_LONG).show();
        }
        activity.finishAndRemoveTask();
    }
}
