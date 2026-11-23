package app.merak.extension.authenticator;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Point;
import android.view.DragEvent;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ScrollView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Two column grid of folder tiles that can be reordered by long pressing and dragging a tile.
 * Other tiles slide out of the way while dragging. Releasing a long press without moving the
 * tile reports a "long press" instead, used to show the folder actions.
 */
final class FolderGrid extends ViewGroup {

    interface Listener {
        /** The shown folders were reordered. */
        void onReordered(List<String> folderIds);

        /** A folder was long pressed and released without being moved. */
        void onLongPress(String folderId);
    }

    private static final long MOVE_ANIMATION_MS = 180;

    private final int gap;
    private final int edgeScroll;
    private final List<View> order = new ArrayList<>();
    private final Map<View, String> ids = new HashMap<>();
    private final Map<View, Point> lastPositions = new HashMap<>();
    private Listener listener;

    private View dragging;
    private boolean moved;

    FolderGrid(Context context) {
        super(context);
        gap = Ui.dp(context, 12);
        edgeScroll = Ui.dp(context, 72);
        setClipChildren(false);
        setOnDragListener(this::onDrag);
    }

    void setListener(Listener listener) {
        this.listener = listener;
    }

    /**
     * Adds a tile. Tiles with a null id are fixed (like "New folder") and stay where they are.
     */
    void addTile(View tile, String folderId) {
        addView(tile);
        order.add(tile);
        if (folderId != null) {
            ids.put(tile, folderId);
            tile.setOnLongClickListener(v -> {
                startDrag(v);
                return true;
            });
        }
    }

    // region Layout

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        int width = MeasureSpec.getSize(widthSpec);
        int columnWidth = Math.max(0, (width - getPaddingLeft() - getPaddingRight() - gap) / 2);
        int columnSpec = MeasureSpec.makeMeasureSpec(columnWidth, MeasureSpec.EXACTLY);
        int unspecified = MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED);

        int height = getPaddingTop() + getPaddingBottom();
        for (int row = 0; row * 2 < order.size(); row++) {
            int rowHeight = 0;
            for (int i = row * 2; i < Math.min(order.size(), row * 2 + 2); i++) {
                View child = order.get(i);
                child.measure(columnSpec, unspecified);
                rowHeight = Math.max(rowHeight, child.getMeasuredHeight());
            }
            // Tiles of a row share the same height.
            int exact = MeasureSpec.makeMeasureSpec(rowHeight, MeasureSpec.EXACTLY);
            for (int i = row * 2; i < Math.min(order.size(), row * 2 + 2); i++) {
                order.get(i).measure(columnSpec, exact);
            }
            height += rowHeight + (row > 0 ? gap : 0);
        }
        setMeasuredDimension(width, height);
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int top = getPaddingTop();
        for (int row = 0; row * 2 < order.size(); row++) {
            int rowHeight = 0;
            for (int column = 0; column < 2; column++) {
                int index = row * 2 + column;
                if (index >= order.size()) break;
                View child = order.get(index);
                int left = getPaddingLeft() + column * (child.getMeasuredWidth() + gap);
                child.layout(left, top, left + child.getMeasuredWidth(), top + child.getMeasuredHeight());
                rowHeight = Math.max(rowHeight, child.getMeasuredHeight());
                animateFromLastPosition(child, left, top);
            }
            top += rowHeight + gap;
        }
    }

    /** Slides a tile from where it was drawn before to its new layout position. */
    private void animateFromLastPosition(View child, int left, int top) {
        Point last = lastPositions.get(child);
        lastPositions.put(child, new Point(left, top));
        if (last == null || (last.x == left && last.y == top)) return;
        child.setTranslationX(last.x - left + child.getTranslationX());
        child.setTranslationY(last.y - top + child.getTranslationY());
        child.animate().translationX(0).translationY(0).setDuration(MOVE_ANIMATION_MS).start();
    }

    // endregion

    // region Dragging

    private void startDrag(View tile) {
        dragging = tile;
        moved = false;
        tile.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
        boolean started = tile.startDragAndDrop(null, new LiftedShadow(tile), tile, View.DRAG_FLAG_OPAQUE);
        if (!started) {
            dragging = null;
            if (listener != null) listener.onLongPress(ids.get(tile));
            return;
        }
        tile.animate().alpha(0.3f).setDuration(120).start();
    }

    private boolean onDrag(View view, DragEvent event) {
        if (dragging == null || event.getLocalState() != dragging) return false;
        switch (event.getAction()) {
            case DragEvent.ACTION_DRAG_STARTED:
                return true;
            case DragEvent.ACTION_DRAG_LOCATION:
                View target = tileAt(event.getX(), event.getY());
                if (target != null && target != dragging && ids.containsKey(target)) {
                    moveToSlotOf(target);
                }
                autoScroll(event.getY());
                return true;
            case DragEvent.ACTION_DROP:
                return true;
            case DragEvent.ACTION_DRAG_ENDED:
                View tile = dragging;
                dragging = null;
                tile.animate().alpha(1f).setDuration(120).start();
                if (listener != null) {
                    if (moved) {
                        List<String> result = new ArrayList<>();
                        for (View child : order) {
                            String id = ids.get(child);
                            if (id != null) result.add(id);
                        }
                        listener.onReordered(result);
                    } else {
                        listener.onLongPress(ids.get(tile));
                    }
                }
                return true;
            default:
                return true;
        }
    }

    /**
     * Moves the dragged tile into the slot of the target. The tiles in between shift by one,
     * like icons on a launcher home screen.
     */
    private void moveToSlotOf(View target) {
        int to = order.indexOf(target);
        order.remove(dragging);
        order.add(to, dragging);
        moved = true;
        performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
        requestLayout();
    }

    /** Tile under a point, by layout position, ignoring running slide animations. */
    private View tileAt(float x, float y) {
        for (View child : order) {
            if (x >= child.getLeft() && x < child.getRight() && y >= child.getTop() && y < child.getBottom()) {
                return child;
            }
        }
        return null;
    }

    /** Scrolls the enclosing scroll view while dragging near its top or bottom edge. */
    private void autoScroll(float y) {
        ScrollView scroll = null;
        int offset = getTop();
        ViewParent parent = getParent();
        while (parent instanceof View) {
            if (parent instanceof ScrollView) {
                scroll = (ScrollView) parent;
                break;
            }
            offset += ((View) parent).getTop();
            parent = parent.getParent();
        }
        if (scroll == null) return;
        float inViewport = offset + y - scroll.getScrollY();
        if (inViewport < edgeScroll) {
            scroll.smoothScrollBy(0, -gap * 2);
        } else if (inViewport > scroll.getHeight() - edgeScroll) {
            scroll.smoothScrollBy(0, gap * 2);
        }
    }

    // endregion

    /** Drag shadow: the tile, drawn slightly larger as if lifted. */
    private static final class LiftedShadow extends View.DragShadowBuilder {
        private static final float SCALE = 1.05f;

        LiftedShadow(View view) {
            super(view);
        }

        @Override
        public void onProvideShadowMetrics(Point size, Point touch) {
            View view = getView();
            size.set((int) (view.getWidth() * SCALE), (int) (view.getHeight() * SCALE));
            touch.set(size.x / 2, size.y / 2);
        }

        @Override
        public void onDrawShadow(Canvas canvas) {
            canvas.scale(SCALE, SCALE);
            getView().draw(canvas);
        }
    }
}
