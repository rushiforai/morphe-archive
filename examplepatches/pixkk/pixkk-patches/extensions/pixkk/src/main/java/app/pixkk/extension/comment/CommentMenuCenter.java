/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.comment;

import android.content.Context;
import android.graphics.Outline;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.WindowManager;

import java.lang.reflect.Field;

import app.pixkk.extension.core.Dim;
import app.pixkk.extension.core.Logger;
import app.pixkk.extension.core.Settings;

/**
 * Shows the menu a long press on a comment opens as a window in the middle of the screen, as it
 * used to be, instead of a sheet along the bottom.
 *
 * <p>The menu is a sheet whose panel is the fragment's view, pinned to the bottom of a full-height
 * constraint layout. Its constraints are changed to hold it in the middle instead.
 */
public final class CommentMenuCenter {
    private static final int SIDE_MARGIN_DP = 16;
    private static final int CORNER_RADIUS_DP = 16;

    private CommentMenuCenter() {
    }

    /** Called with the menu's panel as its rows are handed over. */
    public static void apply(Object panel) {
        try {
            if (!Settings.COMMENT_MENU_CENTERED.get()) return;
            View view = (View) panel.getClass().getMethod("getView").invoke(panel);
            if (view == null) return;
            view.post(() -> center(view));
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not centre the comment menu", failure);
        }
    }

    /**
     * Called with the menu's view as soon as the fragment has made it, well before its rows
     * arrive. The menu is moved to the middle just before its first frame is drawn, so the sheet
     * is never seen sliding up from the bottom.
     */
    public static void prepare(Object fragment, View view) {
        try {
            if (!Settings.COMMENT_MENU_CENTERED.get() || view == null) return;
            noEntryAnimation(fragment);
            if (view.isAttachedToWindow()) {
                centerBeforeDraw(view);
                return;
            }
            view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View attached) {
                    attached.removeOnAttachStateChangeListener(this);
                    centerBeforeDraw(attached);
                }

                @Override
                public void onViewDetachedFromWindow(View detached) {
                }
            });
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not prepare the comment menu", failure);
        }
    }

    /**
     * The menu is the content of a sheet, a dialog fragment holding this fragment, and the
     * dialog's window slides in from the bottom as it is shown. The window is told not to,
     * before it is shown, on whichever fragment up the chain owns a dialog.
     */
    private static void noEntryAnimation(Object fragment) {
        try {
            Object current = fragment;
            for (int depth = 0; current != null && depth < 4; depth++) {
                try {
                    Object dialog = current.getClass().getMethod("getDialog").invoke(current);
                    if (dialog instanceof android.app.Dialog) {
                        android.view.Window window = ((android.app.Dialog) dialog).getWindow();
                        if (window != null) window.setWindowAnimations(0);
                    }
                } catch (NoSuchMethodException ignored) {
                    // not a dialog fragment
                }
                current = current.getClass().getMethod("getParentFragment").invoke(current);
            }
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not stop the comment menu's entry animation", failure);
        }
    }

    private static void centerBeforeDraw(View view) {
        view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                // The panel is only known once the container is measured; until then the frame
                // is drawn as it is and this is asked again.
                if (panelOf(view) == null) return true;
                ViewTreeObserver observer = view.getViewTreeObserver();
                if (observer.isAlive()) observer.removeOnPreDrawListener(this);
                center(view);
                return false;
            }
        });
    }

    /**
     * The panel is the outermost view that is still as tall as the menu's rows: its parent is the
     * full-height container the sheet is pinned to the bottom of. Null until that is measured.
     */
    private static View panelOf(View view) {
        View panel = view;
        while (true) {
            ViewParent parent = panel.getParent();
            if (!(parent instanceof View)) return null;
            if (((View) parent).getHeight() > panel.getHeight() + 1) return panel;
            panel = (View) parent;
        }
    }

    /** The root view of the menu's own window, or null when the menu sits in the activity's. */
    private static View dialogWindowOf(View view) {
        View root = view.getRootView();
        ViewGroup.LayoutParams params = root.getLayoutParams();
        if (params instanceof WindowManager.LayoutParams
                && ((WindowManager.LayoutParams) params).type != WindowManager.LayoutParams.TYPE_BASE_APPLICATION) {
            return root;
        }
        return null;
    }

    /** The window's own slide in and out, which is the one still seen when the sheet is gone. */
    private static void noWindowAnimation(View root) {
        try {
            WindowManager.LayoutParams params = (WindowManager.LayoutParams) root.getLayoutParams();
            if (params.windowAnimations == 0) return;
            params.windowAnimations = 0;
            WindowManager manager = (WindowManager) root.getContext().getSystemService(Context.WINDOW_SERVICE);
            if (root.isAttachedToWindow()) manager.updateViewLayout(root, params);
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not stop the comment menu window's animation", failure);
        }
    }

    private static void center(View view) {
        View window = dialogWindowOf(view);
        View panel = panelOf(view);
        try {
            if (panel == null) return;
            ViewGroup.LayoutParams params = panel.getLayoutParams();
            if (params instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) params;
                int side = Dim.dp(SIDE_MARGIN_DP);
                if (margins.leftMargin != side || margins.rightMargin != side) {
                    margins.leftMargin = side;
                    margins.rightMargin = side;
                    panel.setLayoutParams(margins);
                }
            }
            pinToMiddle(panel, params);
            // Whatever slide the sheet had started stops where the layout now puts the panel.
            panel.animate().cancel();
            panel.setTranslationY(0f);
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not centre the comment menu", failure);
        } finally {
            view.setAlpha(1f);
            if (panel != null) panel.setAlpha(1f);
            if (window != null) window.setAlpha(1f);
        }
    }

    /**
     * The container is a coordinator layout. Its layout params hold the panel's behaviour, the
     * sheet logic that slides it up from the bottom, and its gravity, the first public field of
     * an object type and the one int that is a gravity with a vertical part. With no behaviour
     * and a centred gravity the layout places the panel in the middle itself, whatever height its
     * rows give it.
     */
    private static void pinToMiddle(View panel, ViewGroup.LayoutParams params) throws Exception {
        Field behavior = null;
        Field gravity = null;
        for (Field field : params.getClass().getFields()) {
            if (java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
            Class<?> type = field.getType();
            if (behavior == null && !type.isPrimitive() && field.getDeclaringClass() == params.getClass()) {
                behavior = field;
            } else if (gravity == null && type == int.class && field.getDeclaringClass() == params.getClass()
                    && (field.getInt(params) & Gravity.VERTICAL_GRAVITY_MASK) != 0) {
                gravity = field;
            }
        }
        if (behavior == null || gravity == null) return;
        if (gravity.getInt(params) == Gravity.CENTER && behavior.get(params) == null) return;
        behavior.set(params, null);
        gravity.setInt(params, Gravity.CENTER);
        panel.setLayoutParams(params);
        roundCorners(panel);
    }

    /** The sheet only rounds its top, which would leave a window with square bottom corners. */
    private static void roundCorners(View panel) {
        final float radius = Dim.dp(CORNER_RADIUS_DP);
        panel.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), radius);
            }
        });
        panel.setClipToOutline(true);
    }
}
