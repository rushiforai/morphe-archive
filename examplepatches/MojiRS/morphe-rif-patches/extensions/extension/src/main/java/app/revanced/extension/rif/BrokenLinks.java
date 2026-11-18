package app.revanced.extension.rif;

import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.TypefaceSpan;
import android.text.style.URLSpan;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * "Fix broken markdown links": Reddit's markdown renderer (snudown) refuses
 * {@code [label](u/name)} because the target has no scheme and no leading slash. Its
 * {@code body_html} then holds the source as literal text, with the {@code u/name} pieces
 * autolinked: {@code [<a>u/Lux</a>_Stella](<a>u/Lux_Stella</a>)}. rif shows that as is.
 *
 * Hooked into rif's body render task between "HTML to Spanned" and the step that turns
 * the URL spans into rif's link spans and fills the links sheet's lists, so those are built
 * from the repaired text. Here the whole {@code [label](target)} becomes just the label,
 * with one URL span {@code /u/name} (the href form Reddit uses for its own autolinks).
 *
 * Only {@code u/name} and {@code r/name} targets (optional leading and trailing slash) are
 * repaired, and only when Reddit autolinked the target, which also rules out code, where
 * nothing is autolinked.
 */
public final class BrokenLinks {

    private static final String TAG = "RifBrokenLinks";

    // [label](target): the label has no brackets or newline; group 2 is the optional leading
    // slash, 3 the letter, 4 the name.
    private static final Pattern BROKEN = Pattern.compile(
            "\\[([^\\[\\]\\n]+)\\]\\((/?)([ur])/([A-Za-z0-9_-]+)/?\\)", Pattern.CASE_INSENSITIVE);

    private BrokenLinks() {}

    /** One repair: the text {@code [start, end)} becomes the label with {@code href}. */
    static final class Fix {
        final int start;      // index of '['
        final int labelEnd;   // index of ']'
        final int end;        // index after ')'
        final String href;

        Fix(int start, int labelEnd, int end, String href) {
            this.start = start;
            this.labelEnd = labelEnd;
            this.end = end;
            this.href = href;
        }
    }

    /**
     * Hook entry (background thread): repairs {@code body} in place. Never throws: on any
     * failure the body is left as it is.
     */
    public static void repair(Spannable body) {
        try {
            if (!(body instanceof SpannableStringBuilder)) return;
            SpannableStringBuilder ssb = (SpannableStringBuilder) body;
            if (ssb.length() < 8 || ssb.toString().indexOf("](") < 0) return;

            List<int[]> urls = new ArrayList<>();
            for (URLSpan span : ssb.getSpans(0, ssb.length(), URLSpan.class)) {
                urls.add(new int[]{ssb.getSpanStart(span), ssb.getSpanEnd(span)});
            }
            List<int[]> code = new ArrayList<>();
            for (TypefaceSpan span : ssb.getSpans(0, ssb.length(), TypefaceSpan.class)) {
                if ("monospace".equals(span.getFamily())) {
                    code.add(new int[]{ssb.getSpanStart(span), ssb.getSpanEnd(span)});
                }
            }

            List<Fix> fixes = find(ssb.toString(), urls, code);
            // Last to first, so the earlier offsets stay valid.
            for (int i = fixes.size() - 1; i >= 0; i--) {
                apply(ssb, fixes.get(i));
            }
        } catch (RuntimeException e) {
            Log.w(TAG, "repair failed; body left as is", e);
        }
    }

    private static void apply(SpannableStringBuilder ssb, Fix fix) {
        for (URLSpan span : ssb.getSpans(fix.start, fix.end, URLSpan.class)) {
            int s = ssb.getSpanStart(span);
            int e = ssb.getSpanEnd(span);
            if (s >= fix.start && e <= fix.end) ssb.removeSpan(span);
        }
        int labelLength = fix.labelEnd - fix.start - 1;
        ssb.delete(fix.labelEnd, fix.end); // "](target)"
        ssb.delete(fix.start, fix.start + 1); // "["
        ssb.setSpan(new URLSpan(fix.href), fix.start, fix.start + labelLength,
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }

    /**
     * Finds the repairs in {@code text}. {@code urls} and {@code code} are {@code [start, end)}
     * ranges of its URL spans and monospace spans. A match needs an autolink inside it that
     * covers the {@code u/name} core of the target, and must not touch code.
     */
    static List<Fix> find(CharSequence text, List<int[]> urls, List<int[]> code) {
        List<Fix> fixes = new ArrayList<>();
        Matcher m = BROKEN.matcher(text);
        while (m.find()) {
            int start = m.start();
            int end = m.end();
            if (touches(code, start, end)) continue;
            // Core of the target: "u/name", without the optional slashes.
            int coreStart = m.start(3);
            int coreEnd = m.end(4);
            if (!autolinked(urls, start, end, coreStart, coreEnd)) continue;
            String href = "/" + m.group(3).toLowerCase() + "/" + m.group(4);
            fixes.add(new Fix(start, m.end(1), end, href));
        }
        return fixes;
    }

    private static boolean touches(List<int[]> ranges, int start, int end) {
        for (int[] r : ranges) {
            if (r[0] < end && r[1] > start) return true;
        }
        return false;
    }

    private static boolean autolinked(List<int[]> urls, int start, int end, int coreStart, int coreEnd) {
        for (int[] r : urls) {
            if (r[0] >= start && r[1] <= end && r[0] <= coreStart && r[1] >= coreEnd) return true;
        }
        return false;
    }
}
