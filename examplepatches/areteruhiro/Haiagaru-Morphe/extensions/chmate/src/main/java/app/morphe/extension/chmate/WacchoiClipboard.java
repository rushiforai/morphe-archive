package app.morphe.extension.chmate;

import android.content.ClipData;
import android.content.Context;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Optional cleanup for ChMate's existing full Wacchoi copy action. */
final class WacchoiClipboard {
    static final String STRIP_PARENTHESES = "wacchoiCopyStripParentheses";
    private static final String CODE = "(?<![A-Za-z0-9])[A-Za-z0-9]{4}-[^\\s()（）<>]{4}(?![A-Za-z0-9])";
    private static final Pattern WRAPPED = Pattern.compile(
            "\\(([^()（）\\r\\n]*?" + CODE + "[^()（）\\r\\n]*?)\\)"
                    + "|（([^()（）\\r\\n]*?" + CODE + "[^()（）\\r\\n]*?)）");

    static ClipData stripIfEnabled(Context context, ClipData clip) {
        if (context == null || clip == null || clip.getItemCount() != 1
                || !context.getSharedPreferences("haiagaru_response_actions", 0)
                        .getBoolean(STRIP_PARENTHESES, false)) return clip;
        ClipData.Item item = clip.getItemAt(0);
        if (item.getText() == null || item.getUri() != null || item.getIntent() != null) return clip;
        String source = item.getText().toString();
        String copied = stripParentheses(source);
        return source.equals(copied) ? clip : new ClipData(clip.getDescription(), new ClipData.Item(copied));
    }

    static String stripParentheses(String source) {
        if (source == null || source.indexOf('\n') >= 0 || source.indexOf('\r') >= 0) return source;
        Matcher matcher = WRAPPED.matcher(source);
        StringBuffer out = new StringBuffer(source.length());
        while (matcher.find()) {
            String inner = matcher.group(1) != null ? matcher.group(1) : matcher.group(2);
            matcher.appendReplacement(out, Matcher.quoteReplacement(inner));
        }
        matcher.appendTail(out);
        return out.toString();
    }

    private WacchoiClipboard() { }
}
