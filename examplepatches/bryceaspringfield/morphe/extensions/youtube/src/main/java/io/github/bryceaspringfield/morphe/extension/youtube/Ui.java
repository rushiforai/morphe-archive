package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Dialog;
import android.util.DisplayMetrics;
import android.view.ViewGroup;
import android.view.Window;

final class Ui {

    private Ui() {
    }

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
