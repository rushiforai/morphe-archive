package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** Rendering adapter for the ordinary video and popup comment layers. */
public final class ScrollingComments267 {
    private static final WeakHashMap<Object, State> STATES = new WeakHashMap<>();

    private static final class Channel {
        float previousVideo = Float.NaN;
        long generation = Long.MIN_VALUE;
    }

    private static final class State {
        final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint outline = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint.FontMetrics metrics = new Paint.FontMetrics();
        final ScrollingTimeline267 timeline = new ScrollingTimeline267();
        final WeakHashMap<Object, Object> keys = new WeakHashMap<>();
        final WeakHashMap<Object, Boolean> observedBeforeDue = new WeakHashMap<>();
        final Channel[] channels = {new Channel(), new Channel()};
        final ArrayList<Object> fixed = new ArrayList<>();
        final Field nativeOpacity;
        long generation = Long.MIN_VALUE;

        State(Object renderer) {
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
        Object value = current.get();
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
        CommentDuration.apply(renderer, canvas, input);
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
        float video = CommentClock.position(renderer) / 10f;
        float rate = CommentClock.rate(renderer);
        if (!Float.isFinite(rate) || rate < .1f) rate = 1f;
        long generation = CommentMotion.generation(renderer);
        state.timeline.frame(generation, video, visual);
        Channel channel = state.channels[secondary ? 1 : 0];
        if (state.generation != generation) {
            state.generation = generation;
            state.observedBeforeDue.clear();
        }
        float previousVideo = channel.generation == generation ? channel.previousVideo : Float.POSITIVE_INFINITY;
        state.fixed.clear();
        int rows = CommentOptions.value(context, "comment_rows", 10, 1, 20);
        float size = shorts(context) ? Math.min(width, height) : height;
        size = size / 14f * CommentOptions.size(context) / 100f;
        int opacity = Math.round(CommentOptions.opacity(context) * 255f / 100f);
        float shadow = CommentOptions.shadow(context) * context.getResources().getDisplayMetrics().density;
        int shadowMode = shadowMode(context);
        int defaultDuration = CommentVisuals.number(renderer, isPopup(renderer) ? "R" : "S", 400);

        for (Object comment : input) {
            if (comment == null) continue;
            if (CommentVisuals.number(comment, "j", 0) != 0 || CommentVisuals.number(comment, "l", 0) != 0) {
                state.fixed.add(comment);
                continue;
            }
            if (width <= 0 || height <= 0 || CommentVisuals.flag(comment, "o")) continue;
            int timestamp = CommentVisuals.number(comment, "d", 0);
            if (timestamp > video) {
                state.observedBeforeDue.put(comment, Boolean.TRUE);
                continue;
            }
            Object key = state.keys.get(comment);
            if (key == null) {
                key = CommentContinuity118.key(comment);
                if (key == null) key = new Object();
                state.keys.put(comment, key);
            }
            if (state.timeline.started.contains(key)) continue;
            int duration = CommentVisuals.number(comment, "k", 0);
            duration = Math.max(100, duration > 0 ? duration : defaultDuration);
            Boolean observed = state.observedBeforeDue.remove(comment);
            if (observed == null && (video - timestamp) / rate >= duration
                    && timestamp < state.timeline.origin) continue;
            String content;
            try {
                content = String.valueOf(CommentVisuals.field(comment, "a"));
            } catch (Exception unavailable) {
                continue;
            }
            int scale = CommentVisuals.number(comment, "i", 0);
            float textSize = size * (scale == 1 ? .67f : scale == 2 ? 1.42f : 1f);
            state.fill.setTextSize(textSize);
            state.fill.getFontMetrics(state.metrics);
            String[] lines = content.split("\n", -1);
            float textWidth = 0;
            for (String line : lines) textWidth = Math.max(textWidth, state.fill.measureText(line));
            float padding = shadowMode == 0 ? shadow * .5f + 1f : shadow + 1f;
            float paintedHeight = state.metrics.descent - state.metrics.ascent
                    + (lines.length - 1) * textSize * 1.15f + 2f * padding;
            float start = ScrollingTimeline267.start(timestamp, previousVideo, video, visual, rate, duration,
                    observed != null);
            float x = width + padding;
            float speed = (x + textWidth + padding) / duration;
            float top = state.timeline.top(x - (visual - start) * speed, speed, textWidth,
                    paintedHeight, padding, visual, rows, height);
            int color = CommentVisuals.number(comment, "f", -1);
            state.timeline.started.add(key);
            state.timeline.active.add(new ScrollingTimeline267.Entry(channel, lines, color == 0 ? -1 : color,
                    x, start, speed, textWidth, textSize, top, state.metrics.ascent - padding,
                    paintedHeight, padding));
        }
        if (width > 0 && height > 0) {
            channel.generation = generation;
            channel.previousVideo = Math.max(Float.isFinite(previousVideo) ? previousVideo : video, video);
        }
        for (ScrollingTimeline267.Entry entry : state.timeline.active) {
            if (entry.channel == channel) drawEntry(state, canvas, entry, visual, opacity, shadow, shadowMode);
        }
        return state.fixed;
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
                                  float visual, int opacity, float shadow, int mode) {
        float x = entry.left(visual);
        float y = entry.baseline;
        Paint fill = state.fill;
        fill.setTextSize(entry.size);
        fill.setColor(entry.color);
        fill.setAlpha(opacity);
        if (mode == 1 && shadow > 0f) fill.setShadowLayer(shadow, 0, 0, 0xff000000);
        else fill.clearShadowLayer();
        Paint outline = state.outline;
        boolean stroke = mode == 0 && shadow > 0f;
        if (stroke) {
            outline.set(fill);
            outline.setStyle(Paint.Style.STROKE);
            outline.setStrokeWidth(shadow);
            outline.setColor(0xff000000);
            outline.setAlpha(opacity);
        }
        for (String line : entry.lines) {
            if (stroke) CommentOutlineOpacity.drawLive(canvas, line, x, y, outline, fill);
            else canvas.drawText(line, x, y, fill);
            y += entry.size * 1.15f;
        }
    }
}
