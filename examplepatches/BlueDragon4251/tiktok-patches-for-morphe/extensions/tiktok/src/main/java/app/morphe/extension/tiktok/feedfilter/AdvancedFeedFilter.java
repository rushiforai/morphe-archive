package app.morphe.extension.tiktok.feedfilter;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.AdvancedFeedSettings;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.AwemeStatistics;
import com.ss.android.ugc.aweme.feed.model.FeedItemList;
import com.ss.android.ugc.aweme.follow.presenter.FollowFeed;
import com.ss.android.ugc.aweme.follow.presenter.FollowFeedList;

/**
 * BlueIT advanced feed filtering. All reflective metadata rules are fail-open:
 * missing/renamed TikTok data never causes a video to be hidden.
 */
public final class AdvancedFeedFilter {
    private static volatile String cachedKeywordsSource = "";
    private static volatile String[] cachedKeywords = new String[0];
    private static volatile String cachedCreatorsSource = "";
    private static volatile String[] cachedCreators = new String[0];
    private static volatile String cachedSoundsSource = "";
    private static volatile String[] cachedSounds = new String[0];
    private static volatile String cachedDurationSource = "";
    private static volatile Range cachedDuration = new Range(0L, Long.MAX_VALUE);

    private AdvancedFeedFilter() {
    }

    public static void filter(FeedItemList feedItemList) {
        if (feedItemList == null || feedItemList.items == null) return;
        filterList(feedItemList.items, source -> source instanceof Aweme ? (Aweme) source : null);
    }

    public static void filter(FollowFeedList followFeedList) {
        if (followFeedList == null || followFeedList.mItems == null) return;
        filterList(
                followFeedList.mItems,
                source -> source instanceof FollowFeed ? ((FollowFeed) source).aweme : null
        );
    }

    public static void filterFinal(FollowFeedList followFeedList) {
        filter(followFeedList);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static void filterList(List list, AwemeExtractor extractor) {
        if (!hasActiveRule() || list.isEmpty()) return;

        List snapshot = new ArrayList(list);
        List kept = new ArrayList(snapshot.size());
        int removed = 0;
        Object quantitativeFallback = null;
        String quantitativeFallbackAid = null;
        String quantitativeFallbackReason = null;
        double quantitativeFallbackDistance = Double.POSITIVE_INFINITY;
        Range activeDurationRange = durationRange();
        int activeMaxViewsPerLike = Settings.MAX_VIEWS_PER_LIKE.get();

        for (Object container : snapshot) {
            Aweme aweme = extractor.extract(container);
            String reason = reason(aweme);
            if (reason == null) {
                kept.add(container);
                continue;
            }

            removed++;
            double distance = Double.POSITIVE_INFINITY;
            if ("duration".equals(reason)) {
                long durationMs = durationMilliseconds(aweme);
                long distanceMs = durationDistanceToRange(durationMs, activeDurationRange);
                if (durationMs >= 0L && distanceMs != Long.MAX_VALUE) {
                    distance = distanceMs / 1000.0d;
                }
            } else if ("like_view_ratio".equals(reason)) {
                distance = viewsPerLikeDistanceToMaximum(aweme, activeMaxViewsPerLike);
            }

            // Hard content rules are evaluated before the quantitative rules in reason().
            // Therefore an item that reaches a duration/ratio reason is guaranteed not to
            // match AI/keyword/creator/sound/promotional/live blocking and is safe as the
            // single anti-empty-page fallback candidate.
            if (!Double.isInfinite(distance) && distance < quantitativeFallbackDistance) {
                quantitativeFallback = container;
                quantitativeFallbackAid = safeAid(aweme);
                quantitativeFallbackReason = reason;
                quantitativeFallbackDistance = distance;
            }

            if (BaseSettings.DEBUG.get()) {
                String aid = safeAid(aweme);
                Logger.printInfo(() -> "[BlueIT AdvancedFeed] aid=" + aid + " filtered=" + reason);
            }
        }

        // TikTok 46.4.3 treats an empty FYP page as a feed failure instead of simply
        // requesting the next page. Quantitative quality rules (duration and maximum
        // views per like) can legitimately reject every otherwise-allowed non-ad item.
        // Retain exactly one such candidate closest to its threshold. Hard blocked
        // content can never become this fallback because those rules run first.
        if (kept.isEmpty() && removed > 0 && quantitativeFallback != null) {
            kept.add(quantitativeFallback);
            if (BaseSettings.DEBUG.get()) {
                String aid = quantitativeFallbackAid;
                String fallbackReason = quantitativeFallbackReason;
                double distance = quantitativeFallbackDistance;
                Logger.printInfo(() -> "[BlueIT AdvancedFeed] retained quantitative fallback aid="
                        + aid + " reason=" + fallbackReason + " distance=" + distance);
            }
        }

        if (removed > 0) {
            list.clear();
            list.addAll(kept);
        }
    }

    private static boolean hasActiveRule() {
        return Settings.HIDE_PROMOTIONAL_MUSIC.get()
                || Settings.HIDE_LIVE_REPLAYS.get()
                || Settings.HIDE_AI_GENERATED_CONTENT.get()
                || Settings.MAX_VIEWS_PER_LIKE.get() > 0
                || terms(AdvancedFeedSettings.BLOCKED_KEYWORDS.get(), TermKind.KEYWORD).length > 0
                || terms(AdvancedFeedSettings.BLOCKED_CREATORS.get(), TermKind.CREATOR).length > 0
                || terms(AdvancedFeedSettings.BLOCKED_SOUNDS.get(), TermKind.SOUND).length > 0
                || !durationRange().isUnbounded();
    }

    private static String reason(Aweme aweme) {
        if (aweme == null) return null;

        // Hard content rules always run before quantitative rules. This ordering makes
        // the anti-empty-page fallback unable to restore explicitly blocked content.
        try {
            if (Settings.HIDE_PROMOTIONAL_MUSIC.get() && aweme.isWithPromotionalMusic()) {
                return "promotional_music";
            }
        } catch (Throwable ignored) {
        }
        try {
            if (Settings.HIDE_LIVE_REPLAYS.get() && aweme.isLiveReplay()) {
                return "live_replay";
            }
        } catch (Throwable ignored) {
        }
        if (Settings.HIDE_AI_GENERATED_CONTENT.get() && isAiGeneratedContent(aweme)) {
            return "ai_generated";
        }

        String[] keywords = terms(AdvancedFeedSettings.BLOCKED_KEYWORDS.get(), TermKind.KEYWORD);
        if (keywords.length > 0) {
            String corpus = keywordCorpus(aweme);
            if (containsAny(corpus, keywords)) return "keyword";
        }

        String[] creators = terms(AdvancedFeedSettings.BLOCKED_CREATORS.get(), TermKind.CREATOR);
        if (creators.length > 0) {
            String corpus = creatorCorpus(aweme);
            if (matchesIdentity(corpus, creators)) return "creator";
        }

        String[] sounds = terms(AdvancedFeedSettings.BLOCKED_SOUNDS.get(), TermKind.SOUND);
        if (sounds.length > 0) {
            String corpus = soundCorpus(aweme);
            if (containsAny(corpus, sounds)) return "sound";
        }

        int maxViewsPerLike = Settings.MAX_VIEWS_PER_LIKE.get();
        if (maxViewsPerLike > 0) {
            double ratio = viewsPerLike(aweme);
            if (ratio >= 0.0d && ratio > maxViewsPerLike) {
                return "like_view_ratio";
            }
        }

        Range duration = durationRange();
        if (!duration.isUnbounded()) {
            long durationMs = durationMilliseconds(aweme);
            if (durationMs >= 0L) {
                long minMs = secondsToMilliseconds(duration.min);
                long maxMs = duration.max == Long.MAX_VALUE
                        ? Long.MAX_VALUE
                        : secondsToMilliseconds(duration.max);
                if (durationMs < minMs || durationMs > maxMs) {
                    return "duration";
                }
            }
        }

        return null;
    }

    /**
     * TikTok exposes its own AIGC metadata in feed responses. This deliberately uses
     * multiple known Java-shape variants because model field access changes across
     * TikTok releases while the server concept remains aigc_info/created_by_ai and an
     * AIGC label type. Missing metadata is fail-open: BlueIT never guesses AI content
     * from captions, creators, sounds, or visual heuristics.
     */
    private static boolean isAiGeneratedContent(Aweme aweme) {
        if (aweme == null) return false;

        if (anyTruthy(
                invoke(aweme, "isAigc"),
                invoke(aweme, "getIsAigc"),
                invoke(aweme, "isAiGenerated"),
                invoke(aweme, "getAiGenerated"),
                readField(aweme, "isAigc"),
                readField(aweme, "aigc"),
                readField(aweme, "aiGenerated")
        )) {
            return true;
        }

        if (anyPositiveNumber(
                invoke(aweme, "getAigcLabelType"),
                readField(aweme, "aigcLabelType")
        )) {
            return true;
        }

        Object info = firstNonNull(
                invoke(aweme, "getAigcInfo"),
                readField(aweme, "aigcInfo"),
                readField(aweme, "mAigcInfo")
        );
        if (info == null) return false;

        if (anyTruthy(
                invoke(info, "isCreatedByAi"),
                invoke(info, "getCreatedByAi"),
                invoke(info, "isAigc"),
                invoke(info, "getIsAigc"),
                readField(info, "createdByAi"),
                readField(info, "isCreatedByAi"),
                readField(info, "isAigc")
        )) {
            return true;
        }

        return anyPositiveNumber(
                invoke(info, "getAigcLabelType"),
                invoke(info, "getLabelType"),
                readField(info, "aigcLabelType"),
                readField(info, "labelType")
        );
    }

    private static boolean anyTruthy(Object... values) {
        for (Object value : values) {
            if (value instanceof Boolean && (Boolean) value) return true;
            if (value instanceof Number && ((Number) value).longValue() > 0L) return true;
            if (value instanceof String) {
                String text = ((String) value).trim();
                if ("true".equalsIgnoreCase(text) || "1".equals(text)) return true;
            }
        }
        return false;
    }

    private static boolean anyPositiveNumber(Object... values) {
        for (Object value : values) {
            if (value instanceof Number && ((Number) value).longValue() > 0L) return true;
            if (value instanceof String) {
                try {
                    if (Long.parseLong(((String) value).trim()) > 0L) return true;
                } catch (NumberFormatException ignored) {
                }
            }
        }
        return false;
    }

    /**
     * Returns TikTok's view-to-like ratio as views per one like.
     * Example: 100,000 views / 4,000 likes = 25 views/like.
     * A smaller value therefore represents stronger engagement.
     */
    private static double viewsPerLike(Aweme aweme) {
        if (aweme == null) return -1.0d;
        try {
            AwemeStatistics statistics = aweme.getStatistics();
            if (statistics == null) return -1.0d;
            long views = statistics.getPlayCount();
            long likes = statistics.getDiggCount();
            if (views <= 0L || likes < 0L) return -1.0d;
            if (likes == 0L) return Double.POSITIVE_INFINITY;
            return views / (double) likes;
        } catch (Throwable ignored) {
            return -1.0d;
        }
    }

    private static double viewsPerLikeDistanceToMaximum(Aweme aweme, int maximum) {
        if (maximum <= 0) return Double.POSITIVE_INFINITY;
        double ratio = viewsPerLike(aweme);
        if (ratio < 0.0d) return Double.POSITIVE_INFINITY;
        // A zero-like video is the weakest possible ratio, but it can still be used as
        // the last-resort anti-empty-page bridge if no finite candidate exists.
        if (Double.isInfinite(ratio)) return Double.MAX_VALUE;
        return Math.max(0.0d, ratio - maximum);
    }

    private static String keywordCorpus(Aweme aweme) {
        StringBuilder builder = new StringBuilder();
        append(builder, invokeString(aweme, "getDesc"));
        append(builder, invokeString(aweme, "getContentDesc"));
        append(builder, readStringField(aweme, "desc"));
        append(builder, readStringField(aweme, "description"));

        Object extras = firstNonNull(invoke(aweme, "getTextExtra"), readField(aweme, "textExtra"));
        if (extras instanceof Iterable<?>) {
            int count = 0;
            for (Object extra : (Iterable<?>) extras) {
                if (count++ >= 64) break;
                append(builder, invokeString(extra, "getHashtagName"));
                append(builder, invokeString(extra, "getHashTagName"));
                append(builder, invokeString(extra, "getChallengeName"));
                append(builder, readStringField(extra, "hashtagName"));
                append(builder, readStringField(extra, "hashTagName"));
            }
        }
        return builder.toString().toLowerCase(Locale.US);
    }

    private static String creatorCorpus(Aweme aweme) {
        Object author = firstNonNull(invoke(aweme, "getAuthor"), readField(aweme, "author"));
        if (author == null) return "";
        StringBuilder builder = new StringBuilder();
        append(builder, invokeString(author, "getUniqueId"));
        append(builder, invokeString(author, "getUid"));
        append(builder, invokeString(author, "getSecUid"));
        append(builder, readStringField(author, "uniqueId"));
        append(builder, readStringField(author, "uid"));
        append(builder, readStringField(author, "secUid"));
        return normalizeIdentityCorpus(builder.toString());
    }

    private static String soundCorpus(Aweme aweme) {
        Object music = firstNonNull(invoke(aweme, "getMusic"), readField(aweme, "music"));
        if (music == null) return "";
        StringBuilder builder = new StringBuilder();
        append(builder, invokeString(music, "getIdStr"));
        append(builder, invokeString(music, "getMid"));
        append(builder, invokeString(music, "getTitle"));
        append(builder, invokeString(music, "getAuthorName"));
        append(builder, invokeString(music, "getOwnerHandle"));
        append(builder, readStringField(music, "idStr"));
        append(builder, readStringField(music, "mid"));
        append(builder, readStringField(music, "title"));
        append(builder, readStringField(music, "authorName"));
        return builder.toString().toLowerCase(Locale.US);
    }

    /**
     * Returns the exact TikTok video duration in milliseconds.
     *
     * TikTok 46.4.3 stores the JSON `duration` value in Video.videoLength (int, ms).
     * pilotLength is the exact 46.4.3 `real_duration` companion. A zero-valued
     * videoLength must not mask a positive pilotLength: Java reflection returns the
     * primitive field as a non-null boxed zero, so firstNonNull(videoLength,
     * pilotLength) incorrectly skipped the real secondary value on dev.9.
     */
    private static long durationMilliseconds(Aweme aweme) {
        Object video = firstNonNull(invoke(aweme, "getVideo"), readField(aweme, "video"));
        if (video != null) {
            long videoLength = positiveLong(readField(video, "videoLength"));
            if (videoLength > 0L) return videoLength;

            long pilotLength = positiveLong(readField(video, "pilotLength"));
            if (pilotLength > 0L) return pilotLength;

            long fallbackMs = normalizedDuration(invoke(video, "getDuration"));
            if (fallbackMs >= 0L) return fallbackMs;

            fallbackMs = normalizedDuration(readField(video, "duration"));
            if (fallbackMs >= 0L) return fallbackMs;
        }

        long awemeFallbackMs = normalizedDuration(invoke(aweme, "getDuration"));
        if (awemeFallbackMs >= 0L) return awemeFallbackMs;
        return normalizedDuration(readField(aweme, "duration"));
    }

    private static long positiveLong(Object value) {
        if (!(value instanceof Number)) return -1L;
        long number = ((Number) value).longValue();
        return number > 0L ? number : -1L;
    }

    private static long normalizedDuration(Object value) {
        return normalizeDurationToMilliseconds(value);
    }

    private static long normalizeDurationToMilliseconds(Object value) {
        if (!(value instanceof Number)) return -1L;
        long raw = ((Number) value).longValue();
        if (raw < 0L) return -1L;
        // Legacy wrappers sometimes expose seconds. Values above ten minutes are safely
        // interpreted as milliseconds; smaller fallback values are treated as seconds.
        return raw > 600L ? raw : raw * 1000L;
    }

    private static long secondsToMilliseconds(long seconds) {
        if (seconds <= 0L) return 0L;
        if (seconds >= Long.MAX_VALUE / 1000L) return Long.MAX_VALUE;
        return seconds * 1000L;
    }

    private static long durationDistanceToRange(long durationMs, Range range) {
        if (durationMs < 0L || range == null || range.isUnbounded()) return Long.MAX_VALUE;
        long minMs = secondsToMilliseconds(range.min);
        long maxMs = range.max == Long.MAX_VALUE
                ? Long.MAX_VALUE
                : secondsToMilliseconds(range.max);
        if (durationMs < minMs) return minMs - durationMs;
        if (durationMs > maxMs && maxMs != Long.MAX_VALUE) return durationMs - maxMs;
        return 0L;
    }

    private static boolean containsAny(String corpus, String[] needles) {
        if (corpus == null || corpus.isEmpty()) return false;
        for (String needle : needles) {
            if (!needle.isEmpty() && corpus.contains(needle)) return true;
        }
        return false;
    }

    private static boolean matchesIdentity(String corpus, String[] identities) {
        if (corpus == null || corpus.isEmpty()) return false;
        String padded = " " + corpus + " ";
        for (String identity : identities) {
            String normalized = normalizeIdentity(identity);
            if (!normalized.isEmpty() && padded.contains(" " + normalized + " ")) return true;
        }
        return false;
    }

    private static String normalizeIdentityCorpus(String value) {
        if (value == null) return "";
        String[] pieces = value.toLowerCase(Locale.US).split("\\s+");
        StringBuilder result = new StringBuilder();
        for (String piece : pieces) {
            String normalized = normalizeIdentity(piece);
            if (normalized.isEmpty()) continue;
            if (result.length() > 0) result.append(' ');
            result.append(normalized);
        }
        return result.toString();
    }

    private static String normalizeIdentity(String value) {
        if (value == null) return "";
        String normalized = value.trim().toLowerCase(Locale.US);
        while (normalized.startsWith("@")) normalized = normalized.substring(1);
        return normalized;
    }

    private static String[] terms(String source, TermKind kind) {
        String normalizedSource = source == null ? "" : source;
        switch (kind) {
            case KEYWORD:
                if (!normalizedSource.equals(cachedKeywordsSource)) {
                    cachedKeywords = parseTerms(normalizedSource, false);
                    cachedKeywordsSource = normalizedSource;
                }
                return cachedKeywords;
            case CREATOR:
                if (!normalizedSource.equals(cachedCreatorsSource)) {
                    cachedCreators = parseTerms(normalizedSource, true);
                    cachedCreatorsSource = normalizedSource;
                }
                return cachedCreators;
            case SOUND:
            default:
                if (!normalizedSource.equals(cachedSoundsSource)) {
                    cachedSounds = parseTerms(normalizedSource, false);
                    cachedSoundsSource = normalizedSource;
                }
                return cachedSounds;
        }
    }

    private static String[] parseTerms(String source, boolean identity) {
        if (source == null || source.trim().isEmpty()) return new String[0];
        String[] raw = source.split("[,;\\n\\r]+");
        ArrayList<String> result = new ArrayList<>();
        for (String item : raw) {
            String term = identity ? normalizeIdentity(item) : item.trim().toLowerCase(Locale.US);
            if (!term.isEmpty() && !result.contains(term)) result.add(term);
        }
        return result.toArray(new String[0]);
    }

    private static Range durationRange() {
        String source = AdvancedFeedSettings.DURATION_SECONDS.get();
        if (source == null) source = "";
        if (source.equals(cachedDurationSource)) return cachedDuration;
        cachedDuration = parseRange(source);
        cachedDurationSource = source;
        return cachedDuration;
    }

    private static Range parseRange(String source) {
        if (source == null || source.trim().isEmpty()) return new Range(0L, Long.MAX_VALUE);
        String[] pieces = source.trim().split("-", 2);
        try {
            long min = pieces[0].trim().isEmpty() ? 0L : Math.max(0L, Long.parseLong(pieces[0].trim()));
            long max = pieces.length < 2 || pieces[1].trim().isEmpty()
                    ? Long.MAX_VALUE
                    : Math.max(0L, Long.parseLong(pieces[1].trim()));
            return min <= max ? new Range(min, max) : new Range(max, min);
        } catch (NumberFormatException ignored) {
            return new Range(0L, Long.MAX_VALUE);
        }
    }

    private static String safeAid(Aweme aweme) {
        if (aweme == null) return "null";
        try { return aweme.getAid(); } catch (Throwable ignored) { return "unknown"; }
    }

    private static Object invoke(Object target, String methodName) {
        if (target == null) return null;
        try {
            Method method = target.getClass().getMethod(methodName);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String invokeString(Object target, String methodName) {
        Object value = invoke(target, methodName);
        return value instanceof String ? (String) value : null;
    }

    private static Object readField(Object target, String fieldName) {
        if (target == null) return null;
        for (Class<?> type = target.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(fieldName);
                field.setAccessible(true);
                return field.get(target);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static String readStringField(Object target, String fieldName) {
        Object value = readField(target, fieldName);
        return value instanceof String ? (String) value : null;
    }

    private static Object firstNonNull(Object... values) {
        for (Object value : values) if (value != null) return value;
        return null;
    }

    private static void append(StringBuilder builder, String value) {
        if (value == null || value.trim().isEmpty()) return;
        if (builder.length() > 0) builder.append(' ');
        builder.append(value.trim());
    }

    private enum TermKind { KEYWORD, CREATOR, SOUND }

    private static final class Range {
        final long min;
        final long max;
        Range(long min, long max) { this.min = min; this.max = max; }
        boolean isUnbounded() { return min == 0L && max == Long.MAX_VALUE; }
    }

    @FunctionalInterface
    private interface AwemeExtractor {
        Aweme extract(Object source);
    }
}
