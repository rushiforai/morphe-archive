package santodan.patches;

import java.util.*;
import software.santodan.extension.nuviomerged.NuvioWatchedHistory;

public final class VerifyNuvioWatchedHistory {
    public static void main(String[] args) {
        Map<String, Map<String, Set<String>>> histories = new LinkedHashMap<>();
        histories.put("Trakt", Map.of("tt1", Set.of("1:1"), "tt2", Set.of("1:1", "1:2")));
        histories.put("Simkl", Map.of("tt1", Set.of("17:1", "17:2"), "tt3", Set.of("1:1")));
        histories.put("Nuvio Sync", Map.of("tt4", Set.of("1:1")));
        Map<String, Set<String>> aliases = Map.of("tt1", Set.of("tmdb:1", "mal:1"),
            "tmdb:1", Set.of("tt1", "mal:1"), "mal:1", Set.of("tt1", "tmdb:1"));
        Map<String, String> sources = NuvioWatchedHistory.sources(histories, Map.of("tt1", "Simkl"), aliases);
        Map<String, Set<String>> result = NuvioWatchedHistory.select(histories, sources, aliases);
        if (!result.get("tt1").equals(Set.of("17:1", "17:2")))
            throw new AssertionError("Watched history must follow the Continue Watching winner, not the carrier");
        if (!result.get("tmdb:1").equals(result.get("tt1")) || !result.get("mal:1").equals(result.get("tt1")))
            throw new AssertionError("Library/collection alternate IDs need the same watched projection");
        if (!result.keySet().containsAll(Set.of("tt2", "tt3", "tt4")))
            throw new AssertionError("Provider-only and local-only shows were lost");
        sources = NuvioWatchedHistory.sources(histories, Map.of("tt2", "Simkl", "tmdb:1", "Trakt"), aliases);
        result = NuvioWatchedHistory.select(histories, sources, aliases);
        if (!result.get("tt2").isEmpty()) throw new AssertionError("Winning source's unwatched history was overwritten");
        if (!result.get("tt1").equals(Set.of("1:1"))) throw new AssertionError("Alternate-ID origin was ignored");
        if (!NuvioWatchedHistory.select(Map.<String, Map<String, Set<String>>>of(), Map.of(), Map.of()).isEmpty())
            throw new AssertionError("Empty providers created watched labels");
        Map<String, Set<String>> ambiguous = Map.of("tt1", Set.of("__ambiguous__", "tmdb:other"));
        result = NuvioWatchedHistory.select(histories, Map.of("tt1", "Simkl"), ambiguous);
        if (result.containsKey("__ambiguous__") || result.containsKey("tmdb:other"))
            throw new AssertionError("Ambiguous siblings must not mark unrelated shows watched");
        System.out.println("PASS: coherent watched winners, carrier independence, alternate IDs, local-only shows, and unwatched winners");
    }
}
