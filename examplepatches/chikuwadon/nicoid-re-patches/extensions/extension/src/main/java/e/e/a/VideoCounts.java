package e.e.a;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ReplacementSpan;
import android.util.TypedValue;
import android.widget.TextView;

/** Compact, font-independent icons for the video-list count row. */
public final class VideoCounts {
    private static final String[] LABELS = {"再生数", "コメント", "いいね", "マイリス"};
    private VideoCounts() {}

    public static void setText(TextView view, CharSequence original) {
        long[] counts = VideoCountRules.parse(original);
        // List rows are recycled, so clear the previous video's accessibility text.
        view.setContentDescription(null);
        if (counts == null) { view.setText(original); return; }
        TypedValue accent = new TypedValue();
        int color = view.getCurrentTextColor();
        if (view.getContext().getTheme().resolveAttribute(0x7f03005e, accent, true)) {
            color = accent.resourceId != 0 ? view.getResources().getColor(accent.resourceId) : accent.data;
        }
        // Use the actual View theme: the app's dark-mode choice can differ from the system.
        TypedValue background = new TypedValue();
        if (view.getContext().getTheme().resolveAttribute(android.R.attr.colorBackground, background, true)) {
            int bg = background.resourceId != 0 ? view.getResources().getColor(background.resourceId) : background.data;
            if (Color.red(bg) * 299 + Color.green(bg) * 587 + Color.blue(bg) * 114 < 128000) {
                color = Color.argb(Color.alpha(color), Math.round(Color.red(color) * .85f),
                    Math.round(Color.green(color) * .85f), Math.round(Color.blue(color) * .85f));
            }
        }
        SpannableStringBuilder text = new SpannableStringBuilder();
        StringBuilder description = new StringBuilder();
        for (int i = 0; i < counts.length; i++) {
            if (counts[i] < 0) continue; // Older cached rows may not include likes.
            if (text.length() != 0) { text.append("  "); description.append(", "); }
            int start = text.length();
            text.append('\ufffc');
            text.setSpan(new CountIcon(i, color), start, start + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            String number = VideoCountRules.format(counts[i]);
            text.append('\u00a0').append(number);
            description.append(UiStrings.translate(LABELS[i])).append(' ').append(number);
        }
        // Keep every digit visible; narrow screens can wrap between count groups.
        view.setSingleLine(false);
        view.setMaxLines(Integer.MAX_VALUE);
        view.setEllipsize(null);
        view.setText(text);
        view.setContentDescription(description);
    }

    private static final class CountIcon extends ReplacementSpan {
        private final int kind, color;
        CountIcon(int kind, int color) { this.kind = kind; this.color = color; }

        @Override public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            return (int) Math.ceil(paint.getTextSize());
        }

        @Override public void draw(Canvas canvas, CharSequence text, int start, int end,
                float x, int top, int baseline, int bottom, Paint textPaint) {
            Paint paint = new Paint(textPaint);
            paint.setColor(color);
            paint.setStyle(Paint.Style.FILL);
            paint.setAntiAlias(true);
            float size = textPaint.getTextSize();
            Paint.FontMetrics metrics = textPaint.getFontMetrics();
            float center = baseline + (metrics.ascent + metrics.descent) / 2;
            int saved = canvas.save();
            canvas.translate(x, center - size / 2);
            canvas.scale(size / 24, size / 24);
            Path path = new Path();
            if (kind == 0) { // Play triangle.
                path.moveTo(5, 3); path.lineTo(22, 12); path.lineTo(5, 21); path.close();
            } else if (kind == 1) { // Comment bubble with tail.
                path.moveTo(3, 3); path.lineTo(21, 3); path.lineTo(21, 17);
                path.lineTo(11, 17); path.lineTo(6, 22); path.lineTo(6, 17); path.lineTo(3, 17); path.close();
            } else if (kind == 2) { // Heart.
                path.moveTo(12, 21);
                path.cubicTo(10, 19, 2, 13, 2, 8);
                path.cubicTo(2, 2, 9, 1, 12, 6);
                path.cubicTo(15, 1, 22, 2, 22, 8);
                path.cubicTo(22, 13, 14, 19, 12, 21); path.close();
            } else { // Mylist folder.
                path.moveTo(2, 4); path.lineTo(10, 4); path.lineTo(13, 7);
                path.lineTo(22, 7); path.lineTo(22, 21); path.lineTo(2, 21); path.close();
            }
            canvas.drawPath(path, paint);
            canvas.restoreToCount(saved);
        }
    }
}
