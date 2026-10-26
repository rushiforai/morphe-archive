package app.xposed.extension;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.util.Map;
import java.util.WeakHashMap;

/**
 * Applies a filter verdict to the post (or quote card) around a TweetHeaderView. Every
 * header bind passes through here, so recycled rows are always reset. Main thread only.
 */
final class FilterViews {
    private static final String RECYCLER_VIEW = "androidx.recyclerview.widget.RecyclerView";
    private static final String QUOTE_VIEW = "com.twitter.tweetview.core.QuoteView";

    /** Rows we collapsed, with their original height. */
    private static final Map<View, Integer> collapsed = new WeakHashMap<>();
    /** Quote cards we hid. */
    private static final Map<View, Boolean> hiddenQuotes = new WeakHashMap<>();
    private static final Map<View, Highlight> highlights = new WeakHashMap<>();

    private FilterViews() {
    }

    /** Latest verdict per header, read by the deferred pass. */
    private static final Map<View, Filters.Action> verdicts = new WeakHashMap<>();

    /**
     * X resets the row's visibility and size after binding the header, so the verdict is
     * applied now (no flash for rows that keep their state) and again once the bind is done.
     */
    static void apply(View header, Filters.Action action) {
        Filters.Action previous = verdicts.put(header, action);
        // Nothing to apply or undo: the common case while scrolling past unfiltered posts.
        if (action == Filters.Action.NONE && (previous == null || previous == Filters.Action.NONE)) return;
        applyNow(header, action);
        if (action != Filters.Action.NONE || previous != null && previous != Filters.Action.NONE) {
            header.post(() -> {
                Filters.Action latest = verdicts.get(header);
                if (latest != null) applyNow(header, latest);
            });
        }
    }

    private static void applyNow(View header, Filters.Action action) {
        View[] targets = targets(header);
        if (targets == null) return;
        View quote = targets[0];
        View target = quote != null ? quote : targets[1];

        setHighlighted(target, action == Filters.Action.HIGHLIGHT);
        if (quote != null) {
            setQuoteHidden(quote, action == Filters.Action.HIDE);
        } else {
            setCollapsed(target, action == Filters.Action.HIDE);
        }
    }

    /** Each header's quote card (or null) and row; the view tree around a header doesn't change. */
    private static final Map<View, View[]> ancestry = new WeakHashMap<>();
    private static final Map<Class<?>, Boolean> recyclerClasses = new java.util.HashMap<>();

    private static View[] targets(View header) {
        View[] cached = ancestry.get(header);
        if (cached != null) return cached;
        View row = rowAncestor(header);
        if (row == null) return null; // not attached yet; look again next time
        View[] found = {quoteAncestor(header), row};
        ancestry.put(header, found);
        return found;
    }

    /** The quote card a header belongs to, or null for a post's own header. */
    private static View quoteAncestor(View header) {
        for (ViewParent p = header.getParent(); p instanceof View; p = p.getParent()) {
            if (p.getClass().getName().equals(QUOTE_VIEW)) return (View) p;
            if (isRecyclerView(p.getParent())) return null;
        }
        return null;
    }

    /** The RecyclerView item holding the header. */
    private static View rowAncestor(View header) {
        View v = header;
        for (ViewParent p = header.getParent(); p instanceof View; p = p.getParent()) {
            if (isRecyclerView(p)) return v;
            v = (View) p;
        }
        return null;
    }

    private static boolean isRecyclerView(ViewParent p) {
        if (p == null) return false;
        Boolean known = recyclerClasses.get(p.getClass());
        if (known != null) return known;
        boolean result = false;
        for (Class<?> c = p.getClass(); c != null && !result; c = c.getSuperclass()) {
            result = c.getName().equals(RECYCLER_VIEW);
        }
        recyclerClasses.put(p.getClass(), result);
        return result;
    }

    /** Enforced on every bind: X resets row and quote state when it re-binds a recycled row. */
    private static void setCollapsed(View row, boolean collapse) {
        ViewGroup.LayoutParams lp = row.getLayoutParams();
        if (lp == null) return;
        if (collapse) {
            if (!collapsed.containsKey(row)) collapsed.put(row, lp.height);
            if (lp.height != 0) {
                lp.height = 0;
                row.setLayoutParams(lp);
            }
            if (row.getVisibility() != View.GONE) row.setVisibility(View.GONE);
        } else {
            Integer original = collapsed.remove(row);
            if (original == null) return;
            lp.height = original;
            row.setLayoutParams(lp);
            row.setVisibility(View.VISIBLE);
        }
    }

    private static void setQuoteHidden(View quote, boolean hide) {
        if (hide) {
            hiddenQuotes.put(quote, Boolean.TRUE);
            if (quote.getVisibility() != View.GONE) quote.setVisibility(View.GONE);
        } else if (hiddenQuotes.remove(quote) != null) {
            quote.setVisibility(View.VISIBLE);
        }
    }

    private static void setHighlighted(View target, boolean highlight) {
        Highlight h = highlights.get(target);
        if (highlight && h == null) {
            h = new Highlight(target.getContext());
            highlights.put(target, h);
            h.setBounds(0, 0, target.getWidth(), target.getHeight());
            target.getOverlay().add(h);
            target.addOnLayoutChangeListener(h);
        } else if (!highlight && h != null) {
            highlights.remove(target);
            target.getOverlay().remove(h);
            target.removeOnLayoutChangeListener(h);
        }
    }

    /** X-Posed's highlight: a faint tint with an accent rail on the leading edge, at the chosen contrast. */
    static final class Highlight extends Drawable implements View.OnLayoutChangeListener {
        private final Paint paint = new Paint();
        private final boolean dark;
        private final float density;

        Highlight(Context context) {
            dark = new Ui(context).dark;
            density = context.getResources().getDisplayMetrics().density;
        }

        @Override
        public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
            setBounds(0, 0, r - l, b - t);
        }

        @Override
        public void draw(Canvas canvas) {
            float[] contrast = Settings.highlightContrast();
            // X-Posed's --xp-filter-surface: 6% / 4.5% of the accent, scaled by the contrast.
            int accent = dark ? 0xC3A06C : 0x906124;
            float alpha = Math.min(1, (dark ? 0.06f : 0.045f) * contrast[0]);
            Rect b = getBounds();
            paint.setColor(Math.round(alpha * 255) << 24 | accent);
            canvas.drawRect(b, paint);
            paint.setColor(0xFF000000 | accent);
            canvas.drawRect(b.left, b.top, b.left + contrast[1] * density, b.bottom, paint);
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
}
