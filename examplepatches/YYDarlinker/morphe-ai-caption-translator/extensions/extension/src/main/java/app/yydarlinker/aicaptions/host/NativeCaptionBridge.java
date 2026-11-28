package app.yydarlinker.aicaptions.host;

import app.yydarlinker.aicaptions.CaptionUrls;
import app.yydarlinker.aicaptions.TargetLanguage;

import androidx.annotation.Nullable;

import android.view.View;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.WeakHashMap;

/** One committed selection per visit and a bounded handoff for an early native model. */
public final class NativeCaptionBridge {
    public static final int UNKNOWN = -1, OFF = 0, ON = 1;
    private static final String DISABLE = "DISABLE_CAPTIONS_OPTION";
    private static final String AUTO_TRANSLATE = "AUTO_TRANSLATE_CAPTIONS_OPTION";
    private static final LinkedHashMap<String, Selection> pending = new LinkedHashMap<>();
    private static final WeakHashMap<View, Boolean> renderers = new WeakHashMap<>();
    private static volatile Selection current;
    private static volatile int ccState = UNKNOWN;
    private static String foreground = "";
    private static long revision;
    private static boolean readingCatalog;

    private NativeCaptionBridge() {}

    static final class Selection {
        final String url, target;
        final boolean translated, off, explicit;
        final long revision;
        final WeakReference<Object> manager;

        Selection(Object owner, String url, TargetLanguage target, boolean translated,
                boolean off, boolean explicit, long revision) {
            manager = new WeakReference<>(owner);
            this.url = url;
            this.target = target == null ? "" : target.code;
            this.translated = translated;
            this.off = off;
            this.explicit = explicit;
            this.revision = revision;
        }
    }

    public static int ccState() { return ccState; }
    public static void setCc(int state) { ccState = state; }

    static Selection selection() {
        Selection selected = current;
        return selected == null || selected.off || selected.target.isEmpty() ? null : selected;
    }

    static void clearVisit() {
        foreground = "";
        current = null;
        ccState = UNKNOWN;
        pending.clear();
    }

    static void onVideo(String video) {
        if (foreground.equals(video)) return;
        foreground = video;
        current = null;
        ccState = UNKNOWN;
        Selection early = pending.get(video);
        pending.clear();
        Object manager = early == null ? null : early.manager.get();
        if (manager == null || !video.equals(nativeModelVideo(manager))) return;
        current = early;
        if (early.explicit) ccState = early.off ? OFF : ON;
        if (AiCaptionHook.enabled()) refreshCatalog();
    }

    /** Suppress paint at the exact renderer, leaving its track and view state intact. */
    public static boolean suppressNativeDraw() {
        return AiCaptionHook.enabled();
    }

    /** Register the native window once it attaches so a switch also invalidates its display list. */
    public static void onNativeRendererAttached(View view) {
        if (AiCaptionHook.installed()) AiCaptionHook.dispatch("onNativeRendererAttached", () -> renderers.put(view, true));
    }

    static void invalidateRenderers() {
        for (View view : renderers.keySet())
            if (view != null && view.isAttachedToWindow()) view.invalidate();
    }

    public static void onOriginalTrackList(@Nullable List<?> tracks) {
        if (!AiCaptionHook.enabled() || tracks == null || tracks.isEmpty()) return;
        List<?> observed = android.os.Looper.myLooper() == android.os.Looper.getMainLooper()
                ? tracks : new ArrayList<>(tracks);
        AiCaptionHook.dispatch("onOriginalTrackList", () -> {
            if (!AiCaptionHook.enabled() || readingCatalog) return;
            if (CaptionTracks.collect(observed, foreground)) CaptionSession.observe();
        });
    }

    /** Bound to the shared native dispatcher after its forced/default-track resolution. */
    public static void onNativeTrackApplied(@Nullable Object manager, @Nullable Object event) {} // Bound at patch time.

    public static void onNativeAppliedEvent(@Nullable Object manager, @Nullable Object committed, @Nullable Object requested,
            @Nullable Object origin, int reason, @Nullable String modelOwner) {
        if (!AiCaptionHook.installed() || modelOwner == null || modelOwner.isEmpty()) return;
        // A committed forced track must never override a requested Off.
        AiCaptionHook.dispatch("onNativeAppliedEvent", () -> commit(manager, committed, requested, origin, reason, modelOwner));
    }

    private static boolean off(@Nullable Object track) {
        return track == null || DISABLE.equals(language(track));
    }

    private static void commit(Object manager, Object committed, Object requested,
            Object origin, int reason, String owner) {
        if (manager != null && !owner.equals(nativeModelVideo(manager))) return;
        boolean off = off(requested) || off(committed);
        String selectedUrl = off ? "" : url(committed);
        if (!off && (!AiCaptionHook.isYouTubeTimedTextUrl(selectedUrl)
                || !owner.equals(CaptionUrls.videoId(selectedUrl)))) return;
        String language = off ? "" : language(committed);
        if (AUTO_TRANSLATE.equals(language)) return;
        TargetLanguage target = TargetLanguage.fromUrl(selectedUrl);
        boolean translated = target != null;
        if (!translated) target = TargetLanguage.fromCode(language);
        boolean explicit = reason == 1 || origin instanceof Enum<?>
                && "PREFERRED_TRACK".equals(((Enum<?>) origin).name());
        Selection previous = current;
        boolean same = owner.equals(foreground) && previous != null && previous.url.equals(selectedUrl)
                && previous.off == off && previous.target.equals(target == null ? "" : target.code);
        Selection next = new Selection(manager, selectedUrl, target, translated, off, explicit,
                same ? previous.revision : ++revision);
        if (!owner.equals(foreground)) {
            pending.remove(owner);
            pending.put(owner, next);
            if (pending.size() > 6) pending.remove(pending.keySet().iterator().next());
            return;
        }
        current = next;
        if (AiCaptionHook.enabled()) refreshCatalog();
        CaptionSession.onNativeSelection(off, explicit);
    }

    static void refreshCatalog() {
        Selection selected = current;
        Object manager = selected == null ? null : selected.manager.get();
        if (manager == null || !foreground.equals(nativeModelVideo(manager))) return;
        readingCatalog = true;
        try {
            List<?> tracks = nativeTracks(manager);
            if (tracks == null) return;
            if (tracks.isEmpty()) CaptionTracks.register(foreground, Collections.emptyList(), true);
            else CaptionTracks.collect(tracks, foreground);
        } finally {
            readingCatalog = false;
        }
    }

    public interface CaptionModel {
        String patch_captionModelVideoId();
    }

    // Bound at patch time.
    public static String nativeModelVideo(@Nullable Object manager) { return ""; }
    @Nullable public static List<?> nativeTracks(Object manager) { return null; }
    public static String language(Object track) { return ""; }
    public static String vss(Object track) { return ""; }
    public static String url(Object track) { return ""; }
}
