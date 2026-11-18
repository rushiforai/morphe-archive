/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.os.Bundle;
import android.text.Layout;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.ResourceType;
import app.hushpinterest.extension.shared.ResourceUtils;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.StringSetting;

/**
 * The picture header of a board tab on Home (#42): See board and the small text come off it, and the
 * board name can move.
 *
 * <p>Pinterest decides from the server which of the header's text views holds which line, so the
 * board name is found by being the largest text there. Everything here runs on the main thread.
 */
public final class BoardTabs {
    private BoardTabs() {}

    /** Where the board name goes, one of {@link #POSITIONS}. Empty leaves it where Pinterest puts it. */
    public static final StringSetting POSITION = new StringSetting("hushpinterest_board_tab_name_position", "", false, false);

    public static final String TOP_LEFT = "top_left";
    public static final String TOP_CENTER = "top_center";
    public static final String MIDDLE = "center";
    public static final String BOTTOM_CENTER = "bottom_center";
    public static final String BOTTOM_RIGHT = "bottom_right";
    public static final String[] POSITIONS = {"", TOP_LEFT, TOP_CENTER, MIDDLE, BOTTOM_CENTER, BOTTOM_RIGHT};

    private static final String BOARD_ID = "com.pinterest.EXTRA_BOARD_ID";
    private static final String HOME_TABS = "home_feed_view_pager_tab_layout_container";
    private static final int TOP_MARGIN_DP = 8;

    private static final Map<View, String> BOARDS = new WeakHashMap<>();
    private static final Map<View, Integer> FOLDED = new WeakHashMap<>();
    private static final Map<View, View> MOVED = new WeakHashMap<>();
    private static final Map<View, Integer> TOPS = new WeakHashMap<>();

    /** Pinterest sets the header's text after the hook and again as data arrives, each followed by a layout. */
    private static final View.OnLayoutChangeListener WATCH = (view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
        try {
            if (view instanceof ViewGroup) apply((ViewGroup) view);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOARD_TABS, "board tab layout", failure);
        }
    };

    /** Called as the board tab's screen hands its header new data, before the header reads it. */
    public static void bind(View tabHeader, Object fragment) {
        HookStatus.invoked(FamilyNames.BOARD_TABS);
        try {
            ViewGroup content = content(tabHeader);
            if (content == null) return;
            Bundle arguments = screenArguments(fragment);
            remember(tabHeader, arguments == null ? null : arguments.getString(BOARD_ID));
            if (hideButton() || hideSmallText() || !position().isEmpty()) {
                content.removeOnLayoutChangeListener(WATCH);
                content.addOnLayoutChangeListener(WATCH);
            }
            apply(content);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOARD_TABS, "board tab header", failure);
        }
    }

    /** Answers null here. Patching writes the read of the screen's arguments. */
    public static Bundle screenArguments(Object fragment) {
        return null;
    }

    static void remember(View tabHeader, @Nullable String board) {
        if (board == null) BOARDS.remove(tabHeader);
        else BOARDS.put(tabHeader, board);
    }

    /** The board a tab header shows, or null when it isn't a header this has seen. */
    @Nullable
    static String boardOf(View tabHeader) {
        return BOARDS.get(tabHeader);
    }

    @Nullable
    static ViewGroup content(View tabHeader) {
        if (!(tabHeader instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) tabHeader;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            if (child instanceof ViewGroup) return (ViewGroup) child;
        }
        return null;
    }

    private static boolean hideButton() {
        return UiHooks.enabled(FamilyNames.BOARD_TABS, Settings.HIDE_BOARD_TAB_BUTTON);
    }

    private static boolean hideSmallText() {
        return UiHooks.enabled(FamilyNames.BOARD_TABS, Settings.HIDE_BOARD_TAB_SUBTITLE);
    }

    private static String position() {
        return Utils.settingsReady() ? POSITION.get() : "";
    }

    static void apply(ViewGroup header) {
        boolean button = hideButton();
        boolean smallText = hideSmallText();
        List<TextView> texts = new ArrayList<>();
        TextView name = null;
        for (int index = 0; index < header.getChildCount(); index++) {
            View child = header.getChildAt(index);
            if (child instanceof Button) {
                fold(child, button);
            } else if (child instanceof TextView) {
                TextView text = (TextView) child;
                if (TextUtils.isEmpty(text.getText())) continue;
                if (text.getVisibility() == View.GONE && !FOLDED.containsKey(text)) continue;
                texts.add(text);
                if (name == null || text.getTextSize() > name.getTextSize()) name = text;
            }
        }
        for (TextView text : texts) fold(text, smallText && text != name);
        place(header, name);
    }

    /** Hides a view, or gives back one this hid. A view Pinterest hid itself stays as it is. */
    private static void fold(View view, boolean hide) {
        if (hide) {
            if (view.getVisibility() == View.GONE) return;
            FOLDED.put(view, view.getVisibility());
            view.setVisibility(View.GONE);
            return;
        }
        Integer before = FOLDED.remove(view);
        if (before != null && view.getVisibility() == View.GONE) view.setVisibility(before);
    }

    /** Moves the name by translation, which asks for no new layout, so this can run from a layout. */
    private static void place(ViewGroup header, @Nullable TextView name) {
        String position = position();
        View moved = MOVED.get(header);
        if (moved != null && (moved != name || position.isEmpty())) {
            moved.setTranslationX(0);
            moved.setTranslationY(0);
            MOVED.remove(header);
        }
        if (name == null || position.isEmpty() || header.getWidth() <= 0 || name.getWidth() <= 0) return;
        float[] text = textBounds(name);
        float centered = (header.getWidth() - (text[1] - text[0])) / 2 - text[0];
        float below = topEdge(header) + TOP_MARGIN_DP * header.getResources().getDisplayMetrics().density - text[2];
        float x = 0;
        float y = 0;
        switch (position) {
            case TOP_LEFT:
                y = below;
                break;
            case TOP_CENTER:
                x = centered;
                y = below;
                break;
            case MIDDLE:
                x = centered;
                y = (header.getHeight() - (text[3] - text[2])) / 2 - text[2];
                break;
            case BOTTOM_CENTER:
                x = centered;
                break;
            case BOTTOM_RIGHT:
                // The same distance from the right edge as Pinterest leaves on the left.
                x = header.getWidth() - text[0] - text[1];
                break;
            default:
                break;
        }
        name.setTranslationX(x);
        name.setTranslationY(y);
        MOVED.put(header, name);
    }

    /** Left, right, top and bottom of the text itself in the header, since the view can be far wider. */
    private static float[] textBounds(TextView name) {
        float left = 0;
        float right = name.getWidth();
        float top = 0;
        float bottom = name.getHeight();
        Layout layout = name.getLayout();
        if (layout != null && layout.getLineCount() > 0) {
            left = Float.MAX_VALUE;
            right = -Float.MAX_VALUE;
            for (int line = 0; line < layout.getLineCount(); line++) {
                left = Math.min(left, layout.getLineLeft(line));
                right = Math.max(right, layout.getLineRight(line));
            }
            left += name.getTotalPaddingLeft();
            right += name.getTotalPaddingLeft();
            top = name.getTotalPaddingTop();
            bottom = top + layout.getHeight();
        }
        return new float[] {name.getLeft() + left, name.getLeft() + right, name.getTop() + top, name.getTop() + bottom};
    }

    /** How far down the header the status bar and Home's row of tabs reach. */
    @SuppressWarnings("deprecation") // getInsets(Type) would need the same answer from a newer call.
    private static int topEdge(ViewGroup header) {
        int[] at = new int[2];
        header.getLocationOnScreen(at);
        int top = at[1];
        Integer known = TOPS.get(header);
        // Scrolled away, the header's position says nothing about what covers it at rest.
        if (top < 0 && known != null) return known;
        int edge = 0;
        WindowInsets insets = header.getRootWindowInsets();
        if (insets != null) edge = insets.getSystemWindowInsetTop();
        int id = ResourceUtils.getIdentifier(header.getContext(), ResourceType.ID, HOME_TABS);
        View tabs = id == 0 ? null : header.getRootView().findViewById(id);
        if (tabs != null && tabs.isShown()) {
            tabs.getLocationOnScreen(at);
            edge = Math.max(edge, at[1] + tabs.getHeight());
        }
        int reach = Math.max(0, edge - top);
        if (top >= 0) TOPS.put(header, reach);
        return reach;
    }
}
