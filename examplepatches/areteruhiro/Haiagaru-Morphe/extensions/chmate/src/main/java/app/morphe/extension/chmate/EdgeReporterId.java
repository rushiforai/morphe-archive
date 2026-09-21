package app.morphe.extension.chmate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Parsing shared by history persistence and the NGThread shortcut. */
public final class EdgeReporterId {
    private static final Pattern SUFFIX = Pattern.compile(" \\[([A-Za-z0-9+/]{8})★\\]$");
    private EdgeReporterId() {}
    public static String suffix(String title) {
        if (title == null) return null;
        Matcher matcher = SUFFIX.matcher(title);
        return matcher.find() ? matcher.group().trim() : null;
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
