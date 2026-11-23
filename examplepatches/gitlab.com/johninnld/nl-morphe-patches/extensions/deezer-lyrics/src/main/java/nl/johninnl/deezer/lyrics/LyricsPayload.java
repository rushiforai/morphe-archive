package nl.johninnl.deezer.lyrics;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Provider-neutral, line-synchronized milliseconds. Neither LRC nor YAML is a Deezer DTO. */
public final class LyricsPayload {
    private static final int MAX_TEXT = 131072;
    private static final Pattern STAMP = Pattern.compile("\\[(\\d{1,3}):(\\d{2})(?:[.:](\\d{1,3}))?\\]");
    private static final Pattern META = Pattern.compile("^\\[[A-Za-z][A-Za-z0-9_-]*:.*\\]$");
    private static final Pattern OFFSET = Pattern.compile("^\\[offset:([+-]?\\d+)\\]$", Pattern.CASE_INSENSITIVE);
    private static final Pattern WORD_STAMP = Pattern.compile("<\\d{1,3}:\\d{2}(?:[.:]\\d{1,3})?>");
    public final long recordId;
    public final String plainText;
    public final List<Line> lines;

    public static final class Line {
        public final String text;
        public final int startMs, endMs;
        Line(String text, int startMs, int endMs) { this.text = text; this.startMs = startMs; this.endMs = endMs; }
    }

    private LyricsPayload(long id, String plain, List<Line> lines) {
        this.recordId = id;
        this.plainText = plain;
        this.lines = Collections.unmodifiableList(new ArrayList<>(lines));
    }

    public boolean synchronizedLines() { return !lines.isEmpty(); }
    public String providerIdentity() { return "lrclib:" + recordId; }
    public String attribution() { return "Lyrics from LRCLIB · lrclib.net"; }

    static LyricsPayload normalize(long id, boolean instrumental, String plain, String synced, double durationSeconds) {
        if (id <= 0 || instrumental || !Double.isFinite(durationSeconds) || durationSeconds < 1 || durationSeconds > 3600)
            return null;
        if ((plain != null && plain.length() > MAX_TEXT) || (synced != null && synced.length() > MAX_TEXT)) return null;
        String text = cleanPlain(plain);
        List<Line> lines = timed(synced, (int) Math.round(durationSeconds * 1000));
        if (text.isEmpty()) {
            if (!lines.isEmpty()) {
                StringBuilder b = new StringBuilder();
                for (Line line : lines) { if (b.length() > 0) b.append('\n'); b.append(line.text); }
                text = b.toString().trim();
            } else text = cleanPlain(synced);
        }
        if (text.isEmpty()) return null;
        return new LyricsPayload(id, text, lines);
    }

    private static String normalizedNewlines(String value) {
        return value == null ? "" : value.replace("\ufeff", "").replace("\r\n", "\n").replace('\r', '\n');
    }

    static String cleanPlain(String value) {
        StringBuilder out = new StringBuilder();
        for (String raw : normalizedNewlines(value).split("\n", -1)) {
            String line = raw.trim();
            if (META.matcher(line).matches()) continue;
            Matcher matcher = STAMP.matcher(line);
            int end = 0;
            while (matcher.find(end) && matcher.start() == end) end = matcher.end();
            line = WORD_STAMP.matcher(line.substring(end)).replaceAll("").trim();
            // A malformed timestamp is not lyric text and must not appear in the UI.
            if (line.matches("^\\[\\d.*")) continue;
            if (out.length() > 0) out.append('\n');
            out.append(line);
        }
        return out.toString().trim();
    }

    private static List<Line> timed(String value, int durationMs) {
        ArrayList<Line> rawLines = new ArrayList<>();
        boolean nonempty = false;
        for (String raw : normalizedNewlines(value).split("\n", -1)) {
            String line = raw.trim();
            if (line.isEmpty()) continue;
            Matcher offset = OFFSET.matcher(line);
            if (offset.matches()) {
                // API timestamps are canonicalized by LRCLIB. Nonzero legacy offsets have no
                // reliable coordinate convention here; retain plain text rather than mis-time it.
                try { if (Long.parseLong(offset.group(1)) != 0) return Collections.emptyList(); }
                catch (NumberFormatException malformed) { return Collections.emptyList(); }
                continue;
            }
            if (META.matcher(line).matches()) continue;
            Matcher matcher = STAMP.matcher(line);
            ArrayList<Integer> starts = new ArrayList<>();
            int end = 0;
            while (matcher.find(end) && matcher.start() == end) {
                int minutes = Integer.parseInt(matcher.group(1)), seconds = Integer.parseInt(matcher.group(2));
                String fraction = matcher.group(3);
                if (seconds >= 60) return Collections.emptyList();
                int ms = fraction == null ? 0 : Integer.parseInt((fraction + "000").substring(0, 3));
                int start = (minutes * 60 + seconds) * 1000 + ms;
                if (start > durationMs + 2000) return Collections.emptyList();
                starts.add(Math.min(start, durationMs));
                end = matcher.end();
            }
            if (starts.isEmpty()) return Collections.emptyList();
            String text = WORD_STAMP.matcher(line.substring(end)).replaceAll("").trim();
            if (text.startsWith("[")) return Collections.emptyList();
            nonempty |= !text.isEmpty();
            for (Integer start : starts) rawLines.add(new Line(text, start, 0));
            if (rawLines.size() > 4096) return Collections.emptyList();
        }
        if (!nonempty) return Collections.emptyList();
        rawLines.sort(Comparator.comparingInt(l -> l.startMs));
        ArrayList<Line> unique = new ArrayList<>();
        for (Line line : rawLines) {
            if (!unique.isEmpty() && unique.get(unique.size() - 1).startMs == line.startMs) {
                Line previous = unique.remove(unique.size() - 1);
                String text = previous.text.isEmpty() ? line.text : line.text.isEmpty() || previous.text.equals(line.text)
                        ? previous.text : previous.text + "\n" + line.text;
                unique.add(new Line(text, line.startMs, 0));
            } else unique.add(line);
        }
        ArrayList<Line> result = new ArrayList<>();
        for (int i = 0; i < unique.size(); i++) {
            Line line = unique.get(i);
            int end = i + 1 < unique.size() ? unique.get(i + 1).startMs : durationMs;
            result.add(new Line(line.text, line.startMs, Math.max(line.startMs, end)));
        }
        return result;
    }
}
