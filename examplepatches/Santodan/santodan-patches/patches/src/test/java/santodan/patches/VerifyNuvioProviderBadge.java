package santodan.patches;

import java.util.Map;
import software.santodan.extension.nuviomerged.NuvioProviderBadge;

public final class VerifyNuvioProviderBadge {
    public static final class Progress {
        private final String type, id;
        Progress(String type, String id) { this.type = type; this.id = id; }
        public String getContentType() { return type; }
        public String getContentId() { return id; }
    }
    public static final class Info {
        public final String a, b;
        Info(String id, String type) { a = id; b = type; }
    }
    public static final class Next { public final Info a; Next(Info info) { a = info; } }
    public static final class Card {
        public final Progress x;
        public final Next y;
        public final String r = "Same title";
        Card(Progress progress, Next next) { x = progress; y = next; }
    }
    private static void expect(String expected, Card card, Map<String, String> origins) throws Exception {
        String actual = NuvioProviderBadge.source(card, origins);
        if (!java.util.Objects.equals(expected, actual)) throw new AssertionError("Expected " + expected + ", got " + actual);
    }
    public static void main(String[] args) throws Exception {
        Map<String, String> origins = Map.of("series|tt1", "Trakt", "series|tt2", "Simkl",
            "movie|tt1", "MDBList", "series|tt3", "Nuvio Sync");
        expect("Trakt", new Card(new Progress("series", "tt1"), null), origins);
        expect("Simkl", new Card(new Progress("series", "tt2"), null), origins);
        expect("MDBList", new Card(new Progress("movie", "tt1"), null), origins);
        expect("Nuvio Sync", new Card(null, new Next(new Info("tt3", "series"))), origins);
        expect(null, new Card(new Progress("series", "unknown"), null), origins);
        expect(null, new Card(null, null), origins);
        for (String source : origins.values()) if (NuvioProviderBadge.resource(source) == null)
            throw new AssertionError("Missing provider artwork: " + source);
        if (NuvioProviderBadge.resource("unknown") != null) throw new AssertionError("Unknown provider guessed");
        System.out.println("PASS: exact IDs and types, duplicate titles, next-up cards, four provider icons, missing origins hidden");
    }
}
