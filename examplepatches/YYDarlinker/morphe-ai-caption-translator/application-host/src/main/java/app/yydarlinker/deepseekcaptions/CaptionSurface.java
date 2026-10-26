package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.SystemClock;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;

/** Verified player geometry only. No Activity-wide surface search and no unrelated previews. */
final class CaptionSurface {
    /** The containers of the regular player, from the outer overlay layout to the player itself. */
    static final String[] PLAYER_IDS = {
        "inset_overlay_view_layout", "player_overlays", "player_overlay", "watch_player"
    };

    private static final String[] SHORTS_IDS = {
        "reel_player_overlay_root",
        "reel_watch_player",
        "shorts_player_view_container",
        "reel_player_page_container",
        "reel_watch_fragment_root"
    };
    private static final long SHORTS_PROBE_MS = 250;
    private static final int MAX_SHORTS_VIEWS = 1800, MAX_SURFACE_VIEWS = 900;

    private static final WeakHashMap<View, WeakReference<View>> renderedSurfaces =
            new WeakHashMap<>();
    private static WeakReference<View> renderedSurfaceView = new WeakReference<>(null);

    /** Any change of the player's layout makes the cached geometry stale. */
    private static final View.OnLayoutChangeListener GEOMETRY_LAYOUT =
            (v, l, t, r, b, ol, ot, or, ob) -> {
                if (l != ol || t != ot || r != or || b != ob) invalidateGeometry();
            };

    private static WeakReference<Activity> activity = new WeakReference<>(null);
    private static WeakReference<View> shorts = new WeakReference<>(null);
    private static WeakReference<View> player = new WeakReference<>(null);
    private static WeakReference<View> observedRoot = new WeakReference<>(null);
    private static WeakReference<FrameLayout> stableHostCache = new WeakReference<>(null);
    private static WeakReference<FrameLayout> touchHostCache = new WeakReference<>(null);
    private static boolean geometryInvalid = true;
    private static long shortsProbeAt;

    /** Counters of the tree searches, so tests and diagnostics can see that caching works. */
    static long refreshSearchCount, renderedSearchCount;

    private CaptionSurface() {}

    static void invalidateGeometry() {
        geometryInvalid = true;
        renderedSurfaces.clear();
    }

    static void activity(Activity value) {
        stopObserving();
        invalidateGeometry();
        renderedSurfaceView.clear();
        stableHostCache.clear();
        touchHostCache.clear();
        activity = new WeakReference<>(value);
        shorts = new WeakReference<>(null);
        player = new WeakReference<>(null);
    }

    private static void stopObserving() {
        View old = observedRoot.get();
        if (old != null) old.removeOnLayoutChangeListener(GEOMETRY_LAYOUT);
        observedRoot.clear();
    }

    /** Is [view] on screen, opaque enough and big enough to be a player or a caption host? */
    static boolean visible(View view) {
        if (view == null || !view.isAttachedToWindow() || !view.isShown() || view.getAlpha() <= .01)
            return false;
        Rect rect = new Rect();
        return view.getGlobalVisibleRect(rect) && rect.width() > 40 && rect.height() > 40;
    }

    static boolean isShorts() {
        return CaptionPlayerAuthority.shortsSurfaceAllowed() && visible(shorts.get());
    }

    static void shortsStateChanged() {
        View old = shorts.get();
        if (player.get() == old) player.clear();
        shorts.clear();
        shortsProbeAt = 0;
        clearHostCaches();
        invalidateGeometry();
    }

    /**
     * Shorts reports the inner player type NONE, which looks like a closed miniplayer, so the
     * surface decides. The cached Short view goes stale when the Short loops or is entered again,
     * so look for the visible Shorts container once more (at most every 250 ms, a bounded walk).
     */
    static boolean shortsSurfaceNow() {
        if (!CaptionPlayerAuthority.shortsSurfaceAllowed()) return false;
        if (isShorts()) return true;
        long now = SystemClock.uptimeMillis();
        if (now - shortsProbeAt < SHORTS_PROBE_MS) return false;
        shortsProbeAt = now;
        Activity current = activity.get();
        if (current == null || current.getWindow() == null) return false;
        Set<Integer> ids = shortsIds(current);
        return !ids.isEmpty() && discover(current.getWindow().getDecorView(), ids) != null;
    }

    /** A new readiness event supersedes an earlier negative probe, without adding a probe loop. */
    static void allowShortsReadyProbe() {
        shortsProbeAt = SystemClock.uptimeMillis() - SHORTS_PROBE_MS;
    }

    private static Set<Integer> shortsIds(Activity current) {
        Set<Integer> ids = new HashSet<>();
        for (String name : SHORTS_IDS) {
            int id = current.getResources().getIdentifier(name, "id", current.getPackageName());
            if (id != 0) ids.add(id);
        }
        return ids;
    }

    /** Finds the player view again: a visible Shorts container, else the best regular container. */
    static View refresh() {
        Activity current = activity.get();
        if (current == null || current.getWindow() == null) return null;
        View root = current.getWindow().getDecorView();
        if (observedRoot.get() != root) {
            stopObserving();
            observedRoot = new WeakReference<>(root);
            root.addOnLayoutChangeListener(GEOMETRY_LAYOUT);
            invalidateGeometry();
        }
        if (!geometryInvalid && visible(player.get())) return player.get();
        geometryInvalid = false;
        refreshSearchCount++;
        View previousPlayer = player.get();

        View shortView = CaptionPlayerAuthority.shortsSurfaceAllowed()
                ? discover(root, shortsIds(current)) : null;
        if (shortView != null) {
            if (shortView != previousPlayer) clearHostCaches();
            player = new WeakReference<>(shortView);
            return shortView;
        }
        // The regular player: prefer a container with a rendered video surface, then the smallest.
        View best = null;
        long area = 0;
        boolean proven = false;
        for (String name : PLAYER_IDS) {
            int id = current.getResources().getIdentifier(name, "id", current.getPackageName());
            View candidate = id == 0 ? null : root.findViewById(id);
            if (!visible(candidate)) continue;
            Rect rect = new Rect();
            candidate.getGlobalVisibleRect(rect);
            boolean hasSurface = renderedBounds(candidate, root) != null;
            long size = area(rect);
            if (best == null || (hasSurface && !proven) || (hasSurface == proven && size < area)) {
                best = candidate;
                area = size;
                proven = hasSurface;
            }
        }
        if (best != previousPlayer) clearHostCaches();
        player = new WeakReference<>(best);
        return best;
    }

    private static void clearHostCaches() {
        stableHostCache.clear();
        touchHostCache.clear();
    }

    static View player() {
        View view = player.get();
        return !geometryInvalid && visible(view) ? view : refresh();
    }

    /** The largest visible view with one of [ids]; it becomes the cached Shorts view. */
    static View discover(View root, Set<Integer> ids) {
        if (!CaptionPlayerAuthority.shortsSurfaceAllowed()) return null;
        View best = null;
        long largest = 0;
        ArrayDeque<View> pending = new ArrayDeque<>();
        if (root != null) pending.add(root);
        for (int visited = 0; !pending.isEmpty() && visited < MAX_SHORTS_VIEWS; visited++) {
            View view = pending.remove();
            Object tag = view.getTag();
            if (tag != null && tag.toString().startsWith("yydarlinker.deepseek.caption")) continue;
            if (ids.contains(view.getId()) && visible(view)) {
                Rect rect = new Rect();
                view.getGlobalVisibleRect(rect);
                if (area(rect) > largest) {
                    largest = area(rect);
                    best = view;
                }
            }
            if (view instanceof ViewGroup && view.getVisibility() == View.VISIBLE)
                addChildren((ViewGroup) view, pending);
        }
        shorts = new WeakReference<>(best);
        return best;
    }

    private static void addChildren(ViewGroup group, ArrayDeque<View> pending) {
        for (int i = 0; i < group.getChildCount(); i++) pending.add(group.getChildAt(i));
    }

    private static long area(Rect rect) {
        return (long) rect.width() * rect.height();
    }

    /** The bounds of the Shorts view inside [host]. */
    static Rect bounds(View host) {
        return relative(shorts.get(), host);
    }

    private static final Rect SCREEN_RECT = new Rect(), HOST_RECT = new Rect();
    private static final int[] HOST_LOCATION = new int[2];
    private static final Matrix HOST_TO_SCREEN = new Matrix(), SCREEN_TO_HOST = new Matrix();
    private static final RectF LOCAL_SCREEN = new RectF(), LOCAL_HOST = new RectF();

    /** The visible part of [view] in the coordinates of [host], or null. */
    private static Rect relative(View view, View host) {
        if (view == null
                || host == null
                || !view.isAttachedToWindow()
                || !view.isShown()
                || view.getAlpha() <= .01f
                || host.getWidth() <= 0
                || host.getHeight() <= 0) return null;
        if (!view.getGlobalVisibleRect(SCREEN_RECT)
                || !host.getGlobalVisibleRect(HOST_RECT)) return null;
        // The common player animation is a translation/resize, not a scale: subtracting the two
        // screen origins avoids a matrix allocation and inversion on every frame.
        boolean untransformed =
                Math.abs(HOST_RECT.width() - host.getWidth()) <= 1
                        && Math.abs(HOST_RECT.height() - host.getHeight()) <= 1;
        Rect bounds;
        if (untransformed) {
            host.getLocationOnScreen(HOST_LOCATION);
            SCREEN_RECT.offset(-HOST_LOCATION[0], -HOST_LOCATION[1]);
            HOST_RECT.offset(-HOST_LOCATION[0], -HOST_LOCATION[1]);
            bounds = SCREEN_RECT;
        } else {
            // A player transition may scale or translate its container. Map both on-screen
            // rectangles back through the host's real matrix instead of subtracting two screen
            // origins, so the caption keeps following the video inside a scaled surface.
            HOST_TO_SCREEN.reset();
            host.transformMatrixToGlobal(HOST_TO_SCREEN);
            if (!HOST_TO_SCREEN.invert(SCREEN_TO_HOST)) return null;
            LOCAL_SCREEN.set(SCREEN_RECT);
            LOCAL_HOST.set(HOST_RECT);
            SCREEN_TO_HOST.mapRect(LOCAL_SCREEN);
            SCREEN_TO_HOST.mapRect(LOCAL_HOST);
            bounds = round(LOCAL_SCREEN);
            HOST_RECT.set(round(LOCAL_HOST));
        }
        return !bounds.isEmpty() && !HOST_RECT.isEmpty() && bounds.intersect(HOST_RECT)
                ? new Rect(bounds)
                : null;
    }

    private static Rect round(RectF value) {
        return new Rect(
                Math.round(value.left),
                Math.round(value.top),
                Math.round(value.right),
                Math.round(value.bottom));
    }

    /**
     * The largest rendered video surface under [root], cached per player root. This is the view the
     * caption is layered with; it is never the activity's content view.
     */
    static View renderedSurface(View root) {
        if (root == null) return null;
        WeakReference<View> cached = renderedSurfaces.get(root);
        if (cached != null && visible(cached.get())) return cached.get();

        renderedSearchCount++;
        View selected = null;
        long selectedArea = 0;
        ArrayDeque<View> pending = new ArrayDeque<>();
        pending.add(root);
        for (int visited = 0; !pending.isEmpty() && visited < MAX_SURFACE_VIEWS; visited++) {
            View view = pending.remove();
            if (!view.isShown() || view.getAlpha() <= .01f) continue;
            if (view instanceof SurfaceView || view instanceof TextureView) {
                Rect rect = new Rect();
                if (visible(view) && view.getGlobalVisibleRect(rect)) {
                    long area = area(rect);
                    if (selected == null || area > selectedArea) {
                        selected = view;
                        selectedArea = area;
                    }
                }
            }
            if (view instanceof ViewGroup) addChildren((ViewGroup) view, pending);
        }
        if (selected != null) {
            renderedSurfaces.put(root, new WeakReference<>(selected));
            renderedSurfaceView = new WeakReference<>(selected);
            selected.removeOnLayoutChangeListener(GEOMETRY_LAYOUT);
            selected.addOnLayoutChangeListener(GEOMETRY_LAYOUT);
        }
        return selected;
    }

    /** The bounds, inside [host], of the largest video surface under [root]. */
    static Rect renderedBounds(View root, View host) {
        View surface = renderedSurface(root);
        return surface == null ? null : relative(surface, host);
    }

    /**
     * The view that owns the video plane. The caption is a layer of this view, never of the
     * activity: everything the app draws above the video (player controls, a comment sheet, a
     * panel) then covers the caption, and a player transition that moves the video moves it too.
     *
     * <p>Preference order: the first FrameLayout from the video surface upwards, then the player
     * itself, then nothing (the caller falls back to the activity content for a first frame). A
     * player view that is not a FrameLayout cannot hold the overlay's layout params.
     */
    static FrameLayout captionHost(View player) {
        if (player == null) return null;
        for (View view = renderedSurface(player); view != null; view = parent(view)) {
            if (view instanceof FrameLayout) return (FrameLayout) view;
            if (view == player) break;
        }
        return player instanceof FrameLayout ? (FrameLayout) player : null;
    }

    static FrameLayout captionHost() {
        FrameLayout stable = stableCaptionHost();
        return stable != null ? stable : captionHost(player());
    }

    /**
     * The stable caption host: the topmost player-overlay container. It is above the rendered
     * video and above the player controls, below the engagement panel, and it is not the video
     * Surface ancestor that YouTube rebuilds/reparents during fullscreen and comment transitions.
     * Captions deliberately sit above the controls now: being below them let the progress bar and
     * time labels cover the text. For Shorts the reel overlay root plays the same role. Returns
     * null when neither exists, so the caller can use the legacy surface-ancestor fallback for the
     * first frame.
     */
    static FrameLayout stableCaptionHost() {
        FrameLayout cached = stableHostCache.get();
        if (usableHost(cached)) return cached;
        Activity current = activity.get();
        if (current == null || current.getWindow() == null) return null;
        View root = searchRoot(current);
        View decor = current.getWindow().getDecorView();
        FrameLayout host = overlayHost(current, root);
        // The custom-views container is usually a sibling of the selected player container (and
        // may be found only on the decor), never a child of it. The old key-first lookup missed
        // it and left the caption on the controls layer.
        if (!usableHost(host)) host = frame(root, current, "inset_overlay_view_layout");
        if (!usableHost(host)) host = frame(decor, current, "inset_overlay_view_layout");
        if (usableHost(host)) stableHostCache = new WeakReference<>(host);
        return usableHost(host) ? host : null;
    }

    /** YouTube's topmost player-overlay container, searched under the player and then the decor. */
    private static FrameLayout overlayHost(Activity current, View root) {
        View decor = current.getWindow().getDecorView();
        FrameLayout host = null;
        if (isShorts() || shorts.get() != null) {
            host = frame(root, current, "reel_player_overlay_root");
            if (!usableHost(host)) host = frame(decor, current, "reel_player_overlay_root");
        }
        if (!usableHost(host))
            host = frame(root, current, "player_overlays_custom_views_container");
        if (!usableHost(host))
            host = frame(decor, current, "player_overlays_custom_views_container");
        return usableHost(host) ? host : null;
    }

    /** Search the active player first; duplicate ids exist when a miniplayer is still alive. */
    private static View searchRoot(Activity current) {
        View active = player();
        return active != null && active.isAttachedToWindow()
                ? active
                : current.getWindow().getDecorView();
    }

    /** True when [host] is one of the pinned overlay hosts (children belong under the controls). */
    static boolean pinnedHost(FrameLayout host) {
        if (host == null) return false;
        Activity current = activity.get();
        if (current == null) return false;
        int id = host.getId();
        return id != 0
                && (id == viewId(current, "inset_overlay_view_layout")
                        || id == viewId(current, "reel_player_overlay_root")
                        || id == viewId(current, "player_overlays_custom_views_container"));
    }

    /**
     * True when [host] is YouTube's topmost player-overlay container. A caption there is above the
     * controls, so it is appended last (not index 0) and receives its own touch events.
     */
    static boolean topmostOverlayHost(FrameLayout host) {
        if (host == null) return false;
        Activity current = activity.get();
        if (current == null) return false;
        int id = host.getId();
        return id != 0
                && (id == viewId(current, "player_overlays_custom_views_container")
                        || id == viewId(current, "reel_player_overlay_root"));
    }

    /**
     * The topmost transparent host used by the touch proxy. YouTube brings
     * {@code player_overlays_custom_views_container} to the front of the player overlays; putting
     * the proxy there means a DOWN inside the caption reaches us before the player's controls,
     * while a DOWN outside it falls through to YouTube. Comments remain above the whole player.
     */
    static FrameLayout touchHost() {
        FrameLayout cached = touchHostCache.get();
        if (usableHost(cached)) return cached;
        Activity current = activity.get();
        if (current == null || current.getWindow() == null) return null;
        View root = searchRoot(current);
        FrameLayout host = overlayHost(current, root);
        if (usableHost(host)) touchHostCache = new WeakReference<>(host);
        return usableHost(host) ? host : null;
    }

    private static boolean usableHost(FrameLayout host) {
        return host != null
                && host.isAttachedToWindow()
                && host.isShown()
                && host.getWidth() > 0
                && host.getHeight() > 0;
    }

    private static FrameLayout frame(View root, Activity current, String name) {
        int id = viewId(current, name);
        if (id == 0) return null;
        View view = root.findViewById(id);
        return view instanceof FrameLayout ? (FrameLayout) view : null;
    }

    private static WeakReference<Activity> idOwner = new WeakReference<>(null);
    private static int insetId, customId, reelId;

    private static int viewId(Activity current, String name) {
        if (idOwner.get() != current) {
            idOwner = new WeakReference<>(current);
            insetId = current.getResources().getIdentifier("inset_overlay_view_layout", "id", current.getPackageName());
            customId = current.getResources().getIdentifier("player_overlays_custom_views_container", "id", current.getPackageName());
            reelId = current.getResources().getIdentifier("reel_player_overlay_root", "id", current.getPackageName());
        }
        if ("inset_overlay_view_layout".equals(name)) return insetId;
        if ("player_overlays_custom_views_container".equals(name)) return customId;
        if ("reel_player_overlay_root".equals(name)) return reelId;
        return 0;
    }

    private static View parent(View view) {
        ViewParent parent = view.getParent();
        return parent instanceof View ? (View) parent : null;
    }

    /** Read-only direction evidence from the cached player; never triggers a search. */
    static int playerLayoutDirection() {
        View view = player.get();
        return view == null ? View.LAYOUT_DIRECTION_INHERIT : view.getLayoutDirection();
    }

    /**
     * The cached rendered surface view. The size law reads its global matrix and local size; no
     * search and no geometry mutation happens here. A detached view is not evidence of a current
     * video plane, so it returns null and the caller keeps the previous scale.
     */
    static View currentSurfaceView() {
        View surface = renderedSurfaceView.get();
        return surface != null && surface.isAttachedToWindow() ? surface : null;
    }

    /**
     * The cached geometry of the one rendered surface. A surface that is momentarily hidden returns
     * null so the caller keeps the last rectangle; substituting the player container here made the
     * caption jump to the letterboxed player bounds for a frame whenever the surface was rebuilt.
     */
    static Rect currentVideoBounds(View host) {
        View surface = renderedSurfaceView.get();
        return surface == null ? null : relative(surface, host);
    }

    /**
     * Discovers the rendered surface again and returns its real bounds, or null when there is no
     * surface. Never substitutes the player container, so a rebuild cannot move the caption onto a
     * different rectangle for one frame.
     */
    static Rect refreshedVideoBounds(View host) {
        return renderedBounds(player(), host);
    }
}
