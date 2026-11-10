package app.xposed.extension;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.text.TextPaint;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Applies filter verdicts to the posts (rows) and quote cards around TweetHeaderViews.
 * X re-shows rows and quote cards on its own schedule, sometimes without re-binding the
 * header (QuoteView skips that when the quoted post is unchanged), so filtered rows are
 * re-checked before every frame instead of once per bind. Main thread only.
 */
final class FilterViews {
    private static final String RECYCLER_VIEW = "androidx.recyclerview.widget.RecyclerView";
    private static final String QUOTE_VIEW = "com.twitter.tweetview.core.QuoteView";

    /** A header's latest verdict and where it sits. Views are held weakly: they reference each other. */
    private static final class HeaderState {
        Filters.Action action = Filters.Action.NONE;
        String handle;
        WeakReference<View> quote, row;
    }

    private static final Map<View, HeaderState> headers = new WeakHashMap<>();
    /** The headers seen in each row: its own and its quote card's. */
    private static final Map<View, List<WeakReference<View>>> rowHeaders = new WeakHashMap<>();
    /** Rows with a filtered header, synced before every frame. */
    private static final Map<View, Boolean> active = new WeakHashMap<>();
    private static final Map<ViewTreeObserver, Boolean> observers = new WeakHashMap<>();
    private static final Map<Class<?>, Boolean> recyclerClasses = new java.util.HashMap<>();

    /** Rows we collapsed, with their original height. */
    private static final Map<View, Integer> collapsed = new WeakHashMap<>();
    private static final Map<View, Placeholder> placeholders = new WeakHashMap<>();
    /** Quote cards the reader chose to show, with the quoted handle they showed. */
    private static final Map<View, String> revealed = new WeakHashMap<>();
    private static final Map<View, Highlight> highlights = new WeakHashMap<>();

    private static boolean skippedFrame;
    private static final ViewTreeObserver.OnPreDrawListener enforcer = () -> {
        if (active.isEmpty()) return true;
        boolean hid = false;
        for (Iterator<View> it = active.keySet().iterator(); it.hasNext(); ) {
            View row = it.next();
            if (!row.isAttachedToWindow()) continue;
            hid |= sync(row);
            if (!anyFiltered(row)) it.remove();
        }
        // Skip the frame that would show a post X just re-showed, but never two in a row.
        if (hid && !skippedFrame) {
            skippedFrame = true;
            return false;
        }
        skippedFrame = false;
        return true;
    };

    private FilterViews() {
    }

    static void apply(View header, String handle, Filters.Action action) {
        HeaderState state = headers.get(header);
        // Nothing to apply or undo: the common case while scrolling past unfiltered posts.
        if (action == Filters.Action.NONE && (state == null || state.action == Filters.Action.NONE)) return;
        if (state == null) headers.put(header, state = new HeaderState());
        state.action = action;
        state.handle = handle;
        HeaderState s = state;
        if (!track(header, s) && action != Filters.Action.NONE) {
            // Not in a list yet (bound ahead of time); runs once the header is attached.
            header.post(() -> track(header, s));
        }
    }

    /** Finds the header's row and quote card, registers them and syncs the row. False if not in a list yet. */
    private static boolean track(View header, HeaderState state) {
        View row = state.row != null ? state.row.get() : null;
        if (row == null) {
            row = rowAncestor(header);
            if (row == null) return false;
            View quote = quoteAncestor(header);
            state.row = new WeakReference<>(row);
            state.quote = quote != null ? new WeakReference<>(quote) : null;
            List<WeakReference<View>> list = rowHeaders.get(row);
            if (list == null) rowHeaders.put(row, list = new ArrayList<>(2));
            list.add(new WeakReference<>(header));
        }
        if (state.action != Filters.Action.NONE) {
            active.put(row, Boolean.TRUE);
            watch(row);
        }
        sync(row);
        return true;
    }

    /** Puts the enforcer on the row's window, once. */
    private static void watch(View row) {
        if (!row.isAttachedToWindow()) return; // a detached view's observer is temporary
        ViewTreeObserver observer = row.getViewTreeObserver();
        if (observer.isAlive() && observers.put(observer, Boolean.TRUE) == null) observer.addOnPreDrawListener(enforcer);
    }

    /**
     * Brings a row and its quote card in line with its headers' verdicts. A quote card's
     * verdict decides the quote card, or the whole post when quotes affect the post. True
     * when something visible was hidden.
     */
    private static boolean sync(View row) {
        List<WeakReference<View>> list = rowHeaders.get(row);
        if (list == null) return false;
        boolean wholePost = Settings.quoteAffectsPost();
        Filters.Action rowAction = Filters.Action.NONE;
        for (WeakReference<View> ref : list) {
            HeaderState s = state(ref);
            if (s == null || s.action == Filters.Action.NONE) continue;
            View quote = s.quote != null ? s.quote.get() : null;
            // X hides the quote card of a post without a quote, leaving its header's old verdict behind.
            if (quote == null || wholePost && quote.getVisibility() == View.VISIBLE) rowAction = s.action;
        }

        boolean hid = false;
        for (WeakReference<View> ref : list) {
            HeaderState s = state(ref);
            View quote = s != null && s.quote != null ? s.quote.get() : null;
            if (quote == null) continue;
            Filters.Action action = wholePost || rowAction != Filters.Action.NONE ? Filters.Action.NONE : s.action;
            String shown = revealed.get(quote);
            if (shown != null && !shown.equals(s.handle)) revealed.remove(quote); // now showing someone else
            boolean hide = action == Filters.Action.HIDE && !s.handle.equals(revealed.get(quote));
            hid |= setPlaceholder(quote, hide ? s.handle : null);
            setHighlighted(quote, action == Filters.Action.HIGHLIGHT);
        }
        setHighlighted(row, rowAction == Filters.Action.HIGHLIGHT);
        hid |= setCollapsed(row, rowAction == Filters.Action.HIDE);
        return hid;
    }

    /** True when the header is inside a quote card covered by a placeholder, so taps go to the placeholder. */
    static boolean isCovered(View header) {
        HeaderState s = headers.get(header);
        View quote = s != null && s.quote != null ? s.quote.get() : null;
        return quote != null && placeholders.containsKey(quote);
    }

    private static boolean anyFiltered(View row) {
        List<WeakReference<View>> list = rowHeaders.get(row);
        if (list == null) return false;
        for (WeakReference<View> ref : list) {
            HeaderState s = state(ref);
            if (s != null && s.action != Filters.Action.NONE) return true;
        }
        return false;
    }

    private static HeaderState state(WeakReference<View> ref) {
        View header = ref.get();
        return header != null ? headers.get(header) : null;
    }

    /** The quote card a header belongs to, or null for a post's own header. */
    private static View quoteAncestor(View header) {
        for (ViewParent p = header.getParent(); p instanceof View; p = p.getParent()) {
            if (p.getClass().getName().equals(QUOTE_VIEW)) return (View) p;
            if (isRecyclerView(p.getParent())) return null;
        }
        return null;
    }

    /** The RecyclerView item holding the view. */
    private static View rowAncestor(View view) {
        View v = view;
        for (ViewParent p = view.getParent(); p instanceof View; p = p.getParent()) {
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

    /** True when the row was visible and is now collapsed. */
    private static boolean setCollapsed(View row, boolean collapse) {
        ViewGroup.LayoutParams lp = row.getLayoutParams();
        if (lp == null) return false;
        if (collapse) {
            if (!collapsed.containsKey(row)) collapsed.put(row, lp.height);
            boolean changed = false;
            if (lp.height != 0) {
                lp.height = 0;
                row.setLayoutParams(lp);
                changed = true;
            }
            if (row.getVisibility() != View.GONE) {
                row.setVisibility(View.GONE);
                changed = true;
            }
            return changed;
        }
        Integer original = collapsed.remove(row);
        if (original == null) return false;
        lp.height = original;
        row.setLayoutParams(lp);
        row.setVisibility(View.VISIBLE);
        return false;
    }

    /**
     * Shrinks a quote card to a "Quoted post hidden" bar covering its content, like
     * X-Posed's placeholder; tapping it shows the quote. A null handle restores the card.
     * Done on the card itself because it sits in different parent layouts. True when the
     * card was just shrunk.
     */
    @SuppressLint("ClickableViewAccessibility")
    private static boolean setPlaceholder(View quote, String handle) {
        Placeholder p = placeholders.get(quote);
        ViewGroup.LayoutParams lp = quote.getLayoutParams();
        if (handle != null && lp != null) {
            boolean added = p == null;
            if (added) {
                p = new Placeholder(quote.getContext(), lp.height);
                placeholders.put(quote, p);
                p.setBounds(0, 0, quote.getWidth(), quote.getHeight());
                quote.getOverlay().add(p);
                quote.addOnLayoutChangeListener(p);
                // Ours takes the tap before the card's own click, which would open the quoted post.
                quote.setOnTouchListener(REVEAL);
            }
            p.handle = handle;
            if (lp.height != p.height) {
                lp.height = p.height;
                quote.setLayoutParams(lp);
            }
            return added;
        }
        if (p == null) return false;
        placeholders.remove(quote);
        quote.getOverlay().remove(p);
        quote.removeOnLayoutChangeListener(p);
        quote.setOnTouchListener(null);
        if (lp != null) {
            lp.height = p.originalHeight;
            quote.setLayoutParams(lp);
        }
        return false;
    }

    @SuppressLint("ClickableViewAccessibility")
    private static final View.OnTouchListener REVEAL = (v, event) -> {
        Placeholder p = placeholders.get(v);
        if (p == null) return false;
        if (event.getActionMasked() == MotionEvent.ACTION_UP) {
            revealed.put(v, p.handle);
            View row = rowAncestor(v);
            if (row != null) sync(row);
        }
        return true;
    };

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

    /** "Quoted post hidden · Show", drawn as a card like X's quote border (12dp corners, 1dp line). */
    static final class Placeholder extends Drawable implements View.OnLayoutChangeListener {
        final int height, originalHeight;
        String handle;
        // Plain values, no Context: a map entry holding the activity would keep its views alive.
        private final int background, border, text;
        private final float radius, line, padding;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final TextPaint label = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        Placeholder(Context context, int originalHeight) {
            Ui ui = new Ui(context);
            this.originalHeight = originalHeight;
            height = ui.dp(44);
            background = ui.background;
            border = ui.divider;
            text = ui.secondary;
            radius = ui.dp(12);
            line = Math.max(1, ui.dp(1));
            padding = ui.dp(12);
            label.setTypeface(ui.regular);
            label.setTextSize(ui.dp(14));
        }

        @Override
        public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
            setBounds(0, 0, r - l, b - t);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            rect.set(b);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(background);
            canvas.drawRoundRect(rect, radius, radius, paint);
            rect.inset(line / 2, line / 2);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(line);
            paint.setColor(border);
            canvas.drawRoundRect(rect, radius, radius, paint);

            float y = b.exactCenterY() - (label.descent() + label.ascent()) / 2;
            label.setColor(text);
            canvas.drawText("Quoted post hidden", b.left + padding, y, label);
            String action = "Show";
            label.setColor(Ui.ACCENT);
            canvas.drawText(action, b.right - padding - label.measureText(action), y, label);
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
