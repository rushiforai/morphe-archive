/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.shorts;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;

import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.WeakHashMap;

import app.morphe.extension.shared.settings.preference.SeekBarPreference;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.patches.HideStatusBarPatch;
import app.morphe.extension.youtube.settings.Settings;

@SuppressWarnings("unused")
public final class ShortsPresentation {
    private static final float OPACITY = SeekBarPreference.clampToRange(Settings.SHORTS_OVERLAY_OPACITY) / 100f;
    private static final boolean IMMERSIVE = Settings.SHORTS_IMMERSIVE_STATUS_BAR.get()
            && !HideStatusBarPatch.isEnabled();

    private static final class Bindings {
        // Main-thread only. Detached reels and shared toolbar icons are weakly held.
        static final WeakHashMap<View, Boolean> REELS = new WeakHashMap<>();
        static final WeakHashMap<View, Boolean> TOOLBAR_ICONS = OPACITY != 1f ? new WeakHashMap<>() : null;
        static final IdentityHashMap<View, WindowPresentation> ACTIVE_WINDOWS = new IdentityHashMap<>();
    }

    private ShortsPresentation() {}

    /** Injection point: the full reel's player, not an inline preview or the ordinary player. */
    public static void onReelCreated(View player) {
        if ((!IMMERSIVE && OPACITY == 1f) || player == null) return;

        int rootId = ReelResources.WATCH_ROOT;
        if (rootId == 0) return;

        View reel = player;
        while (reel.getId() != rootId) {
            if (!(reel.getParent() instanceof View parent)) return;
            reel = parent;
        }

        if (Bindings.REELS.put(reel, Boolean.TRUE) == null) {
            var listener = new ReelAttachment();
            reel.addOnAttachStateChangeListener(listener);
            if (reel.isAttachedToWindow()) listener.onViewAttachedToWindow(reel);
        }
    }

    /** Injection point: the shared native toolbar may bind these icons before opening the reel. */
    public static void onToolbarIconBound(String button, View container, ImageView icon) {
        if (OPACITY == 1f) return;

        Bindings.TOOLBAR_ICONS.put(icon, Boolean.TRUE);
        var window = Bindings.ACTIVE_WINDOWS.get(icon.getRootView());
        if (window != null) window.targetsChanged();
    }

    private static final class ReelResources {
        static final int WATCH_ROOT = ResourceUtils.getIdIdentifier("reel_watch_fragment_root");
    }

    private static final class OverlayResources {
        static final int TIME_BAR = ResourceUtils.getIdIdentifier("reel_time_bar");
        static final int[] CONTROL_GROUPS = {
                ResourceUtils.getIdIdentifier("reel_player_delegated_overlay"),
                ResourceUtils.getIdIdentifier("reel_player_footer_container"),
                ResourceUtils.getIdIdentifier("reel_static_header_group"),
                ResourceUtils.getIdIdentifier("elements_top_bar_container"),
                ResourceUtils.getIdIdentifier("reel_bottom_action_bar_container"),
                ResourceUtils.getIdIdentifier("reel_player_top_section"),
                ResourceUtils.getIdIdentifier("reel_player_header_container"),
                ResourceUtils.getIdIdentifier("reel_dyn_bottom_container"),
                ResourceUtils.getIdIdentifier("reel_right_dyn_bar"),
                ResourceUtils.getIdIdentifier("reel_progress_bar"),
        };

        static boolean isControlGroup(int id) {
            if (id == View.NO_ID || id == 0) return false;

            for (int controlId : CONTROL_GROUPS) {
                if (id == controlId) return true;
            }
            return false;
        }
    }

    private static final class ReelAttachment implements View.OnAttachStateChangeListener {
        private WindowPresentation presentation;

        @Override
        public void onViewAttachedToWindow(View reel) {
            if (presentation != null) return;

            View decor = reel.getRootView();
            presentation = Bindings.ACTIVE_WINDOWS.get(decor);
            if (presentation == null) {
                presentation = new WindowPresentation(decor);
                Bindings.ACTIVE_WINDOWS.put(decor, presentation);
            }
            presentation.reels.add(reel);
            presentation.targetsChanged();
        }

        @Override
        public void onViewDetachedFromWindow(View reel) {
            if (presentation == null) return;

            presentation.reels.remove(reel);
            if (presentation.reels.isEmpty()) {
                presentation.close();
                Bindings.ACTIVE_WINDOWS.remove(presentation.decor);
            } else {
                presentation.targetsChanged();
            }
            presentation = null;
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper wrapper) {
            if (context instanceof Activity activity) return activity;
            context = wrapper.getBaseContext();
        }
        return null;
    }

    private static final class WindowPresentation implements ViewTreeObserver.OnPreDrawListener {
        private final View decor;
        private final ViewTreeObserver observer;
        private final Activity activity;
        private final ShortsStatusBar statusBar;
        private final ArrayList<View> reels = new ArrayList<>(1);
        private final ViewTreeObserver.OnGlobalLayoutListener onLayout = OPACITY != 1f ? this::targetsChanged : null;
        private final ViewTreeObserver.OnScrollChangedListener onScroll = OPACITY != 1f ? this::targetsChanged : null;
        private final IdentityHashMap<View, ControlOpacity> byView = OPACITY != 1f ? new IdentityHashMap<>() : null;
        private final ArrayList<ControlOpacity> controls = OPACITY != 1f ? new ArrayList<>() : null;
        private boolean targetsDirty = true;
        private boolean wasShowing;
        private int generation;

        WindowPresentation(View decor) {
            this.decor = decor;
            activity = IMMERSIVE ? activityOf(decor.getContext()) : null;
            statusBar = activity != null && activity.getWindow().getDecorView() == decor
                    ? new ShortsStatusBar(activity.getWindow()) : null;
            observer = decor.getViewTreeObserver();
            observer.addOnPreDrawListener(this);
            if (OPACITY != 1f) {
                observer.addOnGlobalLayoutListener(onLayout);
                observer.addOnScrollChangedListener(onScroll);
            }
        }

        void targetsChanged() {
            targetsDirty = true;
        }

        @Override
        public boolean onPreDraw() {
            boolean showing = decor.getWindowVisibility() == View.VISIBLE && hasVisibleReel();
            updateStatusBar(showing);

            if (controls != null) {
                if (targetsDirty || showing != wasShowing) refreshControls(showing);

                for (int index = controls.size() - 1; index >= 0; index--) {
                    ControlOpacity control = controls.get(index);
                    if (control.view.isAttachedToWindow()) {
                        control.apply(OPACITY);
                    } else {
                        removeControl(index);
                        targetsChanged();
                    }
                }
            }
            wasShowing = showing;
            return true;
        }

        private boolean hasVisibleReel() {
            for (int index = 0; index < reels.size(); index++) {
                if (reels.get(index).isShown()) return true;
            }
            return false;
        }

        private void updateStatusBar(boolean showing) {
            if (statusBar == null) return;

            if (showing && !activity.isInMultiWindowMode() && !activity.isInPictureInPictureMode()
                    && !activity.isFinishing() && !activity.isDestroyed()) {
                statusBar.enter();
            } else {
                statusBar.exit();
            }
        }

        private void refreshControls(boolean showing) {
            targetsDirty = false;
            generation++;

            if (showing) {
                for (int index = 0; index < reels.size(); index++) {
                    View reel = reels.get(index);
                    if (reel.isShown()) collectReelControls(reel);
                }
                collectTimeBars();
                for (View icon : Bindings.TOOLBAR_ICONS.keySet()) {
                    if (icon.isShown() && icon.getRootView() == decor && !coveredByReelControl(icon)) {
                        markControl(icon);
                    }
                }
            }

            for (int index = controls.size() - 1; index >= 0; index--) {
                if (controls.get(index).generation != generation) removeControl(index);
            }
        }

        private void collectReelControls(View view) {
            if (OverlayResources.isControlGroup(view.getId())) {
                markControl(view);
                return;
            }

            // Never fade an entire page: it can also contain video, snapshots, scrims or the Restore button.
            if (view instanceof ViewGroup group) {
                for (int index = 0; index < group.getChildCount(); index++) {
                    collectReelControls(group.getChildAt(index));
                }
            }
        }

        private void collectTimeBars() {
            int timeBarId = OverlayResources.TIME_BAR;
            if (timeBarId == 0) return;

            // All supported native bindings add this wrapper directly to the activity's content parent.
            if (decor.findViewById(android.R.id.content) instanceof ViewGroup content) {
                for (int index = 0; index < content.getChildCount(); index++) {
                    View child = content.getChildAt(index);
                    if (child.getId() == timeBarId) markControl(child);
                }
            }
        }

        private boolean coveredByReelControl(View view) {
            for (View current = view; current.getParent() instanceof View parent; current = parent) {
                ControlOpacity control = byView.get(parent);
                if (control != null && control.generation == generation) return true;
            }
            return false;
        }

        private void markControl(View view) {
            if (!view.isAttachedToWindow()) return;

            ControlOpacity control = byView.get(view);
            if (control == null) {
                control = new ControlOpacity(view);
                byView.put(view, control);
                controls.add(control);
            }
            control.generation = generation;
        }

        private void removeControl(int index) {
            ControlOpacity removed = controls.remove(index);
            byView.remove(removed.view);
            removed.restore();
        }

        void close() {
            if (observer.isAlive()) {
                observer.removeOnPreDrawListener(this);
                if (OPACITY != 1f) {
                    observer.removeOnGlobalLayoutListener(onLayout);
                    observer.removeOnScrollChangedListener(onScroll);
                }
            }
            if (controls != null) {
                for (int index = controls.size() - 1; index >= 0; index--) removeControl(index);
            }
            if (statusBar != null) statusBar.exit();
        }
    }

    static final class ControlOpacity {
        private final View view;
        private float original;
        private float applied;
        private int generation;

        ControlOpacity(View view) {
            this.view = view;
            original = applied = getAlpha();
        }

        private float getAlpha() {
            // On newer Android versions this factor composes with native alpha animations.
            return Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q ? view.getTransitionAlpha() : view.getAlpha();
        }

        private void setAlpha(float alpha) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                view.setTransitionAlpha(alpha);
            } else {
                view.setAlpha(alpha);
            }
        }

        void apply(float opacity) {
            float current = getAlpha();
            if (current != applied) original = current;
            applied = original * opacity;
            if (current != applied) setAlpha(applied);
        }

        void restore() {
            if (applied != original && getAlpha() == applied) setAlpha(original);
        }
    }
}
