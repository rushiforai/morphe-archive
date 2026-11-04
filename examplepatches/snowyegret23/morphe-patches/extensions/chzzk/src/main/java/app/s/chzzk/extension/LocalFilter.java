package app.s.chzzk.extension;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public final class LocalFilter {
    private static volatile String[] channels = new String[0];
    private static volatile String[] titles = new String[0];
    private static volatile String[] categories = new String[0];

    private LocalFilter() {}

    public static void configure(String channelRules, String titleRules, String categoryRules) {
        channels = rules(channelRules);
        titles = rules(titleRules);
        categories = rules(categoryRules);
    }

    private static String[] rules(String input) {
        ArrayList<String> result = new ArrayList<>();
        for (String line : input.split("\\r?\\n")) {
            String value = line.trim().toLowerCase(Locale.ROOT);
            if (!value.isEmpty() && !result.contains(value)) result.add(value);
            if (result.size() == 100) break;
        }
        return result.toArray(new String[0]);
    }

    public static String[] itemInfo(Object item) { return null; }

    public static <T> List<T> filter(List<T> source) {
        String[] channelRules = channels;
        String[] titleRules = titles;
        String[] categoryRules = categories;
        if (source == null || source.isEmpty()
                || channelRules.length + titleRules.length + categoryRules.length == 0) return source;
        ArrayList<T> filtered = null;
        for (int i = 0; i < source.size(); i++) {
            T item = source.get(i);
            String[] info = itemInfo(item);
            boolean hidden = info != null && (equalsAny(info[0], channelRules)
                    || equalsAny(info[1], channelRules) || containsAny(info[2], titleRules)
                    || containsAny(info[3], categoryRules));
            if (hidden && filtered == null) filtered = new ArrayList<>(source.subList(0, i));
            if (!hidden && filtered != null) filtered.add(item);
        }
        return filtered == null ? source : filtered;
    }

    private static boolean equalsAny(String value, String[] rules) {
        if (value == null) return false;
        String normalized = value.toLowerCase(Locale.ROOT);
        for (String rule : rules) if (normalized.equals(rule)) return true;
        return false;
    }

    private static boolean containsAny(String value, String[] rules) {
        if (value == null) return false;
        String normalized = value.toLowerCase(Locale.ROOT);
        for (String rule : rules) if (normalized.contains(rule)) return true;
        return false;
    }
}
