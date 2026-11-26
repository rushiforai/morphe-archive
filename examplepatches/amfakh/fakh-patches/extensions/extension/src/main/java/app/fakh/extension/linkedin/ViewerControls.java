/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;

import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Keeps the download button of a Compose profile photo or banner viewer level with the viewer's back button. The
 * semantics tree of the viewer is read before every frame for this. The back button is the labelled node in the top
 * left corner that is smaller than the screen. When there is none, the button sits below the status bar.
 */
final class ViewerControls implements ViewTreeObserver.OnPreDrawListener {
    private final ViewGroup content;
    private final View button;

    private ViewerControls(ViewGroup content, View button) {
        this.content = content;
        this.button = button;
    }

    /** Starts following the controls of the viewer in the content of an activity until the button is removed. */
    static void follow(ViewGroup content, View button) {
        content.getViewTreeObserver().addOnPreDrawListener(new ViewerControls(content, button));
    }

    @Override
    public boolean onPreDraw() {
        try {
            if (button.isAttachedToWindow()) {
                update();
                return true;
            }
        } catch (Throwable t) {
            Diagnostics.error("viewer controls unreadable", t);
        }
        content.getViewTreeObserver().removeOnPreDrawListener(this);
        return true;
    }

    private void update() throws Exception {
        View compose = composeView(content);
        // The top of the back button, or NaN when there is none.
        float[] found = {Float.NaN};
        if (compose != null) {
            Object owner = compose.getClass().getMethod("getSemanticsOwner").invoke(compose);
            Object root = owner.getClass().getMethod("getUnmergedRootSemanticsNode").invoke(owner);
            scan(root, compose.getWidth(), compose.getHeight(), statusBar(), 0, found);
        }

        int[] origin = new int[2];
        content.getLocationInWindow(origin);
        // Without a back button in the tree, sit just below the status bar.
        int top = Float.isNaN(found[0])
                ? Math.max(0, statusBar() - origin[1]) + Downloads.dp(content.getContext(), 4)
                : Math.round(found[0]) - origin[1];
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) button.getLayoutParams();
        if (Math.abs(params.topMargin - top) > 1) {
            params.topMargin = top;
            button.setLayoutParams(params);
        }
    }

    /**
     * The top, in window coordinates, of the seek bar of the video on screen under a view, or NaN while none shows.
     */
    static float seekBarTop(View view) throws Exception {
        if (view.getVisibility() != View.VISIBLE) return Float.NaN;
        if (view.getClass().getName().endsWith("AndroidComposeView")) {
            Object owner = view.getClass().getMethod("getSemanticsOwner").invoke(view);
            return seekBarTop(owner.getClass().getMethod("getUnmergedRootSemanticsNode").invoke(owner), 0);
        }
        float top = Float.NaN;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount() && Float.isNaN(top); i++) top = seekBarTop(group.getChildAt(i));
        }
        return top;
    }

    /** The top of the first slider on screen in a semantics tree: the node that lets its progress be set. */
    private static float seekBarTop(Object node, int depth) throws Exception {
        if (depth > 60) return Float.NaN;
        Object config = node.getClass().getMethod("getConfig").invoke(node);
        Iterator<?> it = (Iterator<?>) config.getClass().getMethod("iterator").invoke(config);
        while (it.hasNext()) {
            Object key = ((Map.Entry<?, ?>) it.next()).getKey();
            if (!"SetProgress".equals(key.getClass().getField("name").get(key))) continue;
            // The bounds of a slider on a page that is off screen are clipped to nothing.
            Object rect = node.getClass().getMethod("getBoundsInWindow").invoke(node);
            float top = rect.getClass().getField("top").getFloat(rect);
            if (rect.getClass().getField("bottom").getFloat(rect) > top) return top;
        }
        Method children = node.getClass().getMethod("getChildren$ui", boolean.class, boolean.class, boolean.class);
        for (Object child : (List<?>) children.invoke(node, true, false, false)) {
            float top = seekBarTop(child, depth + 1);
            if (!Float.isNaN(top)) return top;
        }
        return Float.NaN;
    }

    /** The height of the status bar, where no back button sits. */
    private int statusBar() {
        return content.getRootWindowInsets() == null ? 0 : content.getRootWindowInsets().getSystemWindowInsetTop();
    }

    /** The largest Compose view under a parent. */
    private static View composeView(View view) {
        View best = view.getClass().getName().endsWith("AndroidComposeView") ? view : null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = composeView(group.getChildAt(i));
                if (found != null && (best == null || found.getWidth() * found.getHeight() > best.getWidth() * best.getHeight())) {
                    best = found;
                }
            }
        }
        return best;
    }

    private static void scan(Object node, int width, int height, int statusBar, int depth, float[] found) throws Exception {
        if (depth > 60) return;
        Object rect = node.getClass().getMethod("getBoundsInWindow").invoke(node);
        Class<?> r = rect.getClass();
        float left = r.getField("left").getFloat(rect);
        float top = r.getField("top").getFloat(rect);
        float w = r.getField("right").getFloat(rect) - left;
        float h = r.getField("bottom").getFloat(rect) - top;

        Object config = node.getClass().getMethod("getConfig").invoke(node);
        Iterator<?> it = (Iterator<?>) config.getClass().getMethod("iterator").invoke(config);
        boolean labelled = false;
        while (it.hasNext()) {
            Object key = ((Map.Entry<?, ?>) it.next()).getKey();
            Object name = key.getClass().getField("name").get(key);
            labelled |= "ContentDescription".equals(name) || "Text".equals(name);
        }
        if (labelled && top >= statusBar && top < height * 0.15f && left < width * 0.25f && w < width * 0.3f && !(top >= found[0])) {
            found[0] = top;
        }
        Method children = node.getClass().getMethod("getChildren$ui", boolean.class, boolean.class, boolean.class);
        for (Object child : (List<?>) children.invoke(node, true, false, false)) {
            scan(child, width, height, statusBar, depth + 1, found);
        }
    }
}
