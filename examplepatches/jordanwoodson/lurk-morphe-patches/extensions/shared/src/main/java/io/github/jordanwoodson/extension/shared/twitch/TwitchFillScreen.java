package io.github.jordanwoodson.extension.shared.twitch;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.view.DisplayCutout;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Fill screen: in landscape, a stream or video wider than tall fills the whole screen of a phone taller than
 * 16:9, the strip beside the camera cutout included, cropping the video's top and bottom instead of showing
 * bars at its sides.
 *
 * <p>Twitch's window already reaches into the cutout area (from Android 11 it asks for
 * LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS), but it pads its full-screen containers, the theatre's among them, by
 * the cutout's inset: that padding is the black strip. While a player qualifies, the container it sits in
 * leaves the cutout out of that padding, and every view of the theatre beside the video (controls, chat over
 * the video, the stream's details, captions) that would reach into the strip is padded by as much instead, so
 * only the video uses the strip. On Android 10, where Twitch leaves the window's cutout mode at its default,
 * the window is switched to SHORT_EDGES for as long and switched back after.
 *
 * <p>The native player keeps fitting its video container the way Twitch does; the video's surface inside it is
 * scaled up until it covers the player, which clips it. Twitch reads the container's bounds for the
 * picture-in-picture window's shape, so that stays the video's own. The React Native player gets the IVS
 * resize mode ZOOM, its "cover".
 *
 * <p>A player qualifies in landscape, outside picture-in-picture, when its video is wider than tall and the
 * player covers the screen apart from the cutout (not a player next to the chat, not a minimized one). The
 * native theatre's player sizes its video on every layout, so rotating, showing the chat or entering
 * picture-in-picture checks again, and a player leaving the window gives everything back. With the switch off
 * every hook returns Twitch's own value.
 */
@SuppressWarnings("unused")
public final class TwitchFillScreen {
    static final String KEY = "fill_screen";
    /** WindowInsets.Type.displayCutout() (and WindowInsetsCompat's), a bit of the insets type masks. */
    static final int CUTOUT = 1 << 7;
    /** Twitch's sizing when a video's size isn't known yet is its 16:9 default. */
    private static final float DEFAULT_ASPECT = 16f / 9f;
    /** A player counts as covering the screen at this share of the space beside the cutout. */
    private static final float COVER = 0.9f;
    /** Bars narrower than this share of the width aren't worth a crop. */
    private static final float SLACK = 1.01f;

    /** What each player that qualified took, by player view. */
    private static final Map<View, Claim> CLAIMS = new WeakHashMap<>();
    /** Player views with a detach listener. */
    private static final Map<View, Boolean> WATCHED = new WeakHashMap<>();
    /** Views Twitch pads with the window insets, cutout included, from its own insets listener. */
    private static final Map<View, Boolean> PADDED = new WeakHashMap<>();
    private static int presenterId = -1;

    private TwitchFillScreen() {
    }

    // ---------------------------------------------------------------------------------------------
    // Hooks

    /**
     * Injection point: the start of the native player view delegate's video sizing (every layout of the
     * player), with the delegate's root view and the video's width and height (0 while unknown). Twitch goes on
     * to fit its video container into the player; a player that qualifies has the video inside that container
     * scaled up to cover the player once the layout is done. The container itself keeps Twitch's size, so
     * whatever Twitch reads from it (the picture-in-picture window's shape, for one) stays as it was.
     * Main thread.
     */
    public static void measure(View player, int videoWidth, int videoHeight) {
        if (player == null || CLAIMS.isEmpty() && !Settings.isEnabled(KEY)) return;
        try {
            float video = videoWidth > 0 && videoHeight > 0 ? (float) videoWidth / videoHeight : DEFAULT_ASPECT;
            boolean edge = Settings.isEnabled(KEY) && qualifies(player, video, true);
            update(player, edge);
            Claim claim = CLAIMS.get(player);
            if (claim != null) claim.crop = sideBars(player.getWidth(), player.getHeight(), video);
        } catch (RuntimeException e) {
            Logger.d("fill screen: " + e);
        }
    }

    /**
     * Injection point: the React Native player's surface sizing for its player view (Twitch's newer theatre),
     * with the surface's view, the IVS resize mode, the player's size and the video's width / height. For a
     * player that qualifies, FIT becomes ZOOM. Main thread.
     */
    public static Object surfaceResizeMode(View surface, Object mode, int width, int height, float video) {
        if (surface == null || !(mode instanceof Enum) || CLAIMS.isEmpty() && !Settings.isEnabled(KEY)) return mode;
        try {
            ViewParent parent = surface.getParent();
            View player = parent instanceof View ? (View) parent : surface;
            boolean edge = Settings.isEnabled(KEY) && video > 0 && qualifies(player, video, false);
            update(player, edge);
            if (edge && "FIT".equals(((Enum<?>) mode).name()) && sideBars(width, height, video)) {
                return constant((Enum<?>) mode, "ZOOM");
            }
        } catch (RuntimeException e) {
            Logger.d("fill screen: " + e);
        }
        return mode;
    }

    /**
     * Injection point: Twitch's insets listener for its full-screen containers, with the view it pads and the
     * insets types it pads by (system bars, keyboard and cutout). For the container of a player that
     * qualifies, the cutout is left out. Main thread.
     */
    public static int insetTypes(View container, int types) {
        if (container == null || (types & CUTOUT) == 0) return types;
        PADDED.put(container, Boolean.TRUE);
        Claim claim = claimOf(container);
        if (claim == null) return types;
        schedule(claim, container);
        return types & ~CUTOUT;
    }

    // ---------------------------------------------------------------------------------------------
    // Decisions

    /**
     * Whether {@code player} should use the whole screen: landscape, outside picture-in-picture, a video wider
     * than tall, in the theatre (native players) and covering the screen apart from the cutout.
     */
    static boolean qualifies(View player, float video, boolean theatre) {
        if (video <= 1f || !player.isAttachedToWindow() || player.getWidth() <= 0 || player.getHeight() <= 0) {
            return false;
        }
        if (player.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE) return false;
        Activity activity = activity(player.getContext());
        if (activity != null && activity.isInPictureInPictureMode()) return false;
        if (theatre && presenter(player) == null) return false;
        View screen = player.getRootView();
        int[] cut = cutout(screen);
        float width = screen.getWidth() - cut[0] - cut[2];
        float height = screen.getHeight() - cut[1] - cut[3];
        return player.getWidth() >= width * COVER && player.getHeight() >= height * COVER;
    }

    /** Whether a video of aspect {@code video}, fitted into width x height, leaves bars at its sides. */
    static boolean sideBars(int width, int height, float video) {
        return width > 0 && height > 0 && video > 1f && (float) width / height > video * SLACK;
    }

    // ---------------------------------------------------------------------------------------------
    // Claims

    /** What a qualifying player changed, to give back when it stops qualifying. */
    private static final class Claim {
        final WeakReference<View> player;
        WeakReference<View> container = new WeakReference<>(null);
        WeakReference<Window> window = new WeakReference<>(null);
        /** The window's cutout mode before Lurk changed it, -1 while unchanged. */
        int windowMode = -1;
        /** Views beside the video Lurk padded: {their own padding, the padding Lurk gave them}. */
        final Map<View, int[][]> insets = new WeakHashMap<>();
        /** Whether the video leaves bars at the player's sides, so it's scaled up to cover the player. */
        boolean crop;
        /** The player Lurk stopped clipping its children (the video container), with whether it did before. */
        WeakReference<View> unclipped = new WeakReference<>(null);
        boolean clipped;
        /** The surfaces Lurk scaled, with the scale Lurk gave them. */
        final Map<View, Float> scaled = new WeakHashMap<>();
        /** The theatre's content around a native player, null for other players. */
        final WeakReference<View> presenter;
        /** Checks the views beside the video again whenever the theatre is laid out. */
        final View.OnLayoutChangeListener relayout = (view, l, t, r, b, ol, ot, or, ob) -> schedule(this, view);
        boolean pending;

        Claim(View player) {
            this.player = new WeakReference<>(player);
            View theatre = presenter(player);
            presenter = new WeakReference<>(theatre);
            if (theatre != null) theatre.addOnLayoutChangeListener(relayout);
        }

        boolean live() {
            View view = player.get();
            return view != null && view.isAttachedToWindow() && CLAIMS.get(view) == this;
        }
    }

    private static void update(View player, boolean edge) {
        Claim claim = CLAIMS.get(player);
        if (!edge) {
            if (claim != null) release(player, claim);
            return;
        }
        if (claim == null) {
            claim = new Claim(player);
            CLAIMS.put(player, claim);
            watch(player);
            window(player, claim);
            Logger.d("fill screen: on for a player " + player.getWidth() + "x" + player.getHeight());
        }
        if (claim.container.get() == null) {
            View container = container(player);
            if (container != null) {
                claim.container = new WeakReference<>(container);
                container.post(container::requestApplyInsets);
            }
        }
        schedule(claim, player);
    }

    /** Runs {@link #inset(Claim)} once after the current layout, however often it's asked for meanwhile. */
    private static void schedule(Claim claim, View view) {
        if (claim.pending) return;
        claim.pending = true;
        view.post(() -> inset(claim));
    }

    private static void release(View player, Claim claim) {
        CLAIMS.remove(player);
        Window window = claim.window.get();
        if (window != null && claim.windowMode >= 0) {
            WindowManager.LayoutParams attributes = window.getAttributes();
            if (attributes.layoutInDisplayCutoutMode == WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES) {
                attributes.layoutInDisplayCutoutMode = claim.windowMode;
                window.setAttributes(attributes);
            }
        }
        claim.windowMode = -1;
        inset(claim);
        View container = claim.container.get();
        if (container != null && !held(container)) container.post(container::requestApplyInsets);
        Logger.d("fill screen: off for a player");
    }

    /** The live claim on {@code container}; claims on it whose player left the window are released. */
    private static Claim claimOf(View container) {
        Claim found = null;
        for (Map.Entry<View, Claim> entry : new ArrayList<>(CLAIMS.entrySet())) {
            Claim claim = entry.getValue();
            if (claim.container.get() != container) continue;
            if (claim.live()) {
                found = claim;
            } else {
                release(entry.getKey(), claim);
            }
        }
        return found;
    }

    /** Whether a live claim still holds {@code container}. */
    private static boolean held(View container) {
        for (Claim claim : CLAIMS.values()) {
            if (claim.container.get() == container && claim.live()) return true;
        }
        return false;
    }

    /** Gives back what a player took when it leaves the window (the theatre closes). */
    private static void watch(View player) {
        if (WATCHED.containsKey(player)) return;
        WATCHED.put(player, Boolean.TRUE);
        player.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
                Claim claim = CLAIMS.get(view);
                if (claim != null) release(view, claim);
            }
        });
    }

    /** Android 10: lets the window into the cutout area, which Twitch only asks for from Android 11. */
    private static void window(View player, Claim claim) {
        Activity activity = activity(player.getContext());
        Window window = activity != null ? activity.getWindow() : null;
        if (window == null) return;
        WindowManager.LayoutParams attributes = window.getAttributes();
        int mode = attributes.layoutInDisplayCutoutMode;
        if (mode != WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT
                && mode != WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_NEVER) {
            return;
        }
        for (Claim other : CLAIMS.values()) {
            if (other != claim && other.window.get() == window && other.windowMode >= 0) return;
        }
        claim.window = new WeakReference<>(window);
        claim.windowMode = mode;
        attributes.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
        window.setAttributes(attributes);
    }

    // ---------------------------------------------------------------------------------------------
    // Keeping the rest of the theatre clear of the cutout

    /**
     * While a claim is live, pads each view of the native theatre beside the video (at every level from the
     * video's surface up to the theatre's content) by as far as it reaches into the cutout's strip, so only the
     * video uses the strip: the controls, chat over the video and the stream's details stay where Twitch put
     * them. Views clear of the strip are left alone. Once the claim ends, each view gets its own padding back,
     * unless Twitch changed it in the meantime.
     */
    private static void inset(Claim claim) {
        claim.pending = false;
        View presenter = claim.presenter.get();
        if (!claim.live()) {
            for (Map.Entry<View, int[][]> entry : new ArrayList<>(claim.insets.entrySet())) {
                int[][] saved = entry.getValue();
                if (padding(entry.getKey(), saved[1])) set(entry.getKey(), saved[0]);
            }
            claim.insets.clear();
            zoom(claim, null, 1f);
            if (presenter != null) presenter.removeOnLayoutChangeListener(claim.relayout);
            return;
        }
        View player = claim.player.get();
        if (presenter == null || player == null) return;
        View branch = surfaceBranch(player);
        zoom(claim, branch, claim.crop && branch != player && branch.getWidth() > 0 && branch.getHeight() > 0
                ? Math.max(1f, Math.max((float) player.getWidth() / branch.getWidth(),
                (float) player.getHeight() / branch.getHeight())) : 1f);
        View screen = presenter.getRootView();
        int[] cut = cutout(screen);
        int[] at = new int[2];
        for (View child = branch; child != presenter && child.getParent() instanceof ViewGroup; ) {
            ViewGroup parent = (ViewGroup) child.getParent();
            for (int i = 0; i < parent.getChildCount(); i++) {
                View sibling = parent.getChildAt(i);
                if (sibling == child || sibling.getVisibility() != View.VISIBLE || sibling.getWidth() == 0
                        || sibling.getHeight() == 0) {
                    continue;
                }
                sibling.getLocationInWindow(at);
                int[] reach = {
                        into(cut[0], cut[0] - at[0]),
                        into(cut[1], cut[1] - at[1]),
                        into(cut[2], at[0] + sibling.getWidth() - (screen.getWidth() - cut[2])),
                        into(cut[3], at[1] + sibling.getHeight() - (screen.getHeight() - cut[3])),
                };
                inset(claim, sibling, reach);
            }
            child = parent;
        }
    }

    /**
     * Scales the video's surfaces inside Twitch's video container by {@code scale}. The player (the
     * container's parent) stops clipping its children to their bounds, so the container shows the surfaces past
     * its own, and the player's parent still clips them to the player. The container keeps the size Twitch
     * fitted it to. A scale of 1 (or no container) gives Twitch's own back: the surfaces Lurk scaled go back to
     * 1 unless something else scaled them since, and the player clips again if it did before.
     */
    private static void zoom(Claim claim, View container, float scale) {
        View previous = claim.unclipped.get();
        ViewParent parent = container != null ? container.getParent() : null;
        boolean zoom = scale > 1f && container instanceof ViewGroup && parent instanceof ViewGroup;
        if (!zoom || previous != null && previous != parent) {
            for (Map.Entry<View, Float> entry : new ArrayList<>(claim.scaled.entrySet())) {
                View surface = entry.getKey();
                float given = entry.getValue();
                if (surface.getScaleX() == given && surface.getScaleY() == given) {
                    surface.setScaleX(1f);
                    surface.setScaleY(1f);
                }
            }
            claim.scaled.clear();
            if (previous instanceof ViewGroup) ((ViewGroup) previous).setClipChildren(claim.clipped);
            claim.unclipped = new WeakReference<>(null);
            if (!zoom) return;
        }
        ViewGroup player = (ViewGroup) parent;
        if (claim.unclipped.get() == null) {
            claim.clipped = player.getClipChildren();
            claim.unclipped = new WeakReference<>(player);
        }
        if (player.getClipChildren()) player.setClipChildren(false);
        ViewGroup group = (ViewGroup) container;
        for (int i = 0; i < group.getChildCount(); i++) {
            View surface = group.getChildAt(i);
            if (surface.getScaleX() != scale || surface.getScaleY() != scale) {
                surface.setScaleX(scale);
                surface.setScaleY(scale);
            }
            claim.scaled.put(surface, scale);
        }
    }

    /** How far a view reaches into a strip {@code strip} wide, by {@code overlap}: 0 to the strip's width. */
    static int into(int strip, int overlap) {
        return strip <= 0 ? 0 : Math.max(0, Math.min(strip, overlap));
    }

    private static void inset(Claim claim, View view, int[] extra) {
        int[][] saved = claim.insets.get(view);
        int[] current = padding(view);
        if (saved == null || !padding(view, saved[1])) {
            // First time, or Twitch set its own padding since: that is the view's padding now.
            saved = new int[][]{current, null};
            claim.insets.put(view, saved);
        }
        int[] own = saved[0];
        int[] wanted = {own[0] + extra[0], own[1] + extra[1], own[2] + extra[2], own[3] + extra[3]};
        saved[1] = wanted;
        if (!padding(view, wanted)) set(view, wanted);
    }

    /** The child of {@code player} that holds the video's surface, or the player when there is none yet. */
    private static View surfaceBranch(View player) {
        if (!(player instanceof ViewGroup)) return player;
        ViewGroup group = (ViewGroup) player;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (holdsSurface(child, 3)) return child;
        }
        return player;
    }

    private static boolean holdsSurface(View view, int depth) {
        if (view instanceof TextureView || view instanceof SurfaceView) return true;
        if (depth == 0 || !(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (holdsSurface(group.getChildAt(i), depth - 1)) return true;
        }
        return false;
    }

    // ---------------------------------------------------------------------------------------------
    // Views

    /** The nearest ancestor Twitch pads by the insets, cutout included. */
    private static View container(View player) {
        for (ViewParent parent = player.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (PADDED.containsKey(parent)) return (View) parent;
        }
        return null;
    }

    /** The theatre's content around a native player (live and video), null outside the theatre. */
    private static View presenter(View player) {
        if (presenterId == -1) {
            Context context = player.getContext();
            presenterId = context.getResources().getIdentifier("video_presenter_container", "id", context.getPackageName());
        }
        if (presenterId == 0) return null;
        for (ViewParent parent = player.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (((View) parent).getId() == presenterId) return (View) parent;
        }
        return null;
    }

    /** The display cutout's safe insets (left, top, right, bottom) for {@code view}'s window, zeros without. */
    private static int[] cutout(View view) {
        WindowInsets insets = view.getRootWindowInsets();
        DisplayCutout cutout = insets != null ? insets.getDisplayCutout() : null;
        if (cutout == null) return new int[4];
        return new int[]{cutout.getSafeInsetLeft(), cutout.getSafeInsetTop(), cutout.getSafeInsetRight(),
                cutout.getSafeInsetBottom()};
    }

    private static int[] padding(View view) {
        return new int[]{view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), view.getPaddingBottom()};
    }

    private static boolean padding(View view, int[] padding) {
        return padding != null && view.getPaddingLeft() == padding[0] && view.getPaddingTop() == padding[1]
                && view.getPaddingRight() == padding[2] && view.getPaddingBottom() == padding[3];
    }

    private static void set(View view, int[] padding) {
        view.setPadding(padding[0], padding[1], padding[2], padding[3]);
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Object constant(Enum<?> sibling, String name) {
        try {
            return Enum.valueOf((Class) sibling.getDeclaringClass(), name);
        } catch (IllegalArgumentException e) {
            return sibling;
        }
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
