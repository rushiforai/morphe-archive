package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Canvas;
import android.graphics.Bitmap;
import android.graphics.Paint;
import android.util.Log;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/** Rendering adapter for the ordinary video and popup comment layers. */
public final class ScrollingComments267 {
    private static final WeakHashMap<Object, State> STATES = new WeakHashMap<>();
    // An explicit cap prevents comment-count-dependent bitmap memory growth.
    private static final long RASTER_LIMIT_BYTES = 12L * 1024 * 1024;
    private static final int MAX_RASTER_PIXELS = 60_000;
    private static final int MAX_RASTERS_PER_FRAME = 2;

    private static final ThreadLocal<Object> CONTEXT = new ThreadLocal<>();

    private static final class Channel {
        Channel() {}

        final CommentSource280 source = new CommentSource280();
        final ArrayDeque<CommentSource280.Item> hidden = new ArrayDeque<>();
        // Retain unprocessed arrivals when a frame runs out of time; never drop
        // comments already advanced past the indexed source cursor.
        final ArrayDeque<CommentSource280.Item> pending = new ArrayDeque<>();
        float previousVideo = Float.POSITIVE_INFINITY;
        float batchVideo, batchVisual, batchPreviousVideo, batchRate;
        int batchDuration;
        long generation = Long.MIN_VALUE;
        long windowStartedNs, lastFrameNs, frames, longGaps;
        long renderNs, renderMaxNs, scanNs, scanMaxNs, longestGapNs;
        long lastDrawEndNs, outsideNs, outsideMaxNs, outsideSamples;
        long admitNs, admitMaxNs, glyphNs, glyphMaxNs;
        boolean tracedCaller;
        long rasterHits, rasterMisses, rasterBuilds, rasterRejected, directDraws;
        final int[] intervalMs = new int[101];
    }

    private static final class State {
        final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint outline = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint.FontMetrics metrics = new Paint.FontMetrics();
        final ScrollingTimeline267 timeline = new ScrollingTimeline267();
        final Channel[] channels = {new Channel(), new Channel()};
        final WeakHashMap<q, Object> keys = new WeakHashMap<>();
        final ArrayDeque<ScrollingTimeline267.Entry> waiting = new ArrayDeque<>();
        final Field nativeOpacity;
        final WeakReference<Context> context;
        long generation = Long.MIN_VALUE;
        long previousSkipped, previousShown;
        final IdentityHashMap<ScrollingTimeline267.Entry, Bitmap> rasters = new IdentityHashMap<>();
        final Paint rasterPaint = new Paint(Paint.FILTER_BITMAP_FLAG);
        long rasterBytes;
        boolean rasterDisabled, rasterReady, rasterModeKnown, rasterEnabled;
        int rasterWidth, rasterHeight, rasterOpacity, rasterMode, rasterFrames, rasterBuildsThisFrame;
        float rasterSize, rasterShadow;

        State(Object renderer) {
            context = new WeakReference<>(((View) renderer).getContext());
            Field opacity;
            try {
                opacity = renderer.getClass().getField(isPopup(renderer) ? "W" : "a0");
            } catch (NoSuchFieldException unavailable) {
                opacity = null;
            }
            nativeOpacity = opacity;
        }
    }

    private ScrollingComments267() {}

    /** The native fixed-comment pass needs a Context-typed register on every path. */
    public static Context fixedContext(ThreadLocal<?> current) {
        Object value = CONTEXT.get();
        if (!(value instanceof WeakReference<?>)) return null;
        Object context = ((WeakReference<?>) value).get();
        return context instanceof Context ? (Context) context : null;
    }


    public static ArrayList<?> draw(Object renderer, Canvas canvas, ArrayList<?> input, boolean secondary) {
        final long frameStartNs = System.nanoTime();
        State state;
        synchronized (STATES) {
            state = STATES.get(renderer);
            if (state == null) {
                state = new State(renderer);
                STATES.put(renderer, state);
            }
        }
        Context context = ((View) renderer).getContext();
        CONTEXT.set(state.context);
        boolean strict = CommentOptions.prefs(context).getBoolean("comment_avoid_overlap", false);
        int duration = 100 * CommentOptions.value(context, "comment_duration_seconds", 5, 1, 20);
        boolean fontChanged = CommentStyle.apply(state.fill, context);
        if (state.nativeOpacity != null) {
            try {
                state.nativeOpacity.setInt(renderer, 255);
            } catch (IllegalAccessException unavailable) {
                // The configured paint alpha still applies.
            }
        }
        int width = CommentViewport190.width(renderer, canvas);
        int height = CommentViewport190.height(renderer, canvas);
        float visual = CommentMotion.position(renderer);
        CommentClock.Sample sample = CommentClock.frameSample(renderer);
        float video = sample.position / 10f;
        float rate = Float.isFinite(sample.rate) && sample.rate >= .1f ? sample.rate : 1f;
        long generation = CommentMotion.generation(renderer);
        if (state.generation != generation) {
            clearRasters(state);
            state.waiting.clear();
            state.generation = generation;
        }

        ScrollingTimeline267.FrameBudget budget = new ScrollingTimeline267.FrameBudget();
        Channel channel = state.channels[secondary ? 1 : 0];
        CommentSource280 source = channel.source;
        long scanStartNs = System.nanoTime();
        boolean changed = source.update(input);
        long sourceScanNs = System.nanoTime() - scanStartNs;
        source.fixedDuration(duration);
        int rows = CommentOptions.value(context, "comment_rows", 10, 1, 20);
        float size = (shorts(context) ? Math.min(width, height) : height)
                / 14f * CommentOptions.size(context) / 100f;
        state.timeline.resizeViewport(generation, width, height, size, visual, state.waiting);
        state.timeline.frame(generation, video, visual);
        int opacity = Math.round(CommentOptions.opacity(context) * 255f / 100f);
        float shadow = CommentOptions.shadow(context) * context.getResources().getDisplayMetrics().density;
        int mode = shadowMode(context);
        float padding = mode == 0 ? shadow * .5f + 1f : shadow + 1f;
        boolean rasterEnabled = CommentOptions.prefs(context)
                .getBoolean("nicoid_comment_raster_ab", false);
        if (!state.rasterModeKnown || state.rasterEnabled != rasterEnabled) {
            clearRasters(state);
            state.rasterReady = false;
            state.rasterDisabled = false;
            state.rasterEnabled = rasterEnabled;
            state.rasterModeKnown = true;
            Log.i("nicoid-comment-perf", "raster-mode="
                    + (rasterEnabled ? "bitmap" : "direct")
                    + " channel=" + (secondary ? "secondary" : "primary"));
        }
        if (rasterEnabled) {
            prepareRasters(state, fontChanged, width, height, size, opacity, shadow, mode);
            if ((++state.rasterFrames & 63) == 0) pruneRasters(state);
        }

        if (width > 0 && height > 0) {
            boolean reset = channel.generation != generation;
            if (reset) {
                channel.previousVideo = Float.POSITIVE_INFINITY;
                channel.hidden.clear();
                channel.pending.clear();
                channel.generation = generation;
            } else if (changed) {
                channel.hidden.clear();
                // The source was replaced: reindex remaining arrivals against
                // the new list instead of admitting stale references.
                channel.pending.clear();
            }
            if (!state.waiting.isEmpty()) {
                // Prioritize existing waiters even when arrivals are continuous.
                // Otherwise a dense stream could starve old strict-mode entries.
                state.timeline.showWaiting(state.waiting, strict, width, height, rows, visual, budget);
            }
            float earliest = Math.min(state.timeline.origin, video - duration * rate);
            boolean inspectedWindow = !channel.pending.isEmpty();
            if (channel.pending.isEmpty()) {
                int fetchLimit = budget.remaining();
                inspectedWindow = fetchLimit > 0;
                if (reset || changed || !source.hasBatch()) {
                    channel.batchVideo = video;
                    channel.batchVisual = visual;
                    channel.batchPreviousVideo = channel.previousVideo;
                    channel.batchRate = rate;
                    channel.batchDuration = duration;
                }
                source.due(generation, changed, earliest, video, fetchLimit);
                for (int i = 0; i < source.due.size(); i++) {
                    channel.pending.addLast(source.due.get(i));
                }
            }
            while (!channel.pending.isEmpty() && budget.take()) {
                CommentSource280.Item item = channel.pending.removeFirst();
                // Preserve eligibility at the batch cutoff even if several frames
                // elapse before this item gets its turn.
                if ((channel.batchVideo - item.timestamp) / channel.batchRate >= channel.batchDuration
                        && item.timestamp < state.timeline.origin) continue;
                if (item.comment.o) {
                    if ((video - item.timestamp) / rate < duration) channel.hidden.addLast(item);
                    continue;
                }
                float start = ScrollingTimeline267.admissionStart(strict, item.timestamp,
                        channel.batchPreviousVideo, channel.batchVideo, channel.batchVisual,
                        visual, channel.batchRate, channel.batchDuration);
                admit(state, channel, item, strict, width, height, rows, size, padding,
                        duration, visual, start);
            }
            // Do not append hidden items to a partially delivered source batch.
            int hiddenChecks = Math.min(channel.hidden.size(), Math.min(16, budget.remaining()));
            for (int i = 0; i < hiddenChecks && budget.take(); i++) {
                CommentSource280.Item item = channel.hidden.removeFirst();
                if ((video - item.timestamp) / rate >= duration) continue;
                if (item.comment.o) channel.hidden.addLast(item);
                else admit(state, channel, item, strict, width, height, rows, size,
                        padding, duration, visual, visual);
            }
            state.timeline.showWaiting(state.waiting, strict, width, height, rows, visual, budget);
            if (inspectedWindow && channel.pending.isEmpty() && !source.hasBatch()) {
                float previous = Float.isFinite(channel.previousVideo)
                        ? channel.previousVideo : channel.batchVideo;
                channel.previousVideo = Math.max(previous, channel.batchVideo);
            }
        }

        long admitNs = System.nanoTime() - (scanStartNs + sourceScanNs);
        Paint fill = state.fill;
        if (mode == 1 && shadow > 0f) fill.setShadowLayer(shadow, 0, 0, 0xff000000);
        else fill.clearShadowLayer();
        boolean stroke = mode == 0 && shadow > 0f;
        if (stroke) {
            Paint outline = state.outline;
            outline.set(fill);
            outline.setStyle(Paint.Style.STROKE);
            outline.setStrokeWidth(shadow);
            outline.setColor(0xff000000);
            outline.setAlpha(opacity);
        }
        state.rasterBuildsThisFrame = 0;
        long glyphStartNs = System.nanoTime();
        ArrayList<ScrollingTimeline267.Entry> active = state.timeline.active;
        for (int i = 0; i < active.size(); i++) {
            ScrollingTimeline267.Entry entry = active.get(i);
            float x = entry.left(visual);
            if (entry.channel == channel && x - entry.padding < width) {
                drawEntry(state, channel, canvas, entry, x, opacity, stroke, shadow, rasterEnabled);
            }
        }
        FixedCommentCollision.begin(canvas, strict, secondary, visual, shadow + 2f);
        recordFrame(state, channel, strict, secondary, input.size(), frameStartNs,
                sourceScanNs, admitNs, System.nanoTime() - glyphStartNs);
        return source.fixed;
    }


    /** Sample draw-callback cadence and Java work; this is not on-screen FPS. */
    private static void recordFrame(State state, Channel channel, boolean strict,
                                    boolean secondary, int sourceCount, long startNs,
                                    long sourceScanNs, long admissionNs, long glyphDrawNs) {
        long endNs = System.nanoTime();
        if (channel.windowStartedNs == 0L) channel.windowStartedNs = startNs;
        if (!channel.tracedCaller) {
            channel.tracedCaller = true;
            Log.i("nicoid-comment-perf", "callback-path thread="
                    + Thread.currentThread().getName() + " channel="
                    + (secondary ? "secondary" : "primary") + " stack=" + callerPath());
        }
        if (channel.lastDrawEndNs != 0L && startNs >= channel.lastDrawEndNs) {
            long outside = startNs - channel.lastDrawEndNs;
            channel.outsideNs += outside;
            channel.outsideMaxNs = Math.max(channel.outsideMaxNs, outside);
            channel.outsideSamples++;
        }
        if (channel.lastFrameNs > 0L) {
            long gap = Math.max(0L, startNs - channel.lastFrameNs);
            int bucket = (int) Math.min(100L, gap / 1_000_000L);
            channel.intervalMs[bucket]++;
            channel.longestGapNs = Math.max(channel.longestGapNs, gap);
            if (gap > 50_000_000L) channel.longGaps++;
        }
        channel.lastFrameNs = startNs;
        channel.frames++;
        long renderNs = Math.max(0L, endNs - startNs);
        channel.renderNs += renderNs;
        channel.renderMaxNs = Math.max(channel.renderMaxNs, renderNs);
        channel.scanNs += sourceScanNs;
        channel.scanMaxNs = Math.max(channel.scanMaxNs, sourceScanNs);
        channel.admitNs += admissionNs;
        channel.admitMaxNs = Math.max(channel.admitMaxNs, admissionNs);
        channel.glyphNs += glyphDrawNs;
        channel.glyphMaxNs = Math.max(channel.glyphMaxNs, glyphDrawNs);
        channel.lastDrawEndNs = endNs;
        if (endNs - channel.windowStartedNs < 10_000_000_000L) return;
        long n = Math.max(1L, channel.frames);
        float seconds = Math.max(.001f, (endNs - channel.windowStartedNs) / 1_000_000_000f);
        long skipped = state.timeline.skippedByOverlap;
        long shown = state.timeline.shownFromWaiting;
        Log.i("nicoid-comment-perf", "draw-callback fps=" + (channel.frames / seconds)
                + " mode=" + (secondary ? "secondary" : "primary")
                + " overlap=" + strict + " source=" + sourceCount
                + " active=" + state.timeline.active.size()
                + " pending=" + channel.pending.size() + " waiting=" + state.waiting.size()
                + " rasterMode=" + (state.rasterEnabled ? "bitmap" : "direct")
                + " directDraws=" + channel.directDraws
                + " rasterHits=" + channel.rasterHits
                + " rasterMisses=" + channel.rasterMisses
                + " rasterBuilds=" + channel.rasterBuilds
                + " rasterRejected=" + channel.rasterRejected
                + " rasterKiB=" + (state.rasterBytes / 1024)
                + " outsideAvgMs=" + (channel.outsideNs / Math.max(1L, channel.outsideSamples) / 1_000_000f)
                + " outsideMaxMs=" + (channel.outsideMaxNs / 1_000_000f)
                + " admitAvgMs=" + (channel.admitNs / n / 1_000_000f)
                + " admitMaxMs=" + (channel.admitMaxNs / 1_000_000f)
                + " glyphAvgMs=" + (channel.glyphNs / n / 1_000_000f)
                + " glyphMaxMs=" + (channel.glyphMaxNs / 1_000_000f)
                + " scanAvgMs=" + (channel.scanNs / n / 1_000_000f)
                + " scanMaxMs=" + (channel.scanMaxNs / 1_000_000f)
                + " drawAvgMs=" + (channel.renderNs / n / 1_000_000f)
                + " drawMaxMs=" + (channel.renderMaxNs / 1_000_000f)
                + " intervalP95Ms=" + percentile(channel.intervalMs, .95f)
                + " intervalP99Ms=" + percentile(channel.intervalMs, .99f)
                + " gapMaxMs=" + (channel.longestGapNs / 1_000_000f)
                + " gapsOver50ms=" + channel.longGaps
                + " skippedOverlapRendererDelta=" + (skipped - state.previousSkipped)
                + " startedFromWaiting=" + (shown - state.previousShown));
        state.previousSkipped = skipped;
        state.previousShown = shown;
        channel.windowStartedNs = endNs;
        channel.frames = channel.renderNs = channel.renderMaxNs = channel.scanNs = 0L;
        channel.scanMaxNs = channel.longestGapNs = channel.longGaps = 0L;
        channel.outsideNs = channel.outsideMaxNs = channel.outsideSamples = 0L;
        channel.admitNs = channel.admitMaxNs = channel.glyphNs = channel.glyphMaxNs = 0L;
        channel.rasterHits = channel.rasterMisses = channel.rasterBuilds = channel.rasterRejected = channel.directDraws = 0L;
        java.util.Arrays.fill(channel.intervalMs, 0);
    }

    private static String callerPath() {
        StackTraceElement[] stack = Thread.currentThread().getStackTrace();
        StringBuilder out = new StringBuilder(180);
        int added = 0;
        for (StackTraceElement frame : stack) {
            String name = frame.getClassName();
            if (name.startsWith("java.lang.Thread")
                    || name.equals(ScrollingComments267.class.getName())) continue;
            if (added != 0) out.append(" <- ");
            out.append(name).append(".").append(frame.getMethodName());
            if (++added >= 7) break;
        }
        return out.toString();
    }

    private static int percentile(int[] histogram, float quantile) {
        long total = 0L;
        for (int n : histogram) total += n;
        if (total == 0L) return 0;
        long target = (long) Math.ceil(total * quantile);
        long reached = 0L;
        for (int i = 0; i < histogram.length; i++) {
            reached += histogram[i];
            if (reached >= target) return i;
        }
        return histogram.length - 1;
    }

    private static void admit(State state, Channel channel, CommentSource280.Item item, boolean strict,
                              int width, int height, int rows, float size, float padding,
                              int duration, float visual, float start) {
        q comment = item.comment;
        Object key = state.keys.get(comment);
        if (key == null) {
            key = CommentContinuity118.key(comment);
            if (key == null) key = new Object();
            state.keys.put(comment, key);
        }
        if (!state.timeline.started.add(key)) return;

        int scale = CommentSource280.value(comment.i, 0);
        float textSize = size * (scale == 1 ? .67f : scale == 2 ? 1.42f : 1f);
        state.fill.setTextSize(textSize);
        state.fill.getFontMetrics(state.metrics);
        String text = String.valueOf(comment.a);
        String[] lines = text.indexOf('\n') < 0 ? new String[]{text} : text.split("\n", -1);
        float textWidth = 0;
        for (String line : lines) textWidth = Math.max(textWidth, state.fill.measureText(line));
        float paintedHeight = state.metrics.descent - state.metrics.ascent
                + (lines.length - 1) * textSize * 1.15f + 2f * padding;
        float x = width + padding;
        float speed = (x + textWidth + padding) / duration;
        float top = strict ? 0f : state.timeline.top(x - (visual - start) * speed, speed,
                textWidth, paintedHeight, padding, visual, rows, height);
        int color = CommentSource280.value(comment.f, -1);
        ScrollingTimeline267.Entry entry = new ScrollingTimeline267.Entry(channel, lines,
                color == 0 ? -1 : color, x, start, speed, textWidth,
                textSize, top, state.metrics.ascent - padding, paintedHeight, padding);
        if (strict) state.waiting.addLast(entry);
        else state.timeline.active.add(entry);
    }

    private static int shadowMode(Context context) {
        try {
            return Integer.parseInt(CommentOptions.prefs(context).getString("comment_shadow", "0"));
        } catch (RuntimeException invalidPreference) {
            return 0;
        }
    }

    private static boolean shorts(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                android.content.Intent intent = ((Activity) context).getIntent();
                return intent != null && intent.getBooleanExtra("nicoid_re_shorts", false);
            }
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return false;
    }

    private static boolean isPopup(Object renderer) {
        return "u".equals(renderer.getClass().getSimpleName());
    }

    private static void clearRasters(State state) {
        for (Bitmap image : state.rasters.values()) image.recycle();
        state.rasters.clear();
        state.rasterBytes = 0L;
    }

    private static void prepareRasters(State state, boolean fontChanged,
                                       int width, int height, float size,
                                       int opacity, float shadow, int mode) {
        if (fontChanged || !state.rasterReady || width != state.rasterWidth
                || height != state.rasterHeight || size != state.rasterSize
                || opacity != state.rasterOpacity || shadow != state.rasterShadow
                || mode != state.rasterMode) {
            clearRasters(state);
            state.rasterReady = true;
            state.rasterWidth = width;
            state.rasterHeight = height;
            state.rasterSize = size;
            state.rasterOpacity = opacity;
            state.rasterShadow = shadow;
            state.rasterMode = mode;
        }
    }

    /** Purge sprites once every 64 frames; never churn the cache during a busy frame. */
    private static void pruneRasters(State state) {
        if (state.rasters.isEmpty()) return;
        HashSet<ScrollingTimeline267.Entry> live = new HashSet<>(state.timeline.active);
        Iterator<Map.Entry<ScrollingTimeline267.Entry, Bitmap>> it =
                state.rasters.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<ScrollingTimeline267.Entry, Bitmap> item = it.next();
            if (live.contains(item.getKey())) continue;
            Bitmap image = item.getValue();
            state.rasterBytes -= image.getByteCount();
            image.recycle();
            it.remove();
        }
    }

    private static void drawEntry(State state, Channel channel, Canvas canvas,
                                  ScrollingTimeline267.Entry entry, float x,
                                  int opacity, boolean stroke, float shadow,
                                  boolean rasterEnabled) {
        if (!rasterEnabled) {
            Paint fill = state.fill;
            if (fill.getTextSize() != entry.size) fill.setTextSize(entry.size);
            if (fill.getColor() != entry.color) fill.setColor(entry.color);
            if (fill.getAlpha() != opacity) fill.setAlpha(opacity);
            Paint outline = state.outline;
            if (stroke && outline.getTextSize() != entry.size) outline.setTextSize(entry.size);
            channel.directDraws++;
            drawGlyphs(state, canvas, entry, x, entry.baseline, stroke);
            return;
        }
        // The cached image follows the original path without changing the active
        // comment's timing, position, lane or lifetime.
        int bleed = Math.max(4, (int) Math.ceil(4f + shadow * 3f));
        Bitmap image = state.rasters.get(entry);
        if (image != null && !image.isRecycled() && !canvas.isHardwareAccelerated()) {
            channel.rasterHits++;
            canvas.drawBitmap(image, x - bleed, entry.top - bleed, state.rasterPaint);
            return;
        }
        channel.rasterMisses++;
        Paint fill = state.fill;
        if (fill.getTextSize() != entry.size) fill.setTextSize(entry.size);
        if (fill.getColor() != entry.color) fill.setColor(entry.color);
        if (fill.getAlpha() != opacity) fill.setAlpha(opacity);
        Paint outline = state.outline;
        if (stroke && outline.getTextSize() != entry.size) outline.setTextSize(entry.size);
        boolean candidate = !state.rasterDisabled && !canvas.isHardwareAccelerated()
                && state.rasterBuildsThisFrame < MAX_RASTERS_PER_FRAME;
        if (candidate) {
            int w = (int) Math.ceil(entry.width + 2f * bleed);
            int h = (int) Math.ceil(entry.height + 2f * bleed);
            long pixels = (long) w * h;
            long bytes = pixels * 4L;
            if (w > 0 && h > 0 && pixels <= MAX_RASTER_PIXELS
                    && bytes <= RASTER_LIMIT_BYTES - state.rasterBytes) {
                try {
                    image = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
                    image.setDensity(Bitmap.DENSITY_NONE);
                    Canvas sprite = new Canvas(image);
                    drawGlyphs(state, sprite, entry, bleed, bleed - entry.ascent, stroke);
                    state.rasters.put(entry, image);
                    state.rasterBytes += image.getByteCount();
                    state.rasterBuildsThisFrame++;
                    channel.rasterBuilds++;
                    canvas.drawBitmap(image, x - bleed, entry.top - bleed, state.rasterPaint);
                    return;
                } catch (OutOfMemoryError allocationFailure) {
                    // Fallback to normal text drawing; avoid repeated allocations.
                    state.rasterDisabled = true;
                    clearRasters(state);
                }
            } else {
                channel.rasterRejected++;
            }
        }
        drawGlyphs(state, canvas, entry, x, entry.baseline, stroke);
    }

    private static void drawGlyphs(State state, Canvas canvas,
                                   ScrollingTimeline267.Entry entry,
                                   float x, float firstBaseline, boolean stroke) {
        float y = firstBaseline;
        Paint fill = state.fill;
        Paint outline = state.outline;
        for (String line : entry.lines) {
            if (stroke) CommentOutlineOpacity.drawLive(canvas, line, x, y, outline, fill);
            else canvas.drawText(line, x, y, fill);
            y += entry.size * 1.15f;
        }
    }
}
