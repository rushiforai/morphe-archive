package app.southstar21.extension.instagram.liquidglass;

import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.WeakHashMap;

/**
 * Glass treatment for the headers at the top of the feed and Explore tabs.
 * <p>
 * Each tab page has its own header ({@code main_feed_action_bar}, {@code explore_action_bar})
 * that sits above the full height list, the feed's inside a wrapper of its own. The wrapper is
 * made see-through, a top {@link EdgeBlurView} is slipped in behind it, the icon buttons get
 * glass circles and Explore's search field becomes a glass capsule.
 * <p>
 * Instagram lays its pages out below the status bar. Like iOS, the list and the blur are
 * pulled up behind the status bar (and a hole punch camera), so content scrolls all the way
 * to the top edge and the blur starts there. The header itself stays where it is.
 */
final class HeaderGlassController {
    private static final long SCAN_INTERVAL_MS = 500;
    /** iOS 26 header buttons are ~44pt glass circles. */
    private static final float BUTTON_DIAMETER_DP = 42f;

    private final View root;
    private final float density;
    private final int[] headerIds;
    private final int searchFieldId;
    private final int searchEditTextId;
    private final int leftButtonsId;
    private final int rightButtonsId;
    private final int dividerId;

    private final WeakHashMap<View, Header> headers = new WeakHashMap<>();
    private final int[] location = new int[2];
    private long lastScan;
    private boolean dark;

    private static final class Header {
        /** The header itself; Instagram slides it (or its wrapper) away while scrolling. */
        final View header;
        final ViewGroup wrapper;
        final EdgeBlurView blur;
        final ArrayList<View> styled = new ArrayList<>();
        /** The list scrolling under this header, found lazily. */
        WeakReference<View> scroller;
        TopShift scrollerShift;
        final Rect clip = new Rect();
        View divider;
        /** Eased 0..1: header buttons only become glass once content is scrolled under them. */
        float reveal;

        Header(View header, ViewGroup wrapper, EdgeBlurView blur) {
            this.header = header;
            this.wrapper = wrapper;
            this.blur = blur;
        }
    }

    /**
     * Moves a list's top edge up by the status bar height and pads its content back down by
     * the same amount, so it extends behind the status bar without its items moving.
     * Remembers what it applied so values Instagram sets later become the new base.
     */
    private static final class TopShift {
        final WeakReference<View> view;
        private int baseMargin, basePadding;
        private int appliedMargin = Integer.MIN_VALUE, appliedPadding = Integer.MIN_VALUE;

        TopShift(View view) {
            this.view = new WeakReference<>(view);
        }

        void apply(int inset) {
            View v = view.get();
            if (v == null || !(v.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) v.getLayoutParams();
            if (lp.topMargin != appliedMargin) baseMargin = lp.topMargin;
            if (v.getPaddingTop() != appliedPadding) basePadding = v.getPaddingTop();
            appliedMargin = baseMargin - inset;
            appliedPadding = basePadding + inset;
            if (v.getPaddingTop() != appliedPadding) {
                // The list keeps its scroll offset across the padding change: scroll back so
                // the items stay put instead of jumping under the header.
                int delta = appliedPadding - v.getPaddingTop();
                v.post(() -> v.scrollBy(0, -delta));
                v.setPadding(v.getPaddingLeft(), appliedPadding, v.getPaddingRight(), v.getPaddingBottom());
            }
            if (lp.topMargin != appliedMargin) {
                lp.topMargin = appliedMargin;
                v.setLayoutParams(lp);
            }
        }
    }

    HeaderGlassController(View root, float density) {
        this.root = root;
        this.density = density;
        Resources res = root.getResources();
        headerIds = new int[]{id(res, "main_feed_action_bar"), id(res, "explore_action_bar")};
        searchFieldId = id(res, "action_bar_search_hints_text_layout");
        searchEditTextId = id(res, "action_bar_search_edit_text");
        leftButtonsId = id(res, "action_bar_buttons_container_left");
        rightButtonsId = id(res, "action_bar_buttons_container_right");
        dividerId = id(res, "action_bar_divider");
    }

    private static int id(Resources res, String name) {
        return res.getIdentifier(name, "id", "com.instagram.android");
    }

    void setDark(boolean dark) {
        this.dark = dark;
    }

    /** Called every pre-draw: keeps installed headers in shape, looks for new ones now and then. */
    void onPreDraw() {
        long now = SystemClock.uptimeMillis();
        if (now - lastScan > SCAN_INTERVAL_MS) {
            lastScan = now;
            for (int headerId : headerIds) {
                if (headerId == 0) continue;
                View header = root.findViewById(headerId);
                if (header != null && !headers.containsKey(header)) install(header);
            }
        }
        for (Header h : headers.values()) {
            if (h != null) enforce(h);
        }
    }

    private void install(View header) {
        if (!(header.getParent() instanceof ViewGroup) || header.getHeight() == 0) return;
        ViewGroup wrapper = (ViewGroup) header.getParent();
        // The feed header has a wrapper of its own; Explore's header sits right next to the grid.
        if (wrapper.getHeight() > 2 * header.getHeight() && header instanceof ViewGroup) {
            wrapper = (ViewGroup) header;
        }
        if (!(wrapper.getParent() instanceof FrameLayout)) {
            headers.put(header, null);
            return;
        }
        FrameLayout page = (FrameLayout) wrapper.getParent();

        EdgeBlurView blur = new EdgeBlurView(header.getContext(), density, true);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, wrapper.getHeight()) + blur.extraTop, Gravity.TOP);
        page.addView(blur, page.indexOfChild(wrapper), lp);

        Header h = new Header(header, wrapper, blur);
        collectStyled(header, h);
        headers.put(header, h);
        enforce(h);
    }

    private void collectStyled(View header, Header h) {
        h.styled.add(header);
        h.divider = dividerId == 0 ? null : header.findViewById(dividerId);
        for (int containerId : new int[]{leftButtonsId, rightButtonsId}) {
            View container = containerId == 0 ? null : header.findViewById(containerId);
            if (!(container instanceof ViewGroup)) continue;
            ViewGroup group = (ViewGroup) container;
            for (int i = 0; i < group.getChildCount(); i++) {
                View button = group.getChildAt(i);
                if (button.isClickable()) {
                    setBackgroundKeepingPadding(button, GlassButtonDrawable.circle(density, BUTTON_DIAMETER_DP));
                    h.styled.add(button);
                }
            }
        }
        View field = searchFieldId == 0 ? null : header.findViewById(searchFieldId);
        if (field != null) {
            setBackgroundKeepingPadding(field, GlassButtonDrawable.capsule(density));
            h.styled.add(field);
            View edit = searchEditTextId == 0 ? null : field.findViewById(searchEditTextId);
            if (edit != null) setBackgroundKeepingPadding(edit, new ColorDrawable(Color.TRANSPARENT));
        }
    }

    private void enforce(Header h) {
        // Instagram paints the header white/black; keep it see-through so the blur shows.
        clearBackground(h.wrapper);

        int inset = statusBarInset(h.wrapper);
        if (h.scrollerShift != null) {
            h.scrollerShift.apply(inset);
            View scroller = h.scrollerShift.view.get();
            if (inset > 0 && scroller != null) {
                // The list's padding now covers the status bar: let content show there.
                if (scroller instanceof ViewGroup && ((ViewGroup) scroller).getClipToPadding()) {
                    ((ViewGroup) scroller).setClipToPadding(false);
                }
                unclipAbove(scroller);
            }
        }

        float target = isScrolled(h) ? 1f : 0f;
        h.reveal += (target - h.reveal) * 0.25f;
        if (Math.abs(target - h.reveal) < 0.01f) h.reveal = target;

        for (int i = 0; i < h.styled.size(); i++) {
            View v = h.styled.get(i);
            if (v.getBackground() instanceof GlassButtonDrawable) {
                GlassButtonDrawable glass = (GlassButtonDrawable) v.getBackground();
                glass.setDark(dark);
                // The Explore search field is always a field; the icon circles come and go.
                if (v.getId() != searchFieldId) glass.setReveal(h.reveal);
            } else if (i == 0) {
                clearBackground(v);
            }
        }

        int height = inset + h.wrapper.getHeight() + h.blur.extraTop;
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) h.blur.getLayoutParams();
        if ((h.wrapper.getHeight() > 0 && lp.height != height) || lp.topMargin != -inset) {
            if (h.wrapper.getHeight() > 0) lp.height = height;
            lp.topMargin = -inset;
            h.blur.setLayoutParams(lp);
        }
        // Follow the header when Instagram slides it away while scrolling. The status bar part
        // stays frosted, like on iOS.
        float ty = Math.max(h.wrapper.getTranslationY(), -h.wrapper.getHeight());
        clipBelowStatusBar(h, inset);
        // Instagram shows a hairline under the header once content scrolls under it. iOS has none.
        if (h.divider != null && h.divider.getAlpha() != 0f) h.divider.setAlpha(0f);
        if (h.blur.getTranslationY() != ty) h.blur.setTranslationY(ty);
        int visibility = h.wrapper.getVisibility() == View.VISIBLE && h.wrapper.isShown() ? View.VISIBLE : View.GONE;
        if (h.blur.getVisibility() != visibility) h.blur.setVisibility(visibility);
        h.blur.setDark(dark);
        if (visibility == View.VISIBLE) h.blur.invalidate();
    }

    private boolean isScrolled(Header h) {
        View scroller = h.scroller != null ? h.scroller.get() : null;
        if (scroller == null || !scroller.isAttachedToWindow()) {
            scroller = findScroller(h.wrapper);
            h.scroller = scroller != null ? new WeakReference<>(scroller) : null;
            if (h.scrollerShift != null) h.scrollerShift.apply(0);
            h.scrollerShift = scroller != null ? new TopShift(scroller) : null;
        }
        return scroller != null && scroller.canScrollVertically(-1);
    }

    /**
     * How far below the top of the window the header's page starts because of the status bar,
     * or 0 when the window itself already starts below it (no edge to edge) or it is hidden.
     */
    private int statusBarInset(View wrapper) {
        if (!(wrapper.getParent() instanceof View)) return 0;
        WindowInsets insets = root.getRootWindowInsets();
        if (insets == null) return 0;
        int top;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            top = insets.getInsets(WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout()).top;
        } else {
            top = insets.getSystemWindowInsetTop();
        }
        if (top <= 0) return 0;
        View page = (View) wrapper.getParent();
        page.getLocationInWindow(location);
        int y = Math.round(location[1] - page.getTranslationY());
        return y > 0 && y <= top + Math.round(4 * density) ? y : 0;
    }

    /**
     * The page no longer clips at the status bar, so a header sliding away would show up
     * behind it. Clip the header there instead.
     */
    private static void clipBelowStatusBar(Header h, int inset) {
        View v = h.header;
        float y = v.getTop() + v.getTranslationY();
        if (v != h.wrapper) y += h.wrapper.getTop() + h.wrapper.getTranslationY();
        int top = inset > 0 ? Math.max(0, Math.round(-y)) : 0;
        if (top == 0) {
            if (v.getClipBounds() != null) v.setClipBounds(null);
            return;
        }
        if (h.clip.top != top || h.clip.right != v.getWidth() || h.clip.bottom != v.getHeight()
                || v.getClipBounds() == null) {
            h.clip.set(0, top, v.getWidth(), v.getHeight());
            v.setClipBounds(h.clip);
        }
    }

    /** Lets {@code view} draw above its parents' bounds, up to the top of the window. */
    private void unclipAbove(View view) {
        for (android.view.ViewParent p = view.getParent(); p instanceof ViewGroup; p = p.getParent()) {
            ViewGroup g = (ViewGroup) p;
            if (g.getClipChildren()) g.setClipChildren(false);
            if (g.getClipToPadding()) g.setClipToPadding(false);
            g.getLocationInWindow(location);
            if (location[1] <= 0) break;
        }
    }

    /** The vertically scrolling list in the same page as the header, searched breadth first. */
    private static View findScroller(ViewGroup wrapper) {
        if (!(wrapper.getParent() instanceof ViewGroup)) return null;
        ViewGroup page = (ViewGroup) wrapper.getParent();
        ArrayDeque<View> queue = new ArrayDeque<>();
        for (int i = 0; i < page.getChildCount(); i++) {
            View child = page.getChildAt(i);
            if (child != wrapper && !(child instanceof EdgeBlurView)) queue.add(child);
        }
        int visited = 0;
        while (!queue.isEmpty() && visited++ < 200) {
            View v = queue.poll();
            if (v.getVisibility() != View.VISIBLE) continue;
            if (v.canScrollVertically(1) || v.canScrollVertically(-1)) return v;
            if (v instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) v;
                for (int i = 0; i < g.getChildCount(); i++) queue.add(g.getChildAt(i));
            }
        }
        return null;
    }

    private static void clearBackground(View v) {
        Drawable bg = v.getBackground();
        if (bg == null) return;
        if (bg instanceof ColorDrawable && Color.alpha(((ColorDrawable) bg).getColor()) == 0) return;
        setBackgroundKeepingPadding(v, null);
    }

    /** setBackground() resets padding to the drawable's; keep the view's layout as it was. */
    private static void setBackgroundKeepingPadding(View v, Drawable background) {
        int l = v.getPaddingLeft(), t = v.getPaddingTop(), r = v.getPaddingRight(), b = v.getPaddingBottom();
        v.setBackground(background);
        v.setPadding(l, t, r, b);
    }
}
