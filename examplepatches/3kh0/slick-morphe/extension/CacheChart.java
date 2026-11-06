package slick.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

final class CacheChart extends View {
  private static final int[] COLORS = {0xff3682f4, 0xff805bda, 0xff24b9ca, 0xffe2a83a};
  private final CacheCleaner.Snapshot snapshot;
  private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
  private final int foreground;

  private CacheChart(Context context, CacheCleaner.Snapshot snapshot, int foreground) {
    super(context);
    this.snapshot = snapshot;
    this.foreground = foreground;
    setContentDescription(
        "Measured cache: "
            + CacheCleaner.format(snapshot.total())
            + ". Category amounts are listed below.");
  }

  static void show(Activity activity, CacheCleaner.Snapshot snapshot) {
    int foreground = Appearance.night(activity) ? 0xfff1f1f1 : 0xff1d1c1d;
    float density = activity.getResources().getDisplayMetrics().density;
    int padding = Math.round(20 * density), gap = Math.round(8 * density);
    LinearLayout body = new LinearLayout(activity);
    body.setOrientation(LinearLayout.VERTICAL);
    body.setPadding(padding, 0, padding, padding);
    body.addView(
        new CacheChart(activity, snapshot, foreground),
        new LinearLayout.LayoutParams(-1, Math.round(240 * density)));
    for (int i = 0; i < snapshot.categories.size(); i++) {
      CacheCleaner.Category c = snapshot.categories.get(i);
      // format() already reports negative sizes as "Unavailable".
      android.text.SpannableString legend =
          new android.text.SpannableString("●  " + c.title + " — " + CacheCleaner.format(c.bytes));
      legend.setSpan(
          new android.text.style.ForegroundColorSpan(COLORS[i % COLORS.length]),
          0,
          1,
          android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
      body.addView(label(activity, legend, foreground, 16, gap, gap));
    }
    body.addView(
        label(
            activity,
            "Measured disposable caches only, not total app storage. Use the switches on the cache"
                + " page to select what to clear.",
            foreground,
            14,
            padding,
            0));
    ScrollView scroll = new ScrollView(activity);
    scroll.addView(body);
    new AlertDialog.Builder(activity)
        .setTitle("Cache breakdown")
        .setView(scroll)
        .setPositiveButton("Done", null)
        .show();
  }

  private static TextView label(
      Context context, CharSequence text, int color, float size, int top, int bottom) {
    TextView t = new TextView(context);
    t.setText(text);
    t.setTextColor(color);
    t.setTextSize(size);
    t.setPadding(0, top, 0, bottom);
    return t;
  }

  @Override
  protected void onDraw(Canvas canvas) {
    super.onDraw(canvas);
    float diameter = Math.min(getWidth(), getHeight()) * 0.72f, r = diameter / 2;
    float cx = getWidth() / 2f, cy = getHeight() / 2f;
    RectF ring = new RectF(cx - r, cy - r, cx + r, cy + r);
    paint.setStyle(Paint.Style.STROKE);
    paint.setStrokeWidth(diameter * 0.22f);
    paint.setColor(0xff777777);
    canvas.drawArc(ring, 0, 360, false, paint);
    long total = snapshot.total();
    float angle = -90;
    for (int i = 0; i < snapshot.categories.size(); i++) {
      long bytes = snapshot.categories.get(i).bytes;
      if (bytes <= 0 || total == 0) continue;
      float sweep = (float) (360d * bytes / total);
      paint.setColor(COLORS[i % COLORS.length]);
      canvas.drawArc(ring, angle, sweep, false, paint);
      angle += sweep;
    }
    paint.setStyle(Paint.Style.FILL);
    paint.setColor(foreground);
    paint.setTextSize(20 * getResources().getDisplayMetrics().scaledDensity);
    paint.setTextAlign(Paint.Align.CENTER);
    canvas.drawText(
        CacheCleaner.format(total), cx, cy - (paint.ascent() + paint.descent()) / 2, paint);
  }
}
