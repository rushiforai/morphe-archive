package app.lchanc3.extension.jptt;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ScrollView;

/**
 * Lays the 最近看板搜尋 / 最近搜尋 keywords out over as many lines as they need,
 * instead of one line you have to scroll sideways through.
 *
 * <p>{@code dialog_search.xml} puts each list in a {@code HorizontalScrollView}
 * around a horizontal {@code LinearLayout}, which is bearable for the five and
 * fifteen keywords JPTT shows and not for more. This swaps that pair for a
 * vertical {@code ScrollView} around a flow layout, keeping the nesting depth
 * the same so {@code addSearchHistoryListToLayout()}'s
 * {@code viewGroup.getParent().setVisibility(GONE)} still hides the one row it
 * means to hide.
 *
 * <p>The scroll view caps itself at a fraction of the screen, so a long keyword
 * history scrolls within its own strip rather than pushing the dialog's buttons
 * off the bottom.
 */
@SuppressWarnings("unused")
public final class SearchHistoryLayoutPatch {

    /** Most of the screen height one keyword list may take. */
    private static final float MAX_HEIGHT_FRACTION = 0.25f;

    /** Gap between rows, in dp. The keyword buttons only have side margins. */
    private static final int ROW_GAP_DP = 4;

    /**
     * Called from the patched {@code addSearchHistoryListToLayout()} with the
     * container it is about to fill.
     *
     * @return the container to add the keywords to, which is the original one if
     *         the layout is not the shape this expects.
     */
    public static ViewGroup useFlowLayout(ViewGroup container) {
        try {
            ViewParent parent = container.getParent();
            if (!(parent instanceof HorizontalScrollView)) {
                // Already converted, or a layout this patch was not written for.
                return container;
            }
            View horizontal = (View) parent;

            ViewParent grandParent = horizontal.getParent();
            if (!(grandParent instanceof ViewGroup)) {
                return container;
            }
            ViewGroup root = (ViewGroup) grandParent;

            int index = root.indexOfChild(horizontal);
            if (index < 0) {
                return container;
            }

            Context context = container.getContext();
            FlowLayout flow = new FlowLayout(context);

            // Carry over whatever is already there, which is the 最近搜尋 label.
            while (container.getChildCount() > 0) {
                View child = container.getChildAt(0);
                container.removeViewAt(0);
                flow.addView(child);
            }
            ((ViewGroup) horizontal).removeView(container);
            flow.setId(container.getId());

            BoundedScrollView vertical = new BoundedScrollView(context);
            vertical.setVisibility(horizontal.getVisibility());
            vertical.addView(
                    flow,
                    new FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));

            ViewGroup.LayoutParams layoutParams = horizontal.getLayoutParams();
            root.removeViewAt(index);
            root.addView(vertical, index, layoutParams);

            return flow;
        } catch (Throwable ex) {
            // A sideways scrolling list beats no search dialog.
            Log.e(JpttContext.LOG_TAG, "Could not lay the search history out in rows", ex);
            return container;
        }
    }

    /** A {@link ScrollView} that never grows past {@link #MAX_HEIGHT_FRACTION}. */
    private static final class BoundedScrollView extends ScrollView {

        BoundedScrollView(Context context) {
            super(context);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int maximum = Math.round(
                    getResources().getDisplayMetrics().heightPixels * MAX_HEIGHT_FRACTION);

            int mode = MeasureSpec.getMode(heightMeasureSpec);
            int size = MeasureSpec.getSize(heightMeasureSpec);
            if (mode == MeasureSpec.UNSPECIFIED || size > maximum) {
                heightMeasureSpec = MeasureSpec.makeMeasureSpec(maximum, MeasureSpec.AT_MOST);
            }

            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }
    }

    /** Lays children out left to right, starting a new row when one is full. */
    private static final class FlowLayout extends ViewGroup {

        private final int rowGap;

        FlowLayout(Context context) {
            super(context);
            rowGap = Math.round(
                    ROW_GAP_DP * context.getResources().getDisplayMetrics().density);
        }

        @Override
        protected LayoutParams generateDefaultLayoutParams() {
            return new MarginLayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        }

        @Override
        public LayoutParams generateLayoutParams(AttributeSet attrs) {
            return new MarginLayoutParams(getContext(), attrs);
        }

        @Override
        protected LayoutParams generateLayoutParams(LayoutParams source) {
            return new MarginLayoutParams(source);
        }

        @Override
        protected boolean checkLayoutParams(LayoutParams params) {
            return params instanceof MarginLayoutParams;
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int widthMode = MeasureSpec.getMode(widthMeasureSpec);
            int limit = widthMode == MeasureSpec.UNSPECIFIED
                    ? Integer.MAX_VALUE
                    : MeasureSpec.getSize(widthMeasureSpec)
                            - getPaddingLeft() - getPaddingRight();

            int rowWidth = 0;
            int rowHeight = 0;
            int widestRow = 0;
            int totalHeight = 0;

            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                if (child.getVisibility() == GONE) {
                    continue;
                }
                measureChildWithMargins(child, widthMeasureSpec, 0, heightMeasureSpec, 0);
                MarginLayoutParams params = (MarginLayoutParams) child.getLayoutParams();
                int childWidth =
                        child.getMeasuredWidth() + params.leftMargin + params.rightMargin;
                int childHeight =
                        child.getMeasuredHeight() + params.topMargin + params.bottomMargin;

                if (rowWidth > 0 && rowWidth + childWidth > limit) {
                    widestRow = Math.max(widestRow, rowWidth);
                    totalHeight += rowHeight + rowGap;
                    rowWidth = 0;
                    rowHeight = 0;
                }
                rowWidth += childWidth;
                rowHeight = Math.max(rowHeight, childHeight);
            }
            widestRow = Math.max(widestRow, rowWidth);
            totalHeight += rowHeight;

            setMeasuredDimension(
                    resolveSize(widestRow + getPaddingLeft() + getPaddingRight(), widthMeasureSpec),
                    resolveSize(totalHeight + getPaddingTop() + getPaddingBottom(), heightMeasureSpec));
        }

        @Override
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            int limit = right - left - getPaddingLeft() - getPaddingRight();

            // Relative to the content box, so this wraps exactly where onMeasure did.
            int rowWidth = 0;
            int rowTop = getPaddingTop();
            int rowHeight = 0;

            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                if (child.getVisibility() == GONE) {
                    continue;
                }
                MarginLayoutParams params = (MarginLayoutParams) child.getLayoutParams();
                int childWidth =
                        child.getMeasuredWidth() + params.leftMargin + params.rightMargin;
                int childHeight =
                        child.getMeasuredHeight() + params.topMargin + params.bottomMargin;

                if (rowWidth > 0 && rowWidth + childWidth > limit) {
                    rowTop += rowHeight + rowGap;
                    rowWidth = 0;
                    rowHeight = 0;
                }

                int childLeft = getPaddingLeft() + rowWidth + params.leftMargin;
                int childTop = rowTop + params.topMargin;
                child.layout(
                        childLeft,
                        childTop,
                        childLeft + child.getMeasuredWidth(),
                        childTop + child.getMeasuredHeight());

                rowWidth += childWidth;
                rowHeight = Math.max(rowHeight, childHeight);
            }
        }
    }

    private SearchHistoryLayoutPatch() {
    }
}
