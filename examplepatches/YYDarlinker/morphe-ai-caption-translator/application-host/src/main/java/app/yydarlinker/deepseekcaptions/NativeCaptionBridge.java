package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.net.Uri;
import android.os.SystemClock;

import app.yydarlinker.caption.contracts.CaptionContracts;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * What the patched YouTube code calls. Methods marked "bound at patch time" are empty stubs whose
 * bodies the patch replaces with accesses to the obfuscated caption model; every other method is
 * ordinary code that the patch only calls.
 *
 * <p>The bridge only observes: it records what the native model says in
 * {@link CaptionNativeProjection} and tells {@link CaptionSessionReconciler}. It never writes the
 * session intent and never decides that captions are wanted, so a native Off cannot become a user
 * command.
 */
public final class NativeCaptionBridge {
    private static final String DISABLE = "DISABLE_CAPTIONS_OPTION";
    private static final String AUTO_TRANSLATE = "AUTO_TRANSLATE_CAPTIONS_OPTION";
    private static final String PREFERRED_TRACK = "PREFERRED_TRACK";
    private static final int MAX_SELECTIONS = 6;

    private static final Object SELECTION_LOCK = new Object();
    private static final AtomicBoolean drawObserved = new AtomicBoolean();

    private static volatile Context context;

    /** The last selection per video, oldest first; guarded by {@link #SELECTION_LOCK}. */
    private static final LinkedHashMap<String, Selection> selections = new LinkedHashMap<>();

    private static String lastTrackListMark = "", visibleVideo = "";
    private static Object switchingManager;

    private NativeCaptionBridge() {}

    /** One thing the native caption model reported. */
    static final class Event {
        enum Kind {
            TRACK_LIST,
            SELECTION
        }

        final Kind kind;
        final List<?> tracks;
        final Object track, origin;
        final int reason;
        final String modelOwner;

        private Event(
                Kind kind,
                List<?> tracks,
                Object track,
                Object origin,
                int reason,
                String modelOwner) {
            this.kind = kind;
            this.tracks = tracks;
            this.track = track;
            this.origin = origin;
            this.reason = reason;
            this.modelOwner = modelOwner;
        }

        static Event trackList(List<?> tracks) {
            return new Event(Kind.TRACK_LIST, tracks, null, null, 0, null);
        }

        static Event selection(Object track, Object origin, int reason, String modelOwner) {
            return new Event(Kind.SELECTION, null, track, origin, reason, modelOwner);
        }
    }

    /** One selection of a video. The player objects are held weakly: a manager can be collected. */
    private static final class Selection {
        final String video, language, selectedUrl;
        final boolean off, translated, asr;
        final WeakReference<Object> manager, track;
        final Object origin;
        final int reason;

        Selection(String video, Object manager, Object track, Object origin, int reason) {
            this.video = video;
            this.manager = new WeakReference<>(manager);
            this.track = new WeakReference<>(track);
            this.origin = origin;
            this.reason = reason;
            off = isOff(track);
            selectedUrl = off ? "" : url(track);
            language = off ? "" : language(track);
            translated = !off && TargetLanguage.fromUrl(selectedUrl) != null;
            asr = !off && vss(track).startsWith("a.");
        }
    }

    static void initialize(Context value) {
        context = value.getApplicationContext();
    }

    static boolean enabled() {
        return CaptionAddonSupport.aiInstalled()
                && context != null
                && DeepSeekConfig.enabled(context);
    }

    private static void mark(String stage, String detail) {
        CaptionDiagnostics.mark(context, stage, detail);
    }

    private static boolean isOff(Object track) {
        return track == null || DISABLE.equals(language(track));
    }

    private static boolean isPreferred(Object origin) {
        return origin instanceof Enum<?> && PREFERRED_TRACK.equals(((Enum<?>) origin).name());
    }

    private static String videoOf(Object track) {
        return CaptionUrls.videoId(url(track));
    }

    private static boolean isSourceTrack(Object track) {
        return DeepSeekCaptionHook.isYouTubeTimedTextUrl(url(track));
    }

    // ---- Native draw ----

    public static boolean suppressNativeDraw() {
        if (CaptionAddonSupport.aiInstalled()
                && context != null
                && drawObserved.compareAndSet(false, true))
            mark(
                    "NATIVE_DRAW_HOOK_CONNECTED",
                    "build=n30;official=1.45.0;presentation=n29-presentation-v3;"
                            + "hook=SubtitleWindowView.draw");
        // The switch is the user's single answer: AI on means the native subtitle view must never
        // paint, even during the seconds before the engine has its first translated event. Waiting
        // for ownsNativeTrack()/isVisibleActive() was exactly what let the native style flash first
        // on every new video. AI off returns false immediately, so the native view paints normally.
        return enabled();
    }

    // ---- Observation ----

    /**
     * The one observation entry point: the native model said something. It records a projection and
     * notifies the reconciler; it never writes the session intent and never starts or stops the
     * engine itself. [epoch] is the player-owner epoch of the session the event belongs to.
     */
    static void observe(Object manager, Event event, long epoch) {
        if (event == null) return;
        if (!CaptionSessionReconciler.observable(epoch)) {
            mark(
                    "NATIVE_OBSERVATION_STALE",
                    "kind="
                            + event.kind
                            + ";epoch="
                            + epoch
                            + ";session_epoch="
                            + CaptionSessionReconciler.sessionEpoch());
            return;
        }
        try {
            switch (event.kind) {
                case TRACK_LIST:
                    collectSourceCatalog(event.tracks);
                    onTrackListObserved(event.tracks, epoch);
                    break;
                case SELECTION:
                    captureSelection(manager, event, epoch);
                    break;
                default:
                    break;
            }
        } catch (Exception failure) {
            mark("NATIVE_OBSERVE_FAILED", failure.getClass().getSimpleName());
        }
    }

    /** Called when the native model first exposes its signed source tracks. */
    public static void onOriginalTrackList(List<?> tracks) {
        observe(
                null,
                Event.trackList(tracks),
                CaptionPlayerAuthority.ownerEpoch());
    }

    private static void onTrackListObserved(List<?> tracks, long epoch) {
        if (tracks == null || tracks.isEmpty()) return;
        try {
            String owner = "";
            Set<String> sources = new HashSet<>();
            for (Object track : tracks) {
                String candidate = url(track);
                if (!DeepSeekCaptionHook.isYouTubeTimedTextUrl(candidate)) continue;
                String candidateOwner = CaptionUrls.videoId(candidate);
                if (candidateOwner.isEmpty()) continue;
                if (!owner.isEmpty() && !owner.equals(candidateOwner)) return;
                owner = candidateOwner;
                sources.add(CaptionUrls.sourceCaptionUrl(candidate));
            }
            if (owner.isEmpty()) return;
            boolean foreground = owner.equals(CaptionActions.currentVideoIdSnapshot());
            synchronized (SELECTION_LOCK) {
                String markKey = owner + ":" + foreground;
                if (!markKey.equals(lastTrackListMark)) {
                    lastTrackListMark = markKey;
                    mark(
                            "NATIVE_TRACK_LIST_READY",
                            "video="
                                    + owner
                                    + ";foreground="
                                    + foreground
                                    + ";tracks="
                                    + tracks.size()
                                    + ";sources="
                                    + sources.size()
                                    + ";elapsed_realtime_ms="
                                    + SystemClock.elapsedRealtime());
                }
            }
            if (foreground) CaptionSessionReconciler.onObservation(context, "track_list", epoch);
        } catch (Exception failure) {
            mark("NATIVE_TRACK_LIST_FAILED", failure.getClass().getSimpleName());
        }
    }

    private static void publishSourceCatalog(Object manager) {
        if (manager == null) return;
        try {
            List<?> tracks = nativeTracks(manager);
            if (tracks != null && tracks.isEmpty()) {
                String owner = nativeModelVideo(manager);
                if (owner != null && !owner.isEmpty())
                    SourceCatalog.register(owner, Collections.emptyList(), true);
            } else collectSourceCatalog(tracks);
        } catch (Exception ignored) {
            // The model is gone or not ready; the catalog keeps what it has.
        }
    }

    /** Registers the untranslated tracks of each video and tells the engine its catalog changed. */
    private static void collectSourceCatalog(List<?> tracks) {
        if (tracks == null) return;
        Map<String, List<SourceSelection>> byVideo = new LinkedHashMap<>();
        for (Object track : tracks) {
            String selected = url(track), code = language(track), id = vss(track);
            NativeAsrTrackReference.remember(code, id, selected);
            if (code == null || code.endsWith("_OPTION") || !CaptionUrls.isTimedText(selected))
                continue;
            Uri descriptor = Uri.parse(selected);
            if (!descriptor.getQueryParameters("tlang").isEmpty()) continue;
            String owner = CaptionUrls.videoId(selected);
            String declared = CaptionLanguageContext.observe(selected, "").sourceCode;
            if (owner.isEmpty() || declared.isEmpty() || declared.equals("UNKNOWN")) continue;
            SourceSelection.Kind kind =
                    id == null
                            ? SourceSelection.Kind.UNKNOWN
                            : id.startsWith("a.")
                                    ? SourceSelection.Kind.ASR
                                    : id.startsWith(".")
                                            ? SourceSelection.Kind.MANUAL
                                            : SourceSelection.Kind.UNKNOWN;
            String stableId =
                    (id == null || id.isEmpty() ? "unknown/" + declared : id)
                            + "/"
                            + nullToEmpty(descriptor.getQueryParameter("name"))
                            + "/"
                            + nullToEmpty(descriptor.getQueryParameter("id"));
            byVideo.computeIfAbsent(owner, key -> new ArrayList<>())
                    .add(
                            new SourceSelection(
                                    owner, stableId, declared, selected, kind, true, 0, ""));
        }
        for (Map.Entry<String, List<SourceSelection>> entry : byVideo.entrySet()) {
            SourceCatalog.register(entry.getKey(), entry.getValue(), true);
            CaptionActions.command(CaptionContracts.Action.SOURCE_CATALOG, entry.getKey());
        }
    }

    private static String nullToEmpty(String value) {
        return value == null ? "" : value;
    }

    // ---- Selections made by the native player ----

    public static void onNativeSelectionWithReason(
            Object manager, Object track, Object origin, int reason) {
        observe(
                manager,
                Event.selection(track, origin, reason, null),
                CaptionPlayerAuthority.ownerEpoch());
    }

    public static void onNativeSelection(Object manager, Object track, Object origin) {
        observe(
                manager,
                Event.selection(track, origin, 0, null),
                CaptionPlayerAuthority.ownerEpoch());
    }

    /**
     * Bound to the shared native dispatcher, after native track filtering, before loading text.
     * Both the manual menu and automatic model initialization flow through this point.
     */
    public static void onNativeTrackApplied(Object manager, Object event) {} // bound at patch time

    /** modelOwner is the caption model's videoId, NOT the event's playback nonce (CPN). */
    public static void onNativeAppliedEvent(
            Object manager,
            Object committed,
            Object requested,
            Object origin,
            int reason,
            String modelOwner) {
        // Forced-caption fallback can make the committed track non-null even after explicit Off.
        // Preserve that user intent; automatic null/default events still use the actual track.
        boolean explicitOff = isPreferred(origin) && isOff(requested);
        observe(
                manager,
                Event.selection(
                        explicitOff ? null : committed,
                        origin,
                        reason,
                        modelOwner == null ? "" : modelOwner.trim()),
                CaptionPlayerAuthority.ownerEpoch());
    }

    public static void onNativeSelectionApplied(
            Object manager, Object track, Object origin, int reason, String modelOwner) {
        try {
            observe(
                    manager,
                    Event.selection(
                            track, origin, reason, modelOwner == null ? "" : modelOwner.trim()),
                    CaptionPlayerAuthority.ownerEpoch());
        } catch (Exception failed) {
            mark("NATIVE_APPLIED_CAPTURE_FAILED", failed.getClass().getSimpleName());
        }
    }

    /**
     * Records what the native player selected for a video as a projection and hands it to the
     * reconciler. [event.modelOwner] is null for plain selections and the model's video for applied
     * events.
     */
    private static void captureSelection(Object manager, Event event, long epoch) {
        Selection value;
        String code;
        String current = CaptionActions.currentVideoIdSnapshot();
        synchronized (SELECTION_LOCK) {
            // Internal null/reselect callbacks must not erase the snapshot or change memory.
            if (manager != null && manager == switchingManager) return;
            Object track = event.track;
            code = track == null ? DISABLE : language(track);
            if (AUTO_TRANSLATE.equals(code)) return;
            boolean off = isOff(track);
            String video =
                    off
                            ? (event.modelOwner == null ? modelVideo(manager) : event.modelOwner)
                            : videoOf(track);
            boolean applied = event.modelOwner != null;
            // A reset with no model emits a null selection, not an explicit Off on the departed
            // video. Never infer its owner from a reused manager's previous selection.
            if (applied && off && video.isEmpty()) return;
            if (applied && !event.modelOwner.isEmpty() && !off && !event.modelOwner.equals(video)) {
                mark(
                        "NATIVE_APPLIED_OWNER_REJECTED",
                        "model_track_mismatch;model_foreground="
                                + event.modelOwner.equals(current)
                                + ";track_foreground="
                                + video.equals(current));
                return;
            }
            if (video.isEmpty() && off) {
                Selection owner = latestForManager(manager);
                if (owner != null) video = owner.video;
            }
            // An unidentified background null callback is not evidence that the visible CC is off.
            if (video.isEmpty() && !current.isEmpty()) return;
            if (!off && !isSourceTrack(track)) return;

            value = new Selection(video, manager, track, event.origin, event.reason);
            if (applied) markApplied(value, code, current);
            selections.remove(video);
            selections.put(video, value);
            while (selections.size() > MAX_SELECTIONS)
                selections.remove(selections.keySet().iterator().next());
            if (!current.isEmpty() && !current.equals(video)) {
                mark("NATIVE_SELECTION_BACKGROUND", "visible_state_preserved");
                return;
            }
        }
        publishSourceCatalog(manager);
        boolean explicit = isPreferred(event.origin);
        CaptionNativeProjection.selection(
                value.video,
                value.language,
                value.selectedUrl,
                value.off,
                value.translated,
                explicit,
                epoch);
        CaptionSessionReconciler.onNativeSelection(context, epoch, explicit);
    }

    private static void markApplied(Selection value, String code, String current) {
        boolean foreground = value.video.equals(current);
        mark(
                "NATIVE_TRACK_APPLIED",
                "owner=caption_model;foreground="
                        + foreground
                        + ";off="
                        + value.off
                        + ";translated="
                        + value.translated
                        + ";reason="
                        + value.reason
                        + ";origin="
                        + (value.origin instanceof Enum<?> ? ((Enum<?>) value.origin).name() : "")
                        + ";track="
                        + (value.off ? "" : code + "/" + (value.asr ? "asr" : "manual"))
                        + ";elapsed_realtime_ms="
                        + SystemClock.elapsedRealtime());
        if (foreground && !value.off)
            mark(
                    "NATIVE_OWNER_ESTABLISHED",
                    "video="
                            + value.video
                            + ";translated="
                            + value.translated
                            + ";elapsed_realtime_ms="
                            + SystemClock.elapsedRealtime());
    }

    // ---- Switching videos ----

    static void onVideoId(String video) {
        video = video == null ? "" : video.trim();
        synchronized (SELECTION_LOCK) {
            if (video.equals(visibleVideo)) return;
            visibleVideo = video;
            mark("VIDEO_SWITCHED", "video=" + video);
        }
    }

    private static Selection latestForManager(Object manager) {
        Selection found = null;
        if (manager != null)
            for (Selection value : selections.values())
                if (value.manager.get() == manager) found = value;
        return found;
    }

    private static String modelVideo(Object manager) {
        if (manager == null) return "";
        try {
            String bound = nativeModelVideo(manager);
            if (bound != null && !bound.isEmpty()) return bound;
            List<?> tracks = nativeTracks(manager);
            if (tracks == null) return "";
            String owner = "";
            for (Object track : tracks) {
                String video = videoOf(track);
                if (video.isEmpty()) continue;
                if (!owner.isEmpty() && !owner.equals(video)) return "mixed_model";
                owner = video;
            }
            return owner;
        } catch (Exception unavailable) {
            return "";
        }
    }

    // ---- Bound at patch time ----

    /** The caption model's videoId, never the unrelated caption event playback identifier. */
    public static String nativeModelVideo(Object manager) {
        return "";
    }

    public static List<?> nativeTracks(Object manager) {
        return null;
    }

    public static List<?> translatedTracks(Object manager) {
        return null;
    }

    public static String language(Object track) {
        return "";
    }

    public static String vss(Object track) {
        return "";
    }

    public static String url(Object track) {
        return "";
    }
}
