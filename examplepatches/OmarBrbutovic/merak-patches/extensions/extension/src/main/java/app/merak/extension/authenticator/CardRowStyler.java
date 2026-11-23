package app.merak.extension.authenticator;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import java.util.WeakHashMap;

/**
 * Styles the app's own account rows so consecutive rows of the same category
 * form one rounded card, with the category header drawn above the first row.
 * <p>
 * Rows are never wrapped or re-parented (the app injects into its row views by type),
 * so the card is produced purely with padding plus a custom background drawable.
 * The original background (the tap ripple) is kept and drawn clipped to the card.
 */
final class CardRowStyler {

    private static final class Original {
        final int left, top, right, bottom;
        final Drawable background;
        String signature;

        Original(View view) {
            left = view.getPaddingLeft();
            top = view.getPaddingTop();
            right = view.getPaddingRight();
            bottom = view.getPaddingBottom();
            background = view.getBackground();
        }
    }

    private static final WeakHashMap<View, Original> originals = new WeakHashMap<>();

    private CardRowStyler() {
    }

    static void apply(View row, boolean first, boolean last, boolean topOfList,
                      String title, int count, int accent, String iconId) {
        Original original = originals.get(row);
        if (original == null) {
            original = new Original(row);
            originals.put(row, original);
        }

        Context context = row.getContext();
        final boolean dark = Ui.isDark(context);
        String signature = first + "|" + last + "|" + topOfList + "|" + title + "|"
                + count + "|" + accent + "|" + dark + "|" + iconId;
        if (signature.equals(original.signature)) return; // Already styled, nothing changed.
        original.signature = signature;

        int inset = Ui.dp(context, 12);
        int headerHeight = first ? Ui.dp(context, topOfList ? 40 : 56) : 0;
        int bottomGap = last ? Ui.dp(context, 4) : 0;

        CardDrawable drawable = new CardDrawable(context, original.background,
                first, last, title, count, accent, iconId, inset, headerHeight, bottomGap);

        // Set the background before padding, as setBackground() can apply drawable padding.
        row.setBackground(drawable);
        row.setPadding(original.left + inset, original.top + headerHeight,
                original.right + inset, original.bottom + bottomGap);
        centerOnCard(row, (headerHeight - bottomGap) / 2f);
    }

    /**
     * RelativeLayout centers children vertically over the whole row, ignoring padding. With the
     * header above the card, the countdown would sit too high and could overlap the name, so
     * vertically centered children are moved to the center of the card part of the row.
     */
    private static void centerOnCard(View row, float offset) {
        if (!(row instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) row;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (isCenteredVertically(child)) child.setTranslationY(offset);
        }
    }

    private static boolean isCenteredVertically(View child) {
        if (!(child.getLayoutParams() instanceof RelativeLayout.LayoutParams)) return false;
        int[] rules = ((RelativeLayout.LayoutParams) child.getLayoutParams()).getRules();
        return rules[RelativeLayout.CENTER_VERTICAL] != 0 || rules[RelativeLayout.CENTER_IN_PARENT] != 0;
    }

    /** Restores a row to exactly how the app inflated it. */
    static void restore(View row) {
        Original original = originals.remove(row);
        if (original == null) return;
        row.setBackground(original.background);
        row.setPadding(original.left, original.top, original.right, original.bottom);
        centerOnCard(row, 0);
    }

    private static final class CardDrawable extends Drawable implements Drawable.Callback {
        private final Drawable inner;
        private final boolean first, last;
        private final String title;
        private final String countText;
        private final int inset, headerHeight, bottomGap;
        private final float radius, smallRadius, dividerInset;

        private final Paint cardPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint dividerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint dotPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        /** Category icon drawn instead of the color dot, or null. */
        private final Drawable headerIcon;
        private final int headerIconSize;
        private final Paint titlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint countPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float dotRadius, textStart, titleGap, headerCenterOffset;

        private final Path cardPath = new Path();
        private final RectF cardRect = new RectF();
        private final float[] radii = new float[8];

        CardDrawable(Context context, Drawable inner, boolean first, boolean last,
                     String title, int count, int accent, String iconId,
                     int inset, int headerHeight, int bottomGap) {
            this.inner = inner;
            this.first = first;
            this.last = last;
            this.title = title;
            this.countText = String.valueOf(count);
            this.inset = inset;
            this.headerHeight = headerHeight;
            this.bottomGap = bottomGap;
            this.radius = Ui.dp(context, 20);
            this.smallRadius = Ui.dp(context, 4);
            this.dividerInset = Ui.dp(context, 16);
            this.dotRadius = Ui.dp(context, 5);
            this.textStart = inset + Ui.dp(context, 26);
            this.titleGap = Ui.dp(context, 8);
            this.headerCenterOffset = Ui.dp(context, 20);

            cardPaint.setColor(Ui.surfaceContainerHigh(context));
            dividerPaint.setColor(Ui.surface(context));
            dividerPaint.setStrokeWidth(Ui.dp(context, 2));
            dotPaint.setColor(accent);
            headerIcon = CategoryIcons.create(iconId, accent);
            headerIconSize = Ui.dp(context, 20);

            titlePaint.setColor(Ui.onSurface(context));
            titlePaint.setTextSize(Ui.sp(context, 15));
            titlePaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));

            countPaint.setColor(Ui.onSurfaceVariant(context));
            countPaint.setTextSize(Ui.sp(context, 13));

            if (inner != null) inner.setCallback(this);
        }

        @Override
        protected void onBoundsChange(Rect bounds) {
            cardRect.set(bounds.left + inset, bounds.top + headerHeight,
                    bounds.right - inset, bounds.bottom - bottomGap);
            float top = first ? radius : smallRadius;
            float bottom = last ? radius : smallRadius;
            radii[0] = radii[1] = radii[2] = radii[3] = top;
            radii[4] = radii[5] = radii[6] = radii[7] = bottom;
            cardPath.reset();
            cardPath.addRoundRect(cardRect, radii, Path.Direction.CW);
            if (inner != null) {
                inner.setBounds(Math.round(cardRect.left), Math.round(cardRect.top),
                        Math.round(cardRect.right), Math.round(cardRect.bottom));
            }
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            canvas.drawPath(cardPath, cardPaint);

            if (!first) {
                // Gap between rows of the same card, in the page color.
                canvas.drawLine(cardRect.left + dividerInset, cardRect.top,
                        cardRect.right - dividerInset, cardRect.top, dividerPaint);
            }

            if (first && headerHeight > 0) {
                float centerY = bounds.top + headerHeight - headerCenterOffset;
                if (headerIcon != null) {
                    int iconLeft = Math.round(bounds.left + inset + dotRadius * 2 - headerIconSize / 2f);
                    int iconTop = Math.round(centerY - headerIconSize / 2f);
                    headerIcon.setBounds(iconLeft, iconTop, iconLeft + headerIconSize, iconTop + headerIconSize);
                    headerIcon.draw(canvas);
                } else {
                    canvas.drawCircle(bounds.left + inset + dotRadius * 2, centerY, dotRadius, dotPaint);
                }

                float baseline = centerY - (titlePaint.descent() + titlePaint.ascent()) / 2f;
                float maxTitleWidth = bounds.width() - textStart - inset
                        - countPaint.measureText(countText) - titleGap * 2;
                CharSequence shownTitle = TextUtils.ellipsize(title,
                        new android.text.TextPaint(titlePaint), Math.max(0, maxTitleWidth),
                        TextUtils.TruncateAt.END);
                float x = bounds.left + textStart;
                canvas.drawText(shownTitle, 0, shownTitle.length(), x, baseline, titlePaint);
                x += titlePaint.measureText(shownTitle, 0, shownTitle.length()) + titleGap;
                canvas.drawText(countText, x, baseline, countPaint);
            }

            if (inner != null) {
                int save = canvas.save();
                canvas.clipPath(cardPath);
                inner.draw(canvas);
                canvas.restoreToCount(save);
            }
        }

        // region Forward state to the original ripple so touch feedback keeps working.

        @Override
        public boolean isStateful() {
            return inner != null && inner.isStateful();
        }

        @Override
        protected boolean onStateChange(int[] state) {
            if (inner == null) return false;
            boolean changed = inner.setState(state);
            if (changed) invalidateSelf();
            return changed;
        }

        @Override
        public void setHotspot(float x, float y) {
            if (inner != null) inner.setHotspot(x, y);
        }

        @Override
        public void setHotspotBounds(int left, int top, int right, int bottom) {
            if (inner != null) inner.setHotspotBounds(left, top, right, bottom);
        }

        @Override
        public void jumpToCurrentState() {
            if (inner != null) inner.jumpToCurrentState();
        }

        @Override
        public boolean setVisible(boolean visible, boolean restart) {
            if (inner != null) inner.setVisible(visible, restart);
            return super.setVisible(visible, restart);
        }

        @Override
        public void invalidateDrawable(Drawable who) {
            invalidateSelf();
        }

        @Override
        public void scheduleDrawable(Drawable who, Runnable what, long when) {
            scheduleSelf(what, when);
        }

        @Override
        public void unscheduleDrawable(Drawable who, Runnable what) {
            unscheduleSelf(what);
        }

        // endregion

        @Override
        public void setAlpha(int alpha) {
            cardPaint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            cardPaint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
