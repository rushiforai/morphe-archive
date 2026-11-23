package app.voidhack.extension.applemusic.lyrics;

import java.text.Normalizer;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

final class LrclibMatcher {
    private static final Pattern FEAT_PATTERN = Pattern.compile(
            "(?i)\\s*[\\(\\[【（「](?:feat\\.?|ft\\.?|featuring|with)\\s+[^\\)\\]】）」]*[\\)\\]】）」]");
    private static final Pattern EDITION_BRACKET = Pattern.compile(
            "(?i)\\s*[\\(\\[【（「][^\\)\\]】）」]*(?:remaster|deluxe|anniversary|radio edit|single version|album version|bonus track|explicit|clean|version|ver\\.?|edit|mono|stereo|mix|mastered|from\\s+\"|original\\s+motion\\s+picture)[^\\)\\]】）」]*[\\)\\]】）」]");
    private static final Pattern EDITION_DASH = Pattern.compile(
            "(?i)\\s+[-–—]\\s+(?:(?:\\d{4}\\s+)?remaster(?:ed)?|single(?:\\s+version)?|album\\s+version|radio\\s+edit|deluxe.*|live.*|acoustic.*|instrumental.*|from\\s+.*)$");
    private static final Pattern NON_ALNUM = Pattern.compile("[^\\p{L}\\p{N}\\s]+");
    private static final Pattern MULTI_SPACE = Pattern.compile("\\s+");
    private static final Pattern ARTIST_SPLIT = Pattern.compile("(?i)\\s*(?:,|&|/|\\bx\\b|\\bfeat\\.?\\b|\\bft\\.?\\b|\\bfeaturing\\b|、|・)\\s*");

    private LrclibMatcher() {}

    static String normalize(String input) {
        if (input == null) return "";
        String value = Normalizer.normalize(input, Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);
        value = NON_ALNUM.matcher(value).replaceAll(" ");
        return MULTI_SPACE.matcher(value).replaceAll(" ").trim();
    }

    static String stripEditions(String title) {
        if (title == null) return "";
        String value = Normalizer.normalize(title, Normalizer.Form.NFKC).trim();
        value = FEAT_PATTERN.matcher(value).replaceAll("");
        value = EDITION_BRACKET.matcher(value).replaceAll("");
        value = EDITION_DASH.matcher(value).replaceAll("");
        return MULTI_SPACE.matcher(value).replaceAll(" ").trim();
    }

    static String primaryArtist(String artist) {
        if (artist == null) return "";
        String value = Normalizer.normalize(artist, Normalizer.Form.NFKC).trim();
        String[] parts = ARTIST_SPLIT.split(value);
        for (String part : parts) {
            String trimmed = part.trim();
            if (!trimmed.isEmpty()) return trimmed;
        }
        return value;
    }

    static LrclibModels.SearchSummary pickBest(
            LrclibModels.TrackQuery query,
            List<LrclibModels.SearchSummary> candidates,
            boolean requireSynced,
            boolean preferWordSync,
            boolean allowPlain) {
        if (query == null || candidates == null || candidates.isEmpty()) return null;
        LrclibModels.SearchSummary best = null;
        double bestScore = Double.NEGATIVE_INFINITY;
        for (LrclibModels.SearchSummary candidate : candidates) {
            double score = scoreCandidate(query, candidate, requireSynced, preferWordSync, allowPlain);
            if (score > bestScore) {
                bestScore = score;
                best = candidate;
            }
        }
        return bestScore >= 40.0 ? best : null;
    }

    static double scoreCandidate(
            LrclibModels.TrackQuery query,
            LrclibModels.SearchSummary candidate,
            boolean requireSynced,
            boolean preferWordSync,
            boolean allowPlain) {
        if (candidate == null) return -1000.0;
        if (candidate.instrumental) {
            // Never prefer instrumental over real lyrics, and never override unsynced official with instrumental.
            if (requireSynced) return -1000.0;
            return -500.0;
        }
        boolean hasSynced = candidate.hasSyncedLyrics || candidate.hasWordSync;
        if (requireSynced && !hasSynced) return -1000.0;
        if (!hasSynced && (!allowPlain || !candidate.hasPlainLyrics)) return -1000.0;

        String qTitle = normalize(query.title);
        String qCleanTitle = normalize(stripEditions(query.title));
        String cTitle = normalize(candidate.trackName);
        String cCleanTitle = normalize(stripEditions(candidate.trackName));

        double titleScore = Math.max(
                textSimilarity(qTitle, cTitle),
                textSimilarity(qCleanTitle, cCleanTitle) * 0.96
        );
        if (titleScore < 0.35) return -1000.0;

        String qArtist = normalize(query.artist);
        String qPrimaryArtist = normalize(primaryArtist(query.artist));
        String cArtist = normalize(candidate.artistName);
        String cPrimaryArtist = normalize(primaryArtist(candidate.artistName));

        double artistScore = 0.5;
        if (!qArtist.isEmpty() && !cArtist.isEmpty()) {
            artistScore = Math.max(
                    textSimilarity(qArtist, cArtist),
                    Math.max(
                            textSimilarity(qPrimaryArtist, cPrimaryArtist) * 0.95,
                            containsArtist(qArtist, cArtist) ? 0.82 : 0.0
                    )
            );
            if (artistScore < 0.25) return -1000.0;
        }

        double score = titleScore * 55.0 + artistScore * 35.0;

        // Album bonus (helpful tie-breaker, never a penalty since singles/compilations differ).
        String qAlbum = normalize(stripEditions(query.album));
        String cAlbum = normalize(stripEditions(candidate.albumName));
        if (!qAlbum.isEmpty() && !cAlbum.isEmpty()) {
            score += textSimilarity(qAlbum, cAlbum) * 10.0;
        }

        // Duration check: crucial for synced lyrics alignment.
        if (query.durationSec > 0 && candidate.duration > 0.5) {
            double diff = Math.abs(query.durationSec - candidate.duration);
            if (diff <= 2.0) {
                score += 28.0;
            } else if (diff <= 5.0) {
                score += 18.0;
            } else if (diff <= 10.0) {
                score += 6.0;
            } else if (diff <= 20.0) {
                score -= hasSynced ? 12.0 : 4.0;
            } else if (hasSynced && diff > 25.0) {
                return -1000.0;
            } else {
                score -= 20.0;
            }
        }

        // Lyrics timing quality preference.
        if (preferWordSync && candidate.hasWordSync) {
            score += 20.0;
        } else if (hasSynced) {
            score += 14.0;
        } else if (candidate.hasPlainLyrics) {
            score += 2.0;
        }

        // Penalize mismatched live/instrumental/remix tags when query didn't ask for them.
        if (hasVariantMismatch(qTitle, cTitle)) {
            score -= 25.0;
        }

        return score;
    }

    private static boolean hasVariantMismatch(String qTitle, String cTitle) {
        String[] markers = {"inst", "instrumental", "off vocal", "karaoke", "live", "remix", "sped up", "slowed", "nightcore", "tv size"};
        for (String marker : markers) {
            boolean qHas = containsTokenOrPhrase(qTitle, marker);
            boolean cHas = containsTokenOrPhrase(cTitle, marker);
            if (qHas != cHas) return true;
        }
        return false;
    }

    private static boolean containsTokenOrPhrase(String normalized, String marker) {
        if (normalized.isEmpty()) return false;
        if (normalized.equals(marker)) return true;
        return normalized.contains(" " + marker + " ")
                || normalized.startsWith(marker + " ")
                || normalized.endsWith(" " + marker);
    }

    private static boolean containsArtist(String a, String b) {
        if (a.length() < 2 || b.length() < 2) return false;
        return a.contains(b) || b.contains(a);
    }

    static double textSimilarity(String a, String b) {
        if (a == null || b == null || a.isEmpty() || b.isEmpty()) return 0.0;
        if (a.equals(b)) return 1.0;
        String compactA = a.replace(" ", "");
        String compactB = b.replace(" ", "");
        if (compactA.equals(compactB)) return 0.98;
        if (compactA.length() >= 3 && compactB.length() >= 3) {
            if (compactA.contains(compactB) || compactB.contains(compactA)) {
                double ratio = (double) Math.min(compactA.length(), compactB.length())
                        / Math.max(compactA.length(), compactB.length());
                return Math.max(0.55, 0.50 + ratio * 0.45);
            }
        }
        Set<String> tokensA = tokenize(a);
        Set<String> tokensB = tokenize(b);
        if (!tokensA.isEmpty() && !tokensB.isEmpty()) {
            int overlap = 0;
            for (String t : tokensA) {
                if (tokensB.contains(t)) overlap++;
            }
            double jaccard = (double) overlap / (tokensA.size() + tokensB.size() - overlap);
            if (jaccard > 0.0) {
                return Math.max(jaccard, bigramDice(compactA, compactB));
            }
        }
        return bigramDice(compactA, compactB);
    }

    private static Set<String> tokenize(String s) {
        Set<String> tokens = new HashSet<>();
        for (String part : s.split(" ")) {
            if (!part.isEmpty()) tokens.add(part);
        }
        return tokens;
    }

    private static double bigramDice(String a, String b) {
        if (a.length() < 2 || b.length() < 2) {
            return a.equals(b) ? 1.0 : 0.0;
        }
        Set<String> setA = new HashSet<>();
        for (int i = 0; i < a.length() - 1; i++) setA.add(a.substring(i, i + 2));
        Set<String> setB = new HashSet<>();
        for (int i = 0; i < b.length() - 1; i++) setB.add(b.substring(i, i + 2));
        int intersection = 0;
        for (String bg : setA) {
            if (setB.contains(bg)) intersection++;
        }
        return (2.0 * intersection) / (setA.size() + setB.size());
    }

    /**
     * Parses HTTP Retry-After (seconds) and adds up to 30% jitter per LRCLIB docs.
     *
     * @param headerValue    Retry-After header string
     * @param randomFraction value in [0.0, 1.0]
     * @return wait time in milliseconds (minimum 1000ms on invalid/missing value)
     */
    static long parseRetryAfterMillis(String headerValue, double randomFraction) {
        long baseSeconds = 1L;
        if (headerValue != null) {
            String trimmed = headerValue.trim();
            if (!trimmed.isEmpty()) {
                try {
                    long parsed = Long.parseLong(trimmed);
                    if (parsed > 0L) baseSeconds = Math.min(parsed, 300L);
                } catch (NumberFormatException ignored) {
                    // Fallback to 1 second if HTTP-date or non-integer
                }
            }
        }
        double clampedRandom = Math.max(0.0, Math.min(1.0, randomFraction));
        long baseMs = baseSeconds * 1000L;
        long jitterMs = Math.round(baseMs * 0.30 * clampedRandom);
        return baseMs + jitterMs;
    }
}
