package app.morphe.extension.chmate;

import android.graphics.Paint;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.LineHeightSpan;
import android.widget.TextView;

/** Changes only distances between title lines, never the row's outer/font padding. */
public final class ThreadTitleSpacing {
    private ThreadTitleSpacing() {}

    public static void apply(TextView title) {
        if (title == null) return;
        ThreadListThumbnail.title(title);
        int percent = Haiagaru.threadTitleSpacingPercent();
        CharSequence text = title.getText();
        if (text == null || text.length() == 0) return;
        Spacing[] spans = text instanceof Spanned
                ? ((Spanned) text).getSpans(0, text.length(), Spacing.class) : new Spacing[0];
        if (percent == 100 && spans.length == 0) return;
        if (percent > 100 && spans.length == 1 && spans[0].percent == percent
                && ((Spanned) text).getSpanStart(spans[0]) == 0
                && ((Spanned) text).getSpanEnd(spans[0]) == text.length()) return;
        // Preserve links, search highlighting and every native span. Remove only our own.
        SpannableString result = new SpannableString(text);
        for (Spacing span : spans) result.removeSpan(span);
        if (percent > 100) result.setSpan(new Spacing(percent), 0, result.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        title.setText(result);
    }

    /** Uses the actual line metrics, including Japanese/custom-font fallback metrics. */
    private static final class Spacing implements LineHeightSpan {
        final int percent;
        private Paint.FontMetricsInt previousMetrics;
        private int originalDescent, adjustedDescent, previousAscent, previousTop, previousBottom;
        Spacing(int percent) { this.percent = percent; }

        @Override public void chooseHeight(CharSequence text, int start, int end,
                int spanstartv, int lineHeight, Paint.FontMetricsInt fm) {
            // StaticLayout can reuse the same metrics object for consecutive lines.
            // Undo only our previous adjustment before calculating this line's gap.
            if (start > 0 && previousMetrics != null && fm.descent == adjustedDescent
                    && fm.ascent == previousAscent && fm.top == previousTop) {
                fm.descent = originalDescent;
                // Fallback line spacing also carries descent into the next line's bottom.
                if (fm.bottom == Math.max(previousBottom, adjustedDescent)) fm.bottom = previousBottom;
            }
            previousMetrics = null;
            // No gap above the first line or below the last line. Single-line rows stay unchanged.
            if (end >= text.length()) return;
            int height = fm.descent - fm.ascent;
            if (height <= 0) return;
            int gap = Math.round(height * ((percent - 100) / 100f));
            previousMetrics = fm;
            originalDescent = fm.descent;
            previousAscent = fm.ascent; previousTop = fm.top; previousBottom = fm.bottom;
            fm.descent += gap;
            adjustedDescent = fm.descent;
        }
    }
}
