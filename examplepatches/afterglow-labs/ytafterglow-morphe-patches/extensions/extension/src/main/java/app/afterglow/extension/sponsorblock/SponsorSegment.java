package app.afterglow.extension.sponsorblock;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import app.afterglow.extension.settings.ThemeJson;

/** Immutable seconds-based API data. Only well-formed skip segments for the requested video survive. */
public final class SponsorSegment {
    public static final Comparator<SponsorSegment> ORDER = Comparator
            .comparingDouble((SponsorSegment s) -> s.start)
            .thenComparingDouble(s -> s.end).thenComparing(s -> s.uuid);
    public final double start, end;
    public final SponsorCategory category;
    public final String uuid;

    public SponsorSegment(double start, double end, SponsorCategory category, String uuid) {
        if (!Double.isFinite(start) || !Double.isFinite(end) || start < 0 || end <= start
                || end > Long.MAX_VALUE / 1000.0 || category == null || uuid == null || uuid.isEmpty())
            throw new IllegalArgumentException("Invalid SponsorBlock segment");
        this.start = start; this.end = end; this.category = category; this.uuid = uuid;
    }

    public static List<SponsorSegment> parse(String json, String videoId) {
        // Reuse the bounded JSON codec: no Android parser dependency in network policy tests.
        Object payload = ThemeJson.parse(json);
        if (!(payload instanceof List)) throw new IllegalArgumentException("Invalid SponsorBlock response");
        List<SponsorSegment> result = new ArrayList<>();
        for (Object entry : (List<?>) payload) {
            if (!(entry instanceof Map)) continue;
            Map<?, ?> video = (Map<?, ?>) entry;
            if (!videoId.equals(video.get("videoID"))) continue;
            Object rows = video.get("segments");
            if (!(rows instanceof List)) break;
            if (((List<?>) rows).size() > 4096) throw new IllegalArgumentException("Too many SponsorBlock segments");
            for (Object row : (List<?>) rows) {
                if (!(row instanceof Map)) continue;
                Map<?, ?> data = (Map<?, ?>) row;
                Object bounds = data.get("segment"), uuid = data.get("UUID");
                SponsorCategory category = SponsorCategory.fromId(data.get("category"));
                if (!"skip".equals(data.get("actionType")) || category == null
                        || !(uuid instanceof String) || ((String) uuid).isEmpty()
                        || !(bounds instanceof List) || ((List<?>) bounds).size() != 2) continue;
                Object start = ((List<?>) bounds).get(0), end = ((List<?>) bounds).get(1);
                if (!(start instanceof Number) || !(end instanceof Number)) continue;
                try {
                    result.add(new SponsorSegment(((Number) start).doubleValue(), ((Number) end).doubleValue(), category, (String) uuid));
                } catch (IllegalArgumentException ignored) { /* A bad row does not discard other valid segments. */ }
            }
            break;
        }
        result.sort(ORDER);
        return Collections.unmodifiableList(result);
    }
}
