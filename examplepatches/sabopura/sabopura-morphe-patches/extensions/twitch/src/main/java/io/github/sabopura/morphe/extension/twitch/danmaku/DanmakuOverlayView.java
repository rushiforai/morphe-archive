package io.github.sabopura.morphe.extension.twitch.danmaku;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewParent;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Transparent layer above the video that scrolls chat messages from right to left.
 *
 * <p>The patch inserts it into Twitch's player layout directly above the video surface, so
 * the player controls, ads and captions stay on top. It never takes touches.
 */
@SuppressWarnings("unused")
public final class DanmakuOverlayView extends View {
    /** Players shorter than this (minimised player, small previews) show nothing. */
    private static final float MIN_HEIGHT_DP = 100f;
    /** Text size reaches 100 % of the setting at this player height. */
    private static final float FULL_SIZE_HEIGHT_DP = 360f;
    private static final float MIN_SCALE = 0.55f;
    /** Comments waiting for a free lane are dropped after this long. */
    private static final long MAX_WAIT_MS = 4_000L;
    private static final int MAX_PENDING = 60;

    private static final class Piece {
        final String text;
        final String emoteId;
        final boolean name;
        float width;

        Piece(String text, String emoteId, boolean name) {
            this.text = text;
            this.emoteId = emoteId;
            this.name = name;
        }
    }

    private static final class Item {
        final List<Piece> pieces;
        final int color;
        final float width;
        int lane;
        long startMs;

        Item(List<Piece> pieces, int color, float width) {
            this.pieces = pieces;
            this.color = color;
            this.width = width;
        }
    }

    private static final class Pending {
        final Item item;
        final long queuedAtMs;

        Pending(Item item, long queuedAtMs) {
            this.item = item;
            this.queuedAtMs = queuedAtMs;
        }
    }

    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint bitmapPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final RectF emoteRect = new RectF();
    private final List<Item> active = new ArrayList<>();
    private final ArrayDeque<Pending> pending = new ArrayDeque<>();
    private final LaneAllocator lanes = new LaneAllocator();
    private final Runnable redraw = this::postInvalidateOnAnimation;
    private final Runnable onEmoteLoaded = this::requestRedraw;

    private final float density;
    private DanmakuSettings settings;
    private float textSize;
    private float lineHeight;
    private float emoteSize;
    private float topPadding;
    private float gapPx;
    private float baselineOffset;
    private int alpha;
    private long durationMs;
    private static final float DIMMED_ALPHA = 0.35f;
    private static final long DIM_MS = 150L;
    private float dimmedTo = 1f;
    private boolean paused;
    private long pausedAt;
    private long pausedTotal;

    public DanmakuOverlayView(Context context, AttributeSet attrs) {
        super(context, attrs);
        density = getResources().getDisplayMetrics().density;
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeJoin(Paint.Join.ROUND);
        stroke.setColor(Color.BLACK);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        try {
            animate().cancel();
            setAlpha(1f);
            dimmedTo = 1f;
            settings = DanmakuSettings.get(getContext());
            if (Features.has(Feature.CHAT_FILTERS)) ChatSettings.get(getContext());
            TwitchDanmaku.register(this);
            applyMetrics();
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("danmaku.overlay-attach", e);
            settings = null;
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        TwitchDanmaku.unregister(this);
        clearComments();
        super.onDetachedFromWindow();
    }

    @Override
    protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
        super.onSizeChanged(width, height, oldWidth, oldHeight);
        applyMetrics();
        if (height != oldHeight) clearComments();
    }

    void settingsChanged() {
        settings = DanmakuSettings.get(getContext());
        clearComments();
        applyMetrics();
    }

    void clearComments() {
        active.clear();
        pending.clear();
        lanes.clear();
        invalidate();
    }

    /** Fades the comments back while something over them has to be read, and in again after. */
    void setDimmed(boolean dimmed) {
        float wanted = dimmed ? DIMMED_ALPHA : 1f;
        if (dimmedTo == wanted) return;
        dimmedTo = wanted;
        animate().alpha(wanted).setDuration(DIM_MS).start();
    }

    /** Text is drawn piece by piece, so the fade needs no off-screen buffer. */
    @Override
    public boolean hasOverlappingRendering() {
        return false;
    }

    /** True when this overlay belongs to the player under {@code root}. */
    boolean isInside(View root) {
        for (ViewParent parent = getParent(); parent != null; parent = parent.getParent()) {
            if (parent == root) return true;
        }
        return false;
    }

    /** Stops or resumes the comments with the video; comments arriving while paused are dropped. */
    void setPaused(boolean paused) {
        if (this.paused == paused) return;
        long now = SystemClock.uptimeMillis();
        if (paused) pausedAt = now;
        else pausedTotal += now - pausedAt;
        this.paused = paused;
        postInvalidateOnAnimation();
        if (!paused) VodDanmaku.resumed(this);
    }

    boolean isPaused() {
        return paused;
    }

    /** Comment time: the view's uptime without the time the video was paused. */
    private long now() {
        return (paused ? pausedAt : SystemClock.uptimeMillis()) - pausedTotal;
    }

    private void applyMetrics() {
        if (settings == null) return;
        float heightDp = getHeight() / density;
        float scale = Math.max(MIN_SCALE, Math.min(1f, heightDp / FULL_SIZE_HEIGHT_DP));
        textSize = settings.fontSizeSp * getResources().getDisplayMetrics().scaledDensity * scale;
        lineHeight = textSize * 1.3f;
        emoteSize = textSize * 1.25f;
        topPadding = lineHeight * 0.2f;
        gapPx = textSize * 1.5f;
        durationMs = settings.durationSeconds * 1000L;
        fill.setTextSize(textSize);
        stroke.setTextSize(textSize);
        stroke.setStrokeWidth(Math.max(1.5f, textSize * 0.12f));
        Typeface typeface = settings.bold ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT;
        fill.setTypeface(typeface);
        stroke.setTypeface(typeface);
        alpha = Math.round(255 * settings.opacityPercent / 100f);
        bitmapPaint.setAlpha(alpha);
        Paint.FontMetrics metrics = fill.getFontMetrics();
        baselineOffset = (lineHeight - (metrics.descent - metrics.ascent)) / 2f - metrics.ascent;
        float usable = getHeight() * settings.coveragePercent / 100f - topPadding;
        lanes.resize(lineHeight <= 0f ? 0 : Math.max(0, (int) (usable / lineHeight)));
    }

    /** Adds a chat message; called on the main thread. */
    void add(ChatMessageReader.Comment comment) {
        if (settings == null || !settings.enabled || paused || getWidth() <= 0
                || getHeight() < MIN_HEIGHT_DP * density || lanes.laneCount() == 0) {
            return;
        }
        Item item = layout(comment);
        if (item == null) return;
        long now = now();
        if (pending.isEmpty() && active.size() < settings.maxOnScreen && place(item, now)) {
            postInvalidateOnAnimation();
            return;
        }
        if (pending.size() >= MAX_PENDING) pending.pollFirst();
        pending.addLast(new Pending(item, now));
        postInvalidateOnAnimation();
    }

    private boolean place(Item item, long now) {
        int lane = lanes.acquire(now, item.width, durationMs, getWidth(), gapPx);
        if (lane < 0) return false;
        item.lane = lane;
        item.startMs = now;
        active.add(item);
        return true;
    }

    private Item layout(ChatMessageReader.Comment comment) {
        List<Piece> pieces = new ArrayList<>(comment.segments.size() + 1);
        int color = Color.WHITE;
        if (settings.chatColors && comment.color != null) color = readable(comment.color);
        if (settings.showNames && !comment.author.isEmpty()) {
            pieces.add(new Piece(comment.author + ": ", null, true));
        }
        for (ChatTokens.Segment segment : comment.segments) {
            if (segment.isEmote() && settings.showEmotes
                    && EmoteCache.isValidId(segment.emoteId)) {
                pieces.add(new Piece(segment.text, segment.emoteId, false));
            } else if (!segment.text.isEmpty()) {
                pieces.add(new Piece(segment.text.replace('\n', ' '), null, false));
            }
        }
        if (pieces.isEmpty()) return null;
        float width = 0f;
        for (Piece piece : pieces) {
            // Fixed for the comment's whole flight: an image arriving later is fitted inside.
            Bitmap bitmap = piece.emoteId == null ? null : EmoteCache.getInstance().get(piece.emoteId, onEmoteLoaded);
            piece.width = bitmap != null ? naturalWidth(bitmap) + emotePadding() : fill.measureText(piece.text);
            width += piece.width;
        }
        return new Item(pieces, color, width);
    }

    private float emotePadding() {
        return textSize * 0.1f;
    }

    private float naturalWidth(Bitmap bitmap) {
        return emoteSize * bitmap.getWidth() / Math.max(1, bitmap.getHeight());
    }

    private void requestRedraw() {
        removeCallbacks(redraw);
        post(redraw);
    }

    /** Lightens very dark name colours so they stay legible over video. */
    private static int readable(int color) {
        float[] hsv = new float[3];
        Color.colorToHSV(color | 0xFF000000, hsv);
        // Bright and slightly desaturated, like Twitch's own readability adjustment.
        hsv[1] = Math.min(hsv[1], 0.7f);
        hsv[2] = Math.max(hsv[2], 0.92f);
        return Color.HSVToColor(hsv);
    }

    @Override
    public boolean onTouchEvent(android.view.MotionEvent event) {
        return false;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (settings == null) return;
        long now = now();
        while (!pending.isEmpty()) {
            Pending next = pending.peekFirst();
            if (now - next.queuedAtMs > MAX_WAIT_MS) {
                pending.pollFirst();
                continue;
            }
            if (active.size() >= settings.maxOnScreen || !place(next.item, now)) break;
            pending.pollFirst();
        }

        int width = getWidth();
        Iterator<Item> iterator = active.iterator();
        while (iterator.hasNext()) {
            Item item = iterator.next();
            float progress = (now - item.startMs) / (float) durationMs;
            if (progress >= 1f || item.lane >= lanes.laneCount()) {
                iterator.remove();
                continue;
            }
            float x = width - progress * (width + item.width);
            float top = topPadding + item.lane * lineHeight;
            float baseline = top + baselineOffset;
            float centerY = top + lineHeight / 2f;
            for (Piece piece : item.pieces) {
                if (piece.emoteId != null) {
                    Bitmap bitmap = EmoteCache.getInstance().get(piece.emoteId, onEmoteLoaded);
                    if (bitmap != null) {
                        float room = Math.max(1f, piece.width - emotePadding());
                        float natural = naturalWidth(bitmap);
                        float drawn = Math.min(natural, room);
                        float halfHeight = emoteSize * drawn / natural / 2f;
                        emoteRect.set(x, centerY - halfHeight, x + drawn, centerY + halfHeight);
                        canvas.drawBitmap(bitmap, null, emoteRect, bitmapPaint);
                    } else {
                        drawText(canvas, piece.text, x, baseline, item.color);
                    }
                } else {
                    int color = piece.name && !settings.chatColors ? Color.argb(255, 200, 200, 200) : item.color;
                    drawText(canvas, piece.text, x, baseline, color);
                }
                x += piece.width;
            }
        }
        if (!paused && (!active.isEmpty() || !pending.isEmpty())) postInvalidateOnAnimation();
    }

    private void drawText(Canvas canvas, String text, float x, float baseline, int color) {
        stroke.setAlpha(Math.round(alpha * 0.85f));
        canvas.drawText(text, x, baseline, stroke);
        fill.setColor(color);
        fill.setAlpha(alpha);
        canvas.drawText(text, x, baseline, fill);
    }
}
