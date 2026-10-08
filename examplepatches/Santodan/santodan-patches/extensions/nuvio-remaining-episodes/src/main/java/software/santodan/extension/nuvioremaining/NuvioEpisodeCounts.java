package software.santodan.extension.nuvioremaining;

import java.util.Set;

/** Uses Nuvio's caught-up rule for provider/addon numbering differences. */
public final class NuvioEpisodeCounts {
    private NuvioEpisodeCounts() {}

    public static int remaining(Set<?> aired, Set<?> watched) {
        // Home's publishBadgeUpdate accepts count coverage as well as exact keys.
        // Subtracting keys alone can count almost an entire anime as unwatched.
        if (watched.size() >= aired.size()) return 0;
        int count = 0;
        for (Object episode : aired) if (!watched.contains(episode)) count++;
        return count;
    }
}
