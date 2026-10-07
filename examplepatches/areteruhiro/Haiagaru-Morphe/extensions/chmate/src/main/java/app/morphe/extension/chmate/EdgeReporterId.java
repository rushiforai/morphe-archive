package app.morphe.extension.chmate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Parsing shared by history persistence and the NGThread shortcut. */
public final class EdgeReporterId {
    // The reporter token is delimited by the display wrapper, not by a fixed
    // alphabet or length. Keep accepting future punctuation/ID formats while
    // excluding whitespace and the wrapper brackets from the token itself.
    private static final Pattern SUFFIX = Pattern.compile("\\s+\\[([^\\[\\]\\s]+)★\\]$");
    private EdgeReporterId() {}
    public static String suffix(String title) {
        if (title == null) return null;
        Matcher matcher = SUFFIX.matcher(title);
        return matcher.find() ? matcher.group().trim() : null;
    }
    /** Reporter IDs are display metadata, not part of a next-thread title match. */
    public static String titleForNextThreadMatch(String title) {
        if (title == null) return null;
        Matcher matcher = SUFFIX.matcher(title);
        return matcher.find() ? title.substring(0, matcher.start()) : title;
    }
    public static boolean isBoard(Object board) {
        if (board == null) return false;
        String value = board.toString();
        return value.equals("bbs.eddibb.cc%2Fliveedge")
                || value.equals("bbs.eddibb.cc/liveedge")
                || value.equals("http://bbs.eddibb.cc/liveedge/")
                || value.equals("https://bbs.eddibb.cc/liveedge/");
    }
    public static String restore(String title, String suffix) {
        if (title == null || title.isEmpty() || suffix(title) != null || suffix == null) return title;
        return suffix("x " + suffix) == null ? title : title + " " + suffix;
    }
}
