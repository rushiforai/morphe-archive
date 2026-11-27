package local.wazemaps.themes;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;

/** Independent settings row that composes with the optional theme rows. */
public final class AndroidAutoSettings {
    public static View decorate(View original) {
        if (original == null) return null;
        try {
            if (!"map_mode".equals(original.getTag()) && !"morphe_map_mode".equals(original.getTag())) return original;
            if (original.findViewWithTag("morphe_aa_setup") != null) return original;
            Context context = original.getContext();
            Class<?> type = Class.forName("com.waze.settings.tree.views.WazeSettingsView");
            View row = (View) type.getConstructor(Context.class).newInstance(context);
            type.getMethod("N", String.class).invoke(row, "Android Auto setup");
            type.getMethod("P", String.class).invoke(row, "Install or open Waze AA Installer");
            type.getMethod("B", int.class).invoke(row, 1);
            row.setTag("morphe_aa_setup");
            row.setOnClickListener(view -> CompanionInstaller.open(context));
            boolean wrapped = "morphe_map_mode".equals(original.getTag());
            LinearLayout container = wrapped ? (LinearLayout) original : new LinearLayout(context);
            container.setOrientation(LinearLayout.VERTICAL);
            container.setTag("morphe_map_mode");
            if (!wrapped) container.addView(original, new LinearLayout.LayoutParams(-1, -2));
            container.addView(row, new LinearLayout.LayoutParams(-1, -2));
            return container;
        } catch (Exception error) {
            Log.e("MorpheAA", "Could not add Android Auto setting", error);
            return original;
        }
    }
}
