package io.github.sabopura.morphe.extension.youtube.danmaku;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RecordingCanvas;
import android.graphics.RenderNode;
import android.graphics.Typeface;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.view.Choreographer;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.AnimationUtils;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import io.github.sabopura.morphe.extension.youtube.shared.VideoSurfaceTracker;
import io.github.sabopura.morphe.extension.youtube.shared.Views;

/** Fetches comments in the background and renders them over every active player window. */
@SuppressWarnings("unused")
public final class DanmakuController {
    private static final String TAG = "DanmakuComments";
    private static final String OVERLAY_TAG = "morphe_danmaku_window_overlay_v3";
    private static final long FALLBACK_VIDEO_LENGTH_MS = 10 * 60 * 1000L;
    /** Comments this far behind the playhead can no longer be on screen. */
    private static final long PAST_COMMENT_MS = 25_000L;
    /** Upcoming chat the replay fetcher keeps buffered before it pauses. */
    private static final long STREAM_BUFFER_AHEAD_MS = 10_000L;
    /** The display may fall back to its idle refresh rate this long after the last comment. */
    private static final long SMOOTH_RELEASE_MS = 3_000L;
    private static final long MERGE_WINDOW_MS = 3_000L;
    private static final int MAX_MERGE_COUNT = 999;
    private static final long IDLE_NUDGE_INTERVAL_MS = 500L;

    private static final Object TIME_LOCK = new Object();
    private static final Object COMMENT_LOCK = new Object();
    private static final Object SESSION_LOCK = new Object();
    private static final Object OVERLAY_LOCK = new Object();

    /** Every comment received for the current video, kept so filters can be re-applied. */
    private static final LinkedHashMap<String, IncomingRegular> regularIncoming =
            new LinkedHashMap<>();
    private static final LinkedHashMap<String, IncomingStream> streamIncoming =
            new LinkedHashMap<>();
    /** Comments that passed the filters, keyed by id. */
    private static final LinkedHashMap<String, RawComment> regularComments =
            new LinkedHashMap<>();
    private static final LinkedHashMap<String, RawComment> streamComments =
            new LinkedHashMap<>();
    private static final Map<String, String> mergeTargets = new HashMap<>();
    private static final List<WeakReference<DanmakuOverlayView>> overlays = new ArrayList<>();

    private static volatile List<RawComment> comments = Collections.emptyList();
    private static volatile String currentVideoId = "";
    private static volatile InnertubeCommentClient.VideoKind videoKind =
            InnertubeCommentClient.VideoKind.REGULAR;
    private static volatile long videoLengthMs = FALLBACK_VIDEO_LENGTH_MS;
    /** Guarded by TIME_LOCK. */
    private static final MediaClock clock = new MediaClock();
    private static volatile int videoGeneration;
    private static volatile int imageGeneration;
    private static volatile long lastNudgeUptimeMs;
    private static InnertubeCommentClient.Session fetchSession;

    private DanmakuController() {
    }

    /** Legacy injection point retained so older patched APKs fail safely. */
    public static void resetForVideo() {
        stopFetchSession();
    }

    /** Stable video-id injection point. Duplicate callbacks for the same video are ignored. */
    public static void setVideoId(String videoId) {
        if (videoId == null || videoId.isEmpty() || videoId.equals(currentVideoId)) return;
        synchronized (SESSION_LOCK) {
            stopFetchSessionLocked();
            currentVideoId = videoId;
            videoGeneration++;
            videoKind = InnertubeCommentClient.VideoKind.REGULAR;
            videoLengthMs = FALLBACK_VIDEO_LENGTH_MS;
            clearCommentsLocked();
            resetTimeState();
            startFetchSessionLocked(videoId, videoGeneration);
        }
        publishComments(Collections.emptyList());
    }

    /** Captures only the current YouTube session headers; values remain in process memory. */
    public static void captureRequestHeaders(String url, Map<String, String> headers) {
        InnertubeCommentClient.captureRequestHeaders(url, headers);
    }

    /** Variant used by the request-builder hook; invoke-range works with high parameter registers. */
    public static void captureRequestHeaders(Map<String, String> headers) {
        InnertubeCommentClient.captureRequestHeaders(headers);
    }

    public static void setVideoLength(long lengthMs) {
        if (lengthMs <= 0 || videoLengthMs == lengthMs) return;
        videoLengthMs = lengthMs;
        if (Log.isLoggable(TAG, Log.DEBUG)) {
            Log.d(TAG, "Video length=" + lengthMs + "ms");
        }
        rebuildAllOverlays();
    }

    /** Adds one non-interactive overlay to the current Android window content root. */
    public static void initializeOverlay(ViewGroup controlsParent) {
        if (controlsParent == null) return;
        try {
            DanmakuSettings.initialize(controlsParent.getContext());
            Activity activity = Views.findActivity(controlsParent.getContext());
            View rootView = activity != null && activity.getWindow() != null
                    ? activity.getWindow().getDecorView()
                    : controlsParent.getRootView();
            // Attach to DecorView itself. Some YouTube builds use a specialized
            // android.R.id.content wrapper which deliberately gives unknown added
            // children a zero-sized layout; DecorView consistently lays out overlays.
            ViewGroup contentRoot = rootView instanceof ViewGroup
                    ? (ViewGroup) rootView : controlsParent;

            DanmakuOverlayView overlay = findExistingOverlay(contentRoot);
            if (overlay != null
                    && !Views.shouldAdoptPlayer(overlay.controlsRoot.get(), controlsParent)) {
                // Inline previews of related videos keep the comments on the main player.
                return;
            }
            if (overlay == null) {
                overlay = new DanmakuOverlayView(contentRoot.getContext());
                overlay.setTag(OVERLAY_TAG);
                contentRoot.addView(overlay, new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT));
                overlay.setElevation(10_000f);
                overlay.setTranslationZ(10_000f);
            }
            overlay.setAnchor(rootView, controlsParent);
            overlay.setComments(comments);
            overlay.bringToFront();
            registerOverlay(overlay);
            if (Log.isLoggable(TAG, Log.DEBUG)) {
                Log.d(TAG, "Overlay attached root=" + contentRoot.getClass().getSimpleName()
                        + " controls=" + controlsParent.getClass().getSimpleName());
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Unable to initialize danmaku window overlay", throwable);
        }
    }

    public static void setVideoTime(long videoTimeMs) {
        long now = SystemClock.uptimeMillis();
        boolean replaySeek;
        boolean resumed;
        synchronized (TIME_LOCK) {
            MediaClock.Report report = clock.onReport(videoTimeMs, now, clockGraceMs());
            replaySeek = report.seek && isReplayKind(videoKind);
            resumed = report.resumed;
        }
        if (replaySeek) notifyReplaySeek(videoTimeMs);
        // Overlays drive their own frame loop while comments move; this periodic nudge only
        // restarts a loop that went idle (paused, hidden, or waiting for the next comment).
        if (resumed || replaySeek || now - lastNudgeUptimeMs >= IDLE_NUDGE_INTERVAL_MS) {
            lastNudgeUptimeMs = now;
            invalidateAllOverlays();
        }
    }

    /** Applies a settings change with the cheapest work that keeps the overlay correct. */
    static void onSettingsChanged(int change) {
        if (change >= DanmakuSettings.CHANGE_FETCH) {
            String videoId = currentVideoId;
            synchronized (SESSION_LOCK) {
                int nextGeneration = ++videoGeneration;
                stopFetchSessionLocked();
                clearCommentsLocked();
                if (!videoId.isEmpty() && DanmakuSettings.isMasterEnabled()) {
                    startFetchSessionLocked(videoId, nextGeneration);
                }
            }
            publishComments(Collections.emptyList());
        } else if (change >= DanmakuSettings.CHANGE_FILTER) {
            publishComments(reapplyFilters());
        }
        rebuildAllOverlays();
    }

    private static void startFetchSessionLocked(String videoId, int expectedGeneration) {
        if (!DanmakuSettings.isMasterEnabled()) return;
        fetchSession = InnertubeCommentClient.start(
                videoId,
                DanmakuSettings.getMaxComments(),
                DanmakuSettings.getStreamCommentMode(),
                new FetchCallback(videoId, expectedGeneration)
        );
    }

    private static void stopFetchSession() {
        synchronized (SESSION_LOCK) {
            stopFetchSessionLocked();
        }
    }

    private static void stopFetchSessionLocked() {
        if (fetchSession != null) {
            fetchSession.close();
            fetchSession = null;
        }
    }

    private static void clearCommentsLocked() {
        synchronized (COMMENT_LOCK) {
            regularIncoming.clear();
            streamIncoming.clear();
            regularComments.clear();
            streamComments.clear();
            mergeTargets.clear();
            comments = Collections.emptyList();
        }
    }

    private static void resetTimeState() {
        synchronized (TIME_LOCK) {
            clock.reset(SystemClock.uptimeMillis());
        }
    }

    private static long getInterpolatedVideoTime() {
        return getInterpolatedVideoTime(SystemClock.uptimeMillis());
    }

    private static long getInterpolatedVideoTime(long uptimeMs) {
        synchronized (TIME_LOCK) {
            return interpolatedVideoTimeLocked(uptimeMs);
        }
    }

    private static long interpolatedVideoTimeLocked(long now) {
        return clock.timeAt(now, clockGraceMs());
    }

    private static boolean isAnimatingLocked(long now) {
        return clock.isAnimating(now, clockGraceMs());
    }

    private static boolean isAnimating(long uptimeMs) {
        synchronized (TIME_LOCK) {
            return isAnimatingLocked(uptimeMs);
        }
    }

    private static float playbackSpeed() {
        synchronized (TIME_LOCK) {
            return Math.max(0.1f, clock.speed());
        }
    }

    private static boolean isKindEnabled(InnertubeCommentClient.VideoKind kind) {
        if (!DanmakuSettings.isMasterEnabled()) return false;
        switch (kind) {
            case LIVE:
            case LIVE_REPLAY:
                return DanmakuSettings.isLiveEnabled();
            case PREMIERE:
            case PREMIERE_REPLAY:
                return DanmakuSettings.isPremiereEnabled();
            case REGULAR:
            default:
                return DanmakuSettings.isRegularEnabled();
        }
    }

    private static boolean isReplayKind(InnertubeCommentClient.VideoKind kind) {
        return kind == InnertubeCommentClient.VideoKind.LIVE_REPLAY
                || kind == InnertubeCommentClient.VideoKind.PREMIERE_REPLAY;
    }

    private static void notifyReplaySeek(long videoTimeMs) {
        List<RawComment> updated;
        synchronized (COMMENT_LOCK) {
            streamIncoming.clear();
            streamComments.clear();
            mergeTargets.clear();
            updated = rebuildPublishedCommentsLocked();
        }
        publishComments(updated);
        synchronized (SESSION_LOCK) {
            if (fetchSession != null) fetchSession.requestReplaySeek(videoTimeMs);
        }
        if (Log.isLoggable(TAG, Log.DEBUG)) {
            Log.d(TAG, "Replay seek=" + videoTimeMs + "ms");
        }
    }

    private static int addRegularComments(int generation,
            List<InnertubeResponseParser.CommentData> incoming) {
        List<RawComment> updated = null;
        int retained;
        synchronized (COMMENT_LOCK) {
            if (generation != videoGeneration) return regularComments.size();
            long capturedAtMs = getInterpolatedVideoTime();
            int incomingLimit = DanmakuSettings.getMaxComments() * 3;
            for (InnertubeResponseParser.CommentData comment : incoming) {
                if (regularIncoming.size() >= incomingLimit) break;
                regularIncoming.putIfAbsent(comment.id,
                        new IncomingRegular(comment, capturedAtMs));
            }
            acceptRegularLocked(incoming, capturedAtMs);
            retained = regularComments.size();
            if (!incoming.isEmpty()) updated = rebuildPublishedCommentsLocked();
        }
        if (updated != null) publishComments(updated);
        return retained;
    }

    private static void acceptRegularLocked(List<InnertubeResponseParser.CommentData> incoming,
                                            long capturedAtMs) {
        int limit = DanmakuSettings.getMaxComments();
        List<Long> occupiedUntimed = new ArrayList<>();
        for (RawComment retainedComment : regularComments.values()) {
            if (retainedComment.source == Source.REGULAR_UNTIMED
                    && retainedComment.explicitTimeMs >= 0) {
                occupiedUntimed.add(retainedComment.explicitTimeMs);
            }
        }
        long now = getInterpolatedVideoTime();
        for (InnertubeResponseParser.CommentData comment : incoming) {
            if (regularComments.size() >= limit) break;
            RichCommentText content = comment.richText.normalized();
            if (content.isEmpty() || !accepted(content)) continue;
            List<CommentParser.TimestampSegment> segments =
                    CommentParser.splitTimestampSegments(content, videoLengthMs);
            if (!segments.isEmpty()) {
                for (CommentParser.TimestampSegment segment : segments) {
                    if (regularComments.size() >= limit) break;
                    if (!accepted(segment.richText)) continue;
                    String id = comment.id + '#' + segment.timeMs;
                    if (regularComments.containsKey(id)) continue;
                    putMerged(regularComments, new RawComment(id, segment.richText,
                            Source.REGULAR_TIMED, segment.timeMs, 0, 0, 1), now);
                }
            } else if (shouldIncludeUntimedRegular()) {
                if (!regularComments.containsKey(comment.id)) {
                    long scheduledTimeMs = RegularCommentScheduler.assignTime(
                            currentVideoId, comment.id, capturedAtMs,
                            videoLengthMs, occupiedUntimed);
                    occupiedUntimed.add(scheduledTimeMs);
                    regularComments.put(comment.id, new RawComment(
                            comment.id, content, Source.REGULAR_UNTIMED,
                            scheduledTimeMs, capturedAtMs, 0, 1));
                }
            }
        }
    }

    private static void addLiveComments(int generation,
            List<InnertubeResponseParser.CommentData> incoming,
            long streamStartEpochMs, boolean firstBatch) {
        if (incoming.isEmpty()) return;
        List<RawComment> updated;
        synchronized (COMMENT_LOCK) {
            if (generation != videoGeneration) return;
            int start = firstBatch ? Math.max(0, incoming.size() - 20) : 0;
            long now = getInterpolatedVideoTime();
            int fallbackIndex = 0;
            List<IncomingStream> batch = new ArrayList<>(incoming.size() - start);
            for (int index = start; index < incoming.size(); index++) {
                InnertubeResponseParser.CommentData comment = incoming.get(index);
                if (streamIncoming.containsKey(comment.id)) continue;
                long timeMs = comment.videoOffsetMs;
                if (timeMs < 0 && comment.epochMs >= 0 && streamStartEpochMs >= 0) {
                    timeMs = comment.epochMs - streamStartEpochMs;
                }
                if (timeMs < 0) {
                    long spacing = firstBatch ? 350L : 200L;
                    timeMs = now + 150L + fallbackIndex++ * spacing;
                }
                IncomingStream value = new IncomingStream(comment, Math.max(0, timeMs), now);
                streamIncoming.put(comment.id, value);
                batch.add(value);
            }
            trimAroundPlayhead(streamIncoming, DanmakuSettings.getMaxComments() * 2, now,
                    value -> value.timeMs);
            acceptStreamLocked(batch, now);
            updated = rebuildPublishedCommentsLocked();
        }
        publishComments(updated);
    }

    private static void acceptStreamLocked(List<IncomingStream> batch, long now) {
        boolean highlight = DanmakuSettings.shouldHighlightPaid();
        for (IncomingStream value : batch) {
            RichCommentText content = value.data.richText.normalized();
            if (content.isEmpty() || !accepted(content)
                    || streamComments.containsKey(value.data.id)) continue;
            putMerged(streamComments, new RawComment(value.data.id, content, Source.STREAM,
                    value.timeMs, value.capturedAtMs, highlight ? value.data.color : 0, 1), now);
        }
        trimAroundPlayhead(streamComments, DanmakuSettings.getMaxComments(), now,
                comment -> comment.explicitTimeMs);
    }

    /**
     * Inserts a comment, folding it into an identical comment that has not started moving
     * yet ("www" x 30 becomes one "www ×30"). Paid messages are never merged.
     */
    private static void putMerged(Map<String, RawComment> target, RawComment candidate,
                                  long nowMs) {
        if (!DanmakuSettings.shouldMergeDuplicates() || candidate.color != 0) {
            target.put(candidate.id, candidate);
            return;
        }
        String key = candidate.source.name() + ':'
                + CommentFilter.duplicateKey(candidate.content.fallbackText());
        String existingId = mergeTargets.get(key);
        RawComment existing = existingId == null ? null : target.get(existingId);
        if (existing != null && existing.explicitTimeMs > nowMs
                && Math.abs(existing.explicitTimeMs - candidate.explicitTimeMs) <= MERGE_WINDOW_MS
                && existing.repeat < MAX_MERGE_COUNT) {
            target.put(existing.id, existing.mergedWithOneMore());
            return;
        }
        mergeTargets.put(key, candidate.id);
        target.put(candidate.id, candidate);
    }

    /** Rebuilds accepted comments from everything received, without any network request. */
    private static List<RawComment> reapplyFilters() {
        synchronized (COMMENT_LOCK) {
            regularComments.clear();
            streamComments.clear();
            mergeTargets.clear();
            Map<Long, List<InnertubeResponseParser.CommentData>> byCapture = new LinkedHashMap<>();
            for (IncomingRegular value : regularIncoming.values()) {
                List<InnertubeResponseParser.CommentData> group = byCapture.get(value.capturedAtMs);
                if (group == null) {
                    group = new ArrayList<>();
                    byCapture.put(value.capturedAtMs, group);
                }
                group.add(value.data);
            }
            for (Map.Entry<Long, List<InnertubeResponseParser.CommentData>> entry
                    : byCapture.entrySet()) {
                acceptRegularLocked(entry.getValue(), entry.getKey());
            }
            acceptStreamLocked(new ArrayList<>(streamIncoming.values()),
                    getInterpolatedVideoTime());
            return rebuildPublishedCommentsLocked();
        }
    }

    private static long clockGraceMs() {
        return io.github.sabopura.morphe.extension.youtube.shared.PlayerHooks.clockGraceMs();
    }

    private interface TimeOf<V> {
        long timeMs(V value);
    }

    /**
     * Bounds the buffer without ever starving the playhead. Comments that left the screen go
     * first. Upcoming comments are only dropped past a generous hard cap: the replay fetcher
     * never returns to a time it already passed, so a dropped upcoming comment is a hole in
     * the flow. (Counting recent past comments against the limit used to push out every new
     * batch of a busy chat until the old ones expired: nothing, then a burst, then nothing.)
     */
    private static <V> void trimAroundPlayhead(LinkedHashMap<String, V> map, int limit,
                                               long nowMs, TimeOf<V> timeOf) {
        if (map.size() <= limit) return;
        Iterator<Map.Entry<String, V>> iterator = map.entrySet().iterator();
        while (iterator.hasNext()) {
            if (timeOf.timeMs(iterator.next().getValue()) < nowMs - PAST_COMMENT_MS) {
                iterator.remove();
            }
        }
        int hardCap = Math.max(limit * 4, 1_500);
        if (map.size() <= hardCap) return;
        List<Map.Entry<String, V>> entries = new ArrayList<>(map.entrySet());
        entries.sort((a, b) -> Long.compare(
                timeOf.timeMs(a.getValue()), timeOf.timeMs(b.getValue())));
        // Oldest comments behind the playhead first, then the furthest-future ones.
        int head = 0;
        while (map.size() > hardCap && head < entries.size()
                && timeOf.timeMs(entries.get(head).getValue()) < nowMs) {
            map.remove(entries.get(head++).getKey());
        }
        for (int tail = entries.size() - 1; tail >= head && map.size() > hardCap; tail--) {
            map.remove(entries.get(tail).getKey());
        }
    }

    /**
     * True when enough upcoming chat is buffered; the fetcher then waits instead of running
     * further ahead. Both a count and a time horizon are required so that a very busy chat
     * still has several seconds in hand.
     */
    private static boolean isStreamBufferFull() {
        long now = getInterpolatedVideoTime();
        int threshold = Math.max(DanmakuSettings.getMaxComments() * 3 / 4, 150);
        synchronized (COMMENT_LOCK) {
            if (streamComments.size() < threshold) return false;
            int upcoming = 0;
            long horizon = now;
            for (RawComment comment : streamComments.values()) {
                if (comment.explicitTimeMs > now) {
                    upcoming++;
                    horizon = Math.max(horizon, comment.explicitTimeMs);
                }
            }
            return upcoming >= threshold && horizon - now >= STREAM_BUFFER_AHEAD_MS;
        }
    }

    private static List<RawComment> rebuildPublishedCommentsLocked() {
        List<RawComment> updated = new ArrayList<>(
                regularComments.size() + streamComments.size());
        updated.addAll(regularComments.values());
        updated.addAll(streamComments.values());
        comments = Collections.unmodifiableList(updated);
        return comments;
    }

    private static boolean shouldIncludeUntimedRegular() {
        if (videoKind == InnertubeCommentClient.VideoKind.REGULAR) {
            return DanmakuSettings.getRegularMode() == DanmakuSettings.REGULAR_MODE_ALL;
        }
        return DanmakuSettings.getStreamCommentMode()
                != DanmakuSettings.STREAM_MODE_CHAT_AND_TIMESTAMPS;
    }

    private static boolean accepted(RichCommentText text) {
        if (DanmakuSettings.shouldExcludeLong()
                && text.visibleCodePointCount() > DanmakuSettings.getMaxLength()) {
            return false;
        }
        return !DanmakuSettings.getNgFilter().blocks(text.fallbackText());
    }

    private static void registerOverlay(DanmakuOverlayView overlay) {
        synchronized (OVERLAY_LOCK) {
            cleanupOverlaysLocked();
            for (WeakReference<DanmakuOverlayView> reference : overlays) {
                if (reference.get() == overlay) return;
            }
            overlays.add(new WeakReference<>(overlay));
        }
    }

    private static DanmakuOverlayView findExistingOverlay(ViewGroup root) {
        for (int index = 0; index < root.getChildCount(); index++) {
            View child = root.getChildAt(index);
            if (child instanceof DanmakuOverlayView && OVERLAY_TAG.equals(child.getTag())) {
                return (DanmakuOverlayView) child;
            }
        }
        return null;
    }

    private static void publishComments(List<RawComment> updated) {
        for (DanmakuOverlayView overlay : activeOverlays()) {
            overlay.post(() -> overlay.setComments(updated));
        }
    }

    private static void rebuildAllOverlays() {
        for (DanmakuOverlayView overlay : activeOverlays()) {
            overlay.post(overlay::rebuildSchedule);
        }
    }

    private static void invalidateAllOverlays() {
        for (DanmakuOverlayView overlay : activeOverlays()) {
            overlay.post(overlay.requestFrameRunnable);
        }
    }

    private static List<DanmakuOverlayView> activeOverlays() {
        synchronized (OVERLAY_LOCK) {
            cleanupOverlaysLocked();
            List<DanmakuOverlayView> active = new ArrayList<>(overlays.size());
            for (WeakReference<DanmakuOverlayView> reference : overlays) {
                DanmakuOverlayView overlay = reference.get();
                if (overlay != null && overlay.isAttachedToWindow()) active.add(overlay);
            }
            return active;
        }
    }

    private static void cleanupOverlaysLocked() {
        overlays.removeIf(reference -> reference.get() == null);
    }

    public static int configFontSizeSp() { return 22; }
    public static int configOpacityPercent() { return 90; }
    public static int configTravelDurationSeconds() { return 8; }
    public static int configLaneCoveragePercent() { return 65; }
    public static int configMaxComments() { return 200; }
    public static int configMaxLength() { return 100; }

    private enum Source { REGULAR_TIMED, REGULAR_UNTIMED, STREAM }

    private static final class IncomingRegular {
        final InnertubeResponseParser.CommentData data;
        final long capturedAtMs;

        IncomingRegular(InnertubeResponseParser.CommentData data, long capturedAtMs) {
            this.data = data;
            this.capturedAtMs = capturedAtMs;
        }
    }

    private static final class IncomingStream {
        final InnertubeResponseParser.CommentData data;
        final long timeMs;
        final long capturedAtMs;

        IncomingStream(InnertubeResponseParser.CommentData data, long timeMs, long capturedAtMs) {
            this.data = data;
            this.timeMs = timeMs;
            this.capturedAtMs = capturedAtMs;
        }
    }

    private static final class RawComment {
        final String id;
        final RichCommentText baseContent;
        final RichCommentText content;
        final Source source;
        final long explicitTimeMs;
        final long capturedAtMs;
        final int color;
        final int repeat;

        RawComment(String id, RichCommentText content, Source source,
                   long explicitTimeMs, long capturedAtMs, int color, int repeat) {
            this.id = id;
            this.baseContent = content;
            this.content = repeat > 1
                    ? content.concat(RichCommentText.plain("×" + repeat), true) : content;
            this.source = source;
            this.explicitTimeMs = explicitTimeMs;
            this.capturedAtMs = capturedAtMs;
            this.color = color;
            this.repeat = repeat;
        }

        RawComment mergedWithOneMore() {
            return new RawComment(id, baseContent, source, explicitTimeMs, capturedAtMs,
                    color, repeat + 1);
        }

        /** Includes the repeat count so a merged label is re-measured and re-placed. */
        String scheduleId() { return source.name() + ':' + id + '#' + repeat; }

        int priority() {
            if (color != 0) return 4;
            if (source == Source.STREAM) return 3;
            return source == Source.REGULAR_TIMED ? 2 : 1;
        }
    }

    private static final class ScheduledComment {
        final String id;
        final RichCommentText content;
        final int color;
        final long timeMs;
        final long durationMs;
        final int lane;
        final float width;

        ScheduledComment(String id, RichCommentText content, int color, long timeMs,
                         long durationMs, int lane, float width) {
            this.id = id;
            this.content = content;
            this.color = color;
            this.timeMs = timeMs;
            this.durationMs = durationMs;
            this.lane = lane;
            this.width = width;
        }
    }

    /** Display list recorded once per comment; only its position changes per frame. */
    private static final class CachedNode {
        final RenderNode node;
        int styleKey;
        int imageGeneration;
        boolean pendingImages;

        CachedNode(String name) {
            node = new RenderNode(name);
        }
    }

    /**
     * Transparent surface the comments are drawn on. Media-overlay order puts it above the
     * video surface and below YouTube's window, so controls and captions stay readable.
     */
    private static final class CommentSurface extends SurfaceView
            implements SurfaceHolder.Callback {
        private final WeakReference<DanmakuOverlayView> owner;
        boolean ready;
        /** Refresh rate last voted for on the current buffer queue; -1 = not yet. */
        float votedRate = -1f;

        CommentSurface(Context context, DanmakuOverlayView owner) {
            super(context);
            this.owner = new WeakReference<>(owner);
            setTag(Views.OWN_SURFACE_TAG);
            setZOrderMediaOverlay(true);
            getHolder().setFormat(PixelFormat.TRANSLUCENT);
            getHolder().addCallback(this);
            setClickable(false);
            setFocusable(false);
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        }

        private void kick() {
            DanmakuOverlayView view = owner.get();
            if (view != null) view.post(view.requestFrameRunnable);
        }

        @Override public void surfaceCreated(SurfaceHolder holder) {
            ready = true;
            votedRate = -1f;
            kick();
        }

        @Override public void surfaceChanged(SurfaceHolder holder, int format, int width,
                                             int height) {
            kick();
        }

        @Override public void surfaceDestroyed(SurfaceHolder holder) {
            ready = false;
        }
    }

    /** Full-window canvas that clips all drawing to the actual video surface. */
    private static final class DanmakuOverlayView extends View {
        private static final int NODE_CACHE_SIZE = 160;

        private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG
                | Paint.SUBPIXEL_TEXT_FLAG);
        private final Paint imagePaint = new Paint(Paint.FILTER_BITMAP_FLAG);
        private final Paint.FontMetrics metrics = new Paint.FontMetrics();
        private final Rect videoRect = new Rect();
        private final Rect scratchRect = new Rect();
        private final RectF scratchRectF = new RectF();
        private final int[] location = new int[2];
        private final InlineImageCache imageCache = InlineImageCache.getInstance();
        private final VideoSurfaceTracker surfaceTracker = new VideoSurfaceTracker();
        private final Runnable invalidateRunnable = this::requestFrame;
        final Runnable requestFrameRunnable = this::requestFrame;
        /** Dedicated surface the comments are drawn on (see {@link CommentSurface}). */
        private CommentSurface commentSurface;
        /** True while frames go to {@link #commentSurface} instead of this view. */
        private boolean surfaceActive;
        private boolean frameScheduled;
        private WeakReference<View> videoTarget = new WeakReference<>(null);
        private final int[] containerLocation = new int[2];
        private final int[] overlayLocation = new int[2];
        private long lastSurfaceFrameNanos;
        private final Choreographer.FrameCallback frameCallback = frameTimeNanos -> {
            frameScheduled = false;
            removeCallbacks(invalidateRunnable);
            // Frame rate limit: on a faster display the previous frame simply stays up.
            int maxFps = DanmakuSettings.getMaxFps();
            if (maxFps > 0 && surfaceActive && frameTimeNanos - lastSurfaceFrameNanos
                    < 1_000_000_000L / maxFps - 2_000_000L) {
                requestFrame();
                return;
            }
            lastSurfaceFrameNanos = frameTimeNanos;
            boolean visible = prepareFrame();
            if (canUseSurface()) {
                renderToSurface(visible);
            } else {
                releaseSurface();
                postInvalidateOnAnimation();
            }
        };
        private final Runnable releaseSmoothRunnable = () -> requestSmoothFrames(false);
        private boolean smoothRequested;
        private final LinkedHashMap<String, CachedNode> nodeCache =
                new LinkedHashMap<String, CachedNode>(64, 0.75f, true) {
                    @Override protected boolean removeEldestEntry(
                            Map.Entry<String, CachedNode> eldest) {
                        if (size() <= NODE_CACHE_SIZE) return false;
                        eldest.getValue().node.discardDisplayList();
                        return true;
                    }
                };
        private WeakReference<View> windowRoot = new WeakReference<>(null);
        private WeakReference<View> controlsRoot = new WeakReference<>(null);
        private List<RawComment> rawComments = Collections.emptyList();
        private List<ScheduledComment> scheduledComments = Collections.emptyList();
        private final Map<String, CollisionLaneScheduler.Placement> placements =
                new LinkedHashMap<>();
        private final Map<String, Boolean> omittedIds = new LinkedHashMap<>();
        private long maxDurationMs;
        private int scheduleVideoWidth = -1;
        private int scheduleLaneCount = -1;
        private long scheduleDurationMs = -1;
        private int scheduleSpeedMode = -1;
        private int scheduleCrowdMode = -1;
        private int scheduleTextSizeBits;
        private int paintStyleGeneration = -1;
        private int paintTextSizeBits;
        private boolean scheduleDirty = true;
        private boolean forceFullSchedule = true;
        private boolean loggedVideoRect;
        private long lastDrawLogMs;

        DanmakuOverlayView(Context context) {
            super(context);
            setClickable(false);
            setFocusable(false);
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            setWillNotDraw(false);
        }

        void setAnchor(View root, View controls) {
            windowRoot = new WeakReference<>(root);
            controlsRoot = new WeakReference<>(controls);
            surfaceTracker.invalidate();
            requestFrame();
        }

        void setComments(List<RawComment> updated) {
            rawComments = updated;
            Map<String, Boolean> active = new HashMap<>(updated.size() * 2);
            for (RawComment comment : updated) active.put(comment.scheduleId(), true);
            placements.keySet().removeIf(id -> !active.containsKey(id));
            omittedIds.keySet().removeIf(id -> !active.containsKey(id));
            scheduleDirty = true;
            requestFrame();
        }

        void rebuildSchedule() {
            forceFullSchedule = true;
            scheduleDirty = true;
            requestFrame();
        }

        /** Main thread: draws the next frame on the comment surface, or on this view. */
        void requestFrame() {
            if (surfaceActive && commentSurface != null) {
                if (!frameScheduled) {
                    frameScheduled = true;
                    Choreographer.getInstance().postFrameCallback(frameCallback);
                }
            } else {
                postInvalidateOnAnimation();
            }
        }

        @Override protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            removeCallbacks(invalidateRunnable);
            removeCallbacks(releaseSmoothRunnable);
            if (frameScheduled) Choreographer.getInstance().removeFrameCallback(frameCallback);
            frameScheduled = false;
            releaseSurface();
            requestSmoothFrames(false);
            for (CachedNode cached : nodeCache.values()) cached.node.discardDisplayList();
            nodeCache.clear();
        }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            removeCallbacks(invalidateRunnable);
            boolean visible = prepareFrame();
            if (canUseSurface()) {
                // Comments live on their own surface; this view only starts the loop.
                renderToSurface(visible);
                return;
            }
            releaseSurface();
            if (visible) drawFrame(canvas);
        }

        private float frameLaneHeight;
        private float frameTopPadding;

        /** Resolves the video area and the schedule; false when nothing is to be drawn. */
        private boolean prepareFrame() {
            if (!DanmakuSettings.isMasterEnabled() || !isKindEnabled(videoKind)
                    || getWidth() <= 0 || getHeight() <= 0) return false;
            // Muted inline previews in feeds reuse the player; comments belong to the
            // video that is actually being watched.
            if (Views.isInlinePreview(controlsRoot.get())) return false;
            if (!resolveVideoRect()) return false;

            // Comments keep moving at every player size - regular player, miniplayer and
            // picture-in-picture - and the text follows the size of the player. Sizes are
            // compared with the physical display because in picture-in-picture the window
            // itself is small.
            android.util.DisplayMetrics display =
                    android.content.res.Resources.getSystem().getDisplayMetrics();
            int displayWidth = display.widthPixels;
            int displayHeight = display.heightPixels;
            boolean fullscreen = videoRect.height() >= displayHeight * 0.8f
                    || (displayWidth > displayHeight && videoRect.width() >= displayWidth * 0.8f);
            if (!fullscreen && !DanmakuSettings.isSmallPlayerEnabled()) return false;

            float sizeRatio = Math.min(1f, videoRect.width()
                    / (Math.min(displayWidth, displayHeight) * 0.7f));
            float scale = fullscreen ? 1f : Math.max(0.3f,
                    DanmakuSettings.getSmallPlayerScale() / 100f * sizeRatio);
            preparePaint(DanmakuSettings.getFontSize()
                    * getResources().getDisplayMetrics().scaledDensity * scale);

            float density = getResources().getDisplayMetrics().density;
            float laneHeight = Math.max(1, metrics.bottom - metrics.top + 4 * density);
            float topPadding = 8 * density;
            float usableHeight = Math.max(laneHeight,
                    videoRect.height() * (DanmakuSettings.getCoverage() / 100f) - topPadding);
            int laneCount = Math.max(1, (int) (usableHeight / laneHeight));
            long travelDurationMs = DanmakuSettings.getDuration() * 1000L;
            ensureSchedule(laneCount, travelDurationMs, 12f * density);
            frameLaneHeight = laneHeight;
            frameTopPadding = topPadding;
            return !scheduledComments.isEmpty();
        }

        private void drawFrame(Canvas canvas) {
            float laneHeight = frameLaneHeight;
            float topPadding = frameTopPadding;
            long frameUptime = AnimationUtils.currentAnimationTimeMillis();
            long now = getInterpolatedVideoTime(frameUptime);
            int save = canvas.save();
            canvas.clipRect(videoRect);
            boolean useNodes = Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q
                    && canvas.isHardwareAccelerated();
            int styleKey = DanmakuSettings.getStyleGeneration() * 31 + paintTextSizeBits;
            int drawn = 0;
            List<ScheduledComment> scheduled = scheduledComments;
            int first = firstPossiblyVisible(scheduled, now - maxDurationMs);
            long nextStart = Long.MAX_VALUE;
            for (int index = first; index < scheduled.size(); index++) {
                ScheduledComment comment = scheduled.get(index);
                long elapsed = now - comment.timeMs;
                if (elapsed < 0) {
                    nextStart = comment.timeMs;
                    break;
                }
                if (elapsed >= comment.durationMs) continue;
                float progress = elapsed / (float) comment.durationMs;
                float x = videoRect.right - progress * (videoRect.width() + comment.width);
                float top = videoRect.top + topPadding + comment.lane * laneHeight;
                if (useNodes) {
                    drawWithNode(canvas, comment, x, top, styleKey);
                } else {
                    drawContent(canvas, comment.content, comment.color, x, top - metrics.top);
                }
                drawn++;
            }
            canvas.restoreToCount(save);
            logDraw(drawn, now);
            recordFrame(frameUptime, now);
            if (DanmakuSettings.isShowStats()) drawStats(canvas);
            if (drawn > 0 && isAnimating(frameUptime)) {
                requestSmoothFrames(DanmakuSettings.isSmoothMotion());
                removeCallbacks(releaseSmoothRunnable);
                postDelayed(releaseSmoothRunnable, SMOOTH_RELEASE_MS);
            }
            scheduleNextFrame(frameUptime, drawn, now, nextStart);
        }

        /**
         * Whether frames can go to a dedicated surface. Drawing the comments into YouTube's
         * window made every animation frame redraw the whole window - the watch page, the
         * ambient light and the related videos - on the GPU, 60-120 times a second. When the
         * device lowered its clocks a few seconds after the last touch the comments stuttered;
         * touching the player boosted the clocks again for a moment. On their own surface a
         * frame costs only the comments themselves.
         */
        private boolean canUseSurface() {
            View video = videoTarget.get();
            surfaceActive = DanmakuSettings.isSeparateLayer()
                    && Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q
                    && video instanceof SurfaceView && video.isAttachedToWindow()
                    && controlsRoot.get() != null;
            return surfaceActive;
        }

        /**
         * Draws one frame on the comment surface. It sits in the player directly above the
         * video, covers exactly the video, and is composited by the system between the video
         * and the window, so YouTube's controls and captions stay on top of the comments.
         */
        private void renderToSurface(boolean visible) {
            CommentSurface surface = ensureSurface();
            if (surface == null) return; // The surface callbacks request the next frame.
            Surface output = surface.getHolder().getSurface();
            Canvas canvas;
            try {
                canvas = output.lockHardwareCanvas();
            } catch (Throwable throwable) {
                Log.w(TAG, "Comment surface unavailable", throwable);
                return;
            }
            try {
                canvas.drawColor(Color.TRANSPARENT, PorterDuff.Mode.CLEAR);
                if (visible) {
                    // Window coordinates -> the surface buffer, which has the video view's
                    // unscaled size while the miniplayer or PiP shows it smaller.
                    canvas.scale(surface.getWidth() / (float) videoRect.width(),
                            surface.getHeight() / (float) videoRect.height());
                    canvas.translate(-videoRect.left, -videoRect.top);
                    drawFrame(canvas);
                }
                applySurfaceFrameRate(surface, output);
            } finally {
                output.unlockCanvasAndPost(canvas);
            }
        }

        private final Rect surfaceBounds = new Rect();

        /** Places the surface over the video; null until it has a valid buffer of that size. */
        private CommentSurface ensureSurface() {
            View video = videoTarget.get();
            if (video == null || videoRect.isEmpty()
                    || !(video.getParent() instanceof ViewGroup)) return null;
            // A sibling of the video itself: YouTube moves and shrinks the miniplayer with
            // transforms applied while drawing, partly only to the branch holding the video.
            // Next to the video the surface receives exactly the same transforms, so the
            // comments shrink and move with the picture.
            ViewGroup container = (ViewGroup) video.getParent();
            View branch = video;
            if (commentSurface == null) commentSurface = new CommentSurface(getContext(), this);
            CommentSurface surface = commentSurface;
            // Same size and place as the video view, in the container's own coordinates.
            surfaceBounds.set(0, 0, video.getWidth(), video.getHeight());
            container.offsetDescendantRectToMyCoords(video, surfaceBounds);
            int width = Math.max(1, surfaceBounds.width());
            int height = Math.max(1, surfaceBounds.height());
            int branchIndex = container.indexOfChild(branch);
            if (surface.getParent() != container
                    || container.indexOfChild(surface) <= branchIndex) {
                if (surface.getParent() instanceof ViewGroup) {
                    ((ViewGroup) surface.getParent()).removeView(surface);
                }
                container.addView(surface, container.indexOfChild(branch) + 1,
                        new ViewGroup.LayoutParams(width, height));
                return null;
            }
            ViewGroup.LayoutParams params = surface.getLayoutParams();
            if (params.width != width || params.height != height) {
                params.width = width;
                params.height = height;
                surface.setLayoutParams(params);
                return null;
            }
            // YouTube's video container lays out only the children it knows, so the surface
            // is measured and placed here; this is repeated whenever the video moves.
            if (surface.getLeft() != surfaceBounds.left || surface.getTop() != surfaceBounds.top
                    || surface.getWidth() != width || surface.getHeight() != height) {
                surface.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
                surface.layout(surfaceBounds.left, surfaceBounds.top,
                        surfaceBounds.left + width, surfaceBounds.top + height);
            }
            if (!surface.ready || surface.getWidth() != width || surface.getHeight() != height
                    || !surface.getHolder().getSurface().isValid()) {
                logSurface("waiting", container, video, surface, width, height);
                return null;
            }
            logSurface("ready", container, video, surface, width, height);
            return surface;
        }

        /**
         * Votes for the panel's highest refresh rate on the comment surface. While a 24 fps
         * video plays and nobody touches the screen, the system drops the panel to 24 Hz and
         * every comment moves in 40 ms jumps. A vote on the window has no effect then: the
         * vote has to come from the layer that changes every frame.
         */
        private void applySurfaceFrameRate(CommentSurface surface, Surface output) {
            float wanted = smoothRequested ? highestRefreshRate() : 0f;
            if (surface.votedRate == wanted || Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
                return;
            }
            try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    output.setFrameRate(wanted, Surface.FRAME_RATE_COMPATIBILITY_DEFAULT,
                            Surface.CHANGE_FRAME_RATE_ALWAYS);
                } else {
                    output.setFrameRate(wanted, Surface.FRAME_RATE_COMPATIBILITY_DEFAULT);
                }
                surface.votedRate = wanted;
                if (Log.isLoggable(TAG, Log.DEBUG)) {
                    Log.d(TAG, "Comment surface frame rate=" + wanted);
                }
            } catch (Throwable throwable) {
                surface.votedRate = wanted;
                Log.w(TAG, "Unable to set the comment surface frame rate", throwable);
            }
        }

        private String lastSurfaceLog = "";

        private void logSurface(String state, ViewGroup container, View video, View surface,
                                int width, int height) {
            if (!Log.isLoggable(TAG, Log.DEBUG)) return;
            String line = state + " parent=" + container.getClass().getSimpleName()
                    + " video=" + video.getWidth() + "x" + video.getHeight()
                    + " at " + video.getLeft() + "," + video.getTop()
                    + " surface=" + surface.getWidth() + "x" + surface.getHeight()
                    + " at " + surface.getLeft() + "," + surface.getTop()
                    + " want=" + width + "x" + height + " rect=" + videoRect.toShortString();
            if (line.equals(lastSurfaceLog)) return;
            lastSurfaceLog = line;
            Log.d(TAG, "Surface " + line);
        }

        private void releaseSurface() {
            CommentSurface surface = commentSurface;
            if (surface == null) return;
            commentSurface = null;
            surfaceActive = false;
            if (surface.getParent() instanceof ViewGroup) {
                ((ViewGroup) surface.getParent()).removeView(surface);
            }
        }

        /**
         * Asks for the display's full refresh rate while comments are moving. A video only
         * votes for its own frame rate, so a few seconds after the last touch the system drops
         * a 120 Hz panel to 60 Hz or less and scrolling text turns into a blur; touching the
         * player brought the high rate back only briefly.
         */
        private void requestSmoothFrames(boolean wanted) {
            if (wanted == smoothRequested) return;
            smoothRequested = wanted;
            try {
                if (Build.VERSION.SDK_INT >= 35) {
                    // View#setRequestedFrameRate: REQUESTED_FRAME_RATE_CATEGORY_HIGH is -4,
                    // NaN restores the default.
                    View.class.getMethod("setRequestedFrameRate", float.class)
                            .invoke(this, wanted ? -4f : Float.NaN);
                }
                android.app.Activity activity = Views.findActivity(getContext());
                android.view.Window window = activity == null ? null : activity.getWindow();
                if (window == null) return;
                float rate = wanted ? highestRefreshRate() : 0f;
                // The comment surface picks the change up with its next frame.
                requestFrame();
                android.view.WindowManager.LayoutParams attributes = window.getAttributes();
                if (attributes.preferredRefreshRate != rate) {
                    attributes.preferredRefreshRate = rate;
                    window.setAttributes(attributes);
                }
                if (Log.isLoggable(TAG, Log.DEBUG)) {
                    Log.d(TAG, "Smooth frames=" + wanted + " rate=" + rate);
                }
            } catch (Throwable throwable) {
                Log.w(TAG, "Unable to request the refresh rate", throwable);
            }
        }

        /** Fastest mode of the current resolution, within the frame rate limit if one is set. */
        private float highestRefreshRate() {
            android.view.Display display = getDisplay();
            if (display == null) return 0f;
            android.view.Display.Mode current = display.getMode();
            int limit = DanmakuSettings.getMaxFps();
            float best = limit > 0 ? 0f : current.getRefreshRate();
            for (android.view.Display.Mode mode : display.getSupportedModes()) {
                float rate = mode.getRefreshRate();
                if (mode.getPhysicalWidth() == current.getPhysicalWidth()
                        && mode.getPhysicalHeight() == current.getPhysicalHeight()
                        && (limit <= 0 || rate <= limit + 0.5f)) {
                    best = Math.max(best, rate);
                }
            }
            if (best <= 0f) best = Math.min(current.getRefreshRate(), limit);
            // Also on a 60 Hz panel: while a video plays the system may render at a divisor of
            // the panel rate (30 Hz, or 24 Hz for film) unless a layer asks for more.
            return best;
        }

        /** Frame times (vsync) and the comment clock at each frame, for the statistics. */
        private final long[] frameUptimes = new long[256];
        private final long[] frameClocks = new long[256];
        private int frameIndex;
        private final Paint statsPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint statsBackground = new Paint();

        private void recordFrame(long frameUptime, long clock) {
            int slot = frameIndex++ & 255;
            frameUptimes[slot] = frameUptime;
            frameClocks[slot] = clock;
        }

        /**
         * Small diagnostic line over the video: frames drawn in the last second, the longest
         * gap between them, how unevenly the comment clock advanced, the display refresh
         * rate, and how often YouTube reports the media time.
         */
        private void drawStats(Canvas canvas) {
            long newest = frameUptimes[(frameIndex - 1) & 255];
            int frames = 0;
            long maxGap = 0;
            long maxClockJump = 0;
            for (int i = 1; i < Math.min(frameIndex, 255); i++) {
                int slot = (frameIndex - i) & 255;
                int previous = (frameIndex - i - 1) & 255;
                if (newest - frameUptimes[slot] >= 1_000L) break;
                frames++;
                long gap = frameUptimes[slot] - frameUptimes[previous];
                maxGap = Math.max(maxGap, gap);
                // How far the comments moved compared with how much time passed.
                long jump = Math.abs((frameClocks[slot] - frameClocks[previous])
                        - (long) (gap * playbackSpeed()));
                maxClockJump = Math.max(maxClockJump, jump);
            }
            android.view.Display display = getDisplay();
            int hz = display == null ? 0 : Math.round(display.getRefreshRate());
            String text = String.format(java.util.Locale.US,
                    "%d fps  gap %dms  jump %dms  %dHz%s  clock %dms  %s",
                    frames, maxGap, maxClockJump, hz, smoothRequested ? "+" : "",
                    io.github.sabopura.morphe.extension.youtube.shared.PlayerHooks.clockIntervalMs(),
                    surfaceActive ? "layer" : "window");
            float density = getResources().getDisplayMetrics().density;
            statsPaint.setTextSize(12 * density);
            statsPaint.setColor(0xFFFFFFFF);
            statsBackground.setColor(0xA0000000);
            float x = videoRect.left + 6 * density;
            float y = videoRect.bottom - 6 * density;
            canvas.drawRect(x - 3 * density, y + statsPaint.ascent() - 2 * density,
                    x + statsPaint.measureText(text) + 3 * density, y + 4 * density,
                    statsBackground);
            canvas.drawText(text, x, y, statsPaint);
            if (io.github.sabopura.morphe.extension.youtube.shared.FeatureFlags.ambientLight()) {
                String[] lines = io.github.sabopura.morphe.extension.youtube.ambient
                        .AmbientLightController.debugLine().split("\n");
                // At the top of the video: YouTube's captions cover the bottom.
                float step = statsPaint.descent() - statsPaint.ascent() + 4 * density;
                float lineY = videoRect.top + 4 * density - statsPaint.ascent();
                for (int index = 0; index < lines.length; index++, lineY += step) {
                    canvas.drawRect(x - 3 * density, lineY + statsPaint.ascent() - 2 * density,
                            x + statsPaint.measureText(lines[index]) + 3 * density,
                            lineY + 4 * density, statsBackground);
                    canvas.drawText(lines[index], x, lineY, statsPaint);
                }
            }
        }

        /** Keeps animating only while something can move; otherwise sleeps until needed. */
        private void scheduleNextFrame(long frameUptime, int drawn, long now, long nextStart) {
            if (!isAnimating(frameUptime)) return;
            if (drawn > 0) {
                requestFrame();
            } else if (nextStart != Long.MAX_VALUE) {
                long delay = (long) ((nextStart - now) / playbackSpeed());
                if (delay <= 16) {
                    requestFrame();
                } else {
                    postDelayed(invalidateRunnable, Math.min(delay - 8, 1_000L));
                }
            }
        }

        private void logDraw(int drawn, long now) {
            long realtime = SystemClock.uptimeMillis();
            if (drawn > 0 && Log.isLoggable(TAG, Log.DEBUG)
                    && realtime - lastDrawLogMs >= 2_000) {
                lastDrawLogMs = realtime;
                Log.d(TAG, "Drawn=" + drawn + " time=" + now
                        + " rect=" + videoRect.toShortString());
            }
        }

        private static int firstPossiblyVisible(List<ScheduledComment> scheduled, long fromTime) {
            int low = 0;
            int high = scheduled.size();
            while (low < high) {
                int middle = (low + high) >>> 1;
                if (scheduled.get(middle).timeMs < fromTime) low = middle + 1;
                else high = middle;
            }
            return low;
        }

        private void preparePaint(float textSize) {
            int sizeBits = Float.floatToIntBits(textSize);
            int generation = DanmakuSettings.getStyleGeneration();
            if (generation == paintStyleGeneration && sizeBits == paintTextSizeBits) return;
            paintStyleGeneration = generation;
            paintTextSizeBits = sizeBits;
            textPaint.setTextSize(textSize);
            textPaint.setTypeface(DanmakuSettings.isBold() ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
            textPaint.getFontMetrics(metrics);
        }

        private void drawWithNode(Canvas canvas, ScheduledComment comment, float x, float top,
                                  int styleKey) {
            CachedNode cached = nodeCache.get(comment.id);
            if (cached == null) {
                cached = new CachedNode(comment.id);
                nodeCache.put(comment.id, cached);
            }
            boolean stale = cached.styleKey != styleKey || !cached.node.hasDisplayList()
                    || (cached.pendingImages && cached.imageGeneration != imageGeneration);
            if (stale) {
                float padding = textPaint.getTextSize() * 0.25f;
                int width = (int) Math.ceil(comment.width + padding * 2);
                int height = (int) Math.ceil(metrics.bottom - metrics.top + padding * 2);
                cached.node.setPosition(0, 0, Math.max(1, width), Math.max(1, height));
                cached.node.setTranslationX(-padding);
                cached.node.setTranslationY(-padding);
                RecordingCanvas recording = cached.node.beginRecording(width, height);
                try {
                    cached.imageGeneration = imageGeneration;
                    cached.pendingImages = drawContent(recording, comment.content, comment.color,
                            padding, padding - metrics.top);
                } finally {
                    cached.node.endRecording();
                }
                cached.styleKey = styleKey;
            }
            int save = canvas.save();
            canvas.translate(x, top);
            canvas.drawRenderNode(cached.node);
            canvas.restoreToCount(save);
        }

        private void ensureSchedule(int laneCount, long durationMs, float gapPx) {
            int textSizeBits = Float.floatToIntBits(textPaint.getTextSize());
            int speedMode = DanmakuSettings.getSpeedMode();
            int crowdMode = DanmakuSettings.getCrowdMode();
            boolean geometryChanged = scheduleVideoWidth != videoRect.width()
                    || scheduleLaneCount != laneCount
                    || scheduleDurationMs != durationMs
                    || scheduleTextSizeBits != textSizeBits
                    || scheduleSpeedMode != speedMode
                    || scheduleCrowdMode != crowdMode;
            if (!scheduleDirty && !geometryChanged && !forceFullSchedule) return;
            if (geometryChanged || forceFullSchedule) {
                placements.clear();
                omittedIds.clear();
            }

            long length = Math.max(1, videoLengthMs);
            float videoWidth = videoRect.width();
            // Constant speed: a quarter-width comment takes the configured duration.
            float pixelsPerMs = (videoWidth * 1.25f) / Math.max(1L, durationMs);
            Map<String, RawComment> byId = new HashMap<>(rawComments.size() * 2);
            List<CollisionLaneScheduler.Candidate> candidates = new ArrayList<>();
            for (RawComment comment : rawComments) {
                long timeMs = comment.explicitTimeMs;
                if (timeMs < 0 || (comment.source != Source.STREAM && timeMs > length)) continue;
                String id = comment.scheduleId();
                byId.put(id, comment);
                if (placements.containsKey(id) || omittedIds.containsKey(id)) continue;
                float width = measureContent(comment.content, textPaint.getTextSize());
                long commentDuration = speedMode == DanmakuSettings.SPEED_CONSTANT_SPEED
                        ? Math.max(1_000L, (long) ((videoWidth + width) / pixelsPerMs))
                        : durationMs;
                long maxDelay = comment.source == Source.REGULAR_UNTIMED
                        ? durationMs : 2_000L;
                candidates.add(new CollisionLaneScheduler.Candidate(
                        id, timeMs, maxDelay, width, comment.priority(), commentDuration));
            }

            List<CollisionLaneScheduler.Placement> retained = new ArrayList<>();
            for (CollisionLaneScheduler.Placement placement : placements.values()) {
                if (byId.containsKey(placement.id)) retained.add(placement);
            }
            CollisionLaneScheduler.Result result = CollisionLaneScheduler.schedule(
                    candidates, retained, laneCount, videoWidth, durationMs, gapPx,
                    crowdMode == DanmakuSettings.CROWD_OVERLAP);
            placements.clear();
            placements.putAll(result.byId());
            for (String omitted : result.omittedIds) omittedIds.put(omitted, true);

            List<ScheduledComment> rebuilt = new ArrayList<>(placements.size());
            long longest = durationMs;
            for (CollisionLaneScheduler.Placement placement : result.placements) {
                RawComment raw = byId.get(placement.id);
                if (raw == null) continue;
                long placementDuration = placement.durationMs > 0
                        ? placement.durationMs : durationMs;
                longest = Math.max(longest, placementDuration);
                rebuilt.add(new ScheduledComment(placement.id, raw.content, raw.color,
                        placement.timeMs, placementDuration, placement.lane, placement.width));
            }
            // result.placements is already ordered by start time.
            scheduledComments = Collections.unmodifiableList(rebuilt);
            maxDurationMs = longest;
            scheduleVideoWidth = videoRect.width();
            scheduleLaneCount = laneCount;
            scheduleDurationMs = durationMs;
            scheduleTextSizeBits = textSizeBits;
            scheduleSpeedMode = speedMode;
            scheduleCrowdMode = crowdMode;
            scheduleDirty = false;
            forceFullSchedule = false;
            if (Log.isLoggable(TAG, Log.DEBUG)) {
                Log.d(TAG, "Schedule raw=" + rawComments.size()
                        + " ready=" + rebuilt.size() + " omitted="
                        + result.omittedCount() + " length=" + length
                        + " kind=" + videoKind + " lanes=" + laneCount);
            }
        }

        private float measureContent(RichCommentText content, float emojiSize) {
            float width = 0f;
            int cursor = 0;
            for (RichCommentText.InlineImage image : content.images) {
                if (image.offset > cursor) {
                    width += textPaint.measureText(content.text, cursor, image.offset);
                }
                // Starts the download early; the slot width never depends on the result.
                imageCache.get(image.url, DanmakuOverlayView::onImageReady);
                width += Math.max(emojiSize, textPaint.measureText(fallbackLabel(image)));
                cursor = Math.min(content.text.length(), image.offset + 1);
            }
            if (cursor < content.text.length()) {
                width += textPaint.measureText(content.text, cursor, content.text.length());
            }
            return Math.max(1f, width);
        }

        private static void onImageReady() {
            imageGeneration++;
            invalidateAllOverlays();
        }

        /**
         * Draws outline/shadow and fill for one comment.
         *
         * @return true when an inline image was not yet available (a label was drawn instead).
         */
        private boolean drawContent(Canvas canvas, RichCommentText content, int color,
                                    float x, float baseline) {
            int style = DanmakuSettings.getTextStyle();
            int fillAlpha = Math.round(255 * (DanmakuSettings.getOpacity() / 100f));
            float textSize = textPaint.getTextSize();
            boolean pending = false;
            if (style != DanmakuSettings.STYLE_SHADOW) {
                textPaint.setStyle(Paint.Style.STROKE);
                textPaint.setStrokeJoin(Paint.Join.ROUND);
                textPaint.setStrokeWidth(Math.max(2f, textSize * 0.12f));
                textPaint.setColor(Color.BLACK);
                textPaint.setAlpha(Math.min(230, fillAlpha));
                if (style == DanmakuSettings.STYLE_OUTLINE_AND_SHADOW) {
                    textPaint.setShadowLayer(textSize * 0.12f, 0, textSize * 0.05f,
                            Color.argb(Math.min(200, fillAlpha), 0, 0, 0));
                }
                pending |= drawRuns(canvas, content, x, baseline, false);
                textPaint.clearShadowLayer();
            }
            textPaint.setStyle(Paint.Style.FILL);
            textPaint.setColor(color != 0 ? color : Color.WHITE);
            textPaint.setAlpha(fillAlpha);
            if (style == DanmakuSettings.STYLE_SHADOW) {
                textPaint.setShadowLayer(textSize * 0.15f, 0, textSize * 0.06f,
                        Color.argb(Math.min(230, fillAlpha), 0, 0, 0));
            }
            imagePaint.setAlpha(fillAlpha);
            pending |= drawRuns(canvas, content, x, baseline, true);
            textPaint.clearShadowLayer();
            return pending;
        }

        private boolean drawRuns(Canvas canvas, RichCommentText content, float x,
                                 float baseline, boolean drawImages) {
            float cursorX = x;
            int cursor = 0;
            float emojiSize = textPaint.getTextSize();
            boolean pending = false;
            String text = content.text;
            for (RichCommentText.InlineImage image : content.images) {
                if (image.offset > cursor) {
                    canvas.drawText(text, cursor, image.offset, cursorX, baseline, textPaint);
                    cursorX += textPaint.measureText(text, cursor, image.offset);
                }
                Bitmap bitmap = imageCache.get(image.url, DanmakuOverlayView::onImageReady);
                String fallback = fallbackLabel(image);
                float slotWidth = Math.max(emojiSize, textPaint.measureText(fallback));
                if (bitmap != null) {
                    if (drawImages) {
                        float centerY = baseline + (metrics.ascent + metrics.descent) / 2f;
                        float imageLeft = cursorX + (slotWidth - emojiSize) / 2f;
                        scratchRectF.set(imageLeft, centerY - emojiSize / 2f,
                                imageLeft + emojiSize, centerY + emojiSize / 2f);
                        canvas.drawBitmap(bitmap, null, scratchRectF, imagePaint);
                    }
                } else {
                    pending = true;
                    canvas.drawText(fallback, cursorX, baseline, textPaint);
                }
                cursorX += slotWidth;
                cursor = Math.min(text.length(), image.offset + 1);
            }
            if (cursor < text.length()) {
                canvas.drawText(text, cursor, text.length(), cursorX, baseline, textPaint);
            }
            return pending;
        }

        private String fallbackLabel(RichCommentText.InlineImage image) {
            String label = image.label.isEmpty() ? "emoji" : image.label;
            if (label.length() > 32) label = label.substring(0, 32);
            return ':' + label + ':';
        }

        @Override protected void onSizeChanged(int width, int height,
                                               int oldWidth, int oldHeight) {
            super.onSizeChanged(width, height, oldWidth, oldHeight);
            surfaceTracker.invalidate();
            loggedVideoRect = false;
            forceFullSchedule = true;
            scheduleDirty = true;
            if (Log.isLoggable(TAG, Log.DEBUG)) {
                Log.d(TAG, "Overlay size=" + width + 'x' + height);
            }
        }

        /** Maps a rectangle in {@code view}'s coordinates into its window's coordinates. */
        private static void mapToWindow(View view, RectF rect) {
            View current = view;
            while (true) {
                android.graphics.Matrix matrix = current.getMatrix();
                if (!matrix.isIdentity()) matrix.mapRect(rect);
                rect.offset(current.getLeft(), current.getTop());
                ViewParent parent = current.getParent();
                if (!(parent instanceof View)) return;
                View parentView = (View) parent;
                rect.offset(-parentView.getScrollX(), -parentView.getScrollY());
                current = parentView;
            }
        }

        private boolean resolveVideoRect() {
            View target = surfaceTracker.find(windowRoot.get());
            videoTarget = new WeakReference<>(target);
            if (target == null) target = controlsRoot.get();
            if (target == null || !target.isShown() || target.getWidth() <= 0
                    || target.getHeight() <= 0) {
                videoRect.setEmpty();
                return false;
            }
            // The whole video in window coordinates, including the scaling YouTube applies
            // while the miniplayer animates. The visible part alone would distort the
            // comments when the player is partly off screen.
            scratchRectF.set(0, 0, target.getWidth(), target.getHeight());
            mapToWindow(target, scratchRectF);
            getLocationInWindow(location);
            scratchRectF.offset(-location[0], -location[1]);
            scratchRectF.round(scratchRect);
            if (scratchRect.isEmpty() || scratchRect.right <= 0 || scratchRect.bottom <= 0
                    || scratchRect.left >= getWidth() || scratchRect.top >= getHeight()) {
                videoRect.setEmpty();
                return false;
            }
            videoRect.set(scratchRect);
            // The overlay covers the whole window, so every animation frame used to mark the
            // whole window as changed: the page, the ambient light and everything else were
            // composited again 60-120 times a second just to move the comments. Clipping the
            // view to the video limits each frame's damage to the video area.
            if (!videoRect.equals(getClipBounds())) setClipBounds(new Rect(videoRect));
            if (!loggedVideoRect && Log.isLoggable(TAG, Log.DEBUG)) {
                loggedVideoRect = true;
                Log.d(TAG, "Video rect=" + videoRect.toShortString()
                        + " target=" + target.getClass().getSimpleName());
            }
            ViewParent parent = getParent();
            if (parent instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) parent;
                if (group.indexOfChild(this) != group.getChildCount() - 1) bringToFront();
            }
            return true;
        }
    }

    private static final class FetchCallback implements InnertubeCommentClient.Callback {
        private final String videoId;
        private final int generation;

        FetchCallback(String videoId, int generation) {
            this.videoId = videoId;
            this.generation = generation;
        }

        private boolean current() {
            return generation == videoGeneration && videoId.equals(currentVideoId);
        }

        @Override public boolean onVideoKind(InnertubeCommentClient.VideoKind kind,
                                              long streamStartEpochMs) {
            if (!current()) return false;
            if (videoKind != kind) {
                videoKind = kind;
                rebuildAllOverlays();
            }
            return isKindEnabled(kind);
        }

        @Override public int onRegularComments(
                List<InnertubeResponseParser.CommentData> incoming) {
            return current() ? addRegularComments(generation, incoming) : Integer.MAX_VALUE;
        }

        @Override public void onLiveComments(
                List<InnertubeResponseParser.CommentData> incoming,
                long streamStartEpochMs, boolean firstBatch) {
            if (current()) addLiveComments(generation, incoming, streamStartEpochMs, firstBatch);
        }

        @Override public boolean isStreamBufferFull() {
            return !current() || DanmakuController.isStreamBufferFull();
        }

        @Override public long getCurrentVideoTimeMs() {
            return getInterpolatedVideoTime();
        }

        @Override public void onFetchState(String state) {
            if (current() && Log.isLoggable(TAG, Log.DEBUG)) {
                int regular;
                int stream;
                synchronized (COMMENT_LOCK) {
                    regular = regularComments.size();
                    stream = streamComments.size();
                }
                Log.d(TAG, "Fetch state=" + state + " generation=" + generation
                        + " kind=" + videoKind + " regular=" + regular
                        + " stream=" + stream);
            }
        }
    }
}
