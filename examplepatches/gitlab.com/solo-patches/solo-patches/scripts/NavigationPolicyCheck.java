import app.saketh.extension.navigation.NavigationPolicy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Run with NavigationPolicy.java using javac, then java NavigationPolicyCheck. */
public final class NavigationPolicyCheck {
    private static final List<String> STOCK = Arrays.asList(
            "tabLibrary", "tabFeature", "tabWrite", "tabExplore", "tabProfile");

    public static void main(String[] args) {
        require(NavigationPolicy.order(null).equals(STOCK), "Unset order must be stock");
        require(NavigationPolicy.order("").equals(STOCK), "Empty order must be stock");
        require(NavigationPolicy.order("unknown,,tabWrite,tabWrite, tabProfile ,tabFeature,null")
                .equals(Arrays.asList("tabWrite", "tabProfile", "tabFeature", "tabLibrary", "tabExplore")),
                "Malformed order must discard unknowns/duplicates and restore missing tabs");
        permutations(new ArrayList<>(), new ArrayList<>(STOCK));
        for (int mask = 0; mask < 32; mask++) {
            Set<String> requested = new HashSet<>(Arrays.asList("unknown", "", null));
            for (int i = 0; i < STOCK.size(); i++) if ((mask & (1 << i)) != 0) requested.add(STOCK.get(i));
            Set<String> hidden = NavigationPolicy.hidden(requested);
            Set<String> expectedHidden = new HashSet<>(Arrays.asList("tabFeature", "tabWrite", "tabExplore"));
            expectedHidden.retainAll(requested);
            require(hidden.equals(expectedHidden), "Hide exactly the requested optional tabs, never pinned/invalid identifiers");
            require(requested.contains("unknown"), "Never mutate a preferences-owned set");
            for (String tab : STOCK) {
                int expected = expectedHidden.contains(tab) ? 8 : 0;
                require(NavigationPolicy.visibility(tab, 0, expectedHidden) == expected, "Honor optional visible tab choice");
                require(NavigationPolicy.visibility(tab, 4, expectedHidden) == 4, "Never resurrect an invisible promotional slot");
                require(NavigationPolicy.visibility(tab, 8, expectedHidden) == 8, "Never resurrect a native-unavailable tab");
                require(NavigationPolicy.visibility(tab, 0, Collections.emptySet()) == 0, "Reset/re-show restores native visibility");
            }
        }
        require(NavigationPolicy.startTab(1, new HashSet<>(Arrays.asList("tabFeature"))) == 0,
                "Launch on Library when WebNovel picks hidden Featured");
        require(NavigationPolicy.startTab(1, new HashSet<>(Arrays.asList("tabWrite", "tabExplore"))) == 1,
                "Keep WebNovel's Featured launch while Featured is shown");
        require(NavigationPolicy.startTab(0, new HashSet<>(Arrays.asList("tabFeature"))) == 0,
                "Keep WebNovel's Library launch");
        require(NavigationPolicy.hidden(null).isEmpty(), "Unset hidden choices must be stock");
        require(NavigationPolicy.visibility("tabLibrary", 0, new HashSet<>(STOCK)) == 0, "Library remains reachable even with unsanitized choices");
        require(NavigationPolicy.visibility("tabProfile", 0, new HashSet<>(STOCK)) == 0, "Profile remains reachable even with unsanitized choices");
        System.out.println("PASS: navigation order, reachability, native availability and reset policy");
    }

    private static void permutations(List<String> prefix, List<String> remaining) {
        if (remaining.isEmpty()) {
            require(NavigationPolicy.order(String.join(",", prefix)).equals(prefix), "Keep every complete requested order");
            return;
        }
        for (int i = 0; i < remaining.size(); i++) {
            List<String> next = new ArrayList<>(prefix);
            List<String> rest = new ArrayList<>(remaining);
            next.add(rest.remove(i));
            permutations(next, rest);
        }
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
