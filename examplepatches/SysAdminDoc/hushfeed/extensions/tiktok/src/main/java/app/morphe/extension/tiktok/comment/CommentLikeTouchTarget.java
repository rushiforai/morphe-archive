/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.comment;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.graphics.Region;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.WeakHashMap;

/** Adds a pointer halo in unused row space. Native listeners, layout and semantics stay intact. */
public final class CommentLikeTouchTarget {
    private static final WeakHashMap<View, Boolean> ROWS = new WeakHashMap<>();
    private static final WeakHashMap<View, WeakReference<Binding>> BINDINGS = new WeakHashMap<>();

    /** Receives only the native Like install proven by Comment.isUserDigged at patch time. */
    public static void setNativeListener(View view, View.OnTouchListener listener) {
        if (view == null) return;
        Binding binding = binding(view);
        if (binding != null) binding.cancel();
        view.setOnTouchListener(listener);
        HookStatus.bound("comment like target", "native Like touch install");
        if (!Settings.LARGER_COMMENT_LIKE_TARGET.get()) return;
        try {
            if (binding == null) {
                binding = new Binding(view);
                BINDINGS.put(view, new WeakReference<>(binding));
                view.addOnAttachStateChangeListener(binding);
            }
            view.post(binding);
        } catch (Exception error) {
            Logger.printException(() -> "Could not expand the comment heart target", error);
        }
    }

    /** A row boundary prevents a halo from reaching another comment or the sheet's controls. */
    public static void onCellBound(View row) {
        if (row == null) return;
        if (!Settings.LARGER_COMMENT_LIKE_TARGET.get() && BINDINGS.isEmpty()) return;
        ROWS.put(row, Boolean.TRUE);
        visit(row);
    }

    private static Binding binding(View view) {
        WeakReference<Binding> reference = BINDINGS.get(view);
        return reference == null ? null : reference.get();
    }

    private static void visit(View view) {
        Binding binding = binding(view);
        if (binding != null) {
            binding.cancel(); // A pending press must never follow a recycled row's next model.
            view.post(binding);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) visit(group.getChildAt(i));
        }
    }

    private static final class Binding extends TouchDelegate implements Runnable, View.OnAttachStateChangeListener {
        final View target;
        final int padding, slop;
        final Rect original = new Rect();
        final Region area = new Region();
        ViewGroup host;
        boolean active, discard;
        float downX, downY;
        long downTime;

        Binding(View target) {
            super(new Rect(), target);
            this.target = target;
            padding = Math.round(12 * target.getResources().getDisplayMetrics().density);
            slop = ViewConfiguration.get(target.getContext()).getScaledTouchSlop();
        }

        @Override public void run() {
            if (!Settings.LARGER_COMMENT_LIKE_TARGET.get() || !target.isAttachedToWindow()) {
                release();
                return;
            }
            if (host != null) {
                // Another owner replacing our delegate wins. Never overwrite its new behavior.
                if (host.getTouchDelegate() != this) return;
                if (geometry(host)) return;
                release();
            }
            View row = target;
            while (!ROWS.containsKey(row) && row.getParent() instanceof View) row = (View) row.getParent();
            if (!ROWS.containsKey(row)) return;
            View ancestor = target;
            while (ancestor != row && ancestor.getParent() instanceof ViewGroup) {
                ViewGroup candidate = (ViewGroup) ancestor.getParent();
                // Existing delegates may have invisible regions of their own. Leave them alone.
                if (candidate.getTouchDelegate() != null) return;
                if (geometry(candidate)) {
                    host = candidate;
                    host.setTouchDelegate(this);
                    HookStatus.bound("comment like target", "blank-space halo attached");
                    return;
                }
                ancestor = candidate;
            }
        }

        /** Subtract every visible sibling, including nonclickable text, not just other buttons. */
        boolean geometry(ViewGroup candidate) {
            if (!target.isShown() || !target.isEnabled() || !candidate.isEnabled() || candidate.getWidth() == 0) return false;
            View ancestor = target;
            while (ancestor != candidate && ancestor.getParent() instanceof View) ancestor = (View) ancestor.getParent();
            if (ancestor != candidate) return false;
            original.set(0, 0, target.getWidth(), target.getHeight());
            candidate.offsetDescendantRectToMyCoords(target, original);
            Rect expanded = new Rect(original);
            expanded.inset(-padding, -padding);
            if (!expanded.intersect(0, 0, candidate.getWidth(), candidate.getHeight())) return false;
            area.set(expanded);
            View current = target;
            while (current != candidate && current.getParent() instanceof ViewGroup) {
                ViewGroup parent = (ViewGroup) current.getParent();
                for (int i = 0; i < parent.getChildCount(); i++) {
                    View sibling = parent.getChildAt(i);
                    if (sibling == current || sibling.getVisibility() != View.VISIBLE) continue;
                    Rect occupied = new Rect(0, 0, sibling.getWidth(), sibling.getHeight());
                    candidate.offsetDescendantRectToMyCoords(sibling, occupied);
                    // Don't claim a diagonal corner on the far side of the neighboring button.
                    if (occupied.top < original.bottom && occupied.bottom > original.top &&
                            (occupied.right <= original.left || occupied.left >= original.right)) {
                        occupied.top = expanded.top;
                        occupied.bottom = expanded.bottom;
                    } else if (occupied.left < original.right && occupied.right > original.left &&
                            (occupied.bottom <= original.top || occupied.top >= original.bottom)) {
                        occupied.left = expanded.left;
                        occupied.right = expanded.right;
                    }
                    area.op(occupied, Region.Op.DIFFERENCE);
                }
                current = parent;
            }
            Region added = new Region(area);
            added.op(original, Region.Op.DIFFERENCE);
            return current == candidate && !added.isEmpty();
        }

        @Override public boolean onTouchEvent(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                cancel();
                discard = false;
                if (!Settings.LARGER_COMMENT_LIKE_TARGET.get() || host == null ||
                        event.getPointerCount() != 1 || !geometry(host) ||
                        !area.contains((int) event.getX(), (int) event.getY()) ||
                        original.contains((int) event.getX(), (int) event.getY())) return false;
                downX = event.getX();
                downY = event.getY();
                downTime = event.getEventTime();
                active = forward(event, MotionEvent.ACTION_DOWN);
                return active;
            }
            if (!active && !discard) return false;
            if (active && (action == MotionEvent.ACTION_CANCEL || event.getPointerCount() != 1 ||
                    !Settings.LARGER_COMMENT_LIKE_TARGET.get() || !target.isShown() || !target.isEnabled() ||
                    Math.abs(event.getX() - downX) > slop || Math.abs(event.getY() - downY) > slop ||
                    event.getEventTime() - downTime >= ViewConfiguration.getLongPressTimeout())) cancel();
            if (active) {
                if (action == MotionEvent.ACTION_UP) active = false;
                forward(event, action);
            }
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) discard = false;
            return true;
        }

        boolean forward(MotionEvent event, int action) {
            MotionEvent copy = MotionEvent.obtain(event);
            try {
                copy.setAction(action);
                copy.setLocation(target.getWidth() / 2f, target.getHeight() / 2f);
                return target.dispatchTouchEvent(copy);
            } finally { copy.recycle(); }
        }

        void cancel() {
            if (!active) return;
            active = false;
            discard = true;
            MotionEvent event = MotionEvent.obtain(downTime, SystemClock.uptimeMillis(),
                    MotionEvent.ACTION_CANCEL, 0, 0, 0);
            try { forward(event, MotionEvent.ACTION_CANCEL); } finally { event.recycle(); }
        }

        void release() {
            cancel();
            if (host != null && host.getTouchDelegate() == this) host.setTouchDelegate(null);
            host = null;
        }

        @TargetApi(29)
        @Override public AccessibilityNodeInfo.TouchDelegateInfo getTouchDelegateInfo() {
            if (host != null && geometry(host)) {
                return new AccessibilityNodeInfo.TouchDelegateInfo(Collections.singletonMap(new Region(area), target));
            }
            return super.getTouchDelegateInfo();
        }

        @Override public void onViewAttachedToWindow(View view) { view.post(this); }
        @Override public void onViewDetachedFromWindow(View view) { view.removeCallbacks(this); release(); }
    }

    private CommentLikeTouchTarget() { }
}
