package app.hushmessenger.extension;

import android.annotation.TargetApi;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RecordingCanvas;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Translucent chat bars (#162). An iPhone's bars let the content run under them and show it blurred through the bar,
 * which is what the chat's top bar and message box do here: the messages are given the bars' room to scroll through,
 * each bar draws the messages behind it blurred, and the bar's own colour goes on top of that blur, so dark mode and a
 * custom theme still look like themselves.
 *
 * The bars are found by where they sit rather than by name: walking out from the message list, a view the list shares
 * a parent with that spans the parent's width and sits wholly above or below it is that side's bar, and the walk goes
 * on until it has both sides. Only the message list's own view grows into the bars' room. Everything else in the chat
 * keeps its place, the views around the list still cut it off at the bars' edges (so the only messages a bar shows are
 * the blurred ones it draws), and anything Messenger floats over the messages (the button back to the newest message)
 * is moved back out from under the bars. Messenger's bars are Litho views, and Litho puts its own colour back on a bar
 * whenever it mounts the bar again, so each frame a bar that lost its blur gets it back.
 *
 * Nothing is kept but what was changed, so turning the switch off puts the chat back as it was. Needs Android 12, the
 * first version with a blur that costs nothing on the CPU. Public, since the call comes from Messenger's own chat
 * fragment.
 */
public final class IosBars {
    static final String KEY = "ios_bars";
    /** How far the blur reaches, in dp. Wide enough to lose the text behind it, narrow enough to keep the colours. */
    static final int RADIUS_DP = 20;
    /** How much of the bar's own colour is kept over the blur, out of 255. */
    static final int TINT = 0xBF;
    /** A chat lays itself out constantly, so a walk waits at least this long after the last one. */
    static final long LOOK_MS = 400;
    /** Two views count as touching when their edges are this close, in pixels. */
    private static final int SLACK = 8;
    /** Of the parent's width, what a bar has to span. */
    private static final float WIDE = 0.9f;
    /** Of its parent's height, what a view floating over the messages may take before it counts as filling it. */
    private static final float TALL = 0.9f;

    /** The chat views already watched, so one view gets one listener. */
    private static final Set<View> watched = Collections.newSetFromMap(new WeakHashMap<>());
    /** What each watched chat had before its bars were changed. */
    private static final Map<View, Install> installs = new WeakHashMap<>();
    private static final Map<View, Long> lastLook = new WeakHashMap<>();
    /** The clock the walk paces itself by. Tests move it by hand. */
    static java.util.function.LongSupplier clock = android.os.SystemClock::uptimeMillis;
    /** Whether this phone can blur without the CPU. Tests answer for themselves. */
    static java.util.function.BooleanSupplier blurs = () -> Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;

    private IosBars() { }

    static void resetForTests() {
        watched.clear();
        installs.clear();
        lastLook.clear();
        clock = android.os.SystemClock::uptimeMillis;
        blurs = () -> Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
    }

    /** The chat fragment's view, on its way in. Called whether the switch is on or off. */
    public static void chatShown(Object fragment, View view) {
        try {
            if (view == null) return;
            if (watched.add(view)) {
                ViewTreeObserver.OnGlobalLayoutListener onLayout = () -> look(view, false);
                ViewTreeObserver.OnScrollChangedListener onScroll = () -> redraw(view);
                ViewTreeObserver.OnPreDrawListener onDraw = () -> {
                    upkeep(view);
                    return true;
                };
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View attached) {
                        listen(attached.getViewTreeObserver(), onLayout, onScroll, onDraw);
                        look(attached, true);
                    }

                    @Override public void onViewDetachedFromWindow(View detached) {
                        ViewTreeObserver observer = detached.getViewTreeObserver();
                        observer.removeOnGlobalLayoutListener(onLayout);
                        observer.removeOnScrollChangedListener(onScroll);
                        observer.removeOnPreDrawListener(onDraw);
                        restore(detached);
                    }
                });
                if (view.isAttachedToWindow()) listen(view.getViewTreeObserver(), onLayout, onScroll, onDraw);
            }
            if (view.isAttachedToWindow()) look(view, true);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't look over the chat's bars", error);
        }
    }

    private static void listen(ViewTreeObserver observer, ViewTreeObserver.OnGlobalLayoutListener onLayout,
                               ViewTreeObserver.OnScrollChangedListener onScroll, ViewTreeObserver.OnPreDrawListener onDraw) {
        observer.addOnGlobalLayoutListener(onLayout);
        observer.addOnScrollChangedListener(onScroll);
        observer.addOnPreDrawListener(onDraw);
    }

    /**
     * Walks [chat] for its bars and gives them the blur, or puts them back when the switch is off. [now] walks whatever
     * the clock says, which is how a chat opening and a change in settings are answered at once.
     */
    static void look(View chat, boolean now) {
        try {
            if (chat == null) return;
            if (!blurs.getAsBoolean() || !Settings.wouldUse(KEY)) {
                restore(chat);
                return;
            }
            long at = clock.getAsLong();
            Long last = lastLook.get(chat);
            if (!now && last != null && at - last < LOOK_MS && installs.containsKey(chat)) return;
            lastLook.put(chat, at);
            // A chat whose bars are already frosted keeps the ones it was given: once the list has grown into their
            // room it no longer sits below the top bar, so a second search would never find that bar again.
            Install had = installs.get(chat);
            Bars bars = had != null && had.alive() ? had.bars : barsIn(chat);
            if (bars == null) {
                restore(chat);
                return;
            }
            if (install(chat, bars)) Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't look over the chat's bars", error);
        }
    }

    /** Both bars again, as the messages behind them move. */
    private static void redraw(View chat) {
        Install had = installs.get(chat);
        if (had == null) return;
        if (had.top != null) had.top.invalidate();
        if (had.bottom != null) had.bottom.invalidate();
    }

    /**
     * Before every frame. Litho can put its own colour back on a bar, or a new button over the messages, whenever it
     * likes, so each frame a bar that lost its blur gets it back and whatever floats over the messages is moved back out
     * from under the bars. Both are a few field reads once they're done.
     */
    static void upkeep(View chat) {
        Install had = installs.get(chat);
        if (had == null || had.broken) return;
        try {
            frost(had.top, had.list);
            frost(had.bottom, had.list);
            ride(had);
        } catch (Throwable error) {
            had.broken = true;
            Settings.hookFailedPrivately(KEY, "Can't keep the chat's bars see-through", error);
        }
    }

    /**
     * The chat's message list, the bars, and how the list reaches them. [grown] is the view that grows into the bars'
     * room: the list itself, or the nearest view around it whose parent places it by its margins (the list Messenger
     * draws sits in Litho views, which place what they hold themselves). [topSide] and [bottomSide] are the views on the
     * way out from the list that each bar sits beside.
     */
    static final class Bars {
        final View list, grown, top, bottom, topSide, bottomSide;

        Bars(View list, View grown, View top, View bottom, View topSide, View bottomSide) {
            this.list = list;
            this.grown = grown;
            this.top = top;
            this.bottom = bottom;
            this.topSide = topSide;
            this.bottomSide = bottomSide;
        }

        /** Whether the list grows under the top bar: only when the grown view sits inside what the bar is beside. */
        boolean growsUp() {
            return top != null && grown != null && inside(grown, topSide);
        }

        boolean growsDown() {
            return bottom != null && grown != null && inside(grown, bottomSide);
        }
    }

    /**
     * The chat's bars, or null when the chat has neither. The walk starts at the message list and goes out: at each
     * parent, a sibling that spans the parent's width, is no taller than the list and sits wholly above or below it is
     * that side's bar. A side that's found stays found, and the walk carries on out for the other one, since Messenger
     * puts the message box right beside the messages and the top bar two levels further out.
     */
    static Bars barsIn(View chat) {
        View list = ChatJump.listIn(chat);
        if (list == null) return null;
        View grown = null, top = null, bottom = null, topSide = null, bottomSide = null;
        for (View node = list; node != null && node != chat && (top == null || bottom == null); ) {
            ViewParent parent = node.getParent();
            if (!(parent instanceof ViewGroup)) break;
            ViewGroup group = (ViewGroup) parent;
            if (grown == null && placesByMargins(group, node)) grown = node;
            Rect mine = bounds(node);
            View above = null, below = null;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child == node || !child.isShown()) continue;
                Rect at = bounds(child);
                if (at.height() <= 0 || at.height() > mine.height() || at.width() < mine.width() * WIDE) continue;
                if (at.bottom <= mine.top + SLACK && (above == null || at.bottom > bounds(above).bottom)) above = child;
                if (at.top >= mine.bottom - SLACK && (below == null || at.top < bounds(below).top)) below = child;
            }
            if (top == null && above != null) {
                top = above;
                topSide = node;
            }
            if (bottom == null && below != null) {
                bottom = below;
                bottomSide = node;
            }
            node = group;
        }
        if (top == null && bottom == null) return null;
        return new Bars(list, grown, top, bottom, topSide, bottomSide);
    }

    /** Whether [group] puts [child] where its margins say, so a negative margin lets the child reach past its edge. */
    private static boolean placesByMargins(ViewGroup group, View child) {
        if (!(child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return false;
        if (group instanceof FrameLayout || group instanceof LinearLayout || group instanceof RelativeLayout) return true;
        for (Class<?> type = group.getClass(); type != null; type = type.getSuperclass()) {
            String name = type.getName();
            if (name.equals("androidx.coordinatorlayout.widget.CoordinatorLayout") ||
                name.equals("androidx.constraintlayout.widget.ConstraintLayout")) return true;
        }
        return false;
    }

    /** Whether [view] is [outer] or sits somewhere inside it. */
    private static boolean inside(View view, View outer) {
        for (View at = view; at != null; ) {
            if (at == outer) return true;
            ViewParent parent = at.getParent();
            at = parent instanceof View ? (View) parent : null;
        }
        return false;
    }

    private static Rect bounds(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return new Rect(at[0], at[1], at[0] + view.getWidth(), at[1] + view.getHeight());
    }

    /** What a chat had before its bars were changed, so every one of them can be given back exactly. */
    private static final class Install {
        final Bars bars;
        final View grown, list, top, bottom;
        final Float topZ, bottomZ;
        final ViewOutlineProvider topOutline, bottomOutline;
        final int topMargin, bottomMargin, padTop, padBottom;
        final boolean clipped;
        /** The bars' heights when this was built, and how far the list grew under each, 0 for a bar it doesn't reach. */
        final int topHeight, bottomHeight, grewTop, grewBottom;
        /** What floats over the messages and was moved back out from under the bars: how far, and where it was left. */
        final Map<View, float[]> riders = new IdentityHashMap<>();
        boolean broken;

        Install(Bars bars) {
            this.bars = bars;
            this.grown = bars.grown;
            this.list = bars.list;
            this.top = bars.top;
            this.bottom = bars.bottom;
            this.topZ = top != null ? top.getZ() : null;
            this.bottomZ = bottom != null ? bottom.getZ() : null;
            this.topOutline = top != null ? top.getOutlineProvider() : null;
            this.bottomOutline = bottom != null ? bottom.getOutlineProvider() : null;
            ViewGroup.MarginLayoutParams margins = grown != null && grown.getLayoutParams() instanceof ViewGroup.MarginLayoutParams
                ? (ViewGroup.MarginLayoutParams) grown.getLayoutParams() : null;
            boolean grows = margins != null && list.getParent() != null;
            this.topMargin = margins != null ? margins.topMargin : 0;
            this.bottomMargin = margins != null ? margins.bottomMargin : 0;
            this.padTop = list.getPaddingTop();
            this.padBottom = list.getPaddingBottom();
            this.clipped = list instanceof ViewGroup && ((ViewGroup) list).getClipToPadding();
            this.topHeight = top != null ? top.getHeight() : 0;
            this.bottomHeight = bottom != null ? bottom.getHeight() : 0;
            this.grewTop = grows && bars.growsUp() ? topHeight : 0;
            this.grewBottom = grows && bars.growsDown() ? bottomHeight : 0;
        }

        boolean holds(Bars other) {
            return grown == other.grown && list == other.list && top == other.top && bottom == other.bottom &&
                (top == null || top.getHeight() == topHeight) && (bottom == null || bottom.getHeight() == bottomHeight);
        }

        /** Whether the views this was built on are still the chat's. A rebuilt chat gets a fresh search. */
        boolean alive() {
            return list.getParent() != null && (grown == null || grown.getParent() != null) &&
                (top == null || (top.getParent() != null && top.isShown())) &&
                (bottom == null || (bottom.getParent() != null && bottom.isShown()));
        }
    }

    /**
     * Gives the bars their blur and the list their room. False when the chat already has exactly this, which is most
     * layouts, since a chat lays itself out again for every message. A bar whose height changed is done over, so the
     * list's room always matches what the bars take.
     */
    private static boolean install(View chat, Bars bars) {
        Install had = installs.get(chat);
        if (had != null && had.holds(bars)) return false;
        if (had != null) restore(chat);
        Install install = new Install(bars);
        installs.put(chat, install);
        frost(bars.top, bars.list);
        frost(bars.bottom, bars.list);
        // Both bars draw over the messages that now run under them, and neither takes a shadow for being raised.
        raise(bars.top);
        raise(bars.bottom);
        if (install.grewTop > 0 || install.grewBottom > 0) {
            ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) bars.grown.getLayoutParams();
            margins.topMargin -= install.grewTop;
            margins.bottomMargin -= install.grewBottom;
            bars.list.setPadding(bars.list.getPaddingLeft(), install.padTop + install.grewTop,
                bars.list.getPaddingRight(), install.padBottom + install.grewBottom);
            if (bars.list instanceof ViewGroup) ((ViewGroup) bars.list).setClipToPadding(false);
            bars.grown.setLayoutParams(margins);
        }
        upkeep(chat);
        return true;
    }

    /**
     * [bar] draws the messages behind it blurred, with a see-through copy of its own colour over the blur. A bar that's
     * already frosted is left as it is, so this is also how a bar Litho gave its colour back to gets its blur again.
     */
    private static void frost(View bar, View list) {
        // The blur's render node needs Android 12; blurs says the same, but a test can swap blurs out.
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || bar == null || bar.getBackground() instanceof Frost) return;
        Drawable own = bar.getBackground();
        Drawable backdrop = new Backdrop(list, bar, bar.getResources().getDisplayMetrics().density * RADIUS_DP);
        bar.setBackground(new Frost(backdrop, own, faded(own, bar)));
    }

    /**
     * [own] at the bar's see-through, as a copy, so the drawable Litho holds is never changed. One that can't be copied
     * is drawn through a see-through layer instead.
     */
    private static Drawable faded(Drawable own, View bar) {
        if (own == null) return null;
        Drawable.ConstantState state = own.getConstantState();
        Drawable copy = state != null ? state.newDrawable(bar.getResources()) : null;
        if (copy == null) return new Faded(own);
        copy = copy.mutate();
        copy.setAlpha(TINT);
        return copy;
    }

    /** A frosted bar's background: the blur, and the bar's colour over it. [own] is what the bar had, to give back. */
    static final class Frost extends LayerDrawable {
        final Drawable own;

        Frost(Drawable backdrop, Drawable own, Drawable faded) {
            super(faded == null ? new Drawable[] {backdrop} : new Drawable[] {backdrop, faded});
            this.own = own;
        }
    }

    /** A drawable with no copy to make, drawn see-through as it is. */
    static final class Faded extends Drawable {
        final Drawable own;

        Faded(Drawable own) {
            this.own = own;
        }

        @Override public void draw(Canvas canvas) {
            Rect at = getBounds();
            int saved = canvas.saveLayerAlpha(at.left, at.top, at.right, at.bottom, TINT);
            own.setBounds(at);
            own.draw(canvas);
            canvas.restoreToCount(saved);
        }

        @Override public void setAlpha(int alpha) { }

        @Override public void setColorFilter(android.graphics.ColorFilter filter) { }

        @Override public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * Whatever floats over the messages inside the grown view (Messenger's button back to the newest message, a strip
     * along the bottom) moved with it, so a bottom one would now sit under the message box. Each is moved back by
     * what the list grew on its side: the lower half down by the bottom bar, the upper half up by the top bar. Anything
     * that fills its parent grew with it and is left alone. Litho can move one itself, so each frame checks one is
     * still where it was left and moves it from wherever Litho put it.
     */
    private static void ride(Install install) {
        if (install.grown == null || install.grown == install.list) return;
        Set<View> seen = Collections.newSetFromMap(new IdentityHashMap<>());
        for (View node = install.list; node != install.grown; ) {
            ViewParent parent = node.getParent();
            if (!(parent instanceof ViewGroup)) break;
            ViewGroup group = (ViewGroup) parent;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child == node || child == install.top || child == install.bottom) continue;
                float shift = shiftFor(install, group, child);
                if (shift == 0f) continue;
                seen.add(child);
                float[] had = install.riders.get(child);
                if (had != null && had[0] == shift && had[1] == child.getTranslationY()) continue;
                float base = had != null && had[1] == child.getTranslationY() ? child.getTranslationY() - had[0] : child.getTranslationY();
                child.setTranslationY(base + shift);
                install.riders.put(child, new float[] {shift, child.getTranslationY()});
            }
            node = group;
        }
        // One that left the list's views goes back to where it was, since Litho hands its views on to other screens.
        for (Iterator<Map.Entry<View, float[]>> it = install.riders.entrySet().iterator(); it.hasNext(); ) {
            Map.Entry<View, float[]> entry = it.next();
            if (seen.contains(entry.getKey())) continue;
            unride(entry.getKey(), entry.getValue());
            it.remove();
        }
    }

    private static float shiftFor(Install install, ViewGroup group, View child) {
        if (group.getHeight() <= 0 || child.getHeight() >= group.getHeight() * TALL) return 0f;
        boolean low = (child.getTop() + child.getBottom()) / 2f > group.getHeight() / 2f;
        return low ? -install.grewBottom : install.grewTop;
    }

    private static void unride(View rider, float[] had) {
        if (rider.getTranslationY() == had[1]) rider.setTranslationY(had[1] - had[0]);
    }

    /** A raised bar would cast a shadow onto the messages under it, and no outline means no shadow. */
    private static void raise(View bar) {
        if (bar == null) return;
        bar.setOutlineProvider(null);
        bar.setZ(bar.getZ() + 1f);
    }

    /** Puts [chat]'s bars and list back exactly as they were, for the ones this control changed. */
    static void restore(View chat) {
        Install had = installs.remove(chat);
        if (had == null) return;
        give(had.top, had.topZ, had.topOutline);
        give(had.bottom, had.bottomZ, had.bottomOutline);
        for (Map.Entry<View, float[]> entry : had.riders.entrySet()) unride(entry.getKey(), entry.getValue());
        if (had.grewTop == 0 && had.grewBottom == 0) return;
        had.list.setPadding(had.list.getPaddingLeft(), had.padTop, had.list.getPaddingRight(), had.padBottom);
        if (had.list instanceof ViewGroup) ((ViewGroup) had.list).setClipToPadding(had.clipped);
        ViewGroup.LayoutParams params = had.grown.getLayoutParams();
        if (!(params instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) params;
        margins.topMargin = had.topMargin;
        margins.bottomMargin = had.bottomMargin;
        had.grown.setLayoutParams(params);
    }

    /** A bar still frosted gets back the colour it had last. One Litho has given its own colour since is already back. */
    private static void give(View bar, Float z, ViewOutlineProvider outline) {
        if (bar == null) return;
        Drawable now = bar.getBackground();
        if (now instanceof Frost) bar.setBackground(((Frost) now).own);
        bar.setOutlineProvider(outline);
        if (z != null) bar.setZ(z);
    }

    /**
     * The messages behind a bar, blurred. Each draw records the list's own drawing into a render node moved into the
     * bar's corner, hands the node the blur and draws it, so the blur is the GPU's work and the messages behind the
     * bar are the ones on screen. The list is no parent of the bar, so nothing draws itself here.
     */
    @TargetApi(Build.VERSION_CODES.S)
    static final class Backdrop extends Drawable {
        private final WeakReference<View> source, holder;
        private final RenderNode node = new RenderNode("hush-ios-bar");
        private final float radius;

        Backdrop(View source, View holder, float radius) {
            this.source = new WeakReference<>(source);
            this.holder = new WeakReference<>(holder);
            this.radius = radius;
        }

        @Override public void draw(Canvas canvas) {
            View list = source.get(), bar = holder.get();
            Rect at = getBounds();
            if (list == null || bar == null || at.isEmpty() || !(canvas instanceof RecordingCanvas)) return;
            if (list.getWidth() <= 0 || list.getHeight() <= 0) return;
            try {
                node.setPosition(0, 0, at.width(), at.height());
                RecordingCanvas into = node.beginRecording();
                try {
                    int[] mine = new int[2], theirs = new int[2];
                    bar.getLocationOnScreen(mine);
                    list.getLocationOnScreen(theirs);
                    into.translate(theirs[0] - mine[0] - at.left, theirs[1] - mine[1] - at.top);
                    list.draw(into);
                } finally {
                    node.endRecording();
                }
                node.setRenderEffect(RenderEffect.createBlurEffect(radius, radius, Shader.TileMode.CLAMP));
                canvas.save();
                canvas.translate(at.left, at.top);
                ((RecordingCanvas) canvas).drawRenderNode(node);
                canvas.restore();
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't blur behind the chat's bar", error);
            }
        }

        @Override public void setAlpha(int alpha) { }

        @Override public void setColorFilter(android.graphics.ColorFilter filter) { }

        @Override public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }
}
