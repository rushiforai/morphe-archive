import app.afterglow.extension.sponsorblock.*;
import app.afterglow.extension.settings.ThemeJson;

import java.io.IOException;
import java.net.URI;
import java.net.URLDecoder;
import java.util.*;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;

public final class SponsorBlockTest {
    private static int checks;
    private static final Set<SponsorCategory> ALL = EnumSet.allOf(SponsorCategory.class);
    private static final Set<SponsorCategory> SPONSORS = EnumSet.of(SponsorCategory.SPONSOR);
    private static final class Queue implements Executor {
        final Deque<Runnable> tasks = new ArrayDeque<>();
        public void execute(Runnable task) { tasks.add(task); }
        void drain() { while (!tasks.isEmpty()) tasks.remove().run(); }
    }
    private static void check(String name, boolean ok) {
        checks++; if (!ok) throw new AssertionError(name);
    }
    private static void rejects(String name, Runnable task) {
        try { task.run(); throw new AssertionError(name + " accepted invalid input"); }
        catch (IllegalArgumentException expected) { checks++; }
    }
    private static SponsorSegment segment(double start, double end, SponsorCategory category, String id) {
        return new SponsorSegment(start, end, category, id);
    }
    private static String row(Object start, Object end, String category, String id, String action) {
        Map<String, Object> value = new LinkedHashMap<>();
        value.put("segment", Arrays.asList(start, end)); value.put("category", category);
        value.put("UUID", id); value.put("actionType", action);
        return ThemeJson.write(value);
    }
    private static String fixture() {
        return "[{\"videoID\":\"other\",\"segments\":[" + row(0, 99, "sponsor", "wrong", "skip")
                + "]},{\"videoID\":\"active\",\"segments\":["
                + String.join(",", row(8, 10, "interaction", "late", "skip"),
                row(1, 5, "sponsor", "first", "skip"), row(1, 4, "intro", "shorter", "skip"),
                row(-1, 2, "sponsor", "negative", "skip"), row(2, 2, "sponsor", "empty", "skip"),
                row(3, 2, "sponsor", "reversed", "skip"), row("1", 3, "sponsor", "string", "skip"),
                row(false, 3, "sponsor", "boolean", "skip"), row(1, 3, "sponsor", "", "skip"),
                row(1, 3, "unknown", "category", "skip"), row(1, 3, "sponsor", "mute", "mute"),
                row(1, 3, "sponsor", "no-action", null), row(1, 1e20, "sponsor", "overflow", "skip")) + "]}]";
    }

    private static void parsingAndRequest() throws Exception {
        URI uri = SponsorClient.requestUri("dQw4w9WgXcQ");
        check("HTTPS and official host", "https".equals(uri.getScheme()) && "sponsor.ajay.app".equals(uri.getHost()));
        check("known privacy hash", "/api/skipSegments/5f6b".equals(uri.getPath()));
        check("full video ID omitted", !uri.toString().contains("dQw4w9WgXcQ"));
        Map<String, String> query = new HashMap<>();
        for (String part : uri.getRawQuery().split("&")) {
            String[] pair = part.split("=", 2); query.put(pair[0], URLDecoder.decode(pair[1], "UTF-8"));
        }
        check("YouTube service", "YouTube".equals(query.get("service")));
        check("skip actions only", List.of("skip").equals(ThemeJson.parse(query.get("actionTypes"))));
        List<?> categories = (List<?>) ThemeJson.parse(query.get("categories"));
        check("all nine categories requested", categories.size() == 9);
        for (SponsorCategory category : SponsorCategory.values()) check("request " + category.id, categories.contains(category.id));
        rejects("empty video", () -> SponsorClient.requestUri(""));
        rejects("null video", () -> SponsorClient.requestUri(null));
        rejects("oversized video", () -> SponsorClient.requestUri("x".repeat(129)));

        List<SponsorSegment> rows = SponsorSegment.parse(fixture(), "active");
        check("malformed rows and other videos excluded", rows.size() == 3);
        check("ordered start/end", rows.get(0).uuid.equals("shorter") && rows.get(1).uuid.equals("first") && rows.get(2).uuid.equals("late"));
        check("missing video empty", SponsorSegment.parse(fixture(), "missing").isEmpty());
        rejects("non-array response", () -> SponsorSegment.parse("{}", "active"));
        rejects("truncated response", () -> SponsorSegment.parse("[", "active"));
        rejects("excess response", () -> SponsorSegment.parse(" ".repeat(ThemeJson.MAX_LENGTH + 1), "active"));
        rejects("NaN start", () -> segment(Double.NaN, 2, SponsorCategory.SPONSOR, "nan"));
        rejects("infinite end", () -> segment(1, Double.POSITIVE_INFINITY, SponsorCategory.SPONSOR, "infinite"));
        check("fixed category color", SponsorCategory.SPONSOR.color == 0xFF00D26A);
        check("default skip categories", Arrays.stream(SponsorCategory.values()).filter(c -> c.skipByDefault).count() == 2);
        check("sponsor and interaction default on", SponsorCategory.SPONSOR.skipByDefault && SponsorCategory.INTERACTION.skipByDefault);
    }

    private static void sessions() {
        SponsorSession session = new SponsorSession();
        long first = session.activate("active");
        session.accept("active", first, SponsorSegment.parse(fixture(), "active"));
        check("same video retains generation", session.activate("active") == first);
        check("before segment", session.claim(0.9, ALL) == null);
        check("disabled categories", session.claim(2, Collections.emptySet()) == null);
        check("unknown time", session.claim(Double.NaN, ALL) == null);
        SponsorSession.Skip skip = session.claim(1, SPONSORS);
        check("exact start eligible", skip != null && skip.segment.uuid.equals("first"));
        check("reentrant tick cannot skip again", session.claim(1, SPONSORS) == null);
        session.reject(skip);
        skip = session.claim(2, SPONSORS);
        check("failed seek can retry", skip != null);
        check("undo returns segment start", Double.valueOf(1).equals(session.consumeUndo(skip)));
        check("undo only once", session.consumeUndo(skip) == null);
        check("undo keeps segment suppressed", session.claim(2, SPONSORS) == null);
        check("exclusive end", session.claim(10, ALL) == null);
        check("end tolerance", session.claim(9.96, ALL) == null);
        SponsorSession.Skip late = session.claim(9.9, ALL);
        check("outside tolerance eligible", late != null && late.segment.uuid.equals("late"));
        check("old notice cannot undo newer skip", session.consumeUndo(skip) == null);
        long second = session.activate("other");
        check("switch clears segments", session.segments().isEmpty());
        check("old undo rejected after switch", session.consumeUndo(late) == null);
        check("old response rejected", !session.accept("active", first, SponsorSegment.parse(fixture(), "active")));
        long third = session.activate("active");
        check("A to B to A has fresh generation", third > second);
        check("first A response still rejected", !session.accept("active", first, SponsorSegment.parse(fixture(), "active")));
        check("current response accepted", session.accept("active", third, SponsorSegment.parse(fixture(), "active")));
        check("new activation can skip again", session.claim(2, SPONSORS) != null);
        session.reject(late);
        check("old reject cannot unclaim current skip", session.claim(2, SPONSORS) == null);
    }

    private static void markers() {
        List<SponsorSegment> rows = List.of(segment(0, 20, SponsorCategory.SPONSOR, "long"),
                segment(0, 10, SponsorCategory.INTRO, "short"), segment(5, 25, SponsorCategory.OUTRO, "overlap"),
                segment(10, 12, SponsorCategory.INTERACTION, "touching"), segment(30, 200, SponsorCategory.HOOK, "clamped"),
                segment(101, 102, SponsorCategory.FILLER, "outside"));
        List<SponsorMarkerLayout.Marker> markers = SponsorMarkerLayout.layout(rows, 100, ALL);
        check("outside duration omitted", markers.size() == 5);
        check("shorter equal-start segment first", markers.get(0).uuid.equals("short") && markers.get(0).lane == 0);
        check("first overlap lane", markers.get(1).lane == 1);
        check("second overlap lane", markers.get(2).lane == 2);
        check("touching endpoint reuses lane", markers.get(3).lane == 0);
        check("duration clamp", markers.get(4).endFraction == 1 && markers.get(4).startFraction == 0.3);
        check("marker category independent", SponsorMarkerLayout.layout(rows, 100, SPONSORS).size() == 1);
        check("empty categories", SponsorMarkerLayout.layout(rows, 100, Collections.emptySet()).isEmpty());
        for (double duration : new double[] {0, -1, Double.NaN, Double.POSITIVE_INFINITY})
            check("invalid duration " + duration, SponsorMarkerLayout.layout(rows, duration, ALL).isEmpty());
        float[] offsets = {0, -4, 4, -8, 8};
        for (int lane = 0; lane < offsets.length; lane++) check("lane offset " + lane, SponsorMarkerLayout.laneOffset(lane) == offsets[lane]);
        check("bright band dark outline", SponsorMarkerLayout.outlineColor(0xFFFFFFFF) == 0xE6000000);
        check("dark band light outline", SponsorMarkerLayout.outlineColor(0xFF000000) == 0xF2FFFFFF);
    }

    private static void networking() {
        Queue work = new Queue(), delivery = new Queue();
        int[] requests = {0}, completed = {0}, errors = {0};
        List<List<SponsorSegment>> values = new ArrayList<>();
        SponsorClient client = new SponsorClient(work, delivery, uri -> { requests[0]++; return new SponsorClient.Response(200, fixture()); });
        SponsorClient.Callback callback = (segments, error) -> { completed[0]++; if (error != null) errors[0]++; values.add(segments); };
        client.fetch("active", callback); client.fetch("active", callback);
        check("coalesced into one job", work.tasks.size() == 1);
        work.drain(); check("callbacks use supplied executor", completed[0] == 0 && delivery.tasks.size() == 2);
        delivery.drain(); check("both callers get filtered response", requests[0] == 1 && completed[0] == 2 && errors[0] == 0 && values.get(0).size() == 3);
        client.fetch("active", callback); check("cache hit avoids work", work.tasks.isEmpty());
        check("cache callback still dispatched", delivery.tasks.size() == 1); delivery.drain();

        int[] status = {500};
        SponsorClient failures = new SponsorClient(work, delivery, uri -> { requests[0]++; return new SponsorClient.Response(status[0], "invalid"); });
        failures.fetch("active", callback); work.drain(); delivery.drain();
        check("HTTP failure reaches callback", errors[0] == 1);
        failures.fetch("active", callback); check("failure not cached", work.tasks.size() == 1);
        status[0] = 200; work.drain(); delivery.drain(); check("parse failure reported", errors[0] == 2);
        status[0] = 404; failures.fetch("active", callback); work.drain(); delivery.drain();
        check("404 is empty success", errors[0] == 2 && values.get(values.size() - 1).isEmpty());
        failures.fetch("active", callback); check("404 is cached", work.tasks.isEmpty()); delivery.drain();
        int before = requests[0]; failures.fetch("", callback); delivery.drain();
        check("bad ID never reaches network", requests[0] == before && errors[0] == 3);
        SponsorClient offline = new SponsorClient(work, delivery, uri -> { throw new IOException("offline"); });
        offline.fetch("active", callback); work.drain(); delivery.drain(); check("transport exception reported", errors[0] == 4);
        offline.fetch("active", callback); check("transport failure removed from pending", work.tasks.size() == 1); work.drain(); delivery.drain();
        SponsorClient rejected = new SponsorClient(task -> { throw new RejectedExecutionException(); }, delivery, uri -> { throw new AssertionError("must not run"); });
        rejected.fetch("active", callback); delivery.drain(); check("full worker queue fails open", errors[0] == 6);

        int[] misses = {0};
        SponsorClient lru = new SponsorClient(Runnable::run, Runnable::run, uri -> { misses[0]++; return new SponsorClient.Response(404, ""); });
        for (int i = 0; i < 129; i++) lru.fetch("video-" + i, (segments, error) -> {});
        check("one request per distinct video", misses[0] == 129);
        lru.fetch("video-1", (segments, error) -> {}); check("recent entry cached", misses[0] == 129);
        lru.fetch("video-0", (segments, error) -> {}); check("oldest entry evicted after 128", misses[0] == 130);
    }

    public static void main(String[] args) throws Exception {
        parsingAndRequest(); sessions(); markers(); networking();
        System.out.println("PASS SponsorBlock policy: " + checks + " checks");
    }
}
