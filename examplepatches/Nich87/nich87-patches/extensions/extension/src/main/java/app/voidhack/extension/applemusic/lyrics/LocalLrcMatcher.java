package app.voidhack.extension.applemusic.lyrics;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Pure Java matcher for matching playing Apple Music tracks against local .lrc files
 * by filename, parent directory structure, and LRC metadata tags ([ti:], [ar:], [al:], [length:]).
 */
final class LocalLrcMatcher {
    static final double MIN_MATCH_SCORE = 52.0;

    private static final Pattern TRACK_NUMBER_PREFIX = Pattern.compile(
            "^(?:\\(?\\d{1,2}(?:-\\d{1,2})?\\)?\\s*(?:\\.\\s*|\\s*-\\s+|\\s*_\\s*|\\)\\s*|\\s+))(?=.+)");
    private static final Pattern DASH_SEPARATOR = Pattern.compile("\\s+[-–—]\\s+");

    private LocalLrcMatcher() {}

    static final class FolderEntry {
        final String docId;
        final String fileName;
        final String parentDir;
        final String grandParentDir;
        final long lastModified;
        final long size;

        FolderEntry(
                String docId,
                String fileName,
                String parentDir,
                String grandParentDir,
                long lastModified,
                long size) {
            this.docId = docId == null ? "" : docId;
            this.fileName = fileName == null ? "" : fileName;
            this.parentDir = parentDir == null ? "" : parentDir;
            this.grandParentDir = grandParentDir == null ? "" : grandParentDir;
            this.lastModified = lastModified;
            this.size = size;
        }
    }

    static final class ScoredEntry {
        final FolderEntry entry;
        final double score;

        ScoredEntry(FolderEntry entry, double score) {
            this.entry = entry;
            this.score = score;
        }
    }

    static boolean isSupportedFolderFile(String fileName) {
        if (fileName == null) return false;
        String trimmed = fileName.trim();
        if (trimmed.isEmpty() || trimmed.startsWith(".")) return false;
        return trimmed.toLowerCase(Locale.ROOT).endsWith(".lrc");
    }

    static String fileStem(String fileName) {
        if (fileName == null) return "";
        String trimmed = fileName.trim();
        int dot = trimmed.lastIndexOf('.');
        return dot > 0 ? trimmed.substring(0, dot).trim() : trimmed;
    }

    static String stripTrackNumberPrefix(String stem) {
        if (stem == null) return "";
        String trimmed = stem.trim();
        Matcher m = TRACK_NUMBER_PREFIX.matcher(trimmed);
        if (m.find()) {
            String rest = trimmed.substring(m.end()).trim();
            // Do not strip numeric prefixes if the remainder is too short or purely numeric,
            // or if the original looks like a year title such as "1999" (which already fails \d{1,2}).
            if (!rest.isEmpty() && !rest.matches("^\\d+$")) {
                return rest;
            }
        }
        return trimmed;
    }

    static List<ScoredEntry> shortlistByFilename(
            LrclibModels.TrackQuery query,
            List<FolderEntry> entries,
            int maxResults) {
        if (query == null || entries == null || entries.isEmpty() || maxResults <= 0) {
            return Collections.emptyList();
        }
        List<ScoredEntry> scored = new ArrayList<>();
        for (FolderEntry entry : entries) {
            double score = scoreFilename(query, entry);
            if (score >= MIN_MATCH_SCORE) {
                scored.add(new ScoredEntry(entry, score));
            }
        }
        if (scored.isEmpty()) return Collections.emptyList();
        Collections.sort(scored, new Comparator<ScoredEntry>() {
            @Override
            public int compare(ScoredEntry a, ScoredEntry b) {
                return Double.compare(b.score, a.score);
            }
        });
        return scored.size() > maxResults ? scored.subList(0, maxResults) : scored;
    }

    static double scoreFilename(LrclibModels.TrackQuery query, FolderEntry entry) {
        if (query == null || entry == null || entry.fileName.isEmpty()) return -1000.0;
        String stem = fileStem(entry.fileName);
        if (stem.isEmpty()) return -1000.0;

        // Exact ID filename match (e.g. "<adamId>.lrc" or "<trackKey>.lrc")
        if (!query.trackKey.isEmpty() && stem.equalsIgnoreCase(query.trackKey)) {
            return 200.0;
        }
        if (query.adamId > 0L && stem.equals(Long.toString(query.adamId))) {
            return 200.0;
        }

        String qTitle = LrclibMatcher.normalize(query.title);
        if (qTitle.isEmpty()) return -1000.0;
        String qCleanTitle = LrclibMatcher.normalize(LrclibMatcher.stripEditions(query.title));
        String qArtist = LrclibMatcher.normalize(query.artist);
        String qPrimaryArtist = LrclibMatcher.normalize(LrclibMatcher.primaryArtist(query.artist));
        String qAlbum = LrclibMatcher.normalize(LrclibMatcher.stripEditions(query.album));

        String strippedStem = stripTrackNumberPrefix(stem);
        double best = -1000.0;

        // 1. Try separated filename formats: "Artist - Title", "Title - Artist", "Artist - Album - Title".
        String[] parts = DASH_SEPARATOR.split(strippedStem);
        if (parts.length == 2) {
            String left = stripTrackNumberPrefix(parts[0]);
            String right = stripTrackNumberPrefix(parts[1]);
            best = Math.max(best, scoreNameParts(
                    qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                    right, left, entry.parentDir, true));
            best = Math.max(best, scoreNameParts(
                    qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                    left, right, entry.parentDir, true) - 2.0);
        } else if (parts.length >= 3) {
            String first = stripTrackNumberPrefix(parts[0]);
            String last = stripTrackNumberPrefix(parts[parts.length - 1]);
            String middle = parts[1];
            // e.g. "Artist - Album - Title" or "01 - Artist - Title"
            best = Math.max(best, scoreNameParts(
                    qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                    last, first, middle, true));
            // Also try joining tail as title in case title itself contains " - "
            String tailFromSecond = stripTrackNumberPrefix(strippedStem.substring(strippedStem.indexOf(parts[1])));
            best = Math.max(best, scoreNameParts(
                    qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                    tailFromSecond, first, entry.parentDir, true));
            // Also try "Title - Sub - Artist"
            best = Math.max(best, scoreNameParts(
                    qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                    first, last, middle, true) - 3.0);
        } else {
            // Also try compact single "-" or "_" separator (e.g. "Artist-Title.lrc" or "Artist_Title.lrc").
            for (char sep : new char[]{'-', '_'}) {
                int idx = strippedStem.indexOf(sep);
                if (idx > 0 && idx == strippedStem.lastIndexOf(sep) && idx + 1 < strippedStem.length()) {
                    String left = stripTrackNumberPrefix(strippedStem.substring(0, idx).trim());
                    String right = stripTrackNumberPrefix(strippedStem.substring(idx + 1).trim());
                    best = Math.max(best, scoreNameParts(
                            qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                            right, left, entry.parentDir, true));
                    best = Math.max(best, scoreNameParts(
                            qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                            left, right, entry.parentDir, true) - 2.0);
                }
            }
        }

        // 2. Try whole stem (and track-number-stripped stem) as title with directory context.
        double dirCandidateA = scoreWithDirectoryHints(
                qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                strippedStem, entry.parentDir, entry.grandParentDir);
        best = Math.max(best, dirCandidateA);

        if (!strippedStem.equals(stem)) {
            double dirCandidateB = scoreWithDirectoryHints(
                    qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                    stem, entry.parentDir, entry.grandParentDir);
            best = Math.max(best, dirCandidateB);
        }

        return best;
    }

    static double scoreWithMetadata(
            LrclibModels.TrackQuery query,
            FolderEntry entry,
            LocalLrcParser.LrcMetadata meta,
            boolean requireSynced) {
        if (query == null || entry == null || meta == null) return -1000.0;
        if (requireSynced && !meta.hasSyncedTimestamps) return -1000.0;

        double filenameScore = scoreFilename(query, entry);
        double tagScore = scoreTags(query, meta);

        // If the file itself declares an [ar:] tag and it clearly contradicts the playing artist, reject it
        // (unless the file was explicitly matched by Apple Music ID filename).
        if (filenameScore < 190.0 && !meta.artist.isEmpty() && !query.artist.isEmpty()) {
            double tagArtistSim = artistSimilarity(
                    LrclibMatcher.normalize(query.artist),
                    LrclibMatcher.normalize(LrclibMatcher.primaryArtist(query.artist)),
                    meta.artist);
            if (tagArtistSim < 0.35) {
                return -1000.0;
            }
        }
        // Similarly, if [ti:] tag clearly contradicts the playing title, reject filename-only false match.
        if (filenameScore < 190.0 && !meta.title.isEmpty() && !query.title.isEmpty()) {
            double tagTitleSim = titleSimilarity(
                    LrclibMatcher.normalize(query.title),
                    LrclibMatcher.normalize(LrclibMatcher.stripEditions(query.title)),
                    meta.title);
            if (tagTitleSim < 0.45) {
                return -1000.0;
            }
        }

        double combined;
        if (filenameScore >= MIN_MATCH_SCORE && tagScore >= MIN_MATCH_SCORE) {
            combined = Math.max(filenameScore, tagScore) + 12.0;
        } else {
            combined = Math.max(filenameScore, tagScore);
        }
        if (combined < MIN_MATCH_SCORE) return -1000.0;

        // Duration verification bonus/penalty from [length:] tag when present.
        if (query.durationSec > 0 && meta.durationSec > 0) {
            int diff = Math.abs(query.durationSec - meta.durationSec);
            if (diff <= 3) {
                combined += 14.0;
            } else if (diff <= 8) {
                combined += 6.0;
            } else if (diff > 25 && meta.hasSyncedTimestamps) {
                combined -= 25.0;
            }
        }

        // Prefer synced local LRC over unsynced local LRC when both match the same song.
        if (meta.hasSyncedTimestamps) {
            combined += 15.0;
        }

        return combined;
    }

    private static double scoreTags(LrclibModels.TrackQuery query, LocalLrcParser.LrcMetadata meta) {
        if (meta == null || meta.title.isEmpty()) return -1000.0;
        String qTitle = LrclibMatcher.normalize(query.title);
        if (qTitle.isEmpty()) return -1000.0;
        String qCleanTitle = LrclibMatcher.normalize(LrclibMatcher.stripEditions(query.title));
        String qArtist = LrclibMatcher.normalize(query.artist);
        String qPrimaryArtist = LrclibMatcher.normalize(LrclibMatcher.primaryArtist(query.artist));
        String qAlbum = LrclibMatcher.normalize(LrclibMatcher.stripEditions(query.album));

        return scoreNameParts(
                qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                meta.title, meta.artist, meta.album, !meta.artist.isEmpty());
    }

    private static double scoreWithDirectoryHints(
            String qTitle,
            String qCleanTitle,
            String qArtist,
            String qPrimaryArtist,
            String qAlbum,
            String candidateTitle,
            String parentDir,
            String grandParentDir) {
        double best = scoreNameParts(
                qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                candidateTitle, "", "", false);

        if (!parentDir.isEmpty()) {
            // Pattern: Artist/Title.lrc
            double parentAsArtist = scoreNameParts(
                    qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                    candidateTitle, parentDir, "", false);
            best = Math.max(best, parentAsArtist);

            // Pattern: Album/Title.lrc
            double parentAsAlbum = scoreNameParts(
                    qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                    candidateTitle, "", parentDir, false);
            best = Math.max(best, parentAsAlbum);
        }

        if (!grandParentDir.isEmpty()) {
            // Pattern: Artist/Album/Title.lrc
            double hierarchy = scoreNameParts(
                    qTitle, qCleanTitle, qArtist, qPrimaryArtist, qAlbum,
                    candidateTitle, grandParentDir, parentDir, false);
            best = Math.max(best, hierarchy);
        }
        return best;
    }

    private static double scoreNameParts(
            String qTitle,
            String qCleanTitle,
            String qArtist,
            String qPrimaryArtist,
            String qAlbum,
            String rawTitle,
            String rawArtist,
            String rawAlbum,
            boolean strictArtistMismatch) {
        String cTitle = LrclibMatcher.normalize(rawTitle);
        if (cTitle.isEmpty()) return -1000.0;

        double titleScore = titleSimilarity(qTitle, qCleanTitle, rawTitle);
        boolean variantMismatch = LrclibMatcher.hasVariantMismatch(qTitle, cTitle);

        String cArtist = LrclibMatcher.normalize(rawArtist);
        boolean hasArtistContext = !cArtist.isEmpty() && !qArtist.isEmpty();

        double artistScore = 0.0;
        if (hasArtistContext) {
            artistScore = artistSimilarity(qArtist, qPrimaryArtist, rawArtist);
            if (strictArtistMismatch && artistScore < 0.45) {
                return -1000.0;
            }
        }

        double albumBonus = 0.0;
        if (!qAlbum.isEmpty() && rawAlbum != null && !rawAlbum.isEmpty()) {
            String cAlbum = LrclibMatcher.normalize(LrclibMatcher.stripEditions(rawAlbum));
            if (!cAlbum.isEmpty()) {
                double sim = LrclibMatcher.textSimilarity(qAlbum, cAlbum);
                if (sim >= 0.70) {
                    albumBonus = sim * 10.0;
                }
            }
        }

        if (hasArtistContext && artistScore >= 0.55) {
            if (titleScore < 0.70) return -1000.0;
            double score = titleScore * 65.0 + artistScore * 35.0 + albumBonus;
            if (variantMismatch) score -= 28.0;
            return score;
        }

        // Title-only match (e.g. "Title.lrc" in flat folder, or parent folder is album/misc).
        if (titleScore < 0.88 || variantMismatch) return -1000.0;
        return titleScore * 62.0 + albumBonus;
    }

    private static double titleSimilarity(String qTitle, String qCleanTitle, String rawCandidateTitle) {
        String cTitle = LrclibMatcher.normalize(rawCandidateTitle);
        String cCleanTitle = LrclibMatcher.normalize(LrclibMatcher.stripEditions(rawCandidateTitle));
        double direct = LrclibMatcher.textSimilarity(qTitle, cTitle);
        double clean = (!qCleanTitle.isEmpty() && !cCleanTitle.isEmpty())
                ? LrclibMatcher.textSimilarity(qCleanTitle, cCleanTitle) * 0.96
                : 0.0;
        return Math.max(direct, clean);
    }

    private static double artistSimilarity(String qArtist, String qPrimaryArtist, String rawCandidateArtist) {
        String cArtist = LrclibMatcher.normalize(rawCandidateArtist);
        if (cArtist.isEmpty() || qArtist.isEmpty()) return 0.0;
        String cPrimaryArtist = LrclibMatcher.normalize(LrclibMatcher.primaryArtist(rawCandidateArtist));
        double direct = LrclibMatcher.textSimilarity(qArtist, cArtist);
        double primary = LrclibMatcher.textSimilarity(qPrimaryArtist, cPrimaryArtist) * 0.95;
        double contains = (qArtist.length() >= 2 && cArtist.length() >= 2
                && (qArtist.contains(cArtist) || cArtist.contains(qArtist))) ? 0.82 : 0.0;
        return Math.max(direct, Math.max(primary, contains));
    }
}
