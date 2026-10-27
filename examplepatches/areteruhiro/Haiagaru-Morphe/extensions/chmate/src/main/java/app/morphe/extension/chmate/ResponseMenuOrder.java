package app.morphe.extension.chmate;

import java.util.List;
import java.util.Map;
import java.util.function.ToIntFunction;

/** Restore saved positions without recreating menu items or their share destinations. */
public final class ResponseMenuOrder {
    private ResponseMenuOrder() { }

    static <T> void apply(List<T> items, ToIntFunction<T> id, Map<Integer, Integer> ranks) {
        boolean hasRememberedShare = false;
        for (T item : items) {
            int key = id.applyAsInt(item);
            if (key >= 70 && key <= 74 && ranks.containsKey(key)) {
                hasRememberedShare = true;
                break;
            }
        }
        if (!hasRememberedShare) return;
        // Stable sort keeps unknown/native-only actions in their relative order.
        items.sort((a, b) -> Integer.compare(ranks.getOrDefault(id.applyAsInt(a), Integer.MAX_VALUE),
                ranks.getOrDefault(id.applyAsInt(b), Integer.MAX_VALUE)));
    }
}
