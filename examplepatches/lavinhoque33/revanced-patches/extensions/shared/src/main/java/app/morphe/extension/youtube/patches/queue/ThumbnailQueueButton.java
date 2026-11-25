/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24
 *
 * The thumbnail overlay design follows Morphe's Feed video actions:
 * https://github.com/MorpheApp/morphe-patches/pull/4822
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */
package app.morphe.extension.youtube.patches.queue;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction;
import android.widget.HorizontalScrollView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.litho.ComponentHost;

import java.lang.ref.WeakReference;
import java.util.function.Consumer;

import app.morphe.extension.youtube.patches.AddToQueuePatch;
import app.morphe.extension.youtube.patches.utils.FeedVideoCardsPatch;

/** Draws the queue action on the thumbnail, without adding children to Litho's managed view tree. */
public final class ThumbnailQueueButton extends Drawable {
    private static final int SIZE_DP = 34;
    private static final int ICON_DP = 20;
    private static final int MARGIN_DP = 10;
    private static final int TOUCH_SLOP_DP = 6;
    private static final int MIN_THUMBNAIL_WIDTH_DP = 240;

    // Keep binding-specific action IDs outside the framework and app resource ID ranges.
    private static final int ACCESSIBILITY_ACTION_ID_PREFIX = 0x7e000000;
    private static final int ACCESSIBILITY_ACTION_ID_MASK = 0xff000000;

    private static final class Artwork {
        @Nullable
        private static final Drawable ICON = createIcon();
    }

    private final WeakReference<View> ownerRef;
    private final ThumbnailQueuePatch.Binding binding;
    private final String marker;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private boolean pressed;
    @Nullable
    private AccessibilityAction accessibilityAction;

    private ThumbnailQueueButton(View owner, CharSequence label, ThumbnailQueuePatch.Binding binding) {
        ownerRef = new WeakReference<>(owner);
        this.binding = binding;
        marker = label.subSequence(0, ThumbnailQueuePatch.BINDING_LENGTH).toString();
    }

    @Nullable
    private static Drawable createIcon() {
        Drawable icon = AddToQueuePatch.createQueueButtonDrawable();
        if (icon != null) {
            icon = icon.mutate();
            icon.setTint(Color.WHITE);
        }
        return icon;
    }

    @Nullable
    public static ThumbnailQueueButton bind(ComponentHost host, @Nullable ThumbnailQueueButton previous) {
        View owner = Artwork.ICON == null || isInShelf(host) ? null : findOwner(host);
        if (previous != null && previous.ownerRef.get() == owner && previous.isBoundTo(owner)) {
            previous.place(owner);
            return previous;
        }
        if (previous != null) {
            previous.remove();
        }
        if (owner == null) {
            return null;
        }

        ThumbnailQueueButton button = createBound(owner);
        if (button != null) {
            button.place(owner);
            owner.getOverlay().add(button);
        }
        return button;
    }

    @Nullable
    static ThumbnailQueueButton createBound(View owner) {
        CharSequence label = owner.getContentDescription();
        ThumbnailQueuePatch.Binding binding = ThumbnailQueuePatch.binding(label);
        return binding == null ? null : new ThumbnailQueueButton(owner, label, binding);
    }

    private static boolean isInShelf(View host) {
        for (ViewParent ancestor = host.getParent(); ancestor instanceof View view; ancestor = view.getParent()) {
            if (view instanceof HorizontalScrollView) {
                return true;
            }
            if (view instanceof RecyclerView) {
                return view.canScrollHorizontally(-1) || view.canScrollHorizontally(1);
            }
        }
        return false;
    }

    @Nullable
    private static View findOwner(View view) {
        if (view.getVisibility() != View.VISIBLE || view.getWidth() < dp(view, MIN_THUMBNAIL_WIDTH_DP)) {
            return null;
        }
        if (ThumbnailQueuePatch.hasBinding(view.getContentDescription())
                && view.getHeight() >= view.getWidth() * FeedVideoCardsPatch.THUMBNAIL_RATIO) {
            // On inset Cards this is the inner host, already offset to the real thumbnail's top-left.
            return view;
        }
        if (view instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child instanceof ComponentHost) {
                    View owner = findOwner(child);
                    if (owner != null) {
                        return owner;
                    }
                }
            }
        }
        return null;
    }

    private boolean isBoundTo(@Nullable View owner) {
        CharSequence label = owner == null ? null : owner.getContentDescription();
        if (!ThumbnailQueuePatch.hasBinding(label)) {
            return false;
        }
        for (int i = 0; i < marker.length(); i++) {
            if (label.charAt(i) != marker.charAt(i)) {
                return false;
            }
        }
        return true;
    }

    private void place(View owner) {
        int margin = dp(owner, MARGIN_DP);
        int size = dp(owner, SIZE_DP);
        setBounds(margin, margin, margin + size, margin + size);
    }

    private void remove() {
        View owner = ownerRef.get();
        if (owner != null) {
            owner.getOverlay().remove(this);
        }
        ownerRef.clear();
    }

    private boolean isVisible(@Nullable View owner) {
        return owner != null && owner.isAttachedToWindow() && owner.isShown() && isBoundTo(owner)
                && !FeedVideoCardsPatch.isPlayingInline(binding.videoId());
    }

    public boolean hit(ComponentHost host, float x, float y, int[] hostLocation, int[] ownerLocation) {
        View owner = ownerRef.get();
        if (!isVisible(owner)) {
            return false;
        }
        if (owner != host) {
            host.getLocationOnScreen(hostLocation);
            owner.getLocationOnScreen(ownerLocation);
            x += hostLocation[0] - ownerLocation[0];
            y += hostLocation[1] - ownerLocation[1];
        }

        Rect bounds = getBounds();
        int slop = dp(host, TOUCH_SLOP_DP);
        return x >= bounds.left - slop && x <= bounds.right + slop
                && y >= bounds.top - slop && y <= bounds.bottom + slop;
    }

    public void click() {
        if (isVisible(ownerRef.get())) {
            ThumbnailQueuePatch.onButtonClick(binding);
        }
    }

    /** Appends a custom action, never replacing the host node's click, long-click or virtual children. */
    public void addAccessibilityAction(View host, AccessibilityNodeInfo info, CharSequence label) {
        if (!isAccessibilityOwner(host)) {
            return;
        }
        if (accessibilityAction == null) {
            // Do not let an already-delivered node for A invoke the action for B after host recycling.
            int id = ACCESSIBILITY_ACTION_ID_PREFIX | View.generateViewId();
            accessibilityAction = new AccessibilityAction(id, label);
        }
        info.addAction(accessibilityAction);
    }

    public static boolean isQueueActionId(int id) {
        return (id & ACCESSIBILITY_ACTION_ID_MASK) == ACCESSIBILITY_ACTION_ID_PREFIX;
    }

    public boolean performAccessibilityAction(View host, int id) {
        return performAccessibilityAction(host, id, ThumbnailQueuePatch::onButtonClick);
    }

    boolean performAccessibilityAction(View host, int id, Consumer<ThumbnailQueuePatch.Binding> action) {
        if (accessibilityAction == null || accessibilityAction.getId() != id || !isAccessibilityOwner(host)) {
            return false;
        }
        action.accept(binding);
        return true;
    }

    private boolean isAccessibilityOwner(View host) {
        return ownerRef.get() == host && isVisible(host) && !isInShelf(host);
    }

    public void setPressed(boolean value) {
        if (pressed != value) {
            pressed = value;
            invalidateSelf();
        }
    }

    @Override
    public void draw(@NonNull Canvas canvas) {
        Drawable icon = Artwork.ICON;
        if (icon == null || !isVisible(ownerRef.get())) {
            return;
        }
        Rect bounds = getBounds();
        paint.setColor(pressed ? 0xDD000000 : 0xA6000000);
        canvas.drawCircle(bounds.exactCenterX(), bounds.exactCenterY(), bounds.width() / 2f, paint);

        int iconSize = bounds.width() * ICON_DP / SIZE_DP;
        int left = bounds.centerX() - iconSize / 2;
        int top = bounds.centerY() - iconSize / 2;
        icon.setBounds(left, top, left + iconSize, top + iconSize);
        icon.draw(canvas);
    }

    @Override
    public void setAlpha(int alpha) { }

    @Override
    public void setColorFilter(@Nullable ColorFilter colorFilter) { }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }

    private static int dp(View view, int dp) {
        return Math.round(dp * view.getResources().getDisplayMetrics().density);
    }
}
