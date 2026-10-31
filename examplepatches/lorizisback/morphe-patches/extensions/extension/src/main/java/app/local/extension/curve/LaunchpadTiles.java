package app.local.extension.curve;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Filters the displayed grid without changing the shared navigation models. */
public final class LaunchpadTiles {
    private static volatile Map<String, String> catalog = Collections.emptyMap();

    private LaunchpadTiles() {}

    static Map<String, String> catalog() { return catalog; }

    private static String id(Object item) throws ReflectiveOperationException {
        if (item == null || !item.getClass().getName().equals("com.curve.launchpad.model.LaunchpadItem$Button")) {
            return null;
        }
        return (String) item.getClass().getMethod("getId").invoke(item);
    }

    public static List<?> filter(List<?> items) {
        Map<String, String> available = new LinkedHashMap<>();
        try {
            for (Object item : items) {
                String id = id(item);
                if (id != null && !id.isEmpty() && !PatchSettings.ITEM_ID.equals(id) && !available.containsKey(id)) {
                    available.put(id, (String) item.getClass().getMethod("getTitle").invoke(item));
                }
            }
            // Capture before custom hiding so selected tiles remain available in the checklist.
            catalog = Collections.unmodifiableMap(available);
            if (!PatchSettings.isLaunchpadHidden()) return items;
            Set<String> hidden = PatchSettings.hiddenTiles();
            List<Object> visible = new ArrayList<>(items.size());
            for (Object item : items) {
                String id = id(item);
                if (id == null || id.isEmpty() || PatchSettings.ITEM_ID.equals(id) || !hidden.contains(id)) {
                    visible.add(item);
                }
            }
            return visible;
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Curve Launchpad contract changed", error);
        }
    }
}
