package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.view.View;
import android.view.ViewTreeObserver;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import io.github.sabopura.morphe.extension.twitch.danmaku.DanmakuSettings;

/**
 * The danmaku settings' live preview: comments cross a small player at the size, opacity, speed and
 * coverage being chosen, drawn the way the overlay on the video draws them. It stops when scrolled away
 * or when its window is hidden, and comes back already in full flow.
 */
final class DanmakuPreview extends View implements Motion.Step {
    private static final float FULL_SIZE_HEIGHT_DP = 360f, MIN_SCALE = .55f;
    private static final int[] CHAT_COLOURS = {0xFFEF476F, 0xFFFFD166, 0xFF06D6A0, 0xFF4CC9F0};

    private static final class Comment {
        String text;
        int color;
        float width;
        int lane;
        long startMs;
    }

    private final List<Comment> comments = new ArrayList<>();
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG), stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint backdrop = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF box = new RectF();
    private final Path clip = new Path();
    private final Random random = new Random();
    private final Motion.Loop loop = new Motion.Loop(this, this);
    private final float density, scaledDensity;
    private final String[] samples;
    private final Rect visible = new Rect();
    private final Paint.FontMetrics metrics = new Paint.FontMetrics();
    private final ViewTreeObserver.OnScrollChangedListener onScroll = this::wake;
    private final String namePrefix = Text.label("名前: ", "name: ");
    private float[] tails = new float[0];
    private int fontSp, opacity, durationSeconds, coverage;
    private boolean bold, chatColors, showNames;
    private long lastSpawn;

    DanmakuPreview(Context context) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        scaledDensity = context.getResources().getDisplayMetrics().scaledDensity;
        samples = Text.label("ナイス！,草,8888888,かわいい,ここすき,うまい！,GG,それな,わかる,すごい",
                "nice!,LUL,gg,clutch,POG,no way,wow,lets go,so good,hype").split(",");
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeJoin(Paint.Join.ROUND);
        stroke.setColor(Color.BLACK);
        setContentDescription(Text.label("弾幕のプレビュー", "Danmaku preview"));
        reload();
    }

    /** Takes the settings as saved. */
    void reload() {
        DanmakuSettings settings = DanmakuSettings.get(getContext());
        fontSp = settings.fontSizeSp;
        opacity = settings.opacityPercent;
        durationSeconds = settings.durationSeconds;
        coverage = settings.coveragePercent;
        bold = settings.bold;
        chatColors = settings.chatColors;
        showNames = settings.showNames;
        wake();
        invalidate();
    }

    /** Takes a value the slider is still being dragged through. */
    void preview(String key, int value) {
        if (DanmakuSettings.KEY_FONT_SIZE.equals(key)) fontSp = value;
        else if (DanmakuSettings.KEY_OPACITY.equals(key)) opacity = value;
        else if (DanmakuSettings.KEY_DURATION.equals(key)) durationSeconds = value;
        else if (DanmakuSettings.KEY_COVERAGE.equals(key)) coverage = value;
        else return;
        if (!Motion.enabled()) snap();
        invalidate();
    }

    @Override
    protected void onMeasure(int widthSpec, int heightSpec) {
        int width = MeasureSpec.getSize(widthSpec);
        setMeasuredDimension(width, Math.min(Math.round(150 * density), width * 9 / 16));
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        getViewTreeObserver().addOnScrollChangedListener(onScroll);
    }

    /** The first moment the preview has a size; before it, nothing counts as on screen. */
    @Override
    protected void onSizeChanged(int w, int h, int oldW, int oldH) {
        super.onSizeChanged(w, h, oldW, oldH);
        backdrop.setShader(new LinearGradient(0, 0, w, h, new int[]{0xFF2B1B4D, 0xFF14121C, 0xFF0B1A2B},
                null, Shader.TileMode.CLAMP));
        post(this::wake);
    }

    @Override
    protected void onDetachedFromWindow() {
        getViewTreeObserver().removeOnScrollChangedListener(onScroll);
        loop.stop();
        super.onDetachedFromWindow();
    }

    /** Leaving the app or covering the settings hides the window while the view stays attached and shown. */
    @Override
    protected void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        if (visibility == VISIBLE) post(this::wake);
        else loop.stop();
    }

    private boolean onScreen() {
        return getWindowVisibility() == VISIBLE && isShown() && getGlobalVisibleRect(visible) && visible.height() > 0;
    }

    private void wake() {
        if (!isAttachedToWindow()) return;
        if (!Motion.enabled()) {
            snap();
            invalidate();
            return;
        }
        if (!onScreen()) return;
        // Comments that crossed while it was stopped are gone; it starts mid-flow, alive the moment it appears.
        dropFinished(android.os.SystemClock.uptimeMillis(), durationSeconds * 1000L);
        if (comments.isEmpty()) snap();
        loop.start();
    }

    private void dropFinished(long now, long duration) {
        for (int i = comments.size() - 1; i >= 0; i--) {
            if (now - comments.get(i).startMs >= duration) comments.remove(i);
        }
    }

    private float textSize() {
        float heightDp = getHeight() / density;
        float scale = Math.max(MIN_SCALE, Math.min(1f, heightDp / FULL_SIZE_HEIGHT_DP));
        return fontSp * scaledDensity * scale;
    }

    private int lanes() {
        float line = textSize() * 1.3f;
        float usable = getHeight() * coverage / 100f - line * .2f;
        return line <= 0 ? 0 : Math.max(0, (int) (usable / line));
    }

    @Override
    public boolean frame(float seconds, long nowMs) {
        if (!onScreen()) return false;
        long now = android.os.SystemClock.uptimeMillis();
        long duration = durationSeconds * 1000L;
        dropFinished(now, duration);
        if (now - lastSpawn > 420 + random.nextInt(260) && getWidth() > 0) {
            spawn(now, duration);
            lastSpawn = now;
        }
        return true;
    }

    private void spawn(long now, long duration) {
        int laneCount = lanes();
        if (laneCount == 0) return;
        float gap = textSize() * 1.5f;
        Comment comment = new Comment();
        comment.text = sampleText(random.nextInt(samples.length));
        comment.color = chatColors ? CHAT_COLOURS[random.nextInt(CHAT_COLOURS.length)] : Color.WHITE;
        applyMetrics();
        comment.width = fill.measureText(comment.text);
        if (tails.length < laneCount) tails = new float[laneCount];
        float[] tail = tails;
        java.util.Arrays.fill(tail, 0, laneCount, 0);
        for (int i = 0; i < comments.size(); i++) {
            Comment other = comments.get(i);
            if (other.lane >= laneCount) continue;
            tail[other.lane] = Math.max(tail[other.lane], tailOf(other, now, duration));
        }
        for (int lane = 0; lane < laneCount; lane++) {
            if (tail[lane] + gap <= getWidth()) {
                comment.lane = lane;
                comment.startMs = now;
                comments.add(comment);
                return;
            }
        }
    }

    private String sampleText(int index) {
        String text = samples[index];
        return showNames ? namePrefix + text : text;
    }

    private float tailOf(Comment comment, long now, long duration) {
        float progress = Math.min(1, (now - comment.startMs) / (float) duration);
        return getWidth() - (getWidth() + comment.width) * progress + comment.width;
    }

    @Override
    public void snap() {
        comments.clear();
        int laneCount = lanes();
        if (laneCount == 0 || getWidth() == 0) return;
        applyMetrics();
        long now = android.os.SystemClock.uptimeMillis();
        long duration = durationSeconds * 1000L;
        for (int i = 0; i < Math.min(laneCount, samples.length); i++) {
            Comment comment = new Comment();
            comment.text = sampleText(i % samples.length);
            comment.color = chatColors ? CHAT_COLOURS[i % CHAT_COLOURS.length] : Color.WHITE;
            comment.width = fill.measureText(comment.text);
            comment.lane = i;
            comment.startMs = now - duration * (i % 4 + 2) / 8;
            comments.add(comment);
        }
    }

    private void applyMetrics() {
        float size = textSize();
        Typeface typeface = bold ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT;
        fill.setTextSize(size);
        fill.setTypeface(typeface);
        stroke.setTextSize(size);
        stroke.setTypeface(typeface);
        stroke.setStrokeWidth(Math.max(1.5f, size * .12f));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float radius = 12 * density;
        box.set(0, 0, getWidth(), getHeight());
        canvas.save();
        clip.rewind();
        clip.addRoundRect(box, radius, radius, Path.Direction.CW);
        canvas.clipPath(clip);
        canvas.drawRect(box, backdrop);
        applyMetrics();
        long now = android.os.SystemClock.uptimeMillis();
        long duration = Math.max(1, durationSeconds * 1000L);
        float line = textSize() * 1.3f;
        float top = line * .2f;
        fill.getFontMetrics(metrics);
        int alpha = Math.round(255 * opacity / 100f);
        int laneCount = lanes();
        for (int i = 0; i < comments.size(); i++) {
            Comment comment = comments.get(i);
            if (comment.lane >= laneCount) continue;
            float progress = Math.max(0, (now - comment.startMs) / (float) duration);
            float x = getWidth() - (getWidth() + comment.width) * progress;
            float baseline = top + line * comment.lane - metrics.ascent;
            stroke.setAlpha(Math.round(alpha * .85f));
            canvas.drawText(comment.text, x, baseline, stroke);
            fill.setColor(comment.color);
            fill.setAlpha(alpha);
            canvas.drawText(comment.text, x, baseline, fill);
        }
        canvas.restore();
    }
}
