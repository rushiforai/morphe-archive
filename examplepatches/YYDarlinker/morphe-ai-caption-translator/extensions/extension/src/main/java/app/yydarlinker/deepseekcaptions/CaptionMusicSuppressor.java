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
    private static final long INITIAL_NATIVE_SCAN_MS = 180L;
    private static final long FALLBACK_NATIVE_SCAN_MS = 1_500L;
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
    private static boolean nativeScanSuspended;
    private static long nativeSearchStartedAtMs;
    private static long nextNativeScanAtMs;
    private static boolean nativeNotFoundLogged;

    private static final Runnable TICK = () -> {
        posted = false;
        if (!DynamicCaptionController.isVisibleActive()) {
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
        if (!DynamicCaptionController.isVisibleActive() && maskedRenderers.isEmpty()) return;
        posted = true;
        MAIN.postDelayed(TICK, TICK_MS);
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
        if (DynamicCaptionController.isVisibleActive()) kick();
    }

    /** Keep new View-tree searches out of YouTube's animation-critical player transition window. */
    static void beginNativeRendererTransition() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(CaptionMusicSuppressor::beginNativeRendererTransition);
            return;
        }
        nativeScanSuspended = true;
    }

    /** Resume renderer discovery only after the existing read-only geometry guard declares stable. */
    static void endNativeRendererTransition() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(CaptionMusicSuppressor::endNativeRendererTransition);
            return;
        }
        nativeScanSuspended = false;
        forceNativeRescan = true;
        nextNativeScanAtMs = 0L;
        nativeNotFoundLogged = false;
        if (DynamicCaptionController.isVisibleActive()) kick();
    }

    private static void sanitize() {
        if(!CaptionChoice.translates()) return; // Source tracks keep their original annotations.
        Activity activity = activityRef.get();
        if (activity == null || !prepare()) return;
        try {
            if (statusField.getBoolean(null)) return;
            Object value = textField.get(null);
            String text = value instanceof String ? ((String) value).trim() : "";
            if (text.isEmpty()) return;
            String clean = SentenceBoundaryUtil.stripMusicAnnotations(text);
            if (clean.equals(text)) return;
            if (clean.isEmpty()) {
                CaptionOverlay.hide();
            } else {
                textField.set(null, clean);
                CaptionOverlay.refreshStyle(activity);
            }
        } catch (Throwable ignored) {
            ready = false;
        }
    }

    /**
     * Keep already-found subtitle windows transparent. Only if no attached renderer is known do we
     * run a bounded search, reusing the existing 40 ms maintenance tick rather than adding another
     * polling loop. The fast scan exists only during initial AI takeover; after a miss it backs off
     * to 1.5 s, minimizing work during player animations.
     */
    private static void maskNativeRenderer() {
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing()) return;

        if (nativeScanSuspended) {
            // Do not traverse the player tree while YouTube is animating. A renderer already owned
            // by this class may still be kept transparent with one cheap property write.
            keepKnownRenderersMasked();
            return;
        }

        boolean forced = forceNativeRescan;
        forceNativeRescan = false;
        boolean knownAttached = keepKnownRenderersMasked();
        if (knownAttached && !forced) return;

        long now = SystemClock.uptimeMillis();
        if (nativeSearchStartedAtMs == 0L) nativeSearchStartedAtMs = now;
        if (!forced && now < nextNativeScanAtMs) return;

        long age = now - nativeSearchStartedAtMs;
        nextNativeScanAtMs = now +
                (age <= NATIVE_NOT_FOUND_LOG_MS ? INITIAL_NATIVE_SCAN_MS : FALLBACK_NATIVE_SCAN_MS);

        boolean found = scanPlayerRoots(activity);
        if (!found && age >= 700L) {
            // Current YouTube builds normally keep SubtitleWindowView under the player overlay. The
            // one-time broader fallback only accepts a strict player-subtitles class identity.
            View decor = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
            found = scanTree(activity, decor, false);
        }

        if (found || knownAttached) {
            nativeNotFoundLogged = false;
            return;
        }

        if (!nativeNotFoundLogged && age >= NATIVE_NOT_FOUND_LOG_MS) {
            nativeNotFoundLogged = true;
            CaptionDiagnostics.mark(
                    activity,
                    "NATIVE_RENDERER_VIEW_NOT_FOUND",
                    "TimedText 已被不可见化，但当前播放器未发现可直接隐藏的 YouTube 原生字幕窗口"
            );
        }
    }

    private static boolean keepKnownRenderersMasked() {
        boolean attached = false;
        Iterator<Map.Entry<View, Float>> iterator = maskedRenderers.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<View, Float> entry = iterator.next();
            View view = entry.getKey();
            if (view == null || !view.isAttachedToWindow()) {
                iterator.remove();
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
        if (view == null || !view.isAttachedToWindow() || view.getAlpha() <= 0.01f) return false;
        Object tag = view.getTag();
        if (tag != null && tag.toString().startsWith("yydarlinker.deepseek.caption")) return false;

        Class<?> type = view.getClass();
        while (type != null && type != Object.class) {
            String name = type.getName().toLowerCase(Locale.ROOT);
            if (name.equals(LEGACY_SUBTITLE_WINDOW) ||
                    name.contains(".youtube.player.subtitles.") ||
                    name.endsWith(".subtitlewindowview")) {
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
        // Only take ownership of a renderer that YouTube itself currently considers drawable. This
        // ensures native-track restoration never inherits an alpha that was already zero.
        if (originalAlpha <= 0.01f) return;
        maskedRenderers.put(view, originalAlpha);
        view.setAlpha(0f);
        CaptionDiagnostics.mark(
                activity,
                "NATIVE_RENDERER_VIEW_MASKED",
                "已直接隐藏 YouTube 原生字幕绘制窗口；class=" + view.getClass().getName()
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
            if (view == null || alpha == null || !view.isAttachedToWindow()) continue;
            try { view.setAlpha(alpha); } catch (Throwable ignored) {}
        }
        maskedRenderers.clear();
        resetNativeSearch();
    }

    private static void resetNativeSearch() {
        forceNativeRescan = false;
        nativeScanSuspended = false;
        nativeSearchStartedAtMs = 0L;
        nextNativeScanAtMs = 0L;
        nativeNotFoundLogged = false;
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
