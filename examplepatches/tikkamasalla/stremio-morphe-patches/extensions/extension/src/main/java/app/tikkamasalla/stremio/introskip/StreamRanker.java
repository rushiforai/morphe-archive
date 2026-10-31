package app.tikkamasalla.stremio.introskip;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Ranks Stremio video streams using pure Java 8 according to user preference rules.
 */
public final class StreamRanker {

    private StreamRanker() {
        // Utility class
    }

    /**
     * Input stream model representing a single Stremio stream candidate.
     */
    public static final class Stream {
        public final String name;
        public final String title;
        public final String url;
        public final String addonName;

        public Stream(String name, String title, String url, String addonName) {
            this.name = name != null ? name : "";
            this.title = title != null ? title : "";
            this.url = url;
            this.addonName = addonName != null ? addonName : "";
        }

        @Override
        public String toString() {
            String cleanName = name.replace("\n", " | ");
            String firstTitleLine = title.split("\\r?\\n", 2)[0];
            return "[" + cleanName + "] " + firstTitleLine;
        }
    }

    /**
     * Ranked stream result containing the original stream, numerical score, and human-readable reason.
     */
    public static final class Ranked {
        public final Stream stream;
        public final long score;
        public final String reason;
        public final ParsedMeta meta;

        public Ranked(Stream stream, long score, String reason, ParsedMeta meta) {
            this.stream = stream;
            this.score = score;
            this.reason = reason;
            this.meta = meta;
        }

        @Override
        public String toString() {
            return String.format(Locale.US, "Score: %13d | %s | Reason: %s", score, stream, reason);
        }
    }

    /**
     * Parsed metadata extracted from stream fields.
     */
    public static final class ParsedMeta {
        public final int resolution;
        public final boolean aiUpscale;
        public final long sizeBytes;
        public final String sizeDisplay;
        public final boolean hdr;
        public final boolean dolbyVision;
        public final String hdrLabel;
        public final boolean cached;
        public final boolean badSource;
        public final String badSourceLabel;
        public final boolean remux;
        public final String codec;
        public final int codecRank;
        public final int seeders;

        ParsedMeta(
                int resolution,
                boolean aiUpscale,
                long sizeBytes,
                String sizeDisplay,
                boolean hdr,
                boolean dolbyVision,
                String hdrLabel,
                boolean cached,
                boolean badSource,
                String badSourceLabel,
                boolean remux,
                String codec,
                int codecRank,
                int seeders) {
            this.resolution = resolution;
            this.aiUpscale = aiUpscale;
            this.sizeBytes = sizeBytes;
            this.sizeDisplay = sizeDisplay;
            this.hdr = hdr;
            this.dolbyVision = dolbyVision;
            this.hdrLabel = hdrLabel;
            this.cached = cached;
            this.badSource = badSource;
            this.badSourceLabel = badSourceLabel;
            this.remux = remux;
            this.codec = codec;
            this.codecRank = codecRank;
            this.seeders = seeders;
        }
    }

    // Token boundary helpers that work around dots, underscores, brackets, hyphens, spaces, and emojis
    private static final String B_START = "(?<![A-Za-z0-9])";
    private static final String B_END = "(?![A-Za-z0-9])";

    // AI Upscale patterns (includes common "upcale" typo seen in release titles)
    private static final Pattern AI_UPSCALE_PATTERN = Pattern.compile(
            B_START + "(?:ai[\\s._-]*upscal(?:e|ed|ing)?|upscal(?:e|ed|ing)?|ai[\\s._-]*upcale|upcale|ai[\\s._-]*4k)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );

    // Resolution patterns
    private static final Pattern RES_2160_PATTERN = Pattern.compile(
            B_START + "(?:2160p?|4k|uhd)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern RES_1440_PATTERN = Pattern.compile(
            B_START + "(?:1440p?|2k|qhd)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern RES_1080_PATTERN = Pattern.compile(
            B_START + "(?:1080[pi]?|fhd)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern RES_720_PATTERN = Pattern.compile(
            B_START + "(?:720[pi]?)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern RES_480_PATTERN = Pattern.compile(
            B_START + "(?:480[pi]?|576[pi]?|540p?|400p?|360p?|sd)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );

    // Size patterns (prioritize floppy disk emoji 💾 if present, otherwise general size token)
    private static final Pattern DISK_EMOJI_SIZE_PATTERN = Pattern.compile(
            "\uD83D\uDCBE\\s*(\\d+(?:\\.\\d+)?)\\s*(TiB|TB|GiB|GB|MiB|MB|KiB|KB)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern GENERAL_SIZE_PATTERN = Pattern.compile(
            B_START + "(\\d+(?:\\.\\d+)?)\\s*(TiB|TB|GiB|GB|MiB|MB|KiB|KB)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );

    // HDR & Dolby Vision patterns
    private static final Pattern DV_PATTERN = Pattern.compile(
            B_START + "(?:dv|dovi|dolby[\\s._-]*vision)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern HDR10_PLUS_PATTERN = Pattern.compile(
            B_START + "hdr10\\+" + "(?![A-Za-z0-9])",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern HDR_PATTERN = Pattern.compile(
            B_START + "(?:hdr10|hdr)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );

    // Cached & Uncached Debrid markers (only explicit [XX download] / uncached, not bare "download")
    private static final Pattern UNCACHED_MARKER_PATTERN = Pattern.compile(
            "(?:\\[\\s*(?:rd|tb|ad|pm|dl|oc|ed)\\s+download\\s*\\]|\u23F3|" + B_START + "uncached" + B_END + ")",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern CACHED_MARKER_PATTERN = Pattern.compile(
            "(?:\\[\\s*(?:rd|tb|ad|pm|dl|oc|ed)\\s*\\+\\s*\\]|\u26A1|" + B_START + "(?:cached|instant)" + B_END + ")",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern DEBRID_ADDON_PATTERN = Pattern.compile(
            B_START + "(?:torbox|real[\\s._-]*debrid|all[\\s._-]*debrid|premiumize|debrid|torrentio|comet|mediafusion|knightcrawler|jackettio|stremthru|rd|tb|ad|pm)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );

    // Bad source patterns (exclude bare "ts" so .ts containers and [TS] anime typesetting tags are not dropped)
    private static final Pattern BAD_SOURCE_PATTERN = Pattern.compile(
            B_START + "(hdcams?|camrip|cams?|hdts|tsrip|telesync|telecine|tcrip|tc|screeners?|dvdscr|bdscr|scr|r5|korsub|3d|sample)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );

    // Remux and Codecs
    private static final Pattern REMUX_PATTERN = Pattern.compile(
            B_START + "remux" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern AV1_PATTERN = Pattern.compile(
            B_START + "av1" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern HEVC_PATTERN = Pattern.compile(
            B_START + "(?:hevc|h[._-]?265|x265)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );
    private static final Pattern H264_PATTERN = Pattern.compile(
            B_START + "(?:avc|h[._-]?264|x264)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );

    // Seeders pattern (👤 45 or Seeds: 45)
    private static final Pattern SEEDERS_PATTERN = Pattern.compile(
            "(?:\uD83D\uDC64\\s*(\\d+)|" + B_START + "seeds?[\\s:]*(\\d+)" + B_END + ")",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
    );

    /**
     * Returns the highest-ranked stream, or null if the input list is null or empty.
     */
    public static Stream best(List<Stream> streams, boolean isMovie) {
        List<Ranked> ranked = rank(streams, isMovie);
        return ranked.isEmpty() ? null : ranked.get(0).stream;
    }

    /**
     * Ranks the given streams best-first according to the user's hierarchy of rules.
     * Bad sources are excluded unless every stream in the input list is a bad source.
     */
    public static List<Ranked> rank(List<Stream> streams, boolean isMovie) {
        return rank(streams, isMovie, 0, 0);
    }

    /**
     * Same as {@link #rank(List, boolean)} for a requested episode. A stream whose text names an
     * explicit season or episode that differs from the request (S04E02, 1x05, E1100, " - 1100 ")
     * is dropped; streams without explicit numbers are kept. Pass season 0 when the season is
     * unknown (kitsu ids) and episode 0 to disable the check.
     */
    public static List<Ranked> rank(List<Stream> streams, boolean isMovie, int reqSeason, int reqEpisode) {
        if (streams == null || streams.isEmpty()) {
            return Collections.emptyList();
        }

        List<Candidate> allCandidates = new ArrayList<Candidate>(streams.size());
        List<Candidate> goodCandidates = new ArrayList<Candidate>(streams.size());

        for (Stream s : streams) {
            if (s == null) {
                continue;
            }
            int kind = EP_UNKNOWN;
            if (!isMovie && reqEpisode > 0) {
                kind = episodeKind(s, reqSeason, reqEpisode);
                if (kind == EP_REJECT) {
                    continue;
                }
            }
            ParsedMeta meta = parse(s);
            long score = computeScore(meta);
            Candidate c = new Candidate(s, meta, score);
            c.multi = kind == EP_MULTI || kind == EP_PACK;
            c.oversize = !isMovie && reqEpisode > 0 && meta.sizeBytes > MAX_EPISODE_BYTES;
            allCandidates.add(c);
            if (!meta.badSource) {
                goodCandidates.add(c);
            }
        }

        if (allCandidates.isEmpty()) {
            return Collections.emptyList();
        }

        // Rule 1: Exclude bad sources unless that is all there is
        final boolean onlyBadSources = goodCandidates.isEmpty();
        List<Candidate> activePool = onlyBadSources ? allCandidates : goodCandidates;

        boolean anyCached = false;
        for (Candidate c : activePool) {
            if (c.meta.cached) {
                anyCached = true;
                break;
            }
        }
        final boolean allUncached = !anyCached;

        Collections.sort(activePool, new Comparator<Candidate>() {
            @Override
            public int compare(Candidate a, Candidate b) {
                // 1. Non-bad before bad
                if (a.meta.badSource != b.meta.badSource) {
                    return a.meta.badSource ? 1 : -1;
                }
                // 2. A single episode over the size cap is a pack or a file the TV cannot play
                if (a.oversize != b.oversize) {
                    return a.oversize ? 1 : -1;
                }
                // 3. Cached before uncached
                if (a.meta.cached != b.meta.cached) {
                    return a.meta.cached ? -1 : 1;
                }
                // 4. Single-episode files before season packs and multi-episode files
                if (a.multi != b.multi) {
                    return a.multi ? 1 : -1;
                }
                // 5. Higher resolution first (AI upscale counts as 2160)
                if (a.meta.resolution != b.meta.resolution) {
                    return Integer.compare(b.meta.resolution, a.meta.resolution);
                }
                // 6. HDR / Dolby Vision before SDR
                boolean aHdr = a.meta.hdr || a.meta.dolbyVision;
                boolean bHdr = b.meta.hdr || b.meta.dolbyVision;
                if (aHdr != bHdr) {
                    return aHdr ? -1 : 1;
                }
                // 7. Larger file size (in bytes) first
                if (a.meta.sizeBytes != b.meta.sizeBytes) {
                    return Long.compare(b.meta.sizeBytes, a.meta.sizeBytes);
                }
                // 8a. Tie-breaker: HEVC/AV1 over H264/other
                if (a.meta.codecRank != b.meta.codecRank) {
                    return Integer.compare(b.meta.codecRank, a.meta.codecRank);
                }
                // 8b. Tie-breaker: More seeders
                if (a.meta.seeders != b.meta.seeders) {
                    return Integer.compare(b.meta.seeders, a.meta.seeders);
                }
                return Long.compare(b.score, a.score);
            }
        });

        List<Ranked> result = new ArrayList<Ranked>(activePool.size());
        Candidate winner = activePool.get(0);
        Candidate runnerUp = activePool.size() > 1 ? activePool.get(1) : null;

        for (int i = 0; i < activePool.size(); i++) {
            Candidate current = activePool.get(i);
            String reason = buildReason(current, i == 0 ? runnerUp : winner, i == 0, allUncached, onlyBadSources, isMovie);
            result.add(new Ranked(current.stream, current.score, reason, current.meta));
        }

        return result;
    }

    /**
     * Season and episode requested by a video id: tt0903747:2:1 gives {2, 1}, kitsu:46474:5 gives
     * {0, 5}. {0, 0} (no check) for movies or ids that do not parse.
     */
    public static int[] requestOf(String videoId) {
        try {
            if (videoId == null) return new int[] {0, 0};
            String[] parts = videoId.split(":");
            if (parts.length < 2) return new int[] {0, 0};
            int episode = Integer.parseInt(parts[parts.length - 1].trim());
            int season = 0;
            if (parts.length >= 3 && parts[0].startsWith("tt")) {
                season = Integer.parseInt(parts[parts.length - 2].trim());
            }
            return new int[] {Math.max(season, 0), Math.max(episode, 0)};
        } catch (Throwable ignored) {
            return new int[] {0, 0};
        }
    }

    /** Episodes above this size are packs or remuxes the TV cannot play; they rank last. */
    static final long MAX_EPISODE_BYTES = 25_000_000_000L;

    // Episode kinds returned by episodeKind().
    static final int EP_REJECT = -1;
    static final int EP_UNKNOWN = 0;
    static final int EP_SINGLE = 1;
    static final int EP_MULTI = 2;
    static final int EP_PACK = 3;

    private static final String SEP = "[\\s._\u2022\u00b7-]{0,5}";
    // S01E02, S01 • E02, S01E02E03, S01E02-E04, S01E02-04 (ranges need an E or a hyphen).
    private static final Pattern SXXEYY_PATTERN = Pattern.compile(
            B_START + "S(\\d{1,2})" + SEP + "EP?(\\d{1,4})(?:(?:\\s*[-~]\\s*EP?|[._]?EP?)(\\d{1,4})(?![A-Za-z0-9]))?",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern NXNN_PATTERN = Pattern.compile(
            B_START + "(\\d{1,2})x(\\d{2,3})" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern EP_WORD_PATTERN = Pattern.compile(
            B_START + "(?:(?:ep(?:isode)?)[\\s._-]?(\\d{1,4})|e(\\d{1,4}))" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern ANIME_EP_PATTERN = Pattern.compile(
            "(?:^|[\\s._])-\\s*[._]?(\\d{2,4})(?:v\\d)?(?=[\\s._]|$|\\[|\\()",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern SEASON_RANGE_PATTERN = Pattern.compile(
            B_START + "(?:seasons?[\\s._-]*|s)(\\d{1,2})(?:\\s*(?:-|~|to|&)\\s*(?:seasons?[\\s._-]*|s)(\\d{1,2})|[-~](\\d{1,2}))" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern SEASON_ONLY_PATTERN = Pattern.compile(
            B_START + "(?:(?:seasons?[\\s._-]*|s)(\\d{1,2})|(\\d{1,2})(?:st|nd|rd|th)[\\s._-]+season)" + B_END + "(?!" + SEP + "EP?\\d)",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern FINAL_SEASON_PATTERN = Pattern.compile(
            B_START + "final[\\s._-]+season" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern PACK_WORD_PATTERN = Pattern.compile(
            B_START + "(?:complete|pack|collection|integrale|all[\\s._-]*seasons|full[\\s._-]*series|\u0441\u0435\u0437\u043E\u043D|\u0441\u0435\u0440\u0438\u0438)" + B_END,
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);

    /** True when the stream does not name a different season or episode than the requested one. */
    static boolean episodeMatches(Stream stream, int reqSeason, int reqEpisode) {
        return episodeKind(stream, reqSeason, reqEpisode) != EP_REJECT;
    }

    /**
     * Classifies a stream against the requested episode: EP_REJECT when its text names another
     * season or episode, EP_SINGLE when it names the requested episode alone, EP_MULTI for a
     * multi-episode file that contains it, EP_PACK for a season or series pack, EP_UNKNOWN when
     * it carries no explicit numbers.
     */
    static int episodeKind(Stream stream, int reqSeason, int reqEpisode) {
        try {
            String name = stream.name != null ? stream.name : "";
            String title = stream.title != null ? stream.title : "";
            int kind = kindOfText(name + "\n" + title, reqSeason, reqEpisode);
            if (kind == EP_SINGLE && title.contains("\n")) {
                String[] lines = title.split("\\r?\\n", 2);
                int firstKind = kindOfText(lines[0], reqSeason, reqEpisode);
                int restKind = kindOfText(lines[1], reqSeason, reqEpisode);
                // If line 1 is a pack header, keep EP_SINGLE only when the later line itself
                // explicitly identifies the single target episode (e.g. the selected file in the batch).
                if (firstKind == EP_PACK && restKind != EP_SINGLE) {
                    return EP_PACK;
                }
            }
            return kind;
        } catch (Throwable ignored) {
            return EP_UNKNOWN;
        }
    }

    private static int kindOfText(String text, int reqSeason, int reqEpisode) {
        try {
            // Seen as episode refs: {season or -1, from, to}.
            List<int[]> eps = new ArrayList<int[]>();
            boolean sawSingleMatch = false;
            boolean sawSingleOther = false;
            boolean sawRangeMatch = false;

            Matcher m = SXXEYY_PATTERN.matcher(text);
            StringBuilder rest = new StringBuilder(text);
            while (m.find()) {
                int season = Integer.parseInt(m.group(1));
                int from = Integer.parseInt(m.group(2));
                int to = m.group(3) != null ? Integer.parseInt(m.group(3)) : from;
                if (to < from) {
                    to = from;
                }
                eps.add(new int[] {season, from, to});
                blank(rest, m.start(), m.end());
            }
            text = rest.toString();
            m = NXNN_PATTERN.matcher(text);
            while (m.find()) {
                int e = Integer.parseInt(m.group(2));
                eps.add(new int[] {Integer.parseInt(m.group(1)), e, e});
                blank(rest, m.start(), m.end());
            }
            text = rest.toString();
            m = EP_WORD_PATTERN.matcher(text);
            while (m.find()) {
                String g = m.group(1) != null ? m.group(1) : m.group(2);
                int e = Integer.parseInt(g);
                eps.add(new int[] {-1, e, e});
                blank(rest, m.start(), m.end());
            }
            text = rest.toString();
            m = ANIME_EP_PATTERN.matcher(text);
            while (m.find()) {
                int e = Integer.parseInt(m.group(1));
                // Years and resolutions after a hyphen are not episode numbers.
                if ((e >= 1900 && e <= 2099) || e == 480 || e == 576 || e == 720 || e == 1080 || e == 2160) {
                    continue;
                }
                eps.add(new int[] {-1, e, e});
            }

            // Seasons named without an episode: {from, to}, to == from for a single season.
            List<int[]> seasons = new ArrayList<int[]>();
            m = SEASON_RANGE_PATTERN.matcher(text);
            while (m.find()) {
                int a = Integer.parseInt(m.group(1));
                int b = Integer.parseInt(m.group(2) != null ? m.group(2) : m.group(3));
                seasons.add(new int[] {Math.min(a, b), Math.max(a, b)});
                blank(rest, m.start(), m.end());
            }
            text = rest.toString();
            if (reqSeason == 1 && FINAL_SEASON_PATTERN.matcher(text).find()) {
                return EP_REJECT;
            }
            m = SEASON_ONLY_PATTERN.matcher(text);
            while (m.find()) {
                String g = m.group(1) != null ? m.group(1) : m.group(2);
                int s = Integer.parseInt(g);
                seasons.add(new int[] {s, s});
            }

            // "Show S02 - 05" style: a lone season plus a bare episode number.
            if (seasons.size() == 1 && seasons.get(0)[0] == seasons.get(0)[1]) {
                for (int[] ep : eps) {
                    if (ep[0] < 0) {
                        ep[0] = seasons.get(0)[0];
                    }
                }
            }

            for (int[] ep : eps) {
                boolean seasonOk = ep[0] < 0 || reqSeason <= 0 || ep[0] == reqSeason;
                if (ep[2] == ep[1]) {
                    if (seasonOk && reqEpisode == ep[1]) {
                        sawSingleMatch = true;
                    } else {
                        sawSingleOther = true;
                    }
                } else if (seasonOk && reqEpisode >= ep[1] && reqEpisode <= ep[2]) {
                    sawRangeMatch = true;
                }
            }
            if (sawSingleMatch) {
                return EP_SINGLE;
            }
            // If an explicit single episode was named and it did not match, reject even if a
            // pack range on line 1 (e.g. S01E01-25) covered reqEpisode.
            if (sawSingleOther) {
                return EP_REJECT;
            }
            if (sawRangeMatch) {
                return EP_MULTI;
            }
            if (!eps.isEmpty()) {
                return EP_REJECT;
            }
            if (!seasons.isEmpty()) {
                for (int[] s : seasons) {
                    if (reqSeason <= 0 || (reqSeason >= s[0] && reqSeason <= s[1])) {
                        return EP_PACK;
                    }
                }
                return EP_REJECT;
            }
            if (PACK_WORD_PATTERN.matcher(text).find()) {
                return EP_PACK;
            }
            return EP_UNKNOWN;
        } catch (Throwable ignored) {
            return EP_UNKNOWN;
        }
    }

    private static void blank(StringBuilder sb, int start, int end) {
        for (int i = start; i < end && i < sb.length(); i++) {
            sb.setCharAt(i, ' ');
        }
    }

    /**
     * Parses a Stream's name, title, url, and addonName into structured metadata.
     */
    public static ParsedMeta parse(Stream stream) {
        String combined = (stream.name != null ? stream.name : "") + "\n" + (stream.title != null ? stream.title : "");

        // 1. AI Upscale check (counts as 4K / 2160p)
        boolean aiUpscale = AI_UPSCALE_PATTERN.matcher(combined).find();

        // 2. Resolution check
        int resolution = 0;
        if (RES_2160_PATTERN.matcher(combined).find()) {
            resolution = 2160;
        } else if (RES_1440_PATTERN.matcher(combined).find()) {
            resolution = 1440;
        } else if (RES_1080_PATTERN.matcher(combined).find()) {
            resolution = 1080;
        } else if (RES_720_PATTERN.matcher(combined).find()) {
            resolution = 720;
        } else if (RES_480_PATTERN.matcher(combined).find()) {
            resolution = 480;
        }
        if (aiUpscale && resolution < 2160) {
            resolution = 2160;
        }

        // 3. File size check: if a batch stream lists both a >25 GB pack size and a <=25 GB
        // episode file size, prefer the episode file size.
        long sizeBytes = 0L;
        String sizeDisplay = "unknown size";
        Matcher diskMatcher = DISK_EMOJI_SIZE_PATTERN.matcher(combined);
        while (diskMatcher.find()) {
            long candidateBytes = parseSizeToBytes(diskMatcher.group(1), diskMatcher.group(2));
            String candidateDisplay = diskMatcher.group(1) + " " + diskMatcher.group(2).toUpperCase(Locale.ROOT);
            if (sizeBytes == 0L || (sizeBytes > MAX_EPISODE_BYTES && candidateBytes > 0L && candidateBytes <= MAX_EPISODE_BYTES)) {
                sizeBytes = candidateBytes;
                sizeDisplay = candidateDisplay;
            }
        }
        if (sizeBytes == 0L) {
            Matcher generalSizeMatcher = GENERAL_SIZE_PATTERN.matcher(combined);
            while (generalSizeMatcher.find()) {
                long candidateBytes = parseSizeToBytes(generalSizeMatcher.group(1), generalSizeMatcher.group(2));
                String candidateDisplay = generalSizeMatcher.group(1) + " " + generalSizeMatcher.group(2).toUpperCase(Locale.ROOT);
                if (sizeBytes == 0L || (sizeBytes > MAX_EPISODE_BYTES && candidateBytes > 0L && candidateBytes <= MAX_EPISODE_BYTES)) {
                    sizeBytes = candidateBytes;
                    sizeDisplay = candidateDisplay;
                }
            }
        }

        // 4. HDR / Dolby Vision
        boolean dv = DV_PATTERN.matcher(combined).find();
        boolean hdr10Plus = HDR10_PLUS_PATTERN.matcher(combined).find();
        boolean hdr = hdr10Plus || HDR_PATTERN.matcher(combined).find();
        String hdrLabel;
        if (dv && hdr10Plus) {
            hdrLabel = "DV + HDR10+";
        } else if (dv && hdr) {
            hdrLabel = "DV + HDR";
        } else if (dv) {
            hdrLabel = "DV";
        } else if (hdr10Plus) {
            hdrLabel = "HDR10+";
        } else if (hdr) {
            hdrLabel = "HDR";
        } else {
            hdrLabel = "SDR";
        }

        // 5. Cached debrid check
        boolean hasUncachedMarker = UNCACHED_MARKER_PATTERN.matcher(combined).find();
        boolean hasCachedMarker = CACHED_MARKER_PATTERN.matcher(combined).find();
        boolean hasUrl = stream.url != null && !stream.url.trim().isEmpty();
        String addonContext = (stream.addonName != null ? stream.addonName : "") + " " + (stream.name != null ? stream.name : "");
        boolean fromDebridAddon = DEBRID_ADDON_PATTERN.matcher(addonContext).find();
        boolean cached = !hasUncachedMarker && (hasCachedMarker || (hasUrl && fromDebridAddon));

        // 6. Bad sources check
        Matcher badMatcher = BAD_SOURCE_PATTERN.matcher(combined);
        boolean badSource = false;
        String badSourceLabel = null;
        if (badMatcher.find()) {
            badSource = true;
            badSourceLabel = badMatcher.group(1).toUpperCase(Locale.ROOT);
        }

        // 7. Remux and Codec check
        boolean remux = REMUX_PATTERN.matcher(combined).find();
        String codec = "unknown";
        int codecRank = 0;
        if (AV1_PATTERN.matcher(combined).find()) {
            codec = "AV1";
            codecRank = 2;
        } else if (HEVC_PATTERN.matcher(combined).find()) {
            codec = "HEVC";
            codecRank = 2;
        } else if (H264_PATTERN.matcher(combined).find()) {
            codec = "H264";
            codecRank = 1;
        }

        // 8. Seeders check
        int seeders = 0;
        Matcher seedMatcher = SEEDERS_PATTERN.matcher(combined);
        if (seedMatcher.find()) {
            String numStr = seedMatcher.group(1) != null ? seedMatcher.group(1) : seedMatcher.group(2);
            try {
                seeders = Integer.parseInt(numStr);
            } catch (NumberFormatException ignored) {
                seeders = 0;
            }
        }

        return new ParsedMeta(
                resolution,
                aiUpscale,
                sizeBytes,
                sizeDisplay,
                hdr,
                dv,
                hdrLabel,
                cached,
                badSource,
                badSourceLabel,
                remux,
                codec,
                codecRank,
                seeders
        );
    }

    private static long parseSizeToBytes(String numberStr, String unitRaw) {
        double value;
        try {
            value = Double.parseDouble(numberStr);
        } catch (NumberFormatException e) {
            return 0L;
        }
        String unit = unitRaw.toUpperCase(Locale.ROOT);
        double multiplier;
        if ("TIB".equals(unit)) {
            multiplier = 1024.0 * 1024.0 * 1024.0 * 1024.0;
        } else if ("TB".equals(unit)) {
            multiplier = 1000.0 * 1000.0 * 1000.0 * 1000.0;
        } else if ("GIB".equals(unit)) {
            multiplier = 1024.0 * 1024.0 * 1024.0;
        } else if ("GB".equals(unit)) {
            multiplier = 1000.0 * 1000.0 * 1000.0;
        } else if ("MIB".equals(unit)) {
            multiplier = 1024.0 * 1024.0;
        } else if ("MB".equals(unit)) {
            multiplier = 1000.0 * 1000.0;
        } else if ("KIB".equals(unit)) {
            multiplier = 1024.0;
        } else if ("KB".equals(unit)) {
            multiplier = 1000.0;
        } else {
            multiplier = 1.0;
        }
        return Math.round(value * multiplier);
    }

    /**
     * Computes a composite base-10 long score where every tier strictly dominates lower tiers:
     * - Cached bonus:      +1,000,000,000,000 (10^12)
     * - Resolution:        resolution * 100,000,000 (up to 216,000,000,000; min step = 24,000,000,000)
     * - HDR/DV bonus:      +10,000,000,000 (10^10)
     * - File size (MB):    min(sizeMB, 999,999) * 10,000 (up to 9,999,990,000)
     * - Codec tie-breaker: codecRank * 1,000 (up to 2,000)
     * - Seeders tie-break: min(seeders, 999) (up to 999)
     * - Bad source penalty: -10,000,000,000,000 (-10^13) if fallback bad source
     */
    private static long computeScore(ParsedMeta m) {
        long score = 0L;
        if (m.badSource) {
            score -= 10_000_000_000_000L;
        }
        if (m.cached) {
            score += 1_000_000_000_000L;
        }
        score += (long) m.resolution * 100_000_000L;
        if (m.hdr || m.dolbyVision) {
            score += 10_000_000_000L;
        }
        long sizeMb = Math.min(m.sizeBytes / 1_000_000L, 999_999L);
        score += sizeMb * 10_000L;
        score += (long) m.codecRank * 1_000L;
        score += Math.min(m.seeders, 999);
        return score;
    }

    private static String buildReason(
            Candidate current,
            Candidate comparison,
            boolean isWinner,
            boolean allUncached,
            boolean onlyBadSources,
            boolean isMovie) {

        ParsedMeta m = current.meta;
        List<String> parts = new ArrayList<String>();

        if (onlyBadSources && m.badSource) {
            parts.add("fallback bad source (" + m.badSourceLabel + " - no clean sources available)");
        }

        if (m.cached) {
            parts.add("cached");
        } else if (allUncached) {
            parts.add("uncached (all streams uncached)");
        } else {
            parts.add("uncached");
        }

        if (m.aiUpscale) {
            parts.add("4K AI Upscale (counts as 2160p)");
        } else if (m.resolution == 2160) {
            parts.add("4K (2160p)");
        } else if (m.resolution > 0) {
            parts.add(m.resolution + "p");
        } else {
            parts.add("unknown res");
        }

        parts.add(m.hdrLabel);

        if (m.remux) {
            parts.add("REMUX");
        }

        parts.add(m.sizeDisplay);

        if (current.oversize) {
            parts.add("over 25 GB");
        }
        if (current.multi) {
            parts.add("pack or multi-episode");
        }

        if (!"unknown".equals(m.codec)) {
            parts.add(m.codec);
        }

        if (m.seeders > 0) {
            parts.add(m.seeders + " seeds");
        }

        String summary = join(parts, ", ");

        if (comparison == null) {
            return summary + " - wins as only valid stream";
        }

        ParsedMeta other = comparison.meta;
        boolean curHdr = m.hdr || m.dolbyVision;
        boolean othHdr = other.hdr || other.dolbyVision;

        if (isWinner) {
            if (m.cached != other.cached) {
                return summary + " - wins: cached/instant-play beats uncached";
            }
            if (current.oversize != comparison.oversize) {
                return summary + " - wins: the other stream is over 25 GB";
            }
            if (current.multi != comparison.multi) {
                return summary + " - wins: single-episode file beats a pack";
            }
            if (m.resolution != other.resolution) {
                if (m.aiUpscale && m.sizeBytes < other.sizeBytes) {
                    return summary + " - wins: 4K AI Upscale beats " + other.resolution + "p despite smaller file size";
                }
                return summary + " - wins: higher resolution (" + m.resolution + "p beats " + other.resolution + "p)";
            }
            if (curHdr != othHdr) {
                return summary + " - wins: " + m.hdrLabel + " beats SDR at " + m.resolution + "p despite smaller/different size";
            }
            if (m.sizeBytes != other.sizeBytes) {
                return summary + " - wins: largest file (" + m.sizeDisplay + " vs " + other.sizeDisplay + ")"
                        + (isMovie && m.remux ? " for highest-bitrate movie REMUX" : "");
            }
            if (m.codecRank != other.codecRank) {
                return summary + " - wins tie-breaker: preferred codec (" + m.codec + ")";
            }
            if (m.seeders != other.seeders) {
                return summary + " - wins tie-breaker: more seeders (" + m.seeders + " vs " + other.seeders + ")";
            }
            return summary + " - tied for best";
        } else {
            if (m.cached != other.cached) {
                return summary + " - ranked lower: uncached vs winner's cached stream";
            }
            if (m.resolution != other.resolution) {
                return summary + " - ranked lower: " + m.resolution + "p loses to winner's 2160p/4K";
            }
            if (curHdr != othHdr) {
                return summary + " - ranked lower: SDR loses to winner's " + other.hdrLabel + " at same resolution";
            }
            if (m.sizeBytes != other.sizeBytes) {
                return summary + " - ranked lower: smaller file (" + m.sizeDisplay + " vs winner's " + other.sizeDisplay + ")";
            }
            return summary;
        }
    }

    private static String join(List<String> items, String delimiter) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < items.size(); i++) {
            if (i > 0) {
                sb.append(delimiter);
            }
            sb.append(items.get(i));
        }
        return sb.toString();
    }

    private static final class Candidate {
        final Stream stream;
        final ParsedMeta meta;
        final long score;
        boolean multi;
        boolean oversize;

        Candidate(Stream stream, ParsedMeta meta, long score) {
            this.stream = stream;
            this.meta = meta;
            this.score = score;
        }
    }
}

