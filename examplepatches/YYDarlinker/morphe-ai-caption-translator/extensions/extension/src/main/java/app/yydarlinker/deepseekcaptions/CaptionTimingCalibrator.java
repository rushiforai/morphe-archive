package app.yydarlinker.deepseekcaptions;

import org.json.JSONArray;
import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Calibrates a high-quality provider caption track against YouTube's synchronized source-language ASR track.
 *
 * <p>The provider track remains the only text/semantic source. ASR is used only as a clock reference.
 * Whether correction is applied is decided here from real matching text anchors; no upstream
 * broadcast/roll-up classifier is allowed to suppress the comparison.</p>
 */
final class CaptionTimingCalibrator {
    private static final int NGRAM = 4;
    private static final int MIN_ANCHORS = 6;
    private static final long MIN_CORRECTION_MS = 450L;
    private static final long MAX_CORRECTION_MS = 8_000L;
    private static final long MAX_RAW_DELTA_MS = 12_000L;

    private CaptionTimingCalibrator() {}

    static Calibration compare(
            CaptionDocument.Parsed provider,
            CaptionDocument.Parsed asr
    ) {
        if (provider == null || asr == null) return Calibration.skip("字幕轨为空");

        List<TimedToken> providerTokens = progressionTokens(provider.cues());
        List<TimedToken> asrTokens = progressionTokens(asr.cues());
        if (providerTokens.size() < 24 || asrTokens.size() < 24) {
            return Calibration.skip("可比较词数不足");
        }

        Map<String, Integer> uniqueAsr = uniqueNgrams(asrTokens);
        List<Long> deltas = new ArrayList<>();
        int lastAsr = -1;
        int lastProvider = -NGRAM;

        for (int i = 0; i + NGRAM <= providerTokens.size(); i++) {
            if (i - lastProvider < NGRAM) continue;
            String key = ngramKey(providerTokens, i);
            Integer asrIndex = uniqueAsr.get(key);
            if (asrIndex == null || asrIndex < 0) continue;
            if (asrIndex <= lastAsr) continue;

            long providerMid = providerTokens.get(i + NGRAM / 2).midMs;
            long asrMid = asrTokens.get(asrIndex + NGRAM / 2).midMs;
            long delta = providerMid - asrMid;
            if (Math.abs(delta) > MAX_RAW_DELTA_MS) continue;

            deltas.add(delta);
            lastProvider = i;
            lastAsr = asrIndex;
        }

        if (deltas.size() < MIN_ANCHORS) {
            long center = deltas.isEmpty() ? 0L : median(deltas);
            long mad = deltas.isEmpty() ? 0L : medianAbsoluteDeviation(deltas, center);
            return Calibration.skip(
                    "文本时间锚匹配不足：" + deltas.size(),
                    center,
                    deltas.size(),
                    mad
            );
        }

        long initialMedian = median(deltas);
        long initialMad = medianAbsoluteDeviation(deltas, initialMedian);
        long outlierRadius = Math.max(900L, Math.max(initialMad * 4L, Math.abs(initialMedian) / 2L));

        List<Long> filtered = new ArrayList<>();
        for (long value : deltas) {
            if (Math.abs(value - initialMedian) <= outlierRadius) filtered.add(value);
        }
        if (filtered.size() < MIN_ANCHORS) {
            return Calibration.skip(
                    "稳定时间锚不足：" + filtered.size(),
                    initialMedian,
                    filtered.size(),
                    initialMad
            );
        }

        long offset = median(filtered);
        long mad = medianAbsoluteDeviation(filtered, offset);
        long allowedMad = Math.max(650L, Math.min(1_500L, Math.max(1L, Math.abs(offset)) / 2L));

        if (Math.abs(offset) > MAX_CORRECTION_MS) {
            return Calibration.skip(
                    "检测到异常大时间差：" + offset + " ms",
                    offset,
                    filtered.size(),
                    mad
            );
        }
        if (mad > allowedMad) {
            return Calibration.skip(
                    "时间差并非稳定延迟：MAD " + mad + " ms",
                    offset,
                    filtered.size(),
                    mad
            );
        }

        if (Math.abs(offset) < MIN_CORRECTION_MS) {
            return Calibration.synced(offset, filtered.size(), mad);
        }
        if(Math.abs(offset)<Math.max(MIN_CORRECTION_MS,3L*mad))
            return Calibration.skip("校时偏移未显著超过锚点离散度，保留原时间",offset,filtered.size(),mad);
        return Calibration.apply(offset, filtered.size(), mad);
    }

    /**
     * Shift JSON3 event starts while preserving all provider text and segment offsets.
     * Returns null when the source is not JSON3 so callers can use {@link #shiftDocument} instead.
     */
    static byte[] shiftJson3(byte[] body, long offsetMs) {
        if (body == null || body.length == 0 || offsetMs == 0L) return null;
        try {
            String raw = new String(body, StandardCharsets.UTF_8).trim();
            if (!raw.startsWith("{") || !raw.contains("\"events\"")) return null;
            JSONObject root = new JSONObject(raw);
            JSONArray events = root.optJSONArray("events");
            if (events == null) return null;
            for (int i = 0; i < events.length(); i++) {
                JSONObject event = events.optJSONObject(i);
                if (event == null || !event.has("tStartMs")) continue;
                long start = event.optLong("tStartMs", -1L);
                if (start >= 0L) event.put("tStartMs", Math.max(0L, start - offsetMs));
            }
            return root.toString().getBytes(StandardCharsets.UTF_8);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Shift only the exposed cue clock for XML/VTT/SRT inputs; text/rendering remain delegated. */
    static CaptionDocument.Parsed shiftDocument(
            CaptionDocument.Parsed source,
            long offsetMs
    ) {
        if (source == null || offsetMs == 0L) return source;
        List<CaptionDocument.Cue> shifted = new ArrayList<>();
        for (CaptionDocument.Cue cue : source.cues()) {
            long start = Math.max(0L, cue.startMs - offsetMs);
            long end = Math.max(start + 1L, cue.endMs - offsetMs);
            shifted.add(new CaptionDocument.Cue(start, end, cue.text));
        }
        final List<CaptionDocument.Cue> immutable = Collections.unmodifiableList(shifted);
        return new CaptionDocument.Parsed() {
            @Override public List<String> texts() { return source.texts(); }
            @Override public List<CaptionDocument.Cue> cues() { return immutable; }
            @Override public byte[] render(List<String> translated) throws Exception {
                return source.render(translated);
            }
            @Override public String contentType() { return source.contentType(); }
        };
    }

    private static Map<String, Integer> uniqueNgrams(List<TimedToken> tokens) {
        Map<String, Integer> map = new HashMap<>();
        for (int i = 0; i + NGRAM <= tokens.size(); i++) {
            String key = ngramKey(tokens, i);
            Integer previous = map.putIfAbsent(key, i);
            if (previous != null) map.put(key, -1);
        }
        return map;
    }

    private static String ngramKey(List<TimedToken> tokens, int from) {
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < NGRAM; i++) {
            if (i > 0) out.append('\u001F');
            out.append(tokens.get(from + i).word);
        }
        return out.toString();
    }

    /**
     * Flatten caption progression while removing obvious roll-up repetition. Timing is interpolated
     * only inside each cue for matching purposes; these token timestamps never become output timing.
     */
    private static List<TimedToken> progressionTokens(List<CaptionDocument.Cue> cues) {
        List<TimedToken> out = new ArrayList<>();
        List<String> previous = Collections.emptyList();
        for (CaptionDocument.Cue cue : cues) {
            List<String> current = words(cue.text);
            if (current.isEmpty()) {
                previous = Collections.emptyList();
                continue;
            }

            int novelFrom = 0;
            if (!previous.isEmpty()) {
                if (contains(previous, current)) {
                    novelFrom = current.size();
                } else {
                    int overlap = suffixPrefixOverlap(previous, current);
                    int smaller = Math.min(previous.size(), current.size());
                    if (overlap >= 2 && (overlap * 2 >= smaller || current.size() - overlap <= 4)) {
                        novelFrom = overlap;
                    }
                }
            }

            long duration = Math.max(1L, cue.endMs - cue.startMs);
            int count = current.size();
            for (int i = novelFrom; i < count; i++) {
                long start = cue.startMs + Math.round(duration * (i / (double) count));
                long end = cue.startMs + Math.round(duration * ((i + 1d) / count));
                out.add(new TimedToken(current.get(i), (start + Math.max(start + 1L, end)) / 2L));
            }
            previous = current;
        }
        return out;
    }

    private static List<String> words(String text) {return TimingTokens.words(text);}

    private static int suffixPrefixOverlap(List<String> previous, List<String> current) {
        int max = Math.min(previous.size(), current.size());
        for (int size = max; size >= 1; size--) {
            boolean same = true;
            int start = previous.size() - size;
            for (int i = 0; i < size; i++) {
                if (!previous.get(start + i).equals(current.get(i))) {
                    same = false;
                    break;
                }
            }
            if (same) return size;
        }
        return 0;
    }

    private static boolean contains(List<String> haystack, List<String> needle) {
        if (needle.isEmpty() || haystack.size() < needle.size()) return false;
        for (int i = 0; i + needle.size() <= haystack.size(); i++) {
            boolean same = true;
            for (int j = 0; j < needle.size(); j++) {
                if (!haystack.get(i + j).equals(needle.get(j))) {
                    same = false;
                    break;
                }
            }
            if (same) return true;
        }
        return false;
    }

    private static long median(List<Long> values) {
        List<Long> sorted = new ArrayList<>(values);
        Collections.sort(sorted);
        int middle = sorted.size() / 2;
        if ((sorted.size() & 1) == 1) return sorted.get(middle);
        return Math.round((sorted.get(middle - 1) + sorted.get(middle)) / 2d);
    }

    private static long medianAbsoluteDeviation(List<Long> values, long center) {
        List<Long> deviations = new ArrayList<>(values.size());
        for (long value : values) deviations.add(Math.abs(value - center));
        return median(deviations);
    }

    static final class Calibration {
        final boolean apply;
        final boolean alreadySynced;
        final long offsetMs;
        final int anchors;
        final long madMs;
        final String reason;

        private Calibration(
                boolean apply,
                boolean alreadySynced,
                long offsetMs,
                int anchors,
                long madMs,
                String reason
        ) {
            this.apply = apply;
            this.alreadySynced = alreadySynced;
            this.offsetMs = offsetMs;
            this.anchors = anchors;
            this.madMs = madMs;
            this.reason = reason == null ? "" : reason;
        }

        static Calibration apply(long offsetMs, int anchors, long madMs) {
            return new Calibration(true, false, offsetMs, anchors, madMs, "");
        }

        static Calibration synced(long offsetMs, int anchors, long madMs) {
            return new Calibration(false, true, offsetMs, anchors, madMs, "");
        }

        static Calibration skip(String reason) {
            return new Calibration(false, false, 0L, 0, 0L, reason);
        }

        static Calibration skip(String reason, long offsetMs, int anchors, long madMs) {
            return new Calibration(false, false, offsetMs, anchors, madMs, reason);
        }

        String diagnostic() {
            if (apply) {
                return "匹配 " + anchors + " 个稳定文本锚；原轨相对 ASR 中位滞后 " +
                        offsetMs + " ms，MAD " + madMs + " ms；将执行校时";
            }
            if (alreadySynced) {
                return "匹配 " + anchors + " 个稳定文本锚；中位差 " + offsetMs +
                        " ms，MAD " + madMs + " ms；时间已基本一致";
            }
            String detail = reason == null || reason.isEmpty() ? "校时条件不成立" : reason;
            if (anchors > 0) {
                detail += "；锚点 " + anchors + "，中位差 " + offsetMs +
                        " ms，MAD " + madMs + " ms";
            }
            return detail;
        }
    }

    private static final class TimedToken {
        final String word;
        final long midMs;

        TimedToken(String word, long midMs) {
            this.word = word;
            this.midMs = midMs;
        }
    }
}
