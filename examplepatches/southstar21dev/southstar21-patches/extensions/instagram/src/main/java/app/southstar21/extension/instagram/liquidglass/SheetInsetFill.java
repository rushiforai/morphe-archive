package app.southstar21.extension.instagram.liquidglass;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewParent;

import java.lang.ref.WeakReference;

/**
 * Instagram's bottom sheets (comments, share, ...) stop above the gesture bar and leave the strip
 * under them to whatever is behind: the tab bar, in stock Instagram. With pages running on behind
 * the floating bar, that's the page itself (on Reels, the playing reel), showing through under
 * the sheet. While a sheet is up this paints that strip with the sheet's own background, so the
 * sheet looks like it reaches the bottom of the screen.
 * <p>
 * Drawn in the window's overlay, over everything of Instagram's, only below the sheets' area.
 */
final class SheetInsetFill extends Drawable {
    private static final String PKG = "com.instagram.android";
    /** Taller than any rounded top corner, so the copied background is flat in the strip. */
    private static final int FLAT_PAD = 400;

    private final View root;
    private final int contentId;
    private WeakReference<View> sheet;
    private Drawable fill;
    /** The background {@link #fill} was copied from. */
    private Drawable fillFrom;
    private boolean added;
    private final int[] location = new int[2];
    private final Rect clip = new Rect();

    SheetInsetFill(View root) {
        this.root = root;
        contentId = root.getResources().getIdentifier("bottom_sheet_content_container", "id", PKG);
    }

    /** Once a frame. {@code on}: the page under the sheets runs on behind the bar. */
    void onPreDraw(boolean on) {
        if (contentId == 0) return;
        View content = on ? content() : null;
        View frame = content != null ? backgroundHolder(content) : null;
        Drawable bg = frame != null ? frame.getBackground() : null;
        int top = 0;
        if (bg != null && frame.getParent() instanceof View) {
            // The sheet is full height and slid down into place, so its own bottom is off
            // screen: the sheets' area ends at the bottom of the frame's container.
            View area = (View) frame.getParent();
            area.getLocationInWindow(location);
            top = location[1] + area.getHeight();
            frame.getLocationInWindow(location);
            // Only while the sheet covers that edge (not dragged off, not yet sliding in).
            if (top >= root.getHeight() || location[1] >= top || location[1] + frame.getHeight() < top) bg = null;
        } else {
            bg = null;
        }
        if (bg == null) {
            if (!getBounds().isEmpty()) {
                setBounds(0, 0, 0, 0);
                invalidateSelf();
            }
            return;
        }
        if (bg != fillFrom) {
            fillFrom = bg;
            Drawable.ConstantState state = bg.getConstantState();
            fill = state != null ? state.newDrawable(root.getResources()).mutate() : null;
        }
        if (!added) {
            root.getOverlay().add(this);
            added = true;
        }
        Rect b = getBounds();
        if (b.top != top || b.bottom != root.getHeight() || b.right != root.getWidth()) {
            setBounds(0, top, root.getWidth(), root.getHeight());
            invalidateSelf();
        }
    }

    private View content() {
        View cached = sheet != null ? sheet.get() : null;
        if (cached != null && cached.isAttachedToWindow() && cached.getId() == contentId) {
            return cached.isShown() ? cached : null;
        }
        View found = root.findViewById(contentId);
        sheet = found != null ? new WeakReference<>(found) : null;
        return found != null && found.isShown() && found.getParent() instanceof View ? found : null;
    }

    /** The view drawing the sheet's background: its content container, or the frame around it. */
    private static View backgroundHolder(View content) {
        View v = content;
        for (int i = 0; i < 3 && v != null; i++) {
            if (v.getBackground() != null) return v;
            ViewParent p = v.getParent();
            v = p instanceof View ? (View) p : null;
        }
        return null;
    }

    @Override
    public void draw(Canvas canvas) {
        Rect b = getBounds();
        if (fill == null || b.isEmpty()) return;
        int save = canvas.save();
        clip.set(b);
        canvas.clipRect(clip);
        fill.setBounds(b.left, b.top - FLAT_PAD, b.right, b.bottom);
        fill.draw(canvas);
        canvas.restoreToCount(save);
    }

    @Override
    public void setAlpha(int alpha) {
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
