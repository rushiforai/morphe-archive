package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Keeps the final AI overlay clean without changing translation semantics.
 *
 * <p>Besides stripping non-speech music labels, this class masks YouTube's dedicated native
 * subtitle renderer while the custom AI overlay owns caption display. dev30/dev31 proved that
 * replacing Timed Text responses alone is insufficient on some renderer states: the native
 * SubtitleWindowView can keep drawing already-held source captions even after its network track
 * has been replaced by an invisible document. Hiding the renderer View leaves YouTube's logical
 * CC state and long-press menu untouched, so explicit native-track selection remains authoritative.</p>
 */
final class CaptionMusicSuppressor {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long TICK_MS = 40L;
    private static final long INITIAL_NATIVE_SCAN_MS = 320L;
    private static final long FALLBACK_NATIVE_SCAN_MS = 5_000L;
    private static final long NATIVE_NOT_FOUND_LOG_MS = 1_800L;
    private static final int MAX_NATIVE_SCAN_VIEWS = 1_200;
    private static final String[] PLAYER_IDS = {
            "inset_overlay_view_layout", "player_overlays", "player_overlay", "watch_player"
    };
    private static final String LEGACY_SUBTITLE_WINDOW =
            "com.google.android.libraries.youtube.player.subtitles.ui.subtitlewindowview";

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static final WeakHashMap<View, Float> maskedRenderers = new WeakHashMap<>();
    private static Field textField;
    private static Field statusField;
    private static boolean ready;
    private static boolean posted;
    private static boolean forceNativeRescan;
    private static long nativeSearchStartedAtMs;
    private static long nextNativeScanAtMs;
    private static boolean nativeNotFoundLogged;
    private static boolean discoveryPaused, debugTreeRequested;
    private static int misses;
    static long scanCount, scanNanos, treeSummaryCount;

    static void pauseDiscoveryForPlayerTransition(boolean paused) { discoveryPaused=paused; }
    /** Detailed evidence is opt-in, never exported on every missing-view tick. */
    static void sampleNativeRendererTree() { debugTreeRequested=true; forceNativeRendererScan(); }

    private static final Runnable TICK = () -> {
        posted = false;
        if (!RebuildController.ownsNativeTrack()) {
            restoreNativeRenderers();
            return;
        }
        sanitize();
        maskNativeRenderer();
        kick();
    };

    private CaptionMusicSuppressor() {}

    static void setActivity(Activity activity) {
        restoreNativeRenderers();
        activityRef = new WeakReference<>(activity);
        ready = false;
        resetNativeSearch();
    }

    static void kick() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(CaptionMusicSuppressor::kick);
            return;
        }
        if (posted) return;
        if (!RebuildController.ownsNativeTrack() && maskedRenderers.isEmpty()) return;
        posted = true;
        MAIN.postDelayed(TICK, TICK_MS);
    }

    /** The real HookV2 transition callback only marks recovery; the existing tick performs it. */
    static void requestNativeRendererScanAfterTransition() {
        if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(CaptionMusicSuppressor::requestNativeRendererScanAfterTransition);return;}
        // An attached native window is already covered by the draw hook and known-view mask.
        if(!keepKnownRenderersMasked())forceNativeRescan=true;
        // Do not restart miss backoff for duplicate types or emit another missing-view summary.
        kick();
    }

    /** Force one fresh player-local lookup after a video/player rebuild without adding a new loop. */
    static void forceNativeRendererScan() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(CaptionMusicSuppressor::forceNativeRendererScan);
            return;
        }
        forceNativeRescan = true;
        nextNativeScanAtMs = 0L;
        nativeNotFoundLogged = false;
        if (RebuildController.ownsNativeTrack()) { maskNativeRenderer(); kick(); }
    }

    /** Keep known windows hidden while discovery continues at its bounded cadence. */
    static void beginNativeRendererTransition() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(CaptionMusicSuppressor::beginNativeRendererTransition);
            return;
        }
        keepKnownRenderersMasked();
    }

    /** Reapply immediately after the geometry guard declares the rebuilt player stable. */
    static void endNativeRendererTransition() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(CaptionMusicSuppressor::endNativeRendererTransition);
            return;
        }
        discoveryPaused=false;
        // Release in constant work; detached views can be rediscovered by the bounded fallback tick.
        keepKnownRenderersMasked();
        if (RebuildController.ownsNativeTrack()) kick();
    }

    private static void sanitize() { /* Text belongs exclusively to the accepted event plan. */ }

    /**
     * Keep cached windows transparent every 40 ms. Discovery only runs after an explicit
     * recovery signal or a bounded low-frequency backoff; no tree dump is implicit.
     */
    private static void maskNativeRenderer() {
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing()) return;

        boolean knownAttached = keepKnownRenderersMasked();
        long now = SystemClock.uptimeMillis();
        if (discoveryPaused || (!forceNativeRescan && knownAttached) || now < nextNativeScanAtMs) return;
        boolean forced=forceNativeRescan; forceNativeRescan=false;
        if (nativeSearchStartedAtMs == 0L) nativeSearchStartedAtMs=now;
        long started=System.nanoTime();
        boolean found=scanPlayerRoots(activity);
        if(!found && forced) {
            // Explicit initial/rebuild recovery only; never repeated full-decor scans on a miss.
            View decor=activity.getWindow()==null?null:activity.getWindow().getDecorView();
            found=scanTree(activity,decor,true);
        }
        scanCount++;scanNanos+=System.nanoTime()-started;
        if(forced || misses==0)CaptionDiagnostics.mark(activity,"NATIVE_RENDERER_SCAN_SUMMARY",
            "scan_count="+scanCount+";scan_total_us="+(scanNanos/1000)+";tree_summary_count="+treeSummaryCount+";found="+found);
        if(found) { misses=0;nativeNotFoundLogged=false;nextNativeScanAtMs=now+FALLBACK_NATIVE_SCAN_MS; }
        else {
            misses++;
            nextNativeScanAtMs=now+Math.min(FALLBACK_NATIVE_SCAN_MS,INITIAL_NATIVE_SCAN_MS*(1L<<Math.min(4,misses-1)));
            if(!nativeNotFoundLogged) {
                nativeNotFoundLogged=true;
                CaptionDiagnostics.mark(activity,"NATIVE_RENDERER_VIEW_NOT_FOUND",
                    "reason=player_local_renderer_absent;retry_backoff_ms="+(nextNativeScanAtMs-now));
            }
        }
        if(debugTreeRequested) {
            debugTreeRequested=false;
            String summary=treeSummary(activity.getWindow()==null?null:activity.getWindow().getDecorView());
            treeSummaryCount++;
            CaptionDiagnostics.mark(activity,"NATIVE_RENDERER_VIEW_TREE","sample=explicit;"+summary);
        }
    }

    private static boolean keepKnownRenderersMasked() {
        boolean attached = false;
        Iterator<Map.Entry<View, Float>> iterator = maskedRenderers.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<View, Float> entry = iterator.next();
            View view = entry.getKey();
            if (view == null || !view.isAttachedToWindow()) {
                if (view != null) view.setAlpha(entry.getValue());
                iterator.remove();
                forceNativeRescan=true;nextNativeScanAtMs=0L;
                continue;
            }
            attached = true;
            if (view.getAlpha() != 0f) view.setAlpha(0f);
        }
        return attached;
    }

    private static boolean scanPlayerRoots(Activity activity) {
        if (activity.getWindow() == null) return false;
        View decor = activity.getWindow().getDecorView();
        if (decor == null) return false;

        boolean found = false;
        WeakHashMap<View, Boolean> visited = new WeakHashMap<>();
        for (String name : PLAYER_IDS) {
            int id;
            try {
                id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
            } catch (Throwable ignored) {
                continue;
            }
            if (id == 0) continue;
            View root = decor.findViewById(id);
            if (root == null || visited.put(root, Boolean.TRUE) != null) continue;
            found |= scanTree(activity, root, true);
        }
        return found;
    }

    private static boolean scanTree(Activity activity, View root, boolean allowPlayerLocalFallback) {
        if (root == null) return false;
        ArrayDeque<View> pending = new ArrayDeque<>();
        pending.add(root);
        int seen = 0;
        boolean found = false;

        while (!pending.isEmpty() && seen++ < MAX_NATIVE_SCAN_VIEWS) {
            View view = pending.removeFirst();
            if (isNativeSubtitleRenderer(activity, view, allowPlayerLocalFallback)) {
                maskRenderer(activity, view);
                found = true;
                // A renderer container owns all of its caption children. Do not spend time walking
                // those children after the parent itself has been made transparent.
                continue;
            }
            if (view instanceof ViewGroup) {
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
            Activity activity,
            View view,
            boolean allowPlayerLocalFallback
    ) {
        if (view == null || !view.isAttachedToWindow()) return false;
        Object tag = view.getTag();
        if (tag != null && tag.toString().startsWith("yydarlinker.deepseek.caption")) return false;

        Class<?> type = view.getClass();
        while (type != null && type != Object.class) {
            String name = type.getName().toLowerCase(Locale.ROOT);
            if (name.equals(LEGACY_SUBTITLE_WINDOW) ||
                    name.contains(".youtube.player.subtitles.") ||
                    name.endsWith("subtitlewindowview") || name.endsWith("captionwindowview")
                    || name.endsWith("subtitlesview")) {
                return true;
            }
            type = type.getSuperclass();
        }

        if (!allowPlayerLocalFallback || !(view instanceof ViewGroup) || view.isClickable()) {
            return false;
        }
        int id = view.getId();
        if (id == View.NO_ID) return false;
        try {
            String entry = activity.getResources().getResourceEntryName(id)
                    .toLowerCase(Locale.ROOT);
            if (entry.contains("button") || entry.contains("menu") || entry.contains("settings")) {
                return false;
            }
            return entry.contains("subtitle_window") || entry.contains("caption_window") ||
                    (entry.contains("subtitle") &&
                            (entry.contains("overlay") || entry.contains("container")));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void maskRenderer(Activity activity, View view) {
        CaptionSurface.nativeRenderer(view);
        if (maskedRenderers.containsKey(view)) {
            if (view.getAlpha() != 0f) view.setAlpha(0f);
            return;
        }
        float originalAlpha = view.getAlpha();
        maskedRenderers.put(view, originalAlpha);
        view.setAlpha(0f);
        CaptionDiagnostics.mark(
                activity,
                "NATIVE_RENDERER_VIEW_MASKED",
                "YouTube native caption window hidden directly;class=" + view.getClass().getName()
        );
    }

    private static void restoreNativeRenderers() {
        if (maskedRenderers.isEmpty()) {
            resetNativeSearch();
            return;
        }
        for (Map.Entry<View, Float> entry : maskedRenderers.entrySet()) {
            View view = entry.getKey();
            Float alpha = entry.getValue();
            if (view == null || alpha == null) continue;
            try { view.setAlpha(alpha); } catch (Throwable ignored) {}
        }
        maskedRenderers.clear();
        resetNativeSearch();
    }

    private static void resetNativeSearch() {
        forceNativeRescan = false;
        nativeSearchStartedAtMs = 0L;
        nextNativeScanAtMs = 0L;
        nativeNotFoundLogged = false;
        discoveryPaused=false;debugTreeRequested=false;misses=0;
    }

    private static String treeSummary(View root) {
        if (root == null) return "root=null";
        StringBuilder out = new StringBuilder();
        ArrayDeque<View> pending = new ArrayDeque<>();
        pending.add(root);
        int seen = 0;
        while (!pending.isEmpty() && seen++ < MAX_NATIVE_SCAN_VIEWS && out.length() < 16000) {
            View view = pending.removeFirst();
            out.append("parent=").append(view.getParent() == null ? "null" : view.getParent().getClass().getName())
                    .append(";child=").append(view.getClass().getName())
                    .append(";visibility=").append(view.getVisibility())
                    .append(";size=").append(view.getWidth()).append('x').append(view.getHeight()).append('\n');
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) pending.addLast(group.getChildAt(i));
            }
        }
        return out.append(";visited=").append(seen).append(";truncated=").append(!pending.isEmpty()).toString();
    }

    private static boolean prepare() {
        if (ready && textField != null && statusField != null) return true;
        try {
            textField = CaptionOverlay.class.getDeclaredField("pendingText");
            statusField = CaptionOverlay.class.getDeclaredField("pendingStatus");
            textField.setAccessible(true);
            statusField.setAccessible(true);
            ready = true;
            return true;
        } catch (Throwable ignored) {
            ready = false;
            return false;
        }
    }
}
