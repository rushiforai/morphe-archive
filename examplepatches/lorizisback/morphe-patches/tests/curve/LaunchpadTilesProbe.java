import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

/** Tests actual Curve button models and the display helper; no account or network access. */
public final class LaunchpadTilesProbe {
    private static Object button(String title, String id) throws Exception {
        Class<?> action = Class.forName("com.curve.launchpad.model.LaunchpadAction");
        return Class.forName("com.curve.launchpad.model.LaunchpadItem$Button")
            .getConstructor(String.class, String.class, String.class, String.class, action)
            .newInstance(title, "fixture://icon", null, id, action.getField("NONE").get(null));
    }
    private static void require(boolean condition, String message) { PatchSettingsProbe.require(condition, message); }
    public static void main(String[] args) throws Exception {
        PatchSettingsProbe.Memory memory = new PatchSettingsProbe.Memory();
        memory.cached.put("remove_cringe", false); memory.initialize();
        Class<?> helper = Class.forName("app.local.extension.curve.LaunchpadTiles");
        Method filter = helper.getMethod("filter", List.class);
        Method catalog = helper.getDeclaredMethod("catalog"); catalog.setAccessible(true);
        Object a = button("First", "a"), duplicate = button("Renamed", "a"), b = button("Second", "b");
        Object patches = button("Patches", "morphe_patches"), empty = button("Empty", ""), other = new Object();
        List<Object> source = new ArrayList<>(Arrays.asList(a, duplicate, b, patches, empty, other, null));
        require(filter.invoke(null, source) == source, "Off must preserve source identity");
        require(new ArrayList<>(((Map<?, ?>) catalog.invoke(null)).keySet()).equals(Arrays.asList("a", "b")),
            "Catalog must deduplicate ordered IDs and exclude Patches/empty IDs");
        PatchSettingsProbe.save(true, true, new HashSet<>(Arrays.asList("a", "morphe_patches", "")));
        require(filter.invoke(null, source).equals(Arrays.asList(b, patches, empty, other, null)), "Hide matching duplicates only");
        require(source.size() == 7 && source.get(0) == a, "Source models mutated");
        require(((Map<?, ?>) catalog.invoke(null)).size() == 2, "Hidden choice disappeared from catalog");
        PatchSettingsProbe.save(false, true, new HashSet<>(Arrays.asList("a", "b")));
        require(filter.invoke(null, source).equals(Arrays.asList(patches, empty, other, null)), "Keep Patches when all selected");
        Object fresh = button("New", "new");
        require(filter.invoke(null, Arrays.asList(fresh, patches)).equals(Arrays.asList(fresh, patches)), "New IDs must appear");
        PatchSettingsProbe.save(false, false, Collections.singleton("a"));
        require(filter.invoke(null, source) == source, "Off must restore every tile while keeping selection");
        PatchSettingsProbe.save(false, true, Collections.emptySet());
        require(filter.invoke(null, source).equals(source), "Reset failed");
        require(filter.invoke(null, Collections.emptyList()).equals(Collections.emptyList()), "Empty grid");
        System.out.println("PASS Launchpad tiles: off/on/all/reset, protected Patches, duplicates/empty/new IDs, catalog, identity/order and Flex independence");
    }
}
