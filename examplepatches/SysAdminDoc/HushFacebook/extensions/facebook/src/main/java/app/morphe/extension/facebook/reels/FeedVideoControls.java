/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.facebook.download.OpenInAnotherApp;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * A separate play/pause button on a feed video's own visible surface, and a cast button across
 * from it (#182). Facebook keeps its video taps and fullscreen controls. The Tap to play patch
 * supplies these bridges independently of its autoplay switch and of Hold a feed video for 2x.
 * The cast button also needs the video patch, whose player record holds the file it hands over.
 */
public final class FeedVideoControls {
    private static final String FAMILY = FamilyNames.TAP_TO_PLAY;
    private static final Map<Object, Control> players = new WeakHashMap<>();
    private static Handler main;

    interface Players {
        ViewGroup view(Object player);
        Object params(Object player);
        Object origin(Object player);
        String videoId(Object params);
        boolean eligible(Object params);
        boolean playing(Object player);
        void command(Object player, boolean play);
        void cast(View from, String videoId);
    }

    private static final Players PATCHED = new Players() {
        public ViewGroup view(Object player) { return playerView(player); }
        public Object params(Object player) { return playerParams(player); }
        public Object origin(Object player) { return playerOrigin(player); }
        public String videoId(Object params) { return mediaId(params); }
        public boolean eligible(Object params) { return ordinaryVideo(params); }
        public boolean playing(Object player) { return isPlaying(player); }
        public void command(Object player, boolean play) { commandPlayer(player, play); }
        public void cast(View from, String videoId) { OpenInAnotherApp.cast(from.getContext(), videoId); }
    };
    static volatile Players access = PATCHED;
    @Nullable static volatile Boolean inBuildForTests;
    @Nullable static volatile Boolean videoPatchInBuildForTests;

    private FeedVideoControls() { }

    // Filled by the patch with checked, public native members. Only their declared types enter them.
    @Nullable public static ViewGroup playerView(Object player) { return null; }
    @Nullable public static Object playerParams(Object player) { return null; }
    @Nullable public static Object playerOrigin(Object player) { return null; }
    @Nullable public static String mediaId(Object params) { return null; }
    public static boolean ordinaryVideo(Object params) {
        return !liveNow(params) && !sponsored(params) && !audioOnly(params) && !animatedGif(params);
    }
    public static boolean liveNow(Object params) { return true; }
    public static boolean sponsored(Object params) { return true; }
    public static boolean audioOnly(Object params) { return true; }
    public static boolean animatedGif(Object params) { return true; }
    public static boolean isPlaying(Object player) { return false; }
    public static void commandPlayer(Object player, boolean play) { }

    /** First in the native attach. The queued refresh reads the field after Facebook writes it. */
    public static void attached(@Nullable ViewGroup container, @Nullable Object player) {
        if (container == null || player == null) return;
        try {
            Control control;
            synchronized (players) {
                control = players.get(player);
                if (control == null) {
                    control = new Control(player);
                    players.put(player, control);
                }
                control.generation++;
                control.expected = new WeakReference<>(container);
                control.released = false;
            }
            post(control);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "inline attach", failure);
        }
    }

    /** A native play or pause is about to run. Refresh after that call has returned. */
    public static void changed(@Nullable Object player) { invalidate(player, false, false); }

    /** A new binding retires the old button, including queued clicks on it. */
    public static void rebound(@Nullable Object player) { invalidate(player, true, false); }

    /** A released player stays retired until a fresh attach, even if it still exposes old params. */
    public static void released(@Nullable Object player) { invalidate(player, true, true); }

    private static void invalidate(@Nullable Object player, boolean retire, boolean released) {
        try {
            Control control;
            synchronized (players) {
                control = players.get(player);
                if (control == null) return;
                if (retire) control.generation++;
                if (released) control.released = true;
            }
            post(control);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "inline state", failure);
        }
    }

    /** Also used by ordinary edits and imports, so switching off removes an existing button. */
    public static void settingsChanged() {
        for (Control control : snapshot()) post(control);
    }

    private static List<Control> snapshot() {
        synchronized (players) { return new ArrayList<>(players.values()); }
    }

    private static void post(Control control) {
        synchronized (players) {
            if (main == null) main = new Handler(Looper.getMainLooper());
            main.post(() -> refresh(control));
        }
    }

    private static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return (forced != null ? forced : SettingsStatus.tapToPlay()) && Utils.settingsReady();
    }

    private static boolean playOn() {
        return inBuild() && Settings.INLINE_FEED_VIDEO_CONTROLS.get();
    }

    private static boolean castOn() {
        if (!inBuild()) return false;
        Boolean forced = videoPatchInBuildForTests;
        return (forced != null ? forced : SettingsStatus.videoDownload()) && Settings.FEED_VIDEO_CAST_BUTTON.get();
    }

    private static void refresh(Control control) {
        try {
            Object player = control.player.get();
            ViewGroup container = control.expected.get();
            boolean play = playOn();
            boolean cast = castOn();
            if ((!play && !cast) || control.released || player == null || container == null
                    || access.view(player) != container) {
                control.remove(true);
                return;
            }
            control.observe(container);
            if (!container.isAttachedToWindow()) {
                control.remove(false);
                return;
            }
            Target target = target(control, play && cast);
            if (target == null) {
                control.remove(false);
                return;
            }
            control.button = place(control, control.button, play ? target : null, false);
            control.cast = place(control, control.cast, cast ? target : null, true);
            if (control.button != null) control.button.state(access.playing(player));
        } catch (Throwable failure) {
            control.remove(true);
            HookStatus.threw(FAMILY, "inline feed button", failure);
        }
    }

    /** Keeps, makes or drops one button for [target]: null takes it off. Answers what's showing. */
    @Nullable
    private static Button place(Control control, @Nullable Button current, @Nullable Target target, boolean cast) {
        if (current != null && (target == null || current.generation != control.generation
                || current.params.get() != target.params || current.surface.get() != target.surface
                || !current.videoId.equals(target.videoId)
                || current.getParent() != target.content)) {
            detach(current);
            current = null;
        }
        if (target == null) return null;
        if (current == null) {
            current = new Button(control, target, cast);
            target.content.addView(current, new FrameLayout.LayoutParams(target.size, target.size,
                    Gravity.LEFT | Gravity.TOP));
            HookStatus.bound(FAMILY, cast ? "inline cast button" : "inline feed button");
        }
        int left = cast ? target.right : target.left;
        FrameLayout.LayoutParams layout = (FrameLayout.LayoutParams) current.getLayoutParams();
        if (layout.leftMargin != left || layout.topMargin != target.top) {
            layout.leftMargin = left;
            layout.topMargin = target.top;
            current.setLayoutParams(layout);
        }
        return current;
    }

    private static void detach(View button) {
        ViewParent parent = button.getParent();
        if (parent instanceof ViewGroup) ((ViewGroup) parent).removeView(button);
    }

    /** Where the buttons go on the video [control] shows, or null when none fit. [both] needs room for two. */
    @Nullable
    private static Target target(Control control, boolean both) {
        Object player = control.player.get();
        ViewGroup container = control.expected.get();
        if (player == null || container == null || control.released || access.view(player) != container
                || !container.isAttachedToWindow() || !container.isShown() || !container.hasWindowFocus()) return null;
        Object params = access.params(player);
        Object origin = access.origin(player);
        String id = params == null ? null : access.videoId(params);
        if (params == null || id == null || id.isEmpty() || !access.eligible(params)
                || origin == null || !origin.toString().startsWith("newsfeed::")) return null;
        View row = container;
        View list = null;
        for (ViewParent parent = container.getParent(); parent instanceof View; parent = parent.getParent()) {
            View view = (View) parent;
            if (PostLongPress.isNamed(view, PostLongPress.LIST)) {
                if ((!view.canScrollVertically(1) && !view.canScrollVertically(-1))
                        || (row.getWidth() == view.getWidth() && row.getHeight() == view.getHeight())) return null;
                list = view;
                break;
            }
            if (PostLongPress.isScroller(view)) return null;
            row = view;
        }
        if (list == null) return null;
        List<View> surfaces = new ArrayList<>(2);
        surfaces(container, surfaces);
        if (surfaces.size() != 1) return null;
        View surface = surfaces.get(0);
        for (Control other : snapshot()) {
            Object owner = other.player.get();
            if (other == control || other.released || owner == null) continue;
            ViewGroup otherContainer = access.view(owner);
            if (otherContainer != null && otherContainer == other.expected.get()
                    && descendant(surface, otherContainer)) return null;
        }
        View content = container.getRootView().findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout) || !descendant(container, content)) return null;
        Rect visible = new Rect();
        Rect clip = new Rect();
        if (!surface.getGlobalVisibleRect(visible) || !list.getGlobalVisibleRect(clip) || !visible.intersect(clip)) return null;
        if (!content.getGlobalVisibleRect(clip) || !visible.intersect(clip)) return null;
        float density = container.getResources().getDisplayMetrics().density;
        int size = Math.round(48 * density);
        int margin = Math.round(8 * density);
        int across = both ? size * 2 + margin * 3 : size + margin * 2;
        if (visible.width() < across || visible.height() < size + margin * 2) return null;
        int[] at = new int[2];
        content.getLocationInWindow(at);
        return new Target(params, id, surface, (FrameLayout) content, size,
                visible.left - at[0] + margin, visible.right - at[0] - margin - size, visible.top - at[1] + margin);
    }

    private static void surfaces(View view, List<View> found) {
        if (found.size() > 1 || !view.isAttachedToWindow() || !view.isShown() || view.getAlpha() <= 0f) return;
        if (view instanceof TextureView || view instanceof SurfaceView) {
            Rect visible = new Rect();
            if (view.getGlobalVisibleRect(visible) && !visible.isEmpty()) found.add(view);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount() && found.size() < 2; i++) surfaces(group.getChildAt(i), found);
        }
    }

    private static boolean descendant(View view, View ancestor) {
        for (View current = view; current != null;
                current = current.getParent() instanceof View ? (View) current.getParent() : null) {
            if (current == ancestor) return true;
        }
        return false;
    }

    private static void click(Button button) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            post(button.control);
            return;
        }
        Control control = button.control;
        try {
            if (!(button.cast ? castOn() : playOn()) || (button.cast ? control.cast : control.button) != button
                    || control.generation != button.generation) return;
            Target current = target(control, false);
            Object player = control.player.get();
            if (current == null || player == null || current.params != button.params.get()
                    || !button.videoId.equals(current.videoId) || current.surface != button.surface.get()
                    || button.getParent() != current.content) {
                control.remove(false);
                return;
            }
            if (button.cast) {
                access.cast(button, button.videoId);
                HookStatus.counted(FAMILY, "inline cast");
                return;
            }
            access.command(player, !access.playing(player));
            HookStatus.counted(FAMILY, "inline feed control");
            refresh(control);
        } catch (Throwable failure) {
            control.remove(true);
            HookStatus.threw(FAMILY, "inline feed control", failure);
        }
    }

    private static final class Target {
        final Object params;
        final String videoId;
        final View surface;
        final FrameLayout content;
        final int size, left, right, top;
        Target(Object params, String videoId, View surface, FrameLayout content, int size, int left, int right, int top) {
            this.params = params; this.videoId = videoId; this.surface = surface; this.content = content;
            this.size = size; this.left = left; this.right = right; this.top = top;
        }
    }

    private static final class Control implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener {
        final WeakReference<Object> player;
        volatile WeakReference<ViewGroup> expected = new WeakReference<>(null);
        volatile long generation;
        volatile boolean released;
        private WeakReference<ViewGroup> observed = new WeakReference<>(null);
        private WeakReference<ViewTreeObserver> observer = new WeakReference<>(null);
        @Nullable Button button;
        @Nullable Button cast;
        Control(Object player) { this.player = new WeakReference<>(player); }
        void observe(ViewGroup view) {
            ViewTreeObserver next = view.getViewTreeObserver();
            if (observed.get() == view && observer.get() == next) return;
            remove(true);
            observed = new WeakReference<>(view);
            observer = new WeakReference<>(next);
            view.addOnAttachStateChangeListener(this);
            next.addOnPreDrawListener(this);
        }
        void remove(boolean listeners) {
            if (button != null) detach(button);
            if (cast != null) detach(cast);
            button = null;
            cast = null;
            if (!listeners) return;
            ViewGroup view = observed.get();
            if (view != null) view.removeOnAttachStateChangeListener(this);
            ViewTreeObserver tree = observer.get();
            if (tree != null && tree.isAlive()) tree.removeOnPreDrawListener(this);
            observed.clear();
            observer.clear();
        }
        public boolean onPreDraw() { refresh(this); return true; }
        public void onViewAttachedToWindow(View view) { post(this); }
        public void onViewDetachedFromWindow(View view) { generation++; remove(false); }
    }

    /**
     * A 48 dp target with a rounded dark background and a high-contrast symbol: play or pause, or
     * the cast one for [cast].
     */
    static final class Button extends View {
        final Control control;
        final boolean cast;
        final long generation;
        final WeakReference<Object> params;
        final String videoId;
        final WeakReference<View> surface;
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final RectF rect = new RectF();
        final Path path = new Path();
        boolean playing;
        Button(Control control, Target target, boolean cast) {
            super(target.content.getContext());
            this.control = control;
            this.cast = cast;
            generation = control.generation;
            params = new WeakReference<>(target.params);
            videoId = target.videoId;
            surface = new WeakReference<>(target.surface);
            setClickable(true);
            setFocusable(true);
            setOnClickListener(view -> click(this));
            if (cast) {
                setContentDescription(L10n.t("Cast this video"));
                setTooltipText(getContentDescription());
            } else {
                state(false);
            }
        }
        void state(boolean value) {
            if (cast || getContentDescription() != null && playing == value) return;
            playing = value;
            setContentDescription(L10n.t(value ? "Pause feed video" : "Play feed video"));
            setTooltipText(getContentDescription());
            invalidate();
        }
        @Override protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight();
            paint.setColor(0xDD11111B);
            rect.set(0, 0, w, h);
            float radius = 8 * getResources().getDisplayMetrics().density;
            canvas.drawRoundRect(rect, radius, radius, paint);
            paint.setColor(0xFFFFFFFF);
            if (cast) {
                drawCast(canvas, w, h);
            } else if (playing) {
                canvas.drawRect(w * .32f, h * .28f, w * .44f, h * .72f, paint);
                canvas.drawRect(w * .56f, h * .28f, w * .68f, h * .72f, paint);
            } else {
                path.reset();
                path.moveTo(w * .38f, h * .26f);
                path.lineTo(w * .72f, h * .50f);
                path.lineTo(w * .38f, h * .74f);
                path.close();
                canvas.drawPath(path, paint);
            }
        }
        /** The usual cast symbol: a screen outline open at its lower left, with signal arcs there. */
        private void drawCast(Canvas canvas, float w, float h) {
            float stroke = w * .06f;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(stroke);
            paint.setStrokeCap(Paint.Cap.ROUND);
            path.reset();
            path.moveTo(w * .26f, h * .40f);
            path.lineTo(w * .26f, h * .28f);
            path.lineTo(w * .76f, h * .28f);
            path.lineTo(w * .76f, h * .72f);
            path.lineTo(w * .56f, h * .72f);
            canvas.drawPath(path, paint);
            float x = w * .26f, y = h * .72f;
            for (float r : new float[] {w * .14f, w * .26f}) {
                rect.set(x - r, y - r, x + r, y + r);
                canvas.drawArc(rect, 270, 90, false, paint);
            }
            paint.setStyle(Paint.Style.FILL);
            canvas.drawCircle(x + stroke * .5f, y - stroke * .5f, stroke * .9f, paint);
        }
    }

    /** Every player that has attached a video and not been dropped yet, for Pause reels while comments are open. */
    public static List<Object> knownPlayers() {
        List<Object> found = new ArrayList<>();
        synchronized (players) {
            for (Object player : players.keySet()) if (player != null) found.add(player);
        }
        return found;
    }

    @Nullable static View showing(Object player) {
        synchronized (players) {
            Control control = players.get(player);
            return control == null ? null : control.button;
        }
    }

    @Nullable static View showingCast(Object player) {
        synchronized (players) {
            Control control = players.get(player);
            return control == null ? null : control.cast;
        }
    }

    static void reset() {
        for (Control control : snapshot()) control.remove(true);
        synchronized (players) {
            if (main != null) main.removeCallbacksAndMessages(null);
            players.clear();
        }
        access = PATCHED;
        inBuildForTests = null;
        videoPatchInBuildForTests = null;
    }
}
