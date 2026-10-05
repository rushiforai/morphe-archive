package e.e.a;

/** Shared metadata order. Missing or malformed fields stay absent, including likes. */
public final class VideoInfoCounts {
    public interface Values { String get(String key); }
    private VideoInfoCounts() {}
    public static long[] read(Values values) {
        String[] keys = {"viewCount", "commentCount", "likeCount", "mylistCount"};
        long[] result = new long[keys.length];
        for (int i = 0; i < keys.length; i++) {
            result[i] = -1;
            try {
                String value = values.get(keys[i]);
                if (value != null) {
                    long parsed = Long.parseLong(value.replace(",", ""));
                    if (parsed >= 0) result[i] = parsed;
                }
            } catch (NumberFormatException ignored) { }
        }
        return result;
    }
}
