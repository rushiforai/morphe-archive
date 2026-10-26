package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Masks YouTube's own subtitle renderer while the AI overlay owns caption display. Replacing the
 * timed-text response alone is not enough on some renderer states: the native subtitle window view
 * keeps drawing source captions it already holds. Making that view transparent leaves YouTube's
 * logical CC state and long-press menu untouched, so an explicit native track selection stays
 * authoritative.
 *
 * <p>Known windows are kept transparent by a 40 ms tick. Looking for new ones happens only after an
 * explicit recovery signal or on a bounded, slowing back-off, and never dumps the view tree.
 */
final class CaptionMusicSuppressor {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long TICK_MS = 40L;
    private static final long INITIAL_SCAN_MS = 320L;
    private static final long FALLBACK_SCAN_MS = 5_000L;
    private static final int MAX_SCAN_VIEWS = 1_200;

    private static final String[] RENDERER_CLASS_SUFFIXES = {
        "subtitlewindowview", "captionwindowview", "subtitlesview"
    };

    /** The hidden windows with the alpha they had, to restore them when we stop owning captions. */
    private static final WeakHashMap<View, Float> masked = new WeakHashMap<>();

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static boolean posted, forceRescan, discoveryPaused, notFoundLogged;
    private static long nextScanAtMs;
    private static int misses;
    static long scanCount;
    private static long scanNanos;

    private static final Runnable TICK =
            () -> {
                posted = false;
                if (!CaptionActions.ownsNativeTrack()) {
                    restoreRenderers();
                    return;
                }
                if (!mayDiscover()) {
                    keepKnownMasked();
                    return;
                }
                maskNativeRenderer();
                kick();
            };

    private CaptionMusicSuppressor() {}

    static void pauseDiscoveryForPlayerTransition(boolean paused) {
        discoveryPaused = paused;
    }

    static void setActivity(Activity activity) {
        restoreRenderers();
        activityRef = new WeakReference<>(activity);
        resetSearch();
    }

    /** Runs [again] on the main thread instead; true when the caller must return. */
    private static boolean toMain(Runnable again) {
        if (Looper.myLooper() == Looper.getMainLooper()) return false;
        MAIN.post(again);
        return true;
    }

    static void kick() {
        if (toMain(CaptionMusicSuppressor::kick) || posted) return;
        if (!CaptionActions.ownsNativeTrack() && masked.isEmpty()) return;
        posted = true;
        MAIN.postDelayed(TICK, TICK_MS);
    }

    /** A player transition only marks recovery; the existing tick performs it. */
    static void requestNativeRendererScanAfterTransition() {
        if (toMain(CaptionMusicSuppressor::requestNativeRendererScanAfterTransition)) return;
        // An attached native window is already covered by the draw hook and the known-view mask.
        if (!keepKnownMasked()) forceRescan = true;
        kick();
    }

    /** Forces one fresh player-local lookup after a video or player rebuild; adds no loop. */
    static void forceNativeRendererScan() {
        if (toMain(CaptionMusicSuppressor::forceNativeRendererScan)) return;
        forceRescan = true;
        nextScanAtMs = 0L;
        notFoundLogged = false;
        if (CaptionActions.ownsNativeTrack()) {
            maskNativeRenderer();
            kick();
        }
    }

    /** Keeps known windows hidden while discovery continues at its bounded cadence. */
    static void beginNativeRendererTransition() {
        if (!toMain(CaptionMusicSuppressor::beginNativeRendererTransition)) keepKnownMasked();
    }

    /** Reapplies immediately once the geometry guard declares the rebuilt player stable. */
    static void endNativeRendererTransition() {
        if (toMain(CaptionMusicSuppressor::endNativeRendererTransition)) return;
        discoveryPaused = false;
        // Detached views can be rediscovered by the bounded fallback tick.
        keepKnownMasked();
        if (CaptionActions.ownsNativeTrack()) kick();
    }

    private static void maskNativeRenderer() {
        if (!mayDiscover()) return;
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing()) return;
        boolean knownAttached = keepKnownMasked();
        long now = SystemClock.uptimeMillis();
        if (discoveryPaused || (!forceRescan && knownAttached) || now < nextScanAtMs) return;
        boolean forced = forceRescan;
        forceRescan = false;

        long started = System.nanoTime();
        boolean found = scanPlayerRoots(activity);
        if (!found && forced) {
            // Explicit initial or rebuild recovery only; a miss never repeats a full-decor scan.
            found = scanTree(activity, decorOf(activity), true);
        }
        scanCount++;
        scanNanos += System.nanoTime() - started;
        if (forced || misses == 0)
            CaptionDiagnostics.mark(
                    activity,
                    "NATIVE_RENDERER_SCAN_SUMMARY",
                    "scan_count="
                            + scanCount
                            + ";scan_total_us="
                            + scanNanos / 1000
                            + ";found="
                            + found);
        if (found) {
            misses = 0;
            notFoundLogged = false;
            nextScanAtMs = now + FALLBACK_SCAN_MS;
            return;
        }
        misses++;
        long backoff =
                Math.min(FALLBACK_SCAN_MS, INITIAL_SCAN_MS * (1L << Math.min(4, misses - 1)));
        nextScanAtMs = now + backoff;
        if (!notFoundLogged) {
            notFoundLogged = true;
            CaptionDiagnostics.mark(
                    activity,
                    "NATIVE_RENDERER_VIEW_NOT_FOUND",
                    "reason=player_local_renderer_absent;retry_backoff_ms=" + backoff);
        }
    }

    /** The native draw hook remains active; auxiliary tree discovery waits for a settled player. */
    private static boolean mayDiscover() {
        return CaptionPlayerAuthority.displayPermitted()
                && !CaptionPlayerAuthority.playerType().contains("SLIDING");
    }

    private static View decorOf(Activity activity) {
        return activity.getWindow() == null ? null : activity.getWindow().getDecorView();
    }

    /** Keeps the known windows transparent; forgets (and restores) the detached ones. */
    private static boolean keepKnownMasked() {
        boolean attached = false;
        Iterator<Map.Entry<View, Float>> iterator = masked.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<View, Float> entry = iterator.next();
            View view = entry.getKey();
            if (view == null || !view.isAttachedToWindow()) {
                if (view != null) view.setAlpha(entry.getValue());
                iterator.remove();
                forceRescan = true;
                nextScanAtMs = 0L;
            } else {
                attached = true;
                if (view.getAlpha() != 0f) view.setAlpha(0f);
            }
        }
        return attached;
    }

    private static boolean scanPlayerRoots(Activity activity) {
        View decor = decorOf(activity);
        if (decor == null) return false;
        boolean found = false;
        WeakHashMap<View, Boolean> visited = new WeakHashMap<>();
        for (String name : CaptionSurface.PLAYER_IDS) {
            int id;
            try {
                id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
            } catch (Throwable ignored) {
                continue;
            }
            View root = id == 0 ? null : decor.findViewById(id);
            if (root != null && visited.put(root, Boolean.TRUE) == null)
                found |= scanTree(activity, root, true);
        }
        return found;
    }

    /**
     * Masks the renderers found breadth first under [root], looking at a bounded number of views.
     */
    private static boolean scanTree(Activity activity, View root, boolean playerLocal) {
        if (root == null) return false;
        ArrayDeque<View> pending = new ArrayDeque<>();
        pending.add(root);
        int seen = 0;
        boolean found = false;
        while (!pending.isEmpty() && seen++ < MAX_SCAN_VIEWS) {
            View view = pending.removeFirst();
            if (isNativeSubtitleRenderer(activity, view, playerLocal)) {
                maskRenderer(activity, view);
                found = true; // The container owns its caption children; do not walk them.
            } else if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View child = group.getChildAt(i);
                    if (child != null) pending.addLast(child);
                }
            }
        }
        return found;
    }

    private static boolean isNativeSubtitleRenderer(
            Activity activity, View view, boolean playerLocal) {
        if (view == null || !view.isAttachedToWindow()) return false;
        Object tag = view.getTag();
        if (tag != null && tag.toString().startsWith("yydarlinker.deepseek.caption")) return false;
        for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass())
            if (isRendererClass(type.getName().toLowerCase(Locale.ROOT))) return true;
        if (!playerLocal || !(view instanceof ViewGroup) || view.isClickable()) return false;
        int id = view.getId();
        if (id == View.NO_ID) return false;
        try {
            String entry =
                    activity.getResources().getResourceEntryName(id).toLowerCase(Locale.ROOT);
            if (entry.contains("button") || entry.contains("menu") || entry.contains("settings"))
                return false;
            return entry.contains("subtitle_window")
                    || entry.contains("caption_window")
                    || (entry.contains("subtitle")
                            && (entry.contains("overlay") || entry.contains("container")));
        } catch (Throwable noName) {
            return false;
        }
    }

    private static boolean isRendererClass(String name) {
        if (name.contains(".youtube.player.subtitles.")) return true;
        for (String suffix : RENDERER_CLASS_SUFFIXES) if (name.endsWith(suffix)) return true;
        return false;
    }

    private static void maskRenderer(Activity activity, View view) {
        if (!masked.containsKey(view)) {
            masked.put(view, view.getAlpha());
            CaptionDiagnostics.mark(
                    activity,
                    "NATIVE_RENDERER_VIEW_MASKED",
                    "YouTube native caption window hidden directly;class="
                            + view.getClass().getName());
        }
        if (view.getAlpha() != 0f) view.setAlpha(0f);
    }

    private static void restoreRenderers() {
        for (Map.Entry<View, Float> entry : masked.entrySet()) {
            View view = entry.getKey();
            if (view == null || entry.getValue() == null) continue;
            try {
                view.setAlpha(entry.getValue());
            } catch (Throwable ignored) {
                // The view is being torn down; it needs no restoring.
            }
        }
        masked.clear();
        resetSearch();
    }

    private static void resetSearch() {
        forceRescan = false;
        nextScanAtMs = 0L;
        notFoundLogged = false;
        discoveryPaused = false;
        misses = 0;
    }
}
