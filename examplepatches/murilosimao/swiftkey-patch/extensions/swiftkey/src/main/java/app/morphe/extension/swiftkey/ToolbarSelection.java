package app.morphe.extension.swiftkey;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

/** Host-independent selection rules, including the native layout's two-item minimum. */
public final class ToolbarSelection {
    public static final int MORE = 16;
    private ToolbarSelection() {}

    public static List<Integer> parse(String value) {
        LinkedHashSet<Integer> result = new LinkedHashSet<>();
        for (String token : value.split(",")) {
            try {
                int id = Integer.parseInt(token.trim());
                if (id >= 0 && id != MORE) result.add(id);
            } catch (NumberFormatException ignored) { /* Discard damaged/obsolete entries. */ }
        }
        return new ArrayList<>(result);
    }

    public static String encode(List<Integer> ids) {
        StringBuilder result = new StringBuilder();
        for (int id : new LinkedHashSet<>(ids)) {
            if (id < 0 || id == MORE) continue;
            if (result.length() > 0) result.append(',');
            result.append(id);
        }
        return result.toString();
    }

    public static <T> ArrayList<T> choose(Map<Integer, T> available, List<Integer> requested, int capacity) {
        ArrayList<T> result = new ArrayList<>();
        int dynamicCapacity = Math.max(1, capacity - (available.containsKey(MORE) ? 1 : 0));
        for (int id : new LinkedHashSet<>(requested)) {
            if (id != MORE && available.containsKey(id) && result.size() < dynamicCapacity) {
                result.add(available.get(id));
            }
        }
        // A selected feature may be unavailable for the current field or app state.
        if (result.isEmpty()) {
            if (available.containsKey(0)) result.add(available.get(0));
            else for (int id : available.keySet()) {
                if (id != MORE) { result.add(available.get(id)); break; }
            }
        }
        if (available.containsKey(MORE)) result.add(available.get(MORE));
        return result;
    }
}
