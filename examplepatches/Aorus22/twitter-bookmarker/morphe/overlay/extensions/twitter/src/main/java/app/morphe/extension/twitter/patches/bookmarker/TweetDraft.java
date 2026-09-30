/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 *
 * Part of the Twitter Bookmarker overlay: see morphe/README.md.
 */

package app.morphe.extension.twitter.patches.bookmarker;

import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.twitter.entity.Media;
import app.morphe.extension.twitter.entity.Tweet;

/**
 * Reads the fields the backend needs out of the app's own tweet object.
 *
 * <p>The names behind Piko's {@link Tweet} accessors are obfuscated and learned
 * at patch time, which is why this class calls the accessors instead of
 * reflecting on fields itself: the placeholder machinery already covers those
 * classes, and adding our own reflective names would mean adding fingerprints.
 */
public final class TweetDraft {

    /**
     * X's IDs are snowflakes: the top 41 bits are milliseconds since 2010-11-04
     * 01:42:54.657 UTC, followed by 5 datacenter, 5 worker and 12 sequence bits.
     *
     * <p>This is the tweet's own timestamp, so the date is exact and costs
     * nothing: no extra request, and it works offline. The alternative was
     * asking fxtwitter, which would fail exactly when a phone is offline.
     */
    private static final long SNOWFLAKE_EPOCH_MS = 1288834974657L;
    private static final int SNOWFLAKE_ID_SHIFT = 22;

    /**
     * Below this the timestamp part of the ID is not meaningful: IDs from before
     * the snowflake switch are sequential and small (the last of them around
     * 1.3e8), while the first snowflake IDs were already past 6e10. A date
     * computed from a sequential ID would silently claim 2010-11-04, so those
     * tweets are refused rather than dated wrongly.
     */
    private static final long MIN_SNOWFLAKE_ID = (1L << SNOWFLAKE_ID_SHIFT) * 1000L;

    /** The earliest date any computed date may carry: Twitter's first tweet. */
    private static final Instant EARLIEST = Instant.parse("2006-03-21T00:00:00Z");

    private TweetDraft() {}

    /**
     * The tweet as the backend takes it. {@code tweetDate} is null when the ID
     * cannot be dated; {@link #missingField} names what is missing.
     */
    public static BookmarkerApi.Draft from(Object rawTweet) throws Exception {
        Tweet tweet = new Tweet(rawTweet);
        Long statusId = tweet.getTweetId();

        return new BookmarkerApi.Draft(
                trim(tweet.getTweetLink()),
                trim(tweet.getTweetProfileName()),
                atHandle(tweet.getTweetUsername()),
                tweetDate(statusId),
                orEmpty(tweet.getText()),
                mediaUrls(tweet));
    }

    /**
     * The first required field the app could not provide, or null when the draft
     * is complete. Each name is phrased to finish "… is not available for this
     * tweet", mirroring the extension's typed failures rather than sending a
     * request the backend will reject with a 400.
     */
    public static String missingField(BookmarkerApi.Draft draft) {
        if (isBlank(draft.url)) return "the tweet link";
        if (isBlank(draft.author)) return "the author name";
        if (isBlank(draft.username)) return "the author handle";
        if (isBlank(draft.tweetDate)) return "the date this tweet was posted";
        return null;
    }

    /**
     * RFC3339 UTC, as the backend requires — {@code Instant.toString()} is that
     * format, with fractional seconds only when there are any.
     */
    static String tweetDate(Long statusId) {
        if (statusId == null || statusId < MIN_SNOWFLAKE_ID) {
            Logger.printInfo(() -> "twb: no date available for status " + statusId);
            return null;
        }

        Instant posted = Instant.ofEpochMilli((statusId >> SNOWFLAKE_ID_SHIFT) + SNOWFLAKE_EPOCH_MS);
        if (posted.isBefore(EARLIEST) || posted.isAfter(Instant.now().plus(Duration.ofDays(1)))) {
            Logger.printInfo(() -> "twb: implausible date " + posted + " for status " + statusId);
            return null;
        }
        return posted.toString();
    }

    /**
     * Canonical media URLs, in the order the app reports them. An empty list is
     * normal: a text-only tweet has none, and the backend stores that as no
     * media rather than as an error.
     */
    static List<String> mediaUrls(Tweet tweet) throws Exception {
        List<String> urls = new ArrayList<>();
        for (ArrayList<Media> group : tweet.getMediaList()) {
            if (group == null) continue;
            for (Media media : group) {
                if (media != null && !isBlank(media.url)) urls.add(media.url);
            }
        }
        return urls;
    }

    /** The wire format carries the handle with its leading "@", whatever the app returns. */
    static String atHandle(String raw) {
        String handle = orEmpty(raw);
        while (handle.startsWith("@")) {
            handle = handle.substring(1);
        }
        // Case is preserved: the handle is stored as the app reports it, so a
        // tweet saved from the phone and one saved from the browser agree.
        handle = handle.trim();
        return handle.isEmpty() ? "" : "@" + handle;
    }

    private static String trim(String value) {
        return value == null ? "" : value.trim();
    }

    private static String orEmpty(String value) {
        return value == null ? "" : value;
    }

    private static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
