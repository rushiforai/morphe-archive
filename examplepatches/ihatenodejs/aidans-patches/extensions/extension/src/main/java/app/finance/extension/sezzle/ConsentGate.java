package app.finance.extension.sezzle;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;

/**
 * Presents the patched-app acknowledgement before the React Native surface becomes interactive.
 * Only an affirmative action records acknowledgement; declining leaves no stored state.
 */
public final class ConsentGate {
    private static final String PREFERENCES = "patch_consent";
    private static final String ACKNOWLEDGED = "acknowledged";

    private ConsentGate() {
    }

    public static void maybeShow(final Activity activity) {
        if (activity.isFinishing()) {
            return;
        }

        final SharedPreferences preferences = activity.getSharedPreferences(PREFERENCES, Activity.MODE_PRIVATE);
        if (preferences.getBoolean(ACKNOWLEDGED, false)) {
            return;
        }

        new AlertDialog.Builder(activity)
                .setTitle("Patched app warning")
                .setMessage("This is a modified version of Sezzle. It may behave unexpectedly and can put your financial information or account at risk. Continue only if you understand and accept these risks.")
                .setCancelable(false)
                .setPositiveButton("Yes, continue", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        if (preferences.edit().putBoolean(ACKNOWLEDGED, true).commit()) {
                            dialog.dismiss();
                        }
                    }
                })
                .setNegativeButton("No, exit", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                        activity.finishAndRemoveTask();
                    }
                })
                .show();
    }
}
