package software.santodan.extension.pilloweight;

import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** SWT dates are epoch milliseconds; Pillo records epoch seconds and pounds. */
public final class WeightBackup {
    public static final class Entry {
        public final long seconds;
        public final float pounds;
        public Entry(long seconds, float pounds) { this.seconds = seconds; this.pounds = pounds; }
        public String key() { return seconds + ":" + Float.floatToIntBits(pounds); }
    }

    public static List<Entry> parse(String json, boolean kilograms) throws Exception {
        JSONArray weights = new JSONObject(json).getJSONArray("weights");
        if (weights.length() == 0 || weights.length() > 10000)
            throw new IllegalArgumentException("The backup must contain 1 to 10,000 weights.");
        List<Entry> result = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        for (int i = 0; i < weights.length(); i++) {
            JSONObject row = weights.getJSONObject(i);
            Object date = row.get("date"), value = row.get("weight");
            if (!(date instanceof Number) || !(value instanceof Number))
                throw new IllegalArgumentException("Invalid date or weight at entry " + (i + 1));
            double millis = ((Number) date).doubleValue();
            double weight = ((Number) value).doubleValue();
            if (!Double.isFinite(millis) || millis != Math.rint(millis)
                || millis < 946684800000L || millis >= 4102444800000L
                || !Double.isFinite(weight) || weight <= 0)
                throw new IllegalArgumentException("Invalid date or weight at entry " + (i + 1));
            float pounds = (float) (kilograms ? weight / 0.45359237d : weight);
            if (!Float.isFinite(pounds) || pounds <= 0)
                throw new IllegalArgumentException("Invalid weight at entry " + (i + 1));
            Entry entry = new Entry(((Number) date).longValue() / 1000L, pounds);
            if (seen.add(entry.key())) result.add(entry);
        }
        result.sort(Comparator.comparingLong(e -> e.seconds));
        return result;
    }
}
