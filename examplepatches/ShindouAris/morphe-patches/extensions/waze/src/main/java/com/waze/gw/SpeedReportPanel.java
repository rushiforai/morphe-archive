package com.waze.gw;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * "Báo lỗi tốc độ giới hạn" panel that temporarily replaces the traffic bubble: a grid of speed
 * signs (plus "?" for "wrong, correct value unknown"), Cancel, and a Send button that fills from
 * left to right over {@link #TIMEOUT_MS}; when the fill completes the report is submitted.
 *
 * The countdown is wall-clock based (uptime + a delayed runnable), not a ValueAnimator, so turning
 * animations off in developer options can never make it submit instantly.
 */
final class SpeedReportPanel extends LinearLayout {
    interface Callback {
        /** {@code correctKmh} is {@link #UNKNOWN} when "?" was selected. */
        void onFinished(int correctKmh, boolean submit);
    }

    static final int UNKNOWN = -1;
    static final long TIMEOUT_MS = 15000L;
    /** Width in design dp; the caller scales it down on narrow screens through {@code unit}. */
    static final int DESIGN_WIDTH_DP = 328;

    private static final int[] VALUES = {UNKNOWN, 30, 35, 40, 50, 60, 70, 80, 90, 100, 120};
    /** The same picker for Waze in mph (US/UK limits). */
    private static final int[] VALUES_MPH = {UNKNOWN, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80};
    private static final int COLUMNS = 4;
    private static final int TILE_DP = 64;
    private static final int GAP_DP = 8;

    private static final int COLOR_PANEL = 0xFF3A3C42;
    private static final int COLOR_WELL = 0xFF1C1C21;
    private static final int COLOR_TILE = 0xFF2C2D33;
    private static final int COLOR_TILE_PICKED = 0xFF232C3D;
    private static final int COLOR_ACCENT = 0xFF3B9BFF;
    private static final int COLOR_SEND = 0xFF2F86FF;
    private static final int COLOR_SEND_FILL = 0xFF1B57B8;
    private static final int COLOR_RED = 0xFFE52329;

    private final float unit;
    private final Callback callback;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final int[] values = Units.imperial() ? VALUES_MPH : VALUES;
    private final SignTile[] tiles = new SignTile[values.length];
    private final SendButton send;
    private int selected = UNKNOWN;
    private boolean finished;

    private final Runnable autoSubmit = new Runnable() {
        @Override public void run() { finish(true); }
    };

    /** @param unit pixels per design dp (density times the bubble size factor, already capped). */
    SpeedReportPanel(Context context, float unit, Callback callback) {
        super(context);
        this.unit = unit;
        this.callback = callback;
        setOrientation(VERTICAL);
        setPadding(u(14), u(14), u(14), u(14));
        GradientDrawable background = new GradientDrawable();
        background.setColor(COLOR_PANEL);
        background.setCornerRadius(u(22));
        background.setStroke(Math.max(1, u(1)), 0xFF4A4D55);
        setBackground(background);

        addView(header(context));
        addView(grid(context), lp(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, 0, 12, 0, 0));

        LinearLayout buttons = new LinearLayout(context);
        buttons.setOrientation(HORIZONTAL);
        TextView cancel = cancelButton(context);
        send = new SendButton(context);
        buttons.addView(cancel, lp(0, u(48), 1f));
        LayoutParams sendLp = new LayoutParams(0, u(48), 1f);
        sendLp.leftMargin = u(10);
        buttons.addView(send, sendLp);
        addView(buttons, lp(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, 0, 12, 0, 0));
        refreshTiles();
    }

    int widthPx() { return u(DESIGN_WIDTH_DP); }

    /** Start the 15 s countdown; call once the panel is on screen. */
    void start() {
        finished = false;
        send.startCountdown(SystemClock.uptimeMillis());
        handler.removeCallbacks(autoSubmit);
        handler.postDelayed(autoSubmit, TIMEOUT_MS);
    }

    /** Stop the countdown without reporting anything (bubble hidden or replaced). */
    void dispose() {
        finished = true;
        handler.removeCallbacks(autoSubmit);
    }

    @Override protected void onDetachedFromWindow() {
        handler.removeCallbacks(autoSubmit);
        super.onDetachedFromWindow();
    }

    private void finish(boolean submit) {
        if (finished) return;
        finished = true;
        handler.removeCallbacks(autoSubmit);
        callback.onFinished(selected, submit);
    }

    // ---------------- construction ----------------

    private View header(Context context) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        ImageView icon = new ImageView(context);
        try {
            Drawable app = context.getPackageManager().getApplicationIcon(context.getPackageName());
            if (app != null) icon.setImageDrawable(app);
        } catch (Throwable ignored) { /* the title alone is fine */ }
        row.addView(icon, new LayoutParams(u(34), u(34)));
        TextView title = new TextView(context);
        title.setText(I18n.tr("bubble.report_speed_limit_error"));
        title.setTextColor(0xFFFFFFFF);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, 18f * unit);
        title.setSingleLine(true);
        LayoutParams titleLp = new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        titleLp.leftMargin = u(10);
        row.addView(title, titleLp);
        return row;
    }

    private View grid(Context context) {
        LinearLayout well = new LinearLayout(context);
        well.setOrientation(VERTICAL);
        well.setPadding(u(10), u(10), u(10), u(2));
        GradientDrawable background = new GradientDrawable();
        background.setColor(COLOR_WELL);
        background.setCornerRadius(u(16));
        well.setBackground(background);
        int index = 0;
        while (index < values.length) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(HORIZONTAL);
            for (int column = 0; column < COLUMNS && index < values.length; column++, index++) {
                final int position = index;
                SignTile tile = new SignTile(context, values[position]);
                tile.setOnClickListener(new View.OnClickListener() {
                    @Override public void onClick(View view) {
                        selected = values[position];
                        refreshTiles();
                    }
                });
                tiles[position] = tile;
                LayoutParams tileLp = new LayoutParams(u(TILE_DP), u(TILE_DP));
                tileLp.rightMargin = column < COLUMNS - 1 ? u(GAP_DP) : 0;
                tileLp.bottomMargin = u(GAP_DP);
                row.addView(tile, tileLp);
            }
            well.addView(row);
        }
        return well;
    }

    private TextView cancelButton(Context context) {
        TextView cancel = new TextView(context);
        cancel.setText(I18n.tr("bubble.cancel"));
        cancel.setTextColor(COLOR_ACCENT);
        cancel.setTypeface(Typeface.DEFAULT_BOLD);
        cancel.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, 16f * unit);
        cancel.setGravity(Gravity.CENTER);
        GradientDrawable background = new GradientDrawable();
        background.setColor(0xFF33353B);
        background.setCornerRadius(u(14));
        background.setStroke(Math.max(2, u(2)), 0xFF2F80ED);
        cancel.setBackground(background);
        cancel.setClickable(true);
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { finish(false); }
        });
        return cancel;
    }

    private void refreshTiles() {
        for (SignTile tile : tiles) {
            if (tile == null) continue;
            tile.picked = tile.value == selected;
            tile.invalidate();
        }
    }

    private int u(float designDp) { return Math.round(designDp * unit); }

    private LayoutParams lp(int width, int height, float weight) {
        return new LayoutParams(width, height, weight);
    }

    private LayoutParams lp(int width, int height, int left, int top, int right, int bottom) {
        LayoutParams params = new LayoutParams(width, height);
        params.setMargins(u(left), u(top), u(right), u(bottom));
        return params;
    }

    // ---------------- views ----------------

    /** One selectable speed sign: white disc, red ring, black number ("?" for unknown). */
    private final class SignTile extends View {
        final int value;
        boolean picked;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        SignTile(Context context, int value) {
            super(context);
            this.value = value;
            setClickable(true);
            setContentDescription(value == UNKNOWN ? I18n.tr("bubble.correct_speed_unknown")
                    : I18n.f(Units.imperial() ? "bubble.correct_speed_0_mph" : "bubble.correct_speed_0_km_h", value));
        }

        @Override protected void onDraw(Canvas canvas) {
            float w = getWidth();
            float h = getHeight();
            float radius = u(14);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(picked ? COLOR_TILE_PICKED : COLOR_TILE);
            canvas.drawRoundRect(new RectF(0, 0, w, h), radius, radius, paint);
            float stroke = picked ? u(2.5f) : Math.max(1f, u(1));
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(stroke);
            paint.setColor(picked ? COLOR_ACCENT : 0x44FFFFFF);
            canvas.drawRoundRect(new RectF(stroke / 2f, stroke / 2f, w - stroke / 2f,
                    h - stroke / 2f), radius, radius, paint);

            float cx = w / 2f;
            float cy = h / 2f;
            float sign = u(23);
            boolean squareSign = value != UNKNOWN && LimitSign.square();
            if (squareSign) {
                LimitSign.drawFace(canvas, cx - sign, cy - sign, sign * 2f);   // US style: white rounded square
            } else {
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(0xFFFFFFFF);
                canvas.drawCircle(cx, cy, sign, paint);
                float ring = u(5);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(ring);
                paint.setColor(COLOR_RED);
                canvas.drawCircle(cx, cy, sign - ring / 2f, paint);
            }

            String label = value == UNKNOWN ? "?" : String.valueOf(value);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(0xFF000000);
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            paint.setTextSize(u(value == UNKNOWN ? 27 : (value >= 100 ? 17 : 22)));
            canvas.drawText(label, cx, cy - (paint.ascent() + paint.descent()) / 2f, paint);
        }
    }

    /** "Gửi báo cáo": a darker fill grows from the left edge over the timeout. */
    private final class SendButton extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path clip = new Path();
        private long startedMs;

        SendButton(Context context) {
            super(context);
            setClickable(true);
            setContentDescription(I18n.tr("bubble.send_report"));
            setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View view) { finish(true); }
            });
        }

        void startCountdown(long uptimeMs) {
            startedMs = uptimeMs;
            invalidate();
        }

        @Override protected void onDraw(Canvas canvas) {
            float w = getWidth();
            float h = getHeight();
            float radius = u(14);
            RectF bounds = new RectF(0, 0, w, h);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(COLOR_SEND);
            canvas.drawRoundRect(bounds, radius, radius, paint);

            float progress = 0f;
            boolean running = startedMs > 0L && !finished;
            if (startedMs > 0L) {
                progress = Math.min(1f, (SystemClock.uptimeMillis() - startedMs) / (float) TIMEOUT_MS);
            }
            if (progress > 0f) {
                clip.reset();
                clip.addRoundRect(bounds, radius, radius, Path.Direction.CW);
                canvas.save();
                canvas.clipPath(clip);
                paint.setColor(COLOR_SEND_FILL);
                canvas.drawRect(0f, 0f, w * progress, h, paint);
                canvas.restore();
            }

            paint.setColor(0xFFFFFFFF);
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            paint.setTextSize(u(16));
            canvas.drawText(I18n.tr("bubble.send_report"), w / 2f, h / 2f - (paint.ascent() + paint.descent()) / 2f,
                    paint);
            if (running && progress < 1f) postInvalidateOnAnimation();
        }
    }
}
