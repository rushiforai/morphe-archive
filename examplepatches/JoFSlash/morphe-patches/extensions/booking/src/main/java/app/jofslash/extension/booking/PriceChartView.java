package app.jofslash.extension.booking;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Path;
import android.view.View;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * A plain line chart of the saved prices for one stay: price over the time it was seen. The
 * lowest and highest prices get a label, the latest one a bigger dot. A crossed-out price, when
 * Booking.com shows one, is drawn as a dashed line.
 */
final class PriceChartView extends View {
    private final Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint dot = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint grid = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint strikePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final float density;
    private final int textColor;

    private List<PriceDb.Row> rows;
    private double strike = Double.NaN;
    private String currency = "";

    PriceChartView(Context context, Panel.Colors colors) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        line.setStyle(Paint.Style.STROKE);
        line.setStrokeWidth(2.5f * density);
        line.setStrokeJoin(Paint.Join.ROUND);
        line.setColor(colors.accent);
        fill.setStyle(Paint.Style.FILL);
        fill.setColor((colors.accent & 0x00FFFFFF) | 0x22000000);
        dot.setColor(colors.accent);
        grid.setColor(colors.divider);
        grid.setStrokeWidth(density);
        strikePaint.setStyle(Paint.Style.STROKE);
        strikePaint.setStrokeWidth(1.5f * density);
        strikePaint.setColor(colors.bad);
        strikePaint.setPathEffect(new DashPathEffect(new float[]{6 * density, 4 * density}, 0));
        textColor = colors.secondaryText;
        text.setColor(textColor);
        text.setTextSize(11 * density);
        setMinimumHeight((int) (180 * density));
    }

    void setData(List<PriceDb.Row> rows, double strike, String currency) {
        this.rows = rows;
        this.strike = strike;
        this.currency = currency == null ? "" : currency;
        invalidate();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int w = MeasureSpec.getSize(widthMeasureSpec);
        setMeasuredDimension(w, (int) (180 * density));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (rows == null || rows.isEmpty()) return;
        float left = 8 * density, right = getWidth() - 8 * density;
        float top = 22 * density, bottom = getHeight() - 22 * density;

        double min = Double.MAX_VALUE, max = -Double.MAX_VALUE;
        for (PriceDb.Row r : rows) {
            min = Math.min(min, r.price);
            max = Math.max(max, r.price);
        }
        double lo = min, hi = max;
        if (!Double.isNaN(strike)) hi = Math.max(hi, strike);
        if (hi - lo < 1) {
            hi += 1;
            lo -= 1;
        }
        double pad = (hi - lo) * 0.1;
        lo -= pad;
        hi += pad;

        long t0 = rows.get(0).time, t1 = rows.get(rows.size() - 1).time;
        int n = rows.size();
        float[] xs = new float[n], ys = new float[n];
        // Over a few days or more, place points by when they were seen. Over a shorter time the
        // prices come in bursts, and even spacing reads better.
        boolean byTime = n > 1 && t1 - t0 >= 2L * 24 * 60 * 60 * 1000;
        for (int i = 0; i < n; i++) {
            PriceDb.Row r = rows.get(i);
            if (byTime) {
                xs[i] = left + (right - left) * (float) ((r.time - t0) / (double) (t1 - t0));
            } else {
                xs[i] = n == 1 ? (left + right) / 2 : left + (right - left) * i / (n - 1f);
            }
            ys[i] = (float) (bottom - (r.price - lo) / (hi - lo) * (bottom - top));
        }

        canvas.drawLine(left, bottom, right, bottom, grid);
        canvas.drawLine(left, top, right, top, grid);

        if (!Double.isNaN(strike)) {
            float y = (float) (bottom - (strike - lo) / (hi - lo) * (bottom - top));
            canvas.drawLine(left, y, right, y, strikePaint);
            text.setColor(strikePaint.getColor());
            text.setTextAlign(Paint.Align.RIGHT);
            canvas.drawText(String.format(Strings.CHART_STRIKE, Panel.money(strike, currency)), right, y - 4 * density, text);
            text.setColor(textColor);
        }

        if (n > 1) {
            Path path = new Path();
            Path area = new Path();
            path.moveTo(xs[0], ys[0]);
            area.moveTo(xs[0], bottom);
            area.lineTo(xs[0], ys[0]);
            for (int i = 1; i < n; i++) {
                path.lineTo(xs[i], ys[i]);
                area.lineTo(xs[i], ys[i]);
            }
            area.lineTo(xs[n - 1], bottom);
            area.close();
            canvas.drawPath(area, fill);
            canvas.drawPath(path, line);
        }
        int minI = 0, maxI = 0;
        for (int i = 0; i < n; i++) {
            if (rows.get(i).price < rows.get(minI).price) minI = i;
            if (rows.get(i).price > rows.get(maxI).price) maxI = i;
            canvas.drawCircle(xs[i], ys[i], (i == n - 1 ? 5f : 3f) * density, dot);
        }

        if (maxI != minI) {
            label(canvas, Panel.money(rows.get(maxI).price, currency), xs[maxI], ys[maxI] - 8 * density, left, right);
        }
        // Below the lowest point, or above it when that would hit the dates at the bottom.
        float minY = ys[minI] + 16 * density > bottom ? ys[minI] - 8 * density : ys[minI] + 16 * density;
        label(canvas, Panel.money(rows.get(minI).price, currency), xs[minI], minY, left, right);

        SimpleDateFormat day = new SimpleDateFormat("d MMM", Locale.getDefault());
        float base = getHeight() - 6 * density;
        if (n > 1 && n <= 5 && !byTime) {
            // Few points: date each one.
            for (int i = 0; i < n; i++) {
                text.setTextAlign(i == 0 ? Paint.Align.LEFT : i == n - 1 ? Paint.Align.RIGHT : Paint.Align.CENTER);
                canvas.drawText(day.format(new Date(rows.get(i).time)), xs[i], base, text);
            }
            return;
        }
        text.setTextAlign(n == 1 ? Paint.Align.CENTER : Paint.Align.LEFT);
        canvas.drawText(day.format(new Date(t0)), n == 1 ? xs[0] : left, base, text);
        if (n > 1) {
            text.setTextAlign(Paint.Align.RIGHT);
            canvas.drawText(day.format(new Date(t1)), right, base, text);
        }
    }

    private void label(Canvas canvas, String s, float x, float y, float left, float right) {
        float w = text.measureText(s);
        float start = Math.max(left, Math.min(right - w, x - w / 2));
        text.setTextAlign(Paint.Align.LEFT);
        canvas.drawText(s, start, y, text);
    }
}
