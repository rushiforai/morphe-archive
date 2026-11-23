package app.tiktoklitepatches.extension;

import static app.tiktoklitepatches.extension.ModStrings.Text.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;

public final class ProfileSettingsMenu {
    private ProfileSettingsMenu() {}

    public static void show(Context context) {
        Activity activity = findActivity(context);
        if (activity == null || activity.isFinishing()) {
            openOriginal(context);
            return;
        }
        ModStrings strings = ModStrings.forContext(activity);
        new AlertDialog.Builder(activity)
                .setItems(new String[]{strings.get(NATIVE_SETTINGS), strings.get(SETTINGS)}, (dialog, choice) -> {
                    if (choice == 0) openOriginal(context);
                    else activity.startActivity(new Intent(activity, ModSettingsActivity.class));
                })
                .show();
    }

    private static Activity findActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return null;
    }

    private static void openOriginal(Context context) {
        try {
            Class.forName("X.JET", false, context.getClassLoader())
                    .getMethod("LF", Context.class)
                    .invoke(null, context);
        } catch (ReflectiveOperationException e) {
            android.util.Log.e("TikTokLitePatches", "Could not open original settings", e);
        }
    }
}
