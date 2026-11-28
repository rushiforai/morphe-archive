package app.southstar21.extension.instagram.liquidglass;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * The top counterpart of the blur behind the tab bar: content scrolling under the Home and
 * Explore headers is progressively blurred and faded towards the top of the screen.
 * <p>
 * Both pages lay their list out full height with the header floating over it. The header is made
 * see-through and a top {@link EdgeBlurView} is slipped in between it and the list. Instagram
 * starts its pages below the status bar; like iOS, the list and the blur are pulled up behind the
 * status bar (and a hole punch camera), so content scrolls all the way to the top edge and the
 * blur starts there. The header itself stays where it is.
 * <p>
 * Every size is measured from the live views and window insets each frame, so any font size,
 * display size, font or cutout works without constants.
 */
final class HeaderBlurController {
    private static final long SCAN_INTERVAL_MS = 500;
    /** After a full screen page closes, look for the header every frame for this long. */
    private static final long EAGER_SCAN_MS = 600;
    /** How far from the top of the feed the circles fade in. */
    private static final float REVEAL_RANGE_DP = 32f;
    /** How far the glass circles stay from the screen's sides. */
    private static final int EDGE_MARGIN_DP = 10;
    /** Bounded walk when looking for a header's list. */
    private static final int MAX_SCROLLER_SEARCH = 300;

    private final View root;
    private final float density;
    private final int[] headerIds;
    private final int dividerId;
    private final boolean glassButtons;
    /** Containers of the feed header's icon buttons, and Explore's buttons and search field. */
    private final int[] buttonContainerIds;
    private final int[] buttonIds;
    private final int searchFieldId;
    /** The stories tray Instagram drops in under the feed's header over a scrolled feed. */
    private final int storiesTrayId;
    /** The feed header's "For you" title and its chevron. */
    private final int titleTextId, titleChevronId;
    /** The stories row at the top of the feed. */
    private final int storiesRowId;
    /** Keyed by the header view; null values mark headers that can't be handled. */
    private final WeakHashMap<View, Header> headers = new WeakHashMap<>();
    private final ArrayList<View> found = new ArrayList<>();
    /** What was shifted, by list; only weakly holds its views. */
    private static final WeakHashMap<View, TopShift> shifts = new WeakHashMap<>();
    private final int[] location = new int[2];
    private long lastScan;
    private long scanEveryFrameUntil;
    /** This frame changed a size, margin or padding (a stale frame would show the old layout). */
    private boolean relaidOut;

    private static final class Header {
        /** Instagram's header view, and the view it slides away while scrolling. */
        final View header;
        final View wrapper;
        final FrameLayout page;
        final EdgeBlurView blur;
        final SurfaceSnapshots snapshots;
        final RectF snapshotRegion = new RectF();
        final Rect clip = new Rect();
        /** Instagram's hairline under the header, or null. */
        final View divider;
        WeakReference<View> scroller;
        TopShift shift;
        /** The icon buttons wearing glass circles, found again now and then. */
        final ArrayList<View> buttons = new ArrayList<>();
        final ArrayList<GlassButtonDrawable> glass = new ArrayList<>();
        final HeaderGlass group;
        /** The color behind the content, for the glass' backdrop. */
        int base;
        long stepAt;
        long buttonsFoundAt;
        /** Scroll speed tracking: a list item and where it was last frame. */
        float reveal;
        /** The header row's fill while the stories tray hangs below it (see trayColor). */
        final ColorDrawable solid = new ColorDrawable();
        /** The white we give the title and its chevron. */
        final ColorStateList titleWhite = ColorStateList.valueOf(Color.WHITE);
        final PorterDuffColorFilter chevronWhite = new PorterDuffColorFilter(Color.WHITE, PorterDuff.Mode.SRC_IN);
        /** Instagram's own title colors, for the top of the feed. */
        ColorStateList titleOwn;
        android.graphics.ColorFilter chevronOwn;

        Header(View header, View wrapper, FrameLayout page, EdgeBlurView blur, int dividerId, float density) {
            this.header = header;
            this.divider = dividerId == 0 ? null : wrapper.findViewById(dividerId);
            this.wrapper = wrapper;
            this.page = page;
            this.blur = blur;
            // Videos the blur can't record are found among the siblings below the header.
            this.snapshots = new SurfaceSnapshots(wrapper);
            blur.setSnapshots(snapshots);
            this.group = new HeaderGlass(density, this::drawBackdrop, glass);
        }

        /** What the glass circles refract: the page below the blur, in page coordinates. */
        void drawBackdrop(Canvas rc) {
            int index = page.indexOfChild(blur);
            for (int i = 0; i < index; i++) {
                View child = page.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE || child.getAlpha() == 0f) continue;
                if (child instanceof EdgeBlurView) continue;
                int save = rc.save();
                rc.translate(child.getLeft() + child.getTranslationX(), child.getTop() + child.getTranslationY());
                child.draw(rc);
                rc.restoreToCount(save);
            }
            // Videos are holes in the recording: copies where those work, then the base color.
            snapshots.draw(rc);
            snapshots.drawBase(rc, base);
        }
    }

    /**
     * Moves the page's list container's top edge up by the status bar height and pads the list
     * inside it back down by the same amount, so the list reaches behind the status bar without
     * its items moving. (Instagram wraps its lists in sticky header and pull to refresh layouts,
     * which pass the padding on instead of scrolling under it, hence the two views.) Values
     * Instagram sets later become the new base.
     */
    private static final class TopShift {
        final WeakReference<View> container, list;
        private int baseMargin, basePadding;
        private int appliedMargin = Integer.MIN_VALUE, appliedPadding = Integer.MIN_VALUE;

        TopShift(View container, View list) {
            this.container = new WeakReference<>(container);
            this.list = new WeakReference<>(list);
        }

        /** @return whether the layout changed */
        boolean apply(int inset) {
            View c = container.get();
            View l = list.get();
            if (c == null || l == null || !(c.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return false;
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) c.getLayoutParams();
            if (lp.topMargin != appliedMargin) baseMargin = lp.topMargin;
            if (l.getPaddingTop() != appliedPadding) basePadding = l.getPaddingTop();
            int margin = baseMargin - inset;
            int padding = basePadding + inset;
            appliedMargin = margin;
            appliedPadding = padding;
            if (l.getPaddingTop() == padding && lp.topMargin == margin) return false;
            // Depending on timing a list keeps its items' old coordinates across the change, which
            // moves them by up to the inset. Note where the first item is on screen and scroll it
            // back there once the list has been laid out again.
            View anchor = l instanceof ViewGroup && ((ViewGroup) l).getChildCount() > 0
                    ? ((ViewGroup) l).getChildAt(0) : null;
            if (anchor != null) keepInPlace(l, anchor);
            if (l.getPaddingTop() != padding) {
                l.setPadding(l.getPaddingLeft(), padding, l.getPaddingRight(), l.getPaddingBottom());
            }
            if (lp.topMargin != margin) {
                lp.topMargin = margin;
                c.setLayoutParams(lp);
            }
            return true;
        }

        private static void keepInPlace(View list, View anchor) {
            int[] at = new int[2];
            anchor.getLocationInWindow(at);
            final int before = at[1];
            list.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override
                public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
                    v.removeOnLayoutChangeListener(this);
                    // Scroll after this layout pass has finished positioning the items.
                    v.post(() -> {
                        if (anchor.getParent() != v || !v.isAttachedToWindow()) return;
                        int[] now = new int[2];
                        anchor.getLocationInWindow(now);
                        int drift = now[1] - before;
                        if (drift != 0) v.scrollBy(0, drift);
                    });
                }
            });
        }
    }

    HeaderBlurController(View root, float density, boolean glassButtons) {
        this.root = root;
        this.density = density;
        Resources res = root.getResources();
        headerIds = new int[]{id(res, "main_feed_action_bar"), id(res, "explore_action_bar")};
        dividerId = id(res, "action_bar_divider");
        this.glassButtons = glassButtons;
        buttonContainerIds = new int[]{id(res, "action_bar_buttons_container_left"),
                id(res, "action_bar_buttons_container_right")};
        buttonIds = new int[]{id(res, "explore_action_bar_secondary_button_stub"),
                id(res, "explore_action_bar_right_button_stub")};
        searchFieldId = id(res, "action_bar_search_hints_text_layout");
        storiesTrayId = id(res, "overlay_stories_tray_container");
        titleTextId = id(res, "title_text");
        titleChevronId = id(res, "title_chevron");
        storiesRowId = id(res, "reels_tray_container");
    }

    private static int id(Resources res, String name) {
        return res.getIdentifier(name, "id", "com.instagram.android");
    }

    /**
     * A full screen page (a reel opened from the feed) is closing: Home or Explore comes back,
     * possibly with a new header. Find it on the first frame it shows instead of up to a scan
     * interval later, when the frosted header would pop in.
     */
    void rescanSoon() {
        scanEveryFrameUntil = SystemClock.uptimeMillis() + EAGER_SCAN_MS;
    }

    /**
     * Once a frame: picks up new headers now and then, and keeps the installed ones in shape.
     *
     * @return whether the layout changed, so the frame about to be drawn is stale
     */
    boolean onPreDraw(boolean dark) {
        relaidOut = false;
        long now = SystemClock.uptimeMillis();
        if (now - lastScan > SCAN_INTERVAL_MS || now < scanEveryFrameUntil) {
            lastScan = now;
            found.clear();
            collectHeaders(root);
            for (int i = 0; i < found.size(); i++) {
                View header = found.get(i);
                if (!headers.containsKey(header)) install(header);
            }
            found.clear();
        }
        Iterator<Map.Entry<View, Header>> it = headers.entrySet().iterator();
        while (it.hasNext()) {
            Header h = it.next().getValue();
            if (h == null) continue;
            if (!h.page.isAttachedToWindow()) {
                // Gone with its fragment: let it go (it holds the views). If the page comes back,
                // the next scan installs it again.
                h.page.removeView(h.blur);
                it.remove();
                continue;
            }
            enforce(h, dark);
        }
        return relaidOut;
    }

    private void collectHeaders(View view) {
        if (view.getVisibility() == View.GONE) return;
        int viewId = view.getId();
        if (viewId != View.NO_ID) {
            for (int headerId : headerIds) {
                if (headerId != 0 && viewId == headerId) {
                    found.add(view);
                    return;
                }
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collectHeaders(group.getChildAt(i));
        }
    }

    private void install(View header) {
        // Wait until it's laid out: the wrapper is told apart by size.
        if (!(header.getParent() instanceof ViewGroup) || header.getHeight() == 0) return;
        View wrapper = header;
        ViewGroup parent = (ViewGroup) header.getParent();
        // The feed's header sits in a wrapper of its own the size of the header; Explore's is
        // right next to the grid.
        if (parent.getHeight() <= header.getHeight() * 2 && parent.getParent() instanceof FrameLayout) {
            wrapper = parent;
        }
        if (!(wrapper.getParent() instanceof FrameLayout)) {
            headers.put(header, null);
            return;
        }
        FrameLayout page = (FrameLayout) wrapper.getParent();
        for (int i = page.getChildCount() - 1; i >= 0; i--) {
            View child = page.getChildAt(i);
            if (child instanceof EdgeBlurView && ((EdgeBlurView) child).isAtTop()) page.removeView(child);
        }
        EdgeBlurView blur = new EdgeBlurView(header.getContext(), density, true);
        page.addView(blur, page.indexOfChild(wrapper), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 1, Gravity.TOP));
        relaidOut = true;
        headers.put(header, new Header(header, wrapper, page, blur, dividerId, density));
    }

    private void enforce(Header h, boolean dark) {
        View wrapper = h.wrapper;
        // Instagram may move the header to another page or drop it: undo nothing, just hide.
        if (wrapper.getParent() != h.page || h.blur.getParent() != h.page || !h.page.isAttachedToWindow()) {
            if (h.blur.getVisibility() != View.GONE) h.blur.setVisibility(View.GONE);
            return;
        }
        // Keep the blur right under the header if Instagram reorders the page.
        if (h.page.indexOfChild(h.blur) > h.page.indexOfChild(wrapper)) {
            h.page.removeView(h.blur);
            h.page.addView(h.blur, h.page.indexOfChild(wrapper));
        }

        // Instagram paints the header white/black; keep it see-through so the blur shows. Not
        // while its stories tray hangs below the header, though: the tray is a solid panel, and
        // a see-through header above it showed the feed scrolled behind it as a smeared band.
        int tray = trayColor(h, dark);
        clearBackground(wrapper);
        if (tray != 0) {
            h.solid.setColor(tray);
            if (h.header.getBackground() != h.solid) setBackgroundKeepingPadding(h.header, h.solid);
        } else if (h.header != wrapper) {
            clearBackground(h.header);
        }

        // Instagram shows a hairline under the header once content scrolls under it. iOS has none.
        if (h.divider != null && h.divider.getAlpha() != 0f) h.divider.setAlpha(0f);
        if (glassButtons) enforceButtons(h, dark);

        int inset = statusBarInset(h.page);
        View scroller = scroller(h);
        enforceTitle(h, scroller, tray != 0);
        if (h.shift != null && h.shift.apply(inset)) relaidOut = true;
        if (scroller != null && inset > 0) {
            // The list's padding now covers the status bar: let content show there.
            if (scroller instanceof ViewGroup && ((ViewGroup) scroller).getClipToPadding()) {
                ((ViewGroup) scroller).setClipToPadding(false);
            }
            unclipAbove(scroller, h.page);
        }

        // The blur covers the status bar and the camera cutout, and fades out just below them.
        // The header row sits over the content itself (its buttons have their glass circles).
        int height = inset + cameraBottom(h.page) + h.blur.extraTop;
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) h.blur.getLayoutParams();
        if ((wrapper.getHeight() > 0 && lp.height != height) || lp.topMargin != -inset) {
            if (wrapper.getHeight() > 0) lp.height = height;
            lp.topMargin = -inset;
            lp.gravity = Gravity.TOP;
            h.blur.setLayoutParams(lp);
            relaidOut = true;
        }

        h.blur.setExtent(-1);
        if (h.blur.getTranslationY() != 0f) h.blur.setTranslationY(0f);
        clipHeader(h, inset);

        // Like iOS, there's no edge effect at the top of the list: nothing is under the header
        // yet, and the tail would soften the stories. It comes in over the first stretch of
        // scrolling, following the finger.
        float strength = tray != 0 ? 1f : scrolledFraction(scroller, h.blur.extraTop);
        if (h.blur.getAlpha() != strength) h.blur.setAlpha(strength);

        boolean shown = h.page.isShown() && wrapper.getHeight() > 0 && onScreen(h.page) && strength > 0f;
        int visibility = shown ? View.VISIBLE : View.GONE;
        if (h.blur.getVisibility() != visibility) h.blur.setVisibility(visibility);
        if (!shown) return;
        h.blur.setDark(dark);
        h.blur.setSolid(tray);
        if (tray != 0) return;
        h.blur.setBackgroundColorBehind(colorBehind(h.page, dark));
        h.snapshotRegion.set(0, -inset, h.page.getWidth(), -inset + height);
        h.snapshots.update(h.snapshotRegion);
        h.blur.invalidate();
    }

    /**
     * iOS 26 puts each header icon on a glass circle. Instagram may swap a button's background
     * (its ripple) or rebuild the buttons, so they're checked every frame and looked up again now
     * and then.
     */
    private void enforceButtons(Header h, boolean dark) {
        long now = SystemClock.uptimeMillis();
        if (now - h.buttonsFoundAt > SCAN_INTERVAL_MS) {
            h.buttonsFoundAt = now;
            findButtons(h);
        }
        if (h.buttons.isEmpty()) return;
        float diameter = buttonDiameter(h);
        // Instagram's buttons run to the screen edges; iOS keeps its circles clear of them. Move
        // each side's buttons in together, so their spacing stays as it was.
        float margin = EDGE_MARGIN_DP * density;
        int width = root.getWidth();
        float leftEdge = Float.MAX_VALUE, rightEdge = -Float.MAX_VALUE;
        for (View button : h.buttons) {
            float c = restingCenterX(button);
            if (c < width / 2f) leftEdge = Math.min(leftEdge, c - diameter / 2f);
            else rightEdge = Math.max(rightEdge, c + diameter / 2f);
        }
        float leftShift = leftEdge == Float.MAX_VALUE ? 0 : Math.max(0, margin - leftEdge);
        float rightShift = rightEdge == -Float.MAX_VALUE ? 0 : Math.min(0, width - margin - rightEdge);
        for (View button : h.buttons) {
            float shift = restingCenterX(button) < width / 2f ? leftShift : rightShift;
            if (button.getTranslationX() != shift) button.setTranslationX(shift);
        }
        float reveal = updateReveal(h, now);
        boolean live = reveal > 0.01f;
        if (live) {
            // Nothing is recorded for the glass while it is hidden.
            int bg = colorBehind(h.page, dark);
            h.base = Color.alpha(bg) == 0xFF ? bg : dark ? Color.BLACK : Color.WHITE;
            h.group.beginFrame(h.page.getWidth(),
                    Math.min(h.page.getHeight(), h.wrapper.getTop() + h.wrapper.getHeight() + Math.round(24 * density)));
        }
        long nanos = System.nanoTime();
        float dt = h.stepAt == 0 ? 0f : Math.min(1f / 30f, (nanos - h.stepAt) / 1e9f);
        boolean moving = false;
        for (int i = 0; i < h.buttons.size(); i++) {
            View button = h.buttons.get(i);
            GlassButtonDrawable glass = h.glass.get(i);
            glass.setDark(dark);
            glass.setReveal(reveal);
            glass.setDiameter(diameter);
            if (button.getBackground() != glass) setBackgroundKeepingPadding(button, glass);
            // Where the circle's center is on the page, for the shared backdrop and bridging.
            float px = button.getWidth() / 2f, py = button.getHeight() / 2f;
            for (View v = button; v != h.page; ) {
                px += v.getLeft() + v.getTranslationX();
                py += v.getTop() + v.getTranslationY();
                ViewParent parent = v.getParent();
                if (!(parent instanceof View)) break;
                v = (View) parent;
            }
            glass.setPlacement(px, py);
            // A press swells the circle and, with it, the icon: the button view is scaled.
            moving |= glass.step(dt);
            float scale = glass.scaleValue();
            if (scale != glass.appliedScale) {
                glass.appliedScale = scale;
                button.setScaleX(scale);
                button.setScaleY(scale);
            }
            // The circle can be larger than the button (Explore's are small) and is nudged in
            // from the edge: nothing between the button and the header may clip it. The header
            // itself stays clipped to its bounds (clipHeader).
            for (ViewParent p = button.getParent(); p instanceof ViewGroup; p = p.getParent()) {
                ViewGroup g = (ViewGroup) p;
                if (g.getClipChildren()) g.setClipChildren(false);
                if (g.getClipToPadding()) g.setClipToPadding(false);
                if (g == h.wrapper) break;
            }
        }
        h.stepAt = moving ? nanos : 0;
        if (moving) {
            for (View button : h.buttons) button.postInvalidateOnAnimation();
        }
    }

    /**
     * The circles show whenever the feed is scrolled away from its top, and fade out only as it
     * comes back to the very top, following the finger over the last {@link #REVEAL_RANGE_DP}.
     * At the top the icons blend into the header.
     */
    private float updateReveal(Header h, long now) {
        View list = h.scroller != null ? h.scroller.get() : null;
        h.reveal = list == null ? 0f : scrolledFraction(list, Math.round(REVEAL_RANGE_DP * density));
        return h.reveal;
    }

    private void findButtons(Header h) {
        ArrayList<View> now = new ArrayList<>();
        for (int containerId : buttonContainerIds) {
            View container = containerId == 0 ? null : h.wrapper.findViewById(containerId);
            if (!(container instanceof ViewGroup)) continue;
            ViewGroup group = (ViewGroup) container;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child.getVisibility() == View.VISIBLE && child.getWidth() > 0) now.add(child);
            }
        }
        for (int buttonId : buttonIds) {
            View button = buttonId == 0 ? null : h.wrapper.findViewById(buttonId);
            if (button != null && button.getVisibility() == View.VISIBLE && button.getWidth() > 0) now.add(button);
        }
        if (now.equals(h.buttons)) return;
        // Keep the circles of buttons still there, give new ones their own.
        ArrayList<GlassButtonDrawable> glass = new ArrayList<>();
        for (View button : now) {
            int old = h.buttons.indexOf(button);
            glass.add(old >= 0 ? h.glass.get(old) : new GlassButtonDrawable(density, h.group));
        }
        h.buttons.clear();
        h.buttons.addAll(now);
        h.glass.clear();
        h.glass.addAll(glass);
    }

    /**
     * 44dp like iOS, or the height of Explore's search field so the row lines up. Never so large
     * that neighbouring circles touch or a circle leaves the header.
     */
    private float buttonDiameter(Header h) {
        float d = 44 * density;
        View field = searchFieldId == 0 ? null : h.wrapper.findViewById(searchFieldId);
        if (field != null && field.getVisibility() == View.VISIBLE && field.getHeight() > 0) d = field.getHeight();
        d = Math.min(d, h.wrapper.getHeight() - 4 * density);
        for (int i = 0; i + 1 < h.buttons.size(); i++) {
            float a = centerX(h.buttons.get(i));
            for (int j = i + 1; j < h.buttons.size(); j++) {
                float gap = Math.abs(centerX(h.buttons.get(j)) - a);
                if (gap > 0) d = Math.min(d, gap - 6 * density);
            }
        }
        return Math.max(0, d);
    }

    private float centerX(View v) {
        v.getLocationInWindow(location);
        return location[0] + v.getWidth() / 2f;
    }

    /** Where the button's center would be without our nudge. */
    private float restingCenterX(View v) {
        return centerX(v) - v.getTranslationX();
    }

    private static java.lang.reflect.Method scrollOffsetMethod;
    private static boolean scrollOffsetLookedUp;

    /** How far the list is scrolled from its top, over {@code range} px, from 0 to 1. */
    private static float scrolledFraction(View list, int range) {
        if (list == null) return 1f;
        if (!list.canScrollVertically(-1)) return 0f;
        if (range <= 0) return 1f;
        if (!scrollOffsetLookedUp) {
            scrollOffsetLookedUp = true;
            try {
                // Protected on View, public on RecyclerView; the call reaches the list's own.
                scrollOffsetMethod = View.class.getDeclaredMethod("computeVerticalScrollOffset");
                scrollOffsetMethod.setAccessible(true);
            } catch (Throwable t) {
                scrollOffsetMethod = null;
            }
        }
        if (scrollOffsetMethod == null) return 1f;
        try {
            int offset = (Integer) scrollOffsetMethod.invoke(list);
            return Math.max(0f, Math.min(1f, offset / (float) range));
        } catch (Throwable t) {
            return 1f;
        }
    }

    /** The list scrolling under the header, found again whenever Instagram replaces it. */
    private View scroller(Header h) {
        View scroller = h.scroller != null ? h.scroller.get() : null;
        if (scroller != null && scroller.isAttachedToWindow() && isInside(scroller, h.page)) return scroller;
        if (h.shift != null && h.shift.apply(0)) relaidOut = true;
        scroller = findScroller(h);
        h.scroller = scroller != null ? new WeakReference<>(scroller) : null;
        h.shift = null;
        if (scroller != null) {
            // Kept per list, so a page installed again doesn't take our own shift for Instagram's.
            View container = childOfPage(scroller, h.page);
            TopShift shift = shifts.get(scroller);
            if (shift == null || shift.container.get() != container) {
                if (shift != null && shift.apply(0)) relaidOut = true;
                shift = new TopShift(container, scroller);
                shifts.put(scroller, shift);
            }
            h.shift = shift;
        }
        return scroller;
    }

    /** The page's child holding {@code view}: the one laid out by the page, which takes margins. */
    private static View childOfPage(View view, ViewGroup page) {
        View v = view;
        while (v.getParent() != page && v.getParent() instanceof View) v = (View) v.getParent();
        return v;
    }

    /**
     * The vertically scrolling list in the header's page: the first one found breadth first,
     * then the innermost list filling it (wrappers such as the sticky header layout report the
     * list's scrolling as their own).
     */
    private static View findScroller(Header h) {
        ArrayDeque<View> queue = new ArrayDeque<>();
        for (int i = 0; i < h.page.getChildCount(); i++) {
            View child = h.page.getChildAt(i);
            if (child != h.wrapper && child != h.blur) queue.add(child);
        }
        int visited = 0;
        View found = null;
        while (!queue.isEmpty() && visited++ < MAX_SCROLLER_SEARCH) {
            View v = queue.poll();
            if (v.getVisibility() != View.VISIBLE) continue;
            if (v instanceof ViewGroup && isVerticalList(v)) {
                found = v;
                break;
            }
            if (v instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) v;
                for (int i = 0; i < g.getChildCount(); i++) queue.add(g.getChildAt(i));
            }
        }
        if (found == null) return null;
        // Descend into a list filling this one, as long as there is one.
        for (int depth = 0; depth < 8; depth++) {
            View inner = innerList((ViewGroup) found);
            if (inner == null) break;
            found = inner;
        }
        return found;
    }

    /** A list filling {@code group}, possibly inside wrappers that fill it too (pull to refresh). */
    private static View innerList(ViewGroup group) {
        return innerList(group, group.getHeight(), 0);
    }

    private static View innerList(ViewGroup group, int height, int depth) {
        if (depth > 4) return null;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE || !(child instanceof ViewGroup)) continue;
            // Only a child about as tall as the list: a list's items aren't the list.
            if (child.getHeight() < height * 3 / 4) continue;
            if (isVerticalList(child)) return child;
            View inner = innerList((ViewGroup) child, height, depth + 1);
            if (inner != null) return inner;
        }
        return null;
    }

    private static boolean isVerticalList(View v) {
        // A list that can't scroll yet (still loading) is still the list.
        String name = v.getClass().getName();
        return v.canScrollVertically(1) || v.canScrollVertically(-1)
                || name.endsWith("RecyclerView") || name.endsWith("ListView");
    }

    private static boolean isInside(View view, ViewGroup ancestor) {
        for (ViewParent p = view.getParent(); p != null; p = p.getParent()) {
            if (p == ancestor) return true;
        }
        return false;
    }

    /** Where the header's bottom edge is now in the page, after Instagram slid it (or its wrapper) away. */
    private static float visibleBottom(Header h) {
        View wrapper = h.wrapper;
        float wrapperTop = wrapper.getTop() + wrapper.getTranslationY();
        if (wrapper.getVisibility() != View.VISIBLE || wrapper.getAlpha() == 0f) return wrapperTop;
        float bottom = wrapperTop + wrapper.getHeight();
        if (h.header != wrapper) {
            float y = wrapperTop;
            for (View v = h.header; v != wrapper && v.getParent() instanceof View; v = (View) v.getParent()) {
                y += v.getTop() + v.getTranslationY();
            }
            if (h.header.getVisibility() != View.VISIBLE || h.header.getAlpha() == 0f) return wrapperTop;
            bottom = Math.min(bottom, y + h.header.getHeight());
        }
        return bottom;
    }

    /**
     * Where the status bar and camera cutout end, measured from the page's top (0 or less when
     * the page starts below them).
     */
    private int cameraBottom(View page) {
        WindowInsets insets = root.getRootWindowInsets();
        if (insets == null) return 0;
        int top;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            top = insets.getInsets(WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout()).top;
        } else {
            top = insets.getSystemWindowInsetTop();
        }
        page.getLocationInWindow(location);
        return Math.max(0, top - Math.round(location[1] - page.getTranslationY()));
    }

    /**
     * How far below the top of the window the page starts because of the status bar (or a
     * camera cutout), or 0 when the page starts elsewhere or the window already stops there.
     */
    private int statusBarInset(View page) {
        WindowInsets insets = root.getRootWindowInsets();
        if (insets == null) return 0;
        int top;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            top = insets.getInsets(WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout()).top;
        } else {
            top = insets.getSystemWindowInsetTop();
        }
        if (top <= 0) return 0;
        page.getLocationInWindow(location);
        // Ignore the page's own slide (pager animations) when measuring where it sits.
        int y = Math.round(location[1] - page.getTranslationY());
        return y > 0 && y <= top + Math.round(4 * density) ? y : 0;
    }

    /**
     * The page no longer clips at the status bar, so a header sliding away would show up over it,
     * and Explore's header paints a status bar colored band above itself. Clip the header to its
     * own bounds, and at the page's top edge while it slides away.
     */
    private static void clipHeader(Header h, int inset) {
        View v = h.wrapper;
        if (inset <= 0) {
            if (v.getClipBounds() != null) v.setClipBounds(null);
            return;
        }
        float y = v.getTop() + v.getTranslationY();
        int top = Math.min(v.getHeight(), Math.max(0, (int) Math.ceil(-y)));
        if (h.clip.top != top || h.clip.right != v.getWidth() || h.clip.bottom != v.getHeight()
                || v.getClipBounds() == null) {
            h.clip.set(0, top, v.getWidth(), v.getHeight());
            v.setClipBounds(h.clip);
        }
    }

    /**
     * The header row sits over the feed itself, where Instagram's dark "For you" all but
     * disappeared over dark photos: it's white (with a soft shadow) once posts scroll under it.
     * At the very top, over the stories row, and while the stories tray hangs below the header,
     * the background is plain, so it keeps Instagram's own color there.
     */
    private void enforceTitle(Header h, View scroller, boolean trayShown) {
        if (h.header == h.wrapper) return;
        boolean white = LiquidGlassNavBarPatch.WHITE_HEADER_TITLE.get()
                && !trayShown && !storiesUnderHeader(h, scroller);
        View title = titleTextId != 0 ? h.header.findViewById(titleTextId) : null;
        if (title instanceof TextView) {
            TextView text = (TextView) title;
            if (text.getTextColors() != h.titleWhite) h.titleOwn = text.getTextColors();
            if (white && text.getTextColors() != h.titleWhite) {
                text.setTextColor(h.titleWhite);
                text.setShadowLayer(4f * density, 0f, 0.5f * density, 0x59000000);
            } else if (!white && text.getTextColors() == h.titleWhite && h.titleOwn != null) {
                text.setTextColor(h.titleOwn);
                text.setShadowLayer(0f, 0f, 0f, 0);
            }
        }
        View view = titleChevronId != 0 ? h.header.findViewById(titleChevronId) : null;
        if (view instanceof ImageView) {
            ImageView chevron = (ImageView) view;
            if (chevron.getColorFilter() != h.chevronWhite) h.chevronOwn = chevron.getColorFilter();
            if (white && chevron.getColorFilter() != h.chevronWhite) {
                chevron.setColorFilter(h.chevronWhite);
            } else if (!white && chevron.getColorFilter() == h.chevronWhite) {
                chevron.setColorFilter(h.chevronOwn);
            }
        }
    }

    /** The feed is at its top: nothing above it, or its stories row still reaches under the header. */
    private boolean storiesUnderHeader(Header h, View scroller) {
        if (scroller == null || !scroller.canScrollVertically(-1)) return true;
        View row = storiesRowId != 0 ? scroller.findViewById(storiesRowId) : null;
        if (row == null || !row.isShown() || row.getHeight() == 0) return false;
        row.getLocationInWindow(location);
        int rowBottom = location[1] + row.getHeight();
        h.header.getLocationInWindow(location);
        return rowBottom > location[1] + h.header.getHeight();
    }

    /**
     * The color of the stories tray when it's showing below the header (it slides out from
     * behind it), else 0. The header and the status bar above then take its color, as they
     * have in Instagram.
     */
    private int trayColor(Header h, boolean dark) {
        if (storiesTrayId == 0 || h.header == h.wrapper) return 0;
        View tray = h.wrapper.findViewById(storiesTrayId);
        if (tray == null || !tray.isShown() || tray.getHeight() == 0 || tray.getAlpha() == 0f) return 0;
        tray.getLocationInWindow(location);
        int trayBottom = location[1] + tray.getHeight();
        h.header.getLocationInWindow(location);
        if (trayBottom <= location[1] + h.header.getHeight() + Math.round(density)) return 0;
        for (View v = tray; v != h.wrapper && v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
            if (v.getBackground() instanceof ColorDrawable) {
                int color = ((ColorDrawable) v.getBackground()).getColor();
                if (Color.alpha(color) == 0xFF) return color;
            }
        }
        int behind = colorBehind(h.page, dark);
        return behind != 0 ? behind : dark ? Color.BLACK : Color.WHITE;
    }

    /**
     * The opaque color that shows behind the page where its content is see-through: the first
     * solid background among its ancestors, else the window's. Only trusted when it matches the
     * theme (0 otherwise, for plain black or white).
     */
    private static int colorBehind(View page, boolean dark) {
        for (View v = page; v != null; v = v.getParent() instanceof View ? (View) v.getParent() : null) {
            Drawable bg = v.getBackground();
            if (bg instanceof ColorDrawable) {
                int color = ((ColorDrawable) bg).getColor();
                if (Color.alpha(color) == 0xFF) return matchesTheme(color, dark) ? color : 0;
            }
        }
        android.view.Window window = BackdropSampler.windowOf(page.getContext());
        Drawable bg = window != null ? window.getDecorView().getBackground() : null;
        if (bg instanceof ColorDrawable) {
            int color = ((ColorDrawable) bg).getColor();
            if (Color.alpha(color) == 0xFF && matchesTheme(color, dark)) return color;
        }
        return 0;
    }

    private static boolean matchesTheme(int color, boolean dark) {
        float l = (0.2126f * Color.red(color) + 0.7152f * Color.green(color) + 0.0722f * Color.blue(color)) / 255f;
        return dark ? l < 0.25f : l > 0.75f;
    }

    /** Off to the side in a pager: nothing to blur. */
    private boolean onScreen(View page) {
        page.getLocationInWindow(location);
        int width = root.getWidth();
        return location[0] + page.getWidth() > 0 && location[0] < width;
    }

    /**
     * Lets {@code view} draw above its parents' bounds, up to the top of the window. The views
     * inside the page were moved up themselves, so only an ancestor of the page that starts at
     * the window's top ends the walk.
     */
    private void unclipAbove(View view, ViewGroup page) {
        boolean pastPage = false;
        for (ViewParent p = view.getParent(); p instanceof ViewGroup; p = p.getParent()) {
            ViewGroup g = (ViewGroup) p;
            if (g.getClipChildren()) g.setClipChildren(false);
            if (g.getClipToPadding()) g.setClipToPadding(false);
            if (g == page) pastPage = true;
            if (!pastPage) continue;
            g.getLocationInWindow(location);
            if (location[1] - g.getTranslationY() <= 0) break;
        }
    }

    private static void clearBackground(View v) {
        Drawable bg = v.getBackground();
        if (bg == null) return;
        if (bg instanceof ColorDrawable && Color.alpha(((ColorDrawable) bg).getColor()) == 0) return;
        setBackgroundKeepingPadding(v, null);
    }

    /** setBackground() resets the padding to the drawable's; keep the view's layout. */
    private static void setBackgroundKeepingPadding(View v, Drawable background) {
        int l = v.getPaddingLeft(), t = v.getPaddingTop(), r = v.getPaddingRight(), b = v.getPaddingBottom();
        v.setBackground(background);
        v.setPadding(l, t, r, b);
    }
}
