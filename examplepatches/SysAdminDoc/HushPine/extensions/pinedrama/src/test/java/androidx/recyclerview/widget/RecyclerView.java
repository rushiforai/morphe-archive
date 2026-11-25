package androidx.recyclerview.widget;

import android.content.Context;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Stands in for PineDrama's list. The extension only finds it by this class name and calls the
 * public methods RecyclerView keeps its names for on every build, so this answers those and
 * shows a window of rows the way a scrolled list does.
 */
public class RecyclerView extends LinearLayout {
    /** The texts of every row the list has loaded so far, one array per row. */
    public final List<String[]> rows = new ArrayList<>();
    /** The last position asked for by scrollToPosition, or -1. */
    public int scrolledTo = -1;
    public int first;
    public int shown = 6;
    public int rowHeight = 100;
    /** Runs once, a moment after the last row comes into view, the way a page of more loads. */
    public Runnable onEnd;
    /** Rows that were clicked, by position. */
    public final List<Integer> clicked = new ArrayList<>();
    /** A grid whose last row isn't full goes on saying it can scroll down once it's at the end. */
    public boolean saysMoreAtTheEnd;

    public RecyclerView(Context context) {
        super(context);
        setOrientation(VERTICAL);
    }

    public void addRows(int count, String prefix) {
        int start = rows.size();
        for (int index = start; index < start + count; index++) {
            rows.add(new String[]{prefix + " " + index, "EP 1/" + (40 + index % 20)});
        }
    }

    public void scrollToPosition(int position) {
        scrolledTo = position;
        first = clamp(position);
        rebuild();
    }

    public void stopScroll() {}

    public int getChildAdapterPosition(View child) {
        Object tag = child.getTag();
        return tag instanceof Integer ? (Integer) tag : -1;
    }

    @Override public boolean canScrollVertically(int direction) {
        return direction < 0 ? first > 0 : saysMoreAtTheEnd || first + shown < rows.size();
    }

    @Override public void scrollBy(int x, int y) {
        first = clamp(first + Math.max(1, y / rowHeight));
        rebuild();
    }

    private int clamp(int position) {
        return Math.max(0, Math.min(position, Math.max(0, rows.size() - shown)));
    }

    public void rebuild() {
        removeAllViews();
        int end = Math.min(rows.size(), first + shown);
        for (int position = first; position < end; position++) {
            LinearLayout row = new LinearLayout(getContext());
            row.setOrientation(VERTICAL);
            row.setTag(position);
            final int clickedPosition = position;
            row.setOnClickListener(view -> clicked.add(clickedPosition));
            for (String text : rows.get(position)) {
                TextView label = new TextView(getContext());
                label.setText(text);
                row.addView(label);
            }
            addView(row, new LayoutParams(LayoutParams.MATCH_PARENT, rowHeight));
        }
        if (end == rows.size() && onEnd != null) {
            Runnable more = onEnd;
            onEnd = null;
            postDelayed(() -> {
                more.run();
                rebuild();
            }, 400);
        }
    }
}
