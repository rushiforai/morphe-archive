package app.yydarlinker.aicaptions;

import java.util.ArrayList;
import java.util.List;
import java.util.NavigableMap;
import java.util.TreeMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Runs recorded provider exchanges against their captured source tokens and playback clock. */
public final class TranslationCaptureReplay {
    private final RebuildSource source;
    private final CaptionLanguageContext language;
    private final NavigableMap<Integer, Block> blocks = new TreeMap<>();
    private final RebuildDisplayGroups.Cursor cursor = new RebuildDisplayGroups.Cursor();
    private final int lineUnits;

    /**
     * Exact captured token timestamps take precedence over the optional full source track.
     * The full track supplies context outside the recorded requests.
     */
    public TranslationCaptureReplay(byte[] track, String format, List<JSONObject> requests,
            String sourceLanguage, String targetLanguage, int lineUnits) throws Exception {
        this.lineUnits = lineUnits;
        language = CaptionLanguageContext.explicit(sourceLanguage, targetLanguage);
        RebuildSource imported = track == null ? null : RebuildSource.read(track, CaptionDocument.parse(track, format));
        if (imported != null && requests.isEmpty()) {
            source = imported;
            return;
        }
        List<RebuildSource.Word> words = imported == null ? new ArrayList<>() : new ArrayList<>(imported.words);
        for (JSONObject request : requests) {
            JSONArray tokens = request.getJSONArray("owned_tokens");
            JSONArray times = request.getJSONArray("diagnostic_only_source_times");
            for (int i = 0; i < tokens.length(); i++) {
                JSONArray token = tokens.getJSONArray(i), time = times.getJSONArray(i);
                int id = token.getInt(0);
                String text = token.getString(1);
                if (id != time.getInt(0)) throw new JSONException("Timing for wrong token " + id);
                while (words.size() <= id) words.add(null);
                RebuildSource.Word prior = words.get(id);
                if (prior != null && !prior.text.equals(text)) throw new JSONException("Source text for token " + id);
                words.set(id, new RebuildSource.Word(text, time.getLong(1), time.getLong(2), time.getInt(3),
                        RebuildSource.Precision.valueOf(time.optString(4, "ESTIMATED"))));
            }
        }
        if (words.contains(null)) throw new JSONException("Missing source tokens between captured requests");
        source = new RebuildSource(words);
    }

    /** Source token timings in capture format, without protocol or planner types. */
    public JSONArray sourceTokens() throws JSONException {
        JSONArray tokens = new JSONArray();
        for (RebuildSource.Word word : source.words) {
            tokens.put(new JSONArray().put(word.text).put(word.start).put(word.end)
                    .put(word.cue).put(word.precision.name()));
        }
        return tokens;
    }

    /** Complete request bodies ready for the provider, without opening an HTTP connection. */
    public List<String> requests(String sourceLanguage, String targetLanguage) throws Exception {
        CaptionLanguageContext context = CaptionLanguageContext.explicit(sourceLanguage, targetLanguage);
        List<String> bodies = new ArrayList<>();
        for (RebuildPlanner.Block block : RebuildPlanner.plan(source, context)) {
            bodies.add(RebuildProtocol.payload(source, block, targetLanguage, "", context).toString());
        }
        return bodies;
    }


    /** Accepts the recorded response as a provider result. Legacy captures used optional quotes. */
    public String receive(JSONObject request, String response, boolean requireQuotes) throws Exception {
        String[] parts = request.getString("block").substring(1).split("_");
        int index = Integer.parseInt(parts[0]);
        RebuildPlanner.Block block = new RebuildPlanner.Block(index, Integer.parseInt(parts[1]),
                Integer.parseInt(parts[2]), source);
        RebuildProtocol.Plan accepted;
        try {
            accepted = requireQuotes ? RebuildProtocol.parseBound(response, source, block, language)
                    : RebuildProtocol.parse(response, source, block);
        } catch (RebuildProtocol.Invalid rejected) {
            return rejected.code;
        }
        Block display = blocks.computeIfAbsent(index, ignored -> new Block(block));
        if (cursor.shownIn(index)) display.pending = accepted;
        else display.plan = accepted;
        return "";
    }

    /** Page from the captured exchange at this playback position, if it covers the position. */
    public Page at(long position) {
        for (Block block : blocks.descendingMap().values()) {
            RebuildPlanner.Block span = block.span;
            if (position < span.start || position >= span.end) continue;
            if (cursor.canAdopt(span.index, block.pending, position)) {
                block.plan = block.pending;
                block.pending = null;
            }
            List<RebuildDisplayGroups.Unit> pages = RebuildDisplayGroups.partition(
                    span.index, block.plan.events, source, language,
                    text -> language.renderSpec.lineUnits(text) <= lineUnits, null);
            RebuildDisplayGroups.Unit page = cursor.select(span.index, block.plan.events, pages, position);
            if (page == null || page.blocked || page.text.isEmpty()) return null;
            cursor.shown(page);
            return new Page(page.id(), page.start, page.end, page.text);
        }
        return null;
    }

    private static final class Block {
        final RebuildPlanner.Block span;
        RebuildProtocol.Plan plan, pending;

        Block(RebuildPlanner.Block span) { this.span = span; }
    }

    public static final class Page {
        public final String id, text;
        public final long start, end;

        Page(String id, long start, long end, String text) {
            this.id = id;
            this.start = start;
            this.end = end;
            this.text = text;
        }
    }
}

