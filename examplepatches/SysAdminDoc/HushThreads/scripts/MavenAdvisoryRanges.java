import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Comparator;
import org.apache.maven.artifact.versioning.ComparableVersion;

/** OSV ECOSYSTEM range evaluation using Maven's maintained version ordering. */
class MavenAdvisoryRanges {
    private record Event(String kind, String text, ComparableVersion version) {}

    public static void main(String[] args) throws Exception {
        var input = new BufferedReader(new InputStreamReader(System.in, StandardCharsets.UTF_8));
        var version = new ComparableVersion(new String(Base64.getDecoder().decode(input.readLine()), StandardCharsets.UTF_8));
        var events = new ArrayList<Event>();
        boolean affected = false;
        String line;
        while ((line = input.readLine()) != null) {
            if (line.equals(".")) {
                var limits = events.stream().filter(event -> event.kind.equals("limit")).toList();
                if (!limits.isEmpty() && limits.stream().noneMatch(event -> event.text.contains("*")
                        || version.compareTo(event.version) < 0)) {
                    events.clear();
                    continue;
                }
                var timeline = events.stream().filter(event -> !event.kind.equals("limit"))
                        .sorted(Comparator.comparing(Event::version, Comparator.nullsFirst(Comparator.naturalOrder()))
                                .thenComparing(event -> event.kind.equals("introduced") ? 0 : 1)).toList();
                boolean intervalAffected = false;
                for (var event : timeline) {
                    int order = event.version == null ? 1 : version.compareTo(event.version);
                    if (event.kind.equals("introduced") && order >= 0) intervalAffected = true;
                    else if (event.kind.equals("fixed") && order >= 0
                            || event.kind.equals("last_affected") && order > 0) intervalAffected = false;
                }
                affected |= intervalAffected;
                events.clear();
                continue;
            }
            var parts = line.split(" ", 2);
            var text = new String(Base64.getDecoder().decode(parts[1]), StandardCharsets.UTF_8);
            boolean special = parts[0].equals("introduced") && text.equals("0")
                    || parts[0].equals("limit") && text.contains("*");
            events.add(new Event(parts[0], text, special ? null : new ComparableVersion(text)));
        }
        if (!events.isEmpty()) throw new IllegalArgumentException("Unterminated OSV range");
        System.out.println(affected);
    }
}
