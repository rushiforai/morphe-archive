package santodan.patches;

import java.util.HashSet;
import java.util.Set;
import software.santodan.extension.nuvioremaining.NuvioEpisodeCounts;

public final class VerifyNuvioRemainingCounts {
    private static Set<String> episodes(String prefix, int first, int last) {
        Set<String> result = new HashSet<>();
        for (int i = first; i <= last; i++) result.add(prefix + i);
        return result;
    }

    private static void check(int expected, Set<?> aired, Set<?> watched) {
        int actual = NuvioEpisodeCounts.remaining(aired, watched);
        if (actual != expected) throw new AssertionError("Expected " + expected + ", got " + actual);
    }

    public static void main(String[] args) {
        // Reproduce the log: 414 aired, 418 watched, only 41 exact matches.
        Set<String> aired = episodes("catalog:", 1, 414);
        Set<String> watched = episodes("catalog:", 1, 41);
        watched.addAll(episodes("provider:", 42, 418));
        check(0, aired, watched);
        check(0, aired, episodes("provider:", 1, 414));
        check(2, episodes("s1:", 1, 10), episodes("s1:", 1, 8));
        // Gaps must remain unwatched; the latest watched episode isn't a prefix.
        check(8, episodes("s1:", 1, 10), Set.of("s1:1", "s1:10"));
        // Watched specials do not subtract from unmatched main episodes below coverage.
        check(2, episodes("s1:", 1, 10), Set.of("s1:1", "s1:2", "s1:3", "s1:4",
            "s1:5", "s1:6", "s1:7", "s1:8", "s0:1"));
        check(10, episodes("s1:", 1, 10), Set.of());
        check(0, Set.of(), Set.of());
        System.out.println("PASS: Bleach numbering mismatch, partial progress, gaps, specials, and empty sets");
    }
}
