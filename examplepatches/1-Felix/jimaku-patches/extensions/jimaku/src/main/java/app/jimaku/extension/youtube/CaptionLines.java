package app.jimaku.extension.youtube;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.util.ArrayList;
import java.util.List;

import app.jimaku.extension.subtitles.Line;

/** An uploaded track's captions as lines to show, as the extension's {@code captionLines}. */
public final class CaptionLines {
    private CaptionLines() {
    }

    /**
     * Each event of a {@code {title, events}} or json3 body is one whole caption with its start and
     * length, its line breaks kept. Events with no words, as a break YouTube sends on its own, are
     * left out, and a caption without a length lasts until the next.
     */
    public static List<Line> of(String body) throws JSONException {
        Object parsed = new JSONTokener(body).nextValue();
        JSONArray events = parsed instanceof JSONObject ? ((JSONObject) parsed).optJSONArray("events") : null;
        List<double[]> times = new ArrayList<>();
        List<String> texts = new ArrayList<>();
        for (int i = 0; events != null && i < events.length(); i++) {
            JSONObject event = events.optJSONObject(i);
            if (event == null) continue;
            Object start = event.opt("tStartMs");
            Object length = event.opt("dDurationMs");
            JSONArray segs = event.optJSONArray("segs");
            StringBuilder text = new StringBuilder();
            for (int j = 0; segs != null && j < segs.length(); j++) {
                JSONObject seg = segs.optJSONObject(j);
                Object part = seg != null ? seg.opt("utf8") : null;
                if (part instanceof String) text.append((String) part);
            }
            String words = text.toString().strip();
            if (!(start instanceof Number) || words.isEmpty()) continue;
            times.add(new double[]{((Number) start).doubleValue(), length instanceof Number ? ((Number) length).doubleValue() : Double.NaN});
            texts.add(words);
        }
        // Worked out in milliseconds, as YouTube gives them, so a start and a length add up exactly.
        List<Line> lines = new ArrayList<>(times.size());
        for (int i = 0; i < times.size(); i++) {
            double start = times.get(i)[0], length = times.get(i)[1];
            double end = !Double.isNaN(length) ? start + length : i + 1 < times.size() ? times.get(i + 1)[0] : start + 4000;
            lines.add(new Line(start / 1000, end / 1000, texts.get(i)));
        }
        return lines;
    }
}
