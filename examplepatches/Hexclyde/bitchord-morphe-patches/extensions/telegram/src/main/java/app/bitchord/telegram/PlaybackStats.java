package app.bitchord.telegram;

import com.music.bitchord.data.NerdStats.Snapshot;
import com.music.bitchord.data.TelemetryProvenance;

import kotlin.Pair;
import kotlin.jvm.functions.Function0;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/** Extends the host's existing, track-scoped telemetry; performs no I/O in Compose. */
public final class PlaybackStats {
    private PlaybackStats() {}

    // R8 removed the provenance field, although the host still supplies its constructor
    // argument. Keep it by snapshot identity, never by a loose "last source" value.
    private static final Map<Snapshot, TelemetryProvenance> provenance =
            Collections.synchronizedMap(new WeakHashMap<Snapshot, TelemetryProvenance>());

    public static void capture(Snapshot snapshot, TelemetryProvenance origin) {
        if (snapshot == null) return;
        synchronized (provenance) {
            if (provenance.size() >= 64) provenance.clear();
            provenance.put(snapshot, origin == null ? TelemetryProvenance.UNKNOWN : origin);
        }
    }

    /**
     * Reuses the host's rendition-keyed asynchronous size/duration measurement. Never falls through
     * to an older YouTube bitrate after a lossless upgrade.
     */
    public static Pair<Integer, TelemetryProvenance> measureLossless(Function0<?> measure) {
        if (measure == null) return null;
        Object value = measure.invoke();
        if (!(value instanceof Integer) || ((Integer) value) <= 0) return null;
        return new Pair<>((Integer) value, TelemetryProvenance.MEASURED);
    }

    public static String decorate(String original, Snapshot snapshot) {
        if (snapshot == null) return original;
        StringBuilder format = new StringBuilder();
        if (original != null)
            for (String part : original.split(" · ")) {
                // Bitrate moves to the source line. Retain the host's localized format labels.
                if (part.matches("[0-9]+ kbps")) continue;
                if (!part.isEmpty()) {
                    if (format.length() > 0) format.append(" · ");
                    format.append(part);
                }
            }
        String source = sourceLabel(snapshot.sourceName);
        String rate =
                bitrateLabel(snapshot.bitrateKbps, snapshot.mimeType, provenance.get(snapshot));
        return (format.length() == 0 ? "" : format + "\n") + source + " · " + rate;
    }

    static String sourceLabel(String source) {
        if (source == null) return "Unknown source";
        // Addon display names may contain arbitrary whitespace; keep exactly two lines.
        String clean = source.replaceAll("[\\p{Cc}\\p{Cf}\\s]+", " ").trim();
        if (clean.isEmpty()) return "Unknown source";
        int length = clean.codePointCount(0, clean.length());
        return length > 40 ? clean.substring(0, clean.offsetByCodePoints(0, 39)) + "…" : clean;
    }

    static String bitrateLabel(Integer kbps, String mime, TelemetryProvenance origin) {
        if (kbps == null || kbps <= 0) return "Bitrate unavailable";
        boolean pcm =
                "audio/raw".equals(mime) || "audio/wav".equals(mime) || "audio/x-wav".equals(mime);
        if (pcm) return kbps + " kbps PCM";
        if (origin == TelemetryProvenance.MEASURED) return "≈" + kbps + " kbps avg";
        if (origin == TelemetryProvenance.DERIVED) return "≈" + kbps + " kbps estimated";
        return kbps + " kbps";
    }
}
