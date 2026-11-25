package dev.materialtidal.extension.tidal.player.lyrics;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * Normalizes track metadata and ranks search hits for {@code lrc.red} and {@code lyrics-api.binimum.org}.
 * Pure Java so unit tests verify matching logic without Android dependencies.
 */
public final class SyllableLyricsMatcher {

    private static final Pattern ISRC_PATTERN = Pattern.compile("^[A-Z0-9]{12}$");
    private static final Pattern BRACKET_PATTERN = Pattern.compile("\\s*[(\\[【][^)\\]】]*[)\\]】]");
    private static final Pattern FEATURING_PATTERN = Pattern.compile("\\s+(?:feat\\.?|ft\\.?|featuring)\\s+.*$", Pattern.CASE_INSENSITIVE);
    private static final Pattern ARTIST_SEP_PATTERN = Pattern.compile("\\s*(?:,|&|/|\\band\\b|\\bx\\b|\\bwith\\b|\\bfeat\\.?|\\bft\\.?)\\s*", Pattern.CASE_INSENSITIVE);
    private static final Pattern DIACRITICS_PATTERN = Pattern.compile("\\p{Mn}+");
    private static final Pattern NON_WORD_PATTERN = Pattern.compile("[^\\p{L}\\p{N}]+");

    private static final double MAX_DURATION_DELTA_SEC = 4.0;

    private SyllableLyricsMatcher() {
    }

    public static boolean isValidIsrc(String isrc) {
        return isrc != null && ISRC_PATTERN.matcher(isrc.trim().toUpperCase(Locale.ROOT)).matches();
    }

    public static String normalizeIsrc(String isrc) {
        if (isrc == null) return null;
        String up = isrc.trim().toUpperCase(Locale.ROOT);
        return ISRC_PATTERN.matcher(up).matches() ? up : null;
    }

    public static String cleanTitle(String title) {
        if (title == null) {
            return "";
        }
        String cleaned = BRACKET_PATTERN.matcher(title).replaceAll("");
        cleaned = FEATURING_PATTERN.matcher(cleaned).replaceAll("");
        int dashIdx = cleaned.indexOf(" - ");
        if (dashIdx > 0) {
            cleaned = cleaned.substring(0, dashIdx);
        }
        cleaned = cleaned.trim();
        return cleaned.isEmpty() ? title.trim() : cleaned;
    }

    public static String primaryArtist(String artist) {
        if (artist == null) {
            return "";
        }
        String[] parts = ARTIST_SEP_PATTERN.split(artist);
        for (String p : parts) {
            if (p != null && !p.trim().isEmpty()) {
                return p.trim();
            }
        }
        return artist.trim();
    }

    public static List<String> splitArtistsNormalized(String artist) {
        if (artist == null || artist.trim().isEmpty()) {
            return Collections.emptyList();
        }
        String[] parts = ARTIST_SEP_PATTERN.split(artist);
        Set<String> set = new LinkedHashSet<>();
        for (String p : parts) {
            String n = normalize(p);
            if (!n.isEmpty()) {
                set.add(n);
            }
        }
        return new ArrayList<>(set);
    }

    public static String normalize(String value) {
        if (value == null || value.isEmpty()) {
            return "";
        }
        String nfkd = Normalizer.normalize(value, Normalizer.Form.NFKD);
        String noMarks = DIACRITICS_PATTERN.matcher(nfkd).replaceAll("");
        return NON_WORD_PATTERN.matcher(noMarks.toLowerCase(Locale.ROOT)).replaceAll("");
    }

    public static List<String> pickBestLrcRedIsrc(
            String searchJson,
            String title,
            String artist,
            int durationSec
    ) {
        Map<String, Object> root = SimpleJsonParser.asMap(SimpleJsonParser.parse(searchJson));
        if (root == null) {
            return Collections.emptyList();
        }
        List<Object> hits = SimpleJsonParser.asList(root.get("hits"));
        if (hits == null || hits.isEmpty()) {
            return Collections.emptyList();
        }

        String wantedTitle = normalize(cleanTitle(title));
        List<String> wantedArtists = splitArtistsNormalized(artist);
        if (wantedTitle.isEmpty() || wantedArtists.isEmpty()) {
            return Collections.emptyList();
        }

        List<RankedIsrc> ranked = new ArrayList<>();
        for (Object hitObj : hits) {
            Map<String, Object> hit = SimpleJsonParser.asMap(hitObj);
            if (hit == null) continue;
            String isrc = normalizeIsrc(SimpleJsonParser.asString(hit.get("isrc")));
            if (isrc == null) continue;

            String hitTitle = SimpleJsonParser.asString(hit.get("title"));
            String hitArtist = SimpleJsonParser.asString(hit.get("artist"));
            if (hitTitle == null || hitArtist == null) continue;

            int tScore = titleScore(wantedTitle, normalize(cleanTitle(hitTitle)));
            if (tScore == 0 || !artistMatches(wantedArtists, hitArtist)) {
                continue;
            }

            Double hitDur = SimpleJsonParser.asDouble(hit.get("duration"));
            double delta = Double.MAX_VALUE;
            if (durationSec > 0 && hitDur != null && hitDur > 0) {
                delta = Math.abs(hitDur - durationSec);
                if (delta > MAX_DURATION_DELTA_SEC) {
                    continue;
                }
            }
            boolean byModel = SimpleJsonParser.asBool(hit.get("byModel"), false);
            ranked.add(new RankedIsrc(isrc, tScore, byModel, delta));
        }

        Collections.sort(ranked, new Comparator<RankedIsrc>() {
            @Override
            public int compare(RankedIsrc a, RankedIsrc b) {
                int cmp = Integer.compare(b.titleScore, a.titleScore);
                if (cmp != 0) return cmp;
                cmp = Boolean.compare(a.byModel, b.byModel);
                if (cmp != 0) return cmp;
                return Double.compare(a.durationDelta, b.durationDelta);
            }
        });

        Set<String> dedup = new LinkedHashSet<>();
        for (RankedIsrc r : ranked) {
            dedup.add(r.isrc);
            if (dedup.size() >= 3) break;
        }
        return new ArrayList<>(dedup);
    }

    public static List<String> pickBestBinimumUrls(String json, int durationSec) {
        Map<String, Object> root = SimpleJsonParser.asMap(SimpleJsonParser.parse(json));
        if (root == null) {
            return Collections.emptyList();
        }
        List<Object> results = SimpleJsonParser.asList(root.get("results"));
        if (results == null || results.isEmpty()) {
            return Collections.emptyList();
        }

        List<RankedUrl> ranked = new ArrayList<>();
        for (Object itemObj : results) {
            Map<String, Object> item = SimpleJsonParser.asMap(itemObj);
            if (item == null) continue;

            String timingType = SimpleJsonParser.asString(item.get("timing_type"));
            if (!"word".equalsIgnoreCase(timingType)) {
                continue;
            }
            String url = SimpleJsonParser.asString(item.get("lyricsUrl"));
            if (url == null || !url.startsWith("https://")) {
                continue;
            }
            Double dur = SimpleJsonParser.asDouble(item.get("duration"));
            double delta = Double.MAX_VALUE;
            if (durationSec > 0 && dur != null && dur > 0) {
                delta = Math.abs(dur - durationSec);
                if (delta > MAX_DURATION_DELTA_SEC) {
                    continue;
                }
            }
            ranked.add(new RankedUrl(url, delta));
        }

        Collections.sort(ranked, new Comparator<RankedUrl>() {
            @Override
            public int compare(RankedUrl a, RankedUrl b) {
                return Double.compare(a.durationDelta, b.durationDelta);
            }
        });

        Set<String> dedup = new LinkedHashSet<>();
        for (RankedUrl r : ranked) {
            dedup.add(r.url);
            if (dedup.size() >= 2) break;
        }
        return new ArrayList<>(dedup);
    }

    public static final class KugouCandidate {
        public final String id;
        public final String accesskey;

        public KugouCandidate(String id, String accesskey) {
            this.id = id;
            this.accesskey = accesskey;
        }
    }

    public static List<KugouCandidate> pickBestKugouCandidates(
            String searchJson,
            String title,
            String artist,
            int durationSec
    ) {
        Map<String, Object> root = SimpleJsonParser.asMap(SimpleJsonParser.parse(searchJson));
        if (root == null) {
            return Collections.emptyList();
        }
        List<Object> candidates = SimpleJsonParser.asList(root.get("candidates"));
        if (candidates == null || candidates.isEmpty()) {
            return Collections.emptyList();
        }

        String wantedTitle = normalize(cleanTitle(title));
        List<String> wantedArtists = splitArtistsNormalized(artist);
        if (wantedTitle.isEmpty() || wantedArtists.isEmpty()) {
            return Collections.emptyList();
        }

        List<RankedKugou> ranked = new ArrayList<>();
        for (Object obj : candidates) {
            Map<String, Object> cand = SimpleJsonParser.asMap(obj);
            if (cand == null) continue;
            String id = SimpleJsonParser.asString(cand.get("id"));
            String accesskey = SimpleJsonParser.asString(cand.get("accesskey"));
            if (isBlank(id) || isBlank(accesskey)) continue;

            String song = SimpleJsonParser.asString(cand.get("song"));
            String singer = SimpleJsonParser.asString(cand.get("singer"));
            if (isBlank(song) || isBlank(singer)) continue;

            int tScore = titleScore(wantedTitle, normalize(cleanTitle(song)));
            if (tScore == 0 || !artistMatches(wantedArtists, singer)) {
                continue;
            }

            Double durMs = SimpleJsonParser.asDouble(cand.get("duration"));
            double delta = Double.MAX_VALUE;
            if (durationSec > 0 && durMs != null && durMs > 0) {
                delta = Math.abs(durMs / 1000.0 - durationSec);
                if (delta > MAX_DURATION_DELTA_SEC) {
                    continue;
                }
            }

            Long krcType = SimpleJsonParser.asLong(cand.get("krctype"));
            Long score = SimpleJsonParser.asLong(cand.get("score"));
            boolean isKrcWord = krcType != null && krcType == 2L;
            long safeScore = score != null ? score : 0L;
            ranked.add(new RankedKugou(id.trim(), accesskey.trim(), tScore, isKrcWord, safeScore, delta));
        }

        Collections.sort(ranked, new Comparator<RankedKugou>() {
            @Override
            public int compare(RankedKugou a, RankedKugou b) {
                int cmp = Integer.compare(b.titleScore, a.titleScore);
                if (cmp != 0) return cmp;
                cmp = Boolean.compare(b.isKrcWord, a.isKrcWord);
                if (cmp != 0) return cmp;
                cmp = Long.compare(b.score, a.score);
                if (cmp != 0) return cmp;
                return Double.compare(a.durationDelta, b.durationDelta);
            }
        });

        List<KugouCandidate> out = new ArrayList<>(2);
        Set<String> seenIds = new LinkedHashSet<>();
        for (RankedKugou r : ranked) {
            if (seenIds.add(r.id)) {
                out.add(new KugouCandidate(r.id, r.accesskey));
                if (out.size() >= 2) break;
            }
        }
        return out;
    }

    public static Map<String, Object> pickBestLrclibRecord(
            String searchJson,
            String title,
            String artist,
            int durationSec,
            boolean preferWordSync
    ) {
        List<Object> records = SimpleJsonParser.asList(SimpleJsonParser.parse(searchJson));
        if (records == null || records.isEmpty()) {
            return null;
        }

        String wantedTitle = normalize(cleanTitle(title));
        List<String> wantedArtists = splitArtistsNormalized(artist);
        if (wantedTitle.isEmpty() || wantedArtists.isEmpty()) {
            return null;
        }

        List<RankedLrclib> ranked = new ArrayList<>();
        for (Object obj : records) {
            Map<String, Object> rec = SimpleJsonParser.asMap(obj);
            if (rec == null) continue;
            if (SimpleJsonParser.asBool(rec.get("instrumental"), false)) {
                continue;
            }
            boolean hasWord = SimpleJsonParser.asBool(rec.get("hasWordSync"), false)
                    && !isBlank(SimpleJsonParser.asString(rec.get("lyricsfile")));
            boolean hasLine = !isBlank(SimpleJsonParser.asString(rec.get("syncedLyrics")));
            if (!hasWord && !hasLine) {
                continue;
            }

            String recTitle = SimpleJsonParser.asString(rec.get("trackName"));
            if (isBlank(recTitle)) {
                recTitle = SimpleJsonParser.asString(rec.get("name"));
            }
            String recArtist = SimpleJsonParser.asString(rec.get("artistName"));
            if (isBlank(recTitle) || isBlank(recArtist)) {
                continue;
            }

            int tScore = titleScore(wantedTitle, normalize(cleanTitle(recTitle)));
            if (tScore == 0 || !artistMatches(wantedArtists, recArtist)) {
                continue;
            }

            Double dur = SimpleJsonParser.asDouble(rec.get("duration"));
            double delta = Double.MAX_VALUE;
            if (durationSec > 0 && dur != null && dur > 0) {
                delta = Math.abs(dur - durationSec);
                if (delta > MAX_DURATION_DELTA_SEC) {
                    continue;
                }
            }
            ranked.add(new RankedLrclib(rec, hasWord, tScore, delta));
        }

        if (ranked.isEmpty()) {
            return null;
        }

        Collections.sort(ranked, new Comparator<RankedLrclib>() {
            @Override
            public int compare(RankedLrclib a, RankedLrclib b) {
                if (preferWordSync) {
                    int cmp = Boolean.compare(b.hasWordSync, a.hasWordSync);
                    if (cmp != 0) return cmp;
                }
                int cmp = Integer.compare(b.titleScore, a.titleScore);
                if (cmp != 0) return cmp;
                return Double.compare(a.durationDelta, b.durationDelta);
            }
        });

        return ranked.get(0).record;
    }

    private static boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }

    private static int titleScore(String wanted, String candidate) {
        if (candidate.isEmpty()) return 0;
        if (candidate.equals(wanted)) return 2;
        if (candidate.contains(wanted) || wanted.contains(candidate)) return 1;
        return 0;
    }

    private static boolean artistMatches(List<String> wantedArtists, String candidateArtist) {
        List<String> candidates = splitArtistsNormalized(candidateArtist);
        String joinedCandidate = normalize(candidateArtist);
        for (String wanted : wantedArtists) {
            if (joinedCandidate.contains(wanted)) return true;
            for (String c : candidates) {
                if (c.contains(wanted) || wanted.contains(c)) return true;
            }
        }
        return false;
    }

    private static final class RankedIsrc {
        final String isrc;
        final int titleScore;
        final boolean byModel;
        final double durationDelta;

        RankedIsrc(String isrc, int titleScore, boolean byModel, double durationDelta) {
            this.isrc = isrc;
            this.titleScore = titleScore;
            this.byModel = byModel;
            this.durationDelta = durationDelta;
        }
    }

    private static final class RankedUrl {
        final String url;
        final double durationDelta;

        RankedUrl(String url, double durationDelta) {
            this.url = url;
            this.durationDelta = durationDelta;
        }
    }

    private static final class RankedKugou {
        final String id;
        final String accesskey;
        final int titleScore;
        final boolean isKrcWord;
        final long score;
        final double durationDelta;

        RankedKugou(
                String id,
                String accesskey,
                int titleScore,
                boolean isKrcWord,
                long score,
                double durationDelta
        ) {
            this.id = id;
            this.accesskey = accesskey;
            this.titleScore = titleScore;
            this.isKrcWord = isKrcWord;
            this.score = score;
            this.durationDelta = durationDelta;
        }
    }

    private static final class RankedLrclib {
        final Map<String, Object> record;
        final boolean hasWordSync;
        final int titleScore;
        final double durationDelta;

        RankedLrclib(Map<String, Object> record, boolean hasWordSync, int titleScore, double durationDelta) {
            this.record = record;
            this.hasWordSync = hasWordSync;
            this.titleScore = titleScore;
            this.durationDelta = durationDelta;
        }
    }
}
