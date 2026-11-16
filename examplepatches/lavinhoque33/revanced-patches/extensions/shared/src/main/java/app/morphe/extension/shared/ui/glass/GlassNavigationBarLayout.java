/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * https://github.com/MorpheApp/morphe-patches/pull/4338
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
 */

package app.morphe.extension.shared.ui.glass;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.ui.Dim;

/**
 * The layout of the glass navigation bar, shared by the apps: which buttons fit in the capsule,
 * how wide they are and how tall the capsule is. Also used by the preview in the settings.
 */
public final class GlassNavigationBarLayout {

    /**
     * The least width of a button, the size of a touch target.
     */
    private static final int MIN_BUTTON_WIDTH = Dim.dp48;

    /**
     * The least room between the content of two buttons. With less room, the buttons that do not fit
     * in the width of the bar are hidden.
     */
    private static final int MIN_BUTTON_SPACING = Dim.dp8;

    /**
     * The least room above and below the content of the buttons in the capsule.
     */
    private static final int MIN_VERTICAL_PADDING = Dim.dp4;

    /**
     * The usual content width (the median) and the content height of the buttons of the last bar, and the height
     * the app gives the bar, so the preview in the settings shows the buttons as they are.
     */
    public static volatile int lastContentWidth;
    public static volatile int lastContentHeight;
    public static volatile int lastBaseHeight;
    /**
     * The width the app gives each button at least, such as on tablets, where the app gives the buttons
     * a minimum width and centers them, instead of sharing the width of the bar between them.
     */
    public static volatile int lastMinButtonWidth;

    /**
     * The buttons of the last bar, also the buttons hidden because they do not fit, so the preview in the settings
     * shows their icons and labels.
     */
    public static volatile List<WeakReference<View>> lastButtons = Collections.emptyList();

    /**
     * Keeps the buttons of the last bar, if they changed.
     */
    public static void setLastButtons(List<View> buttons) {
        List<WeakReference<View>> seenButtons = lastButtons;
        boolean buttonsChanged = seenButtons.size() != buttons.size();
        for (int i = 0, count = buttons.size(); i < count && !buttonsChanged; i++) {
            buttonsChanged = seenButtons.get(i).get() != buttons.get(i);
        }
        if (buttonsChanged) {
            List<WeakReference<View>> references = new ArrayList<>(buttons.size());
            for (View button : buttons) {
                references.add(new WeakReference<>(button));
            }
            lastButtons = references;
        }
    }

    private GlassNavigationBarLayout() {
    }

    /**
     * The buttons that fit in the capsule and their width.
     *
     * @param barWidth     The width of the navigation bar.
     * @param buttons      The number of buttons.
     * @param contentWidth The usual width of the content of the buttons (the icon or the label), the median,
     *                     so a long label that the app cuts does not make every button wider.
     * @param appMinWidth  The width the app gives each button at least, see {@link #lastMinButtonWidth}.
     * @param widthPercent The most width of the capsule, in percent of the width of the bar.
     * @param spacing      The room between the content of two buttons.
     * @param margin       The least room between the ends of the capsule and the edges of the screen.
     * @return The number of buttons shown, and the width of each button.
     */
    public static long getButtonsLayout(int barWidth, int buttons, int contentWidth, int appMinWidth,
                                        int widthPercent, int spacing, int margin) {
        return GlassCapsuleGeometry.getButtonsLayout(barWidth, buttons, contentWidth, appMinWidth,
                widthPercent, spacing, margin, MIN_BUTTON_WIDTH, MIN_BUTTON_SPACING);
    }

    /**
     * The height of the capsule.
     *
     * @param baseHeight    The height the app gives the bar, without the room below the buttons.
     * @param contentHeight The height of the content of the buttons, the icon and the label.
     * @param heightPercent The height of the capsule, in percent of the height the app gives the bar,
     *                      or of the height the buttons need if they need more, such as with a larger font.
     */
    public static int getCapsuleHeight(int baseHeight, int contentHeight, int heightPercent) {
        return GlassCapsuleGeometry.getCapsuleHeight(baseHeight, contentHeight, heightPercent, MIN_VERTICAL_PADDING);
    }

    /**
     * @return If the navigation bar is the bar along the bottom of the screen,
     *         not a navigation rail along the side.
     */
    public static boolean isHorizontalBottomBar(View navigationBar) {
        final int width = navigationBar.getWidth();
        final int height = navigationBar.getHeight();
        return width > 0 && height > 0 && width > 2 * height;
    }

    /**
     * The content of the buttons of a navigation bar.
     */
    public static final class Buttons {
        public final List<View> views = new ArrayList<>();
        private final List<View> contents = new ArrayList<>(2);
        private int[] widths = new int[0];
        public int contentWidth;
        public int minWidth;
        public int contentTop;
        public int contentBottom;

        public int contentHeight() {
            return contentBottom - contentTop;
        }

        public boolean isValid() {
            return contentWidth > 0 && contentBottom > contentTop;
        }
    }

    /** Reuses measurement storage during pre-draw; only grows it when tabs are added. */
    public static Buttons measureButtons(ViewGroup tabs, int iconId, int labelId, Set<View> hidden,
                                         Buttons result) {
        final int count = tabs.getChildCount();
        result.views.clear();
        if (result.widths.length < count) result.widths = new int[count];
        result.contentTop = Integer.MAX_VALUE;
        result.contentBottom = 0;
        result.minWidth = 0;
        final boolean idsKnown = iconId != 0 && labelId != 0;

        for (int i = 0; i < count; i++) {
            View button = tabs.getChildAt(i);
            if (button.getVisibility() == View.GONE && !hidden.contains(button)) continue;
            if (!(button instanceof ViewGroup group)) continue;

            final boolean laidOut = button.getVisibility() == View.VISIBLE;
            int contentWidth = 0;
            List<View> contents = result.contents;
            contents.clear();
            for (int j = 0; j < group.getChildCount(); j++) {
                View child = group.getChildAt(j);
                final int id = child.getId();
                if (!idsKnown || id == iconId || id == labelId) contents.add(child);
            }
            if (idsKnown && contents.isEmpty()) {
                View icon = group.findViewById(iconId);
                View label = group.findViewById(labelId);
                if (icon != null) contents.add(icon);
                if (label != null) contents.add(label);
            }
            for (int j = 0; j < contents.size(); j++) {
                View child = contents.get(j);
                if (!isShownIn(child, button)) continue;

                contentWidth = Math.max(contentWidth, child instanceof TextView label
                        ? (int) Math.ceil(label.getPaint().measureText(label.getText(), 0, label.length()))
                                + label.getPaddingLeft() + label.getPaddingRight()
                        : child.getWidth());
                if (laidOut && child.getHeight() > 0) {
                    final int top = getTopIn(child, button);
                    result.contentTop = Math.min(result.contentTop, top);
                    result.contentBottom = Math.max(result.contentBottom, top + child.getHeight());
                }
            }
            result.widths[result.views.size()] = contentWidth;
            result.views.add(button);
            result.minWidth = Math.max(result.minWidth, button.getMinimumWidth());
        }
        Arrays.sort(result.widths, 0, result.views.size());
        result.contentWidth = result.views.isEmpty() ? 0 : result.widths[result.views.size() / 2];
        return result;
    }

    /**
     * Hides the buttons that do not fit from the end, but never the selected one,
     * and shows the buttons again that fit, such as after a rotation.
     *
     * @return If a button was hidden or shown.
     */
    public static boolean fitButtons(List<View> buttons, int shown, @Nullable View selected, Set<View> hidden) {
        boolean changed = false;
        final int selectedIndex = buttons.indexOf(selected);
        final int lastShown = selectedIndex >= shown ? shown - 2 : shown - 1;
        for (int i = 0, count = buttons.size(); i < count; i++) {
            View button = buttons.get(i);
            if (i <= lastShown || i == selectedIndex) {
                if (hidden.remove(button)) {
                    button.setVisibility(View.VISIBLE);
                    changed = true;
                }
            } else if (hidden.add(button)) {
                button.setVisibility(View.GONE);
                changed = true;
            }
        }
        return changed;
    }

    /**
     * Shows the buttons again that were hidden because they did not fit.
     */
    public static void showHiddenButtons(Set<View> hidden) {
        for (View button : hidden) {
            button.setVisibility(View.VISIBLE);
        }
        hidden.clear();
    }

    /**
     * @return If the view and its parents up to the ancestor are visible.
     */
    private static boolean isShownIn(View view, View ancestor) {
        while (view != ancestor) {
            if (view.getVisibility() != View.VISIBLE) return false;
            ViewParent parent = view.getParent();
            if (!(parent instanceof View parentView)) return false;
            view = parentView;
        }
        return true;
    }

    /**
     * @return The top of the view in the coordinates of the ancestor.
     */
    private static int getTopIn(View view, View ancestor) {
        int top = 0;
        while (view != ancestor) {
            top += view.getTop();
            ViewParent parent = view.getParent();
            if (!(parent instanceof View parentView)) break;
            view = parentView;
        }
        return top;
    }

    /**
     * @return The left of the view in the coordinates of the ancestor, with the translation,
     *         or NaN if the view or a parent is not visible.
     */
    public static float getLeftIn(View view, View ancestor) {
        float left = 0;
        while (view != ancestor) {
            left += view.getLeft() + view.getTranslationX();
            ViewParent parent = view.getParent();
            if (!(parent instanceof View parentView) || view.getVisibility() != View.VISIBLE) {
                return Float.NaN;
            }
            view = parentView;
        }
        return left;
    }
}
