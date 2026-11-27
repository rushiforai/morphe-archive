package app.hushmessenger.extension;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Picture;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.DecelerateInterpolator;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * The page following the finger while you swipe between tabs (#194). What the home screen shows over its tab bar moves
 * with the finger, and the tab the finger heads for comes in beside it. Messenger keeps the page of every tab it has
 * opened, hidden, but a hidden page brought out beside the moving one drew nothing on the S22, so the gap showed black.
 * The home screen takes a picture of a tab's page each time you leave it, by a swipe or a tap on the tab bar, and that
 * picture is what comes in beside. The hidden page still comes along under it when Messenger has one, so a swipe that
 * commits leaves the real page in place as the tab changes, and the picture fades into it. A tab with no picture yet
 * shows its hidden page if there is one, and otherwise the colour behind Messenger's pages, so the gap is never a
 * different colour from the page. A tab Messenger hasn't opened yet has no page until it's opened, so then the page is
 * carried off, the tab changes and the new page slides in from the other side. One that doesn't commit springs back.
 * The tab bar never moves and nothing is drawn over it.
 */
final class TabFollow {
    static final String KEY = "tab_swipe_follow";
    /** How much of the finger's travel the page follows towards a side with no tab left. */
    static final float EDGE_PULL = 0.3f;
    static final long OUT_MS = 120;
    static final long IN_MS = 220;
    static final long BACK_MS = 180;
    /** How long the picture a swipe lands on takes to fade into the page Messenger shows. */
    static final long FADE_MS = 150;
    /** A child of the home screen counts as its tab bar when it's no taller than this share of the screen... */
    private static final float BAR_HEIGHT = 0.2f;
    /** ...and starts this far down it. */
    private static final float BAR_FROM = 0.7f;
    /** The view holding the tabs' pages is at least this share of the screen's height... */
    private static final float HOLDER_HEIGHT = 0.5f;
    /** ...and the page it shows at least this share of its own. */
    private static final float PAGE_HEIGHT = 0.75f;
    /**
     * How many levels under a moving view the holder may sit. With the normal tab bar Messenger puts it one level in,
     * beside an empty layer as big as it is.
     */
    private static final int HOLDER_DEPTH = 2;

    /** Every home screen's pictures, so they can all go at once when memory runs low. */
    private static final Map<View, Map<Object, Shot>> KEPT = new WeakHashMap<>();
    /** The application the memory watch is registered with, or null before the first picture. */
    private static Context watched;

    private TabFollow() {}

    /** Its own switch under Swipe between tabs, read on every swipe. */
    static boolean on() {
        return Settings.wouldUse(TabSwipe.KEY) && Settings.preferences != null && Settings.preferences.getBoolean(KEY, false);
    }

    /**
     * What moves: every shown view beside the tab bar, at the first level of the home screen that holds more than one.
     * Empty when that level has no bar along its bottom, so a layout Hush doesn't know keeps the plain swipe.
     */
    static List<View> pages(ViewGroup frame) {
        List<View> moving = new ArrayList<>();
        boolean bar = false;
        for (View child : shownLevel(frame)) {
            if (isBar(frame, child)) bar = true;
            else moving.add(child);
        }
        if (!bar) moving.clear();
        return moving;
    }

    /** The tab bar at that same level, or null when there's none. */
    static View bar(ViewGroup frame) {
        for (View child : shownLevel(frame)) {
            if (isBar(frame, child)) return child;
        }
        return null;
    }

    /** Every shown view at the first level of the home screen that holds more than one, or none. */
    private static List<View> shownLevel(ViewGroup frame) {
        List<View> shown = new ArrayList<>();
        if (frame.getWidth() <= 0 || frame.getHeight() <= 0) return shown;
        ViewGroup level = frame;
        while (true) {
            shown.clear();
            for (int i = 0; i < level.getChildCount(); i++) {
                View child = level.getChildAt(i);
                if (child.getVisibility() == View.VISIBLE) shown.add(child);
            }
            if (shown.size() == 1 && shown.get(0) instanceof ViewGroup) {
                level = (ViewGroup) shown.get(0);
                continue;
            }
            if (shown.size() < 2) shown.clear();
            return shown;
        }
    }

    /** Measured inside the frame, from the layout itself, so a page already moved sideways doesn't count. */
    private static boolean isBar(ViewGroup frame, View child) {
        Rect box = box(frame, child);
        int height = frame.getHeight();
        return box.height() > 0 && box.height() <= height * BAR_HEIGHT && box.top >= height * BAR_FROM;
    }

    /** Where [view] sits in [frame], from the layout alone, leaving out any sideways move. */
    static Rect box(ViewGroup frame, View view) {
        Rect box = new Rect(0, 0, view.getWidth(), view.getHeight());
        frame.offsetDescendantRectToMyCoords(view, box);
        return box;
    }

    /**
     * The view under [moving] that holds the tabs' pages: about as tall as the screen, showing one page that fills it,
     * with the pages of tabs opened before kept hidden beside it. Null when there's none.
     */
    static ViewGroup holder(ViewGroup frame, List<View> moving) {
        for (View view : moving) {
            ViewGroup found = holderIn(frame, view, HOLDER_DEPTH);
            if (found != null) return found;
        }
        return null;
    }

    /** [view] when it holds the pages, or else the first view under it that does, [depth] levels down at most. */
    private static ViewGroup holderIn(ViewGroup frame, View view, int depth) {
        if (!(view instanceof ViewGroup) || view.getVisibility() != View.VISIBLE
                || view.getHeight() < frame.getHeight() * HOLDER_HEIGHT) {
            return null;
        }
        ViewGroup group = (ViewGroup) view;
        View shown = shownPage(group);
        if (shown != null && shown.getHeight() >= group.getHeight() * PAGE_HEIGHT) return group;
        if (depth <= 0) return null;
        for (int i = 0; i < group.getChildCount(); i++) {
            ViewGroup found = holderIn(frame, group.getChildAt(i), depth - 1);
            if (found != null) return found;
        }
        return null;
    }

    /** The page the holder under [moving] shows now, or null. */
    static View openPage(ViewGroup frame, List<View> moving) {
        ViewGroup found = holder(frame, moving);
        return found == null ? null : shownPage(found);
    }

    /** The one page [holder] shows, or null when it shows none or several. */
    private static View shownPage(ViewGroup holder) {
        View shown = null;
        for (int i = 0; i < holder.getChildCount(); i++) {
            View child = holder.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) continue;
            if (shown != null) return null;
            shown = child;
        }
        return shown;
    }

    /** The hidden page in [holder] that [built] says belongs to [tab], or null when Messenger hasn't built one. */
    private static View hiddenPage(ViewGroup holder, Map<View, Object> built, Object tab) {
        if (holder == null || tab == null) return null;
        for (int i = 0; i < holder.getChildCount(); i++) {
            View child = holder.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE && tab.equals(built.get(child))) return child;
        }
        return null;
    }

    /**
     * The colour behind the tabs' pages, which have no background of their own: the first background from the moving
     * views' parent out to the window, when it's one solid colour. 0 when it's anything else, which then shows as it is.
     */
    static int surface(ViewGroup frame, List<View> moving) {
        ViewParent at = moving.isEmpty() ? frame : moving.get(0).getParent();
        for (; at instanceof View; at = at.getParent()) {
            Drawable background = ((View) at).getBackground();
            if (background == null) continue;
            if (!(background instanceof ColorDrawable)) return 0;
            int color = ((ColorDrawable) background).getColor();
            return Color.alpha(color) == 255 ? color : 0;
        }
        return 0;
    }

    /**
     * Has every Litho view under [view] look again at how much of it is on screen. Litho draws only the part of a view
     * it last saw on screen and looks again only when that view itself moves, never when a view around it does, so a
     * page Messenger built while the page was carried off stayed blank once it slid back (#194). Moving a view by
     * nothing is what makes Litho look, and does nothing to any other view.
     */
    static void remount(View view) {
        if (view.getVisibility() != View.VISIBLE || !(view instanceof ViewGroup)) return;
        view.offsetLeftAndRight(0);
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) remount(group.getChildAt(i));
    }

    /** Keeps [pictures] where low memory or a change of theme or screen can reach them, watching for both once. */
    static void keepPictures(View frame, Map<Object, Shot> pictures) {
        KEPT.put(frame, pictures);
        Context app = frame.getContext().getApplicationContext();
        if (app == null || app == watched) return;
        app.registerComponentCallbacks(MEMORY);
        watched = app;
    }

    /** Lets every picture go. Each tab gets a new one the next time it's left. */
    static void dropPictures() {
        for (Map<Object, Shot> pictures : KEPT.values()) pictures.clear();
    }

    private static final ComponentCallbacks2 MEMORY = new ComponentCallbacks2() {
        @Override
        @SuppressWarnings("deprecation")
        public void onTrimMemory(int level) {
            // The screen going away isn't low memory, and Messenger coming back wants its pictures. Android 14 and
            // later send only that and the move into the background, which is where they cost the most.
            if (level >= TRIM_MEMORY_BACKGROUND || (level >= TRIM_MEMORY_RUNNING_LOW && level < TRIM_MEMORY_UI_HIDDEN)) {
                dropPictures();
            }
        }

        @Override
        public void onLowMemory() {
            dropPictures();
        }

        /** A new theme, size or language draws every page differently. */
        @Override
        public void onConfigurationChanged(Configuration configuration) {
            dropPictures();
        }
    };

    /** A picture of a tab's page as it last was on screen, with the colour behind it and the size it was taken at. */
    static final class Shot {
        final Picture picture;
        final int surface;
        final int width;
        final int height;

        private Shot(Picture picture, int surface, int width, int height) {
            this.picture = picture;
            this.surface = surface;
            this.width = width;
            this.height = height;
        }

        /**
         * A picture of [moving] where the layout puts them, which is where they rest, or null when there's nothing to
         * take. Any sideways move leaves it alone, and so does every hidden page.
         */
        static Shot of(ViewGroup frame, List<View> moving) {
            int width = frame.getWidth(), height = frame.getHeight();
            if (width <= 0 || height <= 0 || moving.isEmpty()) return null;
            Picture picture = new Picture();
            Canvas canvas = picture.beginRecording(width, height);
            try {
                for (View view : moving) {
                    if (view.getVisibility() != View.VISIBLE) continue;
                    Rect box = box(frame, view);
                    int saved = canvas.save();
                    canvas.translate(box.left - view.getScrollX(), box.top - view.getScrollY());
                    canvas.clipRect(view.getScrollX(), view.getScrollY(),
                        view.getScrollX() + view.getWidth(), view.getScrollY() + view.getHeight());
                    view.draw(canvas);
                    canvas.restoreToCount(saved);
                }
            } finally {
                picture.endRecording();
            }
            return new Shot(picture, surface(frame, moving), width, height);
        }

        /** Still right for [frame]: taken at its size, over the same colour, so with the theme it has now. */
        boolean fits(ViewGroup frame, int now) {
            return width == frame.getWidth() && height == frame.getHeight() && surface == now;
        }
    }

    /** One swipe's page: the views it moves, what comes in beside them, and the slide carrying them, if any. */
    static final class Drag {
        private final ViewGroup frame;
        private List<View> moving;
        /** The view the moving ones sit in. */
        private final ViewParent level;
        private ValueAnimator running;
        /** The tab change a slide off the screen makes when it gets there. */
        private Runnable change;
        /** Moves on whenever the swipe is ended early, so a slide posted before that never starts. */
        private int round;
        /** What holds the tabs' pages, the moving view it is or sits in, and the page it showed as the swipe began. */
        private final ViewGroup holder;
        private final View carrier;
        private final View open;
        /** The pages Messenger has already built for the tabs before and after the open one, or null. */
        private final View before;
        private final View after;
        /** The pictures of the tabs before and after the open one, or null where there's none. */
        private final Picture beforeShot;
        private final Picture afterShot;
        /** The colour behind the pages, filled in beside the moving ones where no page shows. 0 for none. */
        private final int surface;
        /** Where the tab bar sits, which nothing is drawn over. */
        private final Rect bar;
        /** The page shown beside the moving ones now, and what it had before it was. */
        private View beside;
        private int besideVisibility;
        private float besideX;
        /** The views out from the holder that stop clipping while a page is beside it, and whether each one clipped. */
        private final List<ViewGroup> unclipped = new ArrayList<>();
        private final List<Boolean> clipped = new ArrayList<>();
        /** From when a swipe commits until the tab has changed and the views are on their way into place. */
        private boolean settling;
        /** Once the tab has changed, the side the new page comes in from has no picture. */
        private boolean arrived;
        /** Cleared once Messenger's own page sits where the side beside would be drawn. */
        private boolean fill = true;
        /** The picture a swipe landed on, fading into the page Messenger shows now, and how much of it is left. */
        private Picture covering;
        private int coverAlpha;
        private ValueAnimator fading;
        /** Set when drawing failed once, which then stops for the rest of the swipe. */
        private boolean broken;
        private final Rect strip = new Rect();

        /**
         * [built] remembers which tab each of Messenger's pages belongs to, learnt as each one is the page on screen with
         * [opened] open, and [pictures] holds each tab's picture. [previous] and [next] are the tabs either side, or null
         * at an end.
         */
        Drag(ViewGroup frame, List<View> moving, Map<View, Object> built, Map<Object, Shot> pictures, Object opened,
                Object previous, Object next) {
            this.frame = frame;
            this.moving = moving;
            level = moving.isEmpty() ? null : moving.get(0).getParent();
            ViewGroup found = holder(frame, moving);
            holder = found;
            carrier = found == null ? null : carrier(found, moving);
            open = found == null ? null : shownPage(found);
            if (open != null && opened != null) built.put(open, opened);
            before = hiddenPage(found, built, previous);
            after = hiddenPage(found, built, next);
            surface = surface(frame, moving);
            beforeShot = shot(pictures, previous);
            afterShot = shot(pictures, next);
            View tabBar = bar(frame);
            bar = tabBar == null ? null : box(frame, tabBar);
        }

        /** The moving view that is [holder] or holds it. */
        private static View carrier(ViewGroup holder, List<View> moving) {
            for (View at = holder; at != null; at = at.getParent() instanceof View ? (View) at.getParent() : null) {
                if (moving.contains(at)) return at;
            }
            return holder;
        }

        /** [tab]'s picture when it still fits, dropping one taken at another size or with another theme. */
        private Picture shot(Map<Object, Shot> pictures, Object tab) {
            Shot shot = tab == null ? null : pictures.get(tab);
            if (shot == null) return null;
            if (shot.fits(frame, surface)) return shot.picture;
            pictures.remove(tab);
            return null;
        }

        /** Follows the finger [dx] from where it went down, pulling less towards a side with no tab. */
        void follow(float dx, boolean tabThatWay) {
            stop();
            bring(dx < 0 ? after : dx > 0 ? before : null, dx < 0 ? frame.getWidth() : -frame.getWidth());
            place(tabThatWay ? dx : dx * EDGE_PULL);
            Settings.activeAt.put(KEY, System.currentTimeMillis());
        }

        /**
         * The swipe committed towards [direction] (1 is the next tab, the finger going left). The page leaves that way,
         * with the new tab's side coming in behind it, and [opens] changes the tab. With a picture of the new tab,
         * everything then goes into place under it and it fades into the page Messenger shows. A page beside it is the
         * one Messenger shows, so it stays where it came to. Otherwise the new page comes in from the other side once
         * Messenger has put it there.
         */
        void commit(int direction, Runnable opens) {
            float out = direction > 0 ? -frame.getWidth() : frame.getWidth();
            bring(direction > 0 ? after : before, -out);
            Picture landing = direction > 0 ? afterShot : beforeShot;
            change = opens;
            settling = true;
            slide(out, OUT_MS, () -> {
                Runnable now = change;
                change = null;
                if (now != null) now.run();
                int was = round;
                new Handler(Looper.getMainLooper()).post(() -> {
                    if (round != was) return;
                    settling = false;
                    arrived = true;
                    if (landed()) {
                        // Messenger shows the page that came along now. It stays put and the rest comes in after it.
                        View came = beside;
                        beside = null;
                        came.setTranslationX(besideX);
                        clip();
                        moving = new ArrayList<>(moving);
                        moving.remove(carrier);
                        carrier.setTranslationX(0);
                        remount(carrier);
                        fill = false;
                    } else {
                        let();
                        List<View> fresh = pages(frame);
                        if (!fresh.isEmpty()) {
                            for (View view : moving) if (!fresh.contains(view)) view.setTranslationX(0);
                            moving = fresh;
                        }
                    }
                    if (landing != null) {
                        place(0);
                        cover(landing);
                    } else {
                        place(-out);
                        slide(0, IN_MS, null);
                    }
                });
            });
        }

        /** The swipe didn't commit, so the page springs back and the one beside it goes. */
        void back() {
            slide(0, BACK_MS, this::let);
        }

        /**
         * Ends it at once with every view back in place. With [changeTab] the tab changes too if a slide was on its way
         * to changing it, the way a new touch ends it. A home screen leaving the window keeps its tab. True when the tab
         * was still changing, so what's on screen may not be the open tab's page yet.
         */
        boolean finish(boolean changeTab) {
            round++;
            boolean wasSettling = settling;
            settling = false;
            Runnable now = change;
            change = null;
            stop();
            uncover();
            try {
                if (now != null && changeTab) now.run();
            } finally {
                arrived = true;
                let();
                place(0);
            }
            return wasSettling;
        }

        /** Where the page is now. */
        float at() {
            return moving.isEmpty() ? 0 : moving.get(0).getTranslationX();
        }

        /** A slide running right now. Tests read it. */
        boolean sliding() {
            return running != null;
        }

        /** The page beside the moving ones now, or null. Tests read it. */
        View beside() {
            return beside;
        }

        /** The picture a swipe landed on while it fades into the page, or null. Tests read it. */
        Picture covering() {
            return covering;
        }

        /**
         * Draws the side the finger is heading for over the gap the moving views leave: the colour behind the pages,
         * then that tab's picture where there is one, kept off the tab bar. A page of Messenger's own showing there is
         * left to draw itself. After a swipe lands on a picture, it's the picture fading into the page.
         */
        void draw(Canvas canvas) {
            if (broken) return;
            try {
                int width = frame.getWidth();
                if (covering != null) {
                    paint(canvas, 0, width, covering, 0, coverAlpha);
                    return;
                }
                float x = at();
                if (x == 0 || width <= 0) return;
                float offset = x < 0 ? x + width : x - width;
                Picture shot = arrived ? null : x < 0 ? afterShot : beforeShot;
                if (shot == null && (beside != null || !fill)) return;
                int left = Math.round(offset);
                paint(canvas, Math.max(0, left), Math.min(width, left + width), shot, offset, 255);
            } catch (RuntimeException error) {
                broken = true;
                Settings.hookFailedPrivately(KEY, "Can't draw the tab beside the page", error);
            }
        }

        private void paint(Canvas canvas, int left, int right, Picture shot, float offset, int alpha) {
            int height = frame.getHeight();
            if (right <= left || height <= 0 || alpha <= 0 || (shot == null && surface == 0)) return;
            int saved = alpha < 255 ? canvas.saveLayerAlpha(left, 0, right, height, alpha) : canvas.save();
            try {
                strip.set(left, 0, right, height);
                canvas.clipRect(strip);
                // Nothing goes over the tab bar, the floating one included.
                if (bar != null) canvas.clipOutRect(bar);
                if (surface != 0) canvas.drawColor(surface);
                // A picture holding a hardware bitmap can't go on a canvas that draws in software.
                if (shot != null && (canvas.isHardwareAccelerated() || !shot.requiresHardwareAcceleration())) {
                    canvas.translate(offset, 0);
                    canvas.drawPicture(shot);
                }
            } finally {
                canvas.restoreToCount(saved);
            }
        }

        private void place(float x) {
            for (View view : moving) view.setTranslationX(x);
            for (View view : moving) remount(view);
            // The side beside is drawn by the frame, which moving its children doesn't redraw.
            frame.invalidate();
        }

        /** Shows [page], hidden until now, [offset] to the side of the open one, in place of any other beside it. */
        private void bring(View page, float offset) {
            if (page == beside) {
                if (page != null) page.setTranslationX(offset);
                return;
            }
            let();
            if (page == null || holder == null || page.getParent() != holder) return;
            beside = page;
            besideVisibility = page.getVisibility();
            besideX = page.getTranslationX();
            page.setTranslationX(offset);
            page.setVisibility(View.VISIBLE);
            // The page beside sits past the holder's edge, which every view out to the moving ones' parent would cut off.
            for (ViewParent around = holder.getParent(); around instanceof ViewGroup && around != frame; around = around.getParent()) {
                ViewGroup group = (ViewGroup) around;
                unclipped.add(group);
                clipped.add(group.getClipChildren());
                group.setClipChildren(false);
                if (around == level) break;
            }
        }

        /**
         * Hides the page beside the moving ones again, unless the tab it belongs to has opened since, which makes it
         * Messenger's page on screen.
         */
        private void let() {
            View page = beside;
            beside = null;
            if (page == null) return;
            page.setTranslationX(besideX);
            if (page.getVisibility() == View.VISIBLE && (open == null || open.getVisibility() == View.VISIBLE)) {
                page.setVisibility(besideVisibility);
            }
            clip();
        }

        /** Gives every view out from the holder back the clipping it had. */
        private void clip() {
            for (int i = unclipped.size() - 1; i >= 0; i--) unclipped.get(i).setClipChildren(clipped.get(i));
            unclipped.clear();
            clipped.clear();
        }

        /** True once the tab change has shown the page beside the moving ones and hidden the one that was open. */
        private boolean landed() {
            return beside != null && holder != null && beside.getParent() == holder && beside.getVisibility() == View.VISIBLE
                && open != null && open.getVisibility() != View.VISIBLE;
        }

        /** Shows [picture] over everything, fading it out into the page Messenger shows under it. */
        private void cover(Picture picture) {
            uncover();
            covering = picture;
            coverAlpha = 255;
            ValueAnimator fade = ValueAnimator.ofInt(255, 0);
            fade.setDuration(FADE_MS);
            fade.addUpdateListener(step -> {
                coverAlpha = (Integer) step.getAnimatedValue();
                frame.invalidate();
            });
            fade.addListener(new AnimatorListenerAdapter() {
                @Override public void onAnimationEnd(Animator animation) {
                    if (fading == animation) uncover();
                }
            });
            fading = fade;
            fade.start();
            frame.invalidate();
        }

        private void uncover() {
            ValueAnimator was = fading;
            fading = null;
            boolean shown = covering != null;
            covering = null;
            coverAlpha = 0;
            if (was != null) was.cancel();
            if (shown) frame.invalidate();
        }

        private void stop() {
            ValueAnimator was = running;
            running = null;
            if (was != null) was.cancel();
        }

        private void slide(float target, long ms, Runnable done) {
            stop();
            ValueAnimator slide = ValueAnimator.ofFloat(at(), target);
            slide.setDuration(ms);
            slide.setInterpolator(new DecelerateInterpolator());
            slide.addUpdateListener(step -> place((Float) step.getAnimatedValue()));
            slide.addListener(new AnimatorListenerAdapter() {
                private boolean stopped;

                @Override public void onAnimationCancel(Animator animation) {
                    stopped = true;
                }

                @Override public void onAnimationEnd(Animator animation) {
                    if (running == animation) running = null;
                    if (stopped) return;
                    place(target);
                    if (done != null) done.run();
                }
            });
            running = slide;
            slide.start();
        }
    }
}
