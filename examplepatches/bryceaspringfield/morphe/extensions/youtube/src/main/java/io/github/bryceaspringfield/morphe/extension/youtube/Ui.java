package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Dialog;
import android.util.DisplayMetrics;
import android.view.ViewGroup;
import android.view.Window;

/** Layout helpers shared by the bundle's dialogs. */
final class Ui {

    private Ui() {
    }

    /**
     * Shows a dialog 92% as wide as the screen (at most 560 dp). Morphe's settings activity gives dialogs a narrow window
     * (about 60% of the screen), which clipped the channel filter editor's fields and buttons (seen 2026-11-15).
     */
    static void show(Dialog dialog) {
        dialog.show();
        try {
            Window w = dialog.getWindow();
            if (w == null) return;
            DisplayMetrics dm = dialog.getContext().getResources().getDisplayMetrics();
            int max = Math.round(560 * dm.density);
            w.setLayout(Math.min(Math.round(dm.widthPixels * 0.92f), max), ViewGroup.LayoutParams.WRAP_CONTENT);
        } catch (Throwable ignored) {
        }
    }
}
