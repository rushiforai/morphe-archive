package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** Rendering adapter for the ordinary video and popup comment layers. */
public final class ScrollingComments267 {
    private static final WeakHashMap<Object, State> STATES = new WeakHashMap<>();

    private static final ThreadLocal<Object> CONTEXT = new ThreadLocal<>();

    private static final class Channel {
        final CommentSource280 source = new CommentSource280();
        final ArrayDeque<CommentSource280.Item> hidden = new ArrayDeque<>();
        // Retain unprocessed arrivals when a frame runs out of time; never drop
        // comments already advanced past the indexed source cursor.
        final ArrayDeque<CommentSource280.Item> pending = new ArrayDeque<>();
        float previousVideo = Float.POSITIVE_INFINITY;
        float batchVideo, batchVisual, batchPreviousVideo, batchRate;
        int batchDuration;
        long generation = Long.MIN_VALUE;
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
        CommentStyle.apply(state.fill, context);
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
        state.timeline.frame(generation, video, visual);
        if (state.generation != generation) {
            state.waiting.clear();
            state.generation = generation;
        }

        ScrollingTimeline267.FrameBudget budget = new ScrollingTimeline267.FrameBudget();
        Channel channel = state.channels[secondary ? 1 : 0];
        CommentSource280 source = channel.source;
        boolean changed = source.update(input);
        source.fixedDuration(duration);
        int rows = CommentOptions.value(context, "comment_rows", 10, 1, 20);
        float size = (shorts(context) ? Math.min(width, height) : height)
                / 14f * CommentOptions.size(context) / 100f;
        int opacity = Math.round(CommentOptions.opacity(context) * 255f / 100f);
        float shadow = CommentOptions.shadow(context) * context.getResources().getDisplayMetrics().density;
        int mode = shadowMode(context);
        float padding = mode == 0 ? shadow * .5f + 1f : shadow + 1f;

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
        ArrayList<ScrollingTimeline267.Entry> active = state.timeline.active;
        for (int i = 0; i < active.size(); i++) {
            ScrollingTimeline267.Entry entry = active.get(i);
            float x = entry.left(visual);
            if (entry.channel == channel && x - entry.padding < width) {
                drawEntry(state, canvas, entry, x, opacity, stroke);
            }
        }
        FixedCommentCollision.begin(canvas, strict, secondary, visual, shadow + 2f);
        return source.fixed;
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

    private static void drawEntry(State state, Canvas canvas, ScrollingTimeline267.Entry entry,
                                  float x, int opacity, boolean stroke) {
        float y = entry.baseline;
        Paint fill = state.fill;
        fill.setTextSize(entry.size);
        fill.setColor(entry.color);
        fill.setAlpha(opacity);
        Paint outline = state.outline;
        if (stroke) outline.setTextSize(entry.size);
        for (String line : entry.lines) {
            if (stroke) CommentOutlineOpacity.drawLive(canvas, line, x, y, outline, fill);
            else canvas.drawText(line, x, y, fill);
            y += entry.size * 1.15f;
        }
    }
}
