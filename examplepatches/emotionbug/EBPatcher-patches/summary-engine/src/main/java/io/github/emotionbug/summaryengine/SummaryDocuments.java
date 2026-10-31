package io.github.emotionbug.summaryengine;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

/** Plain display data, never native database IDs or instructions to the dialer. */
final class SummaryDocuments {
    private static final int MAX_TEXT = 1_000_000;
    private static final int MAX_DOCUMENT = 2_000_000;
    // Only recognizable domestic telephone groupings ignore separators. Decimal
    // points and signs carry numeric meaning and must never be erased.
    private static final Pattern NUMBERS = Pattern.compile(
            "(?<![0-9.])((?:0[0-9]{1,2}[- ][0-9]{3,4}[- ][0-9]{4}|0[0-9]{8,10}|1[0-9]{3}[- ][0-9]{4}))(?![0-9.])"
            + "|([+\\-−]?(?:[0-9]{1,3}(?:,[0-9]{3})+|[0-9]+)(?:\\.[0-9]+)?)");
    private SummaryDocuments() {}

    static JSONObject parse(String encoded) throws Exception {
        if (encoded == null || encoded.trim().isEmpty()) return empty();
        if (encoded.length() > MAX_DOCUMENT) throw new IOException("Summary document exceeds the supported size");
        return normalize(new JSONObject(encoded));
    }

    static JSONObject empty() throws Exception {
        return new JSONObject().put("title", "").put("summary", "").put("segments", new JSONArray());
    }

    static JSONObject normalize(JSONObject input) throws Exception {
        String title = string(input, "title", 1000), summary = string(input, "summary", 65536);
        JSONArray source = input.optJSONArray("segments");
        if (input.has("segments") && source == null) throw new IOException("Invalid transcript segments");
        JSONArray segments = new JSONArray();
        int characters = 0;
        if (source != null) {
            if (source.length() > 50000) throw new IOException("Too many transcript segments");
            for (int i = 0; i < source.length(); i++) {
                JSONObject segment = source.getJSONObject(i);
                String text = string(segment, "text", MAX_TEXT);
                if (text.trim().isEmpty()) continue;
                characters = Math.addExact(characters, text.length());
                if (characters > MAX_TEXT) throw new IOException("Complete transcript exceeds the supported size");
                Long start = time(segment, "startMs"), end = time(segment, "endMs");
                if (start != null && end != null && end < start) throw new IOException("Invalid transcript time range");
                segments.put(new JSONObject().put("text", text).put("speaker", string(segment, "speaker", 100))
                        .put("startMs", start == null ? JSONObject.NULL : start)
                        .put("endMs", end == null ? JSONObject.NULL : end));
            }
        }
        JSONObject result = new JSONObject().put("title", title).put("summary", summary).put("segments", segments);
        if (result.toString().length() > MAX_DOCUMENT)
            throw new IOException("Summary document exceeds the supported size");
        return result;
    }

    private static String string(JSONObject object, String key, int maximum) throws Exception {
        if (!object.has(key) || object.isNull(key)) return "";
        Object value = object.get(key);
        if (!(value instanceof String) || ((String) value).length() > maximum)
            throw new IOException("Invalid or oversized summary field: " + key);
        return ((String) value).trim();
    }

    private static Long time(JSONObject object, String key) throws Exception {
        if (!object.has(key) || object.isNull(key)) return null;
        Object value = object.get(key);
        if (!(value instanceof Number)) throw new IOException("Invalid transcript timestamp");
        Number number = (Number) value;
        long time = number.longValue();
        if (time < 0 || number.doubleValue() != (double) time)
            throw new IOException("Invalid transcript timestamp");
        return time;
    }

    static boolean usable(JSONObject document) {
        return !document.optString("summary").trim().isEmpty() || document.optJSONArray("segments").length() != 0;
    }

    static String transcript(JSONObject document, boolean labels) throws Exception {
        StringBuilder result = new StringBuilder();
        JSONArray segments = document.getJSONArray("segments");
        for (int i = 0; i < segments.length(); i++) {
            JSONObject segment = segments.getJSONObject(i);
            if (result.length() != 0) result.append('\n');
            if (labels) {
                if (!segment.isNull("startMs")) result.append('[').append(segment.getLong("startMs") / 1000).append("s]");
                String speaker = segment.getString("speaker");
                if (!speaker.isEmpty()) result.append('[').append(speaker).append("] ");
            }
            result.append(segment.getString("text"));
        }
        return result.toString();
    }

    static JSONObject comparison(JSONObject api, JSONObject local) throws Exception {
        return new JSONObject().put("api_summary", api.getString("summary")).put("api_transcript", transcript(api, false))
                .put("local_summary", local.getString("summary")).put("local_transcript", transcript(local, false))
                .put("reduced", false);
    }

    static void validateGenerated(JSONObject generated) throws Exception {
        if (!meaningful(string(generated, "title", 120)) || !meaningful(string(generated, "summary", 2000))
                || !(generated.opt("uncertain") instanceof Boolean))
            throw new IOException("Model did not produce a meaningful structured summary");
    }

    private static boolean meaningful(String text) {
        for (int i = 0; i < text.length();) {
            int code = text.codePointAt(i);
            if (Character.isLetterOrDigit(code)) return true;
            i += Character.charCount(code);
        }
        return false;
    }

    static JSONObject decide(JSONObject api, JSONObject local, JSONObject review) throws Exception {
        String localText = transcript(local, false), apiText = transcript(api, false);
        String apiEvidence = apiText.isEmpty() ? api.getString("summary") : apiText;
        Set<String> localNumbers = numbers(localText), apiNumbers = numbers(apiEvidence);
        if (!localNumbers.containsAll(numbers(local.getString("title") + "\n" + local.getString("summary"))))
            return selection("uncertain", "Local summary contains numbers not supported by its transcript. Review the recording.");
        if (!usable(api)) return selection("local", "Only a local result is available; it has not been independently confirmed.");
        if (!localText.isEmpty() && !apiEvidence.isEmpty() && !localNumbers.equals(apiNumbers))
            return selection("uncertain", "API and local evidence disagree on numbers. Original API retained; review the recording.");
        if (review == null) return selection("uncertain", "No supported comparison is available. Original API retained.");
        String choice = review.optString("choice");
        Object conflict = review.opt("conflict");
        if (!(conflict instanceof Boolean) || (Boolean) conflict)
            return selection("uncertain", "The comparison found conflicting or uncertain evidence. Original API retained.");
        if (!("api".equals(choice) || "local".equals(choice)))
            return selection("uncertain", "Neither candidate was clearly preferred. Original API retained.");
        String reason = string(review, "reason", 1000);
        String apiQuote = string(review, "apiQuote", 1000), localQuote = string(review, "localQuote", 1000);
        // A fluent model verdict alone is not evidence. Require exact quotes from both
        // transcripts (or the actual API summary if no API transcript was supplied).
        if (!meaningful(reason) || !meaningful(apiQuote) || !meaningful(localQuote)
                || !apiEvidence.contains(apiQuote) || !localText.contains(localQuote))
            return selection("uncertain", "Comparison citations could not be matched to both sources. Original API retained.");
        if ("api".equals(choice) && !apiText.isEmpty()
                && !apiNumbers.containsAll(numbers(api.getString("summary"))))
            return selection("uncertain", "API summary contains numbers absent from its transcript. Review both candidates.");
        return selection(choice, "AI comparison: " + reason);
    }

    private static Set<String> numbers(String text) {
        Set<String> result = new LinkedHashSet<>();
        Matcher matcher = NUMBERS.matcher(text);
        while (matcher.find()) {
            String value = matcher.group(1) != null ? matcher.group(1).replace("-", "").replace(" ", "")
                    : new BigDecimal(matcher.group(2).replace(",", "").replace('−', '-'))
                            .stripTrailingZeros().toPlainString();
            result.add(value);
        }
        return result;
    }

    private static JSONObject selection(String source, String reason) throws Exception {
        return new JSONObject().put("source", source).put("reason", reason);
    }
}
