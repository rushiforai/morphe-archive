/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import android.graphics.drawable.Drawable;
import android.view.View;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.utils.BaseThemeUtils;

/**
 * The green check of one track row of an album page. The row is a Litho view with no child we could add to, so the
 * check is a drawable on the row's overlay, placed next to the row's action menu at its end (see
 * {@link ElementRowLayout}). Main thread only; the drawable belongs to the row's overlay, this object is only held
 * weakly by the page.
 */
final class AlbumRowCheck {
    @Nullable
    private Drawable check;
    private boolean attached;
    @Nullable
    private Boolean tintedForDarkTheme;
    private int placedLeft = Integer.MIN_VALUE;
    private int placedTop = Integer.MIN_VALUE;

    /**
     * Shows the check next to the action menu cell of the row, on its start side; false when the check drawable is
     * unavailable. Does nothing when the check is already shown there in the current theme.
     */
    boolean show(View row, DownloadedAlbumRows.Cell menu) {
        float density = row.getResources().getDisplayMetrics().density;
        boolean rightToLeft = row.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
        int left = ElementRowLayout.checkLeft(menu.left(), menu.width(), rightToLeft, density);
        int top = ElementRowLayout.checkTop(row.getHeight(), density);
        boolean darkTheme = BaseThemeUtils.isDarkModeEnabled();
        if (attached && left == placedLeft && top == placedTop && tintedForDarkTheme != null
                && tintedForDarkTheme == darkTheme) {
            return true;
        }

        if (check == null) check = DownloadedCheck.createDrawable(row.getContext());
        if (check == null) return false;

        if (tintedForDarkTheme == null || tintedForDarkTheme != darkTheme) {
            DownloadedCheck.tint(check, darkTheme);
            tintedForDarkTheme = darkTheme;
        }
        int size = Math.round(ElementRowLayout.CHECK_DP * density);
        check.setBounds(left, top, left + size, top + size);
        placedLeft = left;
        placedTop = top;
        if (!attached) {
            row.getOverlay().add(check);
            attached = true;
        }
        return true;
    }

    void hide(View row) {
        if (!attached) return;

        attached = false;
        if (check != null) row.getOverlay().remove(check);
    }
}
