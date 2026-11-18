package app.saketh.extension.navigation;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Pure policy shared by the runtime, controls and standalone check. */
public final class NavigationPolicy {
    public static final String ORDER = "navigation_order", HIDDEN = "navigation_hidden";
    private static final List<String> STOCK = Arrays.asList(
            "tabLibrary", "tabFeature", "tabWrite", "tabExplore", "tabProfile");

    private NavigationPolicy() {}

    public static List<String> order(String saved) {
        List<String> result = new ArrayList<>(STOCK.size());
        if (saved != null) {
            for (String entry : saved.split(",")) {
                String tab = entry.trim();
                if (STOCK.contains(tab) && !result.contains(tab)) result.add(tab);
            }
        }
        for (String tab : STOCK) if (!result.contains(tab)) result.add(tab);
        return result;
    }

    public static boolean canHide(String tab) {
        return "tabFeature".equals(tab) || "tabWrite".equals(tab) || "tabExplore".equals(tab);
    }

    public static Set<String> hidden(Set<String> saved) {
        Set<String> result = new HashSet<>();
        if (saved != null) for (String tab : saved) if (canHide(tab)) result.add(tab);
        return result;
    }

    public static int visibility(String tab, int nativeVisibility, Set<String> hidden) {
        // Android VISIBLE=0, INVISIBLE=4, GONE=8. Invisible Writing reserves the native promotion's slot.
        return nativeVisibility == 0 && canHide(tab) && hidden.contains(tab) ? 8 : nativeVisibility;
    }

    /** WebNovel's launch screen is usually Featured (screen 1); use Library (screen 0) while Featured is hidden. */
    public static int startTab(int nativeScreen, Set<String> hidden) {
        return nativeScreen == 1 && hidden.contains("tabFeature") ? 0 : nativeScreen;
    }

    public static String label(String tab) {
        switch (tab) {
            case "tabLibrary": return "Library";
            case "tabFeature": return "Featured";
            case "tabWrite": return "Writing";
            case "tabExplore": return "Explore";
            case "tabProfile": return "Profile";
            default: throw new IllegalArgumentException("Unknown navigation tab");
        }
    }
}
