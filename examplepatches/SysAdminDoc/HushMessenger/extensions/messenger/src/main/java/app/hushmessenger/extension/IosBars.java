package app.hushmessenger.extension;

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
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Translucent chat bars (#162). An iPhone's bars let the content run under them and show it blurred through the bar,
 * which is what the chat's top bar and message box do here: the messages are given the bars' room to scroll through,
 * each bar draws the messages behind it blurred, and the bar's own colour goes on top of that blur, so dark mode and a
 * custom theme still look like themselves.
 *
 * The bars are found by where they sit rather than by name: walking out from the message list, the first view the list
 * shares a parent with that spans the parent's width and sits wholly above or below it is that bar. Nothing is kept
 * but what was changed, so turning the switch off puts the chat back as it was. Needs Android 12, the first version
 * with a blur that costs nothing on the CPU. Public, since the call comes from Messenger's own chat fragment.
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
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View attached) {
                        attached.getViewTreeObserver().addOnGlobalLayoutListener(onLayout);
                        attached.getViewTreeObserver().addOnScrollChangedListener(onScroll);
                        look(attached, true);
                    }

                    @Override public void onViewDetachedFromWindow(View detached) {
                        detached.getViewTreeObserver().removeOnGlobalLayoutListener(onLayout);
                        detached.getViewTreeObserver().removeOnScrollChangedListener(onScroll);
                        restore(detached);
                    }
                });
                if (view.isAttachedToWindow()) {
                    view.getViewTreeObserver().addOnGlobalLayoutListener(onLayout);
                    view.getViewTreeObserver().addOnScrollChangedListener(onScroll);
                }
            }
            if (view.isAttachedToWindow()) look(view, true);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't look over the chat's bars", error);
        }
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

    /** The chat's message list, the view it sits in among the bars, and the bars themselves. */
    static final class Bars {
        final View list, grown, top, bottom;

        Bars(View list, View grown, View top, View bottom) {
            this.list = list;
            this.grown = grown;
            this.top = top;
            this.bottom = bottom;
        }
    }

    /**
     * The chat's bars, or null when the chat has neither. The walk starts at the message list and goes out: at each
     * parent, a sibling that spans the parent's width, is no taller than the list and sits wholly above or below it is
     * that side's bar. The view the bars share a parent with is the one that grows into their room.
     */
    static Bars barsIn(View chat) {
        View list = ChatJump.listIn(chat);
        if (list == null) return null;
        for (View node = list; node != null && node != chat; ) {
            ViewParent parent = node.getParent();
            if (!(parent instanceof ViewGroup)) return null;
            ViewGroup group = (ViewGroup) parent;
            Rect mine = bounds(node);
            View top = null, bottom = null;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child == node || !child.isShown()) continue;
                Rect at = bounds(child);
                if (at.height() <= 0 || at.height() > mine.height() || at.width() < mine.width() * WIDE) continue;
                if (at.bottom <= mine.top + SLACK && (top == null || at.bottom > bounds(top).bottom)) top = child;
                if (at.top >= mine.bottom - SLACK && (bottom == null || at.top < bounds(bottom).top)) bottom = child;
            }
            if (top != null || bottom != null) return new Bars(list, node, top, bottom);
            node = group;
        }
        return null;
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
        final Drawable topBackground, bottomBackground;
        final Float topZ, bottomZ;
        final ViewOutlineProvider topOutline, bottomOutline;
        final int topMargin, bottomMargin, padTop, padBottom;
        final boolean clipped, grew;
        final int grewTop, grewBottom;

        Install(Bars bars, Float topZ, ViewOutlineProvider topOutline, Float bottomZ, ViewOutlineProvider bottomOutline,
                int topMargin, int bottomMargin, int padTop, int padBottom, boolean clipped, boolean grew) {
            this.bars = bars;
            this.grown = bars.grown;
            this.list = bars.list;
            this.top = bars.top;
            this.bottom = bars.bottom;
            this.topBackground = bars.top != null ? bars.top.getBackground() : null;
            this.bottomBackground = bars.bottom != null ? bars.bottom.getBackground() : null;
            this.topZ = topZ;
            this.bottomZ = bottomZ;
            this.topOutline = topOutline;
            this.bottomOutline = bottomOutline;
            this.topMargin = topMargin;
            this.bottomMargin = bottomMargin;
            this.padTop = padTop;
            this.padBottom = padBottom;
            this.clipped = clipped;
            this.grew = grew;
            this.grewTop = bars.top != null ? bars.top.getHeight() : 0;
            this.grewBottom = bars.bottom != null ? bars.bottom.getHeight() : 0;
        }

        boolean holds(Bars other) {
            return grown == other.grown && list == other.list && top == other.top && bottom == other.bottom &&
                grewTop == (other.top != null ? other.top.getHeight() : 0) &&
                grewBottom == (other.bottom != null ? other.bottom.getHeight() : 0);
        }

        /** Whether the views this was built on are still the chat's. A rebuilt chat gets a fresh search. */
        boolean alive() {
            return list.getParent() != null && grown.getParent() != null &&
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
        ViewGroup.LayoutParams params = bars.grown.getLayoutParams();
        boolean grow = params instanceof ViewGroup.MarginLayoutParams && bars.list.getParent() != null;
        ViewGroup.MarginLayoutParams margins = grow ? (ViewGroup.MarginLayoutParams) params : null;
        Install install = new Install(bars,
            bars.top != null ? bars.top.getZ() : null, bars.top != null ? bars.top.getOutlineProvider() : null,
            bars.bottom != null ? bars.bottom.getZ() : null, bars.bottom != null ? bars.bottom.getOutlineProvider() : null,
            grow ? margins.topMargin : 0, grow ? margins.bottomMargin : 0,
            bars.list.getPaddingTop(), bars.list.getPaddingBottom(),
            bars.list instanceof ViewGroup && ((ViewGroup) bars.list).getClipToPadding(), grow);
        installs.put(chat, install);
        frost(bars.top, bars.list);
        frost(bars.bottom, bars.list);
        // Both bars draw over the messages that now run under them, and neither takes a shadow for being raised.
        raise(bars.top);
        raise(bars.bottom);
        if (!grow) return true;
        margins.topMargin -= install.grewTop;
        margins.bottomMargin -= install.grewBottom;
        bars.list.setPadding(bars.list.getPaddingLeft(), install.padTop + install.grewTop,
            bars.list.getPaddingRight(), install.padBottom + install.grewBottom);
        if (bars.list instanceof ViewGroup) ((ViewGroup) bars.list).setClipToPadding(false);
        bars.grown.setLayoutParams(params);
        return true;
    }

    /** [bar] draws the messages behind it blurred, with its own colour over the blur. */
    private static void frost(View bar, View list) {
        if (bar == null) return;
        Drawable own = bar.getBackground();
        Drawable backdrop = new Backdrop(list, bar, bar.getResources().getDisplayMetrics().density * RADIUS_DP);
        if (own == null) {
            bar.setBackground(backdrop);
            return;
        }
        Drawable tint = own.mutate();
        tint.setAlpha(TINT);
        bar.setBackground(new LayerDrawable(new Drawable[] {backdrop, tint}));
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
        give(had.top, had.topBackground, had.topZ, had.topOutline);
        give(had.bottom, had.bottomBackground, had.bottomZ, had.bottomOutline);
        had.list.setPadding(had.list.getPaddingLeft(), had.padTop, had.list.getPaddingRight(), had.padBottom);
        if (had.list instanceof ViewGroup) ((ViewGroup) had.list).setClipToPadding(had.clipped);
        ViewGroup.LayoutParams params = had.grown.getLayoutParams();
        if (!had.grew || !(params instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) params;
        margins.topMargin = had.topMargin;
        margins.bottomMargin = had.bottomMargin;
        had.grown.setLayoutParams(params);
    }

    private static void give(View bar, Drawable background, Float z, ViewOutlineProvider outline) {
        if (bar == null) return;
        if (background != null) background.setAlpha(255);
        bar.setBackground(background);
        bar.setOutlineProvider(outline);
        if (z != null) bar.setZ(z);
    }

    /**
     * The messages behind a bar, blurred. Each draw records the list's own drawing into a render node moved into the
     * bar's corner, hands the node the blur and draws it, so the blur is the GPU's work and the messages behind the
     * bar are the ones on screen. The list is no parent of the bar, so nothing draws itself here.
     */
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
