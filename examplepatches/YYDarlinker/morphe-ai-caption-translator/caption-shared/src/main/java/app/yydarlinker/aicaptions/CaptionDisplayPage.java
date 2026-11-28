package app.yydarlinker.aicaptions;

import java.util.Arrays;

/** Immutable upstream page projection; absolute media time and canonical offsets. */
public final class CaptionDisplayPage {
    public final String text, timingBasis;
    public final long start, end;
    final int fromUtf16, toUtf16;
    public final CaptionLinePlan linePlan;

    CaptionDisplayPage(
            String text,
            long start,
            long end,
            int from,
            int to,
            String basis,
            CaptionLinePlan line) {
        if (text == null || text.isEmpty() || start < 0 || end <= start || from < 0 || to <= from)
            throw new IllegalArgumentException("display_page");
        this.text = text;
        this.start = start;
        this.end = end;
        fromUtf16 = from;
        toUtf16 = to;
        timingBasis = basis;
        linePlan = line;
    }

    public boolean contains(long at) {
        return start <= at && at < end;
    }
}
