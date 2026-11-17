/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import android.view.View;
import android.widget.RelativeLayout;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.utils.ResourceUtils;

/** Download checks share the trailing slot with other occurrence indicators. Main thread only. */
final class RowEndCheck {
    private WeakReference<DownloadedCheck> check = new WeakReference<>(null);

    @Nullable
    static String slotKind(View row) {
        for (String name : RowEndSlots.MENU_CONTAINERS) {
            int id = ResourceUtils.getIdIdentifier(name);
            View found = id == 0 ? null : row.findViewById(id);
            if (found != null && found.getParent() instanceof RelativeLayout) return name;
        }
        return null;
    }

    boolean isShown() {
        DownloadedCheck existing = check.get();
        return existing != null && existing.getParent() != null && existing.getVisibility() == View.VISIBLE;
    }

    String show(View row) {
        DownloadedCheck existing = check.get();
        String outcome = "shown";
        if (existing == null || existing.getParent() == null) {
            existing = DownloadedCheck.create(row.getContext(), false);
            if (existing == null) return "no-icon";
            if (!RowEndIndicators.add(row, existing, 16)) return "no-end-slot";
            check = new WeakReference<>(existing);
            outcome = "added";
        }
        existing.restyle();
        RowEndIndicators.visibility(existing, true);
        return outcome;
    }

    void hide() {
        DownloadedCheck existing = check.get();
        if (existing != null) RowEndIndicators.visibility(existing, false);
    }
}
