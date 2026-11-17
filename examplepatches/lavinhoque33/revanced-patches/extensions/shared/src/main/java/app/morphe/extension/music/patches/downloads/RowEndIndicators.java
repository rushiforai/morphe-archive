/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.downloads;

import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.utils.ResourceUtils;

/** One trailing slot shared by independent download and suggestion indicators. Main thread only. */
public final class RowEndIndicators {
    private static final Map<View, Slot> slots = new WeakHashMap<>();

    private static final class Slot {
        final WeakReference<LinearLayout> indicators;
        final WeakReference<View> text;
        final WeakReference<View> menu;
        final WeakReference<View> avatars;
        final int originalTarget;

        Slot(LinearLayout indicators, View text, int originalTarget, View menu, View avatars) {
            this.indicators = new WeakReference<>(indicators);
            this.text = new WeakReference<>(text);
            this.menu = new WeakReference<>(menu);
            this.avatars = new WeakReference<>(avatars);
            this.originalTarget = originalTarget;
        }
    }

    private RowEndIndicators() {}

    public static boolean add(View row, View indicator, int sizeDp) {
        Slot slot = slots.get(row);
        LinearLayout group = slot == null ? null : slot.indicators.get();
        if (group == null || group.getParent() == null) {
            slot = create(row);
            if (slot == null) return false;
            slots.put(row, slot);
            group = slot.indicators.get();
        }
        if (group == null) return false;
        int size = Math.round(sizeDp * row.getResources().getDisplayMetrics().density);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(size, size);
        params.setMarginStart(Math.round(4 * row.getResources().getDisplayMetrics().density));
        params.setMarginEnd(params.getMarginStart());
        group.addView(indicator, params);
        update(group, slot);
        return true;
    }

    public static void visibility(View indicator, boolean shown) {
        indicator.setVisibility(shown ? View.VISIBLE : View.GONE);
        if (!(indicator.getParent() instanceof LinearLayout group)) return;
        for (Slot slot : slots.values()) {
            if (slot.indicators.get() == group) {
                update(group, slot);
                return;
            }
        }
    }

    private static void update(LinearLayout group, Slot slot) {
        boolean visible = false;
        for (int index = 0; index < group.getChildCount(); index++) {
            visible |= group.getChildAt(index).getVisibility() == View.VISIBLE;
        }
        group.setVisibility(visible ? View.VISIBLE : View.GONE);
        View menu = slot.menu.get();
        View avatars = slot.avatars.get();
        if (menu != null) {
            boolean hasAvatars = avatars instanceof ViewGroup children && children.getChildCount() > 0;
            setEnd(group, RowEndSlots.anchor(menu.getId(), avatars == null ? 0 : avatars.getId(), hasAvatars));
        }
        View text = slot.text.get();
        if (text != null) setEnd(text, visible ? group.getId() : slot.originalTarget);
    }

    private static void setEnd(View view, int target) {
        if (!(view.getLayoutParams() instanceof RelativeLayout.LayoutParams params)) return;
        int current = RowEndSlots.startOfTarget(params.getRule(RelativeLayout.START_OF),
                params.getRule(RelativeLayout.LEFT_OF), params.getRule(RelativeLayout.RIGHT_OF),
                view.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL);
        if (current == target) return;
        params.addRule(RelativeLayout.START_OF, target);
        view.setLayoutParams(params);
    }

    private static Slot create(View row) {
        for (String name : RowEndSlots.MENU_CONTAINERS) {
            int id = ResourceUtils.getIdIdentifier(name);
            View menu = id == 0 ? null : row.findViewById(id);
            if (menu == null || !(menu.getParent() instanceof RelativeLayout layout)) continue;
            int avatarsId = ResourceUtils.getIdIdentifier(RowEndSlots.CONTRIBUTORS);
            View avatars = avatarsId == 0 ? null : layout.findViewById(avatarsId);
            for (int index = 0; index < layout.getChildCount(); index++) {
                View text = layout.getChildAt(index);
                if (!(text.getLayoutParams() instanceof RelativeLayout.LayoutParams rules)) continue;
                int target = RowEndSlots.startOfTarget(rules.getRule(RelativeLayout.START_OF),
                        rules.getRule(RelativeLayout.LEFT_OF), rules.getRule(RelativeLayout.RIGHT_OF),
                        text.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL);
                if (!RowEndSlots.isTextColumn(text.getId(), target, menu.getId(), avatarsId)) continue;
                LinearLayout group = new LinearLayout(row.getContext());
                group.setId(View.generateViewId());
                group.setOrientation(LinearLayout.HORIZONTAL);
                group.setGravity(android.view.Gravity.CENTER_VERTICAL);
                RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                params.addRule(RelativeLayout.CENTER_VERTICAL);
                boolean hasAvatars = avatars instanceof ViewGroup children && children.getChildCount() > 0;
                params.addRule(RelativeLayout.START_OF, RowEndSlots.anchor(menu.getId(), avatarsId, hasAvatars));
                layout.addView(group, params);
                return new Slot(group, text, target, menu, avatars);
            }
        }
        return null;
    }
}
