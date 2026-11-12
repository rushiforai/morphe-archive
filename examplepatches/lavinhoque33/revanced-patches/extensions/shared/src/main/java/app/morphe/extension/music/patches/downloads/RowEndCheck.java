/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.utils.ResourceUtils;

/**
 * The green check at the end of a song row of Music's classic list layouts (playlist pages, the Search songs filter,
 * the player queue), next to the row's menu or drag handle. Both layouts are a RelativeLayout whose text column is
 * placed {@code toStartOf} the container of the menu; the check is a view of that RelativeLayout, centered vertically
 * and placed {@code toStartOf} the menu container, and while it is shown the text column ends at the check instead,
 * so the check never covers the text. Hiding it gives the text column its own rule back, so a recycled row keeps no
 * trace of it. The rules are relative to the layout direction, so a right-to-left row mirrors. Main thread only.
 */
final class RowEndCheck {
    private static final int CHECK_DP = 16;
    private static final int MARGIN_DP = 4;
    private static final WeakReference<View> NO_VIEW = new WeakReference<>(null);

    private WeakReference<DownloadedCheck> check = new WeakReference<>(null);
    private WeakReference<View> text = NO_VIEW;
    private WeakReference<View> menu = NO_VIEW;
    private WeakReference<View> contributors = NO_VIEW;
    private int textTarget;

    /** The menu container of a row and the layout it sits in, or null when the row is not of these layouts. */
    @Nullable
    private static View findMenu(View row) {
        for (String name : RowEndSlots.MENU_CONTAINERS) {
            int id = ResourceUtils.getIdIdentifier(name);
            View found = id == 0 ? null : row.findViewById(id);
            if (found != null && found.getParent() instanceof RelativeLayout) return found;
        }
        return null;
    }

    /** The kind of an end slot (the name of the menu container: a list row or a queue row), or null when none. */
    @Nullable
    static String slotKind(View row) {
        for (String name : RowEndSlots.MENU_CONTAINERS) {
            int id = ResourceUtils.getIdIdentifier(name);
            View found = id == 0 ? null : row.findViewById(id);
            if (found != null && found.getParent() instanceof RelativeLayout) return name;
        }
        return null;
    }

    /** Whether a check of this row is visible. */
    boolean isShown() {
        DownloadedCheck existing = check.get();
        return existing != null && existing.getParent() != null && existing.getVisibility() == View.VISIBLE;
    }

    /** Shows the check at the end of the row, adding it first when needed; returns what happened, for the log. */
    String show(View row) {
        DownloadedCheck existing = check.get();
        String outcome = "shown";
        if (existing == null || existing.getParent() == null) {
            outcome = add(row);
            if (!outcome.equals("added")) return outcome;

            existing = check.get();
            if (existing == null) return "no-icon";
        }
        existing.restyle();
        existing.setShown(true);
        placeBeforeAnchor(existing);
        return outcome;
    }

    /** Hides the check and gives the text column its own end rule back. */
    void hide() {
        DownloadedCheck existing = check.get();
        if (existing == null) return;

        existing.setShown(false);
        View column = text.get();
        if (column != null) setTextEnd(column, textTarget);
    }

    private String add(View row) {
        View menuContainer = findMenu(row);
        if (menuContainer == null || !(menuContainer.getParent() instanceof RelativeLayout layout)) {
            return "no-end-slot";
        }

        View column = findTextColumn(layout, menuContainer);
        if (column == null) return "no-text-column";

        DownloadedCheck created = DownloadedCheck.create(row.getContext(), false);
        if (created == null) return "no-icon";

        created.setId(View.generateViewId());
        int size = DownloadedCheck.dp(CHECK_DP);
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(size, size);
        params.addRule(RelativeLayout.CENTER_VERTICAL);
        params.addRule(RelativeLayout.START_OF, menuContainer.getId());
        params.setMarginStart(DownloadedCheck.dp(MARGIN_DP));
        params.setMarginEnd(DownloadedCheck.dp(MARGIN_DP));
        layout.addView(created, params);

        int contributorsId = ResourceUtils.getIdIdentifier(RowEndSlots.CONTRIBUTORS);
        check = new WeakReference<>(created);
        menu = new WeakReference<>(menuContainer);
        contributors = new WeakReference<>(contributorsId == 0 ? null : layout.findViewById(contributorsId));
        text = new WeakReference<>(column);
        textTarget = textTarget(column);
        return "added";
    }

    /** The id the child is placed at the start of, whichever verb the laid out layout reports it with. */
    private static int textTarget(View child) {
        if (!(child.getLayoutParams() instanceof RelativeLayout.LayoutParams params)) return 0;

        boolean rightToLeft = child.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
        return RowEndSlots.startOfTarget(params.getRule(RelativeLayout.START_OF),
                params.getRule(RelativeLayout.LEFT_OF), params.getRule(RelativeLayout.RIGHT_OF), rightToLeft);
    }

    /** The child of the layout that ends at the avatars or the menu container: the title and subtitle column. */
    @Nullable
    private static View findTextColumn(RelativeLayout layout, View menuContainer) {
        int avatarsId = ResourceUtils.getIdIdentifier(RowEndSlots.CONTRIBUTORS);
        for (int i = 0; i < layout.getChildCount(); i++) {
            View child = layout.getChildAt(i);
            if (RowEndSlots.isTextColumn(child.getId(), textTarget(child), menuContainer.getId(), avatarsId)) {
                return child;
            }
        }
        return null;
    }

    /**
     * Puts the check next to the menu container, or next to the contributor avatars when a row has some, and ends the
     * text column at the check.
     */
    private void placeBeforeAnchor(DownloadedCheck shown) {
        View menuContainer = menu.get();
        View avatars = contributors.get();
        if (menuContainer == null || !(shown.getLayoutParams() instanceof RelativeLayout.LayoutParams params)) return;

        boolean hasAvatars = avatars instanceof ViewGroup group && group.getChildCount() > 0;
        int anchor = RowEndSlots.anchor(menuContainer.getId(), avatars == null ? 0 : avatars.getId(), hasAvatars);
        if (textTarget(shown) != anchor) {
            params.addRule(RelativeLayout.START_OF, anchor);
            shown.setLayoutParams(params);
        }
        View column = text.get();
        if (column != null) setTextEnd(column, shown.getId());
    }

    private static void setTextEnd(View column, int target) {
        if (!(column.getLayoutParams() instanceof RelativeLayout.LayoutParams params) || textTarget(column) == target) {
            return;
        }

        params.addRule(RelativeLayout.START_OF, target);
        column.setLayoutParams(params);
    }
}
