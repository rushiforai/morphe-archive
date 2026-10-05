package e.e.a;

import java.util.Arrays;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Reads existing (including cached/localized) list statistics without rounding. */
public final class VideoCountRules {
    private static final Pattern ITEM = Pattern.compile(
        "(再生数|再生|Views|觀看|コメント|コメ|Comments|留言|いいね|Likes|按讚|マイリスト|マイリス|マイ|Mylists|My Lists|播放清單)[:：]\\s*([0-9][0-9,]*)");
    private VideoCountRules() {}

    // Official order: views, comments, likes, mylists. -1 means not supplied.
    public static long[] parse(CharSequence text) {
        if (text == null) return null;
        String source = text.toString();
        Matcher matcher = ITEM.matcher(source);
        long[] counts = new long[4];
        Arrays.fill(counts, -1);
        int end = 0;
        while (matcher.find()) {
            if (!separator(source.substring(end, matcher.start()))) return null;
            String label = matcher.group(1);
            int index = label.equals("再生数") || label.equals("再生") || label.equals("Views") || label.equals("觀看") ? 0
                : label.equals("コメント") || label.equals("コメ") || label.equals("Comments") || label.equals("留言") ? 1
                : label.equals("いいね") || label.equals("Likes") || label.equals("按讚") ? 2 : 3;
            if (counts[index] >= 0) return null;
            try { counts[index] = Long.parseLong(matcher.group(2).replace(",", "")); }
            catch (NumberFormatException invalid) { return null; }
            end = matcher.end();
        }
        return separator(source.substring(end)) && counts[0] >= 0 && counts[1] >= 0 && counts[3] >= 0 ? counts : null;
    }

    private static boolean separator(String value) { return value.matches("[\\s|]*"); }
    public static String format(long value) { return String.format(Locale.US, "%,d", value); }
}
