/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * Which music video belongs to which downloaded song, from the queue the server lists for the same playlist or
 * album. The queue names the music video where there is one and the song otherwise, and (asked the way the
 * downloader can) usually carries no counterpart information, so the pairing is by position among the tracks that
 * were downloaded (an unavailable, greyed-out row is in the recorded list but not in the queue). The list is accepted
 * only when the queue has exactly as many items as there are downloaded tracks; then every item is judged on its
 * own: an item that names the track and a video as a pair (a counterpart) is that pair; an item that has another id
 * than its track is that track's music video when it has the same title or about the same length, else it is left
 * unpaired and the rest of the list is still paired. A music video is often another cut of the song (3:28 against
 * 3:53 on a real album), so the length only has to be in the same range. Contains no Android code.
 */
final class VideoPairingLogic {
    /** A video's length may differ from its song's by this much, or by {@link #LENGTH_FRACTION} of it, if more. */
    static final long LENGTH_TOLERANCE_SECONDS = 45;
    static final double LENGTH_FRACTION = 0.15;

    static final String BY_SAME = "same";
    static final String BY_COUNTERPART = "counterpart";
    static final String BY_TITLE = "title";
    static final String BY_LENGTH = "length";
    static final String BY_NONE = "none";

    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{11}");
    private static final Pattern DIGITS = Pattern.compile("[0-9]{1,4}");
    private static final Pattern MARKS = Pattern.compile("\\p{M}+");
    private static final Pattern GROUPS = Pattern.compile("\\([^)]*\\)|\\[[^\\]]*]");
    private static final Pattern FEATURING = Pattern.compile("\\b(?:feat|ft|featuring)\\b.*$");
    private static final Pattern VIDEO_SUFFIX = Pattern.compile(
            "\\s[-\u2013|]\\s*(?:official\\s+)?(?:music\\s+)?(?:video|audio|lyrics?(?:\\s+video)?)$");
    private static final Pattern NOT_ALPHANUMERIC = Pattern.compile("[^\\p{L}\\p{N}]+");

    private VideoPairingLogic() {}

    /** A downloaded song; {@code durationSeconds} is 0 when its length is not known, title and artist may be empty. */
    record Song(String videoId, long durationSeconds, String title, String artist) {}

    /** The music video {@code videoId} that belongs to the song {@code songId}. */
    record Pair(String songId, String videoId) {}

    /**
     * What was decided for one position. {@code by} is {@link #BY_SAME} (the queue lists the song itself, no video),
     * {@link #BY_COUNTERPART} (the item names the song and a video as a pair), {@link #BY_TITLE}, {@link #BY_LENGTH}
     * or {@link #BY_NONE}, with {@code reason} saying why.
     */
    record Decision(int index, String songId, String videoId, long songSeconds, long videoSeconds, String by,
                    @Nullable String reason) {
        boolean paired() {
            return BY_COUNTERPART.equals(by) || BY_TITLE.equals(by) || BY_LENGTH.equals(by);
        }

        boolean differs() {
            return !BY_SAME.equals(by);
        }
    }

    /**
     * @param pairs       The accepted pairs, in the order of the songs. Empty when the list was skipped.
     * @param skipReason  Why nothing was paired for the whole list, or null.
     * @param decisions   One per position; empty when the list was skipped.
     */
    record Result(List<Pair> pairs, @Nullable String skipReason, List<Decision> decisions) {
        static Result skipped(String reason) {
            return new Result(List.of(), reason, List.of());
        }

        /** Whether the queue names any id but the tracks' own: otherwise it has no video to offer. */
        boolean hasOtherIds() {
            for (Decision decision : decisions) if (decision.differs()) return true;
            return false;
        }
    }

    static Result pair(List<Song> songs, List<WatchQueueLogic.NextItem> queue) {
        if (queue.size() != songs.size()) {
            return Result.skipped("the queue has " + queue.size() + " items for " + songs.size() + " tracks");
        }

        List<Pair> pairs = new ArrayList<>();
        List<Decision> decisions = new ArrayList<>();
        for (int index = 0; index < songs.size(); index++) {
            Decision decision = decide(index, songs.get(index), queue.get(index));
            decisions.add(decision);
            if (decision.paired()) pairs.add(new Pair(decision.songId(), decision.videoId()));
        }
        return new Result(pairs, null, decisions);
    }

    private static Decision decide(int index, Song song, WatchQueueLogic.NextItem item) {
        String queued = item.videoId();
        long videoSeconds = lengthSeconds(item.length());
        if (!isVideoId(queued)) return decision(index, song, queued, videoSeconds, BY_NONE, "no video id");

        if (item.hasCounterpart() && isVideoId(item.counterpartId())) {
            if (queued.equals(song.videoId()) && !item.counterpartId().equals(queued)) {
                return decision(index, song, item.counterpartId(), lengthSeconds(item.counterpartLength()),
                        BY_COUNTERPART, null);
            }
            if (item.counterpartId().equals(song.videoId()) && !queued.equals(song.videoId())) {
                return decision(index, song, queued, videoSeconds, BY_COUNTERPART, null);
            }
        }
        if (queued.equals(song.videoId())) return decision(index, song, queued, videoSeconds, BY_SAME, null);

        if (sameTitle(song.title(), item.title())) {
            return decision(index, song, queued, videoSeconds, BY_TITLE, null);
        }
        if (videoSeconds < 0 || song.durationSeconds() <= 0) {
            return decision(index, song, queued, videoSeconds, BY_NONE, "title differs and a length is unknown");
        }
        if (!similarLength(song.durationSeconds(), videoSeconds)) {
            return decision(index, song, queued, videoSeconds, BY_NONE,
                    "title differs and " + videoSeconds + " s is far from " + song.durationSeconds() + " s");
        }
        return decision(index, song, queued, videoSeconds, BY_LENGTH, null);
    }

    private static Decision decision(int index, Song song, String queued, long videoSeconds, String by,
                                     @Nullable String reason) {
        return new Decision(index, song.videoId(), queued, song.durationSeconds(), videoSeconds, by, reason);
    }

    static boolean similarLength(long songSeconds, long videoSeconds) {
        long tolerance = Math.max(LENGTH_TOLERANCE_SECONDS, Math.round(songSeconds * LENGTH_FRACTION));
        return Math.abs(videoSeconds - songSeconds) <= tolerance;
    }

    static boolean sameTitle(String songTitle, String videoTitle) {
        String song = normalizeTitle(songTitle);
        return !song.isEmpty() && song.equals(normalizeTitle(videoTitle));
    }

    /**
     * A title reduced to what names the work: lowercase, without accents, without parenthesised or bracketed parts
     * ({@code (Official Video)}, {@code [Remastered]}), without {@code feat.} and what follows it, without a trailing
     * {@code - Official Video}, and only letters and digits separated by single spaces.
     */
    static String normalizeTitle(@Nullable String title) {
        if (title == null) return "";

        String text = MARKS.matcher(Normalizer.normalize(title, Normalizer.Form.NFD)).replaceAll("")
                .toLowerCase(Locale.ROOT);
        text = GROUPS.matcher(text).replaceAll(" ");
        text = VIDEO_SUFFIX.matcher(text.trim()).replaceAll("");
        text = FEATURING.matcher(text).replaceAll(" ");
        return NOT_ALPHANUMERIC.matcher(text).replaceAll(" ").trim();
    }

    static boolean isVideoId(String id) {
        return id != null && VIDEO_ID.matcher(id).matches();
    }

    /** The seconds of a length text ({@code m:ss} or {@code h:mm:ss}), or -1 when it is not one. */
    static long lengthSeconds(@Nullable String text) {
        if (text == null) return -1;

        String[] parts = text.trim().split(":", -1);
        if (parts.length < 2 || parts.length > 3) return -1;

        long seconds = 0;
        for (String part : parts) {
            if (!DIGITS.matcher(part).matches()) return -1;

            seconds = seconds * 60 + Long.parseLong(part);
        }
        return seconds;
    }
}
