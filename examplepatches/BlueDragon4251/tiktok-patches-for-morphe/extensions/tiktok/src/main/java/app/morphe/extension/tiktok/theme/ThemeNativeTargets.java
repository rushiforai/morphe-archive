package app.morphe.extension.tiktok.theme;

import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.content.res.ColorStateList;
import android.view.ViewTreeObserver;
import java.util.ArrayDeque;
import java.util.Map;
import java.util.WeakHashMap;
import app.morphe.extension.shared.Logger;

/** Roots supplied by verified native lifecycle hooks. No labels, dimensions or class-name guesses. */
public final class ThemeNativeTargets {
    private static final int PROFILE = 1, SIDEBAR = 2, SEARCH = 3, CHAT = 4, NAV = 5, NAV_DIVIDER = 6;
    private static final Map<View, Target> TARGETS = new WeakHashMap<>();
    private ThemeNativeTargets() {}

    public static void profilePage(View view) { register(view, PROFILE); }
    public static void sidebar(View view) { register(view, SIDEBAR); }
    public static void search(View view) { register(view, SEARCH); }
    public static void chat(View view) { register(view, CHAT); }
    public static void navigation(View view) { register(view, NAV); }
    public static void navigationDivider(View view) { register(view, NAV_DIVIDER); }

    /** Native pager entry after computeScroll, before any child is drawn in this frame. */
    public static void beforePagerDraw(ViewGroup pager) {
        if (pager == null) return;
        try {
            for (Map.Entry<View, Target> entry : TARGETS.entrySet()) {
                View profile = entry.getKey();
                if (entry.getValue().kind == PROFILE && profile != null
                        && profile.isAttachedToWindow() && contains(pager, profile)) {
                    entry.getValue().apply();
                }
            }
        } catch (Throwable ignored) { }
    }

    private static void register(View view, int kind) {
        if (view == null) return;
        try {
            Target target = TARGETS.get(view);
            if (target == null) {
                target = new Target(view, kind);
                TARGETS.put(view, target);
                view.addOnAttachStateChangeListener(target);
                target.attach();
                final int role = kind;
                Logger.printInfo(() -> "[BlueIT Native Target v2] role=" + role + " view=" + view.getClass().getName());
            }
            target.apply();
        } catch (Throwable ignored) { }
    }

    static boolean isOwned(View view) {
        Target target = TARGETS.get(view);
        return target != null;
    }

    static boolean hasChat(View root) {
        for (Map.Entry<View, Target> entry : TARGETS.entrySet()) {
            View view = entry.getKey();
            if (entry.getValue().kind == CHAT && view.isAttachedToWindow()
                    && view.getRootView() == root && view.isShown()) return true;
        }
        return false;
    }

    private static boolean active(View view) {
        return !"default".equals(ThemeStateStore.currentPreset(view.getContext()));
    }

    private static void color(View view, int value, Target target) {
        Drawable current = view.getBackground();
        Fill fill = target.fills.get(view);
        boolean changedInPlace = fill != null && current == fill.applied && current instanceof ColorDrawable
                && ((ColorDrawable) current).getColor() != fill.appliedColor;
        if (fill == null || current != fill.applied || changedInPlace || view.getBackgroundTintList() != null) {
            Drawable nativeValue = changedInPlace ? new ColorDrawable(((ColorDrawable) current).getColor()) : current;
            fill = new Fill(nativeValue, view.getBackgroundTintList());
            target.fills.put(view, fill);
        }
        if (!(current instanceof ColorDrawable) || ((ColorDrawable) current).getColor() != value) {
            // Do not mutate TikTok's ColorDrawable: keep the native snapshot intact for Default.
            view.setBackground(new ColorDrawable(value));
        }
        if (view.getBackgroundTintList() != null) view.setBackgroundTintList(null);
        fill.applied = view.getBackground();
        fill.appliedColor = value;
    }

    private static final class Fill {
        final Drawable original;
        final ColorStateList tint;
        Drawable applied;
        int appliedColor;
        Fill(Drawable original, ColorStateList tint) { this.original = original; this.tint = tint; }
    }

    private static boolean pageFill(int color, View root) {
        int rgb = color & 0xffffff;
        return rgb == (ThemeEngine.backgroundColor(root.getContext()) & 0xffffff)
                || rgb == (ThemeEngine.surfaceColor(root.getContext()) & 0xffffff)
                || rgb == 0 || rgb == 0x121212 || rgb == 0x161823
                || rgb == 0x1e1e1e || rgb == 0x252525 || rgb == 0xffffff;
    }

    /** Map only flat page fills within a native-owned subtree; media and Compose palettes stay native. */
    private static void page(View root, boolean overlay, Target target) {
        color(root, overlay ? ThemeEngine.surfaceColor(root.getContext())
                : ThemeEngine.backgroundColor(root.getContext()), target);
        if (!(root instanceof ViewGroup)) return;
        ArrayDeque<View> queue = new ArrayDeque<>();
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) queue.add(group.getChildAt(i));
        while (!queue.isEmpty()) {
            View view = queue.removeFirst();
            if (!(view instanceof ViewGroup) || isOwned(view)) continue;
            Drawable background = view.getBackground();
            if (background instanceof ColorDrawable && pageFill(((ColorDrawable) background).getColor(), root)) {
                color(view, overlay ? Color.TRANSPARENT : ThemeEngine.backgroundColor(root.getContext()), target);
            }
            ViewGroup child = (ViewGroup) view;
            for (int i = 0; i < child.getChildCount(); i++) queue.add(child.getChildAt(i));
        }
    }

    private static View visibleSidebar(View main) {
        int width = main.getRootView().getWidth();
        int[] origin = new int[2];
        main.getRootView().getLocationOnScreen(origin);
        for (Map.Entry<View, Target> entry : TARGETS.entrySet()) {
            View sidebar = entry.getKey();
            if (entry.getValue().kind != SIDEBAR || !sidebar.isAttachedToWindow()
                    || sidebar.getRootView() != main.getRootView() || !sidebar.isShown()) continue;
            int[] location = new int[2];
            sidebar.getLocationOnScreen(location);
            if (location[0] < origin[0] + width && location[0] + sidebar.getWidth() > origin[0]) return sidebar;
        }
        return null;
    }

    private static boolean contains(ViewGroup parent, View child) {
        for (android.view.ViewParent p = child.getParent(); p != null; p = p.getParent()) {
            if (p == parent) return true;
        }
        return false;
    }

    private static final class Target implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnPreDrawListener, ViewTreeObserver.OnScrollChangedListener {
        // WeakHashMap values must not retain their keys.
        final java.lang.ref.WeakReference<View> reference;
        final int kind;
        ViewTreeObserver observer;
        float correction;
        float lastApplied;
        final Map<View, Fill> fills = new WeakHashMap<>();
        final Map<ViewGroup, boolean[]> clips = new WeakHashMap<>();
        Target(View view, int kind) { reference = new java.lang.ref.WeakReference<>(view); this.kind = kind; }
        void attach() {
            View view = reference.get();
            if (view == null) return;
            detach();
            observer = view.getViewTreeObserver();
            observer.addOnPreDrawListener(this);
            if (kind == PROFILE) observer.addOnScrollChangedListener(this);
        }
        void detach() {
            if (observer != null && observer.isAlive()) {
                observer.removeOnPreDrawListener(this);
                observer.removeOnScrollChangedListener(this);
            }
            observer = null;
            restoreClips();
        }
        void restoreClips() {
            for (Map.Entry<ViewGroup, boolean[]> entry : clips.entrySet()) {
                entry.getKey().setClipChildren(entry.getValue()[0]);
                entry.getKey().setClipToPadding(entry.getValue()[1]);
            }
            clips.clear();
        }
        void allowProfileUnderDrawer(View profile, View sidebar) {
            // Only the ancestry between the two native lifecycle roots. The shifted page's
            // clipping would otherwise cut off the corrected profile underneath the overlay.
            for (android.view.ViewParent p = profile.getParent(); p instanceof ViewGroup; p = p.getParent()) {
                ViewGroup group = (ViewGroup) p;
                if (!clips.containsKey(group)) {
                    clips.put(group, new boolean[]{group.getClipChildren(), group.getClipToPadding()});
                }
                if (group.getClipChildren()) group.setClipChildren(false);
                if (group.getClipToPadding()) group.setClipToPadding(false);
                if (contains(group, sidebar)) break;
            }
        }
        void apply() {
            View view = reference.get();
            if (view == null) return;
            boolean enabled = active(view);
            if (kind == PROFILE) {
                View sidebar = enabled ? visibleSidebar(view) : null;
                if (sidebar != null) allowProfileUnderDrawer(view, sidebar);
                else restoreClips();
                // Undo mathematically, never write a displaced intermediate frame to the View.
                int[] position = new int[2], origin = new int[2];
                view.getLocationOnScreen(position);
                view.getRootView().getLocationOnScreen(origin);
                float current = view.getTranslationX();
                float ownCorrection = current == lastApplied ? correction : 0;
                float nativeTranslation = current - ownCorrection;
                float baseX = position[0] - origin[0] - ownCorrection;
                float next = sidebar != null ? Math.max(0, -baseX) : 0;
                float applied = nativeTranslation + next;
                if (current != applied) view.setTranslationX(applied);
                // A native direct translation neutralized at zero needs no ancestor undo later.
                correction = applied == 0 ? 0 : next;
                lastApplied = applied;
            } else if (enabled && kind == SIDEBAR) page(view, true, this);
            else if (enabled && kind == SEARCH) page(view, false, this);
            else if (enabled && kind == NAV) page(view, true, this);
            else if (enabled && kind == NAV_DIVIDER) color(view, ThemeEngine.dividerColor(view.getContext()), this);
            if (!enabled && !fills.isEmpty()) {
                for (Map.Entry<View, Fill> entry : fills.entrySet()) {
                    View target = entry.getKey();
                    Fill fill = entry.getValue();
                    if (target.getBackground() == fill.applied) {
                        target.setBackground(fill.original);
                        target.setBackgroundTintList(fill.tint);
                    }
                }
                fills.clear();
            }
        }
        @Override public boolean onPreDraw() { try { apply(); } catch (Throwable ignored) { } return true; }
        @Override public void onScrollChanged() { try { apply(); } catch (Throwable ignored) { } }
        @Override public void onViewAttachedToWindow(View view) { attach(); }
        @Override public void onViewDetachedFromWindow(View view) { detach(); }
    }
}
